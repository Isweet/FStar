
type sort =
| Bool_sort
| Int_sort
| Kind_sort
| Type_sort
| Term_sort
| String_sort
| Ref_sort
| Fuel_sort
| Array of (sort * sort)
| Arrow of (sort * sort)
| Sort of Prims.string

let is_Bool_sort = (fun _discr_ -> (match (_discr_) with
| Bool_sort -> begin
true
end
| _ -> begin
false
end))

let is_Int_sort = (fun _discr_ -> (match (_discr_) with
| Int_sort -> begin
true
end
| _ -> begin
false
end))

let is_Kind_sort = (fun _discr_ -> (match (_discr_) with
| Kind_sort -> begin
true
end
| _ -> begin
false
end))

let is_Type_sort = (fun _discr_ -> (match (_discr_) with
| Type_sort -> begin
true
end
| _ -> begin
false
end))

let is_Term_sort = (fun _discr_ -> (match (_discr_) with
| Term_sort -> begin
true
end
| _ -> begin
false
end))

let is_String_sort = (fun _discr_ -> (match (_discr_) with
| String_sort -> begin
true
end
| _ -> begin
false
end))

let is_Ref_sort = (fun _discr_ -> (match (_discr_) with
| Ref_sort -> begin
true
end
| _ -> begin
false
end))

let is_Fuel_sort = (fun _discr_ -> (match (_discr_) with
| Fuel_sort -> begin
true
end
| _ -> begin
false
end))

let is_Array = (fun _discr_ -> (match (_discr_) with
| Array (_) -> begin
true
end
| _ -> begin
false
end))

let is_Arrow = (fun _discr_ -> (match (_discr_) with
| Arrow (_) -> begin
true
end
| _ -> begin
false
end))

let is_Sort = (fun _discr_ -> (match (_discr_) with
| Sort (_) -> begin
true
end
| _ -> begin
false
end))

let ___Array____0 = (fun projectee -> (match (projectee) with
| Array (_50_10) -> begin
_50_10
end))

let ___Arrow____0 = (fun projectee -> (match (projectee) with
| Arrow (_50_13) -> begin
_50_13
end))

let ___Sort____0 = (fun projectee -> (match (projectee) with
| Sort (_50_16) -> begin
_50_16
end))

let rec strSort = (fun x -> (match (x) with
| Bool_sort -> begin
"Bool"
end
| Int_sort -> begin
"Int"
end
| Kind_sort -> begin
"Kind"
end
| Type_sort -> begin
"Type"
end
| Term_sort -> begin
"Term"
end
| String_sort -> begin
"String"
end
| Ref_sort -> begin
"Ref"
end
| Fuel_sort -> begin
"Fuel"
end
| Array (s1, s2) -> begin
(let _116_54 = (strSort s1)
in (let _116_53 = (strSort s2)
in (FStar_Util.format2 "(Array %s %s)" _116_54 _116_53)))
end
| Arrow (s1, s2) -> begin
(let _116_56 = (strSort s1)
in (let _116_55 = (strSort s2)
in (FStar_Util.format2 "(%s -> %s)" _116_56 _116_55)))
end
| Sort (s) -> begin
s
end))

type op =
| True
| False
| Not
| And
| Or
| Imp
| Iff
| Eq
| LT
| LTE
| GT
| GTE
| Add
| Sub
| Div
| Mul
| Minus
| Mod
| ITE
| Var of Prims.string

let is_True = (fun _discr_ -> (match (_discr_) with
| True -> begin
true
end
| _ -> begin
false
end))

let is_False = (fun _discr_ -> (match (_discr_) with
| False -> begin
true
end
| _ -> begin
false
end))

let is_Not = (fun _discr_ -> (match (_discr_) with
| Not -> begin
true
end
| _ -> begin
false
end))

let is_And = (fun _discr_ -> (match (_discr_) with
| And -> begin
true
end
| _ -> begin
false
end))

let is_Or = (fun _discr_ -> (match (_discr_) with
| Or -> begin
true
end
| _ -> begin
false
end))

let is_Imp = (fun _discr_ -> (match (_discr_) with
| Imp -> begin
true
end
| _ -> begin
false
end))

let is_Iff = (fun _discr_ -> (match (_discr_) with
| Iff -> begin
true
end
| _ -> begin
false
end))

let is_Eq = (fun _discr_ -> (match (_discr_) with
| Eq -> begin
true
end
| _ -> begin
false
end))

let is_LT = (fun _discr_ -> (match (_discr_) with
| LT -> begin
true
end
| _ -> begin
false
end))

let is_LTE = (fun _discr_ -> (match (_discr_) with
| LTE -> begin
true
end
| _ -> begin
false
end))

let is_GT = (fun _discr_ -> (match (_discr_) with
| GT -> begin
true
end
| _ -> begin
false
end))

let is_GTE = (fun _discr_ -> (match (_discr_) with
| GTE -> begin
true
end
| _ -> begin
false
end))

let is_Add = (fun _discr_ -> (match (_discr_) with
| Add -> begin
true
end
| _ -> begin
false
end))

let is_Sub = (fun _discr_ -> (match (_discr_) with
| Sub -> begin
true
end
| _ -> begin
false
end))

let is_Div = (fun _discr_ -> (match (_discr_) with
| Div -> begin
true
end
| _ -> begin
false
end))

let is_Mul = (fun _discr_ -> (match (_discr_) with
| Mul -> begin
true
end
| _ -> begin
false
end))

let is_Minus = (fun _discr_ -> (match (_discr_) with
| Minus -> begin
true
end
| _ -> begin
false
end))

let is_Mod = (fun _discr_ -> (match (_discr_) with
| Mod -> begin
true
end
| _ -> begin
false
end))

let is_ITE = (fun _discr_ -> (match (_discr_) with
| ITE -> begin
true
end
| _ -> begin
false
end))

let is_Var = (fun _discr_ -> (match (_discr_) with
| Var (_) -> begin
true
end
| _ -> begin
false
end))

let ___Var____0 = (fun projectee -> (match (projectee) with
| Var (_50_38) -> begin
_50_38
end))

type qop =
| Forall
| Exists

let is_Forall = (fun _discr_ -> (match (_discr_) with
| Forall -> begin
true
end
| _ -> begin
false
end))

let is_Exists = (fun _discr_ -> (match (_discr_) with
| Exists -> begin
true
end
| _ -> begin
false
end))

type term' =
| Integer of Prims.string
| BoundV of Prims.int
| FreeV of fv
| App of (op * term Prims.list)
| Quant of (qop * pat Prims.list Prims.list * Prims.int Prims.option * sort Prims.list * term) 
 and term =
{tm : term'; hash : Prims.string; freevars : fvs FStar_Absyn_Syntax.memo} 
 and pat =
term 
 and fv =
(Prims.string * sort) 
 and fvs =
fv Prims.list

let is_Integer = (fun _discr_ -> (match (_discr_) with
| Integer (_) -> begin
true
end
| _ -> begin
false
end))

let is_BoundV = (fun _discr_ -> (match (_discr_) with
| BoundV (_) -> begin
true
end
| _ -> begin
false
end))

let is_FreeV = (fun _discr_ -> (match (_discr_) with
| FreeV (_) -> begin
true
end
| _ -> begin
false
end))

let is_App = (fun _discr_ -> (match (_discr_) with
| App (_) -> begin
true
end
| _ -> begin
false
end))

let is_Quant = (fun _discr_ -> (match (_discr_) with
| Quant (_) -> begin
true
end
| _ -> begin
false
end))

let is_Mkterm = (fun _ -> (FStar_All.failwith "Not yet implemented:is_Mkterm"))

let ___Integer____0 = (fun projectee -> (match (projectee) with
| Integer (_50_44) -> begin
_50_44
end))

let ___BoundV____0 = (fun projectee -> (match (projectee) with
| BoundV (_50_47) -> begin
_50_47
end))

let ___FreeV____0 = (fun projectee -> (match (projectee) with
| FreeV (_50_50) -> begin
_50_50
end))

let ___App____0 = (fun projectee -> (match (projectee) with
| App (_50_53) -> begin
_50_53
end))

let ___Quant____0 = (fun projectee -> (match (projectee) with
| Quant (_50_56) -> begin
_50_56
end))

let fv_eq = (fun x y -> ((Prims.fst x) = (Prims.fst y)))

let fv_sort = (fun x -> (Prims.snd x))

let freevar_eq = (fun x y -> (match ((x.tm, y.tm)) with
| (FreeV (x), FreeV (y)) -> begin
(fv_eq x y)
end
| _50_69 -> begin
false
end))

let freevar_sort = (fun _50_1 -> (match (_50_1) with
| {tm = FreeV (x); hash = _50_74; freevars = _50_72} -> begin
(fv_sort x)
end
| _50_79 -> begin
(FStar_All.failwith "impossible")
end))

let fv_of_term = (fun _50_2 -> (match (_50_2) with
| {tm = FreeV (fv); hash = _50_84; freevars = _50_82} -> begin
fv
end
| _50_89 -> begin
(FStar_All.failwith "impossible")
end))

let rec freevars = (fun t -> (match (t.tm) with
| (Integer (_)) | (BoundV (_)) -> begin
[]
end
| FreeV (fv) -> begin
(fv)::[]
end
| App (_50_100, tms) -> begin
(FStar_List.collect freevars tms)
end
| Quant (_50_105, _50_107, _50_109, _50_111, t) -> begin
(freevars t)
end))

let free_variables = (fun t -> (match ((FStar_ST.read t.freevars)) with
| Some (b) -> begin
b
end
| None -> begin
(let fvs = (let _116_189 = (freevars t)
in (FStar_Util.remove_dups fv_eq _116_189))
in (let _50_120 = (FStar_ST.op_Colon_Equals t.freevars (Some (fvs)))
in fvs))
end))

let qop_to_string = (fun _50_3 -> (match (_50_3) with
| Forall -> begin
"forall"
end
| Exists -> begin
"exists"
end))

let op_to_string = (fun _50_4 -> (match (_50_4) with
| True -> begin
"true"
end
| False -> begin
"false"
end
| Not -> begin
"not"
end
| And -> begin
"and"
end
| Or -> begin
"or"
end
| Imp -> begin
"implies"
end
| Iff -> begin
"iff"
end
| Eq -> begin
"="
end
| LT -> begin
"<"
end
| LTE -> begin
"<="
end
| GT -> begin
">"
end
| GTE -> begin
">="
end
| Add -> begin
"+"
end
| Sub -> begin
"-"
end
| Div -> begin
"div"
end
| Mul -> begin
"*"
end
| Minus -> begin
"-"
end
| Mod -> begin
"mod"
end
| ITE -> begin
"ite"
end
| Var (s) -> begin
s
end))

let weightToSmt = (fun _50_5 -> (match (_50_5) with
| None -> begin
""
end
| Some (i) -> begin
(let _116_196 = (FStar_Util.string_of_int i)
in (FStar_Util.format1 ":weight %s\n" _116_196))
end))

let rec hash_of_term' = (fun t -> (match (t) with
| Integer (i) -> begin
i
end
| BoundV (i) -> begin
(let _116_199 = (FStar_Util.string_of_int i)
in (Prims.strcat "@" _116_199))
end
| FreeV (x) -> begin
(let _116_200 = (strSort (Prims.snd x))
in (Prims.strcat (Prims.strcat (Prims.fst x) ":") _116_200))
end
| App (op, tms) -> begin
(let _116_204 = (let _116_203 = (let _116_202 = (FStar_List.map (fun t -> t.hash) tms)
in (FStar_All.pipe_right _116_202 (FStar_String.concat " ")))
in (Prims.strcat (Prims.strcat "(" (op_to_string op)) _116_203))
in (Prims.strcat _116_204 ")"))
end
| Quant (qop, pats, wopt, sorts, body) -> begin
(let _116_212 = (let _116_205 = (FStar_List.map strSort sorts)
in (FStar_All.pipe_right _116_205 (FStar_String.concat " ")))
in (let _116_211 = (weightToSmt wopt)
in (let _116_210 = (let _116_209 = (FStar_All.pipe_right pats (FStar_List.map (fun pats -> (let _116_208 = (FStar_List.map (fun p -> p.hash) pats)
in (FStar_All.pipe_right _116_208 (FStar_String.concat " "))))))
in (FStar_All.pipe_right _116_209 (FStar_String.concat "; ")))
in (FStar_Util.format5 "(%s (%s)(! %s %s %s))" (qop_to_string qop) _116_212 body.hash _116_211 _116_210))))
end))

let __all_terms = (let _116_213 = (FStar_Util.smap_create 10000)
in (FStar_ST.alloc _116_213))

let all_terms = (fun _50_172 -> (match (()) with
| () -> begin
(FStar_ST.read __all_terms)
end))

let mk = (fun t -> (let key = (hash_of_term' t)
in (match ((let _116_218 = (all_terms ())
in (FStar_Util.smap_try_find _116_218 key))) with
| Some (tm) -> begin
tm
end
| None -> begin
(let tm = (let _116_219 = (FStar_Util.mk_ref None)
in {tm = t; hash = key; freevars = _116_219})
in (let _50_179 = (let _116_220 = (all_terms ())
in (FStar_Util.smap_add _116_220 key tm))
in tm))
end)))

let mkTrue = (mk (App ((True, []))))

let mkFalse = (mk (App ((False, []))))

let mkInteger = (fun i -> (mk (Integer (i))))

let mkInteger32 = (fun i -> (mkInteger (FStar_Util.string_of_int32 i)))

let mkInteger' = (fun i -> (let _116_227 = (FStar_Util.string_of_int i)
in (mkInteger _116_227)))

let mkBoundV = (fun i -> (mk (BoundV (i))))

let mkFreeV = (fun x -> (mk (FreeV (x))))

let mkApp' = (fun f -> (mk (App (f))))

let mkApp = (fun _50_189 -> (match (_50_189) with
| (s, args) -> begin
(mk (App ((Var (s), args))))
end))

let mkNot = (fun t -> (match (t.tm) with
| App (True, _50_193) -> begin
mkFalse
end
| App (False, _50_198) -> begin
mkTrue
end
| _50_202 -> begin
(mkApp' (Not, (t)::[]))
end))

let mkAnd = (fun _50_205 -> (match (_50_205) with
| (t1, t2) -> begin
(match ((t1.tm, t2.tm)) with
| (App (True, _50_208), _50_212) -> begin
t2
end
| (_50_215, App (True, _50_218)) -> begin
t1
end
| ((App (False, _), _)) | ((_, App (False, _))) -> begin
mkFalse
end
| (App (And, ts1), App (And, ts2)) -> begin
(mkApp' (And, (FStar_List.append ts1 ts2)))
end
| (_50_248, App (And, ts2)) -> begin
(mkApp' (And, (t1)::ts2))
end
| (App (And, ts1), _50_259) -> begin
(mkApp' (And, (FStar_List.append ts1 ((t2)::[]))))
end
| _50_262 -> begin
(mkApp' (And, (t1)::(t2)::[]))
end)
end))

let mkOr = (fun _50_265 -> (match (_50_265) with
| (t1, t2) -> begin
(match ((t1.tm, t2.tm)) with
| ((App (True, _), _)) | ((_, App (True, _))) -> begin
mkTrue
end
| (App (False, _50_284), _50_288) -> begin
t2
end
| (_50_291, App (False, _50_294)) -> begin
t1
end
| (App (Or, ts1), App (Or, ts2)) -> begin
(mkApp' (Or, (FStar_List.append ts1 ts2)))
end
| (_50_308, App (Or, ts2)) -> begin
(mkApp' (Or, (t1)::ts2))
end
| (App (Or, ts1), _50_319) -> begin
(mkApp' (Or, (FStar_List.append ts1 ((t2)::[]))))
end
| _50_322 -> begin
(mkApp' (Or, (t1)::(t2)::[]))
end)
end))

let mkImp = (fun _50_325 -> (match (_50_325) with
| (t1, t2) -> begin
(match ((t1.tm, t2.tm)) with
| (_50_327, App (True, _50_330)) -> begin
mkTrue
end
| (App (True, _50_336), _50_340) -> begin
t2
end
| (_50_343, App (Imp, t1'::t2'::[])) -> begin
(let _116_246 = (let _116_245 = (let _116_244 = (mkAnd (t1, t1'))
in (_116_244)::(t2')::[])
in (Imp, _116_245))
in (mkApp' _116_246))
end
| _50_352 -> begin
(mkApp' (Imp, (t1)::(t2)::[]))
end)
end))

let mk_bin_op = (fun op _50_356 -> (match (_50_356) with
| (t1, t2) -> begin
(mkApp' (op, (t1)::(t2)::[]))
end))

let mkMinus = (fun t -> (mkApp' (Minus, (t)::[])))

let mkIff = (mk_bin_op Iff)

let mkEq = (mk_bin_op Eq)

let mkLT = (mk_bin_op LT)

let mkLTE = (mk_bin_op LTE)

let mkGT = (mk_bin_op GT)

let mkGTE = (mk_bin_op GTE)

let mkAdd = (mk_bin_op Add)

let mkSub = (mk_bin_op Sub)

let mkDiv = (mk_bin_op Div)

let mkMul = (mk_bin_op Mul)

let mkMod = (mk_bin_op Mod)

let mkITE = (fun _50_361 -> (match (_50_361) with
| (t1, t2, t3) -> begin
(match ((t2.tm, t3.tm)) with
| (App (True, _50_364), App (True, _50_369)) -> begin
mkTrue
end
| (App (True, _50_375), _50_379) -> begin
(let _116_267 = (let _116_266 = (mkNot t1)
in (_116_266, t3))
in (mkImp _116_267))
end
| (_50_382, App (True, _50_385)) -> begin
(mkImp (t1, t2))
end
| (_50_390, _50_392) -> begin
(mkApp' (ITE, (t1)::(t2)::(t3)::[]))
end)
end))

let mkCases = (fun t -> (match (t) with
| [] -> begin
(FStar_All.failwith "Impos")
end
| hd::tl -> begin
(FStar_List.fold_left (fun out t -> (mkAnd (out, t))) hd tl)
end))

let mkQuant = (fun _50_406 -> (match (_50_406) with
| (qop, pats, wopt, vars, body) -> begin
(match (((FStar_List.length vars) = 0)) with
| true -> begin
body
end
| false -> begin
(match (body.tm) with
| App (True, _50_409) -> begin
body
end
| _50_413 -> begin
(mk (Quant ((qop, pats, wopt, vars, body))))
end)
end)
end))

let abstr = (fun fvs t -> (let nvars = (FStar_List.length fvs)
in (let index_of = (fun fv -> (match ((FStar_Util.try_find_index (fv_eq fv) fvs)) with
| None -> begin
None
end
| Some (i) -> begin
Some ((nvars - (i + 1)))
end))
in (let rec aux = (fun ix t -> (match ((FStar_ST.read t.freevars)) with
| Some ([]) -> begin
t
end
| _50_428 -> begin
(match (t.tm) with
| (Integer (_)) | (BoundV (_)) -> begin
t
end
| FreeV (x) -> begin
(match ((index_of x)) with
| None -> begin
t
end
| Some (i) -> begin
(mkBoundV (i + ix))
end)
end
| App (op, tms) -> begin
(let _116_285 = (let _116_284 = (FStar_List.map (aux ix) tms)
in (op, _116_284))
in (mkApp' _116_285))
end
| Quant (qop, pats, wopt, vars, body) -> begin
(let n = (FStar_List.length vars)
in (let _116_288 = (let _116_287 = (FStar_All.pipe_right pats (FStar_List.map (FStar_List.map (aux (ix + n)))))
in (let _116_286 = (aux (ix + n) body)
in (qop, _116_287, wopt, vars, _116_286)))
in (mkQuant _116_288)))
end)
end))
in (aux 0 t)))))

let inst = (fun tms t -> (let n = (FStar_List.length tms)
in (let rec aux = (fun shift t -> (match (t.tm) with
| (Integer (_)) | (FreeV (_)) -> begin
t
end
| BoundV (i) -> begin
(match (((0 <= (i - shift)) && ((i - shift) < n))) with
| true -> begin
(FStar_List.nth tms (i - shift))
end
| false -> begin
t
end)
end
| App (op, tms) -> begin
(let _116_298 = (let _116_297 = (FStar_List.map (aux shift) tms)
in (op, _116_297))
in (mkApp' _116_298))
end
| Quant (qop, pats, wopt, vars, body) -> begin
(let m = (FStar_List.length vars)
in (let shift = (shift + m)
in (let _116_301 = (let _116_300 = (FStar_All.pipe_right pats (FStar_List.map (FStar_List.map (aux shift))))
in (let _116_299 = (aux shift body)
in (qop, _116_300, wopt, vars, _116_299)))
in (mkQuant _116_301))))
end))
in (aux 0 t))))

let mkQuant' = (fun _50_484 -> (match (_50_484) with
| (qop, pats, wopt, vars, body) -> begin
(let _116_307 = (let _116_306 = (FStar_All.pipe_right pats (FStar_List.map (FStar_List.map (abstr vars))))
in (let _116_305 = (FStar_List.map fv_sort vars)
in (let _116_304 = (abstr vars body)
in (qop, _116_306, wopt, _116_305, _116_304))))
in (mkQuant _116_307))
end))

let mkForall'' = (fun _50_489 -> (match (_50_489) with
| (pats, wopt, sorts, body) -> begin
(mkQuant (Forall, pats, wopt, sorts, body))
end))

let mkForall' = (fun _50_494 -> (match (_50_494) with
| (pats, wopt, vars, body) -> begin
(mkQuant' (Forall, pats, wopt, vars, body))
end))

let mkForall = (fun _50_498 -> (match (_50_498) with
| (pats, vars, body) -> begin
(mkQuant' (Forall, (pats)::[], None, vars, body))
end))

let mkExists = (fun _50_502 -> (match (_50_502) with
| (pats, vars, body) -> begin
(mkQuant' (Exists, (pats)::[], None, vars, body))
end))

type caption =
Prims.string Prims.option

type binders =
(Prims.string * sort) Prims.list

type projector =
(Prims.string * sort)

type constructor_t =
(Prims.string * projector Prims.list * sort * Prims.int)

type constructors =
constructor_t Prims.list

type decl =
| DefPrelude
| DeclFun of (Prims.string * sort Prims.list * sort * caption)
| DefineFun of (Prims.string * sort Prims.list * sort * term * caption)
| Assume of (term * caption)
| Caption of Prims.string
| Eval of term
| Echo of Prims.string
| Push
| Pop
| CheckSat

let is_DefPrelude = (fun _discr_ -> (match (_discr_) with
| DefPrelude -> begin
true
end
| _ -> begin
false
end))

let is_DeclFun = (fun _discr_ -> (match (_discr_) with
| DeclFun (_) -> begin
true
end
| _ -> begin
false
end))

let is_DefineFun = (fun _discr_ -> (match (_discr_) with
| DefineFun (_) -> begin
true
end
| _ -> begin
false
end))

let is_Assume = (fun _discr_ -> (match (_discr_) with
| Assume (_) -> begin
true
end
| _ -> begin
false
end))

let is_Caption = (fun _discr_ -> (match (_discr_) with
| Caption (_) -> begin
true
end
| _ -> begin
false
end))

let is_Eval = (fun _discr_ -> (match (_discr_) with
| Eval (_) -> begin
true
end
| _ -> begin
false
end))

let is_Echo = (fun _discr_ -> (match (_discr_) with
| Echo (_) -> begin
true
end
| _ -> begin
false
end))

let is_Push = (fun _discr_ -> (match (_discr_) with
| Push -> begin
true
end
| _ -> begin
false
end))

let is_Pop = (fun _discr_ -> (match (_discr_) with
| Pop -> begin
true
end
| _ -> begin
false
end))

let is_CheckSat = (fun _discr_ -> (match (_discr_) with
| CheckSat -> begin
true
end
| _ -> begin
false
end))

let ___DeclFun____0 = (fun projectee -> (match (projectee) with
| DeclFun (_50_505) -> begin
_50_505
end))

let ___DefineFun____0 = (fun projectee -> (match (projectee) with
| DefineFun (_50_508) -> begin
_50_508
end))

let ___Assume____0 = (fun projectee -> (match (projectee) with
| Assume (_50_511) -> begin
_50_511
end))

let ___Caption____0 = (fun projectee -> (match (projectee) with
| Caption (_50_514) -> begin
_50_514
end))

let ___Eval____0 = (fun projectee -> (match (projectee) with
| Eval (_50_517) -> begin
_50_517
end))

let ___Echo____0 = (fun projectee -> (match (projectee) with
| Echo (_50_520) -> begin
_50_520
end))

type decls_t =
decl Prims.list

let mkDefineFun = (fun _50_526 -> (match (_50_526) with
| (nm, vars, s, tm, c) -> begin
(let _116_408 = (let _116_407 = (FStar_List.map fv_sort vars)
in (let _116_406 = (abstr vars tm)
in (nm, _116_407, s, _116_406, c)))
in DefineFun (_116_408))
end))

let constr_id_of_sort = (fun sort -> (let _116_411 = (strSort sort)
in (FStar_Util.format1 "%s_constr_id" _116_411)))

let fresh_token = (fun _50_530 id -> (match (_50_530) with
| (tok_name, sort) -> begin
(let _116_424 = (let _116_423 = (let _116_422 = (let _116_421 = (mkInteger' id)
in (let _116_420 = (let _116_419 = (let _116_418 = (constr_id_of_sort sort)
in (let _116_417 = (let _116_416 = (mkApp (tok_name, []))
in (_116_416)::[])
in (_116_418, _116_417)))
in (mkApp _116_419))
in (_116_421, _116_420)))
in (mkEq _116_422))
in (_116_423, Some ("fresh token")))
in Assume (_116_424))
end))

let constructor_to_decl = (fun _50_536 -> (match (_50_536) with
| (name, projectors, sort, id) -> begin
(let id = (FStar_Util.string_of_int id)
in (let cdecl = (let _116_428 = (let _116_427 = (FStar_All.pipe_right projectors (FStar_List.map Prims.snd))
in (name, _116_427, sort, Some ("Constructor")))
in DeclFun (_116_428))
in (let n_bvars = (FStar_List.length projectors)
in (let bvar_name = (fun i -> (let _116_431 = (FStar_Util.string_of_int i)
in (Prims.strcat "x_" _116_431)))
in (let bvar_index = (fun i -> (n_bvars - (i + 1)))
in (let bvar = (fun i s -> (let _116_439 = (let _116_438 = (bvar_name i)
in (_116_438, s))
in (mkFreeV _116_439)))
in (let bvars = (FStar_All.pipe_right projectors (FStar_List.mapi (fun i _50_551 -> (match (_50_551) with
| (_50_549, s) -> begin
(bvar i s)
end))))
in (let bvar_names = (FStar_List.map fv_of_term bvars)
in (let capp = (mkApp (name, bvars))
in (let cid_app = (let _116_443 = (let _116_442 = (constr_id_of_sort sort)
in (_116_442, (capp)::[]))
in (mkApp _116_443))
in (let cid = (let _116_449 = (let _116_448 = (let _116_447 = (let _116_446 = (let _116_445 = (let _116_444 = (mkInteger id)
in (_116_444, cid_app))
in (mkEq _116_445))
in ([], bvar_names, _116_446))
in (mkForall _116_447))
in (_116_448, Some ("Constructor distinct")))
in Assume (_116_449))
in (let disc_name = (Prims.strcat "is-" name)
in (let xfv = ("x", sort)
in (let xx = (mkFreeV xfv)
in (let disc_eq = (let _116_454 = (let _116_453 = (let _116_451 = (let _116_450 = (constr_id_of_sort sort)
in (_116_450, (xx)::[]))
in (mkApp _116_451))
in (let _116_452 = (mkInteger id)
in (_116_453, _116_452)))
in (mkEq _116_454))
in (let proj_terms = (FStar_All.pipe_right projectors (FStar_List.map (fun _50_563 -> (match (_50_563) with
| (proj, s) -> begin
(mkApp (proj, (xx)::[]))
end))))
in (let disc_inv_body = (let _116_457 = (let _116_456 = (mkApp (name, proj_terms))
in (xx, _116_456))
in (mkEq _116_457))
in (let disc_ax = (mkAnd (disc_eq, disc_inv_body))
in (let disc = (mkDefineFun (disc_name, (xfv)::[], Bool_sort, disc_ax, Some ("Discriminator definition")))
in (let projs = (let _116_468 = (FStar_All.pipe_right projectors (FStar_List.mapi (fun i _50_571 -> (match (_50_571) with
| (name, s) -> begin
(let cproj_app = (mkApp (name, (capp)::[]))
in (let _116_467 = (let _116_466 = (let _116_465 = (let _116_464 = (let _116_463 = (let _116_462 = (let _116_461 = (let _116_460 = (bvar i s)
in (cproj_app, _116_460))
in (mkEq _116_461))
in ((capp)::[], bvar_names, _116_462))
in (mkForall _116_463))
in (_116_464, Some ("Projection inverse")))
in Assume (_116_465))
in (_116_466)::[])
in (DeclFun ((name, (sort)::[], s, Some ("Projector"))))::_116_467))
end))))
in (FStar_All.pipe_right _116_468 FStar_List.flatten))
in (let _116_475 = (let _116_471 = (let _116_470 = (let _116_469 = (FStar_Util.format1 "<start constructor %s>" name)
in Caption (_116_469))
in (_116_470)::(cdecl)::(cid)::projs)
in (FStar_List.append _116_471 ((disc)::[])))
in (let _116_474 = (let _116_473 = (let _116_472 = (FStar_Util.format1 "</end constructor %s>" name)
in Caption (_116_472))
in (_116_473)::[])
in (FStar_List.append _116_475 _116_474)))))))))))))))))))))))
end))

let name_binders_inner = (fun outer_names start sorts -> (let _50_593 = (FStar_All.pipe_right sorts (FStar_List.fold_left (fun _50_580 s -> (match (_50_580) with
| (names, binders, n) -> begin
(let prefix = (match (s) with
| Type_sort -> begin
"@a"
end
| Term_sort -> begin
"@x"
end
| _50_585 -> begin
"@u"
end)
in (let nm = (let _116_484 = (FStar_Util.string_of_int n)
in (Prims.strcat prefix _116_484))
in (let names = ((nm, s))::names
in (let b = (let _116_485 = (strSort s)
in (FStar_Util.format2 "(%s %s)" nm _116_485))
in (names, (b)::binders, (n + 1))))))
end)) (outer_names, [], start)))
in (match (_50_593) with
| (names, binders, n) -> begin
(names, (FStar_List.rev binders), n)
end)))

let name_binders = (fun sorts -> (let _50_598 = (name_binders_inner [] 0 sorts)
in (match (_50_598) with
| (names, binders, n) -> begin
((FStar_List.rev names), binders)
end)))

let termToSmt = (fun t -> (let rec aux = (fun n names t -> (match (t.tm) with
| Integer (i) -> begin
i
end
| BoundV (i) -> begin
(let _116_496 = (FStar_List.nth names i)
in (FStar_All.pipe_right _116_496 Prims.fst))
end
| FreeV (x) -> begin
(Prims.fst x)
end
| App (op, []) -> begin
(op_to_string op)
end
| App (op, tms) -> begin
(let _116_498 = (let _116_497 = (FStar_List.map (aux n names) tms)
in (FStar_All.pipe_right _116_497 (FStar_String.concat "\n")))
in (FStar_Util.format2 "(%s %s)" (op_to_string op) _116_498))
end
| Quant (qop, pats, wopt, sorts, body) -> begin
(let _50_628 = (name_binders_inner names n sorts)
in (match (_50_628) with
| (names, binders, n) -> begin
(let binders = (FStar_All.pipe_right binders (FStar_String.concat " "))
in (let pats_str = (match (pats) with
| ([]::[]) | ([]) -> begin
""
end
| _50_634 -> begin
(let _116_504 = (FStar_All.pipe_right pats (FStar_List.map (fun pats -> (let _116_503 = (let _116_502 = (FStar_List.map (fun p -> (let _116_501 = (aux n names p)
in (FStar_Util.format1 "%s" _116_501))) pats)
in (FStar_String.concat " " _116_502))
in (FStar_Util.format1 "\n:pattern (%s)" _116_503)))))
in (FStar_All.pipe_right _116_504 (FStar_String.concat "\n")))
end)
in (match ((pats, wopt)) with
| (([]::[], None)) | (([], None)) -> begin
(let _116_505 = (aux n names body)
in (FStar_Util.format3 "(%s (%s)\n %s)" (qop_to_string qop) binders _116_505))
end
| _50_646 -> begin
(let _116_507 = (aux n names body)
in (let _116_506 = (weightToSmt wopt)
in (FStar_Util.format5 "(%s (%s)\n (! %s\n %s %s))" (qop_to_string qop) binders _116_507 _116_506 pats_str)))
end)))
end))
end))
in (aux 0 [] t)))

let caption_to_string = (fun _50_6 -> (match (_50_6) with
| None -> begin
""
end
| Some (c) -> begin
(let _50_653 = (FStar_Util.splitlines c)
in (match (_50_653) with
| hd::tl -> begin
(let suffix = (match (tl) with
| [] -> begin
""
end
| _50_656 -> begin
"..."
end)
in (FStar_Util.format2 ";;;;;;;;;;;;;;;;%s%s\n" hd suffix))
end))
end))

let rec declToSmt = (fun z3options decl -> (match (decl) with
| DefPrelude -> begin
(mkPrelude z3options)
end
| Caption (c) -> begin
(let _116_516 = (FStar_All.pipe_right (FStar_Util.splitlines c) (fun _50_7 -> (match (_50_7) with
| [] -> begin
""
end
| h::t -> begin
h
end)))
in (FStar_Util.format1 "\n; %s" _116_516))
end
| DeclFun (f, argsorts, retsort, c) -> begin
(let l = (FStar_List.map strSort argsorts)
in (let _116_518 = (caption_to_string c)
in (let _116_517 = (strSort retsort)
in (FStar_Util.format4 "%s(declare-fun %s (%s) %s)" _116_518 f (FStar_String.concat " " l) _116_517))))
end
| DefineFun (f, arg_sorts, retsort, body, c) -> begin
(let _50_684 = (name_binders arg_sorts)
in (match (_50_684) with
| (names, binders) -> begin
(let body = (let _116_519 = (FStar_List.map mkFreeV names)
in (inst _116_519 body))
in (let _116_522 = (caption_to_string c)
in (let _116_521 = (strSort retsort)
in (let _116_520 = (termToSmt body)
in (FStar_Util.format5 "%s(define-fun %s (%s) %s\n %s)" _116_522 f (FStar_String.concat " " binders) _116_521 _116_520)))))
end))
end
| Assume (t, c) -> begin
(let _116_524 = (caption_to_string c)
in (let _116_523 = (termToSmt t)
in (FStar_Util.format2 "%s(assert %s)" _116_524 _116_523)))
end
| Eval (t) -> begin
(let _116_525 = (termToSmt t)
in (FStar_Util.format1 "(eval %s)" _116_525))
end
| Echo (s) -> begin
(FStar_Util.format1 "(echo \"%s\")" s)
end
| CheckSat -> begin
"(check-sat)"
end
| Push -> begin
"(push)"
end
| Pop -> begin
"(pop)"
end))
and mkPrelude = (fun z3options -> (let basic = (Prims.strcat z3options "(declare-sort Ref)\n(declare-fun Ref_constr_id (Ref) Int)\n\n(declare-sort String)\n(declare-fun String_constr_id (String) Int)\n\n(declare-sort Kind)\n(declare-fun Kind_constr_id (Kind) Int)\n\n(declare-sort Type)\n(declare-fun Type_constr_id (Type) Int)\n\n(declare-sort Term)\n(declare-fun Term_constr_id (Term) Int)\n(declare-datatypes () ((Fuel \n(ZFuel) \n(SFuel (prec Fuel)))))\n(declare-fun MaxIFuel () Fuel)\n(declare-fun MaxFuel () Fuel)\n(declare-fun PreKind (Type) Kind)\n(declare-fun PreType (Term) Type)\n(declare-fun Valid (Type) Bool)\n(declare-fun HasKind (Type Kind) Bool)\n(declare-fun HasTypeFuel (Fuel Term Type) Bool)\n(define-fun HasTypeZ ((x Term) (t Type)) Bool\n(HasTypeFuel ZFuel x t))\n(define-fun HasType ((x Term) (t Type)) Bool\n(HasTypeFuel MaxIFuel x t))\n;;fuel irrelevance\n(assert (forall ((f Fuel) (x Term) (t Type))\n(! (= (HasTypeFuel (SFuel f) x t)\n(HasTypeZ x t))\n:pattern ((HasTypeFuel (SFuel f) x t)))))\n(define-fun  IsTyped ((x Term)) Bool\n(exists ((t Type)) (HasTypeZ x t)))\n(declare-fun ApplyEF (Term Fuel) Term)\n(declare-fun ApplyEE (Term Term) Term)\n(declare-fun ApplyET (Term Type) Term)\n(declare-fun ApplyTE (Type Term) Type)\n(declare-fun ApplyTT (Type Type) Type)\n(declare-fun Rank (Term) Int)\n(declare-fun Closure (Term) Term)\n(declare-fun ConsTerm (Term Term) Term)\n(declare-fun ConsType (Type Term) Term)\n(declare-fun ConsFuel (Fuel Term) Term)\n(declare-fun Precedes (Term Term) Type)\n(assert (forall ((t Type))\n(! (implies (exists ((e Term)) (HasType e t))\n(Valid t))\n:pattern ((Valid t)))))\n(assert (forall ((t1 Term) (t2 Term))\n(! (iff (Valid (Precedes t1 t2)) \n(< (Rank t1) (Rank t2)))\n:pattern ((Precedes t1 t2)))))\n(define-fun Prims.Precedes ((a Type) (b Type) (t1 Term) (t2 Term)) Type\n(Precedes t1 t2))\n")
in (let constrs = (("String_const", (("String_const_proj_0", Int_sort))::[], String_sort, 0))::(("Kind_type", [], Kind_sort, 0))::(("Kind_arrow", (("Kind_arrow_id", Int_sort))::[], Kind_sort, 1))::(("Kind_uvar", (("Kind_uvar_fst", Int_sort))::[], Kind_sort, 2))::(("Typ_fun", (("Typ_fun_id", Int_sort))::[], Type_sort, 1))::(("Typ_app", (("Typ_app_fst", Type_sort))::(("Typ_app_snd", Type_sort))::[], Type_sort, 2))::(("Typ_dep", (("Typ_dep_fst", Type_sort))::(("Typ_dep_snd", Term_sort))::[], Type_sort, 3))::(("Typ_uvar", (("Typ_uvar_fst", Int_sort))::[], Type_sort, 4))::(("Term_unit", [], Term_sort, 0))::(("BoxInt", (("BoxInt_proj_0", Int_sort))::[], Term_sort, 1))::(("BoxBool", (("BoxBool_proj_0", Bool_sort))::[], Term_sort, 2))::(("BoxString", (("BoxString_proj_0", String_sort))::[], Term_sort, 3))::(("BoxRef", (("BoxRef_proj_0", Ref_sort))::[], Term_sort, 4))::(("Exp_uvar", (("Exp_uvar_fst", Int_sort))::[], Term_sort, 5))::(("LexCons", (("LexCons_0", Term_sort))::(("LexCons_1", Term_sort))::[], Term_sort, 6))::[]
in (let bcons = (let _116_528 = (let _116_527 = (FStar_All.pipe_right constrs (FStar_List.collect constructor_to_decl))
in (FStar_All.pipe_right _116_527 (FStar_List.map (declToSmt z3options))))
in (FStar_All.pipe_right _116_528 (FStar_String.concat "\n")))
in (let lex_ordering = "\n(define-fun is-Prims.LexCons ((t Term)) Bool \n(is-LexCons t))\n(assert (forall ((x1 Term) (x2 Term) (y1 Term) (y2 Term))\n(iff (Valid (Precedes (LexCons x1 x2) (LexCons y1 y2)))\n(or (Valid (Precedes x1 y1))\n(and (= x1 y1)\n(Valid (Precedes x2 y2)))))))\n"
in (Prims.strcat (Prims.strcat basic bcons) lex_ordering))))))

let mk_Kind_type = (mkApp ("Kind_type", []))

let mk_Kind_uvar = (fun i -> (let _116_533 = (let _116_532 = (let _116_531 = (mkInteger' i)
in (_116_531)::[])
in ("Kind_uvar", _116_532))
in (mkApp _116_533)))

let mk_Typ_app = (fun t1 t2 -> (mkApp ("Typ_app", (t1)::(t2)::[])))

let mk_Typ_dep = (fun t1 t2 -> (mkApp ("Typ_dep", (t1)::(t2)::[])))

let mk_Typ_uvar = (fun i -> (let _116_546 = (let _116_545 = (let _116_544 = (mkInteger' i)
in (_116_544)::[])
in ("Typ_uvar", _116_545))
in (mkApp _116_546)))

let mk_Exp_uvar = (fun i -> (let _116_551 = (let _116_550 = (let _116_549 = (mkInteger' i)
in (_116_549)::[])
in ("Exp_uvar", _116_550))
in (mkApp _116_551)))

let mk_Term_unit = (mkApp ("Term_unit", []))

let boxInt = (fun t -> (mkApp ("BoxInt", (t)::[])))

let unboxInt = (fun t -> (mkApp ("BoxInt_proj_0", (t)::[])))

let boxBool = (fun t -> (mkApp ("BoxBool", (t)::[])))

let unboxBool = (fun t -> (mkApp ("BoxBool_proj_0", (t)::[])))

let boxString = (fun t -> (mkApp ("BoxString", (t)::[])))

let unboxString = (fun t -> (mkApp ("BoxString_proj_0", (t)::[])))

let boxRef = (fun t -> (mkApp ("BoxRef", (t)::[])))

let unboxRef = (fun t -> (mkApp ("BoxRef_proj_0", (t)::[])))

let boxTerm = (fun sort t -> (match (sort) with
| Int_sort -> begin
(boxInt t)
end
| Bool_sort -> begin
(boxBool t)
end
| String_sort -> begin
(boxString t)
end
| Ref_sort -> begin
(boxRef t)
end
| _50_724 -> begin
(Prims.raise FStar_Util.Impos)
end))

let unboxTerm = (fun sort t -> (match (sort) with
| Int_sort -> begin
(unboxInt t)
end
| Bool_sort -> begin
(unboxBool t)
end
| String_sort -> begin
(unboxString t)
end
| Ref_sort -> begin
(unboxRef t)
end
| _50_732 -> begin
(Prims.raise FStar_Util.Impos)
end))

let mk_PreKind = (fun t -> (mkApp ("PreKind", (t)::[])))

let mk_PreType = (fun t -> (mkApp ("PreType", (t)::[])))

let mk_Valid = (fun t -> (mkApp ("Valid", (t)::[])))

let mk_HasType = (fun v t -> (mkApp ("HasType", (v)::(t)::[])))

let mk_HasTypeZ = (fun v t -> (mkApp ("HasTypeZ", (v)::(t)::[])))

let mk_IsTyped = (fun v -> (mkApp ("IsTyped", (v)::[])))

let mk_HasTypeFuel = (fun f v t -> (match ((FStar_ST.read FStar_Options.unthrottle_inductives)) with
| true -> begin
(mk_HasType v t)
end
| false -> begin
(mkApp ("HasTypeFuel", (f)::(v)::(t)::[]))
end))

let mk_HasTypeWithFuel = (fun f v t -> (match (f) with
| None -> begin
(mk_HasType v t)
end
| Some (f) -> begin
(mk_HasTypeFuel f v t)
end))

let mk_Destruct = (fun v -> (mkApp ("Destruct", (v)::[])))

let mk_HasKind = (fun t k -> (mkApp ("HasKind", (t)::(k)::[])))

let mk_Rank = (fun x -> (mkApp ("Rank", (x)::[])))

let mk_tester = (fun n t -> (mkApp ((Prims.strcat "is-" n), (t)::[])))

let mk_ApplyTE = (fun t e -> (mkApp ("ApplyTE", (t)::(e)::[])))

let mk_ApplyTT = (fun t t' -> (mkApp ("ApplyTT", (t)::(t')::[])))

let mk_ApplyET = (fun e t -> (mkApp ("ApplyET", (e)::(t)::[])))

let mk_ApplyEE = (fun e e' -> (mkApp ("ApplyEE", (e)::(e')::[])))

let mk_ApplyEF = (fun e f -> (mkApp ("ApplyEF", (e)::(f)::[])))

let mk_String_const = (fun i -> (let _116_640 = (let _116_639 = (let _116_638 = (mkInteger' i)
in (_116_638)::[])
in ("String_const", _116_639))
in (mkApp _116_640)))

let mk_Precedes = (fun x1 x2 -> (let _116_645 = (mkApp ("Precedes", (x1)::(x2)::[]))
in (FStar_All.pipe_right _116_645 mk_Valid)))

let mk_LexCons = (fun x1 x2 -> (mkApp ("LexCons", (x1)::(x2)::[])))

let rec n_fuel = (fun n -> (match ((n = 0)) with
| true -> begin
(mkApp ("ZFuel", []))
end
| false -> begin
(let _116_654 = (let _116_653 = (let _116_652 = (n_fuel (n - 1))
in (_116_652)::[])
in ("SFuel", _116_653))
in (mkApp _116_654))
end))

let fuel_2 = (n_fuel 2)

let fuel_100 = (n_fuel 100)

let mk_and_opt = (fun p1 p2 -> (match ((p1, p2)) with
| (Some (p1), Some (p2)) -> begin
(let _116_659 = (mkAnd (p1, p2))
in Some (_116_659))
end
| ((Some (p), None)) | ((None, Some (p))) -> begin
Some (p)
end
| (None, None) -> begin
None
end))

let mk_and_opt_l = (fun pl -> (FStar_List.fold_left (fun out p -> (mk_and_opt p out)) None pl))

let mk_and_l = (fun l -> (match (l) with
| [] -> begin
mkTrue
end
| hd::tl -> begin
(FStar_List.fold_left (fun p1 p2 -> (mkAnd (p1, p2))) hd tl)
end))

let mk_or_l = (fun l -> (match (l) with
| [] -> begin
mkFalse
end
| hd::tl -> begin
(FStar_List.fold_left (fun p1 p2 -> (mkOr (p1, p2))) hd tl)
end))

let rec print_smt_term = (fun t -> (match (t.tm) with
| Integer (n) -> begin
(FStar_Util.format1 "Integer %s" n)
end
| BoundV (n) -> begin
(let _116_676 = (FStar_Util.string_of_int n)
in (FStar_Util.format1 "BoundV %s" _116_676))
end
| FreeV (fv) -> begin
(FStar_Util.format1 "FreeV %s" (Prims.fst fv))
end
| App (op, l) -> begin
(let _116_677 = (print_smt_term_list l)
in (FStar_Util.format2 "App %s [ %s ]" (op_to_string op) _116_677))
end
| Quant (qop, l, _50_820, _50_822, t) -> begin
(let _116_679 = (print_smt_term_list_list l)
in (let _116_678 = (print_smt_term t)
in (FStar_Util.format3 "Quant %s %s %s" (qop_to_string qop) _116_679 _116_678)))
end))
and print_smt_term_list = (fun l -> (FStar_List.fold_left (fun s t -> (let _116_683 = (print_smt_term t)
in (Prims.strcat (Prims.strcat s "; ") _116_683))) "" l))
and print_smt_term_list_list = (fun l -> (FStar_List.fold_left (fun s l -> (let _116_688 = (let _116_687 = (print_smt_term_list l)
in (Prims.strcat (Prims.strcat s "; [ ") _116_687))
in (Prims.strcat _116_688 " ] "))) "" l))




