open Prims
exception Not_a_wp_implication of Prims.string 
let (uu___is_Not_a_wp_implication : Prims.exn -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | Not_a_wp_implication uu____10 -> true
    | uu____11 -> false
  
let (__proj__Not_a_wp_implication__item__uu___ : Prims.exn -> Prims.string) =
  fun projectee  ->
    match projectee with | Not_a_wp_implication uu____18 -> uu____18
  
type label = FStar_SMTEncoding_Term.error_label[@@deriving show]
type labels = FStar_SMTEncoding_Term.error_labels[@@deriving show]
let (sort_labels :
  (FStar_SMTEncoding_Term.error_label,Prims.bool)
    FStar_Pervasives_Native.tuple2 Prims.list ->
    ((FStar_SMTEncoding_Term.fv,Prims.string,FStar_Range.range)
       FStar_Pervasives_Native.tuple3,Prims.bool)
      FStar_Pervasives_Native.tuple2 Prims.list)
  =
  fun l  ->
    FStar_List.sortWith
      (fun uu____68  ->
         fun uu____69  ->
           match (uu____68, uu____69) with
           | (((uu____110,uu____111,r1),uu____113),((uu____114,uu____115,r2),uu____117))
               -> FStar_Range.compare r1 r2) l
  
let (remove_dups :
  labels ->
    (FStar_SMTEncoding_Term.fv,Prims.string,FStar_Range.range)
      FStar_Pervasives_Native.tuple3 Prims.list)
  =
  fun l  ->
    FStar_Util.remove_dups
      (fun uu____177  ->
         fun uu____178  ->
           match (uu____177, uu____178) with
           | ((uu____203,m1,r1),(uu____206,m2,r2)) -> (r1 = r2) && (m1 = m2))
      l
  
type msg = (Prims.string,FStar_Range.range) FStar_Pervasives_Native.tuple2
[@@deriving show]
type ranges =
  (Prims.string FStar_Pervasives_Native.option,FStar_Range.range)
    FStar_Pervasives_Native.tuple2 Prims.list[@@deriving show]
let (fresh_label :
  Prims.string ->
    FStar_Range.range ->
      FStar_SMTEncoding_Term.term ->
        (label,FStar_SMTEncoding_Term.term) FStar_Pervasives_Native.tuple2)
  =
  let ctr = FStar_Util.mk_ref (Prims.parse_int "0")  in
  fun message  ->
    fun range  ->
      fun t  ->
        let l =
          FStar_Util.incr ctr;
          (let uu____290 =
             let uu____291 = FStar_ST.op_Bang ctr  in
             FStar_Util.string_of_int uu____291  in
           FStar_Util.format1 "label_%s" uu____290)
           in
        let lvar = (l, FStar_SMTEncoding_Term.Bool_sort)  in
        let label = (lvar, message, range)  in
        let lterm = FStar_SMTEncoding_Util.mkFreeV lvar  in
        let lt1 = FStar_SMTEncoding_Term.mkOr (lterm, t) range  in
        (label, lt1)
  
let (label_goals :
  (unit -> Prims.string) FStar_Pervasives_Native.option ->
    FStar_Range.range ->
      FStar_SMTEncoding_Term.term ->
        (labels,FStar_SMTEncoding_Term.term) FStar_Pervasives_Native.tuple2)
  =
  fun use_env_msg  ->
    fun r  ->
      fun q  ->
        let rec is_a_post_condition post_name_opt tm =
          match (post_name_opt, (tm.FStar_SMTEncoding_Term.tm)) with
          | (FStar_Pervasives_Native.None ,uu____408) -> false
          | (FStar_Pervasives_Native.Some nm,FStar_SMTEncoding_Term.FreeV
             (nm',uu____413)) -> nm = nm'
          | (uu____416,FStar_SMTEncoding_Term.App
             (FStar_SMTEncoding_Term.Var "Valid",tm1::[])) ->
              is_a_post_condition post_name_opt tm1
          | (uu____424,FStar_SMTEncoding_Term.App
             (FStar_SMTEncoding_Term.Var "ApplyTT",tm1::uu____426)) ->
              is_a_post_condition post_name_opt tm1
          | uu____435 -> false  in
        let conjuncts t =
          match t.FStar_SMTEncoding_Term.tm with
          | FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.And ,cs) -> cs
          | uu____457 -> [t]  in
        let is_guard_free tm =
          match tm.FStar_SMTEncoding_Term.tm with
          | FStar_SMTEncoding_Term.Quant
              (FStar_SMTEncoding_Term.Forall
               ,({
                   FStar_SMTEncoding_Term.tm = FStar_SMTEncoding_Term.App
                     (FStar_SMTEncoding_Term.Var "Prims.guard_free",p::[]);
                   FStar_SMTEncoding_Term.freevars = uu____465;
                   FStar_SMTEncoding_Term.rng = uu____466;_}::[])::[],iopt,uu____468,
               {
                 FStar_SMTEncoding_Term.tm = FStar_SMTEncoding_Term.App
                   (FStar_SMTEncoding_Term.Iff ,l::r1::[]);
                 FStar_SMTEncoding_Term.freevars = uu____471;
                 FStar_SMTEncoding_Term.rng = uu____472;_})
              -> true
          | uu____509 -> false  in
        let is_a_named_continuation lhs =
          FStar_All.pipe_right (conjuncts lhs)
            (FStar_Util.for_some is_guard_free)
           in
        let uu____518 =
          match use_env_msg with
          | FStar_Pervasives_Native.None  -> (false, "")
          | FStar_Pervasives_Native.Some f ->
              let uu____537 = f ()  in (true, uu____537)
           in
        match uu____518 with
        | (flag,msg_prefix) ->
            let fresh_label1 msg ropt rng t =
              let msg1 =
                if flag
                then Prims.strcat "Failed to verify implicit argument: " msg
                else msg  in
              let rng1 =
                match ropt with
                | FStar_Pervasives_Native.None  -> rng
                | FStar_Pervasives_Native.Some r1 ->
                    let uu____577 = FStar_Range.def_range rng  in
                    FStar_Range.set_def_range r1 uu____577
                 in
              fresh_label msg1 rng1 t  in
            let rec aux default_msg ropt post_name_opt labels q1 =
              match q1.FStar_SMTEncoding_Term.tm with
              | FStar_SMTEncoding_Term.BoundV uu____628 -> (labels, q1)
              | FStar_SMTEncoding_Term.Integer uu____631 -> (labels, q1)
              | FStar_SMTEncoding_Term.LblPos uu____634 ->
                  failwith "Impossible"
              | FStar_SMTEncoding_Term.Labeled
                  (arg,"could not prove post-condition",uu____646) ->
                  let fallback msg =
                    aux default_msg ropt post_name_opt labels arg  in
                  (try
                     match arg.FStar_SMTEncoding_Term.tm with
                     | FStar_SMTEncoding_Term.Quant
                         (FStar_SMTEncoding_Term.Forall
                          ,pats,iopt,post::sorts,{
                                                   FStar_SMTEncoding_Term.tm
                                                     =
                                                     FStar_SMTEncoding_Term.App
                                                     (FStar_SMTEncoding_Term.Imp
                                                      ,lhs::rhs::[]);
                                                   FStar_SMTEncoding_Term.freevars
                                                     = uu____707;
                                                   FStar_SMTEncoding_Term.rng
                                                     = rng;_})
                         ->
                         let post_name =
                           let uu____736 =
                             let uu____737 = FStar_Syntax_Syntax.next_id ()
                                in
                             FStar_All.pipe_left FStar_Util.string_of_int
                               uu____737
                              in
                           Prims.strcat "^^post_condition_" uu____736  in
                         let names1 =
                           let uu____745 =
                             FStar_List.mapi
                               (fun i  ->
                                  fun s  ->
                                    let uu____761 =
                                      let uu____762 =
                                        FStar_Util.string_of_int i  in
                                      Prims.strcat "^^" uu____762  in
                                    (uu____761, s)) sorts
                              in
                           (post_name, post) :: uu____745  in
                         let instantiation =
                           FStar_List.map FStar_SMTEncoding_Util.mkFreeV
                             names1
                            in
                         let uu____774 =
                           let uu____779 =
                             FStar_SMTEncoding_Term.inst instantiation lhs
                              in
                           let uu____780 =
                             FStar_SMTEncoding_Term.inst instantiation rhs
                              in
                           (uu____779, uu____780)  in
                         (match uu____774 with
                          | (lhs1,rhs1) ->
                              let uu____789 =
                                match lhs1.FStar_SMTEncoding_Term.tm with
                                | FStar_SMTEncoding_Term.App
                                    (FStar_SMTEncoding_Term.And ,clauses_lhs)
                                    ->
                                    let uu____807 =
                                      FStar_Util.prefix clauses_lhs  in
                                    (match uu____807 with
                                     | (req,ens) ->
                                         (match ens.FStar_SMTEncoding_Term.tm
                                          with
                                          | FStar_SMTEncoding_Term.Quant
                                              (FStar_SMTEncoding_Term.Forall
                                               ,pats_ens,iopt_ens,sorts_ens,
                                               {
                                                 FStar_SMTEncoding_Term.tm =
                                                   FStar_SMTEncoding_Term.App
                                                   (FStar_SMTEncoding_Term.Imp
                                                    ,ensures_conjuncts::post1::[]);
                                                 FStar_SMTEncoding_Term.freevars
                                                   = uu____837;
                                                 FStar_SMTEncoding_Term.rng =
                                                   rng_ens;_})
                                              when
                                              is_a_post_condition
                                                (FStar_Pervasives_Native.Some
                                                   post_name) post1
                                              ->
                                              let uu____865 =
                                                aux
                                                  "could not prove post-condition"
                                                  FStar_Pervasives_Native.None
                                                  (FStar_Pervasives_Native.Some
                                                     post_name) labels
                                                  ensures_conjuncts
                                                 in
                                              (match uu____865 with
                                               | (labels1,ensures_conjuncts1)
                                                   ->
                                                   let pats_ens1 =
                                                     match pats_ens with
                                                     | [] -> [[post1]]
                                                     | []::[] -> [[post1]]
                                                     | uu____907 -> pats_ens
                                                      in
                                                   let ens1 =
                                                     let uu____913 =
                                                       let uu____914 =
                                                         let uu____933 =
                                                           FStar_SMTEncoding_Term.mk
                                                             (FStar_SMTEncoding_Term.App
                                                                (FStar_SMTEncoding_Term.Imp,
                                                                  [ensures_conjuncts1;
                                                                  post1]))
                                                             rng_ens
                                                            in
                                                         (FStar_SMTEncoding_Term.Forall,
                                                           pats_ens1,
                                                           iopt_ens,
                                                           sorts_ens,
                                                           uu____933)
                                                          in
                                                       FStar_SMTEncoding_Term.Quant
                                                         uu____914
                                                        in
                                                     FStar_SMTEncoding_Term.mk
                                                       uu____913
                                                       ens.FStar_SMTEncoding_Term.rng
                                                      in
                                                   let lhs2 =
                                                     FStar_SMTEncoding_Term.mk
                                                       (FStar_SMTEncoding_Term.App
                                                          (FStar_SMTEncoding_Term.And,
                                                            (FStar_List.append
                                                               req [ens1])))
                                                       lhs1.FStar_SMTEncoding_Term.rng
                                                      in
                                                   let uu____947 =
                                                     FStar_SMTEncoding_Term.abstr
                                                       names1 lhs2
                                                      in
                                                   (labels1, uu____947))
                                          | uu____950 ->
                                              let uu____951 =
                                                let uu____952 =
                                                  let uu____953 =
                                                    let uu____954 =
                                                      let uu____955 =
                                                        FStar_SMTEncoding_Term.print_smt_term
                                                          ens
                                                         in
                                                      Prims.strcat "  ... "
                                                        uu____955
                                                       in
                                                    Prims.strcat post_name
                                                      uu____954
                                                     in
                                                  Prims.strcat
                                                    "Ensures clause doesn't match post name:  "
                                                    uu____953
                                                   in
                                                Not_a_wp_implication
                                                  uu____952
                                                 in
                                              FStar_Exn.raise uu____951))
                                | uu____962 ->
                                    let uu____963 =
                                      let uu____964 =
                                        let uu____965 =
                                          FStar_SMTEncoding_Term.print_smt_term
                                            lhs1
                                           in
                                        Prims.strcat "LHS not a conjunct: "
                                          uu____965
                                         in
                                      Not_a_wp_implication uu____964  in
                                    FStar_Exn.raise uu____963
                                 in
                              (match uu____789 with
                               | (labels1,lhs2) ->
                                   let uu____984 =
                                     let uu____991 =
                                       aux default_msg
                                         FStar_Pervasives_Native.None
                                         (FStar_Pervasives_Native.Some
                                            post_name) labels1 rhs1
                                        in
                                     match uu____991 with
                                     | (labels2,rhs2) ->
                                         let uu____1010 =
                                           FStar_SMTEncoding_Term.abstr
                                             names1 rhs2
                                            in
                                         (labels2, uu____1010)
                                      in
                                   (match uu____984 with
                                    | (labels2,rhs2) ->
                                        let body =
                                          FStar_SMTEncoding_Term.mkImp
                                            (lhs2, rhs2) rng
                                           in
                                        let uu____1026 =
                                          FStar_SMTEncoding_Term.mk
                                            (FStar_SMTEncoding_Term.Quant
                                               (FStar_SMTEncoding_Term.Forall,
                                                 pats, iopt, (post :: sorts),
                                                 body))
                                            q1.FStar_SMTEncoding_Term.rng
                                           in
                                        (labels2, uu____1026))))
                     | uu____1037 ->
                         let uu____1038 =
                           let uu____1039 =
                             FStar_SMTEncoding_Term.print_smt_term arg  in
                           Prims.strcat "arg not a quant: " uu____1039  in
                         fallback uu____1038
                   with | Not_a_wp_implication msg -> fallback msg)
              | FStar_SMTEncoding_Term.Labeled (arg,reason,r1) ->
                  aux reason (FStar_Pervasives_Native.Some r1) post_name_opt
                    labels arg
              | FStar_SMTEncoding_Term.Quant
                  (FStar_SMTEncoding_Term.Forall
                   ,[],FStar_Pervasives_Native.None
                   ,post::[],{
                               FStar_SMTEncoding_Term.tm =
                                 FStar_SMTEncoding_Term.App
                                 (FStar_SMTEncoding_Term.Imp ,lhs::rhs::[]);
                               FStar_SMTEncoding_Term.freevars = uu____1056;
                               FStar_SMTEncoding_Term.rng = rng;_})
                  when is_a_named_continuation lhs ->
                  let post_name =
                    let uu____1079 =
                      let uu____1080 = FStar_Syntax_Syntax.next_id ()  in
                      FStar_All.pipe_left FStar_Util.string_of_int uu____1080
                       in
                    Prims.strcat "^^post_condition_" uu____1079  in
                  let names1 = (post_name, post)  in
                  let instantiation =
                    let uu____1089 = FStar_SMTEncoding_Util.mkFreeV names1
                       in
                    [uu____1089]  in
                  let uu____1090 =
                    let uu____1095 =
                      FStar_SMTEncoding_Term.inst instantiation lhs  in
                    let uu____1096 =
                      FStar_SMTEncoding_Term.inst instantiation rhs  in
                    (uu____1095, uu____1096)  in
                  (match uu____1090 with
                   | (lhs1,rhs1) ->
                       let uu____1105 =
                         FStar_Util.fold_map
                           (fun labels1  ->
                              fun tm  ->
                                match tm.FStar_SMTEncoding_Term.tm with
                                | FStar_SMTEncoding_Term.Quant
                                    (FStar_SMTEncoding_Term.Forall
                                     ,({
                                         FStar_SMTEncoding_Term.tm =
                                           FStar_SMTEncoding_Term.App
                                           (FStar_SMTEncoding_Term.Var
                                            "Prims.guard_free",p::[]);
                                         FStar_SMTEncoding_Term.freevars =
                                           uu____1142;
                                         FStar_SMTEncoding_Term.rng =
                                           uu____1143;_}::[])::[],iopt,sorts,
                                     {
                                       FStar_SMTEncoding_Term.tm =
                                         FStar_SMTEncoding_Term.App
                                         (FStar_SMTEncoding_Term.Iff
                                          ,l::r1::[]);
                                       FStar_SMTEncoding_Term.freevars =
                                         uu____1148;
                                       FStar_SMTEncoding_Term.rng =
                                         uu____1149;_})
                                    ->
                                    let uu____1186 =
                                      aux default_msg
                                        FStar_Pervasives_Native.None
                                        post_name_opt labels1 r1
                                       in
                                    (match uu____1186 with
                                     | (labels2,r2) ->
                                         let uu____1205 =
                                           let uu____1206 =
                                             let uu____1207 =
                                               let uu____1226 =
                                                 FStar_SMTEncoding_Util.norng
                                                   FStar_SMTEncoding_Term.mk
                                                   (FStar_SMTEncoding_Term.App
                                                      (FStar_SMTEncoding_Term.Iff,
                                                        [l; r2]))
                                                  in
                                               (FStar_SMTEncoding_Term.Forall,
                                                 [[p]],
                                                 (FStar_Pervasives_Native.Some
                                                    (Prims.parse_int "0")),
                                                 sorts, uu____1226)
                                                in
                                             FStar_SMTEncoding_Term.Quant
                                               uu____1207
                                              in
                                           FStar_SMTEncoding_Term.mk
                                             uu____1206
                                             q1.FStar_SMTEncoding_Term.rng
                                            in
                                         (labels2, uu____1205))
                                | uu____1243 -> (labels1, tm)) labels
                           (conjuncts lhs1)
                          in
                       (match uu____1105 with
                        | (labels1,lhs_conjs) ->
                            let uu____1262 =
                              aux default_msg FStar_Pervasives_Native.None
                                (FStar_Pervasives_Native.Some post_name)
                                labels1 rhs1
                               in
                            (match uu____1262 with
                             | (labels2,rhs2) ->
                                 let body =
                                   let uu____1282 =
                                     let uu____1283 =
                                       let uu____1288 =
                                         FStar_SMTEncoding_Term.mk_and_l
                                           lhs_conjs
                                           lhs1.FStar_SMTEncoding_Term.rng
                                          in
                                       (uu____1288, rhs2)  in
                                     FStar_SMTEncoding_Term.mkImp uu____1283
                                       rng
                                      in
                                   FStar_All.pipe_right uu____1282
                                     (FStar_SMTEncoding_Term.abstr [names1])
                                    in
                                 let q2 =
                                   FStar_SMTEncoding_Term.mk
                                     (FStar_SMTEncoding_Term.Quant
                                        (FStar_SMTEncoding_Term.Forall, [],
                                          FStar_Pervasives_Native.None,
                                          [post], body))
                                     q1.FStar_SMTEncoding_Term.rng
                                    in
                                 (labels2, q2))))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Imp ,lhs::rhs::[]) ->
                  let uu____1306 =
                    aux default_msg ropt post_name_opt labels rhs  in
                  (match uu____1306 with
                   | (labels1,rhs1) ->
                       let uu____1325 =
                         FStar_SMTEncoding_Util.mkImp (lhs, rhs1)  in
                       (labels1, uu____1325))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.And ,conjuncts1) ->
                  let uu____1333 =
                    FStar_Util.fold_map (aux default_msg ropt post_name_opt)
                      labels conjuncts1
                     in
                  (match uu____1333 with
                   | (labels1,conjuncts2) ->
                       let uu____1360 =
                         FStar_SMTEncoding_Term.mk_and_l conjuncts2
                           q1.FStar_SMTEncoding_Term.rng
                          in
                       (labels1, uu____1360))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.ITE ,hd1::q11::q2::[]) ->
                  let uu____1368 =
                    aux default_msg ropt post_name_opt labels q11  in
                  (match uu____1368 with
                   | (labels1,q12) ->
                       let uu____1387 =
                         aux default_msg ropt post_name_opt labels1 q2  in
                       (match uu____1387 with
                        | (labels2,q21) ->
                            let uu____1406 =
                              FStar_SMTEncoding_Term.mkITE (hd1, q12, q21)
                                q1.FStar_SMTEncoding_Term.rng
                               in
                            (labels2, uu____1406)))
              | FStar_SMTEncoding_Term.Quant
                  (FStar_SMTEncoding_Term.Exists
                   ,uu____1409,uu____1410,uu____1411,uu____1412)
                  ->
                  let uu____1429 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1429 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Iff ,uu____1444) ->
                  let uu____1449 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1449 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Or ,uu____1464) ->
                  let uu____1469 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1469 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Var uu____1484,uu____1485) when
                  is_a_post_condition post_name_opt q1 -> (labels, q1)
              | FStar_SMTEncoding_Term.FreeV uu____1492 ->
                  let uu____1497 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1497 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.TrueOp ,uu____1512) ->
                  let uu____1517 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1517 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.FalseOp ,uu____1532) ->
                  let uu____1537 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1537 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Not ,uu____1552) ->
                  let uu____1557 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1557 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Eq ,uu____1572) ->
                  let uu____1577 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1577 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.LT ,uu____1592) ->
                  let uu____1597 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1597 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.LTE ,uu____1612) ->
                  let uu____1617 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1617 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.GT ,uu____1632) ->
                  let uu____1637 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1637 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.GTE ,uu____1652) ->
                  let uu____1657 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1657 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvUlt ,uu____1672) ->
                  let uu____1677 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1677 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Var uu____1692,uu____1693) ->
                  let uu____1698 =
                    fresh_label1 default_msg ropt
                      q1.FStar_SMTEncoding_Term.rng q1
                     in
                  (match uu____1698 with | (lab,q2) -> ((lab :: labels), q2))
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Add ,uu____1713) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Sub ,uu____1724) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Div ,uu____1735) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Mul ,uu____1746) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Minus ,uu____1757) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Mod ,uu____1768) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvAnd ,uu____1779) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvXor ,uu____1790) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvOr ,uu____1801) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvAdd ,uu____1812) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvSub ,uu____1823) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvShl ,uu____1834) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvShr ,uu____1845) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvUdiv ,uu____1856) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvMod ,uu____1867) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvMul ,uu____1878) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvUext uu____1889,uu____1890) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.BvToNat ,uu____1901) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.NatToBv uu____1912,uu____1913) ->
                  failwith "Impossible: non-propositional term"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.ITE ,uu____1924) ->
                  failwith "Impossible: arity mismatch"
              | FStar_SMTEncoding_Term.App
                  (FStar_SMTEncoding_Term.Imp ,uu____1935) ->
                  failwith "Impossible: arity mismatch"
              | FStar_SMTEncoding_Term.Quant
                  (FStar_SMTEncoding_Term.Forall ,pats,iopt,sorts,body) ->
                  let uu____1966 =
                    aux default_msg ropt post_name_opt labels body  in
                  (match uu____1966 with
                   | (labels1,body1) ->
                       let uu____1985 =
                         FStar_SMTEncoding_Term.mk
                           (FStar_SMTEncoding_Term.Quant
                              (FStar_SMTEncoding_Term.Forall, pats, iopt,
                                sorts, body1)) q1.FStar_SMTEncoding_Term.rng
                          in
                       (labels1, uu____1985))
              | FStar_SMTEncoding_Term.Let (es,body) ->
                  let uu____2002 =
                    aux default_msg ropt post_name_opt labels body  in
                  (match uu____2002 with
                   | (labels1,body1) ->
                       let uu____2021 =
                         FStar_SMTEncoding_Term.mkLet (es, body1)
                           q1.FStar_SMTEncoding_Term.rng
                          in
                       (labels1, uu____2021))
               in
            aux "assertion failed" FStar_Pervasives_Native.None
              FStar_Pervasives_Native.None [] q
  
let (detail_errors :
  Prims.bool ->
    FStar_TypeChecker_Env.env ->
      labels ->
        (FStar_SMTEncoding_Term.decls_t -> FStar_SMTEncoding_Z3.z3result) ->
          unit)
  =
  fun hint_replay  ->
    fun env  ->
      fun all_labels  ->
        fun askZ3  ->
          let print_banner uu____2056 =
            let msg =
              let uu____2058 =
                let uu____2059 = FStar_TypeChecker_Env.get_range env  in
                FStar_Range.string_of_range uu____2059  in
              let uu____2060 = FStar_Util.string_of_int (Prims.parse_int "5")
                 in
              let uu____2061 =
                FStar_Util.string_of_int (FStar_List.length all_labels)  in
              FStar_Util.format4
                "Detailed %s report follows for %s\nTaking %s seconds per proof obligation (%s proofs in total)\n"
                (if hint_replay then "hint replay" else "error") uu____2058
                uu____2060 uu____2061
               in
            FStar_Util.print_error msg  in
          let print_result uu____2078 =
            match uu____2078 with
            | ((uu____2089,msg,r),success) ->
                if success
                then
                  let uu____2099 = FStar_Range.string_of_range r  in
                  FStar_Util.print1 "OK: proof obligation at %s was proven\n"
                    uu____2099
                else
                  if hint_replay
                  then
                    FStar_Errors.log_issue r
                      (FStar_Errors.Warning_HintFailedToReplayProof,
                        (Prims.strcat
                           "Hint failed to replay this sub-proof: " msg))
                  else
                    (let uu____2102 =
                       let uu____2107 =
                         let uu____2108 = FStar_Range.string_of_range r  in
                         FStar_Util.format2
                           "XX: proof obligation at %s failed\n\t%s\n"
                           uu____2108 msg
                          in
                       (FStar_Errors.Error_ProofObligationFailed, uu____2107)
                        in
                     FStar_Errors.log_issue r uu____2102)
             in
          let elim labs =
            FStar_All.pipe_right labs
              (FStar_List.map
                 (fun uu____2170  ->
                    match uu____2170 with
                    | (l,uu____2182,uu____2183) ->
                        let a =
                          let uu____2193 =
                            let uu____2194 =
                              let uu____2199 =
                                FStar_SMTEncoding_Util.mkFreeV l  in
                              (uu____2199, FStar_SMTEncoding_Util.mkTrue)  in
                            FStar_SMTEncoding_Util.mkEq uu____2194  in
                          {
                            FStar_SMTEncoding_Term.assumption_term =
                              uu____2193;
                            FStar_SMTEncoding_Term.assumption_caption =
                              (FStar_Pervasives_Native.Some "Disabling label");
                            FStar_SMTEncoding_Term.assumption_name =
                              (Prims.strcat "@disable_label_"
                                 (FStar_Pervasives_Native.fst l));
                            FStar_SMTEncoding_Term.assumption_fact_ids = []
                          }  in
                        FStar_SMTEncoding_Term.Assume a))
             in
          let rec linear_check eliminated errors active =
            FStar_SMTEncoding_Z3.refresh ();
            (match active with
             | [] ->
                 let results =
                   let uu____2310 =
                     FStar_List.map (fun x  -> (x, true)) eliminated  in
                   let uu____2323 =
                     FStar_List.map (fun x  -> (x, false)) errors  in
                   FStar_List.append uu____2310 uu____2323  in
                 sort_labels results
             | hd1::tl1 ->
                 ((let uu____2375 =
                     FStar_Util.string_of_int (FStar_List.length active)  in
                   FStar_Util.print1 "%s, " uu____2375);
                  (let decls =
                     FStar_All.pipe_left elim
                       (FStar_List.append eliminated
                          (FStar_List.append errors tl1))
                      in
                   let result = askZ3 decls  in
                   match result.FStar_SMTEncoding_Z3.z3result_status with
                   | FStar_SMTEncoding_Z3.UNSAT uu____2432 ->
                       linear_check (hd1 :: eliminated) errors tl1
                   | uu____2443 ->
                       linear_check eliminated (hd1 :: errors) tl1)))
             in
          print_banner ();
          FStar_Options.set_option "z3rlimit"
            (FStar_Options.Int (Prims.parse_int "5"));
          (let res = linear_check [] [] all_labels  in
           FStar_Util.print_string "\n";
           FStar_All.pipe_right res (FStar_List.iter print_result))
  