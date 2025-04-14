Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD26C265CC5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626215; cv=none; b=JTrfrfdCZPWEPjweDi3B5PhpqwusNPxea1M+SPVooZLy2rRRdMYMgaHmc891M5PtZblHwcImLEQP183HpwdPBB25NMydzwi7zvLznz7V2XHoRmqYnX/EAUTbyqNyxDCSIub4ugzRHziS5MRDuIwuUEWf3MutrRAQZQgvZj44tVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626215; c=relaxed/simple;
	bh=fWTo945CNRT8Yd36P5bMOXHrr0pvaXm7wcTQz//X2sM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KTo4STX0kBQ3gQZXeb03oipy0RA2nS7uWBao+0AFcyZMRRIy38IyfFip5BgcxlBXF+c+VJSQ1lT831UrBfpSwJ2ex88b+J//ZfUebcM0eVtwoR1YIYKAf68FdO5kOiYA9q2KHMG/ZTUM1wNfRc8ZjdmeNxZU0GJlFetJ5u2gUig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f41hFgGT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f41hFgGT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C313C4CEE5;
	Mon, 14 Apr 2025 10:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626214;
	bh=fWTo945CNRT8Yd36P5bMOXHrr0pvaXm7wcTQz//X2sM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f41hFgGTZgGbDj5AImmFmofCRqrhp16168J4xAanOLc50vlM+QrTylby+ci0BmAaL
	 FnZ6W65W663muCiKACrwCmJIexhIQdXgyQzqlmUp+KrQBarggidQd3SOasX788gsbA
	 lmC/8uM6Xv32p0L+Rlrq3S+LXxkFl5NCiIQpoFuLb9/HBvHD/0p87gMVXfUAwpZwFV
	 4L/cOPNY+1+C4RBOxga2YQG+Gt9jmPLtqAfObDqSJq67YSlZhcehwPm7sZ4h9ecJNt
	 jZ6cunn7dX4b36i63RbMG+evVVQFfXl/ajpE89dVbmAtECKlIlwQVy8wK25Jku1YrR
	 RBC9iKtKVRDHQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 11/17] treewide, timers: Rename destroy_timer_on_stack() => timer_destroy_on_stack()
Date: Mon, 14 Apr 2025 12:22:45 +0200
Message-ID: <20250414102301.332225-12-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414102301.332225-1-mingo@kernel.org>
References: <20250414102301.332225-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move this API to the canonical timer_*() namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 drivers/base/power/main.c                     | 2 +-
 drivers/char/random.c                         | 2 +-
 drivers/dma-buf/st-dma-fence.c                | 2 +-
 drivers/firewire/core-transaction.c           | 2 +-
 drivers/firmware/psci/psci_checker.c          | 2 +-
 drivers/gpu/drm/gud/gud_pipe.c                | 2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    | 2 +-
 drivers/gpu/drm/i915/selftests/lib_sw_fence.c | 2 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 2 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c       | 2 +-
 drivers/scsi/megaraid/megaraid_mbox.c         | 2 +-
 drivers/scsi/megaraid/megaraid_mm.c           | 2 +-
 drivers/staging/gpib/common/iblib.c           | 2 +-
 drivers/usb/atm/cxacru.c                      | 2 +-
 drivers/usb/misc/usbtest.c                    | 2 +-
 fs/bcachefs/clock.c                           | 2 +-
 include/linux/timer.h                         | 6 +++---
 kernel/kcsan/kcsan_test.c                     | 2 +-
 kernel/rcu/rcutorture.c                       | 2 +-
 kernel/time/sleep_timeout.c                   | 2 +-
 kernel/time/timer.c                           | 4 ++--
 kernel/workqueue.c                            | 2 +-
 22 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 5d840dce3a23..d0a1ea4818b9 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -560,7 +560,7 @@ static void dpm_watchdog_clear(struct dpm_watchdog *wd)
 	struct timer_list *timer = &wd->timer;
 
 	timer_delete_sync(timer);
-	destroy_timer_on_stack(timer);
+	timer_destroy_on_stack(timer);
 }
 #else
 #define DECLARE_DPM_WATCHDOG_ON_STACK(wd)
diff --git a/drivers/char/random.c b/drivers/char/random.c
index 225810db7d6f..4aa582072d68 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1353,7 +1353,7 @@ static void __cold try_to_generate_entropy(void)
 	mix_pool_bytes(&stack->entropy, sizeof(stack->entropy));
 
 	timer_delete_sync(&stack->timer);
-	destroy_timer_on_stack(&stack->timer);
+	timer_destroy_on_stack(&stack->timer);
 }
 
 
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index 0a4fe4c87c50..a8d3fafecf05 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -413,7 +413,7 @@ static int test_wait_timeout(void *arg)
 	err = 0;
 err_free:
 	timer_delete_sync(&wt.timer);
-	destroy_timer_on_stack(&wt.timer);
+	timer_destroy_on_stack(&wt.timer);
 	dma_fence_signal(wt.f);
 	dma_fence_put(wt.f);
 	return err;
diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index feddc7023c98..9c81ff15ba6f 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -431,7 +431,7 @@ int fw_run_transaction(struct fw_card *card, int tcode, int destination_id,
 	fw_send_request(card, &t, tcode, destination_id, generation, speed,
 			offset, payload, length, transaction_callback, &d);
 	wait_for_completion(&d.done);
-	destroy_timer_on_stack(&t.split_timeout_timer);
+	timer_destroy_on_stack(&t.split_timeout_timer);
 
 	return d.rcode;
 }
diff --git a/drivers/firmware/psci/psci_checker.c b/drivers/firmware/psci/psci_checker.c
index 66026728c73a..cbc8e9dd12b7 100644
--- a/drivers/firmware/psci/psci_checker.c
+++ b/drivers/firmware/psci/psci_checker.c
@@ -343,7 +343,7 @@ static int suspend_test_thread(void *arg)
 	 * later.
 	 */
 	timer_delete(&wakeup_timer);
-	destroy_timer_on_stack(&wakeup_timer);
+	timer_destroy_on_stack(&wakeup_timer);
 
 	if (atomic_dec_return_relaxed(&nb_active_threads) == 0)
 		complete(&suspend_threads_done);
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 31d2b04b0b91..601624e9c456 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -261,7 +261,7 @@ static int gud_usb_bulk(struct gud_device *gdrm, size_t len)
 	else if (ctx.sgr.bytes != len)
 		ret = -EIO;
 
-	destroy_timer_on_stack(&ctx.timer);
+	timer_destroy_on_stack(&ctx.timer);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index 8b1261bfdd4f..598566df7e19 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -661,7 +661,7 @@ static int live_emit_pte_full_ring(void *arg)
 out_rq:
 	i915_request_add(rq); /* GEM_BUG_ON(rq->reserved_space > ring->space)? */
 	timer_delete_sync(&st.timer);
-	destroy_timer_on_stack(&st.timer);
+	timer_destroy_on_stack(&st.timer);
 out_unpin:
 	intel_context_unpin(ce);
 out_put:
diff --git a/drivers/gpu/drm/i915/selftests/lib_sw_fence.c b/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
index 7b32188f6572..710cab37274f 100644
--- a/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
+++ b/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
@@ -77,7 +77,7 @@ void timed_fence_fini(struct timed_fence *tf)
 	if (timer_delete_sync(&tf->timer))
 		i915_sw_fence_commit(&tf->fence);
 
-	destroy_timer_on_stack(&tf->timer);
+	timer_destroy_on_stack(&tf->timer);
 	i915_sw_fence_fini(&tf->fence);
 }
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index 60f8c3f52619..1a1815e52e4a 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -201,7 +201,7 @@ static int threaded_ttm_bo_reserve(void *arg)
 	err = ttm_bo_reserve(bo, interruptible, no_wait, &ctx);
 
 	timer_delete_sync(&s_timer.timer);
-	destroy_timer_on_stack(&s_timer.timer);
+	timer_destroy_on_stack(&s_timer.timer);
 
 	ww_acquire_fini(&ctx);
 
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index a8ccb5898a80..d23e503d0dda 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -3806,7 +3806,7 @@ status);
 	if ((status < 0) && (!probe_fl)) {
 		pvr2_hdw_render_useless(hdw);
 	}
-	destroy_timer_on_stack(&timer.timer);
+	timer_destroy_on_stack(&timer.timer);
 
 	return status;
 }
diff --git a/drivers/scsi/megaraid/megaraid_mbox.c b/drivers/scsi/megaraid/megaraid_mbox.c
index 7740daa94313..26245fd22c9f 100644
--- a/drivers/scsi/megaraid/megaraid_mbox.c
+++ b/drivers/scsi/megaraid/megaraid_mbox.c
@@ -3952,7 +3952,7 @@ megaraid_sysfs_get_ldmap(adapter_t *adapter)
 
 
 	timer_delete_sync(&timeout.timer);
-	destroy_timer_on_stack(&timeout.timer);
+	timer_destroy_on_stack(&timeout.timer);
 
 	mutex_unlock(&raid_dev->sysfs_mtx);
 
diff --git a/drivers/scsi/megaraid/megaraid_mm.c b/drivers/scsi/megaraid/megaraid_mm.c
index 38dc22f8c8cd..ab994053b2a6 100644
--- a/drivers/scsi/megaraid/megaraid_mm.c
+++ b/drivers/scsi/megaraid/megaraid_mm.c
@@ -704,7 +704,7 @@ lld_ioctl(mraid_mmadp_t *adp, uioc_t *kioc)
 	wait_event(wait_q, (kioc->status != -ENODATA));
 	if (timeout.timer.function) {
 		timer_delete_sync(&timeout.timer);
-		destroy_timer_on_stack(&timeout.timer);
+		timer_destroy_on_stack(&timeout.timer);
 	}
 
 	/*
diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index 5d9ef387edbb..a82b1fef5352 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -611,7 +611,7 @@ static void start_wait_timer(struct wait_info *winfo)
 static void remove_wait_timer(struct wait_info *winfo)
 {
 	timer_delete_sync(&winfo->timer);
-	destroy_timer_on_stack(&winfo->timer);
+	timer_destroy_on_stack(&winfo->timer);
 }
 
 /*
diff --git a/drivers/usb/atm/cxacru.c b/drivers/usb/atm/cxacru.c
index 2006a580061d..520e55324d13 100644
--- a/drivers/usb/atm/cxacru.c
+++ b/drivers/usb/atm/cxacru.c
@@ -598,7 +598,7 @@ static int cxacru_start_wait_urb(struct urb *urb, struct completion *done,
 	timer_mod(&timer.timer, jiffies + msecs_to_jiffies(CMD_TIMEOUT));
 	wait_for_completion(done);
 	timer_delete_sync(&timer.timer);
-	destroy_timer_on_stack(&timer.timer);
+	timer_destroy_on_stack(&timer.timer);
 
 	if (actual_length)
 		*actual_length = urb->actual_length;
diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index 2cf7bad70f39..d982ff6e37b2 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -630,7 +630,7 @@ static int perform_sglist(
 			retval = -ETIMEDOUT;
 		else
 			retval = req->status;
-		destroy_timer_on_stack(&timeout.timer);
+		timer_destroy_on_stack(&timeout.timer);
 
 		/* FIXME check resulting data pattern */
 
diff --git a/fs/bcachefs/clock.c b/fs/bcachefs/clock.c
index 1db45b9714ca..aa8620d337a2 100644
--- a/fs/bcachefs/clock.c
+++ b/fs/bcachefs/clock.c
@@ -122,7 +122,7 @@ void bch2_kthread_io_clock_wait(struct io_clock *clock,
 
 	__set_current_state(TASK_RUNNING);
 	timer_delete_sync(&wait.cpu_timer);
-	destroy_timer_on_stack(&wait.cpu_timer);
+	timer_destroy_on_stack(&wait.cpu_timer);
 	bch2_io_timer_del(clock, &wait.io_timer);
 }
 
diff --git a/include/linux/timer.h b/include/linux/timer.h
index b3d2ab87c248..ae00a9f618ad 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -115,7 +115,7 @@ static inline void init_timer_on_stack_key(struct timer_list *timer,
  *
  * Regular timer initialization should use either DEFINE_TIMER() above,
  * or timer_setup(). For timers on the stack, timer_setup_on_stack() must
- * be used and must be balanced with a call to destroy_timer_on_stack().
+ * be used and must be balanced with a call to timer_destroy_on_stack().
  */
 #define timer_setup(timer, callback, flags)			\
 	__init_timer((timer), (callback), (flags))
@@ -124,9 +124,9 @@ static inline void init_timer_on_stack_key(struct timer_list *timer,
 	__init_timer_on_stack((timer), (callback), (flags))
 
 #ifdef CONFIG_DEBUG_OBJECTS_TIMERS
-extern void destroy_timer_on_stack(struct timer_list *timer);
+extern void timer_destroy_on_stack(struct timer_list *timer);
 #else
-static inline void destroy_timer_on_stack(struct timer_list *timer) { }
+static inline void timer_destroy_on_stack(struct timer_list *timer) { }
 #endif
 
 #define timer_container_of(var, callback_timer, timer_fieldname) \
diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
index ef4ea881ba96..9ca22cea56db 100644
--- a/kernel/kcsan/kcsan_test.c
+++ b/kernel/kcsan/kcsan_test.c
@@ -1501,7 +1501,7 @@ static int access_thread(void *arg)
 		}
 	} while (!torture_must_stop());
 	timer_delete_sync(&timer);
-	destroy_timer_on_stack(&timer);
+	timer_destroy_on_stack(&timer);
 
 	torture_kthread_stopping("access_thread");
 	return 0;
diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index d630df4372ec..61c27f9c3155 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -2325,7 +2325,7 @@ rcu_torture_reader(void *arg)
 	} while (!torture_must_stop());
 	if (irqreader && cur_ops->irq_capable) {
 		timer_delete_sync(&t);
-		destroy_timer_on_stack(&t);
+		timer_destroy_on_stack(&t);
 	}
 	tick_dep_clear_task(current, TICK_DEP_BIT_RCU);
 	torture_kthread_stopping("rcu_torture_reader");
diff --git a/kernel/time/sleep_timeout.c b/kernel/time/sleep_timeout.c
index 0745d2148150..2e20f9c549ee 100644
--- a/kernel/time/sleep_timeout.c
+++ b/kernel/time/sleep_timeout.c
@@ -100,7 +100,7 @@ signed long __sched schedule_timeout(signed long timeout)
 	timer_delete_sync(&timer.timer);
 
 	/* Remove the timer from the object tracker */
-	destroy_timer_on_stack(&timer.timer);
+	timer_destroy_on_stack(&timer.timer);
 
 	timeout = expire - jiffies;
 
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index c5f5d9fc854f..08780e06c7cf 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -860,11 +860,11 @@ void init_timer_on_stack_key(struct timer_list *timer,
 }
 EXPORT_SYMBOL_GPL(init_timer_on_stack_key);
 
-void destroy_timer_on_stack(struct timer_list *timer)
+void timer_destroy_on_stack(struct timer_list *timer)
 {
 	debug_object_free(timer, &timer_debug_descr);
 }
-EXPORT_SYMBOL_GPL(destroy_timer_on_stack);
+EXPORT_SYMBOL_GPL(timer_destroy_on_stack);
 
 #else
 static inline void debug_timer_init(struct timer_list *timer) { }
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index e4860d6ea594..a6c83789c721 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -686,7 +686,7 @@ EXPORT_SYMBOL_GPL(destroy_work_on_stack);
 
 void destroy_delayed_work_on_stack(struct delayed_work *work)
 {
-	destroy_timer_on_stack(&work->timer);
+	timer_destroy_on_stack(&work->timer);
 	debug_object_free(&work->work, &work_debug_descr);
 }
 EXPORT_SYMBOL_GPL(destroy_delayed_work_on_stack);
-- 
2.45.2

