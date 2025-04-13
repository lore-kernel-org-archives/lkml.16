Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072AE16C69F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 22:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744582082; cv=none; b=fR5cQxS4Ke5niBjqS2RmWDQbA/WntnP1mAagGq3VfbdGxQqREbf0C6QLI+wWVop/cSOC8EJNJRTIhqOYresPCGRDFHcmQMLu1RHFiWIVd21OJJ7gYiZKZzEHOIRFhfF6zE4dQ0UQeCzvs1t0LMNFL1KxGgH9vCg75dSr3yq4a2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744582082; c=relaxed/simple;
	bh=9XEvjOOUR80vQ13OFwqpfNLUp+qaiA3qMF/llcfOxvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FEyxqPj8O/QbCSVoH/JPzXsSPBr3dLfZ8mjgHEl2hOF20B6f0fmhXYougYq1u10rE2pcR1JGfs51izbpnWrvwlHVvnGpiAKtocqSTMWqfObEi5X5XykQk6IeHNo/O+I8epNKV1RbQFZ7+bfK1oBFjlKsk9Wm5aHT+xR4iuzRkmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mi/APvHW; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mi/APvHW"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2aeada833so720389266b.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 15:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744582078; x=1745186878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1xB1Q51aXxMI9KTktYED0Qw9Sy1HO0CoZeW1YCjncjA=;
        b=Mi/APvHWm8tzh65o/zNfknzPtXHR5/7kXcqbz8WWcU16PivLYk7/K2dMnORNaswvOl
         sbX2xKrMYdqnALwcFmjUOWX/fyNsggpQkNykt5L0ZVcxI2LYEpEzcyDBQBcvUJnJFZ90
         EF4mszixrXrMHZ+nMcAUYWO2zQdSAZpxbNicmca44TJ8o/F85ekubrKuGV/einYmdE5N
         YTKBUExBo7GP97i/VMFdyG5IbAjrtN5oXt1lgiYQ9yWNTxQOdKuSCsVmmiecL3IZNZFl
         ySF1S1SVAQZSk/jaxlU+qT32+lFkan9GKwYZj1lNG4YeRullloh7dv2Zm/tAjTKJ5oAS
         E4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744582078; x=1745186878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xB1Q51aXxMI9KTktYED0Qw9Sy1HO0CoZeW1YCjncjA=;
        b=M0kc1NFByexlawpM+CwD7DD5wNtNOYOEMQSMAyfpgvKFaZZUVYDf+IBTjYC52+d8qw
         WEwXKdMAQ5RXmKnBfSqdiktHuEJF/2p8PM76In8htERL5LCoVNWNVAS1PSMOJHYjVCvW
         BGRjNleQLEX5nNLWdLmWK886zUMEmTBN3i9CIo5ARtfudyh/BFEiK6BeDH2LuQ5nOo8L
         GMWmjr5OZ5Z5MUN1XB3uYgI4X66FZDLq/LJdTd5mUOmxKu63IT0NtCqj0rvJnM60W83e
         eeOQA+ZwMOS5BEtij8rSkUBAUYEzbPkOyX/yViBDsQZM1Ko4sCwSi1GxgFPctUjqaOYT
         PBgQ==
X-Gm-Message-State: AOJu0YwOwM0xGCNXRBKLEmGVxtZdhLgxnUs97bdk0sQydHjsvUtReP7X
	OLCHfw4f9KtEy4WLhp776gY6yG5cEDWCqDS36PSS9sJvDPtQIoujQPBf0Ptf
X-Gm-Gg: ASbGncvaHlipXrfXKQVR8saDW9tqseWaNgBLEPfjf5aeB8hGRDpm4o0Zm5C6GieSbsN
	pyfau2cX5W5AI5jhdXGebUsp38eVHWg1hszvIFNPOXWuf5YwFkUn9zWxqlhv3UT+587yz07VIEu
	kzUxcXzY4PNlZop3PmHLyrf8L9XcKbFbNgqRKCiNH3mw/1Q9N4NnUp5QYdAYesQVXzRDOp7XUnl
	4FfUNmnaBjclw3SCPeMw6Y3nQiXbNiwQyQB+UI/+LucbocYu1MhbI7haJOApD0MiCU1NNooC6+D
	FN+iaeWVhAvzcIHjtMtOdfkY8xFfalG9ql0xAtlmTY4bTl0EdA==
X-Google-Smtp-Source: AGHT+IGFWNTk5HuPE+EU/88SWwoANBbpjcDvr9r29K8lodKQJjy9icoThL4pySge5ni404fU3lyAzg==
X-Received: by 2002:a17:907:9805:b0:ac2:26a6:febf with SMTP id a640c23a62f3a-acabc48f077mr1114823366b.20.1744582078173;
        Sun, 13 Apr 2025 15:07:58 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4204sm793605466b.116.2025.04.13.15.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:07:57 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>
Subject: [PATCH] genksyms: Handle typeof_unqual keyword and __seg_{fs,gs} qualifiers
Date: Mon, 14 Apr 2025 00:07:34 +0200
Message-ID: <20250413220749.270704-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle typeof_unqual, __typeof_unqual and __typeof_unqual__ keywords
using TYPEOF_KEYW token in the same way as typeof keyword.

Also ignore x86 __seg_fs and __seg_gs named address space qualifiers
using X86_SEG_KEYW token in the same way as const, volatile or
restrict qualifiers.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Closes: https://lore.kernel.org/lkml/81a25a60-de78-43fb-b56a-131151e1c035@molgen.mpg.de/
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
---
 scripts/genksyms/keywords.c | 7 +++++++
 scripts/genksyms/parse.y    | 5 ++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/genksyms/keywords.c b/scripts/genksyms/keywords.c
index b85e0979a00c..ee1499d27061 100644
--- a/scripts/genksyms/keywords.c
+++ b/scripts/genksyms/keywords.c
@@ -17,6 +17,8 @@ static struct resword {
 	{ "__signed__", SIGNED_KEYW },
 	{ "__typeof", TYPEOF_KEYW },
 	{ "__typeof__", TYPEOF_KEYW },
+	{ "__typeof_unqual", TYPEOF_KEYW },
+	{ "__typeof_unqual__", TYPEOF_KEYW },
 	{ "__volatile", VOLATILE_KEYW },
 	{ "__volatile__", VOLATILE_KEYW },
 	{ "__builtin_va_list", VA_LIST_KEYW },
@@ -40,6 +42,10 @@ static struct resword {
 	// KAO. },
 	// { "attribute", ATTRIBUTE_KEYW },
 
+	// X86 named address space qualifiers
+	{ "__seg_gs", X86_SEG_KEYW },
+	{ "__seg_fs", X86_SEG_KEYW },
+
 	{ "auto", AUTO_KEYW },
 	{ "char", CHAR_KEYW },
 	{ "const", CONST_KEYW },
@@ -57,6 +63,7 @@ static struct resword {
 	{ "struct", STRUCT_KEYW },
 	{ "typedef", TYPEDEF_KEYW },
 	{ "typeof", TYPEOF_KEYW },
+	{ "typeof_unqual", TYPEOF_KEYW },
 	{ "union", UNION_KEYW },
 	{ "unsigned", UNSIGNED_KEYW },
 	{ "void", VOID_KEYW },
diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index ee600a804fa1..efdcf07c4eb6 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -91,6 +91,8 @@ static void record_compound(struct string_list **keyw,
 %token TYPEOF_KEYW
 %token VA_LIST_KEYW
 
+%token X86_SEG_KEYW
+
 %token EXPORT_SYMBOL_KEYW
 
 %token ASM_PHRASE
@@ -292,7 +294,8 @@ type_qualifier_seq:
 	;
 
 type_qualifier:
-	CONST_KEYW | VOLATILE_KEYW
+	X86_SEG_KEYW
+	| CONST_KEYW | VOLATILE_KEYW
 	| RESTRICT_KEYW
 		{ /* restrict has no effect in prototypes so ignore it */
 		  remove_node($1);
-- 
2.42.0

