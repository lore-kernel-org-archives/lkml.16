Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7D02951B5
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007652; cv=none; b=TThbGckemEKpUcdtN6P3UD2m96kRCnwjzSs87fDQBsV3dMReIOyYv1mem1K32JB/UH/j+CdcodmUaXn1twTYJC+sPi9AjUYAWspjr+0j/RUARhCtYR2ZtSGMFUdxtOslCpcFpleo1bEqeRih7c6SSTW+ld2EWBxjxmEneEuNXa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007652; c=relaxed/simple;
	bh=WcF75pnqXotEsYTaAIFVCeSXbuTwse28sKqnHWInBJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDkztZhCmHrVgqqhrSi8r936AL8meLqR15mWgtrpmhK7/LJRGwGlpm5aybykzd4V7Zo9MPW6J9BWWgmEl4sL79HLWP0FTIyxFBBk3eklaoq4c6oxA3fb60EOxLNbUzbHet88h/PyrSVCrrf+oE85mnYMicRQrGtqa+imrM7UCs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rt5Mf0Eg; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rt5Mf0Eg"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b0d638e86so13766874e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007649; x=1748612449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMZdXJF8HQ4HBbVGnSNAyGkt9IprenNJaiH/9V7ofuE=;
        b=rt5Mf0Eg5tZEJJ+mdYv8QUxFbcJqhdsHxnKfo+vJ27/cBMgMs6Bj8ad7h2blhm+/GX
         1tmGKMz+f1Ifz83EjfHEYiFlyfP4WANbOYAnSJ7QV0m5dicc7UxebJOC6hR9xZMJ1K4K
         Vc+AIfAANog00rhxQ9RhOH5NWqcPw3rP1XKQ7LuuScUjtVg5VtkXuHvSioG4IYHuzuHy
         rGcrmFxNfgX4SzQ0IJHUkrsvSB4FZr+VnxrWXbgWf0kFi7MfhcBdJn1OcgNKb5Ug28cn
         2PKOFyGmEvrzWDVWr4TnRyfPxxTX8ElYoriE+rI0nsD+/9iMmYqdeucyp0M5f9KPFX4S
         HF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007649; x=1748612449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMZdXJF8HQ4HBbVGnSNAyGkt9IprenNJaiH/9V7ofuE=;
        b=ukijNbdlX/nTYbOprxOoqv/Qw7zdu69BPEXLexE7NbVym4Oh8QxGr0VfrKdjK8Jy9K
         /E3zaGvQAkdtZp78eu6ohA0eZSecLLGmMEiIjM/w/3SRrKLKtaQwvpbAXzsgtTVQam+O
         h/DJd1ujnqx0zDTthEdf3vmchiOsfe6qbYUuRcSUqFTvvSQYCZOjFjG1lWRQw6ceTUyQ
         pUWudEv2ZOC1wqepiyoONbKjp/O5FXbTU2dVEYGCYF0HcTTLJK9WV9WjBSxK05gSm4/X
         a7dw1dSkxWntVtm88iQ6DN+IUNmy47OtCLMhD58o2n4SpPGHiPzELcbqRRIDDuWC3Q/B
         gmBg==
X-Forwarded-Encrypted: i=1; AJvYcCUQg3c4GL6xmf9PZHoxF9WHLQdiSyDEon9zJwnQmR1kQGj4qLHLiVvrp+o7woYAePq+nA5dxvYQkYtr/1U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfkzx8KudHYpTxs+2W3sanKStoBoeeiykvRXXzvLhW4lsKKkeJ
	2+YPXpy4avsj1jQ8H+gySlhsFLhB3lQ7et2Y0/eTqxUm/Czh8PI0uxU9jxxZYR4zbPc=
X-Gm-Gg: ASbGncuG0s1jPt1jnC5TWjvxo9AOuE0Y4DYHxACHwGBFp0r9lq84I/7eantzi8lWPHM
	3Rco1LKY3H49Zydi5CnE50LdWohSpGKR2rT8xWiF+kaoxmEFSURbYb+Pz/he3GNgeur+A4YejQk
	UUHjwPvMBCK8IYofbV4nFrjrL9d9rzvPLf1Fpm7Sx7MyjSyfLu9II3mYlo4HD8mnfkEx/6PiCNt
	5LfKT7MDtQV73zR6v+/ZUK9yNRqQx27PuX4b3EoulvXVuzupcwyizwo8FHzZb1dK3arlp/PHIXX
	psgNZEcpJk7oNxehnnt+w405gkFJ5DqkgtC2Y/xsKu1MxtaysAFf47wdP4dirW5Jiyw+OCo330a
	1OLPJATexGtUyHMRPeJTkYG7YTw==
X-Google-Smtp-Source: AGHT+IGvEYgNGoCkD4rXMPLf1i5EyasJT4rgUzgZY4MikEpEuIPRUFRo0vKJ3KsJupVkoZwFT+4GMg==
X-Received: by 2002:a05:6512:10cc:b0:54e:86f3:5e65 with SMTP id 2adb3069b0e04-550e9966d43mr9793624e87.56.1748007648818;
        Fri, 23 May 2025 06:40:48 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:48 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/21] soc/tegra: pmc: Opt-out from genpd's common ->sync_state() support
Date: Fri, 23 May 2025 15:40:03 +0200
Message-ID: <20250523134025.75130-7-ulf.hansson@linaro.org>
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

Tegra implements its own specific ->sync_state() callback for the genpd
providers. Let's set the GENPD_FLAG_NO_SYNC_STATE to inform genpd about it.

Moreover, let's call of_genpd_sync_state() to make sure genpd tries to
power off unused PM domains.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/soc/tegra/pmc.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 51b9d852bb6a..ef486387ccd9 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -418,7 +418,6 @@ struct tegra_pmc_soc {
  * @irq: chip implementation for the IRQ domain
  * @clk_nb: pclk clock changes handler
  * @core_domain_state_synced: flag marking the core domain's state as synced
- * @core_domain_registered: flag marking the core domain as registered
  * @wake_type_level_map: Bitmap indicating level type for non-dual edge wakes
  * @wake_type_dual_edge_map: Bitmap indicating if a wake is dual-edge or not
  * @wake_sw_status_map: Bitmap to hold raw status of wakes without mask
@@ -462,7 +461,6 @@ struct tegra_pmc {
 	struct notifier_block clk_nb;
 
 	bool core_domain_state_synced;
-	bool core_domain_registered;
 
 	unsigned long *wake_type_level_map;
 	unsigned long *wake_type_dual_edge_map;
@@ -1297,6 +1295,7 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 
 	pg->id = id;
 	pg->genpd.name = np->name;
+	pg->genpd.flags = GENPD_FLAG_NO_SYNC_STATE;
 	pg->genpd.power_off = tegra_genpd_power_off;
 	pg->genpd.power_on = tegra_genpd_power_on;
 	pg->pmc = pmc;
@@ -1406,6 +1405,7 @@ static int tegra_pmc_core_pd_add(struct tegra_pmc *pmc, struct device_node *np)
 		return -ENOMEM;
 
 	genpd->name = "core";
+	genpd->flags = GENPD_FLAG_NO_SYNC_STATE;
 	genpd->set_performance_state = tegra_pmc_core_pd_set_performance_state;
 
 	err = devm_pm_opp_set_regulators(pmc->dev, rname);
@@ -1425,8 +1425,6 @@ static int tegra_pmc_core_pd_add(struct tegra_pmc *pmc, struct device_node *np)
 		goto remove_genpd;
 	}
 
-	pmc->core_domain_registered = true;
-
 	return 0;
 
 remove_genpd:
@@ -4262,8 +4260,25 @@ static const struct of_device_id tegra_pmc_match[] = {
 
 static void tegra_pmc_sync_state(struct device *dev)
 {
+	struct device_node *np, *child;
 	int err;
 
+	np = of_get_child_by_name(dev->of_node, "powergates");
+	if (!np)
+		return;
+
+	for_each_child_of_node(np, child)
+		of_genpd_sync_state(child);
+
+	of_node_put(np);
+
+	np = of_get_child_by_name(dev->of_node, "core-domain");
+	if (!np)
+		return;
+
+	of_genpd_sync_state(np);
+	of_node_put(np);
+
 	/*
 	 * Newer device-trees have power domains, but we need to prepare all
 	 * device drivers with runtime PM and OPP support first, otherwise
@@ -4277,9 +4292,6 @@ static void tegra_pmc_sync_state(struct device *dev)
 	 * no dependencies that will block the state syncing. We shouldn't
 	 * mark the domain as synced in this case.
 	 */
-	if (!pmc->core_domain_registered)
-		return;
-
 	pmc->core_domain_state_synced = true;
 
 	/* this is a no-op if core regulator isn't used */
-- 
2.43.0

