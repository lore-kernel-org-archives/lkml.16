Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C480621CC5A;
	Mon, 19 May 2025 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694030; cv=none; b=LCg8GDc9zghR6cRWkIoEzoOYVmDL6SFKAISvtT+arJyS74jPmpdFU0M6dPx/CIAS9bGDE6yJguSIRNcwcF3jIXpb6l4ePMighpAu0UtbB/RPpmGr/bnA5KUX0IIuUWl0M5Gd1tP50RZ+UnhCbweRVR52VcCjEYeQGjj2lQTqJvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694030; c=relaxed/simple;
	bh=MC1N+OY0nC6U0Z6rmPXpbtSuHdN8I8xTOcxcOubMIck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pr/41q6SWnVNo2VMNQ5SbH4py8TXcP3BRUV+OkwaZBXM5r9Pq1m78UFqjP9+DPa8t0LTHRYHhj3NOWfmvv/zriudrZ4BToGswBxqQJ7r9CpLrDPNXAwgEK/XZCYKi7t2VhNsH1ySRgwBdfSRKzzqYOECZGfzlN/+RnXwtIJ1ODI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0WLN4qK; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0WLN4qK"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f8c53aeedbso57372156d6.2;
        Mon, 19 May 2025 15:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747694027; x=1748298827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdThakyVpRWt/pdL0RGS+6LQ/2FW4dqWsg/JIFZjGck=;
        b=V0WLN4qKg8oJZOYlIEXnAERLIaN6LF08UAHDq8vgLCj8j+iCg34VhDAlry1B9rjVB8
         6RX7/xJ6H0+4PVBlbpI2RnHNXzyVDOS1+xZAL3Ft8/WWt3WxOCkRv+59xFgfuj+NheMB
         v+8Dc65R9I/dMIvqExeygupNF6Y+fwx04/tkB+exo/7uCphuF5A/3Sgg3x7saOVmfMuX
         ZCj4MgOGqZYN4Uhdm/i2Is//acvMWy5cWWn67BZFZDHXp27Ua5GvvKqwTwDIHH/YYxC/
         b71GZMT8cmb6MXZjwJ6wOEZ0JEZyaFpg8Lce0ZZ7bbT5pMaKhRWf8nIhlsIGM3srNne+
         fTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747694027; x=1748298827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdThakyVpRWt/pdL0RGS+6LQ/2FW4dqWsg/JIFZjGck=;
        b=MAM07c/t9YKCysSxKmAlu8gJdsuJkZnSRCdudXkcf3wI+b+n5IM1YuwxSyN+E55Qeh
         v1vORoHejpznnIoTtd4yshxW86lHe8bTaP7yHR7KE+RfcbuyszHjku5cU/j/EWWP0wV7
         9YhNTd5dl2fDTGD0tth6uYV+vZNHHF/JGuw9KZfuGbXCxNaqpyeN8o7DftkvYRrFU5OH
         aXdAxpiLlf1atAtAuquBefsDeIguRXEBoK+Ye0jh25e6wqzrXxAC3dtvzlYtBXirbzEt
         gm3kfc5sEERN6oIjzzlThDAHLLTAowAfwMCBX2Af48Aei+bwmvtV9RB6dGhxDmVe+S10
         vB0w==
X-Forwarded-Encrypted: i=1; AJvYcCU6zKY3v+2ICv6d7HxH4OiT9laneowUR9SUXolfonWzg3m1mK76u+rNVFAIjqtnj05tpAzbgFyvA0XB1r/b@vger.kernel.org, AJvYcCU7dc/vwnwosoWnwFvvooiLFzvjNTkKQSiBYlYQdVA6yc8WDtughoGDX8OvmSCfE5ihtuR9U2gOw+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGvsDjpPldynIP40xWsnRrNHyS4XkAksfdo8/B5yhZlT0J++t5
	lZMAoTP5gHZqmHVkLzk1oCwMoyDNqnkZFuACTGg22eyTlekL5arD7ma+
X-Gm-Gg: ASbGncusgqXWuiqnRGky6pC8zzExR42M1tOrGpUZzZMGqY2G+0AYkssqDw9RRpGLk5H
	onG4DnyBG1zq1Fbup+EU+auQxOB9KAXUoSk3cPhzlEU6CVKXTGUAs2yap8KpRUygFORHhZPRELq
	5g1ogMNTqkNNf8azOExkEXyTOO9gsNpK7Ak26fO5xt6t7L/gci1wByPzT+Nt5GphULnNd0bVKT/
	vb6I4RUN80vGjq3Me1DgmECMM9e98B4KJqmb2S+A+Nr5u5OinLuEvvXePk16MuTc+XtyDcwktYT
	zWC7vHDkhlqqdhUFp14/KTEZ1b/gjhBPQpbCyYnIuXOTvarnJQ==
X-Google-Smtp-Source: AGHT+IElzVJ+5veykGxkKp/1enaTKr5fwrckzXOASwoCkx8oZ5lGcePSRnYc7Ci5ixpQKVjII7tOfQ==
X-Received: by 2002:a05:6214:5096:b0:6f4:f123:a97a with SMTP id 6a1803df08f44-6f8b2c65bd5mr238975326d6.15.1747694027561;
        Mon, 19 May 2025 15:33:47 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:41::])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0965b90sm62201576d6.91.2025.05.19.15.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 15:33:47 -0700 (PDT)
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
Subject: [PATCH v3 3/7] prctl: introduce PR_DEFAULT_MADV_NOHUGEPAGE for the process
Date: Mon, 19 May 2025 23:29:55 +0100
Message-ID: <20250519223307.3601786-4-usamaarif642@gmail.com>
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
- It sets VM_NOHUGEPAGE and clears VM_HUGEPAGE on the default VMA
  flags (def_flags). This means that every new VMA will not be
  considered for hugepage by default.
- Iterate through every VMA in the process and call hugepage_madvise
  on it, with MADV_NOHUGEPAGE policy.
The policy is inherited during fork+exec.

This effectively allows setting MADV_NOHUGEPAGE on the entire process.
In anenvironment where different types of workloads are stacked on the
same machine,this will allow workloads that benefit from having
hugepages on an madvise basis only to do so, without regressing those
that benefit from having hugepages always.

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 include/uapi/linux/prctl.h                         | 1 +
 kernel/sys.c                                       | 7 +++++++
 tools/include/uapi/linux/prctl.h                   | 1 +
 tools/perf/trace/beauty/include/uapi/linux/prctl.h | 1 +
 4 files changed, 10 insertions(+)

diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 15aaa4db5ff8..33a6ef6a5a72 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -367,5 +367,6 @@ struct prctl_mm_map {
 #define PR_SET_THP_POLICY		78
 #define PR_GET_THP_POLICY		79
 #define PR_DEFAULT_MADV_HUGEPAGE	0
+#define PR_DEFAULT_MADV_NOHUGEPAGE	1
 
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 74397ace62f3..6bb28b3666f7 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2666,6 +2666,8 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			return -EINTR;
 		if (mm->def_flags & VM_HUGEPAGE)
 			error = PR_DEFAULT_MADV_HUGEPAGE;
+		else if (mm->def_flags & VM_NOHUGEPAGE)
+			error = PR_DEFAULT_MADV_NOHUGEPAGE;
 		mmap_write_unlock(mm);
 		break;
 	case PR_SET_THP_POLICY:
@@ -2681,6 +2683,11 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			if (!error)
 				process_default_madv_hugepage(mm, MADV_HUGEPAGE);
 			break;
+		case PR_DEFAULT_MADV_NOHUGEPAGE:
+			error = hugepage_set_vmflags(&mm->def_flags, MADV_NOHUGEPAGE);
+			if (!error)
+				process_default_madv_hugepage(mm, MADV_NOHUGEPAGE);
+			break;
 		default:
 			error = -EINVAL;
 			break;
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

