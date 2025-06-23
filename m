Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F5A2367A6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670772; cv=none; b=C+alZ8+T0UWO3JbTBJ/YfX+oF9/O/kiNmyoE0tRDaVS24ZELaXC0JfG4EhRFvP8jqIwSsExLzfHaPnxZnLhQwIuEZgJ+cRAVnS4RCccXBn/73o5WsO/TUYW/8RoExr6Ny06RibgS2g7p3kOKDh5RU6+uEBepXc5TLVQ/ipQk+U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670772; c=relaxed/simple;
	bh=/mSzpNRlNFtyqvYxA/DRD7Gt3GU9kv5v21Eo6mNvjvM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=t7g9c6mvk3+vt+pcH4fQN/nLOgLTuQnElQ2cl2CXcUcPmZLvI0h3PBgkSj/QwO4e0k0Bxwz+D/NSrI+B/U2iVnRZTu/qyHUqigWtW2ULJzDOIFWzp4mTOvt/1JzIls3p1ECamvCcVOtuy9PxaC3NV4zN1oZQdxl1qnRPqKYTwYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JgUAmWUQ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JgUAmWUQ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-450d50eacafso23276775e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750670769; x=1751275569; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pa2ZDWEMmyq3FnjO/079PycJx+3r729iLJomR78p2yI=;
        b=JgUAmWUQ3bB+QSfOHzpK/WALnO5ddPJFMD/HdvfG4oJ7LnhzKBhsSi4peZ7YR9Ocae
         exlyObgpkUMTlA+wuI4BMviGrU0keUz6rwAnkUNy6z44PlU6dRq17+SGTLZFfe4bQnbI
         aObTyO0giApqVnXvZVWJwtxyCQaoQFVYsM0Xm2oIzVA/XLJsdUq/QkpklYdKy98MILdR
         1XzCRVuzYV54RIEgl1N8zBe+5gSqINZnucOTBxKZ97JzI923achMKrQsAguzsPERTzU7
         gts3u04WBWuhQX+jyNyYcy/H1z938QypidnEPXx8FMTVLQ1M6brwXj54EwemZhJrI00+
         tChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750670769; x=1751275569;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pa2ZDWEMmyq3FnjO/079PycJx+3r729iLJomR78p2yI=;
        b=UyiRlquNvS/TUQL082jHPtCbYFU/JTmoJgiNM+YpDIAqS/ZONl9eg9JY6b4PoNHdxz
         P6ZyGAYMVnnO8IpWIq9HNxVytOahn4b1ssqth/Wm953cKQy3iSqPwpdtqelaKkViDqFR
         zEIOWwpjAUKTklIeqLgnBNHoRPx47kQ7zjIxl69uj6WVIOI1jhFjb0BUII6N4japEr+A
         QeYCreaB/+Vh3WHG7donLGc5o+EzT6Vr8jKYo69mNHoiXrNF7+PGqyeZxWpHDpPBjWE3
         SWIJuNITL+Hl80+xepm/fup0abUUFkkG/ztHOQ34kfjjFgKM5TUiTVe0TTPdMnIRgaVf
         GDSw==
X-Forwarded-Encrypted: i=1; AJvYcCUzCCK5eK4QWcp0aDa5CIEAp4dUhFcdzJWrH6G1LtlmuqZrZeOLGel/GZ4js+6KdWVkh2xlmxCDZPoi04U=@vger.kernel.org
X-Gm-Message-State: AOJu0YytF1pf68DEGVXVLlrOfO3Zb2EBqA1BKhmDQEmR07PPkNjZsVKs
	cD2IaR2DyyUoeSKQ9IDxu9yFNuCIWja32RYCErOjegcRY2az8M5AekOAqLH/5+aVwnW8jKJxXVf
	s5tpIxRRiIUnrzg==
X-Google-Smtp-Source: AGHT+IHE7/ErI0nHyXwFIqSpDJmkjX2TMJFOBhBRQLErcWtRRel7p7wYqamomiKZmCXLM6/DNtN3nQ3WZ3R3MA==
X-Received: from wmtk6.prod.google.com ([2002:a05:600c:c4a6:b0:452:f960:4dfc])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5490:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-453655c30e4mr127947675e9.15.1750670769334;
 Mon, 23 Jun 2025 02:26:09 -0700 (PDT)
Date: Mon, 23 Jun 2025 10:21:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250623092350.3261118-2-gprocida@google.com>
Subject: [PATCH] gendwarfksyms: make -T symtypes output be in name order
From: Giuliano Procida <gprocida@google.com>
To: Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Giuliano Procida <gprocida@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When writing symtypes information, we iterate through the entire hash
table containing type expansions. The key order varies unpredictably
as new entries are added, making it harder to compare symtypes between
builds.

Resolve this by sorting the type expansions by name before output.

Signed-off-by: Giuliano Procida <gprocida@google.com>
---
 scripts/gendwarfksyms/types.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
index 7bd459ea6c59..51c1471e8684 100644
--- a/scripts/gendwarfksyms/types.c
+++ b/scripts/gendwarfksyms/types.c
@@ -6,6 +6,8 @@
 #define _GNU_SOURCE
 #include <inttypes.h>
 #include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
 #include <zlib.h>
 
 #include "gendwarfksyms.h"
@@ -179,20 +181,41 @@ static int type_map_get(const char *name, struct type_expansion **res)
 	return -1;
 }
 
+static int cmp_expansion_name(const void *p1, const void *p2)
+{
+	struct type_expansion *const *e1 = p1;
+	struct type_expansion *const *e2 = p2;
+
+	return strcmp((*e1)->name, (*e2)->name);
+}
+
 static void type_map_write(FILE *file)
 {
 	struct type_expansion *e;
 	struct hlist_node *tmp;
+	struct type_expansion **es;
+	size_t count = 0;
+	size_t i = 0;
 
 	if (!file)
 		return;
 
-	hash_for_each_safe(type_map, e, tmp, hash) {
-		checkp(fputs(e->name, file));
+	hash_for_each_safe(type_map, e, tmp, hash)
+		++count;
+	es = xmalloc(count * sizeof(struct type_expansion *));
+	hash_for_each_safe(type_map, e, tmp, hash)
+		es[i++] = e;
+
+	qsort(es, count, sizeof(struct type_expansion *), cmp_expansion_name);
+
+	for (i = 0; i < count; ++i) {
+		checkp(fputs(es[i]->name, file));
 		checkp(fputs(" ", file));
-		type_list_write(&e->expanded, file);
+		type_list_write(&es[i]->expanded, file);
 		checkp(fputs("\n", file));
 	}
+
+	free(es);
 }
 
 static void type_map_free(void)
-- 
2.50.0.rc2.761.g2dc52ea45b-goog

