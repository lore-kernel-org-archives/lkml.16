Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75512278753
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345041; cv=none; b=b6JxprnHH1xaldLAjAIcY5E1CVaKs/4oAQEc/M6USbm2xHkPBqOKMf+wAu8FRZpr+qmZFVJ1AyzJodob0QUBq8gtvvD3/PPSY2sGRRxd+/VzQYBBHG4zyb8tB9TcEN51CahTbpgrzrjpPm3651N/eU+fdtHMHAdNi6O7qxKXklI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345041; c=relaxed/simple;
	bh=8MQgTgbyU7AhoO9IKV6g0zC+wuDyROfOHHLDLTVvPTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q8A6MAPSyYbvTkhIu8D1vPgq3i8nj3+uNiaxFfDbn7td3fPxggs8sTl9MEH/Vyu1SHf87J03d6gBm+Sgdio5rhhqVNP/1QGvK25bp4HV5zPF2i/sCGMyeb8vg4PzcniNUzkmcPlYwmp9orCu7uZC3bvRRpHIjP2HaOtjLip062A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R6egBkkl; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R6egBkkl"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMa4L029324;
	Thu, 19 Jun 2025 14:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=QVIur
	kUasTY4ql6e6cGMyBpP2U5j7bQgQX8Qgd4u2eg=; b=R6egBkklL1bzpwKn3C78T
	gKztA+SG8yGHTaXnUMKdq3rPs87WF8YbDRqJkU1DEKCeMy+PCcu9soGoX7z1lH/9
	8uFN3ohgjVPgYzC72eLzvp0y+JZ8JAOrEoipTeMWaAsgO8dRIsDPaN46YNCtNy/5
	F6mybWFxYVDRRlZguP0zEK9JpN2YChTpExyrIoXBRebrtD6FxEdg4nC8FJWvA7Sj
	EkKF3YKFJiO+ncCiynCco4eUIUIjsvV4M11adRd4ijWMDnDqWX98zD+drcKwiJuP
	Ra7pnax1UuIg537gUFw9dWLPPLi4aqy7rvkQiQ9hvBt5SpIKUv3ZhyEWGd0KsUiE
	w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xwjxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDPoSx022754;
	Thu, 19 Jun 2025 14:57:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8e0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:11 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0JR008257;
	Thu, 19 Jun 2025 14:57:11 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-10;
	Thu, 19 Jun 2025 14:57:11 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 09/17] objtool: Extract code to validate instruction from the validate branch loop
Date: Thu, 19 Jun 2025 16:56:51 +0200
Message-ID: <20250619145659.1377970-10-alexandre.chartre@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250619145659.1377970-1-alexandre.chartre@oracle.com>
References: <20250619145659.1377970-1-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190124
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfXykJoHnndy9e1 nUEdLB1yvaeVFcCpGNNE4Q6dqTdhIMLpjYh16Jo8pkssfSI300yZ3HsDZ3XjIBBIye7XDJ3Tkfv vrlONMDKySEifxH7X3uODJ27kCfsPSJiFRXI7aPWMl9jkJNsvgm3oIAnf04qatecwvVAaNE9hGP
 GH+l/fLdZ5edCUltSLhIWylsU1r1DTnryG6ibu54P7zIn3q7RGJe5IbKPZyTyfofBJgALEn4j+a b8PemYhbOGT2WnumgYCbpOvG0n3KEGLvFWFah1Ms4GLl/8e/4YJxpZbsA8Ah/fDyy1q4V27Ejdk NObdD5Zy6ztvuC3fdvmGdiOdkRwyeZIYROle8/5wyNJaBQHjJfOOMz/HFU6Oqu8KewTZ9sSVP32
 25UhOoyshpxM2HhBvFBb81iLXTtgZqGoy2t2Qk0BYM4Il2SRLaqKpWTNVNbz+fM47sIqC31r
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=68542549 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=45N9rFkX92oTsxCXvtEA:9 cc=ntf awl=host:13207
X-Proofpoint-GUID: jxs3MGk_BR9QfmYazvPPzN73sSSFv-fQ
X-Proofpoint-ORIG-GUID: jxs3MGk_BR9QfmYazvPPzN73sSSFv-fQ

The code to validate a branch loops through all instructions of the
branch and validate each instruction. Move the code to validate an
instruction to a separated function.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/check.c | 388 ++++++++++++++++++++++--------------------
 1 file changed, 206 insertions(+), 182 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index beaafa1f0323..947fe57e9a6d 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3528,254 +3528,278 @@ static bool skip_alt_group(struct instruction *insn)
 	return alt_insn->type == INSN_CLAC || alt_insn->type == INSN_STAC;
 }
 
-/*
- * Follow the branch starting at the given instruction, and recursively follow
- * any other branches (jumps).  Meanwhile, track the frame pointer state at
- * each instruction and validate all the rules described in
- * tools/objtool/Documentation/objtool.txt.
- */
 static int validate_branch(struct objtool_file *file, struct symbol *func,
-			   struct instruction *insn, struct insn_state state)
+			   struct instruction *insn, struct insn_state state);
+
+static int validate_insn(struct objtool_file *file, struct symbol *func,
+			 struct instruction *insn, struct insn_state *statep,
+			 struct instruction *prev_insn, struct instruction *next_insn,
+			 bool *dead_end)
 {
 	struct alternative *alt;
-	struct instruction *next_insn, *prev_insn = NULL;
-	struct section *sec;
 	u8 visited;
 	int ret;
 
-	if (func && func->ignore)
-		return 0;
+	/*
+	 * Any returns before the end of this function are effectively dead
+	 * ends, i.e. validate_branch() has reached the end of the branch.
+	 */
+	*dead_end = true;
 
-	sec = insn->sec;
+	visited = VISITED_BRANCH << statep->uaccess;
+	if (insn->visited & VISITED_BRANCH_MASK) {
+		if (!insn->hint && !insn_cfi_match(insn, &statep->cfi))
+			return 1;
 
-	while (1) {
-		next_insn = next_insn_to_validate(file, insn);
+		if (insn->visited & visited)
+			return 0;
+	} else {
+		nr_insns_visited++;
+	}
 
-		if (func && insn_func(insn) && func != insn_func(insn)->pfunc) {
-			/* Ignore KCFI type preambles, which always fall through */
-			if (!strncmp(func->name, "__cfi_", 6) ||
-			    !strncmp(func->name, "__pfx_", 6))
-				return 0;
+	if (statep->noinstr)
+		statep->instr += insn->instr;
 
-			if (file->ignore_unreachables)
-				return 0;
+	if (insn->hint) {
+		if (insn->restore) {
+			struct instruction *save_insn, *i;
 
-			WARN("%s() falls through to next function %s()",
-			     func->name, insn_func(insn)->name);
-			func->warned = 1;
+			i = insn;
+			save_insn = NULL;
 
-			return 1;
-		}
+			sym_for_each_insn_continue_reverse(file, func, i) {
+				if (i->save) {
+					save_insn = i;
+					break;
+				}
+			}
 
-		visited = VISITED_BRANCH << state.uaccess;
-		if (insn->visited & VISITED_BRANCH_MASK) {
-			if (!insn->hint && !insn_cfi_match(insn, &state.cfi))
+			if (!save_insn) {
+				WARN_INSN(insn, "no corresponding CFI save for CFI restore");
 				return 1;
+			}
 
-			if (insn->visited & visited)
-				return 0;
-		} else {
-			nr_insns_visited++;
+			if (!save_insn->visited) {
+				/*
+				 * If the restore hint insn is at the
+				 * beginning of a basic block and was
+				 * branched to from elsewhere, and the
+				 * save insn hasn't been visited yet,
+				 * defer following this branch for now.
+				 * It will be seen later via the
+				 * straight-line path.
+				 */
+				if (!prev_insn)
+					return 0;
+
+				WARN_INSN(insn, "objtool isn't smart enough to handle this CFI save/restore combo");
+				return 1;
+			}
+
+			insn->cfi = save_insn->cfi;
+			nr_cfi_reused++;
 		}
 
-		if (state.noinstr)
-			state.instr += insn->instr;
+		statep->cfi = *insn->cfi;
+	} else {
+		/* XXX track if we actually changed statep->cfi */
 
-		if (insn->hint) {
-			if (insn->restore) {
-				struct instruction *save_insn, *i;
+		if (prev_insn && !cficmp(prev_insn->cfi, &statep->cfi)) {
+			insn->cfi = prev_insn->cfi;
+			nr_cfi_reused++;
+		} else {
+			insn->cfi = cfi_hash_find_or_add(&statep->cfi);
+		}
+	}
 
-				i = insn;
-				save_insn = NULL;
+	insn->visited |= visited;
 
-				sym_for_each_insn_continue_reverse(file, func, i) {
-					if (i->save) {
-						save_insn = i;
-						break;
-					}
-				}
+	if (propagate_alt_cfi(file, insn))
+		return 1;
 
-				if (!save_insn) {
-					WARN_INSN(insn, "no corresponding CFI save for CFI restore");
-					return 1;
-				}
+	if (insn->alts) {
+		for (alt = insn->alts; alt; alt = alt->next) {
+			ret = validate_branch(file, func, alt->insn, *statep);
+			if (ret) {
+				BT_INSN(insn, "(alt)");
+				return ret;
+			}
+		}
+	}
 
-				if (!save_insn->visited) {
-					/*
-					 * If the restore hint insn is at the
-					 * beginning of a basic block and was
-					 * branched to from elsewhere, and the
-					 * save insn hasn't been visited yet,
-					 * defer following this branch for now.
-					 * It will be seen later via the
-					 * straight-line path.
-					 */
-					if (!prev_insn)
-						return 0;
+	if (skip_alt_group(insn))
+		return 0;
 
-					WARN_INSN(insn, "objtool isn't smart enough to handle this CFI save/restore combo");
-					return 1;
-				}
+	if (handle_insn_ops(insn, next_insn, statep))
+		return 1;
 
-				insn->cfi = save_insn->cfi;
-				nr_cfi_reused++;
-			}
+	switch (insn->type) {
 
-			state.cfi = *insn->cfi;
-		} else {
-			/* XXX track if we actually changed state.cfi */
+	case INSN_RETURN:
+		return validate_return(func, insn, statep);
 
-			if (prev_insn && !cficmp(prev_insn->cfi, &state.cfi)) {
-				insn->cfi = prev_insn->cfi;
-				nr_cfi_reused++;
-			} else {
-				insn->cfi = cfi_hash_find_or_add(&state.cfi);
-			}
+	case INSN_CALL:
+	case INSN_CALL_DYNAMIC:
+		ret = validate_call(file, insn, statep);
+		if (ret)
+			return ret;
+
+		if (opts.stackval && func && !is_special_call(insn) &&
+		    !has_valid_stack_frame(statep)) {
+			WARN_INSN(insn, "call without frame pointer save/setup");
+			return 1;
 		}
 
-		insn->visited |= visited;
+		break;
 
-		if (propagate_alt_cfi(file, insn))
-			return 1;
+	case INSN_JUMP_CONDITIONAL:
+	case INSN_JUMP_UNCONDITIONAL:
+		if (is_sibling_call(insn)) {
+			ret = validate_sibling_call(file, insn, statep);
+			if (ret)
+				return ret;
 
-		if (insn->alts) {
-			for (alt = insn->alts; alt; alt = alt->next) {
-				ret = validate_branch(file, func, alt->insn, state);
-				if (ret) {
-					BT_INSN(insn, "(alt)");
-					return ret;
-				}
+		} else if (insn->jump_dest) {
+			ret = validate_branch(file, func,
+					      insn->jump_dest, *statep);
+			if (ret) {
+				BT_INSN(insn, "(branch)");
+				return ret;
 			}
 		}
 
-		if (skip_alt_group(insn))
+		if (insn->type == INSN_JUMP_UNCONDITIONAL)
 			return 0;
 
-		if (handle_insn_ops(insn, next_insn, &state))
-			return 1;
-
-		switch (insn->type) {
-
-		case INSN_RETURN:
-			return validate_return(func, insn, &state);
+		break;
 
-		case INSN_CALL:
-		case INSN_CALL_DYNAMIC:
-			ret = validate_call(file, insn, &state);
+	case INSN_JUMP_DYNAMIC:
+	case INSN_JUMP_DYNAMIC_CONDITIONAL:
+		if (is_sibling_call(insn)) {
+			ret = validate_sibling_call(file, insn, statep);
 			if (ret)
 				return ret;
+		}
 
-			if (opts.stackval && func && !is_special_call(insn) &&
-			    !has_valid_stack_frame(&state)) {
-				WARN_INSN(insn, "call without frame pointer save/setup");
-				return 1;
-			}
+		if (insn->type == INSN_JUMP_DYNAMIC)
+			return 0;
 
-			break;
+		break;
 
-		case INSN_JUMP_CONDITIONAL:
-		case INSN_JUMP_UNCONDITIONAL:
-			if (is_sibling_call(insn)) {
-				ret = validate_sibling_call(file, insn, &state);
-				if (ret)
-					return ret;
+	case INSN_SYSCALL:
+		if (func && (!next_insn || !next_insn->hint)) {
+			WARN_INSN(insn, "unsupported instruction in callable function");
+			return 1;
+		}
 
-			} else if (insn->jump_dest) {
-				ret = validate_branch(file, func,
-						      insn->jump_dest, state);
-				if (ret) {
-					BT_INSN(insn, "(branch)");
-					return ret;
-				}
-			}
+		break;
 
-			if (insn->type == INSN_JUMP_UNCONDITIONAL)
-				return 0;
+	case INSN_SYSRET:
+		if (func && (!next_insn || !next_insn->hint)) {
+			WARN_INSN(insn, "unsupported instruction in callable function");
+			return 1;
+		}
 
+		return 0;
+
+	case INSN_STAC:
+		if (!opts.uaccess)
 			break;
 
-		case INSN_JUMP_DYNAMIC:
-		case INSN_JUMP_DYNAMIC_CONDITIONAL:
-			if (is_sibling_call(insn)) {
-				ret = validate_sibling_call(file, insn, &state);
-				if (ret)
-					return ret;
-			}
+		if (statep->uaccess) {
+			WARN_INSN(insn, "recursive UACCESS enable");
+			return 1;
+		}
 
-			if (insn->type == INSN_JUMP_DYNAMIC)
-				return 0;
+		statep->uaccess = true;
+		break;
 
+	case INSN_CLAC:
+		if (!opts.uaccess)
 			break;
 
-		case INSN_SYSCALL:
-			if (func && (!next_insn || !next_insn->hint)) {
-				WARN_INSN(insn, "unsupported instruction in callable function");
-				return 1;
-			}
+		if (!statep->uaccess && func) {
+			WARN_INSN(insn, "redundant UACCESS disable");
+			return 1;
+		}
 
-			break;
+		if (func_uaccess_safe(func) && !statep->uaccess_stack) {
+			WARN_INSN(insn, "UACCESS-safe disables UACCESS");
+			return 1;
+		}
 
-		case INSN_SYSRET:
-			if (func && (!next_insn || !next_insn->hint)) {
-				WARN_INSN(insn, "unsupported instruction in callable function");
-				return 1;
-			}
+		statep->uaccess = false;
+		break;
 
-			return 0;
+	case INSN_STD:
+		if (statep->df) {
+			WARN_INSN(insn, "recursive STD");
+			return 1;
+		}
 
-		case INSN_STAC:
-			if (!opts.uaccess)
-				break;
+		statep->df = true;
+		break;
 
-			if (state.uaccess) {
-				WARN_INSN(insn, "recursive UACCESS enable");
-				return 1;
-			}
+	case INSN_CLD:
+		if (!statep->df && func) {
+			WARN_INSN(insn, "redundant CLD");
+			return 1;
+		}
 
-			state.uaccess = true;
-			break;
+		statep->df = false;
+		break;
 
-		case INSN_CLAC:
-			if (!opts.uaccess)
-				break;
+	default:
+		break;
+	}
 
-			if (!state.uaccess && func) {
-				WARN_INSN(insn, "redundant UACCESS disable");
-				return 1;
-			}
+	*dead_end = insn->dead_end;
 
-			if (func_uaccess_safe(func) && !state.uaccess_stack) {
-				WARN_INSN(insn, "UACCESS-safe disables UACCESS");
-				return 1;
-			}
+	return 0;
+}
 
-			state.uaccess = false;
-			break;
+/*
+ * Follow the branch starting at the given instruction, and recursively follow
+ * any other branches (jumps).  Meanwhile, track the frame pointer state at
+ * each instruction and validate all the rules described in
+ * tools/objtool/Documentation/objtool.txt.
+ */
+static int validate_branch(struct objtool_file *file, struct symbol *func,
+			   struct instruction *insn, struct insn_state state)
+{
+	struct instruction *next_insn, *prev_insn = NULL;
+	struct section *sec;
+	bool dead_end;
+	int ret;
 
-		case INSN_STD:
-			if (state.df) {
-				WARN_INSN(insn, "recursive STD");
-				return 1;
-			}
+	if (func && func->ignore)
+		return 0;
 
-			state.df = true;
-			break;
+	sec = insn->sec;
 
-		case INSN_CLD:
-			if (!state.df && func) {
-				WARN_INSN(insn, "redundant CLD");
-				return 1;
-			}
+	while (1) {
+		next_insn = next_insn_to_validate(file, insn);
 
-			state.df = false;
-			break;
+		if (func && insn_func(insn) && func != insn_func(insn)->pfunc) {
+			/* Ignore KCFI type preambles, which always fall through */
+			if (!strncmp(func->name, "__cfi_", 6) ||
+			    !strncmp(func->name, "__pfx_", 6))
+				return 0;
 
-		default:
-			break;
+			if (file->ignore_unreachables)
+				return 0;
+
+			WARN("%s() falls through to next function %s()",
+			     func->name, insn_func(insn)->name);
+			func->warned = 1;
+
+			return 1;
 		}
 
-		if (insn->dead_end)
-			return 0;
+		ret = validate_insn(file, func, insn, &state, prev_insn, next_insn,
+				    &dead_end);
+		if (dead_end)
+			break;
 
 		if (!next_insn) {
 			if (state.cfi.cfa.base == CFI_UNDEFINED)
@@ -3793,7 +3817,7 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 		insn = next_insn;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int validate_unwind_hint(struct objtool_file *file,
-- 
2.43.5

