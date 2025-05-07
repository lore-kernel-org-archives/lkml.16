Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA0928AB02
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627103; cv=none; b=Pat4vXq8y7K2QEDWb7NXvN7NOOZatPW6WzfiYGvtJE8k9JujX9v6r7DZgHyI1+uG4ulTRpS+03GnZEiX+x/TZksOtxOKavWVa179dIZbATmDG78TstJZvJLFClcbi0KB1ibxiUnB5XV7848AJXa7YFpJ0umX+H60uWVVRb5s7JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627103; c=relaxed/simple;
	bh=kNIUnyY7I7AidhcUXozXbROl/6d+pnP47+GQOBUIrrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SAHnmzWcYhcR5foEngQii2HPmhl/carcg3N5HSQvF+4vVqJayv4qDGAXSQw+lqlRSLo1N4/4Qj+3I9crFpltY5d+lT2KLtmLAidgQ6k5reflt1tdjSDl1fSe5cA8M2jRtAgd1NpqLqZOljTeb5AVgrGWW/NxJNHk4dMIyyDe/SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIv2mKAD; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIv2mKAD"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f2c45ecaffso66675336d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746627099; x=1747231899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vm+MHUBv09afGPstqZ6g33kZoaoECt43wozuRnFS1ks=;
        b=jIv2mKAD2yiVkpJltOvd5pB/68nxF57oDPf2gYLzQa4v4LvGo6E53yOF59IZhZiRFt
         1XjhXMFxI8Mz3lAWOPMd4esZn9Ax8e/7NZl1cSbpofuMpFx76QjbTuwYswlODeY+2uhG
         N/HbsUqUXULpWJ34DoBXnn12Legr/vgSMilpnOk9hEbKtNA73uWYSQ1sQOJRzPT/VIcU
         0CRUuKLrwCLXEdHwauPHhKwSMl+1kpf88OHMKZJ74RQSyIJaa+eMqwkWcatC/lKmp4r4
         2F85C+jvpRrqzAumdtaBQK1hWMNlyviOt4vIipiX0lVlc3SmMCnJZAHkY8fsqZkreKB8
         X68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746627099; x=1747231899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vm+MHUBv09afGPstqZ6g33kZoaoECt43wozuRnFS1ks=;
        b=sFieUv5+O8q36G7Zj8g9gyTGmVDVEygK4xY29EeTdViI2Gtw8H1LKa3tLkVMBvH4sW
         O5mynzfrC+HUij8DmWQJ2Bav1hMQYwLHvS8f0iqU984XnIgcWzrrx2Yglqf5ZlZse39K
         lY4GJ+r+ByshBxx4KgEfC5dFjvmcoGKKRr1Oq0hH33di+sl5xkjKmKy2ShzF2rkCByKd
         aehC/5acERR+peugL5IfJzAg8nWMtu662I5ZUSm0c4CgmXJQ04SLhmTuPUdv637jXxHZ
         FA2QdR8K6pABQlun2VBj2h+Zwu77INyBH/5FuaI5vkjmvtLHP2vaMw3ryjeymjsHVJUJ
         tztA==
X-Forwarded-Encrypted: i=1; AJvYcCVk3Nq5Wf/0PZZ8WgIJNkhjfe3uJDQjPo0kH5JjuPKn0Gp6s9KEEko1cZgvQX2T/tGpOthi/41Z3cg98Y4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJTnAciSd3uiAfgpqNFLf4UcpD49JBx7F59gwprbWnRtq7KSjw
	5yPpf06gdB1GoY1u2HYvSsZYfodqarZx5fH4z20cFvxKmB/f8lS1
X-Gm-Gg: ASbGncvkLo8mJTJ1PT3hMQwFppUd+4FqiGonmUueYcn3rNb3VyyGHwKoBFurbakIRvx
	dBfm03nwZ6PSzTBV/NWWSOH+3TNMUwmkVxbvFQRmu8wo7E8jAKRG9dqNrLJPhANkYKGa3QWy2dl
	jfyPcPCH4+6fScxn1HOLVUd2OiK1l/Lb0vVCGWDyeSyh4XKGzlB1ulG1BZM2GXlGQCe4ZpRaiT+
	zz8yZ4bj+UF2A4BsMc8YW0mr5zWyjiO07NxDxZonIaogbJqkP69d552qqUWZlC78Sls9HA5d7ry
	xB/LOQ58kzMuhAgLi/SRGqaxuTHO+NNOcdS64Q==
X-Google-Smtp-Source: AGHT+IGJu/VKlLDFa89vNWFcY6rHfDrXU1rIHuIP4kHVkuFiNxpZM5MMjkM5oXVKvn4vhVXHF/ryzA==
X-Received: by 2002:a05:6214:c6b:b0:6e8:f4d3:e8a5 with SMTP id 6a1803df08f44-6f5429f60c4mr53500276d6.15.1746627098583;
        Wed, 07 May 2025 07:11:38 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:7::])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f542623f1esm14529706d6.8.2025.05.07.07.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:11:38 -0700 (PDT)
From: Usama Arif <usamaarif642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@redhat.com,
	linux-mm@kvack.org
Cc: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	riel@surriel.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH 1/1] prctl: allow overriding system THP policy to always per process
Date: Wed,  7 May 2025 15:00:34 +0100
Message-ID: <20250507141132.2773275-2-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250507141132.2773275-1-usamaarif642@gmail.com>
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allowing override of global THP policy per process allows workloads
that have shown to benefit from hugepages to do so, without regressing
workloads that wouldn't benefit. This will allow such types of workloads
to be run/stacked on the same machine.

It also helps in rolling out hugepages in hyperscaler configurations
for workloads that benefit from them, where a single THP policy is likely
to be used across the entire fleet, and prctl will help override it.

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 include/linux/huge_mm.h                          |  3 ++-
 include/linux/mm_types.h                         |  7 ++-----
 include/uapi/linux/prctl.h                       |  3 +++
 kernel/sys.c                                     | 16 ++++++++++++++++
 tools/include/uapi/linux/prctl.h                 |  3 +++
 .../perf/trace/beauty/include/uapi/linux/prctl.h |  3 +++
 6 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 2f190c90192d..0587dc4b8e2d 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -293,7 +293,8 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
 		if (vm_flags & VM_HUGEPAGE)
 			mask |= READ_ONCE(huge_anon_orders_madvise);
 		if (hugepage_global_always() ||
-		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
+		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()) ||
+		    test_bit(MMF_THP_ALWAYS, &vma->vm_mm->flags))
 			mask |= READ_ONCE(huge_anon_orders_inherit);
 
 		orders &= mask;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index e76bade9ebb1..9bcd72b2b191 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1704,11 +1704,8 @@ enum {
 #define MMF_VM_MERGEABLE	16	/* KSM may merge identical pages */
 #define MMF_VM_HUGEPAGE		17	/* set when mm is available for khugepaged */
 
-/*
- * This one-shot flag is dropped due to necessity of changing exe once again
- * on NFS restore
- */
-//#define MMF_EXE_FILE_CHANGED	18	/* see prctl_set_mm_exe_file() */
+/* override inherited page sizes to always for the entire process */
+ #define MMF_THP_ALWAYS	18
 
 #define MMF_HAS_UPROBES		19	/* has uprobes */
 #define MMF_RECALC_UPROBES	20	/* MMF_HAS_UPROBES can be wrong */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 15c18ef4eb11..22c526681562 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -364,4 +364,7 @@ struct prctl_mm_map {
 # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
 # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
 
+#define PR_SET_THP_ALWAYS	78
+#define PR_GET_THP_ALWAYS	79
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index c434968e9f5d..ee56b059ff1f 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2658,6 +2658,22 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			clear_bit(MMF_DISABLE_THP, &me->mm->flags);
 		mmap_write_unlock(me->mm);
 		break;
+	case PR_GET_THP_ALWAYS:
+		if (arg2 || arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = !!test_bit(MMF_THP_ALWAYS, &me->mm->flags);
+		break;
+	case PR_SET_THP_ALWAYS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		if (mmap_write_lock_killable(me->mm))
+			return -EINTR;
+		if (arg2)
+			set_bit(MMF_THP_ALWAYS, &me->mm->flags);
+		else
+			clear_bit(MMF_THP_ALWAYS, &me->mm->flags);
+		mmap_write_unlock(me->mm);
+		break;
 	case PR_MPX_ENABLE_MANAGEMENT:
 	case PR_MPX_DISABLE_MANAGEMENT:
 		/* No longer implemented: */
diff --git a/tools/include/uapi/linux/prctl.h b/tools/include/uapi/linux/prctl.h
index 35791791a879..f5f6cff42b3f 100644
--- a/tools/include/uapi/linux/prctl.h
+++ b/tools/include/uapi/linux/prctl.h
@@ -328,4 +328,7 @@ struct prctl_mm_map {
 # define PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC	0x10 /* Clear the aspect on exec */
 # define PR_PPC_DEXCR_CTRL_MASK		0x1f
 
+#define PR_GET_THP_ALWAYS	78
+#define PR_SET_THP_ALWAYS	79
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/tools/perf/trace/beauty/include/uapi/linux/prctl.h b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
index 15c18ef4eb11..680996d56faf 100644
--- a/tools/perf/trace/beauty/include/uapi/linux/prctl.h
+++ b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
@@ -364,4 +364,7 @@ struct prctl_mm_map {
 # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
 # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
 
+#define PR_GET_THP_ALWAYS	78
+#define PR_SET_THP_ALWAYS	79
+
 #endif /* _LINUX_PRCTL_H */
-- 
2.47.1

