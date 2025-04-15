Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF22A1F3B90
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710616; cv=none; b=VhAEEv2j5OFdvphoVuSeHkdtLSUMRjuYRjEnh5o+duJ3VCqBCe5xv7Hg70VUjXeEa4ecaDTe7Yq3SyamEedT2ZSJBPsn+N/lQXWCU7tk9Va4wWnFrdM6bTqdrVDfCCFq+uZmjRa2ZerTNqD1W+nXwhG84DVyN7h769v+Olq3Gz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710616; c=relaxed/simple;
	bh=+kNDX9GZFWMIjdRCqiE+Y41Qa1XiSPMSkIdlFy6x5PU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VCVtlv5HxKnlLTWhnnxlPGzCECHji+D0QHd+U6eDxJo7KTMCrXXW0mT1DlzEGY1Ye5fl9yHXkNSByM5SUvtSBWzIWA0ZrkKRvKLBrKT+7ckVGksfmuKfhxIbNxY8+F1VNdGLTEGMfwRjOZ9CdFJVjXjLJ14OEcuXNAN8XmwPzvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UMTJ2PQw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UMTJ2PQw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744710612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iwq1mTB+TbHGTyxESwiSfmoXeV9JrDkURlCGnWcYFAk=;
	b=UMTJ2PQwqzA6YEc1YbkrQMUice1R+d5K61ruqicCtTinFU86Q4Uv/mP4pIjHQgbIgLRlZb
	uLO+a8sdfGZ42q1rmnDkSS8Nr86mWPnzfaXaCfbdgLwqZ+GNyOmDYF6gZ5sqWer55Djl3U
	jgXiV9mvmPWOuPuFBpOnR2oM+3sWLGE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-vMgkFP0cOV6HVF_vxAvDVw-1; Tue, 15 Apr 2025 05:50:10 -0400
X-MC-Unique: vMgkFP0cOV6HVF_vxAvDVw-1
X-Mimecast-MFC-AGG-ID: vMgkFP0cOV6HVF_vxAvDVw_1744710609
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43f405810b4so19719435e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710609; x=1745315409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwq1mTB+TbHGTyxESwiSfmoXeV9JrDkURlCGnWcYFAk=;
        b=qAj6VmCTWH2a/+O/fbCSOAm5j0AN9axNU9y27iuV75YBtdUN6wLuaIGCINC+x//oLg
         3S7MAsHaowlXQd2K2qfRHIbbEYdZAOQb/c00CQiWPAEUXHFI/9uB9igujoQYJQRplND7
         EtKB46ZA9rh+k/i9lHGSXRl7acifQlcSs1IYJqWIFl/nonF5eKagleD/hGSIUJZ0flGo
         PagGsoIR1HJnf5lRihkeG2nzNPeJQEDNHE9Weh1Y2IQaNbqcbFucZbmxGfrit+9oqfSH
         IHXf2xvXLgXCY0UY5ZgdDsdwJXdJySJQ2kJiKShFsywr4qEt2ZjTSeg3hDM6IgfP0i9m
         BTGg==
X-Gm-Message-State: AOJu0YxiXVdmCw0R5gqqZ+oZVcwlRQUWDZIX5I5PEzfLmlojwtrqoHlW
	XYe4pDJBZ+BXnnSsR5brCHiyOGQGYFed3P5p2nuw9abX7ZqICu67HKTuDGmb3gtxx9drlIL/Ftf
	NQe0sAkuWCUCJ512IefdzUPIY/TSSyp55gzzoZ8H0UA0OpRqOGeyl6EGMOGIVJ0uExyCV1Dq/76
	F0xiN3YfwnneN3uU6xVizsaEeqmFmibnJsXvSFE/0PYP6nzc4=
X-Gm-Gg: ASbGnctygaoZ2hzypYxG2K2TWlhHsMQBkcX0s1pY6+XrU1BpAvZJ9jre0RqdPbXK2KC
	JONB4O7dWl8tQAnTlesciExENyHZyLROQHM/s/kFEdQq/3Ton26+ILgPBe8p6dQg0+eb5EXC8+s
	bJzpClkTh8VHoV/I4veXSteNuJ9/3mEBhHF0ThO2vkBrilqBiTT5HADCgM0JFC3oIOyAu9d9C2R
	AS4z5Iy18vGiZYK+842ukk3csf51BIv14dcwnj4ju8Bxh17IQXOJE59hE9+0iRs6TR35aUcj7fS
	ewIyaa9sLuOv5yO3WvDbY7gpkeU10eTcS+EL3iv0DL8tBegBafJHRdfqA3hpwwG3DzMAbKQ=
X-Received: by 2002:a05:6000:1a8e:b0:39c:12ce:67e with SMTP id ffacd0b85a97d-39eaaebe9b2mr12343823f8f.41.1744710609342;
        Tue, 15 Apr 2025 02:50:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw8ad78S6WE7q/ocC1X8mx345RwUrR7dg9JzzjrWE6ClRK+3xTkOCj6SSrMDhQnjXLb4HRNw==
X-Received: by 2002:a05:6000:1a8e:b0:39c:12ce:67e with SMTP id ffacd0b85a97d-39eaaebe9b2mr12343795f8f.41.1744710608953;
        Tue, 15 Apr 2025 02:50:08 -0700 (PDT)
Received: from localhost (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eaf43ce0asm13726944f8f.70.2025.04.15.02.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:50:08 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	syzbot+5e8feb543ca8e12e0ede@syzkaller.appspotmail.com,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v1] mm/memory: move sanity checks in do_wp_page() after mapcount vs. refcount stabilization
Date: Tue, 15 Apr 2025 11:50:07 +0200
Message-ID: <20250415095007.569836-1-david@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In __folio_remove_rmap() for RMAP_LEVEL_PMD/RMAP_LEVEL_PUD and with
CONFIG_PAGE_MAPCOUNT we first decrement the folio mapcount (and
recompute mapped shared vs. mapped exclusively) to then adjust the
entire mapcount.

This means that another process might stumble in do_wp_page() over a
PTE-mapped PMD folio that is indicated as "exclusively mapped", but still
has an entire mapcount (PMD mapping), because it is racing with the process
that is unmapping the folio (PMD mapping). Note that do_wp_page() will
back off once it detects the remaining folio reference from the process
that is in the process of unmapping the folio.

This will trigger the early VM_WARN_ON_ONCE(folio_entire_mapcount(folio))
check in do_wp_page(), that can easily be reproduced by looping a couple
of times over allocating a PMD THP, forking a child where we immediately
unmap it again, and writing in the parent concurrently to the THP.

[  252.738129][T16470] ------------[ cut here ]------------
[  252.739267][T16470] WARNING: CPU: 3 PID: 16470 at mm/memory.c:3738 do_wp_page+0x2a75/0x2c00
[  252.740968][T16470] Modules linked in:
[  252.741958][T16470] CPU: 3 UID: 0 PID: 16470 Comm: ...
...
[  252.765841][T16470]  <TASK>
[  252.766419][T16470]  ? srso_alias_return_thunk+0x5/0xfbef5
[  252.767558][T16470]  ? rcu_is_watching+0x12/0x60
[  252.768525][T16470]  ? srso_alias_return_thunk+0x5/0xfbef5
[  252.769645][T16470]  ? srso_alias_return_thunk+0x5/0xfbef5
[  252.770778][T16470]  ? lock_acquire+0x33/0x80
[  252.771697][T16470]  ? __handle_mm_fault+0x5e8/0x3e40
[  252.772735][T16470]  ? __handle_mm_fault+0x5e8/0x3e40
[  252.773781][T16470]  __handle_mm_fault+0x1869/0x3e40
[  252.774839][T16470]  handle_mm_fault+0x22a/0x640
[  252.775808][T16470]  do_user_addr_fault+0x618/0x1000
[  252.776847][T16470]  exc_page_fault+0x68/0xd0
[  252.777775][T16470]  asm_exc_page_fault+0x26/0x30

While we could adjust the sequence in __folio_remove_rmap(), let's rater
move the mapcount sanity checks after the mapcount vs. refcount
stabilization phase. With this fix, a simple reproducer is happy.

While at it, convert the two VM_WARN_ON_ONCE() we are moving to
VM_WARN_ON_ONCE_FOLIO().

Reported-by: syzbot+5e8feb543ca8e12e0ede@syzkaller.appspotmail.com
Closes: https://lkml.kernel.org/r/67fab4fe.050a0220.2c5fcf.0011.GAE@google.com
Fixes: 1da190f4d0a6 ("mm: Copy-on-Write (COW) reuse support for PTE-mapped THP")
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 2d8c265fc7d60..625886d40e091 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3734,8 +3734,6 @@ static bool __wp_can_reuse_large_anon_folio(struct folio *folio,
 		return false;
 
 	VM_WARN_ON_ONCE(folio_test_ksm(folio));
-	VM_WARN_ON_ONCE(folio_mapcount(folio) > folio_nr_pages(folio));
-	VM_WARN_ON_ONCE(folio_entire_mapcount(folio));
 
 	if (unlikely(folio_test_swapcache(folio))) {
 		/*
@@ -3760,6 +3758,8 @@ static bool __wp_can_reuse_large_anon_folio(struct folio *folio,
 	if (folio_large_mapcount(folio) != folio_ref_count(folio))
 		goto unlock;
 
+	VM_WARN_ON_ONCE_FOLIO(folio_large_mapcount(folio) > folio_nr_pages(folio), folio);
+	VM_WARN_ON_ONCE_FOLIO(folio_entire_mapcount(folio), folio);
 	VM_WARN_ON_ONCE(folio_mm_id(folio, 0) != vma->vm_mm->mm_id &&
 			folio_mm_id(folio, 1) != vma->vm_mm->mm_id);
 
-- 
2.49.0

