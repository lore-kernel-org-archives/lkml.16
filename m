Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED6C265CD2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626194; cv=none; b=dQ5jJoYIL0uj3qWPEnXb3NMolSNc8fOSfEP3LEgi6op0JCaitvGb8XNan5LV2KkAnRRt7RGjSyfgngGqYsLdIbbjjIo5XgGnRhx0/mtSOFtynNVqbiGX/mS8oogin27yg3QGtRhueuUXLF4l60/xY6O08H+7lCx+NwRuXV2pZAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626194; c=relaxed/simple;
	bh=8ZpSzjbpNm5DjZBHeXZZ3ZoyHPiwyRZFwX/xYKeWahg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qdKpbSQr6sT1gniGNifbvSPHnQ476qdWa+WfwA5g3y+pngGZAc1LAaP4YDyPhJOO/JpXuykXhXgzAXHlYRq4uh/ztgyQZ0rVCmd9rTeJGLRbb2myQ+W/zYTuxVGDSe9uMvTeEXHYUncwDZO6if5L18H/5fj0SlXoc3P7HEjCd7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTY0VLxK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTY0VLxK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F08C4CEE2;
	Mon, 14 Apr 2025 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626193;
	bh=8ZpSzjbpNm5DjZBHeXZZ3ZoyHPiwyRZFwX/xYKeWahg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GTY0VLxKmsuQ6nDOfhPgB8V6QPfgnJ1Ue9Wmntqt0qpk0F8nGUdwASQgJig9Urpum
	 0Lv19WQCa7rrCX72JxprDb7gIWJF0uAPMqA2jNjch0764hIaZLS8GPlzMUkd6xj7IS
	 MUXlecAdU8CJ62kcpFxbLv7rhAaJKCf7uY6cTbzjZqcutBaPBerg0PdPNqiwf26d94
	 ZgYpw85rPEyzFlaAVxt1iVr2monkts4dBUkqIRzLx1VLNGMgN0vZo9ZKYyfjbt9NOh
	 NC/iQx0CvlH4iecDzZj5vXCdGPrwV2bABVU0E2CVS8aQZCDoYq2Zud4nofNCudGjz0
	 aSKGX5dxH/sFg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>
Subject: [PATCH 02/17] scsi: bfa: Rename 'timer_mod' to 'timer_module'
Date: Mon, 14 Apr 2025 12:22:36 +0200
Message-ID: <20250414102301.332225-3-mingo@kernel.org>
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

We'd like to introduce timer_mod() in the kernel, so make
sure the namespace is clear.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Anil Gurumurthy <anil.gurumurthy@qlogic.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>
---
 arch/arm/mach-omap1/pm.c                         |  2 +-
 arch/arm/mach-s3c/s3c64xx.c                      |  4 +--
 arch/arm/mach-s3c/s3c64xx.h                      |  6 ++---
 arch/x86/kvm/cpuid.c                             |  4 +--
 arch/x86/kvm/lapic.c                             | 18 ++++++-------
 arch/x86/kvm/lapic.h                             |  4 +--
 drivers/clocksource/timer-ti-32k.c               |  4 +--
 drivers/clocksource/timer-ti-dm.c                |  6 ++---
 drivers/comedi/drivers/addi_apci_3120.c          | 20 +++++++-------
 drivers/comedi/drivers/addi_apci_3501.c          |  2 +-
 drivers/counter/rz-mtu3-cnt.c                    | 16 +++++------
 drivers/fpga/dfl-n3000-nios.c                    | 20 +++++++-------
 drivers/gpu/drm/msm/msm_drv.h                    |  4 +--
 drivers/gpu/drm/msm/msm_io_utils.c               |  4 +--
 drivers/leds/leds-netxbig.c                      |  4 +--
 drivers/scsi/bfa/bfa.h                           |  2 +-
 drivers/scsi/bfa/bfa_core.c                      |  4 +--
 drivers/scsi/bfa/bfa_ioc.c                       | 20 +++++++-------
 drivers/scsi/bfa/bfa_ioc.h                       | 10 +++----
 drivers/scsi/bfa/bfa_modules.h                   |  2 +-
 drivers/scsi/bfa/bfad.c                          |  2 +-
 fs/timerfd.c                                     |  2 +-
 include/clocksource/timer-ti-dm.h                |  2 +-
 include/linux/hrtimer.h                          | 24 ++++++++---------
 include/linux/torture.h                          |  2 +-
 include/trace/events/rxrpc.h                     | 16 +++++------
 include/trace/events/timer.h                     | 14 +++++-----
 io_uring/rw.c                                    |  2 +-
 io_uring/timeout.c                               |  8 +++---
 io_uring/timeout.h                               |  2 +-
 kernel/bpf/helpers.c                             |  2 +-
 kernel/time/hrtimer.c                            | 34 ++++++++++++------------
 kernel/time/posix-timers.c                       |  2 +-
 kernel/time/sleep_timeout.c                      |  6 ++---
 kernel/torture.c                                 |  2 +-
 net/rxrpc/ar-internal.h                          |  4 +--
 net/rxrpc/call_event.c                           |  2 +-
 net/rxrpc/input.c                                |  4 +--
 net/rxrpc/input_rack.c                           | 10 +++----
 net/rxrpc/output.c                               |  2 +-
 rust/kernel/time/hrtimer.rs                      | 32 +++++++++++-----------
 tools/testing/selftests/bpf/progs/test_vmlinux.c |  4 +--
 42 files changed, 167 insertions(+), 167 deletions(-)

diff --git a/arch/arm/mach-omap1/pm.c b/arch/arm/mach-omap1/pm.c
index 6a5815aa05e6..ce9295ca2960 100644
--- a/arch/arm/mach-omap1/pm.c
+++ b/arch/arm/mach-omap1/pm.c
@@ -118,7 +118,7 @@ void omap1_pm_idle(void)
 #endif
 
 #ifdef CONFIG_OMAP_DM_TIMER
-	use_idlect1 = omap_dm_timer_modify_idlect_mask(use_idlect1);
+	use_idlect1 = omap_dm_timer_moduleify_idlect_mask(use_idlect1);
 #endif
 
 	if (omap_dma_running())
diff --git a/arch/arm/mach-s3c/s3c64xx.c b/arch/arm/mach-s3c/s3c64xx.c
index 6c70ea7f2931..6c1d020b181e 100644
--- a/arch/arm/mach-s3c/s3c64xx.c
+++ b/arch/arm/mach-s3c/s3c64xx.c
@@ -165,8 +165,8 @@ static struct samsung_pwm_variant s3c64xx_pwm_variant = {
 	.tclk_mask	= (1 << 7) | (1 << 6) | (1 << 5),
 };
 
-void __init s3c64xx_set_timer_source(enum s3c64xx_timer_mode event,
-				     enum s3c64xx_timer_mode source)
+void __init s3c64xx_set_timer_source(enum s3c64xx_timer_modulee event,
+				     enum s3c64xx_timer_modulee source)
 {
 	s3c64xx_pwm_variant.output_mask = BIT(SAMSUNG_PWM_NUM) - 1;
 	s3c64xx_pwm_variant.output_mask &= ~(BIT(event) | BIT(source));
diff --git a/arch/arm/mach-s3c/s3c64xx.h b/arch/arm/mach-s3c/s3c64xx.h
index 0505728f3f7b..f719e16d2a84 100644
--- a/arch/arm/mach-s3c/s3c64xx.h
+++ b/arch/arm/mach-s3c/s3c64xx.h
@@ -40,7 +40,7 @@ extern struct pl08x_platform_data s3c64xx_dma1_plat_data;
 #endif
 
 /* Samsung HR-Timer Clock mode */
-enum s3c64xx_timer_mode {
+enum s3c64xx_timer_modulee {
 	S3C64XX_PWM0,
 	S3C64XX_PWM1,
 	S3C64XX_PWM2,
@@ -48,8 +48,8 @@ enum s3c64xx_timer_mode {
 	S3C64XX_PWM4,
 };
 
-extern void __init s3c64xx_set_timer_source(enum s3c64xx_timer_mode event,
-					    enum s3c64xx_timer_mode source);
+extern void __init s3c64xx_set_timer_source(enum s3c64xx_timer_modulee event,
+					    enum s3c64xx_timer_modulee source);
 extern void __init s3c64xx_timer_init(void);
 
 #endif /* __ARCH_ARM_MACH_S3C64XX_COMMON_H */
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 571c906ffcbf..a5bc09602726 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -444,9 +444,9 @@ void kvm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 	best = kvm_find_cpuid_entry(vcpu, 1);
 	if (best && apic) {
 		if (cpuid_entry_has(best, X86_FEATURE_TSC_DEADLINE_TIMER))
-			apic->lapic_timer.timer_mode_mask = 3 << 17;
+			apic->lapic_timer.timer_modulee_mask = 3 << 17;
 		else
-			apic->lapic_timer.timer_mode_mask = 1 << 17;
+			apic->lapic_timer.timer_modulee_mask = 1 << 17;
 
 		kvm_apic_set_version(vcpu);
 	}
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 28e3317124fd..9edcbc72c119 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -546,17 +546,17 @@ static inline int apic_lvt_enabled(struct kvm_lapic *apic, int lvt_type)
 
 static inline int apic_lvtt_oneshot(struct kvm_lapic *apic)
 {
-	return apic->lapic_timer.timer_mode == APIC_LVT_TIMER_ONESHOT;
+	return apic->lapic_timer.timer_modulee == APIC_LVT_TIMER_ONESHOT;
 }
 
 static inline int apic_lvtt_period(struct kvm_lapic *apic)
 {
-	return apic->lapic_timer.timer_mode == APIC_LVT_TIMER_PERIODIC;
+	return apic->lapic_timer.timer_modulee == APIC_LVT_TIMER_PERIODIC;
 }
 
 static inline int apic_lvtt_tscdeadline(struct kvm_lapic *apic)
 {
-	return apic->lapic_timer.timer_mode == APIC_LVT_TIMER_TSCDEADLINE;
+	return apic->lapic_timer.timer_modulee == APIC_LVT_TIMER_TSCDEADLINE;
 }
 
 static inline int apic_lvt_nmi_mode(u32 lvt_val)
@@ -1766,18 +1766,18 @@ static void cancel_apic_timer(struct kvm_lapic *apic)
 
 static void apic_update_lvtt(struct kvm_lapic *apic)
 {
-	u32 timer_mode = kvm_lapic_get_reg(apic, APIC_LVTT) &
-			apic->lapic_timer.timer_mode_mask;
+	u32 timer_modulee = kvm_lapic_get_reg(apic, APIC_LVTT) &
+			apic->lapic_timer.timer_modulee_mask;
 
-	if (apic->lapic_timer.timer_mode != timer_mode) {
-		if (apic_lvtt_tscdeadline(apic) != (timer_mode ==
+	if (apic->lapic_timer.timer_modulee != timer_modulee) {
+		if (apic_lvtt_tscdeadline(apic) != (timer_modulee ==
 				APIC_LVT_TIMER_TSCDEADLINE)) {
 			cancel_apic_timer(apic);
 			kvm_lapic_set_reg(apic, APIC_TMICT, 0);
 			apic->lapic_timer.period = 0;
 			apic->lapic_timer.tscdeadline = 0;
 		}
-		apic->lapic_timer.timer_mode = timer_mode;
+		apic->lapic_timer.timer_modulee = timer_modulee;
 		limit_periodic_timer_frequency(apic);
 	}
 }
@@ -2358,7 +2358,7 @@ static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
 	case APIC_LVTT:
 		if (!kvm_apic_sw_enabled(apic))
 			val |= APIC_LVT_MASKED;
-		val &= (apic_lvt_mask[LVT_TIMER] | apic->lapic_timer.timer_mode_mask);
+		val &= (apic_lvt_mask[LVT_TIMER] | apic->lapic_timer.timer_modulee_mask);
 		kvm_lapic_set_reg(apic, APIC_LVTT, val);
 		apic_update_lvtt(apic);
 		break;
diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
index 1a8553ebdb42..36644941e7d3 100644
--- a/arch/x86/kvm/lapic.h
+++ b/arch/x86/kvm/lapic.h
@@ -46,8 +46,8 @@ struct kvm_timer {
 	struct hrtimer timer;
 	s64 period; 				/* unit: ns */
 	ktime_t target_expiration;
-	u32 timer_mode;
-	u32 timer_mode_mask;
+	u32 timer_modulee;
+	u32 timer_modulee_mask;
 	u64 tscdeadline;
 	u64 expired_tscdeadline;
 	u32 timer_advance_ns;
diff --git a/drivers/clocksource/timer-ti-32k.c b/drivers/clocksource/timer-ti-32k.c
index a86529a70737..761cd798ffe9 100644
--- a/drivers/clocksource/timer-ti-32k.c
+++ b/drivers/clocksource/timer-ti-32k.c
@@ -102,7 +102,7 @@ static void __init ti_32k_timer_enable_clock(struct device_node *np,
 	}
 }
 
-static void __init ti_32k_timer_module_init(struct device_node *np,
+static void __init ti_32k_timer_moduleule_init(struct device_node *np,
 					    void __iomem *base)
 {
 	void __iomem *sysc = base + 4;
@@ -134,7 +134,7 @@ static int __init ti_32k_timer_init(struct device_node *np)
 		ti_32k_timer.cs.flags |= CLOCK_SOURCE_SUSPEND_NONSTOP;
 
 	ti_32k_timer.counter = ti_32k_timer.base;
-	ti_32k_timer_module_init(np, ti_32k_timer.base);
+	ti_32k_timer_moduleule_init(np, ti_32k_timer.base);
 
 	/*
 	 * 32k sync Counter IP register offsets vary between the highlander
diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
index e9e32df6b566..2f4ece5cd5c9 100644
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -687,10 +687,10 @@ static struct clk *omap_dm_timer_get_fclk(struct omap_dm_timer *cookie)
 }
 
 /**
- * omap_dm_timer_modify_idlect_mask - Check if any running timers use ARMXOR
+ * omap_dm_timer_moduleify_idlect_mask - Check if any running timers use ARMXOR
  * @inputmask: current value of idlect mask
  */
-__u32 omap_dm_timer_modify_idlect_mask(__u32 inputmask)
+__u32 omap_dm_timer_moduleify_idlect_mask(__u32 inputmask)
 {
 	int i = 0;
 	struct dmtimer *timer = NULL;
@@ -730,7 +730,7 @@ static struct clk *omap_dm_timer_get_fclk(struct omap_dm_timer *cookie)
 	return NULL;
 }
 
-__u32 omap_dm_timer_modify_idlect_mask(__u32 inputmask)
+__u32 omap_dm_timer_moduleify_idlect_mask(__u32 inputmask)
 {
 	BUG();
 
diff --git a/drivers/comedi/drivers/addi_apci_3120.c b/drivers/comedi/drivers/addi_apci_3120.c
index 28a242e69721..74187186d098 100644
--- a/drivers/comedi/drivers/addi_apci_3120.c
+++ b/drivers/comedi/drivers/addi_apci_3120.c
@@ -149,7 +149,7 @@ struct apci3120_private {
 	unsigned int cur_dmabuf:1;
 	struct apci3120_dmabuf dmabuf[2];
 	unsigned char do_bits;
-	unsigned char timer_mode;
+	unsigned char timer_modulee;
 	unsigned char mode;
 	unsigned short ctrl;
 };
@@ -358,9 +358,9 @@ static void apci3120_timer_set_mode(struct comedi_device *dev,
 {
 	struct apci3120_private *devpriv = dev->private;
 
-	devpriv->timer_mode &= ~APCI3120_TIMER_MODE_MASK(timer);
-	devpriv->timer_mode |= APCI3120_TIMER_MODE(timer, mode);
-	outb(devpriv->timer_mode, dev->iobase + APCI3120_TIMER_MODE_REG);
+	devpriv->timer_modulee &= ~APCI3120_TIMER_MODE_MASK(timer);
+	devpriv->timer_modulee |= APCI3120_TIMER_MODE(timer, mode);
+	outb(devpriv->timer_modulee, dev->iobase + APCI3120_TIMER_MODE_REG);
 }
 
 static void apci3120_timer_enable(struct comedi_device *dev,
@@ -822,7 +822,7 @@ static int apci3120_timer_insn_config(struct comedi_device *dev,
 	unsigned int divisor;
 	unsigned int status;
 	unsigned int mode;
-	unsigned int timer_mode;
+	unsigned int timer_modulee;
 
 	switch (data[0]) {
 	case INSN_CONFIG_ARM:
@@ -858,26 +858,26 @@ static int apci3120_timer_insn_config(struct comedi_device *dev,
 		switch (data[1]) {
 		case I8254_MODE0:
 			mode = APCI3120_MODE_TIMER2_AS_COUNTER;
-			timer_mode = APCI3120_TIMER_MODE0;
+			timer_modulee = APCI3120_TIMER_MODE0;
 			break;
 		case I8254_MODE2:
 			mode = APCI3120_MODE_TIMER2_AS_TIMER;
-			timer_mode = APCI3120_TIMER_MODE2;
+			timer_modulee = APCI3120_TIMER_MODE2;
 			break;
 		case I8254_MODE4:
 			mode = APCI3120_MODE_TIMER2_AS_TIMER;
-			timer_mode = APCI3120_TIMER_MODE4;
+			timer_modulee = APCI3120_TIMER_MODE4;
 			break;
 		case I8254_MODE5:
 			mode = APCI3120_MODE_TIMER2_AS_WDOG;
-			timer_mode = APCI3120_TIMER_MODE5;
+			timer_modulee = APCI3120_TIMER_MODE5;
 			break;
 		default:
 			return -EINVAL;
 		}
 		apci3120_timer_enable(dev, 2, false);
 		apci3120_clr_timer2_interrupt(dev);
-		apci3120_timer_set_mode(dev, 2, timer_mode);
+		apci3120_timer_set_mode(dev, 2, timer_modulee);
 		devpriv->mode &= ~APCI3120_MODE_TIMER2_AS_MASK;
 		devpriv->mode |= mode;
 		outb(devpriv->mode, dev->iobase + APCI3120_MODE_REG);
diff --git a/drivers/comedi/drivers/addi_apci_3501.c b/drivers/comedi/drivers/addi_apci_3501.c
index ecb5552f1785..9c4f59c54519 100644
--- a/drivers/comedi/drivers/addi_apci_3501.c
+++ b/drivers/comedi/drivers/addi_apci_3501.c
@@ -82,7 +82,7 @@
 
 struct apci3501_private {
 	unsigned long amcc;
-	unsigned char timer_mode;
+	unsigned char timer_modulee;
 };
 
 static const struct comedi_lrange apci3501_ao_range = {
diff --git a/drivers/counter/rz-mtu3-cnt.c b/drivers/counter/rz-mtu3-cnt.c
index e755d54dfece..e7b4769f340c 100644
--- a/drivers/counter/rz-mtu3-cnt.c
+++ b/drivers/counter/rz-mtu3-cnt.c
@@ -202,13 +202,13 @@ static int rz_mtu3_count_function_read_helper(struct rz_mtu3_channel *const ch,
 					      struct rz_mtu3_cnt *const priv,
 					      enum counter_function *function)
 {
-	u8 timer_mode;
+	u8 timer_modulee;
 
 	pm_runtime_get_sync(ch->dev);
-	timer_mode = rz_mtu3_8bit_ch_read(ch, RZ_MTU3_TMDR1);
+	timer_modulee = rz_mtu3_8bit_ch_read(ch, RZ_MTU3_TMDR1);
 	pm_runtime_put(ch->dev);
 
-	switch (timer_mode & RZ_MTU3_TMDR1_PH_CNT_MODE_MASK) {
+	switch (timer_modulee & RZ_MTU3_TMDR1_PH_CNT_MODE_MASK) {
 	case RZ_MTU3_TMDR1_PH_CNT_MODE_1:
 		*function = COUNTER_FUNCTION_QUADRATURE_X4;
 		return 0;
@@ -252,7 +252,7 @@ static int rz_mtu3_count_function_write(struct counter_device *counter,
 {
 	struct rz_mtu3_channel *const ch = rz_mtu3_get_ch(counter, count->id);
 	struct rz_mtu3_cnt *const priv = counter_priv(counter);
-	u8 timer_mode;
+	u8 timer_modulee;
 	int ret;
 
 	ret = rz_mtu3_lock_if_count_is_enabled(ch, priv, count->id);
@@ -261,13 +261,13 @@ static int rz_mtu3_count_function_write(struct counter_device *counter,
 
 	switch (function) {
 	case COUNTER_FUNCTION_QUADRATURE_X4:
-		timer_mode = RZ_MTU3_TMDR1_PH_CNT_MODE_1;
+		timer_modulee = RZ_MTU3_TMDR1_PH_CNT_MODE_1;
 		break;
 	case COUNTER_FUNCTION_PULSE_DIRECTION:
-		timer_mode = RZ_MTU3_TMDR1_PH_CNT_MODE_2;
+		timer_modulee = RZ_MTU3_TMDR1_PH_CNT_MODE_2;
 		break;
 	case COUNTER_FUNCTION_QUADRATURE_X2_B:
-		timer_mode = RZ_MTU3_TMDR1_PH_CNT_MODE_4;
+		timer_modulee = RZ_MTU3_TMDR1_PH_CNT_MODE_4;
 		break;
 	default:
 		/*
@@ -280,7 +280,7 @@ static int rz_mtu3_count_function_write(struct counter_device *counter,
 	}
 
 	pm_runtime_get_sync(ch->dev);
-	rz_mtu3_8bit_ch_write(ch, RZ_MTU3_TMDR1, timer_mode);
+	rz_mtu3_8bit_ch_write(ch, RZ_MTU3_TMDR1, timer_modulee);
 	pm_runtime_put(ch->dev);
 	mutex_unlock(&priv->lock);
 
diff --git a/drivers/fpga/dfl-n3000-nios.c b/drivers/fpga/dfl-n3000-nios.c
index 9ddf1d1d392f..18bd45bf21fe 100644
--- a/drivers/fpga/dfl-n3000-nios.c
+++ b/drivers/fpga/dfl-n3000-nios.c
@@ -183,12 +183,12 @@ static DEVICE_ATTR_RO(nios_fw_version);
 	(FIELD_GET(N3000_NIOS_PKVL_MODE_STS_GROUP_MSK, (mode_stat)) ==	\
 	 N3000_NIOS_PKVL_MODE_STS_GROUP_OK)
 
-#define IS_RETIMER_FEC_SUPPORTED(retimer_mode)			\
-	((retimer_mode) != N3000_NIOS_PKVL_MODE_ID_RESET &&	\
-	 (retimer_mode) != N3000_NIOS_PKVL_MODE_ID_4X10G)
+#define IS_RETIMER_FEC_SUPPORTED(retimer_modulee)			\
+	((retimer_modulee) != N3000_NIOS_PKVL_MODE_ID_RESET &&	\
+	 (retimer_modulee) != N3000_NIOS_PKVL_MODE_ID_4X10G)
 
-static int get_retimer_mode(struct n3000_nios *nn, unsigned int mode_stat_reg,
-			    unsigned int *retimer_mode)
+static int get_retimer_modulee(struct n3000_nios *nn, unsigned int mode_stat_reg,
+			    unsigned int *retimer_modulee)
 {
 	unsigned int val;
 	int ret;
@@ -200,7 +200,7 @@ static int get_retimer_mode(struct n3000_nios *nn, unsigned int mode_stat_reg,
 	if (!IS_MODE_STATUS_OK(val))
 		return -EFAULT;
 
-	*retimer_mode = FIELD_GET(N3000_NIOS_PKVL_MODE_STS_ID_MSK, val);
+	*retimer_modulee = FIELD_GET(N3000_NIOS_PKVL_MODE_STS_ID_MSK, val);
 
 	return 0;
 }
@@ -212,7 +212,7 @@ static ssize_t retimer_A_mode_show(struct device *dev,
 	unsigned int mode;
 	int ret;
 
-	ret = get_retimer_mode(nn, N3000_NIOS_PKVL_A_MODE_STS, &mode);
+	ret = get_retimer_modulee(nn, N3000_NIOS_PKVL_A_MODE_STS, &mode);
 	if (ret)
 		return ret;
 
@@ -227,7 +227,7 @@ static ssize_t retimer_B_mode_show(struct device *dev,
 	unsigned int mode;
 	int ret;
 
-	ret = get_retimer_mode(nn, N3000_NIOS_PKVL_B_MODE_STS, &mode);
+	ret = get_retimer_modulee(nn, N3000_NIOS_PKVL_B_MODE_STS, &mode);
 	if (ret)
 		return ret;
 
@@ -251,11 +251,11 @@ static ssize_t fec_mode_show(struct device *dev,
 		return sysfs_emit(buf, "not supported\n");
 
 	/* If no 25G links, FEC mode setting is not supported either */
-	ret = get_retimer_mode(nn, N3000_NIOS_PKVL_A_MODE_STS, &retimer_a_mode);
+	ret = get_retimer_modulee(nn, N3000_NIOS_PKVL_A_MODE_STS, &retimer_a_mode);
 	if (ret)
 		return ret;
 
-	ret = get_retimer_mode(nn, N3000_NIOS_PKVL_B_MODE_STS, &retimer_b_mode);
+	ret = get_retimer_modulee(nn, N3000_NIOS_PKVL_B_MODE_STS, &retimer_b_mode);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index a65077855201..ab30b94fa041 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -500,12 +500,12 @@ struct msm_hrtimer_work {
 
 void msm_hrtimer_queue_work(struct msm_hrtimer_work *work,
 			    ktime_t wakeup_time,
-			    enum hrtimer_mode mode);
+			    enum hrtimer_modulee mode);
 void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
 			   struct kthread_worker *worker,
 			   kthread_work_func_t fn,
 			   clockid_t clock_id,
-			   enum hrtimer_mode mode);
+			   enum hrtimer_modulee mode);
 
 /* Helper for returning a UABI error with optional logging which can make
  * it easier for userspace to understand what it is doing wrong.
diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index a6efe1eac271..480df853ea3b 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -124,7 +124,7 @@ static enum hrtimer_restart msm_hrtimer_worktimer(struct hrtimer *t)
 
 void msm_hrtimer_queue_work(struct msm_hrtimer_work *work,
 			    ktime_t wakeup_time,
-			    enum hrtimer_mode mode)
+			    enum hrtimer_modulee mode)
 {
 	hrtimer_start(&work->timer, wakeup_time, mode);
 }
@@ -133,7 +133,7 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
 			   struct kthread_worker *worker,
 			   kthread_work_func_t fn,
 			   clockid_t clock_id,
-			   enum hrtimer_mode mode)
+			   enum hrtimer_modulee mode)
 {
 	hrtimer_setup(&work->timer, msm_hrtimer_worktimer, clock_id, mode);
 	work->worker = worker;
diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index e95287416ef8..426a9f85da60 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -117,7 +117,7 @@ struct netxbig_led_data {
 	spinlock_t		lock;
 };
 
-static int netxbig_led_get_timer_mode(enum netxbig_led_mode *mode,
+static int netxbig_led_get_timer_modulee(enum netxbig_led_mode *mode,
 				      unsigned long delay_on,
 				      unsigned long delay_off,
 				      struct netxbig_led_timer *timer,
@@ -146,7 +146,7 @@ static int netxbig_led_blink_set(struct led_classdev *led_cdev,
 	int ret;
 
 	/* Look for a LED mode with the requested timer frequency. */
-	ret = netxbig_led_get_timer_mode(&mode, *delay_on, *delay_off,
+	ret = netxbig_led_get_timer_modulee(&mode, *delay_on, *delay_off,
 					 led_dat->timer, led_dat->num_timer);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/scsi/bfa/bfa.h b/drivers/scsi/bfa/bfa.h
index a6b8c4ddea19..80b75669fc50 100644
--- a/drivers/scsi/bfa/bfa.h
+++ b/drivers/scsi/bfa/bfa.h
@@ -429,7 +429,7 @@ bfa_status_t bfa_iocfc_israttr_set(struct bfa_s *bfa,
 void bfa_iocfc_enable(struct bfa_s *bfa);
 void bfa_iocfc_disable(struct bfa_s *bfa);
 #define bfa_timer_start(_bfa, _timer, _timercb, _arg, _timeout)		\
-	bfa_timer_begin(&(_bfa)->timer_mod, _timer, _timercb, _arg, _timeout)
+	bfa_timer_begin(&(_bfa)->timer_module, _timer, _timercb, _arg, _timeout)
 
 struct bfa_cb_pending_q_s {
 	struct bfa_cb_qe_s	hcb_qe;
diff --git a/drivers/scsi/bfa/bfa_core.c b/drivers/scsi/bfa/bfa_core.c
index a99a101b95ef..667a631a2abc 100644
--- a/drivers/scsi/bfa/bfa_core.c
+++ b/drivers/scsi/bfa/bfa_core.c
@@ -1526,14 +1526,14 @@ bfa_iocfc_attach(struct bfa_s *bfa, void *bfad, struct bfa_iocfc_cfg_s *cfg,
 	bfa_iocfc_cbfn.reset_cbfn = bfa_iocfc_reset_cbfn;
 
 	ioc->trcmod = bfa->trcmod;
-	bfa_ioc_attach(&bfa->ioc, bfa, &bfa_iocfc_cbfn, &bfa->timer_mod);
+	bfa_ioc_attach(&bfa->ioc, bfa, &bfa_iocfc_cbfn, &bfa->timer_module);
 
 	bfa_ioc_pci_init(&bfa->ioc, pcidev, BFI_PCIFN_CLASS_FC);
 	bfa_ioc_mbox_register(&bfa->ioc, bfa_mbox_isrs);
 
 	bfa_iocfc_init_mem(bfa, bfad, cfg, pcidev);
 	bfa_iocfc_mem_claim(bfa, cfg);
-	INIT_LIST_HEAD(&bfa->timer_mod.timer_q);
+	INIT_LIST_HEAD(&bfa->timer_module.timer_q);
 
 	INIT_LIST_HEAD(&bfa->comp_q);
 	for (i = 0; i < BFI_IOC_MAX_CQS; i++)
diff --git a/drivers/scsi/bfa/bfa_ioc.c b/drivers/scsi/bfa/bfa_ioc.c
index aa68d61a2d0d..4c11e3738f36 100644
--- a/drivers/scsi/bfa/bfa_ioc.c
+++ b/drivers/scsi/bfa/bfa_ioc.c
@@ -28,12 +28,12 @@ BFA_TRC_FILE(CNA, IOC);
 #define BFA_IOC_POLL_TOV	BFA_TIMER_FREQ
 
 #define bfa_ioc_timer_start(__ioc)					\
-	bfa_timer_begin((__ioc)->timer_mod, &(__ioc)->ioc_timer,	\
+	bfa_timer_begin((__ioc)->timer_module, &(__ioc)->ioc_timer,	\
 			bfa_ioc_timeout, (__ioc), BFA_IOC_TOV)
 #define bfa_ioc_timer_stop(__ioc)   bfa_timer_stop(&(__ioc)->ioc_timer)
 
 #define bfa_hb_timer_start(__ioc)					\
-	bfa_timer_begin((__ioc)->timer_mod, &(__ioc)->hb_timer,		\
+	bfa_timer_begin((__ioc)->timer_module, &(__ioc)->hb_timer,		\
 			bfa_ioc_hb_check, (__ioc), BFA_IOC_HB_TOV)
 #define bfa_hb_timer_stop(__ioc)	bfa_timer_stop(&(__ioc)->hb_timer)
 
@@ -159,16 +159,16 @@ bfa_ioc_sm_to_state(struct bfa_ioc_sm_table *smt, bfa_ioc_sm_t sm)
  */
 
 #define bfa_iocpf_timer_start(__ioc)					\
-	bfa_timer_begin((__ioc)->timer_mod, &(__ioc)->ioc_timer,	\
+	bfa_timer_begin((__ioc)->timer_module, &(__ioc)->ioc_timer,	\
 			bfa_iocpf_timeout, (__ioc), BFA_IOC_TOV)
 #define bfa_iocpf_timer_stop(__ioc)	bfa_timer_stop(&(__ioc)->ioc_timer)
 
 #define bfa_iocpf_poll_timer_start(__ioc)				\
-	bfa_timer_begin((__ioc)->timer_mod, &(__ioc)->ioc_timer,	\
+	bfa_timer_begin((__ioc)->timer_module, &(__ioc)->ioc_timer,	\
 			bfa_iocpf_poll_timeout, (__ioc), BFA_IOC_POLL_TOV)
 
 #define bfa_sem_timer_start(__ioc)					\
-	bfa_timer_begin((__ioc)->timer_mod, &(__ioc)->sem_timer,	\
+	bfa_timer_begin((__ioc)->timer_module, &(__ioc)->sem_timer,	\
 			bfa_iocpf_sem_timeout, (__ioc), BFA_IOC_HWSEM_TOV)
 #define bfa_sem_timer_stop(__ioc)	bfa_timer_stop(&(__ioc)->sem_timer)
 
@@ -2333,11 +2333,11 @@ bfa_ioc_isr(struct bfa_ioc_s *ioc, struct bfi_mbmsg_s *m)
  */
 void
 bfa_ioc_attach(struct bfa_ioc_s *ioc, void *bfa, struct bfa_ioc_cbfn_s *cbfn,
-	       struct bfa_timer_mod_s *timer_mod)
+	       struct bfa_timer_module_s *timer_module)
 {
 	ioc->bfa	= bfa;
 	ioc->cbfn	= cbfn;
-	ioc->timer_mod	= timer_mod;
+	ioc->timer_module	= timer_module;
 	ioc->fcmode	= BFA_FALSE;
 	ioc->pllinit	= BFA_FALSE;
 	ioc->dbg_fwsave_once = BFA_TRUE;
@@ -3162,7 +3162,7 @@ bfa_iocpf_poll_timeout(void *ioc_arg)
  *  bfa timer function
  */
 void
-bfa_timer_beat(struct bfa_timer_mod_s *mod)
+bfa_timer_beat(struct bfa_timer_module_s *mod)
 {
 	struct list_head *qh = &mod->timer_q;
 	struct list_head *qe, *qe_next;
@@ -3201,7 +3201,7 @@ bfa_timer_beat(struct bfa_timer_mod_s *mod)
  * Should be called with lock protection
  */
 void
-bfa_timer_begin(struct bfa_timer_mod_s *mod, struct bfa_timer_s *timer,
+bfa_timer_begin(struct bfa_timer_module_s *mod, struct bfa_timer_s *timer,
 		    void (*timercb) (void *), void *arg, unsigned int timeout)
 {
 
@@ -5062,7 +5062,7 @@ bfa_diag_memtest(struct bfa_diag_s *diag, struct bfa_diag_memtest_s *memtest,
 
 	memtest_tov = (bfa_ioc_asic_gen(diag->ioc) == BFI_ASIC_GEN_CT2) ?
 		       CT2_BFA_DIAG_MEMTEST_TOV : BFA_DIAG_MEMTEST_TOV;
-	bfa_timer_begin(diag->ioc->timer_mod, &diag->timer,
+	bfa_timer_begin(diag->ioc->timer_module, &diag->timer,
 			bfa_diag_memtest_done, diag, memtest_tov);
 	diag->timer_active = 1;
 	return BFA_STATUS_OK;
diff --git a/drivers/scsi/bfa/bfa_ioc.h b/drivers/scsi/bfa/bfa_ioc.h
index d70332e9ad6d..f16ebd095c91 100644
--- a/drivers/scsi/bfa/bfa_ioc.h
+++ b/drivers/scsi/bfa/bfa_ioc.h
@@ -38,14 +38,14 @@ struct bfa_timer_s {
 /*
  * Timer module structure
  */
-struct bfa_timer_mod_s {
+struct bfa_timer_module_s {
 	struct list_head timer_q;
 };
 
 #define BFA_TIMER_FREQ 200 /* specified in millisecs */
 
-void bfa_timer_beat(struct bfa_timer_mod_s *mod);
-void bfa_timer_begin(struct bfa_timer_mod_s *mod, struct bfa_timer_s *timer,
+void bfa_timer_beat(struct bfa_timer_module_s *mod);
+void bfa_timer_begin(struct bfa_timer_module_s *mod, struct bfa_timer_s *timer,
 			bfa_timer_cbfn_t timercb, void *arg,
 			unsigned int timeout);
 void bfa_timer_stop(struct bfa_timer_s *timer);
@@ -333,7 +333,7 @@ struct bfa_ioc_s {
 	bfa_ioc_sm_t		fsm;
 	struct bfa_s		*bfa;
 	struct bfa_pcidev_s	pcidev;
-	struct bfa_timer_mod_s	*timer_mod;
+	struct bfa_timer_module_s	*timer_module;
 	struct bfa_timer_s	ioc_timer;
 	struct bfa_timer_s	sem_timer;
 	struct bfa_timer_s	hb_timer;
@@ -918,7 +918,7 @@ void bfa_ioc_set_ct2_hwif(struct bfa_ioc_s *ioc);
 void bfa_ioc_ct2_poweron(struct bfa_ioc_s *ioc);
 
 void bfa_ioc_attach(struct bfa_ioc_s *ioc, void *bfa,
-		struct bfa_ioc_cbfn_s *cbfn, struct bfa_timer_mod_s *timer_mod);
+		struct bfa_ioc_cbfn_s *cbfn, struct bfa_timer_module_s *timer_module);
 void bfa_ioc_detach(struct bfa_ioc_s *ioc);
 void bfa_ioc_suspend(struct bfa_ioc_s *ioc);
 void bfa_ioc_pci_init(struct bfa_ioc_s *ioc, struct bfa_pcidev_s *pcidev,
diff --git a/drivers/scsi/bfa/bfa_modules.h b/drivers/scsi/bfa/bfa_modules.h
index ed29ebda30da..3d173d429b11 100644
--- a/drivers/scsi/bfa/bfa_modules.h
+++ b/drivers/scsi/bfa/bfa_modules.h
@@ -61,7 +61,7 @@ struct bfa_s {
 	struct bfa_trc_mod_s	*trcmod;	/*  driver tracing	    */
 	struct bfa_ioc_s	ioc;		/*  IOC module		    */
 	struct bfa_iocfc_s	iocfc;		/*  IOCFC module	    */
-	struct bfa_timer_mod_s	timer_mod;	/*  timer module	    */
+	struct bfa_timer_module_s	timer_module;	/*  timer module	    */
 	struct bfa_modules_s	modules;	/*  BFA modules	    */
 	struct list_head	comp_q;		/*  pending completions     */
 	bfa_boolean_t		queue_process;	/*  queue processing enabled */
diff --git a/drivers/scsi/bfa/bfad.c b/drivers/scsi/bfa/bfad.c
index 598f2fc93ef2..695c77c5275d 100644
--- a/drivers/scsi/bfa/bfad.c
+++ b/drivers/scsi/bfa/bfad.c
@@ -691,7 +691,7 @@ bfad_bfa_tmo(struct timer_list *t)
 
 	spin_lock_irqsave(&bfad->bfad_lock, flags);
 
-	bfa_timer_beat(&bfad->bfa.timer_mod);
+	bfa_timer_beat(&bfad->bfa.timer_module);
 
 	bfa_comp_deq(&bfad->bfa, &doneq);
 	spin_unlock_irqrestore(&bfad->bfad_lock, flags);
diff --git a/fs/timerfd.c b/fs/timerfd.c
index c68f28d9c426..582f98ab559d 100644
--- a/fs/timerfd.c
+++ b/fs/timerfd.c
@@ -187,7 +187,7 @@ static ktime_t timerfd_get_remaining(struct timerfd_ctx *ctx)
 static int timerfd_setup(struct timerfd_ctx *ctx, int flags,
 			 const struct itimerspec64 *ktmr)
 {
-	enum hrtimer_mode htmode;
+	enum hrtimer_modulee htmode;
 	ktime_t texp;
 	int clockid = ctx->clockid;
 
diff --git a/include/clocksource/timer-ti-dm.h b/include/clocksource/timer-ti-dm.h
index dcc1712f75e7..56d4ee7554db 100644
--- a/include/clocksource/timer-ti-dm.h
+++ b/include/clocksource/timer-ti-dm.h
@@ -62,7 +62,7 @@
 struct omap_dm_timer {
 };
 
-u32 omap_dm_timer_modify_idlect_mask(u32 inputmask);
+u32 omap_dm_timer_moduleify_idlect_mask(u32 inputmask);
 
 /*
  * Do not use the defines below, they are not needed. They should be only
diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index 1ef867bb8c44..ca8697abd48a 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -32,7 +32,7 @@
  * HRTIMER_MODE_HARD		- Timer callback function will be executed in
  *				  hard irq context even on PREEMPT_RT.
  */
-enum hrtimer_mode {
+enum hrtimer_modulee {
 	HRTIMER_MODE_ABS	= 0x00,
 	HRTIMER_MODE_REL	= 0x01,
 	HRTIMER_MODE_PINNED	= 0x02,
@@ -232,12 +232,12 @@ static inline enum hrtimer_restart hrtimer_dummy_timeout(struct hrtimer *unused)
 
 /* Initialize timers: */
 extern void hrtimer_setup(struct hrtimer *timer, enum hrtimer_restart (*function)(struct hrtimer *),
-			  clockid_t clock_id, enum hrtimer_mode mode);
+			  clockid_t clock_id, enum hrtimer_modulee mode);
 extern void hrtimer_setup_on_stack(struct hrtimer *timer,
 				   enum hrtimer_restart (*function)(struct hrtimer *),
-				   clockid_t clock_id, enum hrtimer_mode mode);
+				   clockid_t clock_id, enum hrtimer_modulee mode);
 extern void hrtimer_setup_sleeper_on_stack(struct hrtimer_sleeper *sl, clockid_t clock_id,
-					   enum hrtimer_mode mode);
+					   enum hrtimer_modulee mode);
 
 #ifdef CONFIG_DEBUG_OBJECTS_TIMERS
 extern void destroy_hrtimer_on_stack(struct hrtimer *timer);
@@ -247,7 +247,7 @@ static inline void destroy_hrtimer_on_stack(struct hrtimer *timer) { }
 
 /* Basic timer operations: */
 extern void hrtimer_start_range_ns(struct hrtimer *timer, ktime_t tim,
-				   u64 range_ns, const enum hrtimer_mode mode);
+				   u64 range_ns, const enum hrtimer_modulee mode);
 
 /**
  * hrtimer_start - (re)start an hrtimer
@@ -258,7 +258,7 @@ extern void hrtimer_start_range_ns(struct hrtimer *timer, ktime_t tim,
  *		softirq based mode is considered for debug purpose only!
  */
 static inline void hrtimer_start(struct hrtimer *timer, ktime_t tim,
-				 const enum hrtimer_mode mode)
+				 const enum hrtimer_modulee mode)
 {
 	hrtimer_start_range_ns(timer, tim, 0, mode);
 }
@@ -267,7 +267,7 @@ extern int hrtimer_cancel(struct hrtimer *timer);
 extern int hrtimer_try_to_cancel(struct hrtimer *timer);
 
 static inline void hrtimer_start_expires(struct hrtimer *timer,
-					 enum hrtimer_mode mode)
+					 enum hrtimer_modulee mode)
 {
 	u64 delta;
 	ktime_t soft, hard;
@@ -278,7 +278,7 @@ static inline void hrtimer_start_expires(struct hrtimer *timer,
 }
 
 void hrtimer_sleeper_start_expires(struct hrtimer_sleeper *sl,
-				   enum hrtimer_mode mode);
+				   enum hrtimer_modulee mode);
 
 static inline void hrtimer_restart(struct hrtimer *timer)
 {
@@ -369,16 +369,16 @@ static inline u64 hrtimer_forward_now(struct hrtimer *timer,
 /* Precise sleep: */
 
 extern int nanosleep_copyout(struct restart_block *, struct timespec64 *);
-extern long hrtimer_nanosleep(ktime_t rqtp, const enum hrtimer_mode mode,
+extern long hrtimer_nanosleep(ktime_t rqtp, const enum hrtimer_modulee mode,
 			      const clockid_t clockid);
 
 extern int schedule_hrtimeout_range(ktime_t *expires, u64 delta,
-				    const enum hrtimer_mode mode);
+				    const enum hrtimer_modulee mode);
 extern int schedule_hrtimeout_range_clock(ktime_t *expires,
 					  u64 delta,
-					  const enum hrtimer_mode mode,
+					  const enum hrtimer_modulee mode,
 					  clockid_t clock_id);
-extern int schedule_hrtimeout(ktime_t *expires, const enum hrtimer_mode mode);
+extern int schedule_hrtimeout(ktime_t *expires, const enum hrtimer_modulee mode);
 
 /* Soft interrupt function to run the hrtimer queues: */
 extern void hrtimer_run_queues(void);
diff --git a/include/linux/torture.h b/include/linux/torture.h
index 1b59056c3b18..09870155993d 100644
--- a/include/linux/torture.h
+++ b/include/linux/torture.h
@@ -82,7 +82,7 @@ static inline void torture_random_init(struct torture_random_state *trsp)
 }
 
 /* Definitions for high-resolution-timer sleeps. */
-int torture_hrtimeout_ns(ktime_t baset_ns, u32 fuzzt_ns, const enum hrtimer_mode mode,
+int torture_hrtimeout_ns(ktime_t baset_ns, u32 fuzzt_ns, const enum hrtimer_modulee mode,
 			 struct torture_random_state *trsp);
 int torture_hrtimeout_us(u32 baset_us, u32 fuzzt_ns, struct torture_random_state *trsp);
 int torture_hrtimeout_ms(u32 baset_ms, u32 fuzzt_us, struct torture_random_state *trsp);
diff --git a/include/trace/events/rxrpc.h b/include/trace/events/rxrpc.h
index cad50d91077e..efe3ee9b6e76 100644
--- a/include/trace/events/rxrpc.h
+++ b/include/trace/events/rxrpc.h
@@ -509,7 +509,7 @@
 	EM(rxrpc_rotate_trace_sack,		"soft-ack")	\
 	E_(rxrpc_rotate_trace_snak,		"soft-nack")
 
-#define rxrpc_rack_timer_modes \
+#define rxrpc_rack_timer_modulees \
 	EM(RXRPC_CALL_RACKTIMER_OFF,		"---") \
 	EM(RXRPC_CALL_RACKTIMER_RACK_REORDER,	"REO") \
 	EM(RXRPC_CALL_RACKTIMER_TLP_PTO,	"TLP") \
@@ -591,7 +591,7 @@ rxrpc_conn_traces;
 rxrpc_local_traces;
 rxrpc_pmtud_reduce_traces;
 rxrpc_propose_ack_traces;
-rxrpc_rack_timer_modes;
+rxrpc_rack_timer_modulees;
 rxrpc_receive_traces;
 rxrpc_recvmsg_traces;
 rxrpc_req_ack_traces;
@@ -2439,7 +2439,7 @@ TRACE_EVENT(rxrpc_rack,
 		    __field(unsigned int,	call)
 		    __field(rxrpc_serial_t,	ack_serial)
 		    __field(rxrpc_seq_t,	seq)
-		    __field(enum rxrpc_rack_timer_mode, mode)
+		    __field(enum rxrpc_rack_timer_modulee, mode)
 		    __field(unsigned short,	nr_sent)
 		    __field(unsigned short,	nr_lost)
 		    __field(unsigned short,	nr_resent)
@@ -2451,7 +2451,7 @@ TRACE_EVENT(rxrpc_rack,
 		    __entry->call	= call->debug_id;
 		    __entry->ack_serial	= call->rx_serial;
 		    __entry->seq	= call->rack_end_seq;
-		    __entry->mode	= call->rack_timer_mode;
+		    __entry->mode	= call->rack_timer_modulee;
 		    __entry->nr_sent	= call->tx_nr_sent;
 		    __entry->nr_lost	= call->tx_nr_lost;
 		    __entry->nr_resent	= call->tx_nr_resent;
@@ -2461,7 +2461,7 @@ TRACE_EVENT(rxrpc_rack,
 
 	    TP_printk("c=%08x r=%08x q=%08x %s slrs=%u,%u,%u,%u t=%lld",
 		      __entry->call, __entry->ack_serial, __entry->seq,
-		      __print_symbolic(__entry->mode, rxrpc_rack_timer_modes),
+		      __print_symbolic(__entry->mode, rxrpc_rack_timer_modulees),
 		      __entry->nr_sent, __entry->nr_lost,
 		      __entry->nr_resent, __entry->nr_sacked,
 		      ktime_to_us(__entry->timo))
@@ -2650,21 +2650,21 @@ TRACE_EVENT(rxrpc_rack_timer,
 	    TP_STRUCT__entry(
 		    __field(unsigned int,		call)
 		    __field(bool,			exp)
-		    __field(enum rxrpc_rack_timer_mode,	mode)
+		    __field(enum rxrpc_rack_timer_modulee,	mode)
 		    __field(ktime_t,			delay)
 			     ),
 
 	    TP_fast_assign(
 		    __entry->call		= call->debug_id;
 		    __entry->exp		= exp;
-		    __entry->mode		= call->rack_timer_mode;
+		    __entry->mode		= call->rack_timer_modulee;
 		    __entry->delay		= delay;
 			   ),
 
 	    TP_printk("c=%08x %s %s to=%lld",
 		      __entry->call,
 		      __entry->exp ? "Exp" : "Set",
-		      __print_symbolic(__entry->mode, rxrpc_rack_timer_modes),
+		      __print_symbolic(__entry->mode, rxrpc_rack_timer_modulees),
 		      ktime_to_us(__entry->delay))
 	    );
 
diff --git a/include/trace/events/timer.h b/include/trace/events/timer.h
index 1641ae3e6ca0..00923a00d5ce 100644
--- a/include/trace/events/timer.h
+++ b/include/trace/events/timer.h
@@ -169,7 +169,7 @@ TRACE_EVENT(timer_base_idle,
 		{ CLOCK_BOOTTIME,	"CLOCK_BOOTTIME"	},	\
 		{ CLOCK_TAI,		"CLOCK_TAI"		})
 
-#define decode_hrtimer_mode(mode)					\
+#define decode_hrtimer_modulee(mode)					\
 	__print_symbolic(mode,						\
 		{ HRTIMER_MODE_ABS,		"ABS"		},	\
 		{ HRTIMER_MODE_REL,		"REL"		},	\
@@ -193,14 +193,14 @@ TRACE_EVENT(timer_base_idle,
 TRACE_EVENT(hrtimer_setup,
 
 	TP_PROTO(struct hrtimer *hrtimer, clockid_t clockid,
-		 enum hrtimer_mode mode),
+		 enum hrtimer_modulee mode),
 
 	TP_ARGS(hrtimer, clockid, mode),
 
 	TP_STRUCT__entry(
 		__field( void *,		hrtimer		)
 		__field( clockid_t,		clockid		)
-		__field( enum hrtimer_mode,	mode		)
+		__field( enum hrtimer_modulee,	mode		)
 	),
 
 	TP_fast_assign(
@@ -211,7 +211,7 @@ TRACE_EVENT(hrtimer_setup,
 
 	TP_printk("hrtimer=%p clockid=%s mode=%s", __entry->hrtimer,
 		  decode_clockid(__entry->clockid),
-		  decode_hrtimer_mode(__entry->mode))
+		  decode_hrtimer_modulee(__entry->mode))
 );
 
 /**
@@ -221,7 +221,7 @@ TRACE_EVENT(hrtimer_setup,
  */
 TRACE_EVENT(hrtimer_start,
 
-	TP_PROTO(struct hrtimer *hrtimer, enum hrtimer_mode mode),
+	TP_PROTO(struct hrtimer *hrtimer, enum hrtimer_modulee mode),
 
 	TP_ARGS(hrtimer, mode),
 
@@ -230,7 +230,7 @@ TRACE_EVENT(hrtimer_start,
 		__field( void *,	function	)
 		__field( s64,		expires		)
 		__field( s64,		softexpires	)
-		__field( enum hrtimer_mode,	mode	)
+		__field( enum hrtimer_modulee,	mode	)
 	),
 
 	TP_fast_assign(
@@ -245,7 +245,7 @@ TRACE_EVENT(hrtimer_start,
 		  "mode=%s", __entry->hrtimer, __entry->function,
 		  (unsigned long long) __entry->expires,
 		  (unsigned long long) __entry->softexpires,
-		  decode_hrtimer_mode(__entry->mode))
+		  decode_hrtimer_modulee(__entry->mode))
 );
 
 /**
diff --git a/io_uring/rw.c b/io_uring/rw.c
index 039e063f7091..726ebe66ac64 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -1251,7 +1251,7 @@ static int io_uring_classic_poll(struct io_kiocb *req, struct io_comp_batch *iob
 static u64 io_hybrid_iopoll_delay(struct io_ring_ctx *ctx, struct io_kiocb *req)
 {
 	struct hrtimer_sleeper timer;
-	enum hrtimer_mode mode;
+	enum hrtimer_modulee mode;
 	ktime_t kt;
 	u64 sleep_time;
 
diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index 2a107665230b..b927f991718d 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -386,7 +386,7 @@ static clockid_t io_timeout_get_clock(struct io_timeout_data *data)
 }
 
 static int io_linked_timeout_update(struct io_ring_ctx *ctx, __u64 user_data,
-				    struct timespec64 *ts, enum hrtimer_mode mode)
+				    struct timespec64 *ts, enum hrtimer_modulee mode)
 	__must_hold(&ctx->timeout_lock)
 {
 	struct io_timeout_data *io;
@@ -413,7 +413,7 @@ static int io_linked_timeout_update(struct io_ring_ctx *ctx, __u64 user_data,
 }
 
 static int io_timeout_update(struct io_ring_ctx *ctx, __u64 user_data,
-			     struct timespec64 *ts, enum hrtimer_mode mode)
+			     struct timespec64 *ts, enum hrtimer_modulee mode)
 	__must_hold(&ctx->timeout_lock)
 {
 	struct io_cancel_data cd = { .ctx = ctx, .data = user_data, };
@@ -465,7 +465,7 @@ int io_timeout_remove_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	return 0;
 }
 
-static inline enum hrtimer_mode io_translate_timeout_mode(unsigned int flags)
+static inline enum hrtimer_modulee io_translate_timeout_mode(unsigned int flags)
 {
 	return (flags & IORING_TIMEOUT_ABS) ? HRTIMER_MODE_ABS
 					    : HRTIMER_MODE_REL;
@@ -487,7 +487,7 @@ int io_timeout_remove(struct io_kiocb *req, unsigned int issue_flags)
 		ret = io_timeout_cancel(ctx, &cd);
 		spin_unlock(&ctx->completion_lock);
 	} else {
-		enum hrtimer_mode mode = io_translate_timeout_mode(tr->flags);
+		enum hrtimer_modulee mode = io_translate_timeout_mode(tr->flags);
 
 		raw_spin_lock_irq(&ctx->timeout_lock);
 		if (tr->ltimeout)
diff --git a/io_uring/timeout.h b/io_uring/timeout.h
index e91b32448dcf..ab2b4650092f 100644
--- a/io_uring/timeout.h
+++ b/io_uring/timeout.h
@@ -4,7 +4,7 @@ struct io_timeout_data {
 	struct io_kiocb			*req;
 	struct hrtimer			timer;
 	struct timespec64		ts;
-	enum hrtimer_mode		mode;
+	enum hrtimer_modulee		mode;
 	u32				flags;
 };
 
diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index e3a2662f4e33..c6c24075449f 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -1412,7 +1412,7 @@ BPF_CALL_3(bpf_timer_start, struct bpf_async_kern *, timer, u64, nsecs, u64, fla
 {
 	struct bpf_hrtimer *t;
 	int ret = 0;
-	enum hrtimer_mode mode;
+	enum hrtimer_modulee mode;
 
 	if (in_nmi())
 		return -EOPNOTSUPP;
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 30899a8cc52c..3bdc1623803b 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -440,7 +440,7 @@ static inline void debug_hrtimer_init_on_stack(struct hrtimer *timer)
 }
 
 static inline void debug_hrtimer_activate(struct hrtimer *timer,
-					  enum hrtimer_mode mode)
+					  enum hrtimer_modulee mode)
 {
 	debug_object_activate(timer, &hrtimer_debug_descr);
 }
@@ -461,25 +461,25 @@ EXPORT_SYMBOL_GPL(destroy_hrtimer_on_stack);
 static inline void debug_hrtimer_init(struct hrtimer *timer) { }
 static inline void debug_hrtimer_init_on_stack(struct hrtimer *timer) { }
 static inline void debug_hrtimer_activate(struct hrtimer *timer,
-					  enum hrtimer_mode mode) { }
+					  enum hrtimer_modulee mode) { }
 static inline void debug_hrtimer_deactivate(struct hrtimer *timer) { }
 #endif
 
-static inline void debug_setup(struct hrtimer *timer, clockid_t clockid, enum hrtimer_mode mode)
+static inline void debug_setup(struct hrtimer *timer, clockid_t clockid, enum hrtimer_modulee mode)
 {
 	debug_hrtimer_init(timer);
 	trace_hrtimer_setup(timer, clockid, mode);
 }
 
 static inline void debug_setup_on_stack(struct hrtimer *timer, clockid_t clockid,
-					enum hrtimer_mode mode)
+					enum hrtimer_modulee mode)
 {
 	debug_hrtimer_init_on_stack(timer);
 	trace_hrtimer_setup(timer, clockid, mode);
 }
 
 static inline void debug_activate(struct hrtimer *timer,
-				  enum hrtimer_mode mode)
+				  enum hrtimer_modulee mode)
 {
 	debug_hrtimer_activate(timer, mode);
 	trace_hrtimer_start(timer, mode);
@@ -1083,7 +1083,7 @@ EXPORT_SYMBOL_GPL(hrtimer_forward);
  * Returns true when the new timer is the leftmost timer in the tree.
  */
 static bool enqueue_hrtimer(struct hrtimer *timer, struct hrtimer_clock_base *base,
-			    enum hrtimer_mode mode)
+			    enum hrtimer_modulee mode)
 {
 	debug_activate(timer, mode);
 	WARN_ON_ONCE(!base->cpu_base->online);
@@ -1174,7 +1174,7 @@ remove_hrtimer(struct hrtimer *timer, struct hrtimer_clock_base *base,
 }
 
 static inline ktime_t hrtimer_update_lowres(struct hrtimer *timer, ktime_t tim,
-					    const enum hrtimer_mode mode)
+					    const enum hrtimer_modulee mode)
 {
 #ifdef CONFIG_TIME_LOW_RES
 	/*
@@ -1215,7 +1215,7 @@ hrtimer_update_softirq_timer(struct hrtimer_cpu_base *cpu_base, bool reprogram)
 }
 
 static int __hrtimer_start_range_ns(struct hrtimer *timer, ktime_t tim,
-				    u64 delta_ns, const enum hrtimer_mode mode,
+				    u64 delta_ns, const enum hrtimer_modulee mode,
 				    struct hrtimer_clock_base *base)
 {
 	struct hrtimer_cpu_base *this_cpu_base = this_cpu_ptr(&hrtimer_bases);
@@ -1309,7 +1309,7 @@ static int __hrtimer_start_range_ns(struct hrtimer *timer, ktime_t tim,
  *		softirq based mode is considered for debug purpose only!
  */
 void hrtimer_start_range_ns(struct hrtimer *timer, ktime_t tim,
-			    u64 delta_ns, const enum hrtimer_mode mode)
+			    u64 delta_ns, const enum hrtimer_modulee mode)
 {
 	struct hrtimer_clock_base *base;
 	unsigned long flags;
@@ -1590,7 +1590,7 @@ static inline int hrtimer_clockid_to_base(clockid_t clock_id)
 
 static void __hrtimer_setup(struct hrtimer *timer,
 			    enum hrtimer_restart (*function)(struct hrtimer *),
-			    clockid_t clock_id, enum hrtimer_mode mode)
+			    clockid_t clock_id, enum hrtimer_modulee mode)
 {
 	bool softtimer = !!(mode & HRTIMER_MODE_SOFT);
 	struct hrtimer_cpu_base *cpu_base;
@@ -1644,7 +1644,7 @@ static void __hrtimer_setup(struct hrtimer *timer,
  *              when the hrtimer is started
  */
 void hrtimer_setup(struct hrtimer *timer, enum hrtimer_restart (*function)(struct hrtimer *),
-		   clockid_t clock_id, enum hrtimer_mode mode)
+		   clockid_t clock_id, enum hrtimer_modulee mode)
 {
 	debug_setup(timer, clock_id, mode);
 	__hrtimer_setup(timer, function, clock_id, mode);
@@ -1663,7 +1663,7 @@ EXPORT_SYMBOL_GPL(hrtimer_setup);
  */
 void hrtimer_setup_on_stack(struct hrtimer *timer,
 			    enum hrtimer_restart (*function)(struct hrtimer *),
-			    clockid_t clock_id, enum hrtimer_mode mode)
+			    clockid_t clock_id, enum hrtimer_modulee mode)
 {
 	debug_setup_on_stack(timer, clock_id, mode);
 	__hrtimer_setup(timer, function, clock_id, mode);
@@ -2008,7 +2008,7 @@ static enum hrtimer_restart hrtimer_wakeup(struct hrtimer *timer)
  * to allow PREEMPT_RT to tweak the delivery mode (soft/hardirq context)
  */
 void hrtimer_sleeper_start_expires(struct hrtimer_sleeper *sl,
-				   enum hrtimer_mode mode)
+				   enum hrtimer_modulee mode)
 {
 	/*
 	 * Make the enqueue delivery mode check work on RT. If the sleeper
@@ -2025,7 +2025,7 @@ void hrtimer_sleeper_start_expires(struct hrtimer_sleeper *sl,
 EXPORT_SYMBOL_GPL(hrtimer_sleeper_start_expires);
 
 static void __hrtimer_setup_sleeper(struct hrtimer_sleeper *sl,
-				    clockid_t clock_id, enum hrtimer_mode mode)
+				    clockid_t clock_id, enum hrtimer_modulee mode)
 {
 	/*
 	 * On PREEMPT_RT enabled kernels hrtimers which are not explicitly
@@ -2062,7 +2062,7 @@ static void __hrtimer_setup_sleeper(struct hrtimer_sleeper *sl,
  * @mode:	timer mode abs/rel
  */
 void hrtimer_setup_sleeper_on_stack(struct hrtimer_sleeper *sl,
-				    clockid_t clock_id, enum hrtimer_mode mode)
+				    clockid_t clock_id, enum hrtimer_modulee mode)
 {
 	debug_setup_on_stack(&sl->timer, clock_id, mode);
 	__hrtimer_setup_sleeper(sl, clock_id, mode);
@@ -2088,7 +2088,7 @@ int nanosleep_copyout(struct restart_block *restart, struct timespec64 *ts)
 	return -ERESTART_RESTARTBLOCK;
 }
 
-static int __sched do_nanosleep(struct hrtimer_sleeper *t, enum hrtimer_mode mode)
+static int __sched do_nanosleep(struct hrtimer_sleeper *t, enum hrtimer_modulee mode)
 {
 	struct restart_block *restart;
 
@@ -2135,7 +2135,7 @@ static long __sched hrtimer_nanosleep_restart(struct restart_block *restart)
 	return ret;
 }
 
-long hrtimer_nanosleep(ktime_t rqtp, const enum hrtimer_mode mode,
+long hrtimer_nanosleep(ktime_t rqtp, const enum hrtimer_modulee mode,
 		       const clockid_t clockid)
 {
 	struct restart_block *restart;
diff --git a/kernel/time/posix-timers.c b/kernel/time/posix-timers.c
index 6222112533a7..ab4933483ed7 100644
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -815,7 +815,7 @@ static void common_hrtimer_arm(struct k_itimer *timr, ktime_t expires,
 			       bool absolute, bool sigev_none)
 {
 	struct hrtimer *timer = &timr->it.real.timer;
-	enum hrtimer_mode mode;
+	enum hrtimer_modulee mode;
 
 	mode = absolute ? HRTIMER_MODE_ABS : HRTIMER_MODE_REL;
 	/*
diff --git a/kernel/time/sleep_timeout.c b/kernel/time/sleep_timeout.c
index c0e960a5de39..bd30d354f558 100644
--- a/kernel/time/sleep_timeout.c
+++ b/kernel/time/sleep_timeout.c
@@ -187,7 +187,7 @@ EXPORT_SYMBOL(schedule_timeout_idle);
  * this function is commonly used.
  */
 int __sched schedule_hrtimeout_range_clock(ktime_t *expires, u64 delta,
-					   const enum hrtimer_mode mode, clockid_t clock_id)
+					   const enum hrtimer_modulee mode, clockid_t clock_id)
 {
 	struct hrtimer_sleeper t;
 
@@ -258,7 +258,7 @@ EXPORT_SYMBOL_GPL(schedule_hrtimeout_range_clock);
  * by an explicit wakeup, it returns -EINTR.
  */
 int __sched schedule_hrtimeout_range(ktime_t *expires, u64 delta,
-				     const enum hrtimer_mode mode)
+				     const enum hrtimer_modulee mode)
 {
 	return schedule_hrtimeout_range_clock(expires, delta, mode,
 					      CLOCK_MONOTONIC);
@@ -273,7 +273,7 @@ EXPORT_SYMBOL_GPL(schedule_hrtimeout_range);
  * See schedule_hrtimeout_range() for details. @delta argument of
  * schedule_hrtimeout_range() is set to 0 and has therefore no impact.
  */
-int __sched schedule_hrtimeout(ktime_t *expires, const enum hrtimer_mode mode)
+int __sched schedule_hrtimeout(ktime_t *expires, const enum hrtimer_modulee mode)
 {
 	return schedule_hrtimeout_range(expires, 0, mode);
 }
diff --git a/kernel/torture.c b/kernel/torture.c
index 3a0a8cc60401..a0f92b0a1d0d 100644
--- a/kernel/torture.c
+++ b/kernel/torture.c
@@ -88,7 +88,7 @@ EXPORT_SYMBOL_GPL(verbose_torout_sleep);
  * nanosecond random fuzz.  This function and its friends desynchronize
  * testing from the timer wheel.
  */
-int torture_hrtimeout_ns(ktime_t baset_ns, u32 fuzzt_ns, const enum hrtimer_mode mode,
+int torture_hrtimeout_ns(ktime_t baset_ns, u32 fuzzt_ns, const enum hrtimer_modulee mode,
 			 struct torture_random_state *trsp)
 {
 	ktime_t hto = baset_ns;
diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 3cc3af15086f..1e3a265ad2bc 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -627,7 +627,7 @@ enum rxrpc_ca_state {
  * [RFC8985], the transmission timer (call->rack_timo_at) may only be used for
  * one of these at once.
  */
-enum rxrpc_rack_timer_mode {
+enum rxrpc_rack_timer_modulee {
 	RXRPC_CALL_RACKTIMER_OFF,		/* Timer not running */
 	RXRPC_CALL_RACKTIMER_RACK_REORDER,	/* RACK reordering timer */
 	RXRPC_CALL_RACKTIMER_TLP_PTO,		/* TLP timeout */
@@ -753,7 +753,7 @@ struct rxrpc_call {
 	rxrpc_seq_t		rack_dsack_round; /* DSACK opt recv'd in latest roundtrip */
 	bool			rack_dsack_round_none; /* T if dsack_round is "None" */
 	bool			rack_reordering_seen; /* T if detected reordering event */
-	enum rxrpc_rack_timer_mode rack_timer_mode; /* Current mode of RACK timer */
+	enum rxrpc_rack_timer_modulee rack_timer_modulee; /* Current mode of RACK timer */
 	bool			tlp_is_retrans;	/* T if unacked TLP retransmission */
 	rxrpc_serial_t		tlp_serial;	/* Serial of TLP probe (or 0 if none in progress) */
 	rxrpc_seq_t		tlp_seq;	/* Sequence of TLP probe */
diff --git a/net/rxrpc/call_event.c b/net/rxrpc/call_event.c
index fec59d9338b9..496f1bb01d4c 100644
--- a/net/rxrpc/call_event.c
+++ b/net/rxrpc/call_event.c
@@ -340,7 +340,7 @@ bool rxrpc_input_call_event(struct rxrpc_call *call)
 		t = ktime_sub(call->rack_timo_at, ktime_get_real());
 		if (t <= 0) {
 			trace_rxrpc_timer_exp(call, t,
-					      rxrpc_timer_trace_rack_off + call->rack_timer_mode);
+					      rxrpc_timer_trace_rack_off + call->rack_timer_modulee);
 			call->rack_timo_at = KTIME_MAX;
 			rxrpc_rack_timer_expired(call, t);
 		}
diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index 24aceb183c2c..2603bd01449b 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -349,10 +349,10 @@ static void rxrpc_end_tx_phase(struct rxrpc_call *call, bool reply_begun,
 {
 	ASSERT(test_bit(RXRPC_CALL_TX_LAST, &call->flags));
 
-	call->rack_timer_mode = RXRPC_CALL_RACKTIMER_OFF;
+	call->rack_timer_modulee = RXRPC_CALL_RACKTIMER_OFF;
 	call->rack_timo_at = KTIME_MAX;
 	trace_rxrpc_rack_timer(call, 0, false);
-	trace_rxrpc_timer_can(call, rxrpc_timer_trace_rack_off + call->rack_timer_mode);
+	trace_rxrpc_timer_can(call, rxrpc_timer_trace_rack_off + call->rack_timer_modulee);
 
 	switch (__rxrpc_call_state(call)) {
 	case RXRPC_CALL_CLIENT_SEND_REQUEST:
diff --git a/net/rxrpc/input_rack.c b/net/rxrpc/input_rack.c
index 13c371261e0a..165969368006 100644
--- a/net/rxrpc/input_rack.c
+++ b/net/rxrpc/input_rack.c
@@ -247,7 +247,7 @@ void rxrpc_rack_detect_loss_and_arm_timer(struct rxrpc_call *call,
 	ktime_t timeout = rxrpc_rack_detect_loss(call, summary);
 
 	if (timeout) {
-		call->rack_timer_mode = RXRPC_CALL_RACKTIMER_RACK_REORDER;
+		call->rack_timer_modulee = RXRPC_CALL_RACKTIMER_RACK_REORDER;
 		call->rack_timo_at = ktime_add(ktime_get_real(), timeout);
 		trace_rxrpc_rack_timer(call, timeout, false);
 		trace_rxrpc_timer_set(call, timeout, rxrpc_timer_trace_rack_reo);
@@ -348,7 +348,7 @@ void rxrpc_tlp_send_probe(struct rxrpc_call *call)
 	if (in_flight != 0) {
 		ktime_t rto = rxrpc_get_rto_backoff(call, false);
 
-		call->rack_timer_mode = RXRPC_CALL_RACKTIMER_RTO;
+		call->rack_timer_modulee = RXRPC_CALL_RACKTIMER_RTO;
 		call->rack_timo_at = ktime_add(ktime_get_real(), rto);
 		trace_rxrpc_rack_timer(call, rto, false);
 		trace_rxrpc_timer_set(call, rto, rxrpc_timer_trace_rack_rto);
@@ -395,10 +395,10 @@ void rxrpc_tlp_process_ack(struct rxrpc_call *call, struct rxrpc_ack_summary *su
 void rxrpc_rack_timer_expired(struct rxrpc_call *call, ktime_t overran_by)
 {
 	struct rxrpc_ack_summary summary = {};
-	enum rxrpc_rack_timer_mode mode = call->rack_timer_mode;
+	enum rxrpc_rack_timer_modulee mode = call->rack_timer_modulee;
 
 	trace_rxrpc_rack_timer(call, overran_by, true);
-	call->rack_timer_mode = RXRPC_CALL_RACKTIMER_OFF;
+	call->rack_timer_modulee = RXRPC_CALL_RACKTIMER_OFF;
 
 	switch (mode) {
 	case RXRPC_CALL_RACKTIMER_RACK_REORDER:
@@ -413,6 +413,6 @@ void rxrpc_rack_timer_expired(struct rxrpc_call *call, ktime_t overran_by)
 		break;
 	//case RXRPC_CALL_RACKTIMER_ZEROWIN:
 	default:
-		pr_warn("Unexpected rack timer %u", call->rack_timer_mode);
+		pr_warn("Unexpected rack timer %u", call->rack_timer_modulee);
 	}
 }
diff --git a/net/rxrpc/output.c b/net/rxrpc/output.c
index 95905b85a8d7..22c175683108 100644
--- a/net/rxrpc/output.c
+++ b/net/rxrpc/output.c
@@ -615,7 +615,7 @@ static size_t rxrpc_prepare_data_packet(struct rxrpc_call *call,
 		else
 			pto = rxrpc_tlp_calc_pto(call, req->now);
 
-		call->rack_timer_mode = RXRPC_CALL_RACKTIMER_TLP_PTO;
+		call->rack_timer_modulee = RXRPC_CALL_RACKTIMER_TLP_PTO;
 		call->rack_timo_at = ktime_add(req->now, pto);
 		trace_rxrpc_rack_timer(call, pto, false);
 		trace_rxrpc_timer_set(call, pto, rxrpc_timer_trace_rack_tlp_pto);
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index f3fb7a0caf2f..8902cc769203 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -449,24 +449,24 @@ pub enum HrTimerMode {
 }
 
 impl HrTimerMode {
-    fn into_c(self) -> bindings::hrtimer_mode {
+    fn into_c(self) -> bindings::hrtimer_modulee {
         use bindings::*;
         match self {
-            HrTimerMode::Absolute => hrtimer_mode_HRTIMER_MODE_ABS,
-            HrTimerMode::Relative => hrtimer_mode_HRTIMER_MODE_REL,
-            HrTimerMode::Pinned => hrtimer_mode_HRTIMER_MODE_PINNED,
-            HrTimerMode::Soft => hrtimer_mode_HRTIMER_MODE_SOFT,
-            HrTimerMode::Hard => hrtimer_mode_HRTIMER_MODE_HARD,
-            HrTimerMode::AbsolutePinned => hrtimer_mode_HRTIMER_MODE_ABS_PINNED,
-            HrTimerMode::RelativePinned => hrtimer_mode_HRTIMER_MODE_REL_PINNED,
-            HrTimerMode::AbsoluteSoft => hrtimer_mode_HRTIMER_MODE_ABS_SOFT,
-            HrTimerMode::RelativeSoft => hrtimer_mode_HRTIMER_MODE_REL_SOFT,
-            HrTimerMode::AbsolutePinnedSoft => hrtimer_mode_HRTIMER_MODE_ABS_PINNED_SOFT,
-            HrTimerMode::RelativePinnedSoft => hrtimer_mode_HRTIMER_MODE_REL_PINNED_SOFT,
-            HrTimerMode::AbsoluteHard => hrtimer_mode_HRTIMER_MODE_ABS_HARD,
-            HrTimerMode::RelativeHard => hrtimer_mode_HRTIMER_MODE_REL_HARD,
-            HrTimerMode::AbsolutePinnedHard => hrtimer_mode_HRTIMER_MODE_ABS_PINNED_HARD,
-            HrTimerMode::RelativePinnedHard => hrtimer_mode_HRTIMER_MODE_REL_PINNED_HARD,
+            HrTimerMode::Absolute => hrtimer_modulee_HRTIMER_MODE_ABS,
+            HrTimerMode::Relative => hrtimer_modulee_HRTIMER_MODE_REL,
+            HrTimerMode::Pinned => hrtimer_modulee_HRTIMER_MODE_PINNED,
+            HrTimerMode::Soft => hrtimer_modulee_HRTIMER_MODE_SOFT,
+            HrTimerMode::Hard => hrtimer_modulee_HRTIMER_MODE_HARD,
+            HrTimerMode::AbsolutePinned => hrtimer_modulee_HRTIMER_MODE_ABS_PINNED,
+            HrTimerMode::RelativePinned => hrtimer_modulee_HRTIMER_MODE_REL_PINNED,
+            HrTimerMode::AbsoluteSoft => hrtimer_modulee_HRTIMER_MODE_ABS_SOFT,
+            HrTimerMode::RelativeSoft => hrtimer_modulee_HRTIMER_MODE_REL_SOFT,
+            HrTimerMode::AbsolutePinnedSoft => hrtimer_modulee_HRTIMER_MODE_ABS_PINNED_SOFT,
+            HrTimerMode::RelativePinnedSoft => hrtimer_modulee_HRTIMER_MODE_REL_PINNED_SOFT,
+            HrTimerMode::AbsoluteHard => hrtimer_modulee_HRTIMER_MODE_ABS_HARD,
+            HrTimerMode::RelativeHard => hrtimer_modulee_HRTIMER_MODE_REL_HARD,
+            HrTimerMode::AbsolutePinnedHard => hrtimer_modulee_HRTIMER_MODE_ABS_PINNED_HARD,
+            HrTimerMode::RelativePinnedHard => hrtimer_modulee_HRTIMER_MODE_REL_PINNED_HARD,
         }
     }
 }
diff --git a/tools/testing/selftests/bpf/progs/test_vmlinux.c b/tools/testing/selftests/bpf/progs/test_vmlinux.c
index 78b23934d9f8..dae1bf385c53 100644
--- a/tools/testing/selftests/bpf/progs/test_vmlinux.c
+++ b/tools/testing/selftests/bpf/progs/test_vmlinux.c
@@ -71,7 +71,7 @@ int BPF_PROG(handle__tp_btf, struct pt_regs *regs, long id)
 
 SEC("kprobe/hrtimer_start_range_ns")
 int BPF_KPROBE(handle__kprobe, struct hrtimer *timer, ktime_t tim, u64 delta_ns,
-	       const enum hrtimer_mode mode)
+	       const enum hrtimer_modulee mode)
 {
 	if (tim == MY_TV_NSEC)
 		kprobe_called = true;
@@ -80,7 +80,7 @@ int BPF_KPROBE(handle__kprobe, struct hrtimer *timer, ktime_t tim, u64 delta_ns,
 
 SEC("fentry/hrtimer_start_range_ns")
 int BPF_PROG(handle__fentry, struct hrtimer *timer, ktime_t tim, u64 delta_ns,
-	     const enum hrtimer_mode mode)
+	     const enum hrtimer_modulee mode)
 {
 	if (tim == MY_TV_NSEC)
 		fentry_called = true;
-- 
2.45.2

