Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0621E47A5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484172; cv=none; b=piEtHszoQPeKYiBgTeOWg/DuAOI6tfLaWea5xj/AvCCj964Pys3XkYbq+/ZvHIVYVKrzA8jBs+XAjPKmAMz9WlNAnG4022Kmh2fQ2LGDUZewm+ecAUDgyYSeOVpOvJvLjIl1p1ZrMrtBTYMnrD07hqtnmbDhpi+3zZtdehuIjBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484172; c=relaxed/simple;
	bh=O16/i8ImN1omRqIDkVizfBKxq029hgU/VoUr9M+AMV4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JrHRcK/IQFeIad4kqmPVzpE4FB0z1f37gR4BviBttrmz0xXZUmLlbo0fqzC9Zg/GFWlxU40qT1QX5JQSy/BPaDFgjmBDoIraaCRyEf0ezxWRDNcwZlFaLWEAxjtM7BKfXIHWqjCsFNofMdfkuxov1hlyuYeV95/uaPxkbXYd8f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LTV1pVZp; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LTV1pVZp"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7370e73f690so5428185b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749484170; x=1750088970; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GbDXTAZxIXygNZLsCst7kpU0mT+2twAyV2birPGbUuE=;
        b=LTV1pVZpd7OAOhKmd1jfLcoQ/EA0VPa0tvaxCJ7K732qTLPQV+6pS0dpXHKtuE6CFa
         ZlO0ElWWkKHIsFe/rdWtr8gk4UbGtvKp1EkoRkREkqV/92daXLBawKqSh2rZOhzFo3q0
         MJzIljsNv325bTPJQL4ucAMvGKYtyzDDvKGjVXKT7EfIClsiMWOm11WfG732D0erVeZD
         GVdekJExKYJSQw87c7RE+E4SmdNU/l98ZYcuzttUSR81hSLeQNFz1NJgT8XrrQRISP8k
         5Lz9iL+nxIhIoTj2Y1NAxVH84w/GqoT91enekMgU4HdH7315WPwPLzTWvVaB3M9ORQvd
         eSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749484170; x=1750088970;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GbDXTAZxIXygNZLsCst7kpU0mT+2twAyV2birPGbUuE=;
        b=pZJilaHEjHFsVrNm/H56bxATGhcXlRSztw8te1FymuqnlOTXDdAOo3crhD6kHbJkfF
         xsCt8HjnMt+zC6LsJ/EqLdZ0MAPBcOFmSI2hxvzD/QNH0CMWGizNgvleFf9pjuPnD0iB
         FQCTTUYCNRrKms+Rkl4kOOSqUnDzyYJKpF9tAeZ8W2QBwgiJQbI1AzCkmAxBxpwJJUbf
         YsuM+xy2Ato137FYXDrNlIVZc55lKolyTg0+sCEH1BKY2fDVfjTC4rt1s70aH+lkD46n
         U36sBCZ4/F5tF2p/luYyb4j5QIobKY3ZZGgtA2L4B2DXHs2KR0s2pMaERGgshQoHVLh+
         tlVA==
X-Forwarded-Encrypted: i=1; AJvYcCXlFO2Qw6eRqDFwFfwuLQ4wxIf3w8g0fzKsdt8nDUgYRMzOcSS4WcsGnFHCH/+hGYABqQpqiLFWYTh91A4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7KPRPvd+Ymk7rTLuWYID4wy5Vw5YI8gpb7gp4ZVGshdg2D82q
	8T8fg9CkjKmtL3dfWPI8u2tgM05qQlek5c5C1jEwSDnavODATV7a1YCVDLtB78hd/fcecjRvvbz
	dnK9ZJAXSyCpSbJ2WJJqZBiOVLkGrVw==
X-Google-Smtp-Source: AGHT+IFrXkiR8WR8iG3nbOmJqUxBsjH3gTSS4afmh9YumbsXjLp04RKCNCIYb7Enm3IB8vOPOnUJONfHpnLgUPk2lAo=
X-Received: from pfbdw27.prod.google.com ([2002:a05:6a00:369b:b0:747:a8e8:603e])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9203:b0:1f5:8622:5ed5 with SMTP id adf61e73a8af0-21ee24e1c1cmr23128880637.3.1749484169917;
 Mon, 09 Jun 2025 08:49:29 -0700 (PDT)
Date: Mon,  9 Jun 2025 15:49:27 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4947; i=samitolvanen@google.com;
 h=from:subject; bh=O16/i8ImN1omRqIDkVizfBKxq029hgU/VoUr9M+AMV4=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDBnuTG2Xpn3ULs9iaeX6fGIX85sQl4Rttj6+Atx9574xM
 qX8ZN3ZUcrCIMbBICumyNLydfXW3d+dUl99LpKAmcPKBDKEgYtTACbyZCUjw/eYyw5Lr3l4F0rw
 7Dw31y/ntubxo15fE+5mGyxpEU05lc7wP3Lt/ZXTfKTy5m278shFOeD70azNMa/2SOUY3pf4ppD tzQYA
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250609154926.1237033-2-samitolvanen@google.com>
Subject: [PATCH] gendwarfksyms: Fix structure type overrides
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"

As we always iterate through the entire die_map when expanding
type strings, recursively processing referenced types in
type_expand_child() is not actually necessary. Furthermore,
the type_string kABI rule added in commit c9083467f7b9
("gendwarfksyms: Add a kABI rule to override type strings") can
fail to override type strings for structures due to a missing
kabi_get_type_string() check in this function.

Fix the issue by dropping the unnecessary recursion and moving
the override check to type_expand(). Note that symbol versions
are otherwise unchanged with this patch.

Fixes: c9083467f7b9 ("gendwarfksyms: Add a kABI rule to override type strings")
Reported-by: Giuliano Procida <gprocida@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/types.c | 65 ++++++++++-------------------------
 1 file changed, 19 insertions(+), 46 deletions(-)

diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
index 39ce1770e463..7bd459ea6c59 100644
--- a/scripts/gendwarfksyms/types.c
+++ b/scripts/gendwarfksyms/types.c
@@ -333,37 +333,11 @@ static void calculate_version(struct version *version,
 	cache_free(&expansion_cache);
 }
 
-static void __type_expand(struct die *cache, struct type_expansion *type,
-			  bool recursive);
-
-static void type_expand_child(struct die *cache, struct type_expansion *type,
-			      bool recursive)
-{
-	struct type_expansion child;
-	char *name;
-
-	name = get_type_name(cache);
-	if (!name) {
-		__type_expand(cache, type, recursive);
-		return;
-	}
-
-	if (recursive && !__cache_was_expanded(&expansion_cache, cache->addr)) {
-		__cache_mark_expanded(&expansion_cache, cache->addr);
-		type_expansion_init(&child);
-		__type_expand(cache, &child, true);
-		type_map_add(name, &child);
-		type_expansion_free(&child);
-	}
-
-	type_expansion_append(type, name, name);
-}
-
-static void __type_expand(struct die *cache, struct type_expansion *type,
-			  bool recursive)
+static void __type_expand(struct die *cache, struct type_expansion *type)
 {
 	struct die_fragment *df;
 	struct die *child;
+	char *name;
 
 	list_for_each_entry(df, &cache->fragments, list) {
 		switch (df->type) {
@@ -379,7 +353,12 @@ static void __type_expand(struct die *cache, struct type_expansion *type,
 				error("unknown child: %" PRIxPTR,
 				      df->data.addr);
 
-			type_expand_child(child, type, recursive);
+			name = get_type_name(child);
+			if (name)
+				type_expansion_append(type, name, name);
+			else
+				__type_expand(child, type);
+
 			break;
 		case FRAGMENT_LINEBREAK:
 			/*
@@ -397,12 +376,17 @@ static void __type_expand(struct die *cache, struct type_expansion *type,
 	}
 }
 
-static void type_expand(struct die *cache, struct type_expansion *type,
-			bool recursive)
+static void type_expand(const char *name, struct die *cache,
+			struct type_expansion *type)
 {
+	const char *override;
+
 	type_expansion_init(type);
-	__type_expand(cache, type, recursive);
-	cache_free(&expansion_cache);
+
+	if (stable && kabi_get_type_string(name, &override))
+		type_parse(name, override, type);
+	else
+		__type_expand(cache, type);
 }
 
 static void type_parse(const char *name, const char *str,
@@ -416,8 +400,6 @@ static void type_parse(const char *name, const char *str,
 	if (!*str)
 		error("empty type string override for '%s'", name);
 
-	type_expansion_init(type);
-
 	for (pos = 0; str[pos]; ++pos) {
 		bool empty;
 		char marker = ' ';
@@ -478,7 +460,6 @@ static void type_parse(const char *name, const char *str,
 static void expand_type(struct die *cache, void *arg)
 {
 	struct type_expansion type;
-	const char *override;
 	char *name;
 
 	if (cache->mapped)
@@ -504,11 +485,7 @@ static void expand_type(struct die *cache, void *arg)
 
 	debug("%s", name);
 
-	if (stable && kabi_get_type_string(name, &override))
-		type_parse(name, override, &type);
-	else
-		type_expand(cache, &type, true);
-
+	type_expand(name, cache, &type);
 	type_map_add(name, &type);
 	type_expansion_free(&type);
 	free(name);
@@ -518,7 +495,6 @@ static void expand_symbol(struct symbol *sym, void *arg)
 {
 	struct type_expansion type;
 	struct version version;
-	const char *override;
 	struct die *cache;
 
 	/*
@@ -532,10 +508,7 @@ static void expand_symbol(struct symbol *sym, void *arg)
 	if (__die_map_get(sym->die_addr, DIE_SYMBOL, &cache))
 		return; /* We'll warn about missing CRCs later. */
 
-	if (stable && kabi_get_type_string(sym->name, &override))
-		type_parse(sym->name, override, &type);
-	else
-		type_expand(cache, &type, false);
+	type_expand(sym->name, cache, &type);
 
 	/* If the symbol already has a version, don't calculate it again. */
 	if (sym->state != SYMBOL_PROCESSED) {

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

