Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F08297A51
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007676; cv=none; b=mnMebA7vKGrbJUkddQngbU/LGeGqDVcQewU6mZb+8fANpmR1nrV9HYUjn3K2xq1SPJ3USuz1s33Sr3G78COhXJnzoajvzgOdHuRb7YktDpsG3ZEQI07nShSiuxwyVHCmrH+sZOp/uFRiGyMNnts45IIJLI151GJ1pCRG7rME/q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007676; c=relaxed/simple;
	bh=cUPVPfOLqbKbGTZ9buOjuzMp47UCVQpzZR5BzbuI17A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3dgeoA6jIW8gBpNJy1E0PTnuc9fs2jVfapqE3FTdtONalPXp2hy4OtCGIO/F4724NTuz/gjiQa1UurWz6+bc0EmchWm2oiI2kL/Os/Pri4r0PeqPUEIG01mjBGqDI3jG2AVoP7b637s6voeWfPW+ihQCacmIpDgjXE4PmWOZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rQH4OHk2; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rQH4OHk2"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-551f0072119so1145151e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007673; x=1748612473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGyEwCJhPN1ZKDIimFxnLW+xEyMfXf8H84gi9aCiP1o=;
        b=rQH4OHk27026Huv+aUSNiCciMgwT+9NnCTPgwT2sr/OmHh5/Ly3bGay9CeMIOyRnvi
         zajmFV19CXTV1qVVg/gY69fAjeJMtdsMwHSovJrm4L8P+kyJAIZ5Qvru2A4e6VdcZWi4
         C1CJN5lk14bLW2cdRsWshYVEkSiGFje/+dxz3qyBIrOWc1pQixhSnMVcwmYB2bNGBA3h
         49Mqon4rlfzL7hml/Gwbkx3OFgktBwDjZFTYUJD9co4M9lUnXxU/OIrQ6NLrMnI4kLa6
         i6/m4Zt1yNNdRstCv4h5l0a6s+URja6+KCEyjUVdOZJMJ/84kwdXFxTpw85laeDR+fo2
         cYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007673; x=1748612473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGyEwCJhPN1ZKDIimFxnLW+xEyMfXf8H84gi9aCiP1o=;
        b=evuSFLdeojzqa8P+cGWvhbtuHoNcE8p+Sqf3Wg64QKqKvurgrGlQUZwU0DkFEWd415
         xEyHndo3UwFxX3uQiLAHOtNU3ye2lxWaP9kxHZ+LSlSFxeLyeCqWhuB6CFn4GiwGmcoE
         wzunW3/6u6pMHKyYGHHV4iB+Q4ssSHRqoj9IBFgL6dKPEQpTWK4SRQpc6mQVSCLrw7Mr
         Ue46KQr8UvDFTPJI6UZnIiu8kq0CnpVsOY54XTrqDWkqpnUp6wxeFSG5W0DzKV4crw6G
         kpDu8pjzEdKTM7nDNRLc6niq6TyS1NXDL8kI6m4htosW0eyQyQKUf8ANRHlaK9rxJp5F
         Zj+w==
X-Forwarded-Encrypted: i=1; AJvYcCWRmFARdPFwWVhdgm5+60YwOgT7DkgCN8wAMk87cBGXPn+4r7p440fgxDz6rx/jFS7sUAk9Nyt6glVnZvg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu3jldy46XtmFtQWTIj7NkETSN2zZ509jcvq45fmfzmkMv06Rj
	7LUhvjb2kOVhjJArtqy6/WyZVF3jgVj+C5OtOOscrm3MjByzDE0tlfCuo72EsJPX+Ww=
X-Gm-Gg: ASbGncsQCYujlofnx7lWm1ATy+CkAa4iyfzdhvZUytKs6N4aKdeQM+wd+MhIlY45gBs
	stmNKihPAwvsUyQWHX0VcmbijNoNJOJGoqvfp0vBInViWoKliJl/ziqMHKWDCQTGgGS31tdR1r7
	vyzTu6sBPH0Y8OIPRfJrALrjqM56ZSrs9zI0ikh7vwTNi4SSAymhRdfyZedd3ZWqlqX43SZN45Z
	3P7kE0bDw4HPgO6XPqIS/4NEaQfPN99D/26t5ZJvj1UXMh092/S8E6LEJLBhrRBOZlcH4VI/6Sk
	MH8PBuybpJxiw/f5b0tCgpCh/8DulxOvkAljoUXws1Kue34zyFCyIaRjuTemhVW+orYByO4EwF2
	VzYyt1wxm7LIo1A19lrD47Mhp1g==
X-Google-Smtp-Source: AGHT+IGPyCQFUdzHIALfteU0vTerPpV7oILLzxQIlLInZMqH94Tb+MaxZdvt9CEg2iCH7sWV6l9Bng==
X-Received: by 2002:a05:6512:3ba7:b0:54f:c1cc:1241 with SMTP id 2adb3069b0e04-552156cc6a3mr1224907e87.25.1748007672736;
        Fri, 23 May 2025 06:41:12 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:41:12 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 21/21] cpuidle: riscv-sbi: Drop redundant sync_state support
Date: Fri, 23 May 2025 15:40:18 +0200
Message-ID: <20250523134025.75130-22-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recent updates to the genpd core, can entirely manage the sync_state
support for the cpuidle-riscv-sbi-domain. More precisely, genpd prevents
our ->power_off() callback from being invoked, until all of our consumers
are ready for it.

Let's therefore drop the sync_state support for the
cpuidle-riscv-sbi-domain as it has become redundant.

Cc: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 83d58d00872f..a360bc4d20b7 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -44,7 +44,6 @@ static DEFINE_PER_CPU_READ_MOSTLY(struct sbi_cpuidle_data, sbi_cpuidle_data);
 static DEFINE_PER_CPU(struct sbi_domain_state, domain_state);
 static bool sbi_cpuidle_use_osi;
 static bool sbi_cpuidle_use_cpuhp;
-static bool sbi_cpuidle_pd_allow_domain_state;
 
 static inline void sbi_set_domain_state(u32 state)
 {
@@ -345,20 +344,6 @@ static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
 	return ret;
 }
 
-static void sbi_cpuidle_domain_sync_state(struct device *dev)
-{
-	struct sbi_pd_provider *pd_provider;
-
-	/*
-	 * All devices have now been attached/probed to the PM domain
-	 * topology, hence it's fine to allow domain states to be picked.
-	 */
-	sbi_cpuidle_pd_allow_domain_state = true;
-
-	list_for_each_entry(pd_provider, &sbi_pd_providers, link)
-		of_genpd_sync_state(pd_provider->node);
-}
-
 #ifdef CONFIG_DT_IDLE_GENPD
 
 static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
@@ -369,9 +354,6 @@ static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
 	if (!state->data)
 		return 0;
 
-	if (!sbi_cpuidle_pd_allow_domain_state)
-		return -EBUSY;
-
 	/* OSI mode is enabled, set the corresponding domain state. */
 	pd_state = state->data;
 	sbi_set_domain_state(*pd_state);
@@ -401,8 +383,7 @@ static int sbi_pd_init(struct device_node *np)
 	if (!pd_provider)
 		goto free_pd;
 
-	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN |
-		     GENPD_FLAG_NO_SYNC_STATE;
+	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
 
 	/* Allow power off when OSI is available. */
 	if (sbi_cpuidle_use_osi)
@@ -570,7 +551,6 @@ static struct platform_driver sbi_cpuidle_driver = {
 	.probe = sbi_cpuidle_probe,
 	.driver = {
 		.name = "sbi-cpuidle",
-		.sync_state = sbi_cpuidle_domain_sync_state,
 	},
 };
 
-- 
2.43.0

