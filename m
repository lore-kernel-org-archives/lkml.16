Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21872191;
	Thu, 15 May 2025 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747316126; cv=none; b=Tb2i1UD8NbUFXOJ4plRRTt817VnawH6GtsgbUuCRVV/DBJNdOYRUQW3S9Ec1cNoQ7rbB1uZCEdkAdlCf3JpfNHsCemDrHcANWg2hNQUiDq5Sm6vTJ3cwdFOVjtKk58ncjkcxqhNsXMBRNlGVqDr6yD7YfylYfq4GQb57LKL2CaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747316126; c=relaxed/simple;
	bh=ywrAeMMuDzvoRx5DiPJuP00JWBZm37GhnxdqiAAQFvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YD+lLxgd2SKiOjmctb6r9vr8DnmBQ17UOtGF3NsJmok1QdMrl3EvGbgAZoW9TGz7qvX/AovjJaYPDMwGJ9+wd0sOamMICiiT7omUjJQaispG8e+xPlRtBwpzMsSK8uVnpFHpdY28C1s9dg2HhEJRZk8Snu7HdpdtbnfyvN43ANU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHY1ujhg; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHY1ujhg"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c54b651310so123179685a.0;
        Thu, 15 May 2025 06:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747316124; x=1747920924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3W70vOJiI6A4ZfVZFm0AS9kx4wlEEr6sA0Z5zAoPECo=;
        b=KHY1ujhgveni1E6h6Cn74riq9t1Zvwh3BQCeo1WmRlCP/z88WWCPindOimsm8Or0r1
         +EB5/hhZ9CBtNHdV/55IWiwyhr5IyoVvsJbC6vMl2TsG1lK52KXTPsVdsKS3A7EymM8C
         y2bJCk5qY9wjjrDziOvwLcWJqpnQMfJcr2HcWXGNZmEWEJmz+GOTbftaLQ79JPI3A3uF
         Ew08y+/C2vtatAJnrRzr+DURLF5JM0E0liQj/O787hcOx8nPbqQSH1SC7Z57vd5plbxG
         pECThbEClXSi5F+dEceLGN13ANAQikW02sQzJW8ftmFQOQ7cNNwKgSQ1WXuPtar5uQ+d
         IHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747316124; x=1747920924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3W70vOJiI6A4ZfVZFm0AS9kx4wlEEr6sA0Z5zAoPECo=;
        b=L8XFf3lPmnnlU6Q9HVYTFIFDmonBAzqMBgOihnYdybjXJArw+hTdoscnryocic/m3y
         PqEOqZxdi3CnUXDoXzq0eDEzwwLLK4pRBh4AtHwf2BxNoqdhrLxtFIpSoTxOtnJ8unGh
         I4EWHFRRtf7yOjlNgHackaqr73tYCqYc1klj3zkHF/K3Suyl9x2FtahYiT8VKSz5ebJd
         KpwwAmvnYnhMFa9fXONdO1jtYFv4sCylPnLv/ZdMhYWNlu6BxRCUvA/kl5t1xVmmfr+p
         pfCaZ7snutbibTCXJ+o1Qg2Ho+wDwF4g/MoJ/Q6TPr1dN5yUu6xFhQ68Zn3Lavv5mn+j
         vsUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3oyB436/XKR0CWi2IVivnbiWPb7Kb2kY5Op0L22w751fETc4akYOCnjTtu80HDOqe/M2C1IG4gPCPp7IW@vger.kernel.org, AJvYcCXqtwbw8nlJNVbQ0URJT6ZwvGSNHkBtv7iwlV3PjtbUZnECS5+ToBNh4EV/ASfgTOPdOM/4UWkMpdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoA9VB83GTGxwsDWk0t32X2pRQIdlrH8L/c847nj+mB/Yq3ANS
	CgtYERrAcAykfL1qCjwvCQV+Mv7PgeMFhK6vx4OLjfCasfoC5DIl
X-Gm-Gg: ASbGncuYrlhjYfnmL65WmEatGkGiF7yMchHP9uHqpfVXUWniRAxrgPCfV9nM+X2vEST
	6C0bIqHatIMPNAXpvCzGefISuPCD3ho2bXxP6f06Dj3QU0T7MVvDq488cpjvZVECsAbHHJIG/hD
	vanKOaUl8jqUrZTJu4SfJ6cu7XiLePO3N23VSqXCh6YhLVl3Az2lFt8PUfyPmEPmF2wneUz7/Ba
	xL7hYrjPEPVdVN8s6Tgqk+3he7EZXiJ+cOla1dWfOINvW48JGbkeuVvwyA3UUlFigPHUTPEKS/6
	lDCIjRIGXT16ZyqCMKJzEIFK0knEIqRx8eq6MqdZLA3XlnuC
X-Google-Smtp-Source: AGHT+IGJfUgB6Cz7ZrvVPSp8W9uKmh5QpcoRFlMZ3ENFrZ5CQG6eq62jYYnhP0dl3rkIpmEEEM3nIA==
X-Received: by 2002:a05:620a:2697:b0:7c5:4a8e:b6b with SMTP id af79cd13be357-7cd3c8099d4mr324281385a.46.1747316123724;
        Thu, 15 May 2025 06:35:23 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:7::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd295f0020sm251419785a.3.2025.05.15.06.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:35:23 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the process
Date: Thu, 15 May 2025 14:33:30 +0100
Message-ID: <20250515133519.2779639-2-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250515133519.2779639-1-usamaarif642@gmail.com>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is set via the new PR_SET_THP_POLICY prctl.
This will set the MMF2_THP_VMA_DEFAULT_HUGE process flag
which changes the default of new VMAs to be VM_HUGEPAGE. The
call also modifies all existing VMAs that are not VM_NOHUGEPAGE
to be VM_HUGEPAGE. The policy is inherited during fork+exec.

This allows systems where the global policy is set to "madvise"
to effectively have THPs always for the process. In an environment
where different types of workloads are stacked on the same machine,
this will allow workloads that benefit from always having hugepages
to do so, without regressing those that don't.

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 include/linux/huge_mm.h                       |  3 ++
 include/linux/mm_types.h                      | 11 +++++++
 include/uapi/linux/prctl.h                    |  4 +++
 kernel/fork.c                                 |  1 +
 kernel/sys.c                                  | 21 ++++++++++++
 mm/huge_memory.c                              | 32 +++++++++++++++++++
 mm/vma.c                                      |  2 ++
 tools/include/uapi/linux/prctl.h              |  4 +++
 .../trace/beauty/include/uapi/linux/prctl.h   |  4 +++
 9 files changed, 82 insertions(+)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 2f190c90192d..e652ad9ddbbd 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -260,6 +260,9 @@ static inline unsigned long thp_vma_suitable_orders(struct vm_area_struct *vma,
 	return orders;
 }
 
+void vma_set_thp_policy(struct vm_area_struct *vma);
+void process_vmas_thp_default_huge(struct mm_struct *mm);
+
 unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 					 unsigned long vm_flags,
 					 unsigned long tva_flags,
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index e76bade9ebb1..2fe93965e761 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1066,6 +1066,7 @@ struct mm_struct {
 		mm_context_t context;
 
 		unsigned long flags; /* Must use atomic bitops to access */
+		unsigned long flags2;
 
 #ifdef CONFIG_AIO
 		spinlock_t			ioctx_lock;
@@ -1744,6 +1745,11 @@ enum {
 				 MMF_DISABLE_THP_MASK | MMF_HAS_MDWE_MASK |\
 				 MMF_VM_MERGE_ANY_MASK | MMF_TOPDOWN_MASK)
 
+#define MMF2_THP_VMA_DEFAULT_HUGE		0
+#define MMF2_THP_VMA_DEFAULT_HUGE_MASK		(1 << MMF2_THP_VMA_DEFAULT_HUGE)
+
+#define MMF2_INIT_MASK		(MMF2_THP_VMA_DEFAULT_HUGE_MASK)
+
 static inline unsigned long mmf_init_flags(unsigned long flags)
 {
 	if (flags & (1UL << MMF_HAS_MDWE_NO_INHERIT))
@@ -1752,4 +1758,9 @@ static inline unsigned long mmf_init_flags(unsigned long flags)
 	return flags & MMF_INIT_MASK;
 }
 
+static inline unsigned long mmf2_init_flags(unsigned long flags)
+{
+	return flags & MMF2_INIT_MASK;
+}
+
 #endif /* _LINUX_MM_TYPES_H */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 15c18ef4eb11..325c72f40a93 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -364,4 +364,8 @@ struct prctl_mm_map {
 # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
 # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
 
+#define PR_SET_THP_POLICY		78
+#define PR_GET_THP_POLICY		79
+#define PR_THP_POLICY_DEFAULT_HUGE	0
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/fork.c b/kernel/fork.c
index 9e4616dacd82..6e5f4a8869dc 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1054,6 +1054,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
 
 	if (current->mm) {
 		mm->flags = mmf_init_flags(current->mm->flags);
+		mm->flags2 = mmf2_init_flags(current->mm->flags2);
 		mm->def_flags = current->mm->def_flags & VM_INIT_DEF_MASK;
 	} else {
 		mm->flags = default_dump_filter;
diff --git a/kernel/sys.c b/kernel/sys.c
index c434968e9f5d..1115f258f253 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2658,6 +2658,27 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			clear_bit(MMF_DISABLE_THP, &me->mm->flags);
 		mmap_write_unlock(me->mm);
 		break;
+	case PR_GET_THP_POLICY:
+		if (arg2 || arg3 || arg4 || arg5)
+			return -EINVAL;
+		if (!!test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2))
+			error = PR_THP_POLICY_DEFAULT_HUGE;
+		break;
+	case PR_SET_THP_POLICY:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		if (mmap_write_lock_killable(me->mm))
+			return -EINTR;
+		switch (arg2) {
+		case PR_THP_POLICY_DEFAULT_HUGE:
+			set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2);
+			process_vmas_thp_default_huge(me->mm);
+			break;
+		default:
+			return -EINVAL;
+		}
+		mmap_write_unlock(me->mm);
+		break;
 	case PR_MPX_ENABLE_MANAGEMENT:
 	case PR_MPX_DISABLE_MANAGEMENT:
 		/* No longer implemented: */
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2780a12b25f0..64f66d5295e8 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -98,6 +98,38 @@ static inline bool file_thp_enabled(struct vm_area_struct *vma)
 	return !inode_is_open_for_write(inode) && S_ISREG(inode->i_mode);
 }
 
+void vma_set_thp_policy(struct vm_area_struct *vma)
+{
+	struct mm_struct *mm = vma->vm_mm;
+
+	if (test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2))
+		vm_flags_set(vma, VM_HUGEPAGE);
+}
+
+static void vmas_thp_default_huge(struct mm_struct *mm)
+{
+	struct vm_area_struct *vma;
+	unsigned long vm_flags;
+
+	VMA_ITERATOR(vmi, mm, 0);
+	for_each_vma(vmi, vma) {
+		vm_flags = vma->vm_flags;
+		if (vm_flags & VM_NOHUGEPAGE)
+			continue;
+		vm_flags_set(vma, VM_HUGEPAGE);
+	}
+}
+
+void process_vmas_thp_default_huge(struct mm_struct *mm)
+{
+	if (test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2))
+		return;
+
+	set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2);
+	vmas_thp_default_huge(mm);
+}
+
+
 unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 					 unsigned long vm_flags,
 					 unsigned long tva_flags,
diff --git a/mm/vma.c b/mm/vma.c
index 1f2634b29568..101b19c96803 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2476,6 +2476,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
 	if (!vma_is_anonymous(vma))
 		khugepaged_enter_vma(vma, map->flags);
 	ksm_add_vma(vma);
+	vma_set_thp_policy(vma);
 	*vmap = vma;
 	return 0;
 
@@ -2705,6 +2706,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	mm->map_count++;
 	validate_mm(mm);
 	ksm_add_vma(vma);
+	vma_set_thp_policy(vma);
 out:
 	perf_event_mmap(vma);
 	mm->total_vm += len >> PAGE_SHIFT;
diff --git a/tools/include/uapi/linux/prctl.h b/tools/include/uapi/linux/prctl.h
index 35791791a879..f5945ebfe3f2 100644
--- a/tools/include/uapi/linux/prctl.h
+++ b/tools/include/uapi/linux/prctl.h
@@ -328,4 +328,8 @@ struct prctl_mm_map {
 # define PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC	0x10 /* Clear the aspect on exec */
 # define PR_PPC_DEXCR_CTRL_MASK		0x1f
 
+#define PR_SET_THP_POLICY		78
+#define PR_GET_THP_POLICY		79
+#define PR_THP_POLICY_DEFAULT_HUGE	0
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/tools/perf/trace/beauty/include/uapi/linux/prctl.h b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
index 15c18ef4eb11..325c72f40a93 100644
--- a/tools/perf/trace/beauty/include/uapi/linux/prctl.h
+++ b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
@@ -364,4 +364,8 @@ struct prctl_mm_map {
 # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
 # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
 
+#define PR_SET_THP_POLICY		78
+#define PR_GET_THP_POLICY		79
+#define PR_THP_POLICY_DEFAULT_HUGE	0
+
 #endif /* _LINUX_PRCTL_H */
-- 
2.47.1

