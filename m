Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD8328A3E2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224107; cv=none; b=dmy5ceUSPf6MWcAPAq2gON6cQy5IaR1JgCYodF4ek4T/3qjf14nlpJ46PerjtkmMwUX/5jVN8iceglgQmtxy6iFa8Tt1rq/q8irtkANrwYzVV7etT4IWAmiPvd+hHjl/Ai3A2pSYRa6qk3thNhSRKwye5qDwTVZihSiUl/2rWLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224107; c=relaxed/simple;
	bh=wHEFyBTkm62XrtfmdTIT8TqWz7wYriDq2vcRhdzM6yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qptNHJjGaa8hD1cNjlHNSG8bnmuUXP5tBnQ8c6+dfN6JiVfhn3weNxUwS02OQbM2MrqAvlSb1XABqGryUeIxmHUb5rMX1zPPUT2OPxejlry2NrMHMopM68Um9Uu4I+7z2ZWq6QlNze8xOsDu+a0RLclrshWm4RI+QpE9SU1z6Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i65WNvjv; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i65WNvjv"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565McdQ030094;
	Fri, 6 Jun 2025 15:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=SV7xZ
	kJY28IXuHyUrf/x9Sg5EBI6i480a87R8ab46QA=; b=i65WNvjvvF7Oi0P+UDLq8
	G36Xrv+RvgirwnIvZ2EkeIs5qlXGM9Fxphpa30sn953xR8ZI+Gu0BfmvPxJcz8/V
	f3MVUNIjyda6H5cg3RGhJ8PRfIoxBSVCWI96D6+h6ZEgw7JvyrIkE7slKCkl2z5+
	fymmkJfZmaK4wNaA5ehAXXDz1o7oac67WcvXr88ePiWc9iiodIpqYk6h6KvojQJv
	fglsdaR+4epIbyLwMOncQqdXWQV+b8UT/wzg0ez9k5u8pcYiO4zZlAcIAQ5CFKoY
	b8O7GdaQuBCrCKBWdTtukbRSgEA3bR7ElT4gO2zrfx0wSmu1FZkGEsa0S88U84r0
	A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8e0873-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:35:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556ERKdx039260;
	Fri, 6 Jun 2025 15:34:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7desc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:34:59 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 556FYh3r015517;
	Fri, 6 Jun 2025 15:34:58 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-187-118.vpn.oracle.com [10.154.187.118])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46yr7des15-8;
	Fri, 06 Jun 2025 15:34:58 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC 07/13] objtool: Extract code to validate instruction from the validate branch loop
Date: Fri,  6 Jun 2025 17:34:34 +0200
Message-ID: <20250606153440.865808-8-alexandre.chartre@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250606153440.865808-1-alexandre.chartre@oracle.com>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060136
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=68430aa4 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=17Qteg5u5z3jqcDY0jQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNyBTYWx0ZWRfX0DtRWUUTquCu daM2sUul4gY/dAAx1TS5vjChGEb4jesYXr4SRyY+ytyoup57FFgNfeQE88tul4e5oqqfCoiOCv0 f3SYdwZ6uJvI0f/5YLsVOQCFQtJXTC2gePV1a20xboUDJqNKcS/V4IQyX+QHpYs4bZwDh2Q4kbQ
 BnVhiZNtKZIGNBI6RGjYJNcM1B8MnhkVT6CLT9A1v8bO4UGz+6eT6jX7xs9VvbwcLz2fgUulbGg OBMpFoaQUiYsZciu2xNkYSsUikfj5Zje/62uywnqw14D3CUwCTZFy6VUWujuHhP9X01X0GIuJ/l CiIf4JspYavrQkakWl1moiJAYMn7xMqvjyQMB4nTaKvhnwUGMk79ltLwAArOIB9PiX027C+stua
 /g+eAoAi2Ev+87maGm58qoVO32jz5yzTGKBGi5ae1Ihxwf1OjaA0G6HNoky8OdRzHZ9IeZrw
X-Proofpoint-ORIG-GUID: KUzkORfUHJgnMncUlwMCM2j67GaH3zf3
X-Proofpoint-GUID: KUzkORfUHJgnMncUlwMCM2j67GaH3zf3

The code to validate a branch loops through all instructions of the
branch and validate each instruction. Move the code to validate an
instruction to a separated function.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/check.c | 375 +++++++++++++++++++++++-------------------
 1 file changed, 208 insertions(+), 167 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 2c73c8d3515d..36ec08b8d654 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3527,6 +3527,11 @@ static bool skip_alt_group(struct instruction *insn)
 	return alt_insn->type == INSN_CLAC || alt_insn->type == INSN_STAC;
 }
 
+static int validate_insn(struct objtool_file *file, struct symbol *func,
+			 struct instruction *insn, struct insn_state *statep,
+			 struct instruction *prev_insn, struct instruction *next_insn,
+			 bool *validate_nextp);
+
 /*
  * Follow the branch starting at the given instruction, and recursively follow
  * any other branches (jumps).  Meanwhile, track the frame pointer state at
@@ -3536,10 +3541,9 @@ static bool skip_alt_group(struct instruction *insn)
 static int validate_branch(struct objtool_file *file, struct symbol *func,
 			   struct instruction *insn, struct insn_state state)
 {
-	struct alternative *alt;
 	struct instruction *next_insn, *prev_insn = NULL;
 	struct section *sec;
-	u8 visited;
+	bool validate_next;
 	int ret;
 
 	if (func && func->ignore)
@@ -3566,232 +3570,269 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 			return 1;
 		}
 
-		visited = VISITED_BRANCH << state.uaccess;
-		if (insn->visited & VISITED_BRANCH_MASK) {
-			if (!insn->hint && !insn_cfi_match(insn, &state.cfi))
-				return 1;
+		ret = validate_insn(file, func, insn, &state,
+				    prev_insn, next_insn,
+				    &validate_next);
+		if (!validate_next)
+			break;
 
-			if (insn->visited & visited)
+		if (!next_insn) {
+			if (state.cfi.cfa.base == CFI_UNDEFINED)
 				return 0;
-		} else {
-			nr_insns_visited++;
+			if (file->ignore_unreachables)
+				return 0;
+
+			WARN("%s%sunexpected end of section %s",
+			     func ? func->name : "", func ? "(): " : "",
+			     sec->name);
+			return 1;
 		}
 
-		if (state.noinstr)
-			state.instr += insn->instr;
+		prev_insn = insn;
+		insn = next_insn;
+	}
 
-		if (insn->hint) {
-			if (insn->restore) {
-				struct instruction *save_insn, *i;
+	return ret;
+}
 
-				i = insn;
-				save_insn = NULL;
+static int validate_insn(struct objtool_file *file, struct symbol *func,
+			 struct instruction *insn, struct insn_state *statep,
+			 struct instruction *prev_insn, struct instruction *next_insn,
+			 bool *validate_nextp)
+{
+	struct alternative *alt;
+	u8 visited;
+	int ret;
 
-				sym_for_each_insn_continue_reverse(file, func, i) {
-					if (i->save) {
-						save_insn = i;
-						break;
-					}
-				}
+	/*
+	 * Indicate that, by default, the calling function should not
+	 * validate the next instruction and validation should be
+	 * stopped. That way this function can stop validation by just
+	 * returning at any point before reaching the end of the function.
+	 *
+	 * If the end of this function is reached then that means that the
+	 * validation should continue and the caller should validate the
+	 * next instruction, so *validate_nextp will be set to true at
+	 * that point.
+	 */
+	*validate_nextp = false;
 
-				if (!save_insn) {
-					WARN_INSN(insn, "no corresponding CFI save for CFI restore");
-					return 1;
-				}
+	visited = VISITED_BRANCH << statep->uaccess;
+	if (insn->visited & VISITED_BRANCH_MASK) {
+		if (!insn->hint && !insn_cfi_match(insn, &statep->cfi))
+			return 1;
 
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
+		if (insn->visited & visited)
+			return 0;
+	} else {
+		nr_insns_visited++;
+	}
 
-					WARN_INSN(insn, "objtool isn't smart enough to handle this CFI save/restore combo");
-					return 1;
-				}
+	if (statep->noinstr)
+		statep->instr += insn->instr;
 
-				insn->cfi = save_insn->cfi;
-				nr_cfi_reused++;
-			}
+	if (insn->hint) {
+		if (insn->restore) {
+			struct instruction *save_insn, *i;
 
-			state.cfi = *insn->cfi;
-		} else {
-			/* XXX track if we actually changed state.cfi */
+			i = insn;
+			save_insn = NULL;
 
-			if (prev_insn && !cficmp(prev_insn->cfi, &state.cfi)) {
-				insn->cfi = prev_insn->cfi;
-				nr_cfi_reused++;
-			} else {
-				insn->cfi = cfi_hash_find_or_add(&state.cfi);
+			sym_for_each_insn_continue_reverse(file, func, i) {
+				if (i->save) {
+					save_insn = i;
+					break;
+				}
 			}
-		}
 
-		insn->visited |= visited;
+			if (!save_insn) {
+				WARN_INSN(insn, "no corresponding CFI save for CFI restore");
+				return 1;
+			}
 
-		if (propagate_alt_cfi(file, insn))
-			return 1;
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
 
-		if (insn->alts) {
-			for (alt = insn->alts; alt; alt = alt->next) {
-				ret = validate_branch(file, func, alt->insn, state);
-				if (ret) {
-					BT_INSN(insn, "(alt)");
-					return ret;
-				}
+				WARN_INSN(insn, "objtool isn't smart enough to handle this CFI save/restore combo");
+				return 1;
 			}
+
+			insn->cfi = save_insn->cfi;
+			nr_cfi_reused++;
 		}
 
-		if (skip_alt_group(insn))
-			return 0;
+		statep->cfi = *insn->cfi;
+	} else {
+		/* XXX track if we actually changed statep->cfi */
 
-		if (handle_insn_ops(insn, next_insn, &state))
-			return 1;
+		if (prev_insn && !cficmp(prev_insn->cfi, &statep->cfi)) {
+			insn->cfi = prev_insn->cfi;
+			nr_cfi_reused++;
+		} else {
+			insn->cfi = cfi_hash_find_or_add(&statep->cfi);
+		}
+	}
 
-		switch (insn->type) {
+	insn->visited |= visited;
 
-		case INSN_RETURN:
-			return validate_return(func, insn, &state);
+	if (propagate_alt_cfi(file, insn))
+		return 1;
 
-		case INSN_CALL:
-		case INSN_CALL_DYNAMIC:
-			ret = validate_call(file, insn, &state);
-			if (ret)
+	if (insn->alts) {
+		for (alt = insn->alts; alt; alt = alt->next) {
+			ret = validate_branch(file, func, alt->insn, *statep);
+			if (ret) {
+				BT_INSN(insn, "(alt)");
 				return ret;
-
-			if (opts.stackval && func && !is_special_call(insn) &&
-			    !has_valid_stack_frame(&state)) {
-				WARN_INSN(insn, "call without frame pointer save/setup");
-				return 1;
 			}
+		}
+	}
 
-			break;
-
-		case INSN_JUMP_CONDITIONAL:
-		case INSN_JUMP_UNCONDITIONAL:
-			if (is_sibling_call(insn)) {
-				ret = validate_sibling_call(file, insn, &state);
-				if (ret)
-					return ret;
-
-			} else if (insn->jump_dest) {
-				ret = validate_branch(file, func,
-						      insn->jump_dest, state);
-				if (ret) {
-					BT_INSN(insn, "(branch)");
-					return ret;
-				}
-			}
+	if (skip_alt_group(insn))
+		return 0;
 
-			if (insn->type == INSN_JUMP_UNCONDITIONAL)
-				return 0;
+	if (handle_insn_ops(insn, next_insn, statep))
+		return 1;
 
-			break;
+	switch (insn->type) {
 
-		case INSN_JUMP_DYNAMIC:
-		case INSN_JUMP_DYNAMIC_CONDITIONAL:
-			if (is_sibling_call(insn)) {
-				ret = validate_sibling_call(file, insn, &state);
-				if (ret)
-					return ret;
-			}
+	case INSN_RETURN:
+		return validate_return(func, insn, statep);
 
-			if (insn->type == INSN_JUMP_DYNAMIC)
-				return 0;
+	case INSN_CALL:
+	case INSN_CALL_DYNAMIC:
+		ret = validate_call(file, insn, statep);
+		if (ret)
+			return ret;
 
-			break;
+		if (opts.stackval && func && !is_special_call(insn) &&
+		    !has_valid_stack_frame(statep)) {
+			WARN_INSN(insn, "call without frame pointer save/setup");
+			return 1;
+		}
 
-		case INSN_SYSCALL:
-			if (func && (!next_insn || !next_insn->hint)) {
-				WARN_INSN(insn, "unsupported instruction in callable function");
-				return 1;
-			}
+		break;
 
-			break;
+	case INSN_JUMP_CONDITIONAL:
+	case INSN_JUMP_UNCONDITIONAL:
+		if (is_sibling_call(insn)) {
+			ret = validate_sibling_call(file, insn, statep);
+			if (ret)
+				return ret;
 
-		case INSN_SYSRET:
-			if (func && (!next_insn || !next_insn->hint)) {
-				WARN_INSN(insn, "unsupported instruction in callable function");
-				return 1;
+		} else if (insn->jump_dest) {
+			ret = validate_branch(file, func,
+					      insn->jump_dest, *statep);
+			if (ret) {
+				BT_INSN(insn, "(branch)");
+				return ret;
 			}
+		}
 
+		if (insn->type == INSN_JUMP_UNCONDITIONAL)
 			return 0;
 
-		case INSN_STAC:
-			if (!opts.uaccess)
-				break;
+		break;
 
-			if (state.uaccess) {
-				WARN_INSN(insn, "recursive UACCESS enable");
-				return 1;
-			}
+	case INSN_JUMP_DYNAMIC:
+	case INSN_JUMP_DYNAMIC_CONDITIONAL:
+		if (is_sibling_call(insn)) {
+			ret = validate_sibling_call(file, insn, statep);
+			if (ret)
+				return ret;
+		}
 
-			state.uaccess = true;
-			break;
+		if (insn->type == INSN_JUMP_DYNAMIC)
+			return 0;
 
-		case INSN_CLAC:
-			if (!opts.uaccess)
-				break;
+		break;
 
-			if (!state.uaccess && func) {
-				WARN_INSN(insn, "redundant UACCESS disable");
-				return 1;
-			}
+	case INSN_SYSCALL:
+		if (func && (!next_insn || !next_insn->hint)) {
+			WARN_INSN(insn, "unsupported instruction in callable function");
+			return 1;
+		}
 
-			if (func_uaccess_safe(func) && !state.uaccess_stack) {
-				WARN_INSN(insn, "UACCESS-safe disables UACCESS");
-				return 1;
-			}
+		break;
 
-			state.uaccess = false;
-			break;
+	case INSN_SYSRET:
+		if (func && (!next_insn || !next_insn->hint)) {
+			WARN_INSN(insn, "unsupported instruction in callable function");
+			return 1;
+		}
 
-		case INSN_STD:
-			if (state.df) {
-				WARN_INSN(insn, "recursive STD");
-				return 1;
-			}
+		return 0;
 
-			state.df = true;
+	case INSN_STAC:
+		if (!opts.uaccess)
 			break;
 
-		case INSN_CLD:
-			if (!state.df && func) {
-				WARN_INSN(insn, "redundant CLD");
-				return 1;
-			}
+		if (statep->uaccess) {
+			WARN_INSN(insn, "recursive UACCESS enable");
+			return 1;
+		}
 
-			state.df = false;
-			break;
+		statep->uaccess = true;
+		break;
 
-		default:
+	case INSN_CLAC:
+		if (!opts.uaccess)
 			break;
+
+		if (!statep->uaccess && func) {
+			WARN_INSN(insn, "redundant UACCESS disable");
+			return 1;
 		}
 
-		if (insn->dead_end)
-			return 0;
+		if (func_uaccess_safe(func) && !statep->uaccess_stack) {
+			WARN_INSN(insn, "UACCESS-safe disables UACCESS");
+			return 1;
+		}
 
-		if (!next_insn) {
-			if (state.cfi.cfa.base == CFI_UNDEFINED)
-				return 0;
-			if (file->ignore_unreachables)
-				return 0;
+		statep->uaccess = false;
+		break;
 
-			WARN("%s%sunexpected end of section %s",
-			     func ? func->name : "", func ? "(): " : "",
-			     sec->name);
+	case INSN_STD:
+		if (statep->df) {
+			WARN_INSN(insn, "recursive STD");
 			return 1;
 		}
 
-		prev_insn = insn;
-		insn = next_insn;
+		statep->df = true;
+		break;
+
+	case INSN_CLD:
+		if (!statep->df && func) {
+			WARN_INSN(insn, "redundant CLD");
+			return 1;
+		}
+
+		statep->df = false;
+		break;
+
+	default:
+		break;
 	}
 
+	if (insn->dead_end)
+		return 0;
+
+	/*
+	 * Indicate that the caller should validate the next
+	 * instruction and continue the validation.
+	 */
+	*validate_nextp = true;
+
 	return 0;
 }
 
-- 
2.43.5

