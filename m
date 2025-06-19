Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCBA2BD003
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345048; cv=none; b=sCJfeXUILbaAbKqJJgBzcchzdmxtrNPozAHmEptZ7TklShpvSAKvH/bLKH7p4Ni8W7OAw36JVAXIpaPgdLYQ0/AsJW00LhPdae9El36VrTSZUrzpQX05TNkjZgCJo3/OWFjw06WTnu5ioLhMr6zKp0dfjBRX4PTXa8vI72rTeEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345048; c=relaxed/simple;
	bh=xMgWuJgjZLKWrY1bhHBTjYqkbcAG5+bU5JiUnFxtCb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ASZo2kum9lTALYafdvYD+sbWucEHebHtz8V6xRvbRDb7w8zaIyeHRR77nWWrK9uYbmaLiZ/aMloXPa1s4IwfSenmCggdIMGV0g5Xd5VMWo+hl7kyrcqt37KmmwLUsFael8sLUHWHIH4vz7iJ67B5YVt+s9ItGhk/904JpbrPN78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VscYI59D; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VscYI59D"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMa4N029324;
	Thu, 19 Jun 2025 14:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=kfy2u
	1goXYdZwWeTcMaxTAxBZxMAdwIyKd3O6MkyOvw=; b=VscYI59De250uU29zaxyB
	12ujQIMUduhuzBBvPrJYbSeVycswrGm/jAd/YDcPOzh3kPs1zHnuNQyte2nhTfwn
	ZpAVz3ccoWpcE6mXvZRmUHVdNdfWr2dO8g2tf8zxdzTET7ZtsI1BmaMUC+OwVWS6
	c+mKiWQNxCnG284JXQ9OT08H/4iNoxaewmjcyuF4Ytb7bYT3ByOGhOcM5JCVBkub
	CgpWbnFmo1Q9SFiLwJLnP45YIdY24+0zDg5SNfeVmPreGtsFa5oR9+7puaeWpClZ
	ksr97587gFnJpGF9/foZ5hIsljoDCWkdeuhLn3QtRW7UWeMOYVBP5fVYTkapsJcY
	Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xwjy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDNbXB022764;
	Thu, 19 Jun 2025 14:57:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8e7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:21 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0Jh008257;
	Thu, 19 Jun 2025 14:57:21 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-18;
	Thu, 19 Jun 2025 14:57:21 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 17/17] objtool: Disassemble all alternatives when using --disas
Date: Thu, 19 Jun 2025 16:56:59 +0200
Message-ID: <20250619145659.1377970-18-alexandre.chartre@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfXyYnicvW0KAt0 ZtNIvMXbyiNFByzyDWmyjKq3nGMouo51l0e64eCXn1nlWPLHpZZv9zL+wUzOu7I+lk9nFbWnJNr TruNkZho8PooQafNhK8ehYeMHxIkvRB8oj8uh3GptjvyxQzAAj975MWSvzGoyXk21DkZ23KJbpQ
 nIdjd6fLMcFLp02CmYMqIYifmOudyzHVr/zS8h+X+S+CGxVbtHgfSDBBaFZjkrsZvjMyDTan34V RoknFEfq8kelOMre3cqt2hkpqjHHXjHnerncWfe8F3Appk8oGcitEZRIn79BPZnnbqiEL2kNA11 1YoJuYHu0Voox0YxwZGadkqOOaC/mpIH+4k6FcyVfWAyeHv+M1Rk/g+iKgTiJzxEQCr70BB3qN8
 ajcefqMK+QnoQdBsYy3B0/3x8HkDFs4iH8QtHa1n8++wk8HMRFlspBmvnoGDrEjRQfVGKQnx
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=68542553 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=HvF_JEnCvTAsiACKIaMA:9 cc=ntf awl=host:13207
X-Proofpoint-GUID: _vVKwxYErInCcwWgDQeJ77wj7YcilGg-
X-Proofpoint-ORIG-GUID: _vVKwxYErInCcwWgDQeJ77wj7YcilGg-

When using the --disas action, disassemble all code alternatives
instead of only the default alternative.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/check.c                 |   8 --
 tools/objtool/disas.c                 | 152 +++++++++++++++++++++++++-
 tools/objtool/include/objtool/check.h |   8 ++
 3 files changed, 154 insertions(+), 14 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index c7a70d47f104..fa66c8c6bf21 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -25,11 +25,6 @@
 #include <linux/static_call_types.h>
 #include <linux/string.h>
 
-struct alternative {
-	struct alternative *next;
-	struct instruction *insn;
-};
-
 static unsigned long nr_cfi, nr_cfi_reused, nr_cfi_cache;
 
 static struct cfi_init_state initial_func_cfi;
@@ -131,9 +126,6 @@ static struct instruction *prev_insn_same_sym(struct objtool_file *file,
 	     insn && insn->offset >= sym->offset;			\
 	     insn = prev_insn_same_sec(file, insn))
 
-#define sec_for_each_insn_from(file, insn)				\
-	for (; insn; insn = next_insn_same_sec(file, insn))
-
 #define sec_for_each_insn_continue(file, insn)				\
 	for (insn = next_insn_same_sec(file, insn); insn;		\
 	     insn = next_insn_same_sec(file, insn))
diff --git a/tools/objtool/disas.c b/tools/objtool/disas.c
index 97d506afdf45..9c202feee493 100644
--- a/tools/objtool/disas.c
+++ b/tools/objtool/disas.c
@@ -266,6 +266,12 @@ char *disas_result(struct disas_context *dctx)
 #define DISAS_INSN_OFFSET_SPACE		10
 #define DISAS_INSN_SPACE		60
 
+#define DISAS_PRINFO(insn, depth, format, ...)				\
+	disas_print_info(stdout, insn, depth, format "\n", ##__VA_ARGS__)
+
+#define DISAS_PRINSN(dctx, insn, depth)			\
+	disas_print_insn(stdout, dctx, insn, depth, "\n")
+
 /*
  * Print a message in the instruction flow. If insn is not NULL then
  * the instruction address is printed in addition of the message,
@@ -345,6 +351,82 @@ void disas_print_insn(FILE *stream, struct disas_context *dctx,
 	va_end(args);
 }
 
+static void disas_group_alt(struct disas_context *dctx,
+			    struct instruction *orig_insn)
+{
+	struct instruction *insn;
+	struct alternative *alt;
+	struct symbol *func;
+	int i, count;
+	int alt_id;
+
+	func = orig_insn->sym;
+	alt_id = orig_insn->offset;
+
+	count = 0;
+	for (alt = orig_insn->alts; alt; alt = alt->next) {
+		if (!alt->insn->alt_group)
+			/* jump alternative */
+			continue;
+
+		if (func && alt->insn->sec == func->sec)
+			/* exception handler */
+			continue;
+
+		/* count group alternatives, including fake nop */
+		count++;
+	}
+
+	i = 1;
+	for (alt = orig_insn->alts; alt; alt = alt->next) {
+
+		if (!alt->insn->alt_group)
+			continue;
+
+		/*
+		 * If the alternative instruction is in the same section
+		 * as the original instruction then that's an exception
+		 * handling i.e. branch to the alternative instruction if
+		 * there is an exception.
+		 */
+		if (func && alt->insn->sec == func->sec) {
+			DISAS_PRINFO(NULL, 0,
+				    "<alternative.%x> exception handler - begin", alt_id);
+			DISAS_PRINFO(orig_insn, 1, "jmp    %lx <%s+0x%lx>",
+				    alt->insn->offset, func->name,
+				    alt->insn->offset - func->offset);
+			DISAS_PRINFO(NULL, 0,
+				    "<alternative.%x> exception handler - end", alt_id);
+			continue;
+		}
+
+		DISAS_PRINFO(NULL, 0,
+			    "<alternative.%x> %d/%d - begin", alt_id, i, count);
+
+		insn = alt->insn->alt_group->first_insn;
+
+		sec_for_each_insn_from(dctx->file, insn) {
+
+			if (insn->alts) {
+				DISAS_PRINFO(insn, 0,
+					     "alt group: ignore nested alternative (not supported)");
+			}
+
+			DISAS_PRINSN(dctx, insn, 1);
+
+			if (insn == insn->alt_group->last_insn ||
+			    insn == insn->alt_group->nop)
+				break;
+
+			insn = next_insn_same_sec(dctx->file, insn);
+		}
+
+		DISAS_PRINFO(NULL, 0,
+			    "<alternative.%x> %d/%d end", alt_id, i, count);
+		i++;
+	}
+}
+
 /*
  * Disassemble a single instruction. Return the size of the instruction.
  */
@@ -367,21 +449,79 @@ size_t disas_insn(struct disas_context *dctx, struct instruction *insn)
 	return disasm(insn->offset, &dctx->info);
 }
 
+static void disas_jump_alt(struct disas_context *dctx, struct instruction *insn)
+{
+	struct instruction *alt_insn;
+	struct symbol *func;
+	int alt_id;
+
+	func = insn->sym;
+	alt_id = insn->offset;
+
+	DISAS_PRINFO(NULL, 0, "<jump alternative.%x> default", alt_id);
+	DISAS_PRINSN(dctx, insn, 1);
+
+	alt_insn = insn->alts->insn;
+	if (!alt_insn) {
+		WARN_INSN(insn, "no jump alternative");
+		return;
+	}
+
+	DISAS_PRINFO(NULL, 0, "<jump alternative.%x> else", alt_id);
+
+	if (insn->type == INSN_NOP) {
+		DISAS_PRINFO(insn, 1, "jmp    %lx <%s+0x%lx>",
+			    alt_insn->offset, func->name,
+			    alt_insn->offset - func->offset);
+	} else {
+		DISAS_PRINFO(insn, 1, "nop%d", insn->len);
+	}
+
+	DISAS_PRINFO(NULL, 0, "<jump alternative.%x> end", alt_id);
+
+	if (insn->alts->next)
+		WARN_INSN(insn, "more than one jump alternatives\n");
+}
+
 /*
  * Disassemble a function.
  */
 static void disas_func(struct disas_context *dctx, struct symbol *func)
 {
+	struct instruction *alt = NULL;
 	struct instruction *insn;
-	size_t addr;
+	int alt_id = 0;
+	int depth = 0;
 
 	printf("%s:\n", func->name);
 	sym_for_each_insn(dctx->file, func, insn) {
-		addr = insn->offset;
-		disas_insn(dctx, insn);
-		printf(" %6lx:  %s+0x%-6lx      %s\n",
-		       addr, func->name, addr - func->offset,
-		       disas_result(dctx));
+
+		if (insn->alts) {
+			if (alt) {
+				DISAS_PRINFO(insn, 0,
+					     "alt default: ignore nested alternative (not supported)");
+			} else if (insn->alt_group) {
+				alt = insn;
+				alt_id = alt->offset;
+				DISAS_PRINFO(NULL, 0,
+					    "<alternative.%x> default - begin", alt_id);
+				depth = 1;
+			} else {
+				disas_jump_alt(dctx, insn);
+				continue;
+			}
+		}
+
+		DISAS_PRINSN(dctx, insn, depth);
+
+		if (alt && (alt->alt_group->last_insn == insn ||
+			    alt->alt_group->nop == insn)) {
+			DISAS_PRINFO(NULL, 0,
+				    "<alternative.%x> default - end", alt_id);
+			disas_group_alt(dctx, alt);
+			alt = NULL;
+			depth = 0;
+		}
 	}
 	printf("\n");
 }
diff --git a/tools/objtool/include/objtool/check.h b/tools/objtool/include/objtool/check.h
index e5f97acb6252..748ee7631021 100644
--- a/tools/objtool/include/objtool/check.h
+++ b/tools/objtool/include/objtool/check.h
@@ -38,6 +38,11 @@ struct alt_group {
 	bool ignore;
 };
 
+struct alternative {
+	struct alternative *next;
+	struct instruction *insn;
+};
+
 #define INSN_CHUNK_BITS		8
 #define INSN_CHUNK_SIZE		(1 << INSN_CHUNK_BITS)
 #define INSN_CHUNK_MAX		(INSN_CHUNK_SIZE - 1)
@@ -135,6 +140,9 @@ struct instruction *next_insn_same_sec(struct objtool_file *file, struct instruc
 	     insn && insn->sec == _sec;					\
 	     insn = next_insn_same_sec(file, insn))
 
+#define sec_for_each_insn_from(file, insn)				\
+	for (; insn; insn = next_insn_same_sec(file, insn))
+
 #define sym_for_each_insn(file, sym, insn)				\
 	for (insn = find_insn(file, sym->sec, sym->offset);		\
 	     insn && insn->offset < sym->offset + sym->len;		\
-- 
2.43.5

