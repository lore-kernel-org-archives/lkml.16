Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4633B2356CA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794361; cv=none; b=mr6o88cdxOvn9AQZNWkkC2Od1nbd0L+SU61oq/XdPbMusQnokJuTp6XeaLl51AfOeNVg6IIbszG97mYdan9Sp/FE/5TKcdAX8ByJ4ADdCW0HD2xllkI2FGzTRv0L/09G4WnnnqSDE3OsBVrzU0sCz8TRKHukYGbeVfoxLtN/mAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794361; c=relaxed/simple;
	bh=2rwbKhdewJbG5Nuwv4KIYtZIBK1aQZPTMqq/Ohru5CU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AbOEbWRqANPoiJ69l8HbpAY4hkt7DKvinadNwFadZ7ju3pi0prI/uLSgr0XepzCviLJ/sWo9lO0ly9CC8Mheyefp1Z+XKlEk+NlHyFoBx1rjOuXyXZZxUCKjVDZoWd3iV/vCWHSMTTxohWa48qLzCVWds39dl0KccvxqAXruwm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbbv9QO3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbbv9QO3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A09C4CEED;
	Wed, 16 Apr 2025 09:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744794360;
	bh=2rwbKhdewJbG5Nuwv4KIYtZIBK1aQZPTMqq/Ohru5CU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bbbv9QO3hzkK7HcsW8iwhxlYLnLvFDe1j8B6SMcOpdlZPTIe+UzKTWMRGkf4XuccU
	 jgBYzOXPmylrPhhip0Kjv8WzbyEvxEHbrIac60oTPv0i96phsJkXUwnrOaoH+U4/h8
	 hSWnkEZ7wmyNffEWNkpoAb/8+AElga1W7hEPw1Ea0FBDFEKUWUWHqa/7J7U29WK//9
	 RqpomnrKU1E5wAPC29xzdYLLlORc8CApSg5UySiVrj1tYtBdM/WFhgFLt8rNBqyWzw
	 XTR4dPlTTy3Z1WDWII/oBhpyFRJoB37/KOQ7l9P6E0vLuOsi3IRpWhfpXp0b4iRC+L
	 wuJrWFHmyGofQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 04/10] treewide, timers: Rename destroy_timer_on_stack() => timer_destroy_on_stack()
Date: Wed, 16 Apr 2025 11:05:38 +0200
Message-ID: <20250416090544.3311613-5-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250416090544.3311613-1-mingo@kernel.org>
References: <20250416090544.3311613-1-mingo@kernel.org>
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
 drivers/base/power/main.c                        | 2 +-
 drivers/char/random.c                            | 2 +-
 drivers/dma-buf/st-dma-fence.c                   | 2 +-
 drivers/firewire/core-transaction.c              | 2 +-
 drivers/firmware/psci/psci_checker.c             | 2 +-
 drivers/gpu/drm/gud/gud_pipe.c                   | 2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c       | 2 +-
 drivers/gpu/drm/i915/selftests/lib_sw_fence.c    | 2 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c          | 2 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c          | 2 +-
 drivers/misc/sgi-xp/xpc_partition.c              | 4 ++--
 drivers/scsi/megaraid/megaraid_mbox.c            | 2 +-
 drivers/scsi/megaraid/megaraid_mm.c              | 2 +-
 drivers/staging/gpib/common/iblib.c              | 2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 8 ++++----
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 drivers/usb/atm/cxacru.c                         | 2 +-
 drivers/usb/misc/usbtest.c                       | 2 +-
 fs/bcachefs/clock.c                              | 2 +-
 include/linux/timer.h                            | 6 +++---
 kernel/kcsan/kcsan_test.c                        | 2 +-
 kernel/rcu/rcutorture.c                          | 2 +-
 kernel/time/sleep_timeout.c                      | 2 +-
 kernel/time/timer.c                              | 4 ++--
 kernel/workqueue.c                               | 2 +-
 net/ipv4/inet_connection_sock.c                  | 6 +++---
 26 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 318d4a4efbea..075a0a6948c4 100644
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
index 4ea4dccc7c46..e53033133bb3 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1353,7 +1353,7 @@ static void __cold try_to_generate_entropy(void)
 	mix_pool_bytes(&stack->entropy, sizeof(stack->entropy));
 
 	timer_delete_sync(&stack->timer);
-	destroy_timer_on_stack(&stack->timer);
+	timer_destroy_on_stack(&stack->timer);
 }
 
 
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index 50b3d28eff47..27a36045410b 100644
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
index ea2ad71c1a5d..2bd5deb9054e 100644
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
index b662b7e28b80..df02a4ec3398 100644
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
index 6982cb13de12..adadd526641d 100644
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
index 0f6589260e33..54bc447efce0 100644
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
index 47703716c9f2..d79e4defb71d 100644
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
index 3042d0f7a117..2dac90c3ebaf 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -201,7 +201,7 @@ static int threaded_ttm_bo_reserve(void *arg)
 	err = ttm_bo_reserve(bo, interruptible, no_wait, &ctx);
 
 	timer_delete_sync(&s_timer.timer);
-	destroy_timer_on_stack(&s_timer.timer);
+	timer_destroy_on_stack(&s_timer.timer);
 
 	ww_acquire_fini(&ctx);
 
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 9ae5eee5ed62..e94be856a994 100644
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
diff --git a/drivers/misc/sgi-xp/xpc_partition.c b/drivers/misc/sgi-xp/xpc_partition.c
index f983885d57e9..d0467010558c 100644
--- a/drivers/misc/sgi-xp/xpc_partition.c
+++ b/drivers/misc/sgi-xp/xpc_partition.c
@@ -263,7 +263,7 @@ xpc_get_remote_rp(int nasid, unsigned long *discovered_nasids,
  * to us, we really only need to wait for the other side to disengage from us.
  */
 static int __xpc_partition_disengaged(struct xpc_partition *part,
-				      bool timer_container_of)
+				      bool from_timer)
 {
 	short partid = XPC_PARTID(part);
 	int disengaged;
@@ -290,7 +290,7 @@ static int __xpc_partition_disengaged(struct xpc_partition *part,
 		part->disengage_timeout = 0;
 
 		/* Cancel the timer function if not called from it */
-		if (!timer_container_of)
+		if (!from_timer)
 			timer_delete_sync(&part->disengage_timer);
 
 		DBUG_ON(part->act_state != XPC_P_AS_DEACTIVATING &&
diff --git a/drivers/scsi/megaraid/megaraid_mbox.c b/drivers/scsi/megaraid/megaraid_mbox.c
index ce72cb04a78a..b610cad83321 100644
--- a/drivers/scsi/megaraid/megaraid_mbox.c
+++ b/drivers/scsi/megaraid/megaraid_mbox.c
@@ -3952,7 +3952,7 @@ megaraid_sysfs_get_ldmap(adapter_t *adapter)
 
 
 	timer_delete_sync(&timeout.timer);
-	destroy_timer_on_stack(&timeout.timer);
+	timer_destroy_on_stack(&timeout.timer);
 
 	mutex_unlock(&raid_dev->sysfs_mtx);
 
diff --git a/drivers/scsi/megaraid/megaraid_mm.c b/drivers/scsi/megaraid/megaraid_mm.c
index d3133be36879..87184e2538b0 100644
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
index f8c762012d54..c16e63c70ead 100644
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
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index eedcf9d7357c..1c9e8b01d9d8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1130,7 +1130,7 @@ static void collect_traffic_statistics(struct adapter *padapter)
 	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8/2/1024/1024);
 }
 
-u8 traffic_status_watchdog(struct adapter *padapter, u8 timer_container_of)
+u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 {
 	u8 bEnterPS = false;
 	u16 BusyThresholdHigh = 25;
@@ -1198,10 +1198,10 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 timer_container_of)
 
 		/*  LeisurePS only work in infra mode. */
 		if (bEnterPS) {
-			if (!timer_container_of)
+			if (!from_timer)
 				LPS_Enter(padapter, "TRAFFIC_IDLE");
 		} else {
-			if (!timer_container_of)
+			if (!from_timer)
 				LPS_Leave(padapter, "TRAFFIC_BUSY");
 			else
 				rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_TRAFFIC_BUSY, 1);
@@ -1213,7 +1213,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 timer_container_of)
 		if (check_fwstate(&dvobj->padapters->mlmepriv, WIFI_ASOC_STATE))
 			n_assoc_iface++;
 
-		if (!timer_container_of && n_assoc_iface == 0)
+		if (!from_timer && n_assoc_iface == 0)
 			LPS_Leave(padapter, "NON_LINKED");
 	}
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 0e90cfd472a1..2080408743ef 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -617,7 +617,7 @@ extern void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr
 extern void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
 extern void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext);
 extern void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
-extern u8 traffic_status_watchdog(struct adapter *padapter, u8 timer_container_of);
+extern u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer);
 
 int rtw_chk_start_clnt_join(struct adapter *padapter, u8 *ch, u8 *bw, u8 *offset);
 
diff --git a/drivers/usb/atm/cxacru.c b/drivers/usb/atm/cxacru.c
index c23023465dfc..a12ab90b3db7 100644
--- a/drivers/usb/atm/cxacru.c
+++ b/drivers/usb/atm/cxacru.c
@@ -598,7 +598,7 @@ static int cxacru_start_wait_urb(struct urb *urb, struct completion *done,
 	mod_timer(&timer.timer, jiffies + msecs_to_jiffies(CMD_TIMEOUT));
 	wait_for_completion(done);
 	timer_delete_sync(&timer.timer);
-	destroy_timer_on_stack(&timer.timer);
+	timer_destroy_on_stack(&timer.timer);
 
 	if (actual_length)
 		*actual_length = urb->actual_length;
diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index 63dba8e344f7..5c92c8d8e283 100644
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
index d6dd12d74d4f..f57f9f4774e6 100644
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
index 6e249ef81e59..30552f4a0bcc 100644
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
index 6ce73cceaf53..c2871180edcc 100644
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
index 4fa7772be183..f3f1bc86fbea 100644
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
index f03cfaa990cc..3c90574bd904 100644
--- a/kernel/time/sleep_timeout.c
+++ b/kernel/time/sleep_timeout.c
@@ -100,7 +100,7 @@ signed long __sched schedule_timeout(signed long timeout)
 	timer_delete_sync(&timer.timer);
 
 	/* Remove the timer from the object tracker */
-	destroy_timer_on_stack(&timer.timer);
+	timer_destroy_on_stack(&timer.timer);
 
 	timeout = expire - jiffies;
 
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 827fa262093f..f4758fef8bf9 100644
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
index 10afa785bf19..74605088b3ba 100644
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
diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index c437a1c2c6ac..dd5cf8914a28 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -1039,11 +1039,11 @@ static bool reqsk_queue_unlink(struct request_sock *req)
 
 static bool __inet_csk_reqsk_queue_drop(struct sock *sk,
 					struct request_sock *req,
-					bool timer_container_of)
+					bool from_timer)
 {
 	bool unlinked = reqsk_queue_unlink(req);
 
-	if (!timer_container_of && timer_delete_sync(&req->rsk_timer))
+	if (!from_timer && timer_delete_sync(&req->rsk_timer))
 		reqsk_put(req);
 
 	if (unlinked) {
@@ -1069,7 +1069,7 @@ EXPORT_SYMBOL(inet_csk_reqsk_queue_drop_and_put);
 
 static void reqsk_timer_handler(struct timer_list *t)
 {
-	struct request_sock *req = timer_container_of(req, t, rsk_timer);
+	struct request_sock *req = from_timer(req, t, rsk_timer);
 	struct request_sock *nreq = NULL, *oreq = req;
 	struct sock *sk_listener = req->rsk_listener;
 	struct inet_connection_sock *icsk;
-- 
2.45.2

