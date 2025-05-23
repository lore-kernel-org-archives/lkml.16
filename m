Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D99C295D97
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007661; cv=none; b=c3D1WEWgwfrs1WdEe5hY1DP5JrjY/glfRsjnmGJAPz+h4mhkeiH7Ng+/3wQkyvUDZT4bBV9wYMQepH4vqWYsv5kivrEPU7nCJEZFMEVZ3HUCiE+62VJM7SsoRiDFA4xOOoXwLd/LpYvB5ymOGzhovPW7nLTAWVsVO2mjG3N5cHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007661; c=relaxed/simple;
	bh=S60R5V/pPXQ74Qcu0WmrzCZGgGMF0WRf6YeAjT2i5xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lnz6HfOvJ7dZWlON1gQF39qw+o1oo3A65VDuvOcb7AjSP4YRyajUMCb9a73SRPjbZrdBeUs2SWYVb4zxwCus9wQ5X7eGS4H9gHb0s+oFgf8gyiC1HvcFne6OcY3xX/YPTl0lE8VOOkzNVxN2zBu3Zy6swnk6zU88t7NihtpazvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l5IYs9xH; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l5IYs9xH"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54e816aeca6so12729845e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007657; x=1748612457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TaodTG452ygjUfeAqfzX0hcEID7mM0/biHJ7FoGpgVo=;
        b=l5IYs9xHkeDTDEX1Y8EiRhyWAbfS3gEwRpJ21TQV8IRGZoLRucYM7yk96NXVRCmI/X
         sAYXT+GGknL4RIUQcyjR9uOxkuEgf3RxkKquQqAdhGEB6DL7R2gfkZnYl1jtXLB0wxBw
         ogl0z6lnTz21MkboxUoKJnwy3S9DjSxYD3B1cjtsDr0eQMda0OzI0/MozsPjLJm2+w5W
         0MUKsSgYlTDpJhNDD44audMgsuLT1bug/B/kJr1iU+gsOKovdoOznKGwnSuzWd/pQOTP
         j2zuQxTDpDAk9dVprexdE6HfW/PCIPJq2CN4sJfWuWa2MUm0KBUgN7rM2YtL0fR4ld7T
         lyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007657; x=1748612457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TaodTG452ygjUfeAqfzX0hcEID7mM0/biHJ7FoGpgVo=;
        b=g72ISZxcbOxng6gQU24WIAqTm07LUGi2UgHXnPo0FJZqrf3whsfoWftoo2jUsTYckd
         ETqo9B85K5SgmIt7knjCmB4PXaJAyqcy6tPzUmBh2mHPgFomA932tTe7PLMF6Dk5q6k4
         dVpDSdWOafnSfZBo3u3Zf24e3d3ef6CGjvbicS+O0W9NK4L+zVIiKhP2sHANTiHg2efH
         3ogeJWfuN+bU7jiKeZeeUgjUSJk+hPfQfv5q2ZozMCD4KzGbXsdxZWhm8a/mwI17k5WS
         zRCnzVZAVOdq2t6ulM8tjllKYo3YoIK4gIxF7H6sGRo/SYDvSPYeHBKXochkhcmEI44t
         g08w==
X-Forwarded-Encrypted: i=1; AJvYcCVyE4tsKVBQSGGIQbi6UvruLn6h8H3TnLp2KCpsJSEa92LEWRbSv3hQaL0b9gy33h2HlGSl/8BgWzymqhY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcz7kjvmY2GyNZI1Un17Q6SPQ5cORxqfufwaiZIygaUW6hvs5E
	gq+W035FIaz9aXhtZoXF/e/a7/0pBkefqLyZB2j7eU2/3eeB8tJT9lgQZux6rSPLPvE=
X-Gm-Gg: ASbGnctdqFlZAVF3xt0YBUb3rVs0hGQ8wDu3amMcW7kph7EmwPQoxU8hyCxnHLvoRsA
	F7EAgTD0JRhhbSi/oysKcAFSaNyVr/IH4XFsOQVj2v7yrZ82b7g/jgTIx3WkPsVHGKvQ936vVWL
	9H1SWniEELuN6xkYmfWjqTg1EXLwgfQuSk1yXOHOKEvkAWNPtADyijzkL62b5Vb4LWfAdS67lSm
	V7HQ2sA4ky7yJ39qRlqw8uogW16+9rDonC8AyfGN0KYw5m841eKCEhbgjC/A+pAzIJf+ZLB6XZD
	fNjrNviQz5D1YHiiN7uumP+IRRRsKWF/PNmTGi7eP/ZcNcnXYcVLe9PTmZelyW53JSlezwwYnq0
	F9lwMcaepeYiJLMMEPPLuETC9sA==
X-Google-Smtp-Source: AGHT+IHrYinBpOd90/7cqZZUAtcZLCgKCB9acewmFqtCkeLzwOOJRxqmBPoVSqry9v+2LJB1zYOmGA==
X-Received: by 2002:a05:6512:6081:b0:550:d534:2b23 with SMTP id 2adb3069b0e04-550e71d2719mr8188649e87.27.1748007657233;
        Fri, 23 May 2025 06:40:57 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:56 -0700 (PDT)
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
	Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 11/21] firmware/pmdomain: xilinx: Move ->sync_state() support to firmware driver
Date: Fri, 23 May 2025 15:40:08 +0200
Message-ID: <20250523134025.75130-12-ulf.hansson@linaro.org>
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

Rather than having the genpd provider to add device_links for each device
that gets attached, to implement the ->sync_state() support, let's rely on
fw_devlink to do this for us.

In this way, we can simplify the code by moving the ->sync_state() callback
into the firmware driver, so let's do that.

Cc: Michael Tretter <m.tretter@pengutronix.de>
Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/firmware/xilinx/zynqmp.c            | 10 ++++++++++
 drivers/pmdomain/xilinx/zynqmp-pm-domains.c | 16 ----------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 7356e860e65c..a91a0191c689 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -2100,6 +2100,15 @@ static void zynqmp_firmware_remove(struct platform_device *pdev)
 	platform_device_unregister(em_dev);
 }
 
+static void zynqmp_firmware_sync_state(struct device *dev)
+{
+	if (!of_device_is_compatible(dev->of_node, "xlnx,zynqmp-firmware"))
+		return;
+
+	if (zynqmp_pm_init_finalize())
+		dev_warn(dev, "failed to release power management to firmware\n");
+}
+
 static const struct of_device_id zynqmp_firmware_of_match[] = {
 	{.compatible = "xlnx,zynqmp-firmware"},
 	{.compatible = "xlnx,versal-firmware"},
@@ -2112,6 +2121,7 @@ static struct platform_driver zynqmp_firmware_driver = {
 		.name = "zynqmp_firmware",
 		.of_match_table = zynqmp_firmware_of_match,
 		.dev_groups = zynqmp_firmware_groups,
+		.sync_state = zynqmp_firmware_sync_state,
 	},
 	.probe = zynqmp_firmware_probe,
 	.remove = zynqmp_firmware_remove,
diff --git a/drivers/pmdomain/xilinx/zynqmp-pm-domains.c b/drivers/pmdomain/xilinx/zynqmp-pm-domains.c
index d579220a4500..b5aedd6e33ad 100644
--- a/drivers/pmdomain/xilinx/zynqmp-pm-domains.c
+++ b/drivers/pmdomain/xilinx/zynqmp-pm-domains.c
@@ -153,14 +153,8 @@ static int zynqmp_gpd_attach_dev(struct generic_pm_domain *domain,
 				 struct device *dev)
 {
 	struct zynqmp_pm_domain *pd = to_zynqmp_pm_domain(domain);
-	struct device_link *link;
 	int ret;
 
-	link = device_link_add(dev, &domain->dev, DL_FLAG_SYNC_STATE_ONLY);
-	if (!link)
-		dev_dbg(&domain->dev, "failed to create device link for %s\n",
-			dev_name(dev));
-
 	/* If this is not the first device to attach there is nothing to do */
 	if (domain->device_count)
 		return 0;
@@ -298,19 +292,9 @@ static void zynqmp_gpd_remove(struct platform_device *pdev)
 	of_genpd_del_provider(pdev->dev.parent->of_node);
 }
 
-static void zynqmp_gpd_sync_state(struct device *dev)
-{
-	int ret;
-
-	ret = zynqmp_pm_init_finalize();
-	if (ret)
-		dev_warn(dev, "failed to release power management to firmware\n");
-}
-
 static struct platform_driver zynqmp_power_domain_driver = {
 	.driver	= {
 		.name = "zynqmp_power_controller",
-		.sync_state = zynqmp_gpd_sync_state,
 	},
 	.probe = zynqmp_gpd_probe,
 	.remove = zynqmp_gpd_remove,
-- 
2.43.0

