Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC652D6600
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029708; cv=none; b=In7Pt/A7SyJ5vovxpUm/tSBRbGUQXRZ3mfCAgqPipsKwZG0X6ZE+NVAbyeRDvibHAvLn8iRf25iszEd2GNZtFlAkpFjjDpScXvaex/U1ZTVDLo94Be5gCzFQfF78Mbt2yAhn6hfSpDdG3fqug3wlTzhzhib5VwxJv7ODEwyljcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029708; c=relaxed/simple;
	bh=XkwxyjJpYtj2oAG5T+XmaGpc9sDMvRi6uwB8T/jPY8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=f0AAgqhR0Mcsy6gAGB7QMVEf/hnH+TbCP/UEPNM/wuiY16mhk6/2NmzlsugsoGI6kdEflHTIkGrmFL9cPa/9aWncZrvX6lsykP1KxpfhELbComNVDJf2QXsqYy7VGWMkZVeDZtxzen4H8RZLhHYKAL6MnXW+P7OeB2MP+6jBI4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w+5HbmHD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w+5HbmHD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d3f72391so21011355e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751029705; x=1751634505; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g8P+2CRwWZUYKBryCM9yIecXup+4D8wZlSR+JIlWDac=;
        b=w+5HbmHDnY2maFjQg6dMXPHCEqUGIBeR074GZBWRuWjpwDMJSRXXOC2gaVt4Y5qM+M
         hwHPv2HpCFfsXty10CHiiSlhJjGtVhCuims9JUt3RiCwL8StrmGoA8UpCff6zOSM0Jc9
         CtKgYVU6qhQjmUl1TIymkyRXAOQXKk/B/sY/RNO1KfRUivbct6y6EMctxQQsegjOMdlf
         JSVGWcib1nll8gMSZpxmb3BZmBr141U0c3toCDEwAOtF1vj5Dp7ckiJrPVo2RjQ5kPp/
         /NO1AGnb18+Dbo84s3utIdzISpjFjnxpihgohK4fVG0BZW+qyDCw+AmjkRpKsZ0+2r4F
         q8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751029705; x=1751634505;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8P+2CRwWZUYKBryCM9yIecXup+4D8wZlSR+JIlWDac=;
        b=s3pwcj4Es3n5EjLZ5Jw+9z8cwwZqjNjEuSDria7v135UNQV+Az/DWKBze//c6fcQRr
         Il6GUIXrGYqTuRVEVXezRAprRiWZKf5OlBjEGTQaw1L7HBgPbFYoGgs96ZOv9kodnGfc
         PPdZ7eaBkJdlFXNreMPMDKtxISsch2u8eZbxYonSSdFvUEo8XvoXt1W9BAXPPKj0uigg
         msbzmVMB80zhBNL6tMDsUE4y/6WRTJZnJ2HyjXDsL8bwAltxw77z6JDSU+yXb6uO/dy6
         XKyuLPPw/Xq9SZpLCHGs/g/lIcAZu8HHxPAqEZ91JEP28ZlSEi5RwZGg6vWC+hqAKUJx
         viqA==
X-Forwarded-Encrypted: i=1; AJvYcCVlrah53GLzvr63hREoMWEOi6+1sXy+qPrumo6TNlzc49f7qZ4fm03uW7kaLtPRuoPVoFyHOIN4d63057E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt17HPgjIfR+UXMNUs62hqdmTcaFAli3HleNBRvgYaXzakEGZ0
	2dxN0cqF1qkPB6keoS4hh8mrk2W7g5n3atNcW94I8uAViF+BRpIyuYP+yepqDYLJtgQ=
X-Gm-Gg: ASbGnctQa+7IZQc0mKRJraj2Ehb1xoVURKu8B04l5RxG6jv30cuR2Ya3IbcOpGGuI9c
	uoBKwsXR2gbxwCotp7KoYxAc0mqfMA46ucSsDgh0Q+1j7wTFba11oONlJnHuYafauyJdBlftLVc
	Gn1T+5LrSs1mb3vh9UhICByD280jKvNXsj2Xvc0QZeR+F3hWK2T9tnCk0Ic+jH3BYwXrF5iAmeP
	G3JI4pyQAh275xIDa3oS24Yl3srSZgQmRRdSWAl/SvbRFuyUyxnLl08PV1NgHX0htIAYhbe4gAj
	5GCpZbcymoLLcfZLKoxRYXSY/OQjTUDZIuTEo5gfC3S8rxZ0uoMUlxJLyNjTZcDUYnsep8r9wej
	fsEPb0hNRr4Ucdy90
X-Google-Smtp-Source: AGHT+IHJkdywe3jKqZTwHt5aJXSfF+t/+fNhtpPOirlhFsv23S7oN038Dc1vaeTATQ3SNvrGq9nzrQ==
X-Received: by 2002:a05:600c:1911:b0:44a:b7a3:b95f with SMTP id 5b1f17b1804b1-4539264fd0fmr14998945e9.25.1751029704238;
        Fri, 27 Jun 2025 06:08:24 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e598d2sm2664445f8f.76.2025.06.27.06.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:08:23 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 27 Jun 2025 14:08:20 +0100
Subject: [PATCH v3] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMOXXmgC/3XMywrCMBCF4VcpWRvJxPTmyvcQF0MybQdKUxINS
 um7m3YjCi7Pge9fRKTAFMW5WESgxJH9lMfpUAg74NSTZJe30EqXqtRG9hEUSDs/2I0kLXa2rZx
 rTOtENnOgjp9773rLe+B49+G15xNs779SAqkkEtY11o3RWF1GnjD4ow+92FJJf3gF8Mt15qbDB
 oCsUcZ98XVd3zb6LxXqAAAA
X-Change-ID: 20250524-gs101-cpuidle-cafc96dd849d
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10329;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=XkwxyjJpYtj2oAG5T+XmaGpc9sDMvRi6uwB8T/jPY8k=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoXpfG9HwV+8m9eQjgDNfUz4U3LK8AtkCPFmivK
 i7Qw/u2g2uJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaF6XxgAKCRDO6LjWAjRy
 uqkDD/4wRDEhUxA2TfbSLMxi/4DoShfYvBILkskuDgVvM0PDbOkRniGygbYivO24qC+Q7jALQYb
 QyxtZVQfcscx/XzJp98eRJwpKdKVDZizuODxa4gcXcLVi7W/j2nQ76ubzqSnDvToNR29i3dIrBQ
 J2jaCPiZXeySYsvWnxLa5+aH0dV3tGn8diTqL2paNBhJ3AjClPqxUk99dUadZV/kVY3KWIZToSI
 zE/lYSb7KqKSyGb04KdXNbGpAfzGLG/b1jyjkpU3ZryFMLobeuivERJaMrBREfArBJO6aVMjWSZ
 CRygqxLa5tsUQkEULOmcYqabpVWWkKxDfpXHYSKu+uFnWSsivdZxd0ARLOCSW5ZIL32P1aDY//V
 op/yPxB7dkrn8BaSsDWFAgmoLlzONjSGmsawg4AxxIFTvhKT8rKCv9G47q6zH4SFee5fM4uDt1n
 XgxJDgzfXOkxxz/QSD1bSS6GNe5FwK6Kp8viJWxKFYgr2ovQHZyofgrGmFJ5M6L/LsBqQSQDeQD
 oh+++2SPyR+YPrUE3A33ZL6mwpVvrki6loY9yTOLDnjtzYrw2/YtGmB2wi8qzL1sZ4Nl6V4A1WB
 t/YI6akhIjplmFces/FsVUd6PDb728bs6AtGlK3OJ25gGYIxpCqqTQBWzIw104f3G6a4t0mv+fZ
 ZMcpLP2Y6olCGpw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Register cpu pm notifiers for gs101 which call the
gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
hint. This is required to actually enter the C2 idle state.

A couple of corner cases are handled, namely when the system is rebooting
or suspending we ignore the request. Additionally the request is ignored if
the CPU is in CPU hot plug. Some common code is refactored so that it can
be called from both the CPU hot plug callback and CPU PM notifier taking
into account that CPU PM notifiers are called with IRQs disabled whereas
CPU hotplug callbacks aren't.

Note: this patch has a runtime dependency on adding 'local-timer-stop' dt
property to the CPU nodes. This informs the time framework to switch to a
broadcast timer as the local timer will be shutdown. Without that DT
property specified the system hangs in early boot with this patch applied.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Hi folks,

This patch adds support for CPU Idle on gs101. In particular it achieves
this by registerring a cpu pm notifier and programming a ACPM hint to enter
the c2 idle state. With the hint programmed the system now enters c2 idle
state.

Note: the `local-timer-stop` DT patch mentioned above is already queued.

We can measure the impact of these changes upstream using the fuel gauge
series from Thomas Antoine [2]. With the ACPM hint now programmed
/sys/class/power_supply/max77759-fg/current_avg is a postive number around
150000 microamps meaning we are charging the battery (assuming it isn't
already full).

Prior to programming the hint this would report a negative number around
-150000 microamps meaning the battery was discharing.

Thanks,

Peter

[1] https://lore.kernel.org/lkml/20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be/
---
Changes in v3:
- Add more verbose comment regarding spinlock (Krzysztof)
- Remove per-cpu hotplug_ing bool to avoid highly discouraged remote writes
  (Krzysztof)
- Add extra comments for similarly named functions  (Krzysztof)
- Initialize lock before for_each_online_cpu() in probe() (Peter)
- Use spin_lock_irqsave in cpu hot plug callbacks (Peter/Krzysztof)
- Rebase on next-20250627
- Link to v2: https://lore.kernel.org/r/20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org

Changes in v2:
- rebase onto next-20250610
- Add #ifdef CONFIG_PM_SLEEP to avoid
  Fix warning: unused variable 'cpupm_pm_ops' [-Wunused-const-variable] (0-day)
- Link to v1: https://lore.kernel.org/r/20250524-gs101-cpuidle-v1-0-aea77a7842a6@linaro.org
---
 drivers/soc/samsung/exynos-pmu.c | 187 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 183 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index a77288f49d249f890060c595556708334383c910..a455f4514a49455171ac599d8fb48b6b88b83d21 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -8,6 +8,7 @@
 #include <linux/array_size.h>
 #include <linux/arm-smccc.h>
 #include <linux/cpuhotplug.h>
+#include <linux/cpu_pm.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/mfd/core.h>
@@ -15,6 +16,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 
 #include <linux/soc/samsung/exynos-regs-pmu.h>
@@ -35,6 +37,14 @@ struct exynos_pmu_context {
 	const struct exynos_pmu_data *pmu_data;
 	struct regmap *pmureg;
 	struct regmap *pmuintrgen;
+	/*
+	 * Serialization lock for CPU hot plug and cpuidle ACPM hint
+	 * programming. Also protects the hotplug_ing flag.
+	 */
+	spinlock_t cpupm_lock;
+	bool *hotplug_ing;
+	atomic_t sys_suspended;
+	atomic_t sys_rebooting;
 };
 
 void __iomem *pmu_base_addr;
@@ -336,7 +346,12 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 #define CPU_INFORM_CLEAR	0
 #define CPU_INFORM_C2		1
 
-static int gs101_cpuhp_pmu_online(unsigned int cpu)
+/*
+ * __gs101_cpu_pmu_ prefix functions are common code shared by CPU PM notifiers
+ * (CPUIdle) and CPU hotplug callbacks. Functions should be called with IRQs
+ * disabled and cpupm_lock held.
+ */
+static int __gs101_cpu_pmu_online(unsigned int cpu)
 {
 	unsigned int cpuhint = smp_processor_id();
 	u32 reg, mask;
@@ -358,10 +373,42 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
 	return 0;
 }
 
-static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+/* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
+static int gs101_cpu_pmu_online(void)
+{
+	int cpu;
+
+	spin_lock(&pmu_context->cpupm_lock);
+	cpu = smp_processor_id();
+	__gs101_cpu_pmu_online(cpu);
+	spin_unlock(&pmu_context->cpupm_lock);
+
+	return 0;
+}
+
+/* Called from CPU hot plug callback with IRQs enabled */
+static int gs101_cpuhp_pmu_online(unsigned int cpu)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&pmu_context->cpupm_lock, flags);
+
+	__gs101_cpu_pmu_online(cpu);
+	/*
+	 * Mark this CPU as having finished the hotplug.
+	 * This means this CPU can now enter C2 idle state.
+	 */
+	pmu_context->hotplug_ing[cpu] = false;
+	spin_unlock_irqrestore(&pmu_context->cpupm_lock, flags);
+
+	return 0;
+}
+
+/* Common function shared by both CPU hot plug and CPUIdle */
+static int __gs101_cpu_pmu_offline(unsigned int cpu)
 {
-	u32 reg, mask;
 	unsigned int cpuhint = smp_processor_id();
+	u32 reg, mask;
 
 	/* set cpu inform hint */
 	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
@@ -379,16 +426,111 @@ static int gs101_cpuhp_pmu_offline(unsigned int cpu)
 	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
 	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
 		     reg & mask);
+
+	return 0;
+}
+
+/* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
+static int gs101_cpu_pmu_offline(void)
+{
+	int cpu;
+
+	spin_lock(&pmu_context->cpupm_lock);
+	cpu = smp_processor_id();
+
+	if (pmu_context->hotplug_ing[cpu]) {
+		spin_unlock(&pmu_context->cpupm_lock);
+		return NOTIFY_BAD;
+	}
+
+	__gs101_cpu_pmu_offline(cpu);
+	spin_unlock(&pmu_context->cpupm_lock);
+
+	return NOTIFY_OK;
+}
+
+/* Called from CPU hot plug callback with IRQs enabled */
+static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&pmu_context->cpupm_lock, flags);
+	/*
+	 * Mark this CPU as entering hotplug. So as not to confuse
+	 * ACPM the CPU entering hotplug should not enter C2 idle state.
+	 */
+	pmu_context->hotplug_ing[cpu] = true;
+	__gs101_cpu_pmu_offline(cpu);
+
+	spin_unlock_irqrestore(&pmu_context->cpupm_lock, flags);
+
 	return 0;
 }
 
+static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
+					unsigned long action, void *v)
+{
+	switch (action) {
+	case CPU_PM_ENTER:
+		/*
+		 * Ignore CPU_PM_ENTER event in reboot or
+		 * suspend sequence.
+		 */
+
+		if (atomic_read(&pmu_context->sys_suspended) ||
+		    atomic_read(&pmu_context->sys_rebooting))
+			return NOTIFY_OK;
+
+		return gs101_cpu_pmu_offline();
+
+		break;
+	case CPU_PM_EXIT:
+
+		if (atomic_read(&pmu_context->sys_rebooting))
+			return NOTIFY_OK;
+
+		return gs101_cpu_pmu_online();
+
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block gs101_cpu_pm_notifier = {
+	.notifier_call = gs101_cpu_pm_notify_callback,
+	/*
+	 * We want to be called first, as the ACPM hint and handshake is what
+	 * puts the CPU into C2.
+	 */
+	.priority = INT_MAX
+};
+
+static int exynos_cpupm_reboot_notifier(struct notifier_block *nb,
+					unsigned long event, void *v)
+{
+	switch (event) {
+	case SYS_POWER_OFF:
+	case SYS_RESTART:
+		atomic_set(&pmu_context->sys_rebooting, 1);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block exynos_cpupm_reboot_nb = {
+	.priority = INT_MAX,
+	.notifier_call = exynos_cpupm_reboot_notifier,
+};
+
 static int exynos_pmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct regmap_config pmu_regmcfg;
 	struct regmap *regmap;
 	struct resource *res;
-	int ret;
+	int ret, cpu;
 
 	pmu_base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pmu_base_addr))
@@ -444,6 +586,18 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 			 */
 			dev_warn(&pdev->dev, "pmu-intr-gen syscon unavailable\n");
 		} else {
+			pmu_context->hotplug_ing =
+				devm_kmalloc_array(dev, num_possible_cpus(),
+						   sizeof(bool), GFP_KERNEL);
+
+			spin_lock_init(&pmu_context->cpupm_lock);
+			atomic_set(&pmu_context->sys_rebooting, 0);
+			atomic_set(&pmu_context->sys_suspended, 0);
+
+			/* set PMU to power on */
+			for_each_online_cpu(cpu)
+				gs101_cpuhp_pmu_online(cpu);
+
 			cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,
 					  "soc/exynos-pmu:prepare",
 					  gs101_cpuhp_pmu_online, NULL);
@@ -451,6 +605,9 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 			cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 					  "soc/exynos-pmu:online",
 					  NULL, gs101_cpuhp_pmu_offline);
+
+			cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
+			register_reboot_notifier(&exynos_cpupm_reboot_nb);
 		}
 	}
 
@@ -471,10 +628,32 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int exynos_cpupm_suspend_noirq(struct device *dev)
+{
+	atomic_set(&pmu_context->sys_suspended, 1);
+	return 0;
+}
+
+static int exynos_cpupm_resume_noirq(struct device *dev)
+{
+	atomic_set(&pmu_context->sys_suspended, 0);
+	return 0;
+}
+
+static const struct dev_pm_ops cpupm_pm_ops = {
+	.suspend_noirq = exynos_cpupm_suspend_noirq,
+	.resume_noirq = exynos_cpupm_resume_noirq,
+};
+#endif
+
 static struct platform_driver exynos_pmu_driver = {
 	.driver  = {
 		.name   = "exynos-pmu",
 		.of_match_table = exynos_pmu_of_device_ids,
+#ifdef CONFIG_PM_SLEEP
+		.pm = &cpupm_pm_ops,
+#endif
 	},
 	.probe = exynos_pmu_probe,
 };

---
base-commit: 2aeda9592360c200085898a258c4754bfe879921
change-id: 20250524-gs101-cpuidle-cafc96dd849d

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

