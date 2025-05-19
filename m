Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F03F1EF382;
	Mon, 19 May 2025 22:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694028; cv=none; b=fd+IDNuY3K8PmylsvEbqz2oSw8tVTdV/siA65dUUGtv1YkFx3Zf0mf+2LJjZEDoXmowGs0cwtyu8KnLrtHB6kCeLu+3Rz1CKFhA0Yo61kNsFKWHnKELhFeiiwaHBAwhR0ED+FZOcUDVqXxUfEkRKkKsDWH14kphnpZDAD6JZiKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694028; c=relaxed/simple;
	bh=PfAY27T09TjnJ/nIpVYoM9+S1fT0+OEtJubTxVt/1WE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHjSzDD5jy68i8lnMYWooFiVbD6qA/UzROq67w7m7Rl8QoSxDb12vbZIu5j4t48hFEG7qrEk5U4D7Pzk8/adcpIhPUS6LXCnyHamMwPDSoocd2gUwS7Hb7FUB+b5YbYAkCGSGJesV3oVDBCWjsrrum1GTglhFAegaBXYKzCIc7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0BZmtx+; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0BZmtx+"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47ae894e9b7so91042401cf.3;
        Mon, 19 May 2025 15:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747694025; x=1748298825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZoVm58CBAxFKJ1NXNNUrIOPj0gNvc2sOGcRB/nswhY=;
        b=e0BZmtx+V8+9LF1CheNx/AwLBGS1pTXSOnSMFejkAytkePnEscForSB6/+w/byxXh7
         3YxlXaXHCZ064msksFCrb1V+0QRcBqmaO/Lf5NtCuslschlBRY9s/mMGc6DjJa822Plx
         gMmfaTwkMVqBRseN3nk1x1Z4pS27bgvLvaSv7wxlmDqWiBx7J3OGM558vFf7hidBJKFS
         T4OY7DjnaUrGqzvY9hQeSm4p5vy7Yf0cMkIwalnQEFIF6FdtPNUeyPMlNuqXeAAogWFp
         jT79BJ4xfJnPM9g0e7wGS7C6zfKHPPjE23HX0JiHnDBo1jcGe3sK0fqcyUUMg48VAAaH
         zGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747694025; x=1748298825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZoVm58CBAxFKJ1NXNNUrIOPj0gNvc2sOGcRB/nswhY=;
        b=XhhKAPLIXUZ4eyxKg5X6txTKGzPKYfcOjntR//57S78Tuya6Ip5OMu8EiRhCS1zqLS
         +pqIi3HKApZdW3TB+pi8dWvK1yhzV1t8PJTKLsNEHOPnN5YRlpeFPIb/GjB5ysKBcTvx
         LSD3qdKqRZRS/Z/7XjSogFi5RuNYKcfJ7+ZooZINSbt/ok6bezzTkJ2EdRTbhqi2qgpE
         ZAYqIht0ofo24SQcHcptOypnia41iF6HyunY1HMs+jGRSQkfdZ4ZegJE74jooDVjD1B8
         nWdGhzdHteDYoflFvAaAu1Ccwox9hoOY7lOQt6loCHXzQFsQfo/EFfg2K6iKftiBiQ2u
         NnSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5neIVVOn6X4//P7gLRBwwHBYToE/fJmxBp7eQAGXV3gc+ihFvyS6DDp9C6IsQzS1SlSs5fvICzPs=@vger.kernel.org, AJvYcCXBNuwIqnhmXXj0e1P7VSkA9YgHv33gCMkP/zRQ/d7cNaT2yrbT/gT7hwxcamFXbA0ZmjOhpMsmGtTKX+MO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy/I+20yBnQBOzWIAWTW3RDNXkwb4ZuFTEE07ZciFdUpXlGmp/
	zqJfIymdkWMSuXbYl939csQVDH7pZ0FZLIDL05PpDr4Bj4k7/GtmTH9I
X-Gm-Gg: ASbGnctQScXGjocjIm8PXNlaCUZnraG7/oc5/0dDxr/yD6de95Rf8NFEMUxg+gHVxvp
	/A1K8eh0aw8mrvqs7fILc79+2XA0KVks5KhGJ8bv67V0Z0cGaiq0EWjE/0L2KOA4xiOtECwdshI
	bTZBXdVBE98MdqLH+tI+memyx7Y41ciha5YGJu0/uEO7y1aQ4Um30VigirhGiDoZYBjWwgEsMJT
	oyQId+4V6ADNimCR95VYqibfyvAWU5h4eJyzigYp9XFu0WjYnLev+OTejuubDJODTQmsaJq6ely
	bTylGhAP9f5mLQwM4jNWChtwD71x5Avm/ovFmvEsNlmmIlVq
X-Google-Smtp-Source: AGHT+IFSgdGO5NmmqTJLvtd4NIb4WXRuj3aQMKYRB2sVptgzNbInCwcG2zfX8HRipunbeXTsp22ejw==
X-Received: by 2002:a05:622a:5519:b0:491:286a:8606 with SMTP id d75a77b69052e-494b00e92e2mr230773771cf.0.1747694025116;
        Mon, 19 May 2025 15:33:45 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:7::])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494b344924fsm57559991cf.40.2025.05.19.15.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 15:33:44 -0700 (PDT)
From: Usama Arif <usamaarif642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@redhat.com,
	linux-mm@kvack.org
Cc: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	riel@surriel.com,
	ziy@nvidia.com,
	laoar.shao@gmail.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	vbabka@suse.cz,
	jannh@google.com,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH v3 1/7] mm: khugepaged: extract vm flag setting outside of hugepage_madvise
Date: Mon, 19 May 2025 23:29:53 +0100
Message-ID: <20250519223307.3601786-2-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250519223307.3601786-1-usamaarif642@gmail.com>
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is so that flag setting can be resused later in other functions,
to reduce code duplication (including the s390 exception).

No functional change intended with this patch.

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 include/linux/huge_mm.h |  1 +
 mm/khugepaged.c         | 26 +++++++++++++++++---------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 2f190c90192d..23580a43787c 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -431,6 +431,7 @@ change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			__split_huge_pud(__vma, __pud, __address);	\
 	}  while (0)
 
+int hugepage_set_vmflags(unsigned long *vm_flags, int advice);
 int hugepage_madvise(struct vm_area_struct *vma, unsigned long *vm_flags,
 		     int advice);
 int madvise_collapse(struct vm_area_struct *vma,
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b04b6a770afe..ab3427c87422 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -346,8 +346,7 @@ struct attribute_group khugepaged_attr_group = {
 };
 #endif /* CONFIG_SYSFS */
 
-int hugepage_madvise(struct vm_area_struct *vma,
-		     unsigned long *vm_flags, int advice)
+int hugepage_set_vmflags(unsigned long *vm_flags, int advice)
 {
 	switch (advice) {
 	case MADV_HUGEPAGE:
@@ -358,16 +357,10 @@ int hugepage_madvise(struct vm_area_struct *vma,
 		 * ignore the madvise to prevent qemu from causing a SIGSEGV.
 		 */
 		if (mm_has_pgste(vma->vm_mm))
-			return 0;
+			return -EPERM;
 #endif
 		*vm_flags &= ~VM_NOHUGEPAGE;
 		*vm_flags |= VM_HUGEPAGE;
-		/*
-		 * If the vma become good for khugepaged to scan,
-		 * register it here without waiting a page fault that
-		 * may not happen any time soon.
-		 */
-		khugepaged_enter_vma(vma, *vm_flags);
 		break;
 	case MADV_NOHUGEPAGE:
 		*vm_flags &= ~VM_HUGEPAGE;
@@ -383,6 +376,21 @@ int hugepage_madvise(struct vm_area_struct *vma,
 	return 0;
 }
 
+int hugepage_madvise(struct vm_area_struct *vma,
+		     unsigned long *vm_flags, int advice)
+{
+	if (advice == MADV_HUGEPAGE && !hugepage_set_vmflags(vm_flags, advice)) {
+		/*
+		 * If the vma become good for khugepaged to scan,
+		 * register it here without waiting a page fault that
+		 * may not happen any time soon.
+		 */
+		khugepaged_enter_vma(vma, *vm_flags);
+	}
+
+	return 0;
+}
+
 int __init khugepaged_init(void)
 {
 	mm_slot_cache = KMEM_CACHE(khugepaged_mm_slot, 0);
-- 
2.47.1

