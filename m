Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21EB2E765B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945334; cv=none; b=pvRQ9XE26xdkukWauT+O9biDk7IT6+t++Bj/h4B+38N95eqKCwHnuuvjTrtrUUfmS/yYyaaVdiDt5G7vSkNN5DkOj59u6dJJhslE6u0PsKtBGIAFY5RmGau2Uv+VcRklr0jlNKt2XgdeX2i1pzKW0NLNt62Dw7sku3zmJ6FmUaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945334; c=relaxed/simple;
	bh=s9j5uH1RPS6ZE0s8gBoT8HhmU+i9Za/3OV8dFhL5BI4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C6CBhxnoGi5uqy2Ud5HiuHfbVjKIDSvqGJewtotHHrCEcUb9COCZ3XzFIEZTfoKpGHVfnSkdi+vhQwW1U0/Bri8iOCYhdacN0qXDYdfZSs4JePTGzX2Lsk0ccMShcA2p1Sbr9HtH5ker3pX9LhPOG36wVo7Z48BVHVN1jiHnT2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jq3YleZk; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jq3YleZk"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so5555915e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750945329; x=1751550129; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FJiMSG3aUxEuiCh3YiYxcirsWMG54X+LrVgKBYabMpk=;
        b=Jq3YleZk1GfuCWoLC6nFWpsV/VWYbMU8NAvopbY8K7/CwysvvrigyRQG9zeuejZety
         drSc1oU4uNrWf0MKEjXDC4ccptExvGcRUeChrPzwNhElKPoAMAhCvaGWNVfvDeFRvuON
         qqsvfs6w3WycWde74u5vD6PpDd/m9FggErm51HOT9BAAylLPwPrqeT5pd5hakq49125o
         mOMJunszGENccH/dblyuf1LrtlUjhbd7GqJCPY/W1i0Fbm9nItuoi/1GNr4p6d8dUOI7
         6H1HKsEBHnB59SJ9mfbdT3Btz45PFfUAFp1US7DWEQr4w8CEVV0Cjk2jz4vTjMckDVr9
         Gdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750945329; x=1751550129;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJiMSG3aUxEuiCh3YiYxcirsWMG54X+LrVgKBYabMpk=;
        b=Kq9D8OOptbhGFvyGn6TWNhlrSD9Dssf4Q6l8rywJXHQLPJmNJf2RpE6aNP5C+AeSzg
         hqVEABnlwPEQ2XjyEIjGPiBBacuY+U3UZKHMfDgUEH8Tkuge849BwYrBbMgTlZvk3Jg6
         iRthqoo+JXVSHyX55J7TKeANL5DlbCCoE+QCebv4OkVrNHAnlytYH+fzJBxvw3tL5q4y
         uwoNmcSHGI3i4qvr4LqjAIVqgcNHJSSWMB44A/9bTJBK1tMymJf1h/YIk7eZph1lV31J
         aHn+46pnEO7CL/BTf4Oe9o7yCbC4+2XD10hEcd+MOX6X5WoaCv6gWDiJ6TbyRyhVnmyS
         Zsqg==
X-Forwarded-Encrypted: i=1; AJvYcCVWU2IB31K35Zxg66JuwK2wVHVat/J51DL6MHr1/YevPrYo/yH+Mu6IFp6BWZ9B7vxttGghQ0J1c9SDTrM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5S0GHuqil/ZprSt8hCaZqCi9BRlIoMqVXq7MgqJ4imUfCOTgs
	MHEEHOG4dJzvJGWvSkh+i+iVJfOII+FFBpYqIh6onEcfLrEcqzx7bHbx0HIMfPBfp/azGl23uLT
	oGdS+Xw==
X-Google-Smtp-Source: AGHT+IG9mmxTSxxGU0VC3HuhJ6aj8RwHCW6SqPvStDoZe373+75rFbK28RVsaz7CE9N/fE9vOfu3DC3tMeo=
X-Received: from wmbfs17.prod.google.com ([2002:a05:600c:3f91:b0:450:cfda:ece7])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1914:b0:43d:172:50b1
 with SMTP id 5b1f17b1804b1-45381af206cmr68815395e9.29.1750945329192; Thu, 26
 Jun 2025 06:42:09 -0700 (PDT)
Date: Thu, 26 Jun 2025 15:41:49 +0200
In-Reply-To: <20250626134158.3385080-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626134158.3385080-3-glider@google.com>
Subject: [PATCH v2 02/11] kcov: apply clang-format to kcov code
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

kcov used to obey clang-format style, but somehow diverged over time.
This patch applies clang-format to kernel/kcov.c and
include/linux/kcov.h, no functional change.

Signed-off-by: Alexander Potapenko <glider@google.com>
---
Change-Id: I49c21babad831e5d134ad8a4d4adffd1f5abc1dd

v2:
 - factor out handles_off in kcov_ioctl() for prettier formatting
---
 include/linux/kcov.h |  54 +++++++++++------
 kernel/kcov.c        | 134 ++++++++++++++++++++++---------------------
 2 files changed, 105 insertions(+), 83 deletions(-)

diff --git a/include/linux/kcov.h b/include/linux/kcov.h
index 75a2fb8b16c32..932b4face1005 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -25,20 +25,20 @@ enum kcov_mode {
 	KCOV_MODE_REMOTE = 4,
 };
 
-#define KCOV_IN_CTXSW	(1 << 30)
+#define KCOV_IN_CTXSW (1 << 30)
 
 void kcov_task_init(struct task_struct *t);
 void kcov_task_exit(struct task_struct *t);
 
-#define kcov_prepare_switch(t)			\
-do {						\
-	(t)->kcov_mode |= KCOV_IN_CTXSW;	\
-} while (0)
+#define kcov_prepare_switch(t)                   \
+	do {                                     \
+		(t)->kcov_mode |= KCOV_IN_CTXSW; \
+	} while (0)
 
-#define kcov_finish_switch(t)			\
-do {						\
-	(t)->kcov_mode &= ~KCOV_IN_CTXSW;	\
-} while (0)
+#define kcov_finish_switch(t)                     \
+	do {                                      \
+		(t)->kcov_mode &= ~KCOV_IN_CTXSW; \
+	} while (0)
 
 /* See Documentation/dev-tools/kcov.rst for usage details. */
 void kcov_remote_start(u64 handle);
@@ -119,23 +119,41 @@ void __sanitizer_cov_trace_switch(kcov_u64 val, void *cases);
 
 #else
 
-static inline void kcov_task_init(struct task_struct *t) {}
-static inline void kcov_task_exit(struct task_struct *t) {}
-static inline void kcov_prepare_switch(struct task_struct *t) {}
-static inline void kcov_finish_switch(struct task_struct *t) {}
-static inline void kcov_remote_start(u64 handle) {}
-static inline void kcov_remote_stop(void) {}
+static inline void kcov_task_init(struct task_struct *t)
+{
+}
+static inline void kcov_task_exit(struct task_struct *t)
+{
+}
+static inline void kcov_prepare_switch(struct task_struct *t)
+{
+}
+static inline void kcov_finish_switch(struct task_struct *t)
+{
+}
+static inline void kcov_remote_start(u64 handle)
+{
+}
+static inline void kcov_remote_stop(void)
+{
+}
 static inline u64 kcov_common_handle(void)
 {
 	return 0;
 }
-static inline void kcov_remote_start_common(u64 id) {}
-static inline void kcov_remote_start_usb(u64 id) {}
+static inline void kcov_remote_start_common(u64 id)
+{
+}
+static inline void kcov_remote_start_usb(u64 id)
+{
+}
 static inline unsigned long kcov_remote_start_usb_softirq(u64 id)
 {
 	return 0;
 }
-static inline void kcov_remote_stop_softirq(unsigned long flags) {}
+static inline void kcov_remote_stop_softirq(unsigned long flags)
+{
+}
 
 #endif /* CONFIG_KCOV */
 #endif /* _LINUX_KCOV_H */
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 187ba1b80bda1..0dd42b78694c9 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -4,27 +4,28 @@
 #define DISABLE_BRANCH_PROFILING
 #include <linux/atomic.h>
 #include <linux/compiler.h>
+#include <linux/debugfs.h>
 #include <linux/errno.h>
 #include <linux/export.h>
-#include <linux/types.h>
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/hashtable.h>
 #include <linux/init.h>
 #include <linux/jiffies.h>
+#include <linux/kcov.h>
 #include <linux/kmsan-checks.h>
+#include <linux/log2.h>
 #include <linux/mm.h>
 #include <linux/preempt.h>
 #include <linux/printk.h>
+#include <linux/refcount.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <linux/vmalloc.h>
-#include <linux/debugfs.h>
+#include <linux/types.h>
 #include <linux/uaccess.h>
-#include <linux/kcov.h>
-#include <linux/refcount.h>
-#include <linux/log2.h>
+#include <linux/vmalloc.h>
+
 #include <asm/setup.h>
 
 #define kcov_debug(fmt, ...) pr_debug("%s: " fmt, __func__, ##__VA_ARGS__)
@@ -52,36 +53,36 @@ struct kcov {
 	 *  - task with enabled coverage (we can't unwire it from another task)
 	 *  - each code section for remote coverage collection
 	 */
-	refcount_t		refcount;
+	refcount_t refcount;
 	/* The lock protects mode, size, area and t. */
-	spinlock_t		lock;
-	enum kcov_mode		mode;
+	spinlock_t lock;
+	enum kcov_mode mode;
 	/* Size of arena (in long's). */
-	unsigned int		size;
+	unsigned int size;
 	/* Coverage buffer shared with user space. */
-	void			*area;
+	void *area;
 	/* Task for which we collect coverage, or NULL. */
-	struct task_struct	*t;
+	struct task_struct *t;
 	/* Collecting coverage from remote (background) threads. */
-	bool			remote;
+	bool remote;
 	/* Size of remote area (in long's). */
-	unsigned int		remote_size;
+	unsigned int remote_size;
 	/*
 	 * Sequence is incremented each time kcov is reenabled, used by
 	 * kcov_remote_stop(), see the comment there.
 	 */
-	int			sequence;
+	int sequence;
 };
 
 struct kcov_remote_area {
-	struct list_head	list;
-	unsigned int		size;
+	struct list_head list;
+	unsigned int size;
 };
 
 struct kcov_remote {
-	u64			handle;
-	struct kcov		*kcov;
-	struct hlist_node	hnode;
+	u64 handle;
+	struct kcov *kcov;
+	struct hlist_node hnode;
 };
 
 static DEFINE_SPINLOCK(kcov_remote_lock);
@@ -89,14 +90,14 @@ static DEFINE_HASHTABLE(kcov_remote_map, 4);
 static struct list_head kcov_remote_areas = LIST_HEAD_INIT(kcov_remote_areas);
 
 struct kcov_percpu_data {
-	void			*irq_area;
-	local_lock_t		lock;
-
-	unsigned int		saved_mode;
-	unsigned int		saved_size;
-	void			*saved_area;
-	struct kcov		*saved_kcov;
-	int			saved_sequence;
+	void *irq_area;
+	local_lock_t lock;
+
+	unsigned int saved_mode;
+	unsigned int saved_size;
+	void *saved_area;
+	struct kcov *saved_kcov;
+	int saved_sequence;
 };
 
 static DEFINE_PER_CPU(struct kcov_percpu_data, kcov_percpu_data) = {
@@ -149,7 +150,7 @@ static struct kcov_remote_area *kcov_remote_area_get(unsigned int size)
 
 /* Must be called with kcov_remote_lock locked. */
 static void kcov_remote_area_put(struct kcov_remote_area *area,
-					unsigned int size)
+				 unsigned int size)
 {
 	INIT_LIST_HEAD(&area->list);
 	area->size = size;
@@ -171,7 +172,8 @@ static __always_inline bool in_softirq_really(void)
 	return in_serving_softirq() && !in_hardirq() && !in_nmi();
 }
 
-static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_struct *t)
+static notrace bool check_kcov_mode(enum kcov_mode needed_mode,
+				    struct task_struct *t)
 {
 	unsigned int mode;
 
@@ -354,8 +356,8 @@ EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
 #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
 
 static void kcov_start(struct task_struct *t, struct kcov *kcov,
-			unsigned int size, void *area, enum kcov_mode mode,
-			int sequence)
+		       unsigned int size, void *area, enum kcov_mode mode,
+		       int sequence)
 {
 	kcov_debug("t = %px, size = %u, area = %px\n", t, size, area);
 	t->kcov = kcov;
@@ -566,14 +568,14 @@ static void kcov_fault_in_area(struct kcov *kcov)
 }
 
 static inline bool kcov_check_handle(u64 handle, bool common_valid,
-				bool uncommon_valid, bool zero_valid)
+				     bool uncommon_valid, bool zero_valid)
 {
 	if (handle & ~(KCOV_SUBSYSTEM_MASK | KCOV_INSTANCE_MASK))
 		return false;
 	switch (handle & KCOV_SUBSYSTEM_MASK) {
 	case KCOV_SUBSYSTEM_COMMON:
-		return (handle & KCOV_INSTANCE_MASK) ?
-			common_valid : zero_valid;
+		return (handle & KCOV_INSTANCE_MASK) ? common_valid :
+						       zero_valid;
 	case KCOV_SUBSYSTEM_USB:
 		return uncommon_valid;
 	default:
@@ -611,7 +613,7 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 		kcov_fault_in_area(kcov);
 		kcov->mode = mode;
 		kcov_start(t, kcov, kcov->size, kcov->area, kcov->mode,
-				kcov->sequence);
+			   kcov->sequence);
 		kcov->t = t;
 		/* Put either in kcov_task_exit() or in KCOV_DISABLE. */
 		kcov_get(kcov);
@@ -642,40 +644,40 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 			return -EINVAL;
 		kcov->mode = mode;
 		t->kcov = kcov;
-	        t->kcov_mode = KCOV_MODE_REMOTE;
+		t->kcov_mode = KCOV_MODE_REMOTE;
 		kcov->t = t;
 		kcov->remote = true;
 		kcov->remote_size = remote_arg->area_size;
 		spin_lock_irqsave(&kcov_remote_lock, flags);
 		for (i = 0; i < remote_arg->num_handles; i++) {
-			if (!kcov_check_handle(remote_arg->handles[i],
-						false, true, false)) {
+			if (!kcov_check_handle(remote_arg->handles[i], false,
+					       true, false)) {
 				spin_unlock_irqrestore(&kcov_remote_lock,
-							flags);
+						       flags);
 				kcov_disable(t, kcov);
 				return -EINVAL;
 			}
 			remote = kcov_remote_add(kcov, remote_arg->handles[i]);
 			if (IS_ERR(remote)) {
 				spin_unlock_irqrestore(&kcov_remote_lock,
-							flags);
+						       flags);
 				kcov_disable(t, kcov);
 				return PTR_ERR(remote);
 			}
 		}
 		if (remote_arg->common_handle) {
-			if (!kcov_check_handle(remote_arg->common_handle,
-						true, false, false)) {
+			if (!kcov_check_handle(remote_arg->common_handle, true,
+					       false, false)) {
 				spin_unlock_irqrestore(&kcov_remote_lock,
-							flags);
+						       flags);
 				kcov_disable(t, kcov);
 				return -EINVAL;
 			}
 			remote = kcov_remote_add(kcov,
-					remote_arg->common_handle);
+						 remote_arg->common_handle);
 			if (IS_ERR(remote)) {
 				spin_unlock_irqrestore(&kcov_remote_lock,
-							flags);
+						       flags);
 				kcov_disable(t, kcov);
 				return PTR_ERR(remote);
 			}
@@ -698,6 +700,7 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	unsigned int remote_num_handles;
 	unsigned long remote_arg_size;
 	unsigned long size, flags;
+	size_t handles_off;
 	void *area;
 
 	kcov = filep->private_data;
@@ -728,13 +731,14 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 		spin_unlock_irqrestore(&kcov->lock, flags);
 		return 0;
 	case KCOV_REMOTE_ENABLE:
-		if (get_user(remote_num_handles, (unsigned __user *)(arg +
-				offsetof(struct kcov_remote_arg, num_handles))))
+		handles_off = offsetof(struct kcov_remote_arg, num_handles);
+		if (get_user(remote_num_handles,
+			     (unsigned __user *)(arg + handles_off)))
 			return -EFAULT;
 		if (remote_num_handles > KCOV_REMOTE_MAX_HANDLES)
 			return -EINVAL;
-		remote_arg_size = struct_size(remote_arg, handles,
-					remote_num_handles);
+		remote_arg_size =
+			struct_size(remote_arg, handles, remote_num_handles);
 		remote_arg = memdup_user((void __user *)arg, remote_arg_size);
 		if (IS_ERR(remote_arg))
 			return PTR_ERR(remote_arg);
@@ -758,11 +762,11 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 }
 
 static const struct file_operations kcov_fops = {
-	.open		= kcov_open,
-	.unlocked_ioctl	= kcov_ioctl,
-	.compat_ioctl	= kcov_ioctl,
-	.mmap		= kcov_mmap,
-	.release        = kcov_close,
+	.open = kcov_open,
+	.unlocked_ioctl = kcov_ioctl,
+	.compat_ioctl = kcov_ioctl,
+	.mmap = kcov_mmap,
+	.release = kcov_close,
 };
 
 /*
@@ -836,8 +840,8 @@ static void kcov_remote_softirq_stop(struct task_struct *t)
 
 	if (data->saved_kcov) {
 		kcov_start(t, data->saved_kcov, data->saved_size,
-				data->saved_area, data->saved_mode,
-				data->saved_sequence);
+			   data->saved_area, data->saved_mode,
+			   data->saved_sequence);
 		data->saved_mode = 0;
 		data->saved_size = 0;
 		data->saved_area = NULL;
@@ -891,7 +895,7 @@ void kcov_remote_start(u64 handle)
 		return;
 	}
 	kcov_debug("handle = %llx, context: %s\n", handle,
-			in_task() ? "task" : "softirq");
+		   in_task() ? "task" : "softirq");
 	kcov = remote->kcov;
 	/* Put in kcov_remote_stop(). */
 	kcov_get(kcov);
@@ -931,12 +935,11 @@ void kcov_remote_start(u64 handle)
 	kcov_start(t, kcov, size, area, mode, sequence);
 
 	local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
-
 }
 EXPORT_SYMBOL(kcov_remote_start);
 
 static void kcov_move_area(enum kcov_mode mode, void *dst_area,
-				unsigned int dst_area_size, void *src_area)
+			   unsigned int dst_area_size, void *src_area)
 {
 	u64 word_size = sizeof(unsigned long);
 	u64 count_size, entry_size_log;
@@ -944,8 +947,8 @@ static void kcov_move_area(enum kcov_mode mode, void *dst_area,
 	void *dst_entries, *src_entries;
 	u64 dst_occupied, dst_free, bytes_to_move, entries_moved;
 
-	kcov_debug("%px %u <= %px %lu\n",
-		dst_area, dst_area_size, src_area, *(unsigned long *)src_area);
+	kcov_debug("%px %u <= %px %lu\n", dst_area, dst_area_size, src_area,
+		   *(unsigned long *)src_area);
 
 	switch (mode) {
 	case KCOV_MODE_TRACE_PC:
@@ -967,8 +970,8 @@ static void kcov_move_area(enum kcov_mode mode, void *dst_area,
 	}
 
 	/* As arm can't divide u64 integers use log of entry size. */
-	if (dst_len > ((dst_area_size * word_size - count_size) >>
-				entry_size_log))
+	if (dst_len >
+	    ((dst_area_size * word_size - count_size) >> entry_size_log))
 		return;
 	dst_occupied = count_size + (dst_len << entry_size_log);
 	dst_free = dst_area_size * word_size - dst_occupied;
@@ -1100,7 +1103,8 @@ static int __init kcov_init(void)
 
 	for_each_possible_cpu(cpu) {
 		void *area = vmalloc_node(CONFIG_KCOV_IRQ_AREA_SIZE *
-				sizeof(unsigned long), cpu_to_node(cpu));
+						  sizeof(unsigned long),
+					  cpu_to_node(cpu));
 		if (!area)
 			return -ENOMEM;
 		per_cpu_ptr(&kcov_percpu_data, cpu)->irq_area = area;
-- 
2.50.0.727.gbf7dc18ff4-goog

