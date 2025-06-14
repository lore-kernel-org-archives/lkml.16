Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA205B663
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 00:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749862544; cv=none; b=jqIXwxpJCSCrwtHXZzMvogzaZNs0GqVfq5CC0Iybg9Pggn45/ZZ/ruUpaMBX/2zyPpmTeJ7xceWyqZtPLulV6GPCKD4V37nGOyUwZH56hMzlcIpEJQmxm0H3NjR0olB8C92lzJZEM2H0fU5L3t5wMKeVXOMG9s1h0PU5AryTwqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749862544; c=relaxed/simple;
	bh=W9uiRdZxIscpcrYYnkRSlg+ZO9b1JTinVLNqKvo7yrQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XvlZ2ZDmPq8TntkVococnNCoUmYGpGSD+7I23DDdKNYR4/V9FfowA14JJ9X1g8hB9swImI8yeULWJQaqwcDcWM+9eip2utvYA6yhdLSAAKjsbCP6pC4sfF32RiHtpH3XBgkWvURy7aYszAD/9out4wM9R67YryMQvRJTXgSUZf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TaqFkdfS; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TaqFkdfS"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-311f4f2e6baso2509638a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749862542; x=1750467342; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ja6SZkqXOek9VkK6m25wDZDPiDBPTxpH5lik8ktGlnw=;
        b=TaqFkdfS8RMHxd/RtolmGdegj4zgt94Iz/2VSAjOmgtU0qRX7+tsPRt3kEK5TY5ZIS
         saaHYdeWgfM+eb7hR9Oi3kssx4E2cfmmRB6DuC69mLPSeNnLbgiJQm3ME9di0qaevIC2
         hZcjnZUDYGJIVl5mJj/Kcets/iiQzmhq7ftkYfKdpy9BoH01ZHXUyAwkGJ+yOFsXxg5O
         tqiuQFiBHblFNSqiQw81uYRTKcFWL/NM69nQTCor+RJnE/KxVxb1eHe6EyjC76HpyDaR
         KdykKNMgobCW6VeusTHOoXm7IVyC0au4i4Io6bb4uFViyAYXtDrYUPR091aIR3N1LGuO
         t3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749862542; x=1750467342;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ja6SZkqXOek9VkK6m25wDZDPiDBPTxpH5lik8ktGlnw=;
        b=VbTSfaWDAl5QHrY5h8q+HmVoCJkxoTKOxVb7DT4ItjmFUXCKF47JISuE2j4A/qjsfL
         PeF4SiNuB9p1q0tg/c2EyAki617IcRrCIaAwMGdup9U+xfuhqv8P26ub8UPr/lYO0qZ8
         kBFfFnxNzMp/7+rGqqpYw8rKH7QtW4FyyM4GyMGawqfkCKQg1RTEbALillA5XzIsqlT3
         i+zuiW+aDF+1Tvm0Gw31GTtEDvjZeRlspIZW7xYG2SwBVRUSv1pfsDhpukpUAp6WaBo2
         gaRVcA+yYg4ATqIV+BSk2QOwztZM62uoE66unErohiykYu1/DIqapOdFVl91fyg8mdxw
         9ngw==
X-Forwarded-Encrypted: i=1; AJvYcCWbinzo7glyW8q2OQZ+4ltutdlJcPGa5ixUu8kyy0RO/PhO0D+F2XPLkDuOCOSkZLF73UcEMW5rlefku5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRqy1VVuFgqco3Fjr0kGtiqhuU6vxvc8xnSXfGrbqayrwlHuWT
	gjhSt42LSNuYiRBSOljPpKyASt9nfbNh8BCqc4IATsOfAuPHtDyJXCsVvG1ll7jBlXzaBeHGO1e
	UM30Xbj6G1wkJcXfrpT9X9WuflXGHaA==
X-Google-Smtp-Source: AGHT+IEmiUV1YJNJXcUU7ffFPfNdMtt2ArTci9/pcqysiHrOP5C0wnwZLiWncL6SbtG1shmlIHtmn9ewTe65yS8WIeE=
X-Received: from pjtd4.prod.google.com ([2002:a17:90b:44:b0:311:a4ee:7c3d])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4e84:b0:313:dcf4:37bc with SMTP id 98e67ed59e1d1-313f1dd74acmr1796128a91.34.1749862542029;
 Fri, 13 Jun 2025 17:55:42 -0700 (PDT)
Date: Sat, 14 Jun 2025 00:55:33 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=6233; i=samitolvanen@google.com;
 h=from:subject; bh=W9uiRdZxIscpcrYYnkRSlg+ZO9b1JTinVLNqKvo7yrQ=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDBk+J1piFPM+8duHcHx4HrjuwNRokye5Hx6+/zA/47WEv
 erW7pqgjlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjCRR9cZGR6Uv3Tpa/6r/0Np
 4mzDukobY2GNlL3luqdaOE2U7scfO8nI0HzlummSovkxcekDCWIXOJVvXlR16Du0TLYx0OBP0Dk 3PgA=
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250614005532.1370072-2-samitolvanen@google.com>
Subject: [PATCH v2] gendwarfksyms: Fix structure type overrides
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
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
v2:
- Dropped the now unused __cache_*_expanded() functions per
  Petr's suggestion.

v1: https://lore.kernel.org/r/20250609154926.1237033-2-samitolvanen@google.com/

 scripts/gendwarfksyms/gendwarfksyms.h | 14 +-----
 scripts/gendwarfksyms/types.c         | 65 ++++++++-------------------
 2 files changed, 21 insertions(+), 58 deletions(-)

diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 7dd03ffe0c5c..d9c06d2cb1df 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -216,24 +216,14 @@ int cache_get(struct cache *cache, unsigned long key);
 void cache_init(struct cache *cache);
 void cache_free(struct cache *cache);
 
-static inline void __cache_mark_expanded(struct cache *cache, uintptr_t addr)
-{
-	cache_set(cache, addr, 1);
-}
-
-static inline bool __cache_was_expanded(struct cache *cache, uintptr_t addr)
-{
-	return cache_get(cache, addr) == 1;
-}
-
 static inline void cache_mark_expanded(struct cache *cache, void *addr)
 {
-	__cache_mark_expanded(cache, (uintptr_t)addr);
+	cache_set(cache, (unsigned long)addr, 1);
 }
 
 static inline bool cache_was_expanded(struct cache *cache, void *addr)
 {
-	return __cache_was_expanded(cache, (uintptr_t)addr);
+	return cache_get(cache, (unsigned long)addr) == 1;
 }
 
 /*
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
2.50.0.rc1.591.g9c95f17f64-goog

