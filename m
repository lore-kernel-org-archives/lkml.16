Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487387FD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 02:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749177483; cv=none; b=lznAJqPomKgHGmImWMernJn9iClxjLJSbHVtCIibsN3UxunYwVDMfdcDT9XDkB9joVZMXxoFr1+XHRY+/KNmY6YB2AvHEUmL0+OudfCVsNYDBq+ucb/CLWo6AayT6fIfMqz+eDMF9u/lmhS+oIdXHUdfTylV58Y9E4AF2teDE9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749177483; c=relaxed/simple;
	bh=cI2XH/eLLkWvVYhVpomxn9VZ6NJFlKunlfuFe0Pz4c0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PWQ61yVp1H+kRGhakIGOUJoUqX24PAl++DbpHf7DSNidvnL24t042cPwe+YncEjuHXHqskb9RwnDEaez2qObhOGgasS8LOWTGEe7RPeXHbfSdSwMspn9vsfT8SJ9AzGAR5soAaJ4/8AzwIPRrVfMYxLdlPh/gW7T0XcsQqIrL00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=f6MsUG2G; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="f6MsUG2G"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-231e98e46c0so16500635ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 19:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749177480; x=1749782280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+LoKFbaTAzGXCfMggd8263jdoOLVlpajbWllgdTcRGM=;
        b=f6MsUG2GMpMXMIWL8WHTnpSbzDXXA5gQN8MeAT66BVBINNn4kOBZFFRp/ncu9fIJ2Q
         /OEcjEwxxkk9O9EUxZj9XEQrMBC4wrQ3ytFdiKvEHlZ56FPTePUvBwVCcHpU8FpesT6c
         0+gQEzi4XtkIZX5GOlEu4EnhlloK+mXM2cLmozACnNOHVE3LL3P88ev+J3JnkfEwuup8
         K4mPOn6xMpNxp/xZU297G+xvYqiJgweAXTxOQicyGB/R5zt1ySSrjsM1D+R57BFk7xuE
         ER4G8RywrKFgN3c3/mWvtW/4QkXVNCYUK00Ki4L/ef1j2HHoUhnJ8LSHohixle6aCucv
         TCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749177480; x=1749782280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LoKFbaTAzGXCfMggd8263jdoOLVlpajbWllgdTcRGM=;
        b=NiNj/nrA057JH/LHU+ou3Gu6FyedfrDyNy0PZ373HpcHKg/jn3jHGojiXYoJKttay8
         1FwqM/dA1icy+D+vXJkmFXrK9jfPd3RmErHsK7jVWZcXB1P4zVdJ0sRSGoIKMTjVLt5I
         uwHQk4lHgGkoh9AbXq7ZblpohDuGT05FNH+hagYjXYL/nOhIjrwvH8eMUu4BTSWOKgZr
         TwRpylH3qkfCD044ZW5/fBH+cCfMw3l2ZXmBz5s5xPQOb4/qugVrAVZcgi0NfhDRjhA7
         vv1UBYkyjm0UKwpt+rkmyGIN87lSnld1n/RaaxG/ynYmvyTjOS+tCQKcvzugZzEqyZrg
         JhBA==
X-Forwarded-Encrypted: i=1; AJvYcCUdZJQUIjLri8tnqm1RVr4i4RwA1UpJzMa+ICvQfw4QB+LnEdlhVlsUATLIwHDXSu0o6Us/tsvXsCFyhcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YypBaiKnESPYEfhDwnNmLvMg+uVPQ3XvO0RvwUL8sCn3yiIzgAD
	ayWtw+IbpI5CHrgeGsWjtb1Oy2ay3u8+J9u1mubaefGC2KoTAeg0ppVX+bhOEvElPVI=
X-Gm-Gg: ASbGncuBHguq2OW/z2AeHK2Y/GRh1LoDD2mKPEJqdGryW+OLEyDde1J2DQiDgV88RA6
	BCm4CmIjnjsjJR45wtPKCKToRVOYO3i5/Ei2XAKAwBms6S7yLphk8ebdGiqOI4iqZu6mfSIuepM
	K/NzvjD5XKAo8bLXHM/rGkrXNMP2lCQ/Q4HXEiJxa5b0z913Nf4Gz6+FeaAlu92OtctTvVK7/zm
	HzT7RZvjoW2wI0kF2HQxdtqkhhncxNa1YqtrQjwZzQ+X8YddIylIczL5FStJT7ck7og8Hmec66O
	d8Vj6guUhtl7oG7NQtWaPGix3hKLSNgteSes21kdSjDK9lZYDdG85gOtWQ6cSwP8hzJJuGEsm8i
	2bw==
X-Google-Smtp-Source: AGHT+IGtZW3BdOgL3r8jOtAGn1vMu3y//2ew46XW2/qIieN+7GShazHZ2qvIKrktPJFplwx1zsWpXw==
X-Received: by 2002:a17:902:e5cf:b0:235:f45f:ed41 with SMTP id d9443c01a7336-23601d01966mr24112125ad.19.1749177480438;
        Thu, 05 Jun 2025 19:38:00 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fcd58sm2768275ad.122.2025.06.05.19.37.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Jun 2025 19:38:00 -0700 (PDT)
From: lizhe.67@bytedance.com
To: akpm@linux-foundation.org,
	david@redhat.com,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev,
	dev.jain@arm.com,
	lizhe.67@bytedance.com
Subject: [PATCH v4] gup: optimize longterm pin_user_pages() for large folio
Date: Fri,  6 Jun 2025 10:37:42 +0800
Message-ID: <20250606023742.58344-1-lizhe.67@bytedance.com>
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

v3->v4:
- Fix some issues of code formatting.

v2->v3:
- Update performance test data based on v6.15.
- Refine the description of the optimization approach in commit message.
- Fix some issues of code formatting.
- Fine-tune the conditions for entering the optimization path.

v1->v2:
- Modify some unreliable code.
- Update performance test data.

v3 patch: https://lore.kernel.org/all/20250605033430.83142-1-lizhe.67@bytedance.com/
v2 patch: https://lore.kernel.org/all/20250604031536.9053-1-lizhe.67@bytedance.com/
v1 patch: https://lore.kernel.org/all/20250530092351.32709-1-lizhe.67@bytedance.com/

 mm/gup.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 84461d384ae2..be968640b935 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2317,6 +2317,31 @@ static void pofs_unpin(struct pages_or_folios *pofs)
 		unpin_user_pages(pofs->pages, pofs->nr_entries);
 }
 
+static struct folio *pofs_next_folio(struct folio *folio,
+		struct pages_or_folios *pofs, long *index_ptr)
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
+		 folio = pofs_next_folio(folio, pofs, &i)) {
 
 		if (folio_is_longterm_pinnable(folio))
 			continue;
-- 
2.20.1

