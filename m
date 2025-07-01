Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415FA27587C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370487; cv=none; b=Nq8gJA6tU09kVIHjmhQnVFcBHonFr1cFys11NeEiCBNzYlRdbDkCjC9OtXD+FZlLx5n83JiG/VY3YMXP4gO+ypJrk42u1Yu9gFAn3V9+yPum9F2oSKmtyBxpAKBOCPOyjLaYR56Wl/Ku0W4tBFA326t/ieukl9nabb+gQQuQUXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370487; c=relaxed/simple;
	bh=dCfKc8M+VAFcuXjqcI2B+OXim4o2mp+Y/13x31tJu98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYbjLQGoPnjq10N+wHy0jEaKrDnoOACZgwJF0xPuHHM9yTMjfU0flMmNETrC7JMCcdVYANZWOcFacjG/U/cdmepX00Mu9ReW5ejJ8lEf89hLy4UXNF6kkVrwJHEraqzLOGNIbIFdblVkybECWoUsLJJNaqNubdLFtIo2aEbTxpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HG+Svjpq; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HG+Svjpq"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b51f5218so5644113e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370483; x=1751975283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ou37oVNU8EcrZ39XggNFqJJBkEWIeWX5cH4SBBxr5bU=;
        b=HG+Svjpqal+PjGwJZ64cvQQhONk84b3kcd9AyORVzmQwILpH75utmbtV+nKmEiyD2i
         8ePNEDm+Q41WHywn/yVT2F3spvtYuwhapZCgPQ2r375OOh6qQjalNEAfzdr4qs25vm61
         O3UkWhcSOiLpXsQ+Oz+p2JhHk3IitkaxUHgc+plCT1spOd0ol/dI5nOoOFOjlmQjtvoS
         8zocYKU7jdOPRxywu89KFSbJDz2m2zBuW/rddpzZepuEg8rCGdPQqR79VVTgTm/OaKk6
         mslFjya+R9VVxhAP7+uGEmqXVFUtE7OB5O2jh5cgVeQgPa3rfBjXSOdN9YVwMZ3wYQmi
         FOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370483; x=1751975283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ou37oVNU8EcrZ39XggNFqJJBkEWIeWX5cH4SBBxr5bU=;
        b=JxfiaZAu2PlTGYzuuWxwAp2OVKh+r/LO1t4l+1vX7C0TPOcWSCUYlBTzEMiJN+gqWl
         zRSNdLRLVHWzhLOVRDLRapZD3MCkc1rwmSvtIqG0QhqaWvykaG//Vn9mN48PeZ3X1Cl+
         1O9QWau0LDSYaXrY+3Wa9hWfH8d1bbVY+V8plDuPz8o4aix7LPvBJgtda9M8U4jNAVo2
         MUkhKh1XVg0vh5qXeKt31M55xbRG80/o/jGfzJkU7U4yn3IW45d8V0NXoa21Vj1SYQdE
         DE7PX1GjdumKYIOhYmnLZF92gSAC6g8Cfeg+3RUL39emzyO4lUJ+luSvmK1jjQCiqRjE
         hV9A==
X-Forwarded-Encrypted: i=1; AJvYcCXzAvuySWsBMqAAQyGQKlu4oTV6OtR8bgeBDuHX7sPoFHyNkxrjJNGSGJvyVBHAIarJttqFiiq4AQa/6M4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqU7x3VWRqwylKhDIXUAf+JkX+wOy3qXHWCtxTJt7xMBfE5Hkd
	uz4Yyb0YKLSZc2JLZDkOUdtuDf6wXfYFRkvEfxYvEyFciVsP+MMbyvmVmYYgzW03aqk=
X-Gm-Gg: ASbGncsQr+v2FtHNtQq+yyrux+sekPz8lfyfb0aOdPoIJ3aqNBf3YmJTIZGhw9NqaxY
	2f0jcDZRFVy1gV93oUl3sGwGJWoS7R1VzbkoOZvimNTLhyccOgO4qhgKbEOz9cOxYa+ad+KZsl/
	rDamRpvY82DbwQQwr/gEYLix2RrTDMPrQS/1mKLInxGiuPzBQfxsem/tjePpqDunEwQGZ2BNpcu
	RcB0ubbTkeo5KmFRxp/UZEe2vLQn5FLMuXf3m92scEDrcANhgIuM8ek5TsPwnl5rOE3NYgJkfsu
	i6Zobdk8JF6mF9hk0xA8nqVMkzAV5ltxH3FgzXMRpoFL3zUJidXQZupl8H4/B04gGwUC/r54Jgn
	R0X897OA5FdsRW56Rf5OxnhrGTWaMvf0MlmcX
X-Google-Smtp-Source: AGHT+IH0vCvElE8qdxxXL5THgRVp/JjfgP3AQLH5VtPUuqSALJU6t/Q2a/vaudzsxqj21OUKqYtVNg==
X-Received: by 2002:a05:6512:31d0:b0:553:abcd:cf51 with SMTP id 2adb3069b0e04-5550ba16ad6mr4341553e87.40.1751370483312;
        Tue, 01 Jul 2025 04:48:03 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:02 -0700 (PDT)
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
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v3 14/24] firmware/pmdomain: xilinx: Move ->sync_state() support to firmware driver
Date: Tue,  1 Jul 2025 13:47:16 +0200
Message-ID: <20250701114733.636510-15-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
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
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
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

