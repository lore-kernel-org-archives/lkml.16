Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C3A23E350
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447590; cv=none; b=pkgAWVpchELggLAdp6ozCpT+S+YQqk2mNEg1C8Z/Sr2OAqvoCmps0bxdp4FlDXZVjwaJ+mkP4oAnpwdrefoq2XWobti7pbMG5qypCIOhaHe+v16zuTpL0cip+7UNpoKKCFbZ3LpfSfxeprYCsK+7mW+cLFH3NmYUCA4Y2rSeuoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447590; c=relaxed/simple;
	bh=OPEy6ZWX+tLFSyWVop0YvN+Dtq3RDFjs+iqPy7PtJT8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=HpfRuGSIFOL2Hxn78roumhhQNylciOPffF98n2pRK9ZqJik4+RvvpIEoAvHKAd/LTIBuun8inxBHdtvn5POSh1AnQqw6CACD6k5Nm9SXppRvsAplbkbvup8xsoczrbBb8cLFUGlQxCAnwoiwidSCgiWTfi1+kwxRH3kSALQPZ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=mImfGX30; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mImfGX30"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d425fc4e5fso545698785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751447588; x=1752052388; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KHzlGdMwQxoYI42j0/Tje1yOd002VzLUSjXq3Zpp2lQ=;
        b=mImfGX30Fx51BxpoWorAUBrEQYBmnU/ffaLGq3nsFbXfLh4c0Kna0Rec2GVqINMCvC
         6wrn+EBoCrKT/Hp0qrVzA9Ghmmb8neczzhqXmQ/S/Hjwdhzm0tzMJ1SXR6cazMz4aIuB
         wvm5SA/sSkmEYysJE2nsvzcHFTJbkuGWLwZ7CkCRIYXKkA7VCuOTaWzt0/XyiZvJe8N7
         Mk112bF8PzCzytZ2hizLXlnycvUhHeXGh0pgtoyr0HEEH6IN2bUn5/zz7hh1fouNOvWu
         jIY2HNRBNxd2n5Jpc5ssqJ/E15MYvBxXvud9rv8OiCTjzzSWSnnjyemAvCl14Y7TJDxM
         iMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447588; x=1752052388;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KHzlGdMwQxoYI42j0/Tje1yOd002VzLUSjXq3Zpp2lQ=;
        b=kSb538mH4owlD+fPvWaEvz/ROoZbH1anC6UNnTuhBVrJJnOFLHY9VlLf9hobuCSM8M
         Lnu+XVqjrLaIulEKXfSiMS59Xs98Ak3NW40CExbyQSswg6rzyyieh7DsHf5mGJS63lhf
         rpRjkuUTK+J2oV2eOJ+3T57gLQC7gk3adX4BLj2ilTofNmeY4UyjCIEA1LDMIicH5gQW
         wP6mc8lNim/FR+Z/d5KTGFyiKdy2t0MZS2xAmf//+gezJ4JJKFM3hymlNL2dnneWJCk3
         YMn1UM/MCDgPkcW6JZsHc7iV6EjkChEqVJiEozeOOpLWGnTKCV2bmeMs+pxjUV1HrAmx
         oyng==
X-Forwarded-Encrypted: i=1; AJvYcCXxLP36fSCahU8CoBiRc3HRhEgIOEYlSkhEsX2euGYKCy05fMuSn56iDa5hA7Wn0ESHrnb8VwNYPW2HVGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQub0JWO1kmF17IseJoqAxnUD6mmHDL7Ltc5nies2KgWKgR09z
	0lCmWlWmNNd+9E9pY7IupK1cH2q/4Giqa+5MjaO5YvixmH5HYH1vCEkSR9im3Iq3WVc=
X-Gm-Gg: ASbGnctakhufmOZmAsWGZHTS93m4N9dKihRDVBMsByBZTfXpBIp7CGYuu4JWq0ihJdG
	1GqtfC9ZmrmZpeFbYVZqG90dfLiOF/fPU95nibpXVtnK7lY16qT0s5Q9zx6fCgyvtBs6k5AvL2L
	AvfRsmhwjpQgN5bpZPurKj5dE9wKmkZ6ymojMR3Y8YFDMbVQC7+SJ/6EFXqleKjs+NB5hvfkc4o
	KizbQJ/xl/Fxahcg6bJFFE6S0BxGtoYotQBZpXpBw56PDIzpVh1uR2CAGZBnTjUH/9sv+LCxmb+
	m7g9nuLReflSDBQY6mi24O9jFo0bR9bA0nGzHfV+kP+33pJXLbAavESw6cNNRGignzx4gbKWrSX
	Ydh120dk8
X-Google-Smtp-Source: AGHT+IH35dTpRZYzuojWxWpu+46mPK8pBpHMUsqRqtbAP72WybmXXi1h3qyzhULS+BwBb0Rk/+L3YA==
X-Received: by 2002:a05:620a:27d6:b0:7d4:587e:c322 with SMTP id af79cd13be357-7d5c46a6254mr312983285a.22.1751447587687;
        Wed, 02 Jul 2025 02:13:07 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d4431344f7sm911736285a.2.2025.07.02.02.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:13:07 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v3 2/3] cpuidle: riscv-sbi: Work with the external pmdomain driver
Date: Wed,  2 Jul 2025 17:12:35 +0800
Message-Id: <20250702091236.5281-3-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250702091236.5281-1-nick.hu@sifive.com>
References: <20250702091236.5281-1-nick.hu@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

To work with the external pmdomain driver, exposing the
`sbi_cpuidle_pd_power_off` and `sbi_dt_parse_state_node` so the external
pmdomain driver can parse the riscv idle state data and set the domain
idle state where powering off. In addition, separate the genpd init and
the idle driver init. The genpd remains functional even when the idle
state is absent.

Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 46 ++++++++++++++++++-----------
 drivers/cpuidle/cpuidle-riscv-sbi.h | 20 +++++++++++++
 2 files changed, 48 insertions(+), 18 deletions(-)
 create mode 100644 drivers/cpuidle/cpuidle-riscv-sbi.h

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 0fe1ece9fbdc..be3949971eed 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -27,6 +27,7 @@
 #include <asm/suspend.h>
 
 #include "cpuidle.h"
+#include "cpuidle-riscv-sbi.h"
 #include "dt_idle_states.h"
 #include "dt_idle_genpd.h"
 
@@ -43,7 +44,6 @@ struct sbi_domain_state {
 static DEFINE_PER_CPU_READ_MOSTLY(struct sbi_cpuidle_data, sbi_cpuidle_data);
 static DEFINE_PER_CPU(struct sbi_domain_state, domain_state);
 static bool sbi_cpuidle_use_osi;
-static bool sbi_cpuidle_use_cpuhp;
 static bool sbi_cpuidle_pd_allow_domain_state;
 
 static inline void sbi_set_domain_state(u32 state)
@@ -171,9 +171,6 @@ static void sbi_idle_init_cpuhp(void)
 {
 	int err;
 
-	if (!sbi_cpuidle_use_cpuhp)
-		return;
-
 	err = cpuhp_setup_state_nocalls(CPUHP_AP_CPU_PM_STARTING,
 					"cpuidle/sbi:online",
 					sbi_cpuidle_cpuhp_up,
@@ -188,7 +185,7 @@ static const struct of_device_id sbi_cpuidle_state_match[] = {
 	{ },
 };
 
-static int sbi_dt_parse_state_node(struct device_node *np, u32 *state)
+int sbi_dt_parse_state_node(struct device_node *np, u32 *state)
 {
 	int err = of_property_read_u32(np, "riscv,sbi-suspend-param", state);
 
@@ -213,10 +210,6 @@ static int sbi_dt_cpu_init_topology(struct cpuidle_driver *drv,
 	if (!sbi_cpuidle_use_osi)
 		return 0;
 
-	data->dev = dt_idle_attach_cpu(cpu, "sbi");
-	if (IS_ERR_OR_NULL(data->dev))
-		return PTR_ERR_OR_ZERO(data->dev);
-
 	/*
 	 * Using the deepest state for the CPU to trigger a potential selection
 	 * of a shared state for the domain, assumes the domain states are all
@@ -226,7 +219,6 @@ static int sbi_dt_cpu_init_topology(struct cpuidle_driver *drv,
 	drv->states[state_count - 1].enter = sbi_enter_domain_idle_state;
 	drv->states[state_count - 1].enter_s2idle =
 					sbi_enter_s2idle_domain_idle_state;
-	sbi_cpuidle_use_cpuhp = true;
 
 	return 0;
 }
@@ -282,7 +274,6 @@ static void sbi_cpuidle_deinit_cpu(int cpu)
 	struct sbi_cpuidle_data *data = per_cpu_ptr(&sbi_cpuidle_data, cpu);
 
 	dt_idle_detach_cpu(data->dev);
-	sbi_cpuidle_use_cpuhp = false;
 }
 
 static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
@@ -325,8 +316,9 @@ static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
 	/* Initialize idle states from DT. */
 	ret = sbi_cpuidle_dt_init_states(dev, drv, cpu, state_count);
 	if (ret) {
-		pr_err("HART%ld: failed to init idle states\n",
-		       cpuid_to_hartid_map(cpu));
+		if (ret != -EPROBE_DEFER)
+			pr_err("HART%ld: failed to init idle states\n",
+			       cpuid_to_hartid_map(cpu));
 		return ret;
 	}
 
@@ -356,7 +348,7 @@ static void sbi_cpuidle_domain_sync_state(struct device *dev)
 
 #ifdef CONFIG_DT_IDLE_GENPD
 
-static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
+int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
 {
 	struct genpd_power_state *state = &pd->states[pd->state_idx];
 	u32 *pd_state;
@@ -529,6 +521,27 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	/* Attaching the cpu to the corresponding power domain */
+	if (sbi_cpuidle_use_osi) {
+		for_each_present_cpu(cpu) {
+			struct sbi_cpuidle_data *data = per_cpu_ptr(&sbi_cpuidle_data, cpu);
+
+			data->dev = dt_idle_attach_cpu(cpu, "sbi");
+			if (IS_ERR_OR_NULL(data->dev)) {
+				ret = PTR_ERR_OR_ZERO(data->dev);
+				if (ret != -EPROBE_DEFER)
+					pr_debug("Hart%ld: fail to attach the power domain\n",
+						 cpuid_to_hartid_map(cpu));
+
+				while (--cpu >= 0)
+					dt_idle_detach_cpu(data->dev);
+				return ret;
+			}
+		}
+		/* Setup CPU hotplut notifiers */
+		sbi_idle_init_cpuhp();
+	}
+
 	/* Initialize CPU idle driver for each present CPU */
 	for_each_present_cpu(cpu) {
 		ret = sbi_cpuidle_init_cpu(&pdev->dev, cpu);
@@ -539,9 +552,6 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* Setup CPU hotplut notifiers */
-	sbi_idle_init_cpuhp();
-
 	if (cpuidle_disabled())
 		pr_info("cpuidle is disabled\n");
 	else
@@ -556,7 +566,7 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
 		cpuidle_unregister(drv);
 		sbi_cpuidle_deinit_cpu(cpu);
 	}
-
+out:
 	return ret;
 }
 
diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.h b/drivers/cpuidle/cpuidle-riscv-sbi.h
new file mode 100644
index 000000000000..f39186b65a10
--- /dev/null
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __CPUIDLE_RISCV_SBI
+#define __CPUIDLE_RISCV_SBI
+
+#ifdef CONFIG_DT_IDLE_GENPD
+
+int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd);
+
+#else
+
+static inline int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
+{
+	return 0;
+}
+
+#endif
+
+int sbi_dt_parse_state_node(struct device_node *np, u32 *state);
+
+#endif
-- 
2.17.1

