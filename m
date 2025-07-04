Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9312DEA9E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 18:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751653113; cv=none; b=P/9duh+wJ6RdkLGPakQnDi0GaNjjipkK6r1p3ddhLXqp3UIkKDdySMMJfF89QeYDZpteRc4dyvB357pUjwn5JA4iY75X7kEEdRNfOim4o262J4S0PjKuJm6qZy50mVzsNSSyr7QZY4sZ+bfnaN5iuixQUb+cQ7Froq2e1L5cT5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751653113; c=relaxed/simple;
	bh=RVKsVZatIgujAvo39iiNxV349PG6yzBkXlUFjQWvy/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gqHwv9gM8yEfCXGLPaqHUuc/q+5+dwjYbYERT8nHOFxYAD8ryeRp265i5ymoihmaVB5IZ093cfdFb/xJHoRBiqAUxENcvKLs6yEzB7Pxm7jrzOzF3atRGVxMn9aad+QS/ohHGIaEvEM7QMdKK9Xeu7zoiq82HpTMFmwmSG+C0kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9aHOswD; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9aHOswD"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d3e7503333so180051785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 11:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751653110; x=1752257910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aENP2iu4I7U0kmp4JHtI/iZifd2SYatC9OugRasA0/8=;
        b=F9aHOswDPj6GxlIVRPRjI2dHgSPtHxta7FP8Iz+/PQmnrzFlgZAf1ASKwpnMU6lNXc
         L70Kx2jDnObdxQIZTsJjNh3tDEIKqR9fRhkynBmDpTwC0JGTGYF+3nQOnPeR/oj/EK2M
         nGh4k8erVrArTQsKhvXcXeHEe8Ji2Aj+nAP9rRIbGk/AKoIoPtkyErEzTd1HUiE7PPNX
         /BwHSJJnVdJprG58XpewOLpiAG9JE4idGWaNeUx0a1YZPkmbIeVXE0Wkf6VrVoDfmIpD
         KepV9UICTVwuZIhnT6rOfLtrBBeWuZokjxUzudi2KT0MJi7LSMNRm1Ezj0mn3Tgrhh3l
         XzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751653110; x=1752257910;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aENP2iu4I7U0kmp4JHtI/iZifd2SYatC9OugRasA0/8=;
        b=gMkQZ1u0+71WzWPbXstnQLiZAs6QK1lZsXQoT7OVDvPd4IpCOnvK2Fr00MTuNXu02t
         HqsHetp7N2OAqk04kCvcoCH7Rvltl7tbFARt0c4j+h7jD4E6gnuuTGrmqcWI+cvYjeUF
         kaxRtQb6vt70GJ3T3y70n4TQdcNWbd5W8gLPdKeonZP653I1T8OUlSaVCZraKAe+ZH88
         Qy2q+ktfOWAo1s6zb6TPUAjlotM3zd9AC/0pMc+Npy9uR3HUPMTFEEnZLW5ZpnuJVsVO
         BOK0r7A7bhKtfox+TakVyeyVUVX3rlQWz6PI8bibM0ED4O/MDR0Fxu3rZXU1JEflpgLH
         5+ug==
X-Forwarded-Encrypted: i=1; AJvYcCXKMtXwxX3DdhQv8CKqWJUC0pMlF4VtNfk/rahEovsGmb/2tpVrfhBQjyJMr00CbhHLGkV4ZOHA6Q1nPm8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7i2erhR/K1ynS5P5a6ayL+xecVG3bTyqda+tOp+Q3sL0YQiui
	zBMtn40ctiIeP9a5RLaG911dz4WdF8VL7TJ5oNfHNEXwzktTkJOkxNF2
X-Gm-Gg: ASbGncsm0eaeej41jGh7MEPXtVTHGe1cS1GeXsRyvizZ46PHHfoxKBZgUyD9hkak8W2
	G0KGoNS3qLJBXDzMCIyZ/iimGddWJ1PdmR2nWyPN50+nxVFPP05EpYsrVop5xtkhbiaWnixzmWn
	JcJOowf21JsDTJ2I39wEOSrU7vHjldZoktFRiLdN+hswaxp8dl7rRxC0UbWQWjgSW9ZuvcpfB6X
	RyePKMIj8UqWdfNE1Jehn+wj66XGhnGp5lGsMUu2Y0oe+ORUJDw2v7Z34HJoao6tof812z2wBkr
	bn62M9JeVFhLuJeK1SwW8xUgc+MAKNDT9s9eyyR6t2HLp6Ce10t/au7m8J9wCEk21c0=
X-Google-Smtp-Source: AGHT+IGEgOE2jwpm8pCR+sUWgH7jwim5UJ8UqD4Xh0VD4cdL7RfEFoa9A6rupdlAWG9NTMjYVL9FfQ==
X-Received: by 2002:a05:620a:7017:b0:7ce:bd8b:2d08 with SMTP id af79cd13be357-7d5dcc4904emr490235885a.10.1751653110162;
        Fri, 04 Jul 2025 11:18:30 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7c188sm183300585a.59.2025.07.04.11.18.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Jul 2025 11:18:29 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Matthew Wilcox <willy@infradead.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH v4 7/9] mm/shmem, swap: simplify swapin path and result handling
Date: Sat,  5 Jul 2025 02:17:46 +0800
Message-ID: <20250704181748.63181-8-ryncsn@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250704181748.63181-1-ryncsn@gmail.com>
References: <20250704181748.63181-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Slightly tidy up the different handling of swap in and error handling
for SWP_SYNCHRONOUS_IO and non-SWP_SYNCHRONOUS_IO devices. Now swapin
will always use either shmem_swapin_direct or shmem_swapin_cluster,
then check the result.

Simplify the control flow and avoid a redundant goto label.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/shmem.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 1fe9a3eb92b1..782162c0c4e0 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2327,33 +2327,28 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 			count_vm_event(PGMAJFAULT);
 			count_memcg_event_mm(fault_mm, PGMAJFAULT);
 		}
-		/* Skip swapcache for synchronous device. */
 		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
+			/* Direct mTHP swapin skipping swap cache & readhaed */
 			folio = shmem_swapin_direct(inode, vma, index, swap,
 						    index_entry, order, gfp);
-			if (!IS_ERR(folio)) {
+			if (IS_ERR(folio)) {
+				error = PTR_ERR(folio);
+				folio = NULL;
+				goto failed;
+			} else {
 				if (folio_test_large(folio))
 					swap = index_entry;
 				skip_swapcache = true;
-				goto alloced;
 			}
-
-			/*
-			 * Direct swapin handled order 0 fallback already,
-			 * if it failed, abort.
-			 */
-			error = PTR_ERR(folio);
-			folio = NULL;
-			goto failed;
-		}
-		/* Cached swapin with readahead, only supports order 0 */
-		folio = shmem_swapin_cluster(swap, gfp, info, index);
-		if (!folio) {
-			error = -ENOMEM;
-			goto failed;
+		} else {
+			/* Cached swapin with readhaed, only supports order 0 */
+			folio = shmem_swapin_cluster(swap, gfp, info, index);
+			if (!folio) {
+				error = -ENOMEM;
+				goto failed;
+			}
 		}
 	}
-alloced:
 	if (order > folio_order(folio)) {
 		/*
 		 * Swapin may get smaller folios due to various reasons:
-- 
2.50.0

