Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395051E7C03
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749112316; cv=none; b=BGK/YqPtvm+vTr6GI1gtuT73VDlBN1R9HW51sh0tL5lw2lY/z5OIeQqGLOivCEwDKCisTHGMnp8jxQxf45AV1OdRCdE5dhuZer56uwN0X+ITx/WB1s0g4dn86IfTEiS6BEz0G0UOcJ9jhKTyshszR3QkRwJDGRH1V1ZU0/a+buo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749112316; c=relaxed/simple;
	bh=DeOd8XgGcIjDMAOh0QUwUFWqGLQCohEE+iXkVm8FbaY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Rbz6mbz8/SYlXsaJ5j1acMRr5PRs+T0hx4Q0Pg8C4oFv1L7sG4LP8s14uJwYTrePugnVAjwyyrWbZG3g9VEyAswBGsKaMnGmkKeOB2Kcm7f3INm3D50O9as3w90Nc/M4EPYeY8RnZHPPShMxwPQn8qaGW8SijVJQLPJwzOjctP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tqv12pYV; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tqv12pYV"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-231e98e46c0so6791905ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 01:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749112314; x=1749717114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W1N43O0IPzCZgGOpE9PSizViGGl/Him1EwSIbXxaLPk=;
        b=Tqv12pYV25//aDKArNtS406itT9ePyb57Oza8eCLsggsy4hbmvMUG78vglWglvNLiZ
         M+3PUl7mcXXRaF2X9QXM5DYLja+jr01W0yGDp6UmUtMtjEfTFNj6nLwCeiPIjbrPk/Gc
         MS897lTvGcGGJvMyU21IXqZQ11z7jplSTKu4uW3Fx5ZI0FI7uKXH7L8fijDxdkVE3JKC
         2yUqsEEKh5W4fk99571NG4UInZyJr94xxXMpJ/rqGkCkbyjf5f1+QnCaOe1hJm0XRSUB
         EgPfz7ooccy/Zy2VfUyS8Y3PE4DMKUizi8PirC/PsboJ78+kfsDA3fm7s/5fKA0vdyyW
         +eSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749112314; x=1749717114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1N43O0IPzCZgGOpE9PSizViGGl/Him1EwSIbXxaLPk=;
        b=qKcy1qMb3F03p6DAbXHMm3IZeJlY7fjEh90aE6u3Nm7DylWScNg3w0JpMKhpKwOWC9
         TJsNBFXXOg29ZfN/Cs9WR+7+VfK8SlHa+211bjlI2kDhRaQ7o0c3kweDklrdQteCYBko
         kAO3EbdO6IwmwsgBpht8PbnptDwviSlUXcD3SyLz+LrYpskUGl6vtu5v3NajyAi2vpsY
         vqlfvZgyu1zeRNH4qja5Gtqs1K/mvIKBVcrAgrD/gaa1u4kv/23LaQWn8eHzANCH8CYs
         L9MtuRbkUHgLe8bnT0cP0RAKLasLDWizd5T5TKRyLF4aZY9DsTz5MYcEwi1CjiTG0RwU
         dEig==
X-Forwarded-Encrypted: i=1; AJvYcCUQaoH9T1vhmrPa5nlLdN7ZGrpaAQsFQeOMyqAJOIWuKaZrB0m53UdE+/DJ/4IW3IvZLFPelVFDgtAfYmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYGy9J/l+zAi2d8a9NTC6Us6U3gPdZ1oketRiPOHyH1V7+dUK0
	/jyoo1/hkxRFkgYDYkE6ueFWAUR4XOgPIkgjWt64Lquj/VyUOJtBoZ2H
X-Gm-Gg: ASbGncvmP43S0BsGA/9wP2KCcv7V+lm/EqXNlFONo/2gqn+EKKjRDSU26Vdn2sEsCdw
	VSNhH6Lafu1VapoPay08OLETyVDvXckZ4Lxe6yxyEVuF81jzN3TRDcEIJWJ+7IkZbD1BY0CEcI/
	tfYe/PN7b0yx3EbTLXymlZLh9kyJtBCNazdb2T2R330mwCcI4jVIdubHiNVQPytS1K9XyrSyh3B
	ELNf4dAQsFH+cQifmgQ5cq/DW+OQceIE381gkAgWct8BVoLhqkRVK7sk3CoN1pROgUm9D+sdBp1
	AC/DCwMHanUJivhKpD0zLDyd9z7m3ful8bF+l6UktF5Mzr9kxu6IxvxDILPGqa0yc0Fp
X-Google-Smtp-Source: AGHT+IHKZmoqe9eJZLdjSZjmAb9Z0ljuQq3KvmuBOUt5RIMd27T8fNc0ZChvbzWquciamYF2FEiKUA==
X-Received: by 2002:a17:902:ce8e:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-235e114f0e6mr83321845ad.23.1749112314338;
        Thu, 05 Jun 2025 01:31:54 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.145.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-235e5aafb37sm19991245ad.203.2025.06.05.01.31.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Jun 2025 01:31:53 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>,
	Dev Jain <dev.jain@arm.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: [PATCH v2] mm: madvise: use walk_page_range_vma() instead of walk_page_range()
Date: Thu,  5 Jun 2025 20:31:44 +1200
Message-Id: <20250605083144.43046-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Barry Song <v-songbaohua@oppo.com>

We've already found the VMA within madvise_walk_vmas() before calling
specific madvise behavior functions like madvise_free_single_vma().
So calling walk_page_range() and doing find_vma() again seems
unnecessary. It also prevents potential optimizations in those madvise
callbacks, particularly the use of dedicated per-VMA locking.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Lokesh Gidra <lokeshgidra@google.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 -v2:
  * Also extend the modification to callbacks beyond
    madvise_free_single_vma() since the code flow is
    the same - Dev, Lorenzo
 -rfc:
  https://lore.kernel.org/linux-mm/20250603013154.5905-1-21cnbao@gmail.com/

 mm/madvise.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 5f7a66a1617e..56d9ca2557b9 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -282,7 +282,7 @@ static long madvise_willneed(struct vm_area_struct *vma,
 	*prev = vma;
 #ifdef CONFIG_SWAP
 	if (!file) {
-		walk_page_range(vma->vm_mm, start, end, &swapin_walk_ops, vma);
+		walk_page_range_vma(vma, start, end, &swapin_walk_ops, vma);
 		lru_add_drain(); /* Push any new pages onto the LRU now */
 		return 0;
 	}
@@ -581,7 +581,7 @@ static void madvise_cold_page_range(struct mmu_gather *tlb,
 	};
 
 	tlb_start_vma(tlb, vma);
-	walk_page_range(vma->vm_mm, addr, end, &cold_walk_ops, &walk_private);
+	walk_page_range_vma(vma, addr, end, &cold_walk_ops, &walk_private);
 	tlb_end_vma(tlb, vma);
 }
 
@@ -619,7 +619,7 @@ static void madvise_pageout_page_range(struct mmu_gather *tlb,
 	};
 
 	tlb_start_vma(tlb, vma);
-	walk_page_range(vma->vm_mm, addr, end, &cold_walk_ops, &walk_private);
+	walk_page_range_vma(vma, addr, end, &cold_walk_ops, &walk_private);
 	tlb_end_vma(tlb, vma);
 }
 
@@ -825,7 +825,7 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
 
 	mmu_notifier_invalidate_range_start(&range);
 	tlb_start_vma(tlb, vma);
-	walk_page_range(vma->vm_mm, range.start, range.end,
+	walk_page_range_vma(vma, range.start, range.end,
 			&madvise_free_walk_ops, tlb);
 	tlb_end_vma(tlb, vma);
 	mmu_notifier_invalidate_range_end(&range);
@@ -1160,7 +1160,7 @@ static long madvise_guard_install(struct vm_area_struct *vma,
 		unsigned long nr_pages = 0;
 
 		/* Returns < 0 on error, == 0 if success, > 0 if zap needed. */
-		err = walk_page_range_mm(vma->vm_mm, start, end,
+		err = walk_page_range_vma(vma, start, end,
 					 &guard_install_walk_ops, &nr_pages);
 		if (err < 0)
 			return err;
@@ -1244,7 +1244,7 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
 	if (!is_valid_guard_vma(vma, /* allow_locked = */true))
 		return -EINVAL;
 
-	return walk_page_range(vma->vm_mm, start, end,
+	return walk_page_range_vma(vma, start, end,
 			       &guard_remove_walk_ops, NULL);
 }
 
-- 
2.39.3 (Apple Git-146)

