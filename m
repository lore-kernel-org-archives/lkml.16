Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0EF28D83E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745860701; cv=none; b=PDmpcBKPZQ7GpR7DBBJkutQAWs63m8bJAwwHaFn0eEl9Q2Q0CTtPA4OeLEg7wCuPdpBxpZI6dswux9etGR+HwpHeY830bYI9FdMQE5Ny2CHA+ZbsFNKok12M0jQ3C73rMQvej7IemqPGdPsGKozvmzxSKfHbaMJzFAKEZaonWFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745860701; c=relaxed/simple;
	bh=hBuw9o4si2tUyOFAZytsGOqIQtHGIbJIGPWrHW2rzDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uelg2wUG/DqnVHhroQLlou//XadInEDOOw52QQVF06g1VdW69TP9cwplia5TRTjiEHxjESVDc7oWGDJzZg559FmwMfjbwM9/Pez0vX8jfu2FL5lSXaNLSHZS8JpoOSo3sD83205dvzh7BJ7lbSzeUAnDbPa8dcb6BCqK6HAteG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cr3ySK97; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cr3ySK97"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47691d82bfbso118636461cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745860699; x=1746465499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58Ozice9R5N46mpKWHKxyIj4OWBalr9V2WWbgOMAsv8=;
        b=cr3ySK97ftObLbp1Pf+co79D4i502h5V9v4AohSBWUjYyAR5NwiRmoogljNyzhpey6
         SZtIBXPdo0FQg4L3af4HPeVSnTMQ/X/dyprRorwsTIWWwp98n5xbtbwGfHQ3t2xs3ebA
         hqEHy3spzrC6Ixemaai5Sjkz5fls83egRnLCuj3aO+KhHO/EeDFGLRGh0R88BV9vJvCs
         ReA/caH2i49Kmt0kz0nxSKt6cLrhwVbB5Nso0BpSnG21dHzcVBiOpODrL17/U4P7Wb4k
         rKs6DvZqPqCtCP9ppelO0SX5atuXVcRZJAEVQax0FSCNAgNAd2jwzjAOm1QmJ2a2z+m2
         wlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745860699; x=1746465499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58Ozice9R5N46mpKWHKxyIj4OWBalr9V2WWbgOMAsv8=;
        b=N8mCyzpE7b2uEBZ7AHLZns+T589xCp2kQJ871oxvhOjNLUCJuTIev0ef6I2pSooijE
         45Oadzls1HdgStkB6ZwrsJOn3OP+zVqIHibxGrT0LHziiSxHbYqGvcecaVoyQ13FBYwz
         3K5jpWTdW30TfcIiIVJLchyAYJfYoMSIIe4u6OtiY2y0dNUN22V2Kjc5Msoe67o5xUv4
         74HMNKvsAW+F58IZTCxjfoqBRsgte+9yh3xb/XYjJ6nmxX2wZgixHc3UJ9zj39dNxj9I
         7jSahoJ3wv8CwqAfftRQ+AFoY3KAWaPc+C36M24D+iIajnAMu1+qs3hC4wGgsSc+21/u
         os5A==
X-Forwarded-Encrypted: i=1; AJvYcCX+dEA4JKa3fyChqt4u8eSxZ6uRShxqXxcqVl03AiZG+w4SCi5lzzIzkeTDLXTId2ojg42qf7yY7gMgpZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/xLBQKM/X5MrHuoF0QQbNqOuv7dLOH3GufieT0FDyboHQ36uL
	TPYKZundzqb3JQ/TgwgZh0PiX+UIKgu7dRDMcMI6lGh+m5q3MRWIKl3Z7g==
X-Gm-Gg: ASbGnct8omTyFHmNjDcKcgJLqkx32jqsFuZ2VqN6Gg0DvMipvsCH5AY+e8xHpYbZQ5j
	lTpON9lTzUHP6GX19Hpv+FoUIuDMRoM5jyvyslhO8ekQLk3hu5IXIk1NarSg2aONhjqJo4miRUE
	f7oLaiQ6P6VeTDrXge1CD3+r/IUPrzcP9TRrUC9yul7uYey1MnVU+/cfZDgb6T8Sdn+N0Zgiw1m
	kPyYB6z/9AgYV4rKD6lvSIBjZbE+KZRBevTzbj/kS9hcG4eB2bft+1WDriKTatR+h1ybESmwYFh
	vwnPNPbBhP9WkLY8TlD5W/HpLo19Gkrv2iNyezeBVDDhPh2reyxQ2mzrIXjIHC1CFJHG
X-Google-Smtp-Source: AGHT+IHhVBD5RcHqheisBwcMN0C4Z6GRnGRjCh5suK05TwGAS8RyRQk069PF6ML/aBMYGnrSafeITw==
X-Received: by 2002:a05:6214:224d:b0:6e8:ddf6:d11e with SMTP id 6a1803df08f44-6f4d1f167f1mr155067966d6.21.1745860698871;
        Mon, 28 Apr 2025 10:18:18 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:8ee2:8c9a:73d0:fe8a:86bb:e664])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c08ef3e7sm63443436d6.6.2025.04.28.10.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:18:18 -0700 (PDT)
From: nifan.cxl@gmail.com
To: muchun.song@linux.dev,
	willy@infradead.org
Cc: mcgrof@kernel.org,
	a.manzanares@samsung.com,
	dave@stgolabs.net,
	akpm@linux-foundation.org,
	david@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Fan Ni <fan.ni@samsung.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: [PATCH v3 1/4] mm/hugetlb: Pass folio instead of page to unmap_ref_private()
Date: Mon, 28 Apr 2025 10:11:44 -0700
Message-ID: <20250428171608.21111-4-nifan.cxl@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250428171608.21111-3-nifan.cxl@gmail.com>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fan Ni <fan.ni@samsung.com>

The function unmap_ref_private() has only user, which passes in
&folio->page. Let it take folio directly.

Signed-off-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
 mm/hugetlb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index e287d8050b40..b1268e7ca1f6 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6039,7 +6039,7 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
  * same region.
  */
 static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
-			      struct page *page, unsigned long address)
+			      struct folio *folio, unsigned long address)
 {
 	struct hstate *h = hstate_vma(vma);
 	struct vm_area_struct *iter_vma;
@@ -6083,7 +6083,8 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
 		 */
 		if (!is_vma_resv_set(iter_vma, HPAGE_RESV_OWNER))
 			unmap_hugepage_range(iter_vma, address,
-					     address + huge_page_size(h), page, 0);
+					     address + huge_page_size(h),
+					     &folio->page, 0);
 	}
 	i_mmap_unlock_write(mapping);
 }
@@ -6206,8 +6207,7 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 			hugetlb_vma_unlock_read(vma);
 			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
 
-			unmap_ref_private(mm, vma, &old_folio->page,
-					vmf->address);
+			unmap_ref_private(mm, vma, old_folio, vmf->address);
 
 			mutex_lock(&hugetlb_fault_mutex_table[hash]);
 			hugetlb_vma_lock_read(vma);
-- 
2.47.2

