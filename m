Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEF3191499
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597570; cv=none; b=YcHWlywGf/LG/SmA0VnbzB1yiWwQGCLzl693T+t8enpcN4JGNrV4MAOv8lSqHc1E0KZYgQxLa3p/oCLKdOp4EB2FMXZBkOkeWocYgxFMz9FbKnBBomRSBOxvvSBaAXu6TiiCtzXREESMk6OBuLdZa5ozYnm5kvAv5p7tgtKa8fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597570; c=relaxed/simple;
	bh=gli6f5Pht7GF/KlCotN9/63ZsUUJh74HTo8OtVCQXPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YWJwjktg2KDtYXoMklmtp3isLSvcM0wXnJHGpv7iZrzHhXy1iBFgnU407Kpg+flij+KC7ml6DLdTJQoN661mFMNA3D8LkDSDJac1KayLvX5TQqx9IanraTLsbK6HHZZSQ3eechPHNQyL+FlkFKlqozeYNAh+25FYB0PeaBxXLTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=TGRyou1+; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="TGRyou1+"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b26c5fd40a9so2319221a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748597568; x=1749202368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7odL+uROHJjULwRoyw6w9QE9qQsYAMCGXEhdmggZkMI=;
        b=TGRyou1+eoQBbWF9THJjh1oSMbLF2olFxpCnXsDswPGjPu0YnZ2bJxH94qIXOBGdZ9
         3nf74OUenUuM3UitMYVqcsSUR8fPNwxslOznu1WUFo0TiGV7ZVFWe6Co94WUjwHpxPcL
         SV9wdUwyXHcHfyxsArc5HSRPIaaYHekpxs4V1pEl2/E0gp9DTlLS3HY57ZP/FE/kxHOl
         TYUqMcWq4KtwsurVUNXgxm+hPyraAPBpSkWB1vNiTtzIwtH63i+AQhWjNCGI7KeoBi8v
         yLKfp3nWPL0O9eOrUpaY5oG0r2wBdZ1hQlz4QdT0FXwhgRwB+HbcI/BVHIz0b9vLrF7k
         QrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748597568; x=1749202368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7odL+uROHJjULwRoyw6w9QE9qQsYAMCGXEhdmggZkMI=;
        b=vF/WQrzTXWmCR6PsM3rmOc8AZ2Fy2n/Cfh5/tzSGAlznfFDcLfpsTx2VqWKrt8OP2Q
         G3DSSmy7C+ui2VroQEZIZuTuRXjmakqUiHH3b8ffZ3eJz8enxfMeXslGxwx4YT16Gn02
         hYPl0l1rLU1OlCY4yRVnpzGBrZnwi3ShCwusyTQNMDm90z5CyLRbFzYDhNINs1p5fDwI
         RjEHN6BjrAFgc6BYLbjUeYROi/wAsEhvtnVsmaQ7b6hIAbi2HGzyQTq+g+1pYKNFiQ0M
         FiRY0saa8svsZ1aoP2zVgWOuKhriqjMxlyDciEPQFOZXdOlA/R50gGEoOdpX9lyypJR6
         0FYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdmKzUaak1kNhrksN2UL3Bo/pb2S35tj8b0mwOzJ1Tqo42A7lDGEWRoJmNFI+UPdWCdXF7JhbvpeY0ASc=@vger.kernel.org
X-Gm-Message-State: AOJu0YypeiCf8pSI9LUma11pT+kqRakI63QBfGiSwV3DTb/sb+Hk22ec
	dldiC7dYxM2vWdon7YH64Jos5AwoTZjhULyhTrXqg7r1WypbTkThUrcTpB5NO7zbBf0=
X-Gm-Gg: ASbGncuOe7IrcPNto6rGnZQufPx6w/FNqvsH5jfosHAoAZeDpGF9mi9ZomJN1TLJdqj
	lo4pkt21nBYvUBrHIAG6smbRwKY4akbEVtUeLRdUKWnP20BfAbfdgb5J31tU2kKjPUz04srWgpE
	g24JJh3A6R1OA2+FtbkyWlYuNICWDX70+uj11GARPuGgrFSRDWTKkLskwtQlwMmW/TqPjZgGJ28
	ng4gvtxKaasfB3yHZ0m5eaXiCRE9KWV7loKl3+TtJsPUa7xNt0rgzoljrzbLaRV9UqgkaDipiNk
	6YAX/Ns3wiV1LhW3p6Xbv8L8K/4xRTZ1gNRVrnoemkaY1S1lHhHdsI0/yMWe2Yv1pr0eYpx8lVh
	5TArE6tEzQw==
X-Google-Smtp-Source: AGHT+IE+I3OxPDYMOIkiL8a1fAG5KorJApLQ8jYCZgv/H0F4D9V+Weoec5Tdc5pVnNzU/vxuroLuaA==
X-Received: by 2002:a17:90b:3eca:b0:30e:5c74:53c9 with SMTP id 98e67ed59e1d1-31246453833mr3702580a91.11.1748597567790;
        Fri, 30 May 2025 02:32:47 -0700 (PDT)
Received: from FQ627FTG20.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e29f7b8sm838724a91.2.2025.05.30.02.32.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 May 2025 02:32:47 -0700 (PDT)
From: Bo Li <libo.gcs85@bytedance.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	luto@kernel.org,
	kees@kernel.org,
	akpm@linux-foundation.org,
	david@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	peterz@infradead.org
Cc: dietmar.eggemann@arm.com,
	hpa@zytor.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	jannh@google.com,
	pfalcato@suse.de,
	riel@surriel.com,
	harry.yoo@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	duanxiongchun@bytedance.com,
	yinhongbo@bytedance.com,
	dengliang.1214@bytedance.com,
	xieyongji@bytedance.com,
	chaiwen.cc@bytedance.com,
	songmuchun@bytedance.com,
	yuanzhu@bytedance.com,
	chengguozhu@bytedance.com,
	sunjiadong.lff@bytedance.com,
	Bo Li <libo.gcs85@bytedance.com>
Subject: [RFC v2 17/35] RPAL: add a mapping between fsbase and tasks
Date: Fri, 30 May 2025 17:27:45 +0800
Message-Id: <964eab3190221c0c880ee9a52957865512c8571c.1748594841.git.libo.gcs85@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1748594840.git.libo.gcs85@bytedance.com>
References: <cover.1748594840.git.libo.gcs85@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RPAL relies on the value of the fsbase register to determine whether a lazy
switch is necessary. Therefore, a mapping between fsbase and tasks must be
established.

This patch allows a thread to register its fsbase value when it is
registered as a receiver. The rpal_find_next_task() interface is used to
locate the receiver corresponding to a given fsbase value. Additionally, a
new rpal_misidentify() interface has been added to check if the current
fsbase value matches the current task. If they do not match, the task
corresponding to the fsbase is identified, the RPAL_LAZY_SWITCHED_BIT flag
is set, and the current task is recorded. The kernel can later use this
flag and the recorded task to backtrack to the task before the lazy switch.

Signed-off-by: Bo Li <libo.gcs85@bytedance.com>
---
 arch/x86/rpal/core.c   | 85 ++++++++++++++++++++++++++++++++++++++++++
 arch/x86/rpal/thread.c | 57 +++++++++++++++++++++++++++-
 include/linux/rpal.h   | 15 ++++++++
 3 files changed, 156 insertions(+), 1 deletion(-)

diff --git a/arch/x86/rpal/core.c b/arch/x86/rpal/core.c
index c185a453c1b2..19c4ef38bca3 100644
--- a/arch/x86/rpal/core.c
+++ b/arch/x86/rpal/core.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/rpal.h>
+#include <asm/fsgsbase.h>
 
 #include "internal.h"
 
@@ -33,12 +34,96 @@ static inline void rpal_unlock_cpu(struct task_struct *tsk)
 	}
 }
 
+
+static inline struct task_struct *rpal_get_sender_task(void)
+{
+	struct task_struct *next;
+
+	next = current->rpal_rd->sender;
+	current->rpal_rd->sender = NULL;
+
+	return next;
+}
+
+/*
+ * RPAL uses the value of fsbase (which libc uses as the base
+ * address for thread-local storage) to determine whether a
+ * lazy switch should be performed.
+ */
+static inline struct task_struct *rpal_misidentify(void)
+{
+	struct task_struct *next = NULL;
+	struct rpal_service *cur = rpal_current_service();
+	unsigned long fsbase;
+
+	fsbase = rdfsbase();
+	if (unlikely(!rpal_is_correct_address(cur, fsbase))) {
+		if (rpal_test_current_thread_flag(RPAL_LAZY_SWITCHED_BIT)) {
+			/* current is receiver, next is sender */
+			next = rpal_get_sender_task();
+			if (unlikely(next == NULL)) {
+				rpal_err("cannot find sender task\n");
+				goto out;
+			}
+		} else {
+			/* current is sender, next is receiver */
+			next = rpal_find_next_task(fsbase);
+			if (unlikely(next == NULL)) {
+				rpal_err(
+					"cannot find receiver task, fsbase: 0x%016lx\n",
+					fsbase);
+				goto out;
+			}
+			rpal_set_task_thread_flag(next, RPAL_LAZY_SWITCHED_BIT);
+			next->rpal_rd->sender = current;
+		}
+	}
+out:
+	return next;
+}
+
+struct task_struct *rpal_find_next_task(unsigned long fsbase)
+{
+	struct rpal_service *cur = rpal_current_service();
+	struct rpal_service *tgt;
+	struct task_struct *tsk = NULL;
+	int i;
+
+	tgt = rpal_get_mapped_service_by_addr(cur, fsbase);
+	if (unlikely(!tgt)) {
+		pr_debug("rpal debug: cannot find legal rs, fsbase: 0x%016lx\n",
+			 fsbase);
+		return NULL;
+	}
+	for (i = 0; i < RPAL_MAX_RECEIVER_NUM; ++i) {
+		if (tgt->fs_tsk_map[i].fsbase == fsbase) {
+			tsk = tgt->fs_tsk_map[i].tsk;
+			break;
+		}
+	}
+	rpal_put_service(tgt);
+
+	return tsk;
+}
+
+static bool check_hardware_features(void)
+{
+	if (!boot_cpu_has(X86_FEATURE_FSGSBASE)) {
+		rpal_err("no fsgsbase feature\n");
+		return false;
+	}
+	return true;
+}
+
 int __init rpal_init(void)
 {
 	int ret = 0;
 
 	rpal_cap = 0;
 
+	if (!check_hardware_features())
+		goto fail;
+
 	ret = rpal_service_init();
 	if (ret)
 		goto fail;
diff --git a/arch/x86/rpal/thread.c b/arch/x86/rpal/thread.c
index bc203e9c6e5e..db3b13ff82be 100644
--- a/arch/x86/rpal/thread.c
+++ b/arch/x86/rpal/thread.c
@@ -7,9 +7,53 @@
  */
 
 #include <linux/rpal.h>
+#include <asm/fsgsbase.h>
 
 #include "internal.h"
 
+static bool set_fs_tsk_map(void)
+{
+	struct rpal_service *cur = rpal_current_service();
+	struct rpal_fsbase_tsk_map *ftm;
+	unsigned long fsbase = rdfsbase();
+	bool success = false;
+	int i = 0;
+
+	for (i = 0; i < RPAL_MAX_RECEIVER_NUM; ++i) {
+		ftm = &cur->fs_tsk_map[i];
+		if (ftm->fsbase == 0 &&
+		    cmpxchg64(&ftm->fsbase, 0, fsbase) == 0) {
+			ftm->tsk = current;
+			success = true;
+			break;
+		}
+	}
+
+	return success;
+}
+
+static bool clear_fs_tsk_map(void)
+{
+	struct rpal_service *cur = rpal_current_service();
+	struct rpal_fsbase_tsk_map *ftm;
+	unsigned long fsbase = rdfsbase();
+	bool success = false;
+	int i = 0;
+
+	for (i = 0; i < RPAL_MAX_RECEIVER_NUM; ++i) {
+		ftm = &cur->fs_tsk_map[i];
+		if (ftm->fsbase == fsbase) {
+			ftm->tsk = NULL;
+			barrier();
+			ftm->fsbase = 0;
+			success = true;
+			break;
+		}
+	}
+
+	return success;
+}
+
 static void rpal_common_data_init(struct rpal_common_data *rcd)
 {
 	rcd->bp_task = current;
@@ -54,6 +98,7 @@ int rpal_register_sender(unsigned long addr)
 	rsd->rsp = rsp;
 	rsd->scc = (struct rpal_sender_call_context *)(addr - rsp->user_start +
 						       rsp->kernel_start);
+	rsd->receiver = NULL;
 
 	current->rpal_sd = rsd;
 	rpal_set_current_thread_flag(RPAL_SENDER_BIT);
@@ -122,15 +167,21 @@ int rpal_register_receiver(unsigned long addr)
 		goto put_shared_page;
 	}
 
+	if (!set_fs_tsk_map()) {
+		ret = -EAGAIN;
+		goto free_rrd;
+	}
+
 	rpal_common_data_init(&rrd->rcd);
 	if (rpal_init_thread_pending(&rrd->rcd)) {
 		ret = -ENOMEM;
-		goto free_rrd;
+		goto clear_fs;
 	}
 	rrd->rsp = rsp;
 	rrd->rcc =
 		(struct rpal_receiver_call_context *)(addr - rsp->user_start +
 						      rsp->kernel_start);
+	rrd->sender = NULL;
 
 	current->rpal_rd = rrd;
 	rpal_set_current_thread_flag(RPAL_RECEIVER_BIT);
@@ -139,6 +190,8 @@ int rpal_register_receiver(unsigned long addr)
 
 	return 0;
 
+clear_fs:
+	clear_fs_tsk_map();
 free_rrd:
 	kfree(rrd);
 put_shared_page:
@@ -158,6 +211,8 @@ int rpal_unregister_receiver(void)
 		goto out;
 	}
 
+	clear_fs_tsk_map();
+
 	rpal_put_shared_page(rrd->rsp);
 	rpal_clear_current_thread_flag(RPAL_RECEIVER_BIT);
 	rpal_free_thread_pending(&rrd->rcd);
diff --git a/include/linux/rpal.h b/include/linux/rpal.h
index 5b115be14a55..45137770fac6 100644
--- a/include/linux/rpal.h
+++ b/include/linux/rpal.h
@@ -80,6 +80,9 @@
 /* No more than 15 services can be requested due to limitation of MPK. */
 #define MAX_REQUEST_SERVICE 15
 
+/* We allow at most 16 receiver thread in one process */
+#define RPAL_MAX_RECEIVER_NUM  16
+
 enum {
 	RPAL_REQUEST_MAP,
 	RPAL_REVERSE_MAP,
@@ -100,6 +103,7 @@ enum rpal_task_flag_bits {
 	RPAL_SENDER_BIT,
 	RPAL_RECEIVER_BIT,
 	RPAL_CPU_LOCKED_BIT,
+	RPAL_LAZY_SWITCHED_BIT,
 };
 
 enum rpal_receiver_state {
@@ -145,6 +149,11 @@ struct rpal_poll_data {
 	wait_queue_head_t rpal_waitqueue;
 };
 
+struct rpal_fsbase_tsk_map {
+	unsigned long fsbase;
+	struct task_struct *tsk;
+};
+
 /*
  * Each RPAL process (a.k.a RPAL service) should have a pointer to
  * struct rpal_service in all its tasks' task_struct.
@@ -202,6 +211,9 @@ struct rpal_service {
 	/* Notify service is released by others */
 	struct rpal_poll_data rpd;
 
+	/* fsbase / pid map */
+	struct rpal_fsbase_tsk_map fs_tsk_map[RPAL_MAX_RECEIVER_NUM];
+
 	/* delayed service put work */
 	struct delayed_work delayed_put_work;
 
@@ -283,12 +295,14 @@ struct rpal_receiver_data {
 	struct rpal_common_data rcd;
 	struct rpal_shared_page *rsp;
 	struct rpal_receiver_call_context *rcc;
+	struct task_struct *sender;
 };
 
 struct rpal_sender_data {
 	struct rpal_common_data rcd;
 	struct rpal_shared_page *rsp;
 	struct rpal_sender_call_context *scc;
+	struct task_struct *receiver;
 };
 
 enum rpal_command_type {
@@ -465,6 +479,7 @@ struct rpal_service *rpal_get_mapped_service_by_id(struct rpal_service *rs,
 int rpal_rebuild_sender_context_on_fault(struct pt_regs *regs,
 					 unsigned long addr, int error_code);
 struct mm_struct *rpal_pf_get_real_mm(unsigned long address, int *rebuild);
+struct task_struct *rpal_find_next_task(unsigned long fsbase);
 
 extern void rpal_pick_mmap_base(struct mm_struct *mm,
 	struct rlimit *rlim_stack);
-- 
2.20.1

