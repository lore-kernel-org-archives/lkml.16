Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8851D63DF
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839900; cv=none; b=mSyrWqEfY90LXqmTs0jf3KRdyzb3sGl4cywC/PIOxGAPuEBW5Rr0lhpuVBY0VfvV9hssy4zXv8Y8zluteXelbGLUDriqGv8TvWLoJsEpJheN4hVZW0r5HkhyEFquSrXY8s6lnAtUsM5O4y0Tzq7DTxAJWGNcjK5nPtJvKohR2KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839900; c=relaxed/simple;
	bh=xjQw6jSKQp9URqi4C246dUlBO6uJS7bp2ad5W8wkdj8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mlIYdtlu5bsWc8waxMY0u5rhgLKc18fZnN6IX9MLaWFUZ6to2JC9XB0xkBdAvvSQb7dZaHfcIYKNY/VrN1TOFz5rw809onei/nBUUvQk1nucCkCI6BC0EvmbZuNDIvJZsZWF9ABsLV30rvY6BJMcq/S1EbxjGk4i/mKYekM/V7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BRMOR0lX; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BRMOR0lX"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-440667e7f92so36154885e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747839896; x=1748444696; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DwAlbsdp8Pq3hojVBpIUtQJnr1hiT6SyKypwl7KjCd0=;
        b=BRMOR0lXMFEkEpnNZEZeuOuzHHq7ctcN/Z6ACV2rWgLScISleo85nrUIlSrXHHHIcM
         RSJGJZIATSi5mirKfCpG9p5dtvaj0riPjdEBJkMPf3sNjo7QwpBpZruEz3cNy84DeUOE
         Y9BOrtkMSXCE21qLlxqdzePKLjLTLniRx7YVLvs//04qjemBSLM3WoLQLd4IZ19lkqg3
         i5tgDkcY1fscEj279tkcFNmggHyYuNFI4rovvomPKmBj0dqJIz1vh/jaJosKd6AbNGm2
         BILWLrDet1Ez7q09j2p+G+c300OZRW8x5J1fKkq+l5I8p4AhD4XEb4aGkEg27jcVGyyv
         1hWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839896; x=1748444696;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DwAlbsdp8Pq3hojVBpIUtQJnr1hiT6SyKypwl7KjCd0=;
        b=CU49+0AFrv/TkxgHgQWM145qvWq54cqEWd52wJHo8Gn1vzF7T7YwvBCTKcxP6xOg6b
         9uobmEkqA8snUeVYsg9SqkML8VM1Cpy7GYIX/jqdNgsc8CwPAqvaa4EKBtt4IPf1Kd2A
         NYfmw7qbuUjNMmOSuLFhB9ePvD+T2nKy27rny7WVVybdzG7MHcLd0sB7SKIpP9n3OFlJ
         hji4gsD52MPGZdPXciq8UHv4l1g5FApx7UFkI1tN7P6Nu3UsAxoDod0/qIVevha7y4bh
         Kaq7TcaYeKtW5yECb/4zCcUxcmIo6PObY1ZFcPWprem9ljcDFtV8sEVrVlWrzhLGxHVk
         u4lg==
X-Forwarded-Encrypted: i=1; AJvYcCX+CmcEzaxAjVi5MOXs1z9H2smJWI7WwX6/mVqler1uCTk4K7Tf1uen7WUSHCjCNrzlSGTqE2FyJJJs7IE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZqCG/zneHMYCdQ7EJvZkeJCyseBXrL2uh5ww2sTI9pkAVrjIJ
	h10w5JLDnBIDA9E1JaTQENBmaZUXbFPWJcvf9XgalM23PYoRvXebfMFpJzPRM9dNZrV9GDckqcK
	iA3Gwreb7+Q==
X-Google-Smtp-Source: AGHT+IFHepmVs2MSdhPgR5Oldj0rNLjrGcpLT6idVGvnIJxv0l7ZoCLm98UUtS8rwQah08SYfKWBaAfO7Giv
X-Received: from wrf20-n2.prod.google.com ([2002:a05:6000:43d4:20b0:3a3:709b:2ce3])
 (user=dvyukov job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:c0b:b0:3a3:5c64:c60
 with SMTP id ffacd0b85a97d-3a35c84beacmr13474911f8f.59.1747839896585; Wed, 21
 May 2025 08:04:56 -0700 (PDT)
Date: Wed, 21 May 2025 17:04:29 +0200
In-Reply-To: <cover.1747839857.git.dvyukov@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747839857.git.dvyukov@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <97947cc8e205ff49675826d7b0327ef2e2c66eea.1747839857.git.dvyukov@google.com>
Subject: [PATCH v3 2/3] syscall_user_dispatch: Add PR_SYS_DISPATCH_INCLUSIVE_ON
From: Dmitry Vyukov <dvyukov@google.com>
To: krisman@collabora.com, tglx@linutronix.de, luto@kernel.org, 
	peterz@infradead.org, keescook@chromium.org, gregory.price@memverge.com
Cc: Dmitry Vyukov <dvyukov@google.com>, Marco Elver <elver@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

There are two possible scenarios for syscall filtering:
 - having a trusted/allowed range of PCs, and intercepting everything else
 - or the opposite: a single untrusted/intercepted range and allowing
   everything else (this is relevant for any kind of sandboxing scenario,
   or monitoring behavior of a single library)

The current API only allows the former use case due to allowed
range wrap-around check. Add PR_SYS_DISPATCH_INCLUSIVE_ON that
enables the second use case.

Add PR_SYS_DISPATCH_EXCLUSIVE_ON alias for PR_SYS_DISPATCH_ON
to make it clear how it's different from the new
PR_SYS_DISPATCH_INCLUSIVE_ON.

Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Gregory Price <gregory.price@memverge.com>
Cc: Marco Elver <elver@google.com>
Cc: linux-kernel@vger.kernel.org

---
Changes in v3:
 - Add new PR_SYS_DISPATCH_INCLUSIVE_ON mode
   instead of extending behavior of the old mode
---
 .../admin-guide/syscall-user-dispatch.rst     | 23 +++++++-----
 include/uapi/linux/prctl.h                    |  7 +++-
 kernel/entry/syscall_user_dispatch.c          | 36 ++++++++++++-------
 tools/include/uapi/linux/prctl.h              |  7 +++-
 4 files changed, 49 insertions(+), 24 deletions(-)

diff --git a/Documentation/admin-guide/syscall-user-dispatch.rst b/Documentation/admin-guide/syscall-user-dispatch.rst
index e3cfffef5a633..c1768d9e80fa2 100644
--- a/Documentation/admin-guide/syscall-user-dispatch.rst
+++ b/Documentation/admin-guide/syscall-user-dispatch.rst
@@ -53,20 +53,25 @@ following prctl:
 
   prctl(PR_SET_SYSCALL_USER_DISPATCH, <op>, <offset>, <length>, [selector])
 
-<op> is either PR_SYS_DISPATCH_ON or PR_SYS_DISPATCH_OFF, to enable and
-disable the mechanism globally for that thread.  When
-PR_SYS_DISPATCH_OFF is used, the other fields must be zero.
-
-[<offset>, <offset>+<length>) delimit a memory region interval
-from which syscalls are always executed directly, regardless of the
-userspace selector.  This provides a fast path for the C library, which
-includes the most common syscall dispatchers in the native code
-applications, and also provides a way for the signal handler to return
+<op> is either PR_SYS_DISPATCH_EXCLUSIVE_ON/PR_SYS_DISPATCH_INCLUSIVE_ON
+or PR_SYS_DISPATCH_OFF, to enable and disable the mechanism globally for
+that thread.  When PR_SYS_DISPATCH_OFF is used, the other fields must be zero.
+
+For PR_SYS_DISPATCH_EXCLUSIVE_ON [<offset>, <offset>+<length>) delimit
+a memory region interval from which syscalls are always executed directly,
+regardless of the userspace selector.  This provides a fast path for the
+C library, which includes the most common syscall dispatchers in the native
+code applications, and also provides a way for the signal handler to return
 without triggering a nested SIGSYS on (rt\_)sigreturn.  Users of this
 interface should make sure that at least the signal trampoline code is
 included in this region. In addition, for syscalls that implement the
 trampoline code on the vDSO, that trampoline is never intercepted.
 
+For PR_SYS_DISPATCH_INCLUSIVE_ON [<offset>, <offset>+<length>) delimit
+a memory region interval from which syscalls are dispatched based on
+the userspace selector. Syscalls from outside of the range are always
+executed directly.
+
 [selector] is a pointer to a char-sized region in the process memory
 region, that provides a quick way to enable disable syscall redirection
 thread-wide, without the need to invoke the kernel directly.  selector
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 15c18ef4eb11a..11d9c7c853a53 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -255,7 +255,12 @@ struct prctl_mm_map {
 /* Dispatch syscalls to a userspace handler */
 #define PR_SET_SYSCALL_USER_DISPATCH	59
 # define PR_SYS_DISPATCH_OFF		0
-# define PR_SYS_DISPATCH_ON		1
+/* Enable dispatch except for the specified range */
+# define PR_SYS_DISPATCH_EXCLUSIVE_ON	1
+/* Enable dispatch for the specified range */
+# define PR_SYS_DISPATCH_INCLUSIVE_ON	2
+/* Legacy name for backwards compatibility */
+# define PR_SYS_DISPATCH_ON		PR_SYS_DISPATCH_EXCLUSIVE_ON
 /* The control values for the user space selector when dispatch is enabled */
 # define SYSCALL_DISPATCH_FILTER_ALLOW	0
 # define SYSCALL_DISPATCH_FILTER_BLOCK	1
diff --git a/kernel/entry/syscall_user_dispatch.c b/kernel/entry/syscall_user_dispatch.c
index 5340c5aa89e7d..300b6c1bf07da 100644
--- a/kernel/entry/syscall_user_dispatch.c
+++ b/kernel/entry/syscall_user_dispatch.c
@@ -78,7 +78,7 @@ static int task_set_syscall_user_dispatch(struct task_struct *task, unsigned lon
 		if (offset || len || selector)
 			return -EINVAL;
 		break;
-	case PR_SYS_DISPATCH_ON:
+	case PR_SYS_DISPATCH_EXCLUSIVE_ON:
 		/*
 		 * Validate the direct dispatcher region just for basic
 		 * sanity against overflow and a 0-sized dispatcher
@@ -87,30 +87,40 @@ static int task_set_syscall_user_dispatch(struct task_struct *task, unsigned lon
 		 */
 		if (offset && offset + len <= offset)
 			return -EINVAL;
-
+		break;
+	case PR_SYS_DISPATCH_INCLUSIVE_ON:
+		if (len == 0 || offset + len <= offset)
+			return -EINVAL;
 		/*
-		 * access_ok() will clear memory tags for tagged addresses
-		 * if current has memory tagging enabled.
-
-		 * To enable a tracer to set a tracees selector the
-		 * selector address must be untagged for access_ok(),
-		 * otherwise an untagged tracer will always fail to set a
-		 * tagged tracees selector.
+		 * Invert the range, the check in syscall_user_dispatch()
+		 * supports wrap-around.
 		 */
-		if (selector && !access_ok(untagged_addr(selector), sizeof(*selector)))
-			return -EFAULT;
-
+		offset = offset + len;
+		len = -len;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	/*
+	 * access_ok() will clear memory tags for tagged addresses
+	 * if current has memory tagging enabled.
+
+	 * To enable a tracer to set a tracees selector the
+	 * selector address must be untagged for access_ok(),
+	 * otherwise an untagged tracer will always fail to set a
+	 * tagged tracees selector.
+	 */
+	if (mode != PR_SYS_DISPATCH_OFF && selector &&
+		!access_ok(untagged_addr(selector), sizeof(*selector)))
+		return -EFAULT;
+
 	task->syscall_dispatch.selector = selector;
 	task->syscall_dispatch.offset = offset;
 	task->syscall_dispatch.len = len;
 	task->syscall_dispatch.on_dispatch = false;
 
-	if (mode == PR_SYS_DISPATCH_ON)
+	if (mode != PR_SYS_DISPATCH_OFF)
 		set_task_syscall_work(task, SYSCALL_USER_DISPATCH);
 	else
 		clear_task_syscall_work(task, SYSCALL_USER_DISPATCH);
diff --git a/tools/include/uapi/linux/prctl.h b/tools/include/uapi/linux/prctl.h
index 35791791a879b..5cbd56e5672a8 100644
--- a/tools/include/uapi/linux/prctl.h
+++ b/tools/include/uapi/linux/prctl.h
@@ -252,7 +252,12 @@ struct prctl_mm_map {
 /* Dispatch syscalls to a userspace handler */
 #define PR_SET_SYSCALL_USER_DISPATCH	59
 # define PR_SYS_DISPATCH_OFF		0
-# define PR_SYS_DISPATCH_ON		1
+/* Enable dispatch except for the specified range */
+# define PR_SYS_DISPATCH_EXCLUSIVE_ON	1
+/* Enable dispatch for the specified range */
+# define PR_SYS_DISPATCH_INCLUSIVE_ON	2
+/* Legacy name for backwards compatibility */
+# define PR_SYS_DISPATCH_ON		PR_SYS_DISPATCH_EXCLUSIVE_ON
 /* The control values for the user space selector when dispatch is enabled */
 # define SYSCALL_DISPATCH_FILTER_ALLOW	0
 # define SYSCALL_DISPATCH_FILTER_BLOCK	1
-- 
2.49.0.1143.g0be31eac6b-goog

