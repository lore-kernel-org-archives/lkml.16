Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1623D2E7F24
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945338; cv=none; b=jb/3s2dQ0ABv/IYAn1E9YMYJvQevWxfMkQW8jEkaG3QKCdgXGVNBS0Nsy4H77znMe1sdPJYfHLpenyDaLEkkCWDZ6lTDPDBe4u0Fhv89rN3VCLeCggcKxUYHGc+6C0xBq3dtcisDM3RCqjA3C5EowTXtzFGf7gpEmF6CSAWGX54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945338; c=relaxed/simple;
	bh=IqRxoPSzc+OciRbcuYYGBNRHFEFkXus7obixCxTkDNY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oo7Zk4enwDmh6xYCu7WZUcP0YCf4MALBwonEGeLRBZofH//AL4VD6b9QtNHJ9Obcn0CljwP1Xu3ML8T83sjnay5tgXhTJykexuO4rl9gUtT+E9E7s9gKJfkBzcBRz0oMqKxuDDsa/JV6A5tdK5+fRvrktTyTzHTnzkLkDjTdzRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g5CGKLr+; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g5CGKLr+"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso442110f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750945334; x=1751550134; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9JptD8OjEc0dymN3Sn1kMVYGpGedrlrt38g4yTKhTU=;
        b=g5CGKLr+StoIpsOEX9vugl7BEZ8kwnFAbK2h4SGWxKUYLxF91DCAds+8Q5etdaBs+D
         bbFCBmaTNfMJo4c1bf+d8JdRVMiFWHvqYgHjOnNhlOIoTZgSYaz53ysOtN6l9AB5rXWR
         MKhR3QK6vaBXgR+vZJqpi+pSQTXuOi0h4e3NiDytDn3/Xd/CX67XLY7C0GMBa4Jdy9UZ
         ONsJuzLKtT0dbw6zrCBy/xJbINRTFUQ4O40TyhP+jQOSmMabcZCM5v0LlaLBHpmYhzsi
         urmMqK55Iwks8uiiwJp7bnV5ZglMABgVOXrboAqiFkTjFeEMzFV80bYKecRbEUMRW8Km
         Vqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750945334; x=1751550134;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9JptD8OjEc0dymN3Sn1kMVYGpGedrlrt38g4yTKhTU=;
        b=T8h9lTcCP+9wKwtShmQjyif5FCet2rLOzZUMF5wRbYUuZd+hfT5ZaunIBmn/cHZszU
         o+uR+MFl+kd62BxN7c18I/LWK7JZYLkIOVWmqsjewZimbWsXj34VHWjD95+lStRvpTfk
         FkeN3kPk/SkZqT7HB/5u4dOO9Hf6qECe7jKQvtiYbIRwIe+SmyUGHh+uy/4I+WHaOAy8
         /Dj9rScUCiJB2SHXEp9YdfV8507SjDZR3fuKFseasTVNpHQuQVE4B4qIId8LLs7PfK4e
         lWTaTbYB0zW9kQ2KjrVAtl1LnlNn7NAF4bG3mdgk93C9dFENF/7hg//lV7Sw5HibHUvP
         0s2A==
X-Forwarded-Encrypted: i=1; AJvYcCVieAmGFTIK5Gqur8tAKrebbwF4DCGpOOK0IYv/TUGcEPKC1XjeOgtfRhbgIuEXasuIy+/OCGIfHdFOhKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW58DYyWdEsGmr1uNAbs5WlaHYoX7p/R9THTN4F0xlHXL3n99L
	pbXR79QBXD6GBw5BYHkQOLSSv3QvwSsPSCLTyHPFqfVaZumAj+o/0hF2Eb4AU1qpvImsoq8kS2D
	Oz98g2A==
X-Google-Smtp-Source: AGHT+IGi3AChiiVQLB+PVCwJhxZrg5Dx2cB/Vg5qmRGcTtykgEnBDzWPmNw/C5nvicSc/BZ8ojT1bJ4nbes=
X-Received: from wmsr19.prod.google.com ([2002:a05:600c:8b13:b0:442:ddf8:99dc])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4614:b0:3a5:276b:1ec0
 with SMTP id ffacd0b85a97d-3a6ed65b1d4mr6390427f8f.45.1750945334487; Thu, 26
 Jun 2025 06:42:14 -0700 (PDT)
Date: Thu, 26 Jun 2025 15:41:51 +0200
In-Reply-To: <20250626134158.3385080-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626134158.3385080-5-glider@google.com>
Subject: [PATCH v2 04/11] kcov: factor out struct kcov_state
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Group several kcov-related fields (area, size, sequence) that are
stored in various structures, into `struct kcov_state`, so that
these fields can be easily passed around and manipulated.
Note that now the spinlock in struct kcov applies to every member
of struct kcov_state, including the sequence number.

This prepares us for the upcoming change that will introduce more
kcov state.

Also update the MAINTAINERS entry: add include/linux/kcov_types..h,
add myself as kcov reviewer.

Signed-off-by: Alexander Potapenko <glider@google.com>
---
Change-Id: If225682ea2f6e91245381b3270de16e7ea40df39

v2:
 - add myself to kcov MAINTAINERS
 - rename kcov-state.h to kcov_types.h
 - update the description
 - do not move mode into struct kcov_state
 - use '{ }' instead of '{ 0 }'
---
 MAINTAINERS                |   2 +
 include/linux/kcov.h       |   2 +-
 include/linux/kcov_types.h |  22 +++++++
 include/linux/sched.h      |  13 +----
 kernel/kcov.c              | 115 ++++++++++++++++---------------------
 5 files changed, 78 insertions(+), 76 deletions(-)
 create mode 100644 include/linux/kcov_types.h

diff --git a/MAINTAINERS b/MAINTAINERS
index dd844ac8d9107..5bbc78b0fa6ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12823,11 +12823,13 @@ F:	include/linux/kcore.h
 KCOV
 R:	Dmitry Vyukov <dvyukov@google.com>
 R:	Andrey Konovalov <andreyknvl@gmail.com>
+R:	Alexander Potapenko <glider@google.com>
 L:	kasan-dev@googlegroups.com
 S:	Maintained
 B:	https://bugzilla.kernel.org/buglist.cgi?component=Sanitizers&product=Memory%20Management
 F:	Documentation/dev-tools/kcov.rst
 F:	include/linux/kcov.h
+F:	include/linux/kcov_types.h
 F:	include/uapi/linux/kcov.h
 F:	kernel/kcov.c
 F:	scripts/Makefile.kcov
diff --git a/include/linux/kcov.h b/include/linux/kcov.h
index 932b4face1005..0e425c3524b86 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -2,7 +2,7 @@
 #ifndef _LINUX_KCOV_H
 #define _LINUX_KCOV_H
 
-#include <linux/sched.h>
+#include <linux/kcov_types.h>
 #include <uapi/linux/kcov.h>
 
 struct task_struct;
diff --git a/include/linux/kcov_types.h b/include/linux/kcov_types.h
new file mode 100644
index 0000000000000..53b25b6f0addd
--- /dev/null
+++ b/include/linux/kcov_types.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_KCOV_STATE_H
+#define _LINUX_KCOV_STATE_H
+
+#ifdef CONFIG_KCOV
+/* See kernel/kcov.c for more details. */
+struct kcov_state {
+	/* Size of the area (in long's). */
+	unsigned int size;
+
+	/* Buffer for coverage collection, shared with the userspace. */
+	void *area;
+
+	/*
+	 * KCOV sequence number: incremented each time kcov is reenabled, used
+	 * by kcov_remote_stop(), see the comment there.
+	 */
+	int sequence;
+};
+#endif /* CONFIG_KCOV */
+
+#endif /* _LINUX_KCOV_STATE_H */
diff --git a/include/linux/sched.h b/include/linux/sched.h
index f96ac19828934..68af8d6eaee3a 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -42,6 +42,7 @@
 #include <linux/restart_block.h>
 #include <uapi/linux/rseq.h>
 #include <linux/seqlock_types.h>
+#include <linux/kcov_types.h>
 #include <linux/kcsan.h>
 #include <linux/rv.h>
 #include <linux/livepatch_sched.h>
@@ -1512,16 +1513,11 @@ struct task_struct {
 #endif /* CONFIG_TRACING */
 
 #ifdef CONFIG_KCOV
-	/* See kernel/kcov.c for more details. */
-
 	/* Coverage collection mode enabled for this task (0 if disabled): */
 	unsigned int			kcov_mode;
 
-	/* Size of the kcov_area: */
-	unsigned int			kcov_size;
-
-	/* Buffer for coverage collection: */
-	void				*kcov_area;
+	/* kcov buffer state for this task. */
+	struct kcov_state		kcov_state;
 
 	/* KCOV descriptor wired with this task or NULL: */
 	struct kcov			*kcov;
@@ -1529,9 +1525,6 @@ struct task_struct {
 	/* KCOV common handle for remote coverage collection: */
 	u64				kcov_handle;
 
-	/* KCOV sequence number: */
-	int				kcov_sequence;
-
 	/* Collect coverage from softirq context: */
 	unsigned int			kcov_softirq;
 #endif
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 0dd42b78694c9..ff7f118644f49 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/jiffies.h>
 #include <linux/kcov.h>
+#include <linux/kcov_types.h>
 #include <linux/kmsan-checks.h>
 #include <linux/log2.h>
 #include <linux/mm.h>
@@ -54,24 +55,17 @@ struct kcov {
 	 *  - each code section for remote coverage collection
 	 */
 	refcount_t refcount;
-	/* The lock protects mode, size, area and t. */
+	/* The lock protects state and t. */
 	spinlock_t lock;
 	enum kcov_mode mode;
-	/* Size of arena (in long's). */
-	unsigned int size;
-	/* Coverage buffer shared with user space. */
-	void *area;
+	struct kcov_state state;
+
 	/* Task for which we collect coverage, or NULL. */
 	struct task_struct *t;
 	/* Collecting coverage from remote (background) threads. */
 	bool remote;
 	/* Size of remote area (in long's). */
 	unsigned int remote_size;
-	/*
-	 * Sequence is incremented each time kcov is reenabled, used by
-	 * kcov_remote_stop(), see the comment there.
-	 */
-	int sequence;
 };
 
 struct kcov_remote_area {
@@ -92,12 +86,9 @@ static struct list_head kcov_remote_areas = LIST_HEAD_INIT(kcov_remote_areas);
 struct kcov_percpu_data {
 	void *irq_area;
 	local_lock_t lock;
-
-	unsigned int saved_mode;
-	unsigned int saved_size;
-	void *saved_area;
+	enum kcov_mode saved_mode;
 	struct kcov *saved_kcov;
-	int saved_sequence;
+	struct kcov_state saved_state;
 };
 
 static DEFINE_PER_CPU(struct kcov_percpu_data, kcov_percpu_data) = {
@@ -219,10 +210,10 @@ void notrace __sanitizer_cov_trace_pc(void)
 	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, t))
 		return;
 
-	area = t->kcov_area;
+	area = t->kcov_state.area;
 	/* The first 64-bit word is the number of subsequent PCs. */
 	pos = READ_ONCE(area[0]) + 1;
-	if (likely(pos < t->kcov_size)) {
+	if (likely(pos < t->kcov_state.size)) {
 		/* Previously we write pc before updating pos. However, some
 		 * early interrupt code could bypass check_kcov_mode() check
 		 * and invoke __sanitizer_cov_trace_pc(). If such interrupt is
@@ -252,10 +243,10 @@ static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
 
 	/*
 	 * We write all comparison arguments and types as u64.
-	 * The buffer was allocated for t->kcov_size unsigned longs.
+	 * The buffer was allocated for t->kcov_state.size unsigned longs.
 	 */
-	area = (u64 *)t->kcov_area;
-	max_pos = t->kcov_size * sizeof(unsigned long);
+	area = (u64 *)t->kcov_state.area;
+	max_pos = t->kcov_state.size * sizeof(unsigned long);
 
 	count = READ_ONCE(area[0]);
 
@@ -356,17 +347,15 @@ EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
 #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
 
 static void kcov_start(struct task_struct *t, struct kcov *kcov,
-		       unsigned int size, void *area, enum kcov_mode mode,
-		       int sequence)
+		       enum kcov_mode mode, struct kcov_state *state)
 {
-	kcov_debug("t = %px, size = %u, area = %px\n", t, size, area);
+	kcov_debug("t = %px, size = %u, area = %px\n", t, state->size,
+		   state->area);
 	t->kcov = kcov;
 	/* Cache in task struct for performance. */
-	t->kcov_size = size;
-	t->kcov_area = area;
-	t->kcov_sequence = sequence;
-	/* See comment in check_kcov_mode(). */
+	t->kcov_state = *state;
 	barrier();
+	/* See comment in check_kcov_mode(). */
 	WRITE_ONCE(t->kcov_mode, mode);
 }
 
@@ -375,14 +364,14 @@ static void kcov_stop(struct task_struct *t)
 	WRITE_ONCE(t->kcov_mode, KCOV_MODE_DISABLED);
 	barrier();
 	t->kcov = NULL;
-	t->kcov_size = 0;
-	t->kcov_area = NULL;
+	t->kcov_state.size = 0;
+	t->kcov_state.area = NULL;
 }
 
 static void kcov_task_reset(struct task_struct *t)
 {
 	kcov_stop(t);
-	t->kcov_sequence = 0;
+	t->kcov_state.sequence = 0;
 	t->kcov_handle = 0;
 }
 
@@ -398,7 +387,7 @@ static void kcov_reset(struct kcov *kcov)
 	kcov->mode = KCOV_MODE_INIT;
 	kcov->remote = false;
 	kcov->remote_size = 0;
-	kcov->sequence++;
+	kcov->state.sequence++;
 }
 
 static void kcov_remote_reset(struct kcov *kcov)
@@ -438,7 +427,7 @@ static void kcov_put(struct kcov *kcov)
 {
 	if (refcount_dec_and_test(&kcov->refcount)) {
 		kcov_remote_reset(kcov);
-		vfree(kcov->area);
+		vfree(kcov->state.area);
 		kfree(kcov);
 	}
 }
@@ -495,8 +484,8 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
 	unsigned long flags;
 
 	spin_lock_irqsave(&kcov->lock, flags);
-	size = kcov->size * sizeof(unsigned long);
-	if (kcov->area == NULL || vma->vm_pgoff != 0 ||
+	size = kcov->state.size * sizeof(unsigned long);
+	if (kcov->state.area == NULL || vma->vm_pgoff != 0 ||
 	    vma->vm_end - vma->vm_start != size) {
 		res = -EINVAL;
 		goto exit;
@@ -504,7 +493,7 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
 	spin_unlock_irqrestore(&kcov->lock, flags);
 	vm_flags_set(vma, VM_DONTEXPAND);
 	for (off = 0; off < size; off += PAGE_SIZE) {
-		page = vmalloc_to_page(kcov->area + off);
+		page = vmalloc_to_page(kcov->state.area + off);
 		res = vm_insert_page(vma, vma->vm_start + off, page);
 		if (res) {
 			pr_warn_once("kcov: vm_insert_page() failed\n");
@@ -525,7 +514,7 @@ static int kcov_open(struct inode *inode, struct file *filep)
 	if (!kcov)
 		return -ENOMEM;
 	kcov->mode = KCOV_MODE_DISABLED;
-	kcov->sequence = 1;
+	kcov->state.sequence = 1;
 	refcount_set(&kcov->refcount, 1);
 	spin_lock_init(&kcov->lock);
 	filep->private_data = kcov;
@@ -560,10 +549,10 @@ static int kcov_get_mode(unsigned long arg)
 static void kcov_fault_in_area(struct kcov *kcov)
 {
 	unsigned long stride = PAGE_SIZE / sizeof(unsigned long);
-	unsigned long *area = kcov->area;
+	unsigned long *area = kcov->state.area;
 	unsigned long offset;
 
-	for (offset = 0; offset < kcov->size; offset += stride)
+	for (offset = 0; offset < kcov->state.size; offset += stride)
 		READ_ONCE(area[offset]);
 }
 
@@ -602,7 +591,7 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 		 * at task exit or voluntary by KCOV_DISABLE. After that it can
 		 * be enabled for another task.
 		 */
-		if (kcov->mode != KCOV_MODE_INIT || !kcov->area)
+		if (kcov->mode != KCOV_MODE_INIT || !kcov->state.area)
 			return -EINVAL;
 		t = current;
 		if (kcov->t != NULL || t->kcov != NULL)
@@ -612,8 +601,7 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 			return mode;
 		kcov_fault_in_area(kcov);
 		kcov->mode = mode;
-		kcov_start(t, kcov, kcov->size, kcov->area, kcov->mode,
-			   kcov->sequence);
+		kcov_start(t, kcov, mode, &kcov->state);
 		kcov->t = t;
 		/* Put either in kcov_task_exit() or in KCOV_DISABLE. */
 		kcov_get(kcov);
@@ -630,7 +618,7 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 		kcov_put(kcov);
 		return 0;
 	case KCOV_REMOTE_ENABLE:
-		if (kcov->mode != KCOV_MODE_INIT || !kcov->area)
+		if (kcov->mode != KCOV_MODE_INIT || !kcov->state.area)
 			return -EINVAL;
 		t = current;
 		if (kcov->t != NULL || t->kcov != NULL)
@@ -725,8 +713,8 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 			vfree(area);
 			return -EBUSY;
 		}
-		kcov->area = area;
-		kcov->size = size;
+		kcov->state.area = area;
+		kcov->state.size = size;
 		kcov->mode = KCOV_MODE_INIT;
 		spin_unlock_irqrestore(&kcov->lock, flags);
 		return 0;
@@ -825,10 +813,8 @@ static void kcov_remote_softirq_start(struct task_struct *t)
 	mode = READ_ONCE(t->kcov_mode);
 	barrier();
 	if (kcov_mode_enabled(mode)) {
+		data->saved_state = t->kcov_state;
 		data->saved_mode = mode;
-		data->saved_size = t->kcov_size;
-		data->saved_area = t->kcov_area;
-		data->saved_sequence = t->kcov_sequence;
 		data->saved_kcov = t->kcov;
 		kcov_stop(t);
 	}
@@ -839,13 +825,9 @@ static void kcov_remote_softirq_stop(struct task_struct *t)
 	struct kcov_percpu_data *data = this_cpu_ptr(&kcov_percpu_data);
 
 	if (data->saved_kcov) {
-		kcov_start(t, data->saved_kcov, data->saved_size,
-			   data->saved_area, data->saved_mode,
-			   data->saved_sequence);
-		data->saved_mode = 0;
-		data->saved_size = 0;
-		data->saved_area = NULL;
-		data->saved_sequence = 0;
+		kcov_start(t, data->saved_kcov, t->kcov_mode,
+			   &data->saved_state);
+		data->saved_state = (struct kcov_state){};
 		data->saved_kcov = NULL;
 	}
 }
@@ -854,12 +836,12 @@ void kcov_remote_start(u64 handle)
 {
 	struct task_struct *t = current;
 	struct kcov_remote *remote;
+	struct kcov_state state;
+	enum kcov_mode mode;
+	unsigned long flags;
+	unsigned int size;
 	struct kcov *kcov;
-	unsigned int mode;
 	void *area;
-	unsigned int size;
-	int sequence;
-	unsigned long flags;
 
 	if (WARN_ON(!kcov_check_handle(handle, true, true, true)))
 		return;
@@ -904,7 +886,7 @@ void kcov_remote_start(u64 handle)
 	 * KCOV_DISABLE / kcov_remote_reset().
 	 */
 	mode = kcov->mode;
-	sequence = kcov->sequence;
+	state.sequence = kcov->state.sequence;
 	if (in_task()) {
 		size = kcov->remote_size;
 		area = kcov_remote_area_get(size);
@@ -927,12 +909,14 @@ void kcov_remote_start(u64 handle)
 
 	/* Reset coverage size. */
 	*(u64 *)area = 0;
+	state.area = area;
+	state.size = size;
 
 	if (in_serving_softirq()) {
 		kcov_remote_softirq_start(t);
 		t->kcov_softirq = 1;
 	}
-	kcov_start(t, kcov, size, area, mode, sequence);
+	kcov_start(t, kcov, t->kcov_mode, &state);
 
 	local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
 }
@@ -1030,9 +1014,9 @@ void kcov_remote_stop(void)
 	}
 
 	kcov = t->kcov;
-	area = t->kcov_area;
-	size = t->kcov_size;
-	sequence = t->kcov_sequence;
+	area = t->kcov_state.area;
+	size = t->kcov_state.size;
+	sequence = t->kcov_state.sequence;
 
 	kcov_stop(t);
 	if (in_serving_softirq()) {
@@ -1045,8 +1029,9 @@ void kcov_remote_stop(void)
 	 * KCOV_DISABLE could have been called between kcov_remote_start()
 	 * and kcov_remote_stop(), hence the sequence check.
 	 */
-	if (sequence == kcov->sequence && kcov->remote)
-		kcov_move_area(kcov->mode, kcov->area, kcov->size, area);
+	if (sequence == kcov->state.sequence && kcov->remote)
+		kcov_move_area(kcov->mode, kcov->state.area, kcov->state.size,
+			       area);
 	spin_unlock(&kcov->lock);
 
 	if (in_task()) {
-- 
2.50.0.727.gbf7dc18ff4-goog

