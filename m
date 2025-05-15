Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3054B86250;
	Thu, 15 May 2025 13:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747316127; cv=none; b=pQ2prXHvNvJ/PuX2Xq8mbXhT9kF1EhXvMAHqLYqMg/tkZR0NUu138dpHs3dpc1hPnZBjbWN6ZswGo3pvcXHFoH87urWKFct8PHkVxZ1R6RJxYeWLjcDowh4tP6CQB0TLQgGAAZhJY67GENz8G5ljZ08BrtOI9Hlx2uia3hyvjvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747316127; c=relaxed/simple;
	bh=n/5KG+GgbAhfVnu3caHI6mB6U1b3sTe5vD341ScfX1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIe6CJhLjEZrz7AvXvxoWnHeBlvbvQ4kitUS7HJNNyoxwTtxz1fnF5G1i3ITwJ1NauF9vcGFLxAzUm/LysCIS1D1o89Cwv73akF4lQOL7gXT32LdyxG6BkCRAWu+zJoMJMEuzyYMFN0vK/6Lr5FGpSGmMYPqKI+MokoJ5IUKJog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjWrQBoc; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjWrQBoc"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c922734cc2so111275185a.1;
        Thu, 15 May 2025 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747316125; x=1747920925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/DF6x64D/fKACEnPhLYyL2miQ9EFIvp0WGBVg1OxD0=;
        b=NjWrQBocHdwRWacf1OTfPsGsqWr2wUvetpufEX+SLYDhOfxvpZzCtyxIJUPyk+dXzW
         2ctPRJRSbPwLrwnxY09CVT/7+L3mhTOiCxYSs/hnVUmUGicYcakTrJRdTxua5QrsRd71
         XFyI21rrwBLou1QN0ljO47nUvF1CVg3PL41kU+x/D7tYy2JC0cYTNV55SUw8kSWtYQMk
         S4XJiCdO48ykK6F66KcuFXPzYC9bT4fZXXAtZd+EBkFULTOF+3FVp/BSqZJbYW+srTuM
         D9Bvz//jTjttM6Fn/YvbFOJU+Ed2e+ePiPGWjCmDcbKSWy2d0k3rXTgqOWmy4UVf3rnd
         dCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747316125; x=1747920925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/DF6x64D/fKACEnPhLYyL2miQ9EFIvp0WGBVg1OxD0=;
        b=ankaNlDgp3ZB9OYmdbFdZOX1/FhwkEHxcowkma/lOa5C00azz1LtuyrIi2wE0E2w8j
         08NuU3hYWetU2dBdf47qCaGtnZH9vsmxT6yKF31ajsjIGxOuJuXk+tGg/3ZkX8Ahi+eL
         vrB1yiTrHy6JMyNAK0ZKwFSLpkSlGmAcEnEp8+5mb/S2kmbKjxzayEggQmtWh9EzjYix
         G9RxxVYVI46LQDx47rztaYDUPyqiAz1+JKYZqkz47wrFGk83NvJ5MCH24MACPEA94Yyv
         E3XK8qCxCcG8dXbz9YruhMS0rWRnKuLWFRr7o2eHqaQsFm0schh5nuqp4Cwo2TPpPkhQ
         3qHg==
X-Forwarded-Encrypted: i=1; AJvYcCUnJE0E/EOba7r1L5wBS39gxH6LfZZlYYfnhniYRyiO3yiz2YUj1bZ4c1nH7jAtMp/1EqOLZG11VN9WEdPQ@vger.kernel.org, AJvYcCUvT3NyYbzT1jwdKB7/dKAi+QKcxQrACer/eN7270I0cdTFP/bLoDYlvfqWcxTevK9B635tQ6WF3AE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGKSXtnAEb7uJJJLyr/KOHXHdVmAE57FCeFsT+1JQgqO0rdDSu
	HcZn7dQBXHan53O3UTQmKQLH9QwLLri82C5vrVFN1RIjtSaeGYtB
X-Gm-Gg: ASbGncv1IilA+ev9R6jS50bMrsWhOltXBhJluM6GyylFWFZluyjpIdm0bdR43BCT/i8
	pwlEbnpIS0En75rQ84wRm6qhyIPagcSbMdB4bP25Ps4q2ss6MV9q+NRj50YXePgZ/MclRDqPzDR
	AhYuqwSgnHLD6+rexfaOxpUx7Fd7BP9jLZKPADsQhkte+rw/5OQG4Fo6FJsiLXAJ5EvAcQgdwua
	NmIH9t23YRgqTNKPTT/w3QM4HqXRZ+SnYjmi3fBDmCq7tpc3o4TROcaWEbbAgrirrf3OiNt9uZ7
	zSnwax1CN7MdnZkuOsbQaehCSmlhS0n7K7eelymP6uSuOAQDMQ==
X-Google-Smtp-Source: AGHT+IH1T7xQLSTGycqkKe1o9dKahkpCSZkhxgBizqiXTZZ6kY7wkbw61A/jppy451alD4weThfo9w==
X-Received: by 2002:a05:620a:44c6:b0:7c5:d71c:6a47 with SMTP id af79cd13be357-7cd39de0c81mr510317185a.8.1747316124803;
        Thu, 15 May 2025 06:35:24 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:72::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd2464aaf2sm304527985a.7.2025.05.15.06.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:35:24 -0700 (PDT)
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
Subject: [PATCH 2/6] prctl: introduce PR_THP_POLICY_DEFAULT_NOHUGE for the process
Date: Thu, 15 May 2025 14:33:31 +0100
Message-ID: <20250515133519.2779639-3-usamaarif642@gmail.com>
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
This will set the MMF2_THP_VMA_DEFAULT_NOHUGE process flag
which changes the default of new VMAs to be VM_NOHUGEPAGE. The
call also modifies all existing VMAs that are not VM_HUGEPAGE
to be VM_NOHUGEPAGE. The policy is inherited during fork+exec.

This allows systems where the global policy is set to "always"
to effectively have THPs on madvise only for the process. In an
environment where different types of workloads are stacked on the
same machine,this will allow workloads that benefit from having
hugepages on an madvise basis only to do so, without regressing those
that benefit from having hugepages always.

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 include/linux/huge_mm.h                       |  1 +
 include/linux/mm_types.h                      |  5 +++-
 include/uapi/linux/prctl.h                    |  1 +
 kernel/sys.c                                  |  8 +++++++
 mm/huge_memory.c                              | 24 +++++++++++++++++++
 tools/include/uapi/linux/prctl.h              |  1 +
 .../trace/beauty/include/uapi/linux/prctl.h   |  1 +
 7 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index e652ad9ddbbd..d46bba282701 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -262,6 +262,7 @@ static inline unsigned long thp_vma_suitable_orders(struct vm_area_struct *vma,
 
 void vma_set_thp_policy(struct vm_area_struct *vma);
 void process_vmas_thp_default_huge(struct mm_struct *mm);
+void process_vmas_thp_default_nohuge(struct mm_struct *mm);
 
 unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 					 unsigned long vm_flags,
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 2fe93965e761..5e770411d8d1 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1747,8 +1747,11 @@ enum {
 
 #define MMF2_THP_VMA_DEFAULT_HUGE		0
 #define MMF2_THP_VMA_DEFAULT_HUGE_MASK		(1 << MMF2_THP_VMA_DEFAULT_HUGE)
+#define MMF2_THP_VMA_DEFAULT_NOHUGE		1
+#define MMF2_THP_VMA_DEFAULT_NOHUGE_MASK	(1 << MMF2_THP_VMA_DEFAULT_NOHUGE)
 
-#define MMF2_INIT_MASK		(MMF2_THP_VMA_DEFAULT_HUGE_MASK)
+#define MMF2_INIT_MASK		(MMF2_THP_VMA_DEFAULT_HUGE_MASK |\
+				 MMF2_THP_VMA_DEFAULT_NOHUGE_MASK)
 
 static inline unsigned long mmf_init_flags(unsigned long flags)
 {
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 325c72f40a93..d25458f4db9e 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -367,5 +367,6 @@ struct prctl_mm_map {
 #define PR_SET_THP_POLICY		78
 #define PR_GET_THP_POLICY		79
 #define PR_THP_POLICY_DEFAULT_HUGE	0
+#define PR_THP_POLICY_DEFAULT_NOHUGE	1
 
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 1115f258f253..d91203e6dd0d 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2663,6 +2663,8 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			return -EINVAL;
 		if (!!test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2))
 			error = PR_THP_POLICY_DEFAULT_HUGE;
+		else if (!!test_bit(MMF2_THP_VMA_DEFAULT_NOHUGE, &me->mm->flags2))
+			error = PR_THP_POLICY_DEFAULT_NOHUGE;
 		break;
 	case PR_SET_THP_POLICY:
 		if (arg3 || arg4 || arg5)
@@ -2672,8 +2674,14 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 		switch (arg2) {
 		case PR_THP_POLICY_DEFAULT_HUGE:
 			set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2);
+			clear_bit(MMF2_THP_VMA_DEFAULT_NOHUGE, &me->mm->flags2);
 			process_vmas_thp_default_huge(me->mm);
 			break;
+		case PR_THP_POLICY_DEFAULT_NOHUGE:
+			clear_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2);
+			set_bit(MMF2_THP_VMA_DEFAULT_NOHUGE, &me->mm->flags2);
+			process_vmas_thp_default_nohuge(me->mm);
+			break;
 		default:
 			return -EINVAL;
 		}
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 64f66d5295e8..9d70a365ced3 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -104,6 +104,8 @@ void vma_set_thp_policy(struct vm_area_struct *vma)
 
 	if (test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2))
 		vm_flags_set(vma, VM_HUGEPAGE);
+	else if (test_bit(MMF2_THP_VMA_DEFAULT_NOHUGE, &mm->flags2))
+		vm_flags_set(vma, VM_NOHUGEPAGE);
 }
 
 static void vmas_thp_default_huge(struct mm_struct *mm)
@@ -129,6 +131,28 @@ void process_vmas_thp_default_huge(struct mm_struct *mm)
 	vmas_thp_default_huge(mm);
 }
 
+static void vmas_thp_default_nohuge(struct mm_struct *mm)
+{
+	struct vm_area_struct *vma;
+	unsigned long vm_flags;
+
+	VMA_ITERATOR(vmi, mm, 0);
+	for_each_vma(vmi, vma) {
+		vm_flags = vma->vm_flags;
+		if (vm_flags & VM_HUGEPAGE)
+			continue;
+		vm_flags_set(vma, VM_NOHUGEPAGE);
+	}
+}
+
+void process_vmas_thp_default_nohuge(struct mm_struct *mm)
+{
+	if (test_bit(MMF2_THP_VMA_DEFAULT_NOHUGE, &mm->flags2))
+		return;
+
+	set_bit(MMF2_THP_VMA_DEFAULT_NOHUGE, &mm->flags2);
+	vmas_thp_default_nohuge(mm);
+}
 
 unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 					 unsigned long vm_flags,
diff --git a/tools/include/uapi/linux/prctl.h b/tools/include/uapi/linux/prctl.h
index f5945ebfe3f2..e03d0ed890c5 100644
--- a/tools/include/uapi/linux/prctl.h
+++ b/tools/include/uapi/linux/prctl.h
@@ -331,5 +331,6 @@ struct prctl_mm_map {
 #define PR_SET_THP_POLICY		78
 #define PR_GET_THP_POLICY		79
 #define PR_THP_POLICY_DEFAULT_HUGE	0
+#define PR_THP_POLICY_DEFAULT_NOHUGE	1
 
 #endif /* _LINUX_PRCTL_H */
diff --git a/tools/perf/trace/beauty/include/uapi/linux/prctl.h b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
index 325c72f40a93..d25458f4db9e 100644
--- a/tools/perf/trace/beauty/include/uapi/linux/prctl.h
+++ b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
@@ -367,5 +367,6 @@ struct prctl_mm_map {
 #define PR_SET_THP_POLICY		78
 #define PR_GET_THP_POLICY		79
 #define PR_THP_POLICY_DEFAULT_HUGE	0
+#define PR_THP_POLICY_DEFAULT_NOHUGE	1
 
 #endif /* _LINUX_PRCTL_H */
-- 
2.47.1

