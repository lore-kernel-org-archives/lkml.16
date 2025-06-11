Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCED22689C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749611448; cv=none; b=MEVP4ImWtghpWqMTAwj2KLL+e7eeCIyf1tYqiUkMXuLVc/NVS2OJxRsetw4O8qrm4FFDNV7ymst0tDo05FQLblrNoRg8OcbQwiUC0wVAno5DGHihj9b+VdZ7LrpurzHDFYFgHC77GH7aHLoMqiLgyUOeafW4ShzzqYB2l0u2CPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749611448; c=relaxed/simple;
	bh=KrEgTlTKNYpqIt4xZ0P452kHDiRYhHzjwpzLwEUokjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=DwBGXr/RscY9AjUDqKkSB7MplIeAJO4QK8hQY3KKWP5nDTRZJ+gOKjQWowjXHMlrdC9pHYwiHs3YP0lbEKWoZlyOuZ3pr5v4AbLbFxpkwUWXc9I6ZviWrRcDNghtaZAZDlcjkk8yRZGOBLorW+EbZ1UFGNkzlvWmaKeU3RPr9+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=W2XyUIum; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="W2XyUIum"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234d366e5f2so70039675ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 20:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1749611446; x=1750216246; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d1JqEGYxVH+Ie0t+M4xdy6Q//NYQPkO37iVKF4LgSqk=;
        b=W2XyUIumYJ8WJWVO2hcxqnqFsixtTnsU0aQp6EhJc0OckOY4i6posrezgi9cP4RSrg
         2Ibv++myFxCL6ZCBHsrH3kJyhmyaqtWnWVIjLHNE3S4zv1TxG2bU/0mbmV8m3gQ6aTMP
         RUcMuMCeDgYse/WS61FdiNfWrYtYM1L7xrW3kkimM9LQoFPHyF5XspLFwZTcjznsW7Ul
         SdgfZ4GXGcGxAUsvuj4g9+uorgRURymfSJmHaVVEksOPdNO42wfqdeGM5uXv0tcCC46i
         JtVKmAc4TrjCcMGMh2uR8JxbgGlAwRwKxyEo7kBWgVxA7nAsdnrjO6peyUOVyi01jRtU
         mFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749611446; x=1750216246;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1JqEGYxVH+Ie0t+M4xdy6Q//NYQPkO37iVKF4LgSqk=;
        b=RcXeMa9JVdJg3/FMPhJTnUcYs2slUtYNFHyPeuUl0CdyNLc0sf6F3R448/qN7byX1s
         5v0bhOXVhxSRZqbLyGzuBo4qRdbo2BnW20U/7kVE22cNlFMtZfzLUcHqKEAQI7qjLOeU
         yL1blD4b5m8I4Uk/c5l1iATWl+9K1vx6BBIzS8WlfkK8X3NHfFtv2jqrURuTuo6NH8zF
         cl6l88eVIxBeoqRAnWPLD/0C3z8Vhes4m2XO387N9mD2mzsyP5Vd4/thT36RKtiPQB7e
         BKcFf4q8rV9Y4QVlQ8tL89u/fLWAq5DAGo136PjbY3p4QG02g7E75KD/jsculXCS0qzS
         CyGg==
X-Forwarded-Encrypted: i=1; AJvYcCWtxI1mOP7szxgnErdssJVvht7Xncg26ake1C7OA0B6yI49Bn4WGzH+WcZBgAVf1R96MRLCFB3X/hZ9QVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCfGZGBfroOHoCflFOCKDsR1+wmmfIBSb6RaJzTDJVZo+q8w6p
	OabdCwTaknsYvUp7tESjLGCu2xe+VY5+OSXdnBZO9MvBqRgqReNd8TjsgAOQK7BmA48=
X-Gm-Gg: ASbGncs59HxhZfHUAO7cHa135lR16+3/03NxadEKMW44KZGpT5owU4gUD3GrULVpHnp
	kXEjv7Kqq3NzDeQUMd0rdoVfjdl+wfUonfNtLPubTn/PP5354r+FI44GkqFAIgfTTcxqCt0xv+T
	ChZQ3YHfolO/82/UIq8DG4q9CLO06dUnfcy5mC96NVNCxhifxamI0Y0T0SudRVwd4kKCDbATwIg
	twIey+rYFT0Fcx6bWOswQrcszeJ/JS09ri3wB9e3B8RwsU+Go9KhO0txDoPAfLtuy2SaQO5SyG1
	FDLZb47pAcsanSiEh33W1XDFPQ4Y5Lqkdc9t3W9ur1k+Vz9se8/mIXxXwQG0hL9BpjwXhMI6a5c
	fYr++jT/zFTX9lwSonIU=
X-Google-Smtp-Source: AGHT+IG0HUndhOWNBFfl4fKV1QgjHGpPPezok587Gqjk8idox7vCs0ZKIJPZwB64MsRnAjYqekYvnA==
X-Received: by 2002:a17:903:2390:b0:234:e7aa:5d9b with SMTP id d9443c01a7336-23641ab511amr21843485ad.23.1749611446469;
        Tue, 10 Jun 2025 20:10:46 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030789c2sm77669035ad.29.2025.06.10.20.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 20:10:46 -0700 (PDT)
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
Subject: [PATCH v2 2/3] cpuidle: riscv-sbi: Work with the external pmdomain driver
Date: Wed, 11 Jun 2025 11:10:21 +0800
Message-Id: <20250611031023.28769-3-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250611031023.28769-1-nick.hu@sifive.com>
References: <20250611031023.28769-1-nick.hu@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

To work with the external pmdomain driver, exposing the
`sbi_cpuidle_pd_power_off` and `sbi_dt_parse_state_node` so the external
pmdomain driver can parse the riscv idle state data and set the domain
idle state where powering off. In addition, defer the driver without
error message when the parent domain is not ready.

Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 17 +++++++++++------
 drivers/cpuidle/cpuidle-riscv-sbi.h | 20 ++++++++++++++++++++
 2 files changed, 31 insertions(+), 6 deletions(-)
 create mode 100644 drivers/cpuidle/cpuidle-riscv-sbi.h

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 0fe1ece9fbdc..d53254601522 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -27,6 +27,7 @@
 #include <asm/suspend.h>
 
 #include "cpuidle.h"
+#include "cpuidle-riscv-sbi.h"
 #include "dt_idle_states.h"
 #include "dt_idle_genpd.h"
 
@@ -188,7 +189,7 @@ static const struct of_device_id sbi_cpuidle_state_match[] = {
 	{ },
 };
 
-static int sbi_dt_parse_state_node(struct device_node *np, u32 *state)
+int sbi_dt_parse_state_node(struct device_node *np, u32 *state)
 {
 	int err = of_property_read_u32(np, "riscv,sbi-suspend-param", state);
 
@@ -325,8 +326,9 @@ static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
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
 
@@ -356,7 +358,7 @@ static void sbi_cpuidle_domain_sync_state(struct device *dev)
 
 #ifdef CONFIG_DT_IDLE_GENPD
 
-static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
+int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
 {
 	struct genpd_power_state *state = &pd->states[pd->state_idx];
 	u32 *pd_state;
@@ -533,8 +535,11 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
 	for_each_present_cpu(cpu) {
 		ret = sbi_cpuidle_init_cpu(&pdev->dev, cpu);
 		if (ret) {
-			pr_debug("HART%ld: idle driver init failed\n",
-				 cpuid_to_hartid_map(cpu));
+			if (ret == -EPROBE_DEFER)
+				pr_debug("idle driver probe deferred\n");
+			else
+				pr_debug("HART%ld: idle driver init failed\n",
+					 cpuid_to_hartid_map(cpu));
 			goto out_fail;
 		}
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

