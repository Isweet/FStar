
let print_error = (fun msg r -> (let _114_6 = (let _114_5 = (FStar_Range.string_of_range r)
in (FStar_Util.format2 "ERROR %s: %s\n" _114_5 msg))
in (FStar_Util.print_string _114_6)))

let is_cache_file = (fun fn -> ((FStar_Util.get_file_extension fn) = ".cache"))

let parse_fragment = (fun curmod env frag -> (match ((FStar_Parser_ParseIt.parse (FStar_Util.Inr (frag)))) with
| FStar_Util.Inl (FStar_Util.Inl (modul::[])) -> begin
(let _48_13 = (FStar_Parser_Desugar.desugar_partial_modul curmod env modul)
in (match (_48_13) with
| (env, modul) -> begin
FStar_Util.Inl ((env, modul))
end))
end
| FStar_Util.Inl (FStar_Util.Inr (decls)) -> begin
(let _114_13 = (FStar_Parser_Desugar.desugar_decls env decls)
in (FStar_All.pipe_left (fun _114_12 -> FStar_Util.Inr (_114_12)) _114_13))
end
| FStar_Util.Inl (FStar_Util.Inl (_48_18)) -> begin
(Prims.raise (FStar_Absyn_Syntax.Err ("Refusing to check more than one module at a time incrementally")))
end
| FStar_Util.Inr (msg, r) -> begin
(Prims.raise (FStar_Absyn_Syntax.Error ((msg, r))))
end))

let parse_file = (fun env fn -> (match ((is_cache_file fn)) with
| true -> begin
(let full_name = (let _114_21 = (let _114_20 = (let _114_19 = (let _114_18 = (FStar_Options.get_fstar_home ())
in (Prims.strcat _114_18 "/"))
in (Prims.strcat _114_19 FStar_Options.cache_dir))
in (Prims.strcat _114_20 "/"))
in (Prims.strcat _114_21 fn))
in (let m = (let _114_22 = (FStar_Util.get_oreader full_name)
in (FStar_Absyn_SSyntax.deserialize_modul _114_22))
in (let _114_23 = (FStar_Parser_Desugar.add_modul_to_env m env)
in (_114_23, (m)::[]))))
end
| false -> begin
(match ((FStar_Parser_ParseIt.parse (FStar_Util.Inl (fn)))) with
| FStar_Util.Inl (FStar_Util.Inl (ast)) -> begin
(FStar_Parser_Desugar.desugar_file env ast)
end
| FStar_Util.Inl (FStar_Util.Inr (_48_33)) -> begin
(let _48_36 = (FStar_Util.fprint1 "%s: Expected a module\n" fn)
in (FStar_All.exit 1))
end
| FStar_Util.Inr (msg, r) -> begin
(let _48_42 = (let _114_24 = (FStar_Absyn_Print.format_error r msg)
in (FStar_All.pipe_left FStar_Util.print_string _114_24))
in (FStar_All.exit 1))
end)
end))

let read_build_config = (fun file -> (FStar_Parser_ParseIt.read_build_config file))




