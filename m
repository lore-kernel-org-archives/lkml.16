Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B4C2192FC;
	Mon, 19 May 2025 22:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694029; cv=none; b=N8N/InWaMNohp4rHo5AohlW55mHqBdTHUD/bnsh5iOr7xwumfaFdo99PCTuPVylMYHRlyFA0JJZMzs/w0oESiXsO0QUksCnogmVlkJ7PTmWifB6nyo32DHIOm2cFQhjCR2BsEqA1ScDXCtBBx9gJCuCJx3MLYfxtr/dajG0ASC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694029; c=relaxed/simple;
	bh=r9OsL9Nl6T0Z5HieIAW1BzhpNkNTe6QjRVEQBGBP3us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/M3xpaQ/QJh8xTPjDeyzHVoJc6325rpiIuS2vOQRU2BDbiZSPfkvFGY+W1z/IvR8e9iD5SHsJfdM3KtLIwTvE6dNlA7HjoaPkYzE3KXVnl3ovjXOyaWqqS3yYzHV1+q6RxKKCuaGCIxWNGd6Gs9sfmkyud2esU2tC+EGTCNU6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYtiM1Rq; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYtiM1Rq"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f8aabbffaeso46632686d6.0;
        Mon, 19 May 2025 15:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747694026; x=1748298826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBzrH2GBnquUaHeSO3w8uSRV1aMylGMB1WN2N8Pvfik=;
        b=XYtiM1RqcdpU8IzwD/G3XN0V7Fvqf2ZoXFgi6SgtijP4xXGCK/qzFDaBkjCoWyR1c4
         R2eSgCgdBqzs4k2CLbAiXiHJFisHnBWFrhK0YJ16jQvPuCsaOk2IzSQJhfZy3VfrNhTE
         ADEhakGh/f7q+BNg/EivW0XYcBYk95wA4LAV25sb/oATsOJ/iWavegMhpPb2tEdQL+IB
         4w+1c19wJWO+70zFTbbzzmGpj1hQqlrEh5bFd59VfKD+Qa2yQWBDsh5in0NKNzrJeqAf
         klxtnntiCdn2QXikR99Y1s/B2udvdJjuBm+QPBGNAOpBbjiPn+80zoR4CzeaaEm1updT
         3Q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747694026; x=1748298826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBzrH2GBnquUaHeSO3w8uSRV1aMylGMB1WN2N8Pvfik=;
        b=jU5E04hr4JR2hsfDuMOTsUFxUxTiF1UFUB8jSZJ5UdmOYd3b24+WbSYJaESTVjJwVX
         1/2sF1aVWzG9+VLm6cVUu8brNvLHulG1Utb+2EZIks5+nvmM/Kb8o+hD0rl4f7I6P5Qe
         3lmXcZsCP5XVbw8tLWQPoa587DxSK1w4W3zHaOtruYq0gf3+tiennqIk4UyI6tPbodE3
         5tHYs5rqSRjiKgZmoblf88ZPTGJdbSZRXf+DbhXtW011yfBcr8KrmvkGe8cntxywwray
         bCL6Pe3kf7qSAJW4XS4t6n0vtACMCDack10rhnrycv74BQ5o2FNvV8YroWz1ykW37n+d
         Tx8A==
X-Forwarded-Encrypted: i=1; AJvYcCUj+Y2OMY8A82j5pWMGbt/i2glnNNr/WOvP/xHSSnoQ6Gxr53jWPeRgulc9NSLSc/HhQ+Y1h0PI8AeaOEsh@vger.kernel.org, AJvYcCW4GteRNSWpPKp2KxAB7l5aACofuha/k+3wXjvUCWQbu+vT+wiH5vIAoUKisHUDByzr/S03Kew5l8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhtH2o8J5nR6vthP4uWlHIHQATV0lyaf3l0S8jHj7V0EzXthe+
	WPX6lStSSKYmR8GEtF302q69+HJ1iIVKDZRet6EVwQO1Z4baEqCBKhdR
X-Gm-Gg: ASbGncvZaIfsAyfgNzP4LKXBxUeazjEFpoEoN2XC0GDf8o6C4w+sE1IbgHRMlKlKN+3
	XqKwHRI5F4i2Lyq6LyVCL6w62Gpu5rVMqxxMtPa/d5TGP54FEogu9QGINP92o9A32M3llxUutCl
	DLveGOUJhO3HOaJlGPl4JgXmt86WOJI+yewfCUveoJiyVfU0thIjqTfnHRMwPjeUpzQvX9h4zHB
	qloQWxkl+TS5fQPFsx4aPvj+MObjtQVTplw0nSivz304RLEKNtepdnL758SquqyGqYYeCXjLdoa
	GxNCLHrTyUQN9VQ3h8YRANTbuq9si0mpR0v9g4doVpZhSm8REA==
X-Google-Smtp-Source: AGHT+IGoaL3+EMdpTKw62PROOK5NuGok7IoCsJPUMNfh1H9llowMCPFvMdWgbpfAanUPQ6/uxc12eQ==
X-Received: by 2002:a05:6214:1c09:b0:6e4:3ddc:5d33 with SMTP id 6a1803df08f44-6f8b2cfe519mr234825206d6.13.1747694026467;
        Mon, 19 May 2025 15:33:46 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:74::])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0883ed6sm62381186d6.18.2025.05.19.15.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 15:33:45 -0700 (PDT)
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
Subject: [PATCH v3 2/7] prctl: introduce PR_DEFAULT_MADV_HUGEPAGE for the process
Date: Mon, 19 May 2025 23:29:54 +0100
Message-ID: <20250519223307.3601786-3-usamaarif642@gmail.com>
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

This is set via the new PR_SET_THP_POLICY prctl. It has 2 affects:
- It sets VM_HUGEPAGE and clears VM_NOHUGEPAGE on the default VMA flags
  (def_flags). This means that every new VMA will be considered for
  hugepage.
- Iterate through every VMA in the process and call hugepage_madvise
  on it, with MADV_HUGEPAGE policy.
The policy is inherited during fork+exec.

This effectively allows setting MADV_HUGEPAGE on the entire process.
In an environment where different types of workloads are run on the
same machine, this will allow workloads that benefit from always having
hugepages to do so, without regressing those that don't.

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 include/linux/huge_mm.h                       |  1 +
 include/linux/mm.h                            |  2 +-
 include/linux/mm_types.h                      |  4 ++-
 include/uapi/linux/prctl.h                    |  4 +++
 kernel/sys.c                                  | 29 +++++++++++++++++++
 mm/huge_memory.c                              | 13 +++++++++
 tools/include/uapi/linux/prctl.h              |  4 +++
 .../trace/beauty/include/uapi/linux/prctl.h   |  4 +++
 8 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 23580a43787c..b24a2e0ae642 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -431,6 +431,7 @@ change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			__split_huge_pud(__vma, __pud, __address);	\
 	}  while (0)
 
+void process_default_madv_hugepage(struct mm_struct *mm, int advice);
 int hugepage_set_vmflags(unsigned long *vm_flags, int advice);
 int hugepage_madvise(struct vm_area_struct *vma, unsigned long *vm_flags,
 		     int advice);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 43748c8f3454..436f4588bce8 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -466,7 +466,7 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_NO_KHUGEPAGED (VM_SPECIAL | VM_HUGETLB)
 
 /* This mask defines which mm->def_flags a process can inherit its parent */
-#define VM_INIT_DEF_MASK	VM_NOHUGEPAGE
+#define VM_INIT_DEF_MASK	(VM_HUGEPAGE | VM_NOHUGEPAGE)
 
 /* This mask represents all the VMA flag bits used by mlock */
 #define VM_LOCKED_MASK	(VM_LOCKED | VM_LOCKONFAULT)
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index e76bade9ebb1..f1836b7c5704 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1703,6 +1703,7 @@ enum {
 					/* leave room for more dump flags */
 #define MMF_VM_MERGEABLE	16	/* KSM may merge identical pages */
 #define MMF_VM_HUGEPAGE		17	/* set when mm is available for khugepaged */
+#define MMF_VM_HUGEPAGE_MASK	(1 << MMF_VM_HUGEPAGE)
 
 /*
  * This one-shot flag is dropped due to necessity of changing exe once again
@@ -1742,7 +1743,8 @@ enum {
 
 #define MMF_INIT_MASK		(MMF_DUMPABLE_MASK | MMF_DUMP_FILTER_MASK |\
 				 MMF_DISABLE_THP_MASK | MMF_HAS_MDWE_MASK |\
-				 MMF_VM_MERGE_ANY_MASK | MMF_TOPDOWN_MASK)
+				 MMF_VM_MERGE_ANY_MASK | MMF_TOPDOWN_MASK |\
+				 MMF_VM_HUGEPAGE_MASK)
 
 static inline unsigned long mmf_init_flags(unsigned long flags)
 {
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 15c18ef4eb11..15aaa4db5ff8 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -364,4 +364,8 @@ struct prctl_mm_map {
 # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
 # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
 
+#define PR_SET_THP_POLICY		78
+#define PR_GET_THP_POLICY		79
+#define PR_DEFAULT_MADV_HUGEPAGE	0
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index c434968e9f5d..74397ace62f3 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2474,6 +2474,7 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 		unsigned long, arg4, unsigned long, arg5)
 {
 	struct task_struct *me = current;
+	struct mm_struct *mm = me->mm;
 	unsigned char comm[sizeof(me->comm)];
 	long error;
 
@@ -2658,6 +2659,34 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			clear_bit(MMF_DISABLE_THP, &me->mm->flags);
 		mmap_write_unlock(me->mm);
 		break;
+	case PR_GET_THP_POLICY:
+		if (arg2 || arg3 || arg4 || arg5)
+			return -EINVAL;
+		if (mmap_write_lock_killable(mm))
+			return -EINTR;
+		if (mm->def_flags & VM_HUGEPAGE)
+			error = PR_DEFAULT_MADV_HUGEPAGE;
+		mmap_write_unlock(mm);
+		break;
+	case PR_SET_THP_POLICY:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		if (mmap_write_lock_killable(mm))
+			return -EINTR;
+		switch (arg2) {
+		case PR_DEFAULT_MADV_HUGEPAGE:
+			if (!hugepage_global_enabled())
+				error = -EPERM;
+			error = hugepage_set_vmflags(&mm->def_flags, MADV_HUGEPAGE);
+			if (!error)
+				process_default_madv_hugepage(mm, MADV_HUGEPAGE);
+			break;
+		default:
+			error = -EINVAL;
+			break;
+		}
+		mmap_write_unlock(mm);
+		break;
 	case PR_MPX_ENABLE_MANAGEMENT:
 	case PR_MPX_DISABLE_MANAGEMENT:
 		/* No longer implemented: */
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2780a12b25f0..72806fe772b5 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -98,6 +98,19 @@ static inline bool file_thp_enabled(struct vm_area_struct *vma)
 	return !inode_is_open_for_write(inode) && S_ISREG(inode->i_mode);
 }
 
+void process_default_madv_hugepage(struct mm_struct *mm, int advice)
+{
+	struct vm_area_struct *vma;
+	unsigned long vm_flags;
+
+	mmap_assert_write_locked(mm);
+	VMA_ITERATOR(vmi, mm, 0);
+	for_each_vma(vmi, vma) {
+		vm_flags = vma->vm_flags;
+		hugepage_madvise(vma, &vm_flags, advice);
+	}
+}
+
 unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 					 unsigned long vm_flags,
 					 unsigned long tva_flags,
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

