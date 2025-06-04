Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D2627462
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 03:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749006951; cv=none; b=RB/iH1UsLl5qiz4P0LlHWHOATql11s1hgXdFLPk3POjh3Wu413mR3VYgUX41jxpGOKpGJ2Xg7+hMHZ+gRlMMcKtOnNVCxlv6wM5Ez1O0Gk0DSv4y1DVqsnXh4d92NjZKkyJ/hiRg0WI/7odFjustzNMkZHwqu7VlgN5mmf+IoYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749006951; c=relaxed/simple;
	bh=5K4MQQ5D0bD4kdVvrtXxzbpcO82nVdXBm+YGiPiLG68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qDR0QosCSsKqvT0Xn9kXjU0FsM+ffm/CesBgJWYd0d55wXNVCAQa2HWqKAEMAyU/sx8TgeouWi9LjkUy8x4aRhz9p0AUSUrhf9IpFjN6GCQZtLTMHYpsubwP1ndZi1msd4OKzKtZIJLLF8j/+J/QZfEUedfkVPLY2+VYP9vO5MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=CJcvXWoF; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="CJcvXWoF"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso7803040b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 20:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749006949; x=1749611749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w5fG5l4hQXv8yGsPykiMnPUQCgbt9tOBCN1omnHe9NY=;
        b=CJcvXWoFlTKo43jYIMQ1FpNCYgdHiROs8kJaRPsWYFVsaUG8r/3qTjbdagQoCux6v3
         yUQ3Dw2EwYGWcYl/VFRcwpGYQBO1tmpSdJlDDD+6s1Nwgdp14Z8it0NWX1PLWbTTVG7H
         NyYdTPLzMsJ/EVeZDmRxLRA8IwUpndws0VBnJIVSlRoIXGPZ4FlCWFkm0U4Gm/sJifmW
         pJzv+RXQq9btnrWECe/O7E+GJI89Aqzmxao1vlzXNPLniWu29x/6Piqgc5Ht1f2L6sRr
         EdWbqwgpeGl6AgHXfl7ddGxsolohSH1FxgGwZuhaBIlvTg4MvWbEhy0kK+t2B5VXyl/Z
         t1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749006949; x=1749611749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5fG5l4hQXv8yGsPykiMnPUQCgbt9tOBCN1omnHe9NY=;
        b=jheg0N/dn8Wpgrh7DCtNIk8130z7QXjElJLpXoKsHXyifiVIzPY8pOiuA2VyGtTFcp
         D3RaxgN6ao9azHwwNr5tI47QktUWBlt9B9ZVrpNd33m8F0sISc/BJytR0xCgtiX2S+ut
         Bgs8Kx2iejtnVnhD3nqK8o9qZhYRzbgZnIz7W9BqnhHJI7CSwkBx5Q55+Xz/M7+/lqPH
         l6wjzqBSKtCzf9n15XD/i5sVNiQOQLVEyXdXOjFDoFFKEctUIRhsFY3LMhP/qOadvxKY
         DdN6y3GkVobFVVuSH9iiWZZDezxep171yjX5nLCfiGS99nT5GTfO5vFG+w3o8DDbC3oL
         GT2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfELePM1DACnCRxSgGDnhBxKHSg6kaHtLHvAtbZcxL+IPPF+/uw3yzlZ+6f3nukOOUehm9ULCD+69I6XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPAn3yc6IXs4OW/FZpsFVh5Ed6ixXIZ5H5O+zToN7jZoq1bbGo
	2Exxlf8g1Sfk6/KQIeOE3b7BrN/YT5HZcmx+NJRy2X96lRm4uHPThT2rlk8j3/qsS3k=
X-Gm-Gg: ASbGncthvw8/m0Qr9NzNAC3ULKlszAGEQvWQ9oqn27mSsaT+IMbs/EPStm7rGF5V0pD
	ChkVa3wejYKl0dn0acZ9RH0kI9vywYeWY0rcfeNvlJUPxKpVlB5etzDTpa41ojOQc346aRkdl+T
	yHx4kgaMDHl0xZaQjhiFTpLGLJTJTgUJn1whgde+rKofMWP+tP1DoqljsXbTYxmgJCwMZw7r/iE
	NbSDZN2D7YO7a1nGljiGthBdEelwgOHVpm+6WoR/Im4Mp/XHfigTo9aGx4dIkYCnouztPAXTDM8
	Wh4X4hwspu+Pqjl08RA7sCGLgCeu5EKV0iI0SJWBYFvF1Y3CMHzyX8+gitkixXf6AEUAVW0Nmyv
	DGw==
X-Google-Smtp-Source: AGHT+IHeMztvH/4BxcGokHkf3yurYYRaWgFDwtJD4OKMLxALQDdXbF8pTdOAm1Rhqyof6kYiL1tGfQ==
X-Received: by 2002:a05:6a00:3a1d:b0:747:aa79:e2f5 with SMTP id d2e1a72fcca58-7480b07a27dmr2006740b3a.0.1749006948608;
        Tue, 03 Jun 2025 20:15:48 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe96381sm10498942b3a.10.2025.06.03.20.15.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Jun 2025 20:15:48 -0700 (PDT)
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
Subject: [PATCH v2] gup: optimize longterm pin_user_pages() for large folio
Date: Wed,  4 Jun 2025 11:15:36 +0800
Message-ID: <20250604031536.9053-1-lizhe.67@bytedance.com>
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
performance of function pin_user_pages() by reducing the frequency of
memory accesses using READ_ONCE. This patch leverages this approach to
achieve performance improvements.

The performance test results obtained through the gup_test tool from the
kernel source tree are as follows. We achieve an improvement of over 70%
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
    # PIN_LONGTERM_BENCHMARK: Time: get:4075 put:10792 us#
    ok 1 ioctl status 0
    # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
    [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
    TAP version 13
    1..1
    # PIN_LONGTERM_BENCHMARK: Time: get:130727 put:31763 us#
    ok 1 ioctl status 0
    # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
Changelogs:

v1->v2:
- Modify some unreliable code.
- Update performance test data.

v1 patch: https://lore.kernel.org/all/20250530092351.32709-1-lizhe.67@bytedance.com/

 mm/gup.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 84461d384ae2..57fd324473a1 100644
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
+	if (!pofs->has_folios) {
+		unsigned long start_pfn = folio_pfn(folio);
+		unsigned long end_pfn = start_pfn + folio_nr_pages(folio);
+
+		for (; i < pofs->nr_entries; i++) {
+			unsigned long pfn = page_to_pfn(pofs->pages[i]);
+
+			/* Is this page part of this folio? */
+			if ((pfn < start_pfn) || (pfn >= end_pfn))
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

