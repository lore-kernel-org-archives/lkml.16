Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F1619DF60
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 20:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748206431; cv=none; b=AqRW91ynfGnR1MhFpIlN9TzjtQgJNfmivfLsGsyWwAdDbe8WI004cgpSVrbdSD93b9RLqQ6m+KPz0l5FM3T5Ld8rx4SpXmGcNYBbrKOxg71ftRMhvNKeryIuKRuiuz5i4hB/Ymp6GH0uGj+NUgDQ7t+EWrNtSu5GOH4s3jlX9zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748206431; c=relaxed/simple;
	bh=P7ZRT24MRuaSK3/2ZPZavyWPmvFri7xLEbrYymOwdeM=;
	h=From:To:Cc:Subject:References:Message-ID:Content-Type:
	 MIME-Version:Date; b=rKk6fAPzhSWimbpk0GJYRzTTtwiWkDEi9yrsPvpaU9IU9rDlLgKFNUPj2MaeAY9vT/xBLXPPc0NpxrdsqX4SPI/SFgNzV3dHwiRs//bctOoF6ymwj2T3iinJotooYkGSwWpcWG8V6UM9MuKkfjcyfFF6NB+RSKbp55630/w2/Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u34oa00a; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AkIoVDD1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u34oa00a";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AkIoVDD1"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748206426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=X3Jw6Eb9hzZRS043e4Yw8ho93CS1TR6u7b88ZR6RbwM=;
	b=u34oa00apiEjl85hOwUZRa9x7K9cPvxCKxrfXAXkPQFAKmh7OdobFLcuDt6GVtPsXiyU9G
	pAXAVFwOSPxtChwLC+Bm9yblXwONIdmtqWyBMPINWYCG7i94tMPcm1B5cndqS3Ki2sFotN
	mTHPMTr/XlSA29GBmBw5P6qCPdtw+8b/xrTILHEdzsIenMnFPJb77UhDDWfY8C7zcSH/Zr
	Y6E8/g2TSH1WASh0mc/qKLM5QzoY3QKaG3E6D9elbysbbZEuz54eBrew2YwWApPQyCfFtl
	7+92KnZAHntom8xN4XGrBYcmlDyprgvx+xcNDOzZ8mDyB4EFEN/ohSpJG9BjWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748206426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=X3Jw6Eb9hzZRS043e4Yw8ho93CS1TR6u7b88ZR6RbwM=;
	b=AkIoVDD1dYWLnc4OyrH8UVBW+d4DjVD5gg+Go+kwFP4eHbyRF8RHveQ4Vq/N467kKVR7hd
	n+YaWdsp+H9j0SAg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] timers/cleanups for v6.16-rc1
References: <174820637262.238682.1985899398053030312.tglx@xen13>
Message-ID: <174820638145.238682.8805997132124221883.tglx@xen13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 May 2025 22:53:45 +0200 (CEST)

Linus,

please pull the latest timers/cleanups branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-cleanups-=
2025-05-25

up to:  aad823aa3a7d: treewide, timers: Rename destroy_timer_on_stack() as ti=
mer_destroy_on_stack()


Another set of timer API cleanups:

 - Convert init_timer*(), try_to_del_timer_sync() and
   destroy_timer_on_stack() over to the canonical timer_*() namespace
   convention.

There are is another large converstion pending, which has not been included
because it would have caused a gazillion of merge conflicts in next. The
conversion scripts will be run towards the end of the merge window and a
pull request sent once all conflict dependencies have been merged.


Thanks,

	tglx

------------------>
Ingo Molnar (8):
      timers: Rename init_timer_key() as timer_init_key()
      timers: Rename init_timer_on_stack_key() as timer_init_key_on_stack()
      timers: Rename __init_timer() as __timer_init()
      timers: Rename __init_timer_on_stack() as __timer_init_on_stack()
      timers: Rename NEXT_TIMER_MAX_DELTA as TIMER_NEXT_MAX_DELTA
      timers: Rename init_timers() as timers_init()
      treewide, timers: Rename try_to_del_timer_sync() as timer_delete_sync_t=
ry()
      treewide, timers: Rename destroy_timer_on_stack() as timer_destroy_on_s=
tack()


 arch/powerpc/kvm/booke.c                      |  8 +++---
 arch/x86/kernel/apic/vector.c                 |  2 +-
 drivers/base/power/main.c                     |  2 +-
 drivers/char/random.c                         |  6 ++--
 drivers/dma-buf/st-dma-fence.c                |  2 +-
 drivers/firewire/core-transaction.c           |  2 +-
 drivers/firmware/psci/psci_checker.c          |  2 +-
 drivers/gpu/drm/gud/gud_pipe.c                |  2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    |  2 +-
 drivers/gpu/drm/i915/selftests/lib_sw_fence.c |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |  2 +-
 drivers/irqchip/irq-riscv-imsic-state.c       |  2 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c       |  2 +-
 drivers/scsi/megaraid/megaraid_mbox.c         |  2 +-
 drivers/scsi/megaraid/megaraid_mm.c           |  2 +-
 drivers/staging/gpib/common/iblib.c           |  2 +-
 drivers/usb/atm/cxacru.c                      |  2 +-
 drivers/usb/misc/usbtest.c                    |  2 +-
 fs/bcachefs/clock.c                           |  2 +-
 include/linux/timer.h                         | 40 +++++++++++++------------=
--
 include/linux/workqueue.h                     |  4 +--
 init/main.c                                   |  2 +-
 kernel/kcsan/kcsan_test.c                     |  2 +-
 kernel/rcu/rcutorture.c                       |  2 +-
 kernel/time/sleep_timeout.c                   |  2 +-
 kernel/time/timer.c                           | 36 ++++++++++++------------
 kernel/workqueue.c                            |  2 +-
 net/bridge/br_multicast.c                     | 16 +++++------
 sound/pci/ctxfi/cttimer.c                     |  2 +-
 29 files changed, 78 insertions(+), 78 deletions(-)

diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 6a4805968966..791d1942a058 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -572,7 +572,7 @@ static int kvmppc_booke_irqprio_deliver(struct kvm_vcpu *=
vcpu,
=20
 /*
  * Return the number of jiffies until the next timeout.  If the timeout is
- * longer than the NEXT_TIMER_MAX_DELTA, then return NEXT_TIMER_MAX_DELTA
+ * longer than the TIMER_NEXT_MAX_DELTA, then return TIMER_NEXT_MAX_DELTA
  * because the larger value can break the timer APIs.
  */
 static unsigned long watchdog_next_timeout(struct kvm_vcpu *vcpu)
@@ -598,7 +598,7 @@ static unsigned long watchdog_next_timeout(struct kvm_vcp=
u *vcpu)
 	if (do_div(nr_jiffies, tb_ticks_per_jiffy))
 		nr_jiffies++;
=20
-	return min_t(unsigned long long, nr_jiffies, NEXT_TIMER_MAX_DELTA);
+	return min_t(unsigned long long, nr_jiffies, TIMER_NEXT_MAX_DELTA);
 }
=20
 static void arm_next_watchdog(struct kvm_vcpu *vcpu)
@@ -616,10 +616,10 @@ static void arm_next_watchdog(struct kvm_vcpu *vcpu)
 	spin_lock_irqsave(&vcpu->arch.wdt_lock, flags);
 	nr_jiffies =3D watchdog_next_timeout(vcpu);
 	/*
-	 * If the number of jiffies of watchdog timer >=3D NEXT_TIMER_MAX_DELTA
+	 * If the number of jiffies of watchdog timer >=3D TIMER_NEXT_MAX_DELTA
 	 * then do not run the watchdog timer as this can break timer APIs.
 	 */
-	if (nr_jiffies < NEXT_TIMER_MAX_DELTA)
+	if (nr_jiffies < TIMER_NEXT_MAX_DELTA)
 		mod_timer(&vcpu->arch.wdt_timer, jiffies + nr_jiffies);
 	else
 		timer_delete(&vcpu->arch.wdt_timer);
diff --git a/arch/x86/kernel/apic/vector.c b/arch/x86/kernel/apic/vector.c
index fee42a73d64a..93069b13d3af 100644
--- a/arch/x86/kernel/apic/vector.c
+++ b/arch/x86/kernel/apic/vector.c
@@ -864,7 +864,7 @@ void lapic_offline(void)
 	__vector_cleanup(cl, false);
=20
 	irq_matrix_offline(vector_matrix);
-	WARN_ON_ONCE(try_to_del_timer_sync(&cl->timer) < 0);
+	WARN_ON_ONCE(timer_delete_sync_try(&cl->timer) < 0);
 	WARN_ON_ONCE(!hlist_empty(&cl->head));
=20
 	unlock_vector_lock();
diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index c8b0a9e29ed8..95f51a7174c7 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -560,7 +560,7 @@ static void dpm_watchdog_clear(struct dpm_watchdog *wd)
 	struct timer_list *timer =3D &wd->timer;
=20
 	timer_delete_sync(timer);
-	destroy_timer_on_stack(timer);
+	timer_destroy_on_stack(timer);
 }
 #else
 #define DECLARE_DPM_WATCHDOG_ON_STACK(wd)
diff --git a/drivers/char/random.c b/drivers/char/random.c
index 38f2fab29c56..e53033133bb3 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1311,9 +1311,9 @@ static void __cold try_to_generate_entropy(void)
 	while (!crng_ready() && !signal_pending(current)) {
 		/*
 		 * Check !timer_pending() and then ensure that any previous callback has f=
inished
-		 * executing by checking try_to_del_timer_sync(), before queueing the next=
 one.
+		 * executing by checking timer_delete_sync_try(), before queueing the next=
 one.
 		 */
-		if (!timer_pending(&stack->timer) && try_to_del_timer_sync(&stack->timer) =
>=3D 0) {
+		if (!timer_pending(&stack->timer) && timer_delete_sync_try(&stack->timer) =
>=3D 0) {
 			struct cpumask timer_cpus;
 			unsigned int num_cpus;
=20
@@ -1353,7 +1353,7 @@ static void __cold try_to_generate_entropy(void)
 	mix_pool_bytes(&stack->entropy, sizeof(stack->entropy));
=20
 	timer_delete_sync(&stack->timer);
-	destroy_timer_on_stack(&stack->timer);
+	timer_destroy_on_stack(&stack->timer);
 }
=20
=20
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index 9f80a45498f0..261b38816226 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -413,7 +413,7 @@ static int test_wait_timeout(void *arg)
 	err =3D 0;
 err_free:
 	timer_delete_sync(&wt.timer);
-	destroy_timer_on_stack(&wt.timer);
+	timer_destroy_on_stack(&wt.timer);
 	dma_fence_signal(wt.f);
 	dma_fence_put(wt.f);
 	return err;
diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-tran=
saction.c
index b0f9ef6ac6df..18cacb9edbbc 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -431,7 +431,7 @@ int fw_run_transaction(struct fw_card *card, int tcode, i=
nt destination_id,
 	fw_send_request(card, &t, tcode, destination_id, generation, speed,
 			offset, payload, length, transaction_callback, &d);
 	wait_for_completion(&d.done);
-	destroy_timer_on_stack(&t.split_timeout_timer);
+	timer_destroy_on_stack(&t.split_timeout_timer);
=20
 	return d.rcode;
 }
diff --git a/drivers/firmware/psci/psci_checker.c b/drivers/firmware/psci/psc=
i_checker.c
index b662b7e28b80..df02a4ec3398 100644
--- a/drivers/firmware/psci/psci_checker.c
+++ b/drivers/firmware/psci/psci_checker.c
@@ -343,7 +343,7 @@ static int suspend_test_thread(void *arg)
 	 * later.
 	 */
 	timer_delete(&wakeup_timer);
-	destroy_timer_on_stack(&wakeup_timer);
+	timer_destroy_on_stack(&wakeup_timer);
=20
 	if (atomic_dec_return_relaxed(&nb_active_threads) =3D=3D 0)
 		complete(&suspend_threads_done);
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 77cfcf37ddd2..feff73cc0005 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -261,7 +261,7 @@ static int gud_usb_bulk(struct gud_device *gdrm, size_t l=
en)
 	else if (ctx.sgr.bytes !=3D len)
 		ret =3D -EIO;
=20
-	destroy_timer_on_stack(&ctx.timer);
+	timer_destroy_on_stack(&ctx.timer);
=20
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i91=
5/gt/selftest_migrate.c
index 401bee030dbc..32c762eb79ed 100644
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
diff --git a/drivers/gpu/drm/i915/selftests/lib_sw_fence.c b/drivers/gpu/drm/=
i915/selftests/lib_sw_fence.c
index d5ecc68155da..522ad49406ce 100644
--- a/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
+++ b/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
@@ -77,7 +77,7 @@ void timed_fence_fini(struct timed_fence *tf)
 	if (timer_delete_sync(&tf->timer))
 		i915_sw_fence_commit(&tf->fence);
=20
-	destroy_timer_on_stack(&tf->timer);
+	timer_destroy_on_stack(&tf->timer);
 	i915_sw_fence_fini(&tf->fence);
 }
=20
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/te=
sts/ttm_bo_test.c
index f8f20d2f6174..f24866823d95 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -201,7 +201,7 @@ static int threaded_ttm_bo_reserve(void *arg)
 	err =3D ttm_bo_reserve(bo, interruptible, no_wait, &ctx);
=20
 	timer_delete_sync(&s_timer.timer);
-	destroy_timer_on_stack(&s_timer.timer);
+	timer_destroy_on_stack(&s_timer.timer);
=20
 	ww_acquire_fini(&ctx);
=20
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-ri=
scv-imsic-state.c
index bdf5cd2037f2..c39e573825d4 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -564,7 +564,7 @@ void imsic_state_offline(void)
 	struct imsic_local_priv *lpriv =3D this_cpu_ptr(imsic->lpriv);
=20
 	raw_spin_lock_irqsave(&lpriv->lock, flags);
-	WARN_ON_ONCE(try_to_del_timer_sync(&lpriv->timer) < 0);
+	WARN_ON_ONCE(timer_delete_sync_try(&lpriv->timer) < 0);
 	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
 #endif
 }
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvru=
sb2/pvrusb2-hdw.c
index 9a583eeaa329..e23b0de1e0aa 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -3806,7 +3806,7 @@ status);
 	if ((status < 0) && (!probe_fl)) {
 		pvr2_hdw_render_useless(hdw);
 	}
-	destroy_timer_on_stack(&timer.timer);
+	timer_destroy_on_stack(&timer.timer);
=20
 	return status;
 }
diff --git a/drivers/scsi/megaraid/megaraid_mbox.c b/drivers/scsi/megaraid/me=
garaid_mbox.c
index d533a8aa72cc..b75f46c30759 100644
--- a/drivers/scsi/megaraid/megaraid_mbox.c
+++ b/drivers/scsi/megaraid/megaraid_mbox.c
@@ -3952,7 +3952,7 @@ megaraid_sysfs_get_ldmap(adapter_t *adapter)
=20
=20
 	timer_delete_sync(&timeout.timer);
-	destroy_timer_on_stack(&timeout.timer);
+	timer_destroy_on_stack(&timeout.timer);
=20
 	mutex_unlock(&raid_dev->sysfs_mtx);
=20
diff --git a/drivers/scsi/megaraid/megaraid_mm.c b/drivers/scsi/megaraid/mega=
raid_mm.c
index 1f2cd15e3361..fd7fa7640a5e 100644
--- a/drivers/scsi/megaraid/megaraid_mm.c
+++ b/drivers/scsi/megaraid/megaraid_mm.c
@@ -704,7 +704,7 @@ lld_ioctl(mraid_mmadp_t *adp, uioc_t *kioc)
 	wait_event(wait_q, (kioc->status !=3D -ENODATA));
 	if (timeout.timer.function) {
 		timer_delete_sync(&timeout.timer);
-		destroy_timer_on_stack(&timeout.timer);
+		timer_destroy_on_stack(&timeout.timer);
 	}
=20
 	/*
diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/commo=
n/iblib.c
index b297261818f2..432540e1bc9a 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -611,7 +611,7 @@ static void start_wait_timer(struct wait_info *winfo)
 static void remove_wait_timer(struct wait_info *winfo)
 {
 	timer_delete_sync(&winfo->timer);
-	destroy_timer_on_stack(&winfo->timer);
+	timer_destroy_on_stack(&winfo->timer);
 }
=20
 /*
diff --git a/drivers/usb/atm/cxacru.c b/drivers/usb/atm/cxacru.c
index c6b9ad12e8fe..b7f940486414 100644
--- a/drivers/usb/atm/cxacru.c
+++ b/drivers/usb/atm/cxacru.c
@@ -598,7 +598,7 @@ static int cxacru_start_wait_urb(struct urb *urb, struct =
completion *done,
 	mod_timer(&timer.timer, jiffies + msecs_to_jiffies(CMD_TIMEOUT));
 	wait_for_completion(done);
 	timer_delete_sync(&timer.timer);
-	destroy_timer_on_stack(&timer.timer);
+	timer_destroy_on_stack(&timer.timer);
=20
 	if (actual_length)
 		*actual_length =3D urb->actual_length;
diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index 853a5f082a70..7c2041f61cde 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -630,7 +630,7 @@ static int perform_sglist(
 			retval =3D -ETIMEDOUT;
 		else
 			retval =3D req->status;
-		destroy_timer_on_stack(&timeout.timer);
+		timer_destroy_on_stack(&timeout.timer);
=20
 		/* FIXME check resulting data pattern */
=20
diff --git a/fs/bcachefs/clock.c b/fs/bcachefs/clock.c
index d6dd12d74d4f..f57f9f4774e6 100644
--- a/fs/bcachefs/clock.c
+++ b/fs/bcachefs/clock.c
@@ -122,7 +122,7 @@ void bch2_kthread_io_clock_wait(struct io_clock *clock,
=20
 	__set_current_state(TASK_RUNNING);
 	timer_delete_sync(&wait.cpu_timer);
-	destroy_timer_on_stack(&wait.cpu_timer);
+	timer_destroy_on_stack(&wait.cpu_timer);
 	bch2_io_timer_del(clock, &wait.io_timer);
 }
=20
diff --git a/include/linux/timer.h b/include/linux/timer.h
index 10596d7c3a34..7b53043a2d25 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -67,44 +67,44 @@
 /*
  * LOCKDEP and DEBUG timer interfaces.
  */
-void init_timer_key(struct timer_list *timer,
+void timer_init_key(struct timer_list *timer,
 		    void (*func)(struct timer_list *), unsigned int flags,
 		    const char *name, struct lock_class_key *key);
=20
 #ifdef CONFIG_DEBUG_OBJECTS_TIMERS
-extern void init_timer_on_stack_key(struct timer_list *timer,
+extern void timer_init_key_on_stack(struct timer_list *timer,
 				    void (*func)(struct timer_list *),
 				    unsigned int flags, const char *name,
 				    struct lock_class_key *key);
 #else
-static inline void init_timer_on_stack_key(struct timer_list *timer,
+static inline void timer_init_key_on_stack(struct timer_list *timer,
 					   void (*func)(struct timer_list *),
 					   unsigned int flags,
 					   const char *name,
 					   struct lock_class_key *key)
 {
-	init_timer_key(timer, func, flags, name, key);
+	timer_init_key(timer, func, flags, name, key);
 }
 #endif
=20
 #ifdef CONFIG_LOCKDEP
-#define __init_timer(_timer, _fn, _flags)				\
+#define __timer_init(_timer, _fn, _flags)				\
 	do {								\
 		static struct lock_class_key __key;			\
-		init_timer_key((_timer), (_fn), (_flags), #_timer, &__key);\
+		timer_init_key((_timer), (_fn), (_flags), #_timer, &__key);\
 	} while (0)
=20
-#define __init_timer_on_stack(_timer, _fn, _flags)			\
+#define __timer_init_on_stack(_timer, _fn, _flags)			\
 	do {								\
 		static struct lock_class_key __key;			\
-		init_timer_on_stack_key((_timer), (_fn), (_flags),	\
+		timer_init_key_on_stack((_timer), (_fn), (_flags),	\
 					#_timer, &__key);		 \
 	} while (0)
 #else
-#define __init_timer(_timer, _fn, _flags)				\
-	init_timer_key((_timer), (_fn), (_flags), NULL, NULL)
-#define __init_timer_on_stack(_timer, _fn, _flags)			\
-	init_timer_on_stack_key((_timer), (_fn), (_flags), NULL, NULL)
+#define __timer_init(_timer, _fn, _flags)				\
+	timer_init_key((_timer), (_fn), (_flags), NULL, NULL)
+#define __timer_init_on_stack(_timer, _fn, _flags)			\
+	timer_init_key_on_stack((_timer), (_fn), (_flags), NULL, NULL)
 #endif
=20
 /**
@@ -115,18 +115,18 @@ static inline void init_timer_on_stack_key(struct timer=
_list *timer,
  *
  * Regular timer initialization should use either DEFINE_TIMER() above,
  * or timer_setup(). For timers on the stack, timer_setup_on_stack() must
- * be used and must be balanced with a call to destroy_timer_on_stack().
+ * be used and must be balanced with a call to timer_destroy_on_stack().
  */
 #define timer_setup(timer, callback, flags)			\
-	__init_timer((timer), (callback), (flags))
+	__timer_init((timer), (callback), (flags))
=20
 #define timer_setup_on_stack(timer, callback, flags)		\
-	__init_timer_on_stack((timer), (callback), (flags))
+	__timer_init_on_stack((timer), (callback), (flags))
=20
 #ifdef CONFIG_DEBUG_OBJECTS_TIMERS
-extern void destroy_timer_on_stack(struct timer_list *timer);
+extern void timer_destroy_on_stack(struct timer_list *timer);
 #else
-static inline void destroy_timer_on_stack(struct timer_list *timer) { }
+static inline void timer_destroy_on_stack(struct timer_list *timer) { }
 #endif
=20
 #define from_timer(var, callback_timer, timer_fieldname) \
@@ -156,19 +156,19 @@ extern int timer_reduce(struct timer_list *timer, unsig=
ned long expires);
  * The jiffies value which is added to now, when there is no timer
  * in the timer wheel:
  */
-#define NEXT_TIMER_MAX_DELTA	((1UL << 30) - 1)
+#define TIMER_NEXT_MAX_DELTA	((1UL << 30) - 1)
=20
 extern void add_timer(struct timer_list *timer);
 extern void add_timer_local(struct timer_list *timer);
 extern void add_timer_global(struct timer_list *timer);
=20
-extern int try_to_del_timer_sync(struct timer_list *timer);
+extern int timer_delete_sync_try(struct timer_list *timer);
 extern int timer_delete_sync(struct timer_list *timer);
 extern int timer_delete(struct timer_list *timer);
 extern int timer_shutdown_sync(struct timer_list *timer);
 extern int timer_shutdown(struct timer_list *timer);
=20
-extern void init_timers(void);
+extern void timers_init(void);
 struct hrtimer;
 extern enum hrtimer_restart it_real_fn(struct hrtimer *);
=20
diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index b0dc957c3e56..c84da78878d9 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -316,7 +316,7 @@ static inline unsigned int work_static(struct work_struct=
 *work) { return 0; }
 #define __INIT_DELAYED_WORK(_work, _func, _tflags)			\
 	do {								\
 		INIT_WORK(&(_work)->work, (_func));			\
-		__init_timer(&(_work)->timer,				\
+		__timer_init(&(_work)->timer,				\
 			     delayed_work_timer_fn,			\
 			     (_tflags) | TIMER_IRQSAFE);		\
 	} while (0)
@@ -324,7 +324,7 @@ static inline unsigned int work_static(struct work_struct=
 *work) { return 0; }
 #define __INIT_DELAYED_WORK_ONSTACK(_work, _func, _tflags)		\
 	do {								\
 		INIT_WORK_ONSTACK(&(_work)->work, (_func));		\
-		__init_timer_on_stack(&(_work)->timer,			\
+		__timer_init_on_stack(&(_work)->timer,			\
 				      delayed_work_timer_fn,		\
 				      (_tflags) | TIMER_IRQSAFE);	\
 	} while (0)
diff --git a/init/main.c b/init/main.c
index 7f0a2a3dbd29..bf9c5d22953b 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1002,7 +1002,7 @@ void start_kernel(void)
 	init_IRQ();
 	tick_init();
 	rcu_init_nohz();
-	init_timers();
+	timers_init();
 	srcu_init();
 	hrtimers_init();
 	softirq_init();
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
=20
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
index c0e960a5de39..5aa38b2cf40a 100644
--- a/kernel/time/sleep_timeout.c
+++ b/kernel/time/sleep_timeout.c
@@ -100,7 +100,7 @@ signed long __sched schedule_timeout(signed long timeout)
 	timer_delete_sync(&timer.timer);
=20
 	/* Remove the timer from the object tracker */
-	destroy_timer_on_stack(&timer.timer);
+	timer_destroy_on_stack(&timer.timer);
=20
 	timeout =3D expire - jiffies;
=20
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 4d915c0a263c..007b30fc383b 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -850,7 +850,7 @@ static void do_init_timer(struct timer_list *timer,
 			  unsigned int flags,
 			  const char *name, struct lock_class_key *key);
=20
-void init_timer_on_stack_key(struct timer_list *timer,
+void timer_init_key_on_stack(struct timer_list *timer,
 			     void (*func)(struct timer_list *),
 			     unsigned int flags,
 			     const char *name, struct lock_class_key *key)
@@ -858,13 +858,13 @@ void init_timer_on_stack_key(struct timer_list *timer,
 	debug_object_init_on_stack(timer, &timer_debug_descr);
 	do_init_timer(timer, func, flags, name, key);
 }
-EXPORT_SYMBOL_GPL(init_timer_on_stack_key);
+EXPORT_SYMBOL_GPL(timer_init_key_on_stack);
=20
-void destroy_timer_on_stack(struct timer_list *timer)
+void timer_destroy_on_stack(struct timer_list *timer)
 {
 	debug_object_free(timer, &timer_debug_descr);
 }
-EXPORT_SYMBOL_GPL(destroy_timer_on_stack);
+EXPORT_SYMBOL_GPL(timer_destroy_on_stack);
=20
 #else
 static inline void debug_timer_init(struct timer_list *timer) { }
@@ -904,7 +904,7 @@ static void do_init_timer(struct timer_list *timer,
 }
=20
 /**
- * init_timer_key - initialize a timer
+ * timer_init_key - initialize a timer
  * @timer: the timer to be initialized
  * @func: timer callback function
  * @flags: timer flags
@@ -912,17 +912,17 @@ static void do_init_timer(struct timer_list *timer,
  * @key: lockdep class key of the fake lock used for tracking timer
  *       sync lock dependencies
  *
- * init_timer_key() must be done to a timer prior to calling *any* of the
+ * timer_init_key() must be done to a timer prior to calling *any* of the
  * other timer functions.
  */
-void init_timer_key(struct timer_list *timer,
+void timer_init_key(struct timer_list *timer,
 		    void (*func)(struct timer_list *), unsigned int flags,
 		    const char *name, struct lock_class_key *key)
 {
 	debug_init(timer);
 	do_init_timer(timer, func, flags, name, key);
 }
-EXPORT_SYMBOL(init_timer_key);
+EXPORT_SYMBOL(timer_init_key);
=20
 static inline void detach_timer(struct timer_list *timer, bool clear_pending)
 {
@@ -1511,7 +1511,7 @@ static int __try_to_del_timer_sync(struct timer_list *t=
imer, bool shutdown)
 }
=20
 /**
- * try_to_del_timer_sync - Try to deactivate a timer
+ * timer_delete_sync_try - Try to deactivate a timer
  * @timer:	Timer to deactivate
  *
  * This function tries to deactivate a timer. On success the timer is not
@@ -1526,11 +1526,11 @@ static int __try_to_del_timer_sync(struct timer_list =
*timer, bool shutdown)
  * * %1  - The timer was pending and deactivated
  * * %-1 - The timer callback function is running on a different CPU
  */
-int try_to_del_timer_sync(struct timer_list *timer)
+int timer_delete_sync_try(struct timer_list *timer)
 {
 	return __try_to_del_timer_sync(timer, false);
 }
-EXPORT_SYMBOL(try_to_del_timer_sync);
+EXPORT_SYMBOL(timer_delete_sync_try);
=20
 #ifdef CONFIG_PREEMPT_RT
 static __init void timer_base_init_expiry_lock(struct timer_base *base)
@@ -1900,7 +1900,7 @@ static void timer_recalc_next_expiry(struct timer_base =
*base)
 	unsigned long clk, next, adj;
 	unsigned lvl, offset =3D 0;
=20
-	next =3D base->clk + NEXT_TIMER_MAX_DELTA;
+	next =3D base->clk + TIMER_NEXT_MAX_DELTA;
 	clk =3D base->clk;
 	for (lvl =3D 0; lvl < LVL_DEPTH; lvl++, offset +=3D LVL_SIZE) {
 		int pos =3D next_pending_bucket(base, offset, clk & LVL_MASK);
@@ -1963,7 +1963,7 @@ static void timer_recalc_next_expiry(struct timer_base =
*base)
=20
 	WRITE_ONCE(base->next_expiry, next);
 	base->next_expiry_recalc =3D false;
-	base->timers_pending =3D !(next =3D=3D base->clk + NEXT_TIMER_MAX_DELTA);
+	base->timers_pending =3D !(next =3D=3D base->clk + TIMER_NEXT_MAX_DELTA);
 }
=20
 #ifdef CONFIG_NO_HZ_COMMON
@@ -2015,7 +2015,7 @@ static unsigned long next_timer_interrupt(struct timer_=
base *base,
 	 * easy comparable to find out which base holds the first pending timer.
 	 */
 	if (!base->timers_pending)
-		WRITE_ONCE(base->next_expiry, basej + NEXT_TIMER_MAX_DELTA);
+		WRITE_ONCE(base->next_expiry, basej + TIMER_NEXT_MAX_DELTA);
=20
 	return base->next_expiry;
 }
@@ -2399,7 +2399,7 @@ static inline void __run_timers(struct timer_base *base)
 		 * timer at this clk are that all matching timers have been
 		 * dequeued or no timer has been queued since
 		 * base::next_expiry was set to base::clk +
-		 * NEXT_TIMER_MAX_DELTA.
+		 * TIMER_NEXT_MAX_DELTA.
 		 */
 		WARN_ON_ONCE(!levels && !base->next_expiry_recalc
 			     && base->timers_pending);
@@ -2544,7 +2544,7 @@ int timers_prepare_cpu(unsigned int cpu)
 	for (b =3D 0; b < NR_BASES; b++) {
 		base =3D per_cpu_ptr(&timer_bases[b], cpu);
 		base->clk =3D jiffies;
-		base->next_expiry =3D base->clk + NEXT_TIMER_MAX_DELTA;
+		base->next_expiry =3D base->clk + TIMER_NEXT_MAX_DELTA;
 		base->next_expiry_recalc =3D false;
 		base->timers_pending =3D false;
 		base->is_idle =3D false;
@@ -2599,7 +2599,7 @@ static void __init init_timer_cpu(int cpu)
 		base->cpu =3D cpu;
 		raw_spin_lock_init(&base->lock);
 		base->clk =3D jiffies;
-		base->next_expiry =3D base->clk + NEXT_TIMER_MAX_DELTA;
+		base->next_expiry =3D base->clk + TIMER_NEXT_MAX_DELTA;
 		timer_base_init_expiry_lock(base);
 	}
 }
@@ -2612,7 +2612,7 @@ static void __init init_timer_cpus(void)
 		init_timer_cpu(cpu);
 }
=20
-void __init init_timers(void)
+void __init timers_init(void)
 {
 	init_timer_cpus();
 	posix_cputimers_init_work();
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index cf6203282737..9e6cf45f0972 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -686,7 +686,7 @@ EXPORT_SYMBOL_GPL(destroy_work_on_stack);
=20
 void destroy_delayed_work_on_stack(struct delayed_work *work)
 {
-	destroy_timer_on_stack(&work->timer);
+	timer_destroy_on_stack(&work->timer);
 	debug_object_free(&work->work, &work_debug_descr);
 }
 EXPORT_SYMBOL_GPL(destroy_delayed_work_on_stack);
diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
index dcbf058de1e3..dc331b59b965 100644
--- a/net/bridge/br_multicast.c
+++ b/net/bridge/br_multicast.c
@@ -2061,7 +2061,7 @@ static void br_multicast_enable(struct bridge_mcast_own=
_query *query)
 {
 	query->startup_sent =3D 0;
=20
-	if (try_to_del_timer_sync(&query->timer) >=3D 0 ||
+	if (timer_delete_sync_try(&query->timer) >=3D 0 ||
 	    timer_delete(&query->timer))
 		mod_timer(&query->timer, jiffies);
 }
@@ -3480,7 +3480,7 @@ static void br_ip4_multicast_query(struct net_bridge_mc=
ast *brmctx,
 	if (mp->host_joined &&
 	    (timer_pending(&mp->timer) ?
 	     time_after(mp->timer.expires, now + max_delay) :
-	     try_to_del_timer_sync(&mp->timer) >=3D 0))
+	     timer_delete_sync_try(&mp->timer) >=3D 0))
 		mod_timer(&mp->timer, now + max_delay);
=20
 	for (pp =3D &mp->ports;
@@ -3488,7 +3488,7 @@ static void br_ip4_multicast_query(struct net_bridge_mc=
ast *brmctx,
 	     pp =3D &p->next) {
 		if (timer_pending(&p->timer) ?
 		    time_after(p->timer.expires, now + max_delay) :
-		    try_to_del_timer_sync(&p->timer) >=3D 0 &&
+		    timer_delete_sync_try(&p->timer) >=3D 0 &&
 		    (brmctx->multicast_igmp_version =3D=3D 2 ||
 		     p->filter_mode =3D=3D MCAST_EXCLUDE))
 			mod_timer(&p->timer, now + max_delay);
@@ -3569,7 +3569,7 @@ static int br_ip6_multicast_query(struct net_bridge_mca=
st *brmctx,
 	if (mp->host_joined &&
 	    (timer_pending(&mp->timer) ?
 	     time_after(mp->timer.expires, now + max_delay) :
-	     try_to_del_timer_sync(&mp->timer) >=3D 0))
+	     timer_delete_sync_try(&mp->timer) >=3D 0))
 		mod_timer(&mp->timer, now + max_delay);
=20
 	for (pp =3D &mp->ports;
@@ -3577,7 +3577,7 @@ static int br_ip6_multicast_query(struct net_bridge_mca=
st *brmctx,
 	     pp =3D &p->next) {
 		if (timer_pending(&p->timer) ?
 		    time_after(p->timer.expires, now + max_delay) :
-		    try_to_del_timer_sync(&p->timer) >=3D 0 &&
+		    timer_delete_sync_try(&p->timer) >=3D 0 &&
 		    (brmctx->multicast_mld_version =3D=3D 1 ||
 		     p->filter_mode =3D=3D MCAST_EXCLUDE))
 			mod_timer(&p->timer, now + max_delay);
@@ -3649,7 +3649,7 @@ br_multicast_leave_group(struct net_bridge_mcast *brmct=
x,
 			if (!hlist_unhashed(&p->mglist) &&
 			    (timer_pending(&p->timer) ?
 			     time_after(p->timer.expires, time) :
-			     try_to_del_timer_sync(&p->timer) >=3D 0)) {
+			     timer_delete_sync_try(&p->timer) >=3D 0)) {
 				mod_timer(&p->timer, time);
 			}
=20
@@ -3665,7 +3665,7 @@ br_multicast_leave_group(struct net_bridge_mcast *brmct=
x,
 		if (mp->host_joined &&
 		    (timer_pending(&mp->timer) ?
 		     time_after(mp->timer.expires, time) :
-		     try_to_del_timer_sync(&mp->timer) >=3D 0)) {
+		     timer_delete_sync_try(&mp->timer) >=3D 0)) {
 			mod_timer(&mp->timer, time);
 		}
=20
@@ -3681,7 +3681,7 @@ br_multicast_leave_group(struct net_bridge_mcast *brmct=
x,
 		if (!hlist_unhashed(&p->mglist) &&
 		    (timer_pending(&p->timer) ?
 		     time_after(p->timer.expires, time) :
-		     try_to_del_timer_sync(&p->timer) >=3D 0)) {
+		     timer_delete_sync_try(&p->timer) >=3D 0)) {
 			mod_timer(&p->timer, time);
 		}
=20
diff --git a/sound/pci/ctxfi/cttimer.c b/sound/pci/ctxfi/cttimer.c
index 89e47fa14f70..aa179644b5c9 100644
--- a/sound/pci/ctxfi/cttimer.c
+++ b/sound/pci/ctxfi/cttimer.c
@@ -119,7 +119,7 @@ static void ct_systimer_stop(struct ct_timer_instance *ti)
 static void ct_systimer_prepare(struct ct_timer_instance *ti)
 {
 	ct_systimer_stop(ti);
-	try_to_del_timer_sync(&ti->timer);
+	timer_delete_sync_try(&ti->timer);
 }
=20
 #define ct_systimer_free	ct_systimer_prepare

