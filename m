Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C6F1E2607
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597049; cv=none; b=V9f7ifWI6KTG3xKWtIxwr2OUYWO342ME1gnibYs3CUhW3u7V/0C6/F63TbgcHFihhY33NVXD22az2xc9GmFLUdga3NAZPdHC/6GGj8IOsJXu7m8Q/PaxMYEed2QHzFmZjGmYNjNCXAgdf7swXAtbCHYW6Pao7xUVRihzRkdQQvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597049; c=relaxed/simple;
	bh=bfoLz0rtrUNmPt9r/OLCwo6IgYNI5b002SGrw2tPjLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=okowtO05bM7bEbI9VR/KyqwBOfWeRFXVtA5o431MKWCyyfqurjOTurtoyq6HL4l1gmm9D5T9xlyD+GkEPtTQITZY25EzVpzKJ1P14kMFH/BJhu7DXTx0aZD1MKuppo1ZZ+oLgsc1NePM91eAdMNXhhXK6m3d6PvKGdlqAlEM0SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=TApjsBvd; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="TApjsBvd"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22e09f57ed4so26487255ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748597046; x=1749201846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xIkeShPRKlS37USVcPnC1/eAh/CEn8XdgrvHCexPAXg=;
        b=TApjsBvdd2UMnegdcA/sw2j5ap/0mqt1O3u9se8yM9g5x+AlEdFFx7UU25GZUEPBrM
         vF1OIIWeEq9pzO+Oiwb2+XcvcmqiP4KZQlEnTdFMGEzyDJ9BteXingHJYEkT5rvH46Rt
         l7uwm16k4QB1ywDdb2TzUpqyFfRlOOSXHA027YgHijqXAoK+16ZmHe5gW3yDJ8sZuUh+
         lU6YuSt55ldtfFx3rKFHBq0pKQmftilo3XK9vTTQZjPKYiI37KnOMdh3urS26V/KqmKq
         iMxBpH0kiiOGOWJx+U5yN3T/LMNiXzkzECtApbQELj7FFp1BwW0jJQN+UiSgAE0enSf7
         aVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748597046; x=1749201846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xIkeShPRKlS37USVcPnC1/eAh/CEn8XdgrvHCexPAXg=;
        b=vvzvNbVuj5bsSB58Y1lZ4CZCCEZ6x4Rtx7nOIvkeEnYBDw0aEL+X/rLSycESKw2WNT
         iobEMloXKneRUSkGL7VNADuqJ5vAHxnQsMm0C7e3PdjzzZJtzvhDEQ/TJuL7qdyyB25S
         ZGo9uXcFAkkQ3jOPOjIzSWWKDoQ+k8hKYtsIf/UyMWfi7r4ccEk7Cqb2JplXzI5jYLLe
         NPeOKmvII032T3C7yNIvq9XWUVfxYtC8o3yPY1hv7xApXIC6jK08ILtTkUE9ukPX87H3
         uGM7e26/Srz6aAEAxbBYmeByUuE/nnAWcH90zWaT6g3TybJ5JWAfzSBWVlKypicVerra
         mu1A==
X-Forwarded-Encrypted: i=1; AJvYcCUYga7uJ3aWc0cosSoqNCIml3TphMKbLo3mGaYZZvsDjyKVoMIt58iYNw54hlO57eQyyV6SoHqidqCxxJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj+8vhOkbVXMsnE/1tjyRbdxzavDE6Foy93PnyLSfFPHtbngKC
	71JGbrwYET/oov9s4Tuao+OVg0oQAdLZS2MhvbIgHSG+gpHKACZa3twTsUeRxGDNP/o=
X-Gm-Gg: ASbGnctxZ3woSS3/XQhM8foSw49VQG/zTaZ3EIu2NILpb8JJhNOnN8LPYVIBCVKvfWa
	v67XH/eWKA57N1ulLDImC3MsARzbHf+SfCw/Cx1B/gWu1RlIJ6QPz2AzrJrHqKAaDsLs8oBi6Nf
	mw8dttg6DlhgqQIHyYMy8aAOShVUO19HmK41Zd8vCFTZXrmezMowmlTtbEx6j1yMS5AMHTwmiv0
	VBzZZFnN6OXjBDoA5fUVjwWz37bMghgk7Uxt08XlAwJKSYCXgMPCdQji2O7d4ee4kIRFyfAEXJB
	7uL13M14xqRw0JV9zBgK/1x280nPoAo5vJbe71SWGMZ4CUBXPphZSmVMhwhuInfyo/j2sUhcazc
	tmQ==
X-Google-Smtp-Source: AGHT+IHCH599oXAEUYNU0GNXy8bBTUxRQinYHHXmUoGoX7uMtkqXRXPYME/P+Uz+v9cbnxn9jl/p0g==
X-Received: by 2002:a17:902:f70f:b0:22e:491b:20d5 with SMTP id d9443c01a7336-2352b790294mr34633575ad.26.1748597046039;
        Fri, 30 May 2025 02:24:06 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc88a7sm24549685ad.39.2025.05.30.02.24.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 May 2025 02:24:05 -0700 (PDT)
From: lizhe.67@bytedance.com
To: akpm@linux-foundation.org,
	david@redhat.com,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev,
	lizhe.67@bytedance.com
Subject: [PATCH] gup: optimize longterm pin_user_pages() for large folio
Date: Fri, 30 May 2025 17:23:51 +0800
Message-ID: <20250530092351.32709-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

In the current implementation of the longterm pin_user_pages() function,
we invoke the collect_longterm_unpinnable_folios() function. This function
iterates through the list to check whether each folio belongs to the
"longterm_unpinnabled" category. The folios in this list essentially
correspond to a contiguous region of user-space addresses, with each folio
representing a physical address in increments of PAGESIZE. If this
user-space address range is mapped with large folio, we can optimize the
performance of function pin_user_pages() by reducing the number of if-else
branches and the frequency of memory accesses using READ_ONCE. This patch
leverages this approach to achieve performance improvements.

The performance test results obtained through the gup_test tool from the
kernel source tree are as follows. We achieve an improvement of over 75%
for large folio with pagesize=2M. For normal page, we have only observed
a very slight degradation in performance.

Without this patch:

    [root@localhost ~] ./gup_test -HL -m 8192 -n 512
    TAP version 13
    1..1
    # PIN_LONGTERM_BENCHMARK: Time: get:13623 put:10799 us#
    ok 1 ioctl status 0
    # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
    [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
    TAP version 13
    1..1
    # PIN_LONGTERM_BENCHMARK: Time: get:129733 put:31753 us#
    ok 1 ioctl status 0
    # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

With this patch:

    [root@localhost ~] ./gup_test -HL -m 8192 -n 512
    TAP version 13
    1..1
    # PIN_LONGTERM_BENCHMARK: Time: get:3386 put:10844 us#
    ok 1 ioctl status 0
    # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
    [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
    TAP version 13
    1..1
    # PIN_LONGTERM_BENCHMARK: Time: get:131652 put:31393 us#
    ok 1 ioctl status 0
    # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 mm/gup.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 84461d384ae2..8c11418036e2 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2317,6 +2317,25 @@ static void pofs_unpin(struct pages_or_folios *pofs)
 		unpin_user_pages(pofs->pages, pofs->nr_entries);
 }
 
+static struct folio *pofs_next_folio(struct folio *folio,
+				struct pages_or_folios *pofs, long *index_ptr)
+{
+	long i = *index_ptr + 1;
+	unsigned long nr_pages = folio_nr_pages(folio);
+
+	if (!pofs->has_folios)
+		while ((i < pofs->nr_entries) &&
+			/* Is this page part of this folio? */
+			(folio_page_idx(folio, pofs->pages[i]) < nr_pages))
+			i++;
+
+	if (unlikely(i == pofs->nr_entries))
+		return NULL;
+	*index_ptr = i;
+
+	return pofs_get_folio(pofs, i);
+}
+
 /*
  * Returns the number of collected folios. Return value is always >= 0.
  */
@@ -2324,16 +2343,12 @@ static void collect_longterm_unpinnable_folios(
 		struct list_head *movable_folio_list,
 		struct pages_or_folios *pofs)
 {
-	struct folio *prev_folio = NULL;
 	bool drain_allow = true;
-	unsigned long i;
-
-	for (i = 0; i < pofs->nr_entries; i++) {
-		struct folio *folio = pofs_get_folio(pofs, i);
+	long i = 0;
+	struct folio *folio;
 
-		if (folio == prev_folio)
-			continue;
-		prev_folio = folio;
+	for (folio = pofs_get_folio(pofs, 0); folio;
+			folio = pofs_next_folio(folio, pofs, &i)) {
 
 		if (folio_is_longterm_pinnable(folio))
 			continue;
-- 
2.20.1

