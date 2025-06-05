Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E4A442C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749094491; cv=none; b=MCFokBbZUViaGBMTkdZD9xMJANDA0eBlRa2H90czrNdFiBihYYu3KJYD90fnJr0MvNbzesMk7FDOQKEBhN4Rn+8joZ7YyRMarj0voMp24KAb6AZwxE9UvzPs98M/8Gr8dWiHPTogOU7U3G5HclIYeyj9UWtLfzmpxEGRb+ZWx90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749094491; c=relaxed/simple;
	bh=CODiWunRA93HWXAByr632j1TV29w99tNL1PYUm7r5DY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t8ORDOlKT3hiZzXhkSt5CRPAD/eMzf15iG9PGzrGDpSZjPPOBAF1CqRP1snjVB+nArI6Q9Fy82Wi+1z2U8Ez2Sh0/GBo77umd4sDZQRTO3BzY01duCPpKTJHaJFRE7WMUytncrkH8Tx2vjjhzZge7qDzNzL5s6X6CXinsLRzPO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=bN/afFAj; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="bN/afFAj"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-311a6236effso373597a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 20:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749094489; x=1749699289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1hNibJxXLnrnySg972N1gYLR6Ade0RiNhcmbxL3rpM=;
        b=bN/afFAjW1HjGwVcSIBvAT014KbzMQy6D4i7R8WR4RrZoSKDHsRKvN1+Po0Hn4kczo
         aIdYxuc/ViJ0jAaUN3auaZYOE/cMrDg7yMeWLE18/lPifbNHtM8VUfc2odeADDddLuMt
         zOAfXavbPJxqC/xMF9/jp3xHhNut8IGdS8bCBT3BqOqHZV6UfkxAOEcqEM+6nm7KXHJ/
         IH3MoPTYq/As1Nk9Hb5rhj7ngqRuZb35R0CC3/qOt+FcuECCAiM/6OrJFXD7q40z4ZaD
         BElEu8Poq+8lsfTgqCs3Fx1hxVcY7wdnRvCSfrdrYnZ5CV3QDqSkWyJ300Q8zLj25BS0
         ILaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749094489; x=1749699289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1hNibJxXLnrnySg972N1gYLR6Ade0RiNhcmbxL3rpM=;
        b=DM1zUY+m8z6Ks1PM/pNGL/FxClc0WTty2kIKiwZaAdOUHKzaog4RO4CEmYf7radTzF
         7eWrzLleL449LUOykC1uJQfpJbLFatdWNWLcTqlN0645meNwIWXVTjQvphudKKDh/C4h
         DMClEu7hyycHJDDXwybn1yYyXqkoWwHNIUqfk4s1NaAupGaxD27d1snkmunLKcTNDKym
         IO8ea0PDWDQWsleQJfpZS5wzG/NLrWN5P9HfOxPgocZ4M3DQLevKsSSzYAMTr6P9KqFi
         dIAcn5XXlzgXEqqfGPlVRlrwfOP8BekpP60eqEHLHsC9QRApTkYXuu3pfB/sWjjFFoVy
         jj2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXs+Qfi9WjyUq1/bvBNHC47Pv59V2HnC6L0MqxbniRuTWM3uUKD4MqfT+WD7ktn9F99NJN6oJIm/AvT4kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQg5qUTMesEPA4qG75zcJ2W5CVsIrEsUFcaFJkneqIPs/69v2j
	+SeObx0ITUOh7It6Em28CVWjBlFR+s3tjpoXPfRskecaHNo4ZJBK2lPclv+t/6d7p4E=
X-Gm-Gg: ASbGncuCieS5H4gqWl33giV8j8Q3WZlwCpGJUGAfzegDiSACeho/JfQjxtX525M6sRm
	9r2DqMVEMdZLME+RUhDXTPawtE8SewqSNO7JkXNrSG3lGyCv/HluML/ntTbVlmnk2sQVEy7WveV
	z6kIgGqmxvsQE4GC2Kd9xwywb/59uEg6V8c/qBHl88Sf9FAyIIEfJTYCVxjDGFCxCYrq2+oBbkN
	zzZHuz7DkdFRZKOBq/qpz1M2RhXY0b3U5N34XgxrIl25CnLFsvJZcBw3qr5yk6dX0Z0oOX/TTAG
	hAZnBQIDxuzXKBzkcymn4ftzoU+BTf5PVT9t2qYcQE8kJS8sv+xEBB+0SrKtCvStFBkuZBFoVg6
	uJw==
X-Google-Smtp-Source: AGHT+IHGnu+iP844K4EL2P+B+oOadSdALTlQdx70vlzTI9nd2EUTVvPe3Xkd96F227tbANkJI8VKtw==
X-Received: by 2002:a17:90b:38c1:b0:313:33ca:3b8b with SMTP id 98e67ed59e1d1-31333ca3d89mr368760a91.9.1749094488438;
        Wed, 04 Jun 2025 20:34:48 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313319f3d86sm200162a91.33.2025.06.04.20.34.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Jun 2025 20:34:48 -0700 (PDT)
From: lizhe.67@bytedance.com
To: akpm@linux-foundation.org,
	david@redhat.com,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	dev.jain@arm.com,
	muchun.song@linux.dev,
	lizhe.67@bytedance.com
Subject: [PATCH v3] gup: optimize longterm pin_user_pages() for large folio
Date: Thu,  5 Jun 2025 11:34:30 +0800
Message-ID: <20250605033430.83142-1-lizhe.67@bytedance.com>
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
performance of function collect_longterm_unpinnable_folios() by reducing
the using of READ_ONCE() invoked in
pofs_get_folio()->page_folio()->_compound_head(). Also, we can simplify
the logic of collect_longterm_unpinnable_folios(). Instead of comparing
with prev_folio after calling pofs_get_folio(), we can check whether the
next page is within the same folio.

The performance test results, based on v6.15, obtained through the
gup_test tool from the kernel source tree are as follows. We achieve an
improvement of over 66% for large folio with pagesize=2M. For small folio,
we have only observed a very slight degradation in performance.

Without this patch:

    [root@localhost ~] ./gup_test -HL -m 8192 -n 512
    TAP version 13
    1..1
    # PIN_LONGTERM_BENCHMARK: Time: get:14391 put:10858 us#
    ok 1 ioctl status 0
    # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
    [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
    TAP version 13
    1..1
    # PIN_LONGTERM_BENCHMARK: Time: get:130538 put:31676 us#
    ok 1 ioctl status 0
    # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

With this patch:

    [root@localhost ~] ./gup_test -HL -m 8192 -n 512
    TAP version 13
    1..1
    # PIN_LONGTERM_BENCHMARK: Time: get:4867 put:10516 us#
    ok 1 ioctl status 0
    # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
    [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
    TAP version 13
    1..1
    # PIN_LONGTERM_BENCHMARK: Time: get:131798 put:31328 us#
    ok 1 ioctl status 0
    # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
Changelogs:

v2->v3:
- Update performance test data based on v6.15.
- Refine the description of the optimization approach in commit message.
- Fix some issues of code formatting.
- Fine-tune the conditions for entering the optimization path.

v1->v2:
- Modify some unreliable code.
- Update performance test data.

v2 patch: https://lore.kernel.org/all/20250604031536.9053-1-lizhe.67@bytedance.com/
v1 patch: https://lore.kernel.org/all/20250530092351.32709-1-lizhe.67@bytedance.com/

 mm/gup.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 84461d384ae2..9fbe3592b5fc 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2317,6 +2317,31 @@ static void pofs_unpin(struct pages_or_folios *pofs)
 		unpin_user_pages(pofs->pages, pofs->nr_entries);
 }
 
+static struct folio *pofs_next_folio(struct folio *folio,
+				struct pages_or_folios *pofs, long *index_ptr)
+{
+	long i = *index_ptr + 1;
+
+	if (!pofs->has_folios && folio_test_large(folio)) {
+		const unsigned long start_pfn = folio_pfn(folio);
+		const unsigned long end_pfn = start_pfn + folio_nr_pages(folio);
+
+		for (; i < pofs->nr_entries; i++) {
+			unsigned long pfn = page_to_pfn(pofs->pages[i]);
+
+			/* Is this page part of this folio? */
+			if (pfn < start_pfn || pfn >= end_pfn)
+				break;
+		}
+	}
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
@@ -2324,16 +2349,12 @@ static void collect_longterm_unpinnable_folios(
 		struct list_head *movable_folio_list,
 		struct pages_or_folios *pofs)
 {
-	struct folio *prev_folio = NULL;
 	bool drain_allow = true;
-	unsigned long i;
-
-	for (i = 0; i < pofs->nr_entries; i++) {
-		struct folio *folio = pofs_get_folio(pofs, i);
+	struct folio *folio;
+	long i = 0;
 
-		if (folio == prev_folio)
-			continue;
-		prev_folio = folio;
+	for (folio = pofs_get_folio(pofs, i); folio;
+			folio = pofs_next_folio(folio, pofs, &i)) {
 
 		if (folio_is_longterm_pinnable(folio))
 			continue;
-- 
2.20.1

