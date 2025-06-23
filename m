Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2A122A7E5
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750720544; cv=none; b=sMaghc16MKX1WrAHukObp8fGBKliry5Yrprtr65FWYf8u4Z35qz21yTEX8g+tnHTdUz8XrEHMJZxJXWTMX79FWPzSPEp6XjeHOxSo13cGCrRcBOizcVCVTCRdhjJ/BJm2cDVH+u1iwdxuBX+Wpj0hI+66GTDzwCIdHVHyToVrhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750720544; c=relaxed/simple;
	bh=O1IBmLQDHKLiMS+DXfZCgYF6MWE+fai16knBZ0HaMGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NsQZQ2Jm2w+flRv2ro95/dDXpRpuGFlbz5KrE40cWH8UBQwrqmtH+XDTpu0ZW0VQ6UJjlmI/MrEybMuO8vd4ppQbuQi58Htu+hgcuDR/Vq42K9bI2hX40UalwuSTrPCGTf5e3VcdsL5aYNgC6mvByeQZrP8bSWB0Io2Prhsv05g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuQMjwqz; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuQMjwqz"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ecf99dd567so59716886d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750720538; x=1751325338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=175cCQ+806PnZFL+SfNpgPYH/vuq+jIrXxwnyKJn0VY=;
        b=iuQMjwqzC1OmMlSQycPb0zwt8D9tDkhTL77wtVe59JZN290EY8ERbhJxVzDxv75in1
         JUuyZL+REIPhGrfmoC30+n89IOZI0AfPJAAeR9C6wM9TH+FA3eySvW8SrpQ4j18MU+en
         MHGI/nTzZ88qFNwFXbwgDKHAXMrH/N12GYvQDlxpIuLQlYQTNBcIN9sLCA/z1K4T0Szh
         WkemBMRxR3xSHATPJZ0bLnJO7UeCxH4fuIAzsdmLGgkrK3WSwsT2yWsqCEqIyYKttAX4
         cPdylmm2LxwTFgNN2+UpqJjKxcfIIkk7t4a6EbRXjqjdu7W4QQLLBY6hIgSLqJv66C/L
         w0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750720538; x=1751325338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=175cCQ+806PnZFL+SfNpgPYH/vuq+jIrXxwnyKJn0VY=;
        b=PNS6xqtCdOBGD61kfzS9Id7SCn6MBHKrPJ/CQ6arsZ4OxlIdAv3Ltxba6+GsD5+KUo
         NlUXpVthh7Je4Dltp4Qaigd9PTYezySCWE1Dc6gpsPk5CF5RHJlCa8ilM4jcRH2pxrGy
         apmtb8UdavRI+8Nf8JrIAdRK0o/CYlJJLnw2sWf0exR8KF2FKMJeYsCT3SPuNjKDBmSb
         yupQy9QqqX5BM+T738B8E5ghWmap5vMowmVysH1fFI8M8G/ucXzgeZz+dN3cXk/3r5RJ
         iwVb2qBKgnD16PcvhcoZhRr9hIsarYuu1HoF8nHTavHxpc6dwmrGoIeJlwEcGgXACpNZ
         rUhg==
X-Forwarded-Encrypted: i=1; AJvYcCVdL7UgHoku+/6kDlIMmrT+maRx4oH3utmte01/qNAOU2qY5qnQak7IBBSXwl2t2q52FHnSo6NIEMM2otU=@vger.kernel.org
X-Gm-Message-State: AOJu0YywyWXYDJ2OMyUXhbXokHlvqzjsD2DJeo3na986W8BmgtLmmFcQ
	OQSBNlEA25yUx7B/Pu7fj3qKXDpA1NnazbT3+Xl9RytPELVCpKaQ5Cij
X-Gm-Gg: ASbGnctxNdCkjUm7UMcUwi0CqVpAghGGgROHUgJEc9px1pxVj3xP4Y+3MuEvk0WVe26
	z/wVtkAxB95xQ8yDWFX9HF/S5X7dIafGfG24RlH83WJoXlQGs2U+e1jG/rYtYmZnsbNuKhXxYPF
	f5ykkqjkGak5td+JmSsoSx9/I8jOCU+CSiJauYaECmokRz+HBUQvoS6fQJ6Erj7ULKk72F7uHeC
	hK3BJSCFBZDO/O0Vu+MVNyX8fVFI84iBsl7sfs4FvFf7VKvG7PtgV72UGDMmyiGjK8Yo5jWbtsu
	1OxlD0gSY5iXqGJbfwkHKbRSASk3sYfb2l0sQ2T+uPU9b1OpgTppWp5UicpENUqaBZiYFfBk81s
	fqfiPrwCq83rOMFV3Ghi6A9NNMGFq75TjRZe5lQnX3YQYSntuEJQ7+8nB
X-Google-Smtp-Source: AGHT+IFAllavyjGrl8uBXg56Alxjy56EzPw325XgmCouBn28R+zM+Y8Zq59UZClJ+hIVeHMULOPNXQ==
X-Received: by 2002:a05:6214:5183:b0:6fa:caa2:19bc with SMTP id 6a1803df08f44-6fd0a600936mr187217796d6.44.1750720538253;
        Mon, 23 Jun 2025 16:15:38 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99ef89dsm439562285a.64.2025.06.23.16.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 16:15:37 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6] clocksource/drivers/timer-clint: Add T-Head C9xx clint
Date: Mon, 23 Jun 2025 19:15:36 -0400
Message-ID: <20250623231536.1120282-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jisheng Zhang <jszhang@kernel.org>

To use the T-HEAD C9xx clint in RISCV-M NOMMU env, we need to take
care two points:

1.The mtimecmp in T-Head C9xx clint only supports 32bit read/write,
implement such support.

2. As pointed out by commit ca7810aecdba ("lib: utils/timer: mtimer:
add a quirk for lacking mtime register") of opensbi:

"T-Head developers surely have a different understanding of time CSR and
CLINT's mtime register with SiFive ones, that they did not implement
the mtime register at all -- as shown in openC906 source code, their
time CSR value is just exposed at the top of their processor IP block
and expects an external continous counter, which makes it not
overrideable, and thus mtime register is not implemented, even not for
reading. However, if CLINTEE is not enabled in T-Head's MXSTATUS
extended CSR, these systems still rely on the mtimecmp registers to
generate timer interrupts. This makes it necessary to implement T-Head
C9xx CLINT support in OpenSBI MTIMER driver, which skips implementing
reading mtime register and falls back to default code that reads time
CSR."

So, we need to fall back to read time CSR instead of mtime register.
Add riscv_csr_time_available static key for this purpose.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
Treat this as a completely new patch, as it is mostly rewritten.
Original:
https://lore.kernel.org/all/20240410142347.964-3-jszhang@kernel.org/
V3 -> V4:
 - Add riscv,csr-clint
 - Allow using of CSRs in S mode
 - Change if return else return to if return return
 - Change static_branch_likely to static_branch_unlikely
 - Fix 32-bit clint_get_cycles64 csr_available check being inverted
 - Fix is_c900_clint being uninitialized
V4 -> V5:
 - Remove riscv,csr-clint
 - Remove riscv_csr_time_available
 - Replace all static_branch_unlikely(&riscv_csr_time_available) with
    riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR)
V5 -> V6:
 - Add csr_clock_next_event
 - Add csr_get_cycles64 to sched_clock_register
 - Break get_cycles64 into csr_get_cycles64 and clint_get_cycles64
 - Change default behavior to use CSR time register

Posible future work:
 - Check for SSTC support and use stimercmp
 - SSTC depends on smode which cpufeature doesnt check for.
---
 arch/riscv/include/asm/timex.h    | 12 ++++-
 drivers/clocksource/timer-clint.c | 82 +++++++++++++++++++++++++++++--
 2 files changed, 89 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index a06697846e69..d78075351bf4 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -17,17 +17,26 @@ typedef unsigned long cycles_t;
 #ifdef CONFIG_64BIT
 static inline cycles_t get_cycles(void)
 {
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
+		return csr_read(CSR_TIME);
+
 	return readq_relaxed(clint_time_val);
 }
 #else /* !CONFIG_64BIT */
 static inline u32 get_cycles(void)
 {
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
+		return csr_read(CSR_TIME);
+
 	return readl_relaxed(((u32 *)clint_time_val));
 }
 #define get_cycles get_cycles
 
 static inline u32 get_cycles_hi(void)
 {
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
+		return csr_read(CSR_TIMEH);
+
 	return readl_relaxed(((u32 *)clint_time_val) + 1);
 }
 #define get_cycles_hi get_cycles_hi
@@ -40,7 +49,8 @@ static inline u32 get_cycles_hi(void)
  */
 static inline unsigned long random_get_entropy(void)
 {
-	if (unlikely(clint_time_val == NULL))
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR) &&
+	   (unlikely(clint_time_val == NULL)))
 		return random_get_entropy_fallback();
 	return get_cycles();
 }
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 0bdd9d7ec545..f80e81571652 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -39,6 +39,7 @@ static u64 __iomem *clint_timer_cmp;
 static u64 __iomem *clint_timer_val;
 static unsigned long clint_timer_freq;
 static unsigned int clint_timer_irq;
+static bool is_c900_clint;
 
 #ifdef CONFIG_RISCV_M_MODE
 u64 __iomem *clint_time_val;
@@ -81,6 +82,12 @@ static u64 notrace clint_get_cycles64(void)
 {
 	return clint_get_cycles();
 }
+
+static u64 notrace csr_get_cycles64(void)
+{
+	return csr_read(CSR_TIME);
+}
+
 #else /* CONFIG_64BIT */
 static u64 notrace clint_get_cycles64(void)
 {
@@ -93,8 +100,26 @@ static u64 notrace clint_get_cycles64(void)
 
 	return ((u64)hi << 32) | lo;
 }
+
+static u64 notrace csr_get_cycles64(void)
+{
+	u32 hi, lo;
+
+	do {
+		hi = csr_read(CSR_TIMEH);
+		lo = csr_read(CSR_TIME);
+	} while (hi != csr_read(CSR_TIMEH));
+
+	return ((u64)hi << 32) | lo;
+}
+
 #endif /* CONFIG_64BIT */
 
+static u64 csr_rdtime(struct clocksource *cs)
+{
+	return csr_get_cycles64();
+}
+
 static u64 clint_rdtime(struct clocksource *cs)
 {
 	return clint_get_cycles64();
@@ -105,9 +130,20 @@ static struct clocksource clint_clocksource = {
 	.rating		= 300,
 	.mask		= CLOCKSOURCE_MASK(64),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
-	.read		= clint_rdtime,
+	.read		= csr_rdtime,
 };
 
+static int csr_clock_next_event(unsigned long delta,
+				   struct clock_event_device *ce)
+{
+	void __iomem *r = clint_timer_cmp +
+			  cpuid_to_hartid_map(smp_processor_id());
+
+	csr_set(CSR_IE, IE_TIE);
+	writeq_relaxed(csr_get_cycles64() + delta, r);
+	return 0;
+}
+
 static int clint_clock_next_event(unsigned long delta,
 				   struct clock_event_device *ce)
 {
@@ -119,17 +155,36 @@ static int clint_clock_next_event(unsigned long delta,
 	return 0;
 }
 
+static int c900_clint_clock_next_event(unsigned long delta,
+				       struct clock_event_device *ce)
+{
+	void __iomem *r = clint_timer_cmp +
+			  cpuid_to_hartid_map(smp_processor_id());
+	u64 val = clint_get_cycles64() + delta;
+
+	csr_set(CSR_IE, IE_TIE);
+	writel_relaxed(val, r);
+	writel_relaxed(val >> 32, r + 4);
+	return 0;
+}
+
 static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) = {
 	.name		= "clint_clockevent",
 	.features	= CLOCK_EVT_FEAT_ONESHOT,
 	.rating		= 100,
-	.set_next_event	= clint_clock_next_event,
+	.set_next_event	= csr_clock_next_event,
 };
 
 static int clint_timer_starting_cpu(unsigned int cpu)
 {
 	struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
 
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
+		ce->set_next_event = clint_clock_next_event;
+
+	if (is_c900_clint)
+		ce->set_next_event = c900_clint_clock_next_event;
+
 	ce->cpumask = cpumask_of(cpu);
 	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
 
@@ -161,7 +216,7 @@ static irqreturn_t clint_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __init clint_timer_init_dt(struct device_node *np)
+static int __init clint_timer_init(struct device_node *np)
 {
 	int rc;
 	u32 i, nr_irqs;
@@ -227,13 +282,19 @@ static int __init clint_timer_init_dt(struct device_node *np)
 
 	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
 
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
+		clint_clocksource.read = clint_rdtime;
+
 	rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
 	if (rc) {
 		pr_err("%pOFP: clocksource register failed [%d]\n", np, rc);
 		goto fail_iounmap;
 	}
 
-	sched_clock_register(clint_get_cycles64, 64, clint_timer_freq);
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
+		sched_clock_register(csr_get_cycles64, 64, clint_timer_freq);
+	else
+		sched_clock_register(clint_get_cycles64, 64, clint_timer_freq);
 
 	rc = request_percpu_irq(clint_timer_irq, clint_timer_interrupt,
 				 "clint-timer", &clint_clock_event);
@@ -273,5 +334,18 @@ static int __init clint_timer_init_dt(struct device_node *np)
 	return rc;
 }
 
+static int __init clint_timer_init_dt(struct device_node *np)
+{
+	is_c900_clint = false;
+	return clint_timer_init(np);
+}
+
+static int __init c900_clint_timer_init_dt(struct device_node *np)
+{
+	is_c900_clint = true;
+	return clint_timer_init(np);
+}
+
 TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
 TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
+TIMER_OF_DECLARE(clint_timer2, "thead,c900-clint", c900_clint_timer_init_dt);
-- 
2.49.0

