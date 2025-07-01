Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEAF27701C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370492; cv=none; b=MHctjpcieKrYCZv79Xfend3DUS0X/58tJ2f8hOU55ldxXy7GcL1d2bwRk/47gvks36OaLMcM4EQe6wVr6Q46RspbMCNaSACqF2mmBpz2cLbGXkGXydciwzfFrhaPaIX7x0sX1qkg5zA2PC8cSw9Y7HUtDXp62RnC5b4fbqkviyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370492; c=relaxed/simple;
	bh=16Y/V2ImsdkEIqcooSEob3mLCoXSVDRMKaiDwoewk3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hx6zMcwUzLx6CVQ59IBKewHiXpzVVqwfCj1tMjs2gzaEd2Ixhlqv0Ku0+UyshbcRhcNyaaCSoBdodNAoI+d3KHXH4Y+ezVSqzPOaQDybtOZsdHzULSB5lFZTqhmcDWm5XMJQVYlAh1r9mRXfgAa1d5y4LPBkXLS3ONNR4JTUuNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JODSS7a1; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JODSS7a1"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55516abe02cso2754251e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370489; x=1751975289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSlhhsNZnMSdNZ9/zrr7APJGkIMzya3OzGGURYO/UKQ=;
        b=JODSS7a1CKltjlAn7sR7LwJAWvBcMQMlzSERqs7w0dE3MDMppjuiEFnFxD1fyn6DKM
         7NBsukO3FJaqsQ7zJgCAcGRHhWRWRTvaTymunTfVeVaGR4mMTgHrE0u4e/WgzPUwJrzw
         f6gGQRIOGTvYyuUQO3RrFx8ZqFTBzePVaj7eiLPbf3IGaFW++SrzK3CgN13o9r9X3CZo
         Vs3NXW1C8b1IS09YaREJqncOvw3LMM/QIVcsIkCmvbxOVg3aLh4HqDWS+M7Bgv1kiZV3
         NCqaVJz/eY34o0k2hOlLcSiYqB9p1SKbVRVN0pSBJu3aG6+C0T1MpG2ULPoQwD6GAHe8
         XO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370489; x=1751975289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSlhhsNZnMSdNZ9/zrr7APJGkIMzya3OzGGURYO/UKQ=;
        b=QvzrtCl0Hyj0EbJbbeNy8hw1QG3iFg+NLeR2KfYnZFSSdzO18M5Afc2EZuVQ3985Dw
         pSkFujnCBbL16/keGzimyTRKeQo0l3tFwMhLE61vr6xj7paft1k4oDbFShmSF3WRNo0y
         8x+ILo2ziYSfx0Y3XwBGXNB9svwuP8sTvlv1dqCkKT5wFkupFxcQfb9ERwqMJopHMsaW
         b59FT5YNG2zYJlSDicuX2nPfv4csvDO5gjByshHw1S69CmcK9jooci676olYaPLqbfk6
         Px+eBa2hpoeLDOc1JGk9sOVraEmPyj1ZMIatqjv9JB1E8zvbVQrR93p98PKFD/RElZxY
         rj/A==
X-Forwarded-Encrypted: i=1; AJvYcCVGjGR5sK455jCO16bZQsPYuQ2NaiPYAXcrNXMIznw6ga1WU40Zn/c1B0Y43dYOCDt4rgxI1IzSMGEHR4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVzPzg8ffJnOv4ZjmkxRx67OM4pEXSg+OuZsGm39yoGYUtYewZ
	+eI9QBEKyJ/yqFArS73dZ1DQhy2wavZHe5jh1dtsWH5bX7x12VOmcP/Yq9osCYXl66s=
X-Gm-Gg: ASbGncsj2fv1f8tf8fI2ggSjm5CQi73u0ObNLX39eMY5KS9TuuCKQ3U0TRK5g0aUO84
	G+s9NIKXpyFHNCmULzCqOjJL9V9C5aQuxdM+mcFlc+AEze2Wu0cWQZsYj2bmdC1f0dHBCyEGNXn
	iczxRmp4+pu+L3/tkW2RuTwrsQ9K9Qg61sb14eXQtDVXJflUT6vpcxVYN2osc8u1edYPm4kNS8G
	JWf4y5XWUqVX3yri96u/tIOYvN4L9f7ueqocpxBQ8ZdxpJ/9TtLXv9E4ELKWD5B8+106P0rYLnX
	LxTga4VeZGeCoCIi/3SE0GS5yYX/7nlUpAvrHrEk6WFxyf2WFPmvPMj4mhdWad4xaxOfw0NHibO
	a0CdYITLUez1YU2EMV+kp40pz4QMFK4eNPaDA
X-Google-Smtp-Source: AGHT+IGj4keXnnMXOTK8BsmFb9l85E6FUYCQFw927ADYbaXkZQ7jNAqNFb7K6hJHHY0y+lNMS4BVmA==
X-Received: by 2002:a05:6512:e96:b0:555:130:1fa8 with SMTP id 2adb3069b0e04-5561f8d30dbmr1028685e87.22.1751370488982;
        Tue, 01 Jul 2025 04:48:08 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:08 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 18/24] pmdomain: core: Add common ->sync_state() support for genpd providers
Date: Tue,  1 Jul 2025 13:47:20 +0200
Message-ID: <20250701114733.636510-19-ulf.hansson@linaro.org>
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

If the genpd provider's fwnode doesn't have an associated struct device
with it, we can make use of the generic genpd->dev and it corresponding
driver internally in genpd to manage ->sync_state().

More precisely, while adding a genpd OF provider let's check if the fwnode
has a device and if not, make the preparation to handle ->sync_state()
internally through the genpd_provider_driver and the genpd_provider_bus.

Note that, genpd providers may opt out from this behaviour by setting the
GENPD_FLAG_NO_SYNC_STATE config options for the genpds in question.

Suggested-by: Saravana Kannan <saravanak@google.com>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 52 +++++++++++++++++++++++++++++++++++++--
 include/linux/pm_domain.h |  7 ++++++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 0a6593a1b1c8..ca47f91b9e91 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -186,6 +186,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
 #define genpd_is_rpm_always_on(genpd)	(genpd->flags & GENPD_FLAG_RPM_ALWAYS_ON)
 #define genpd_is_opp_table_fw(genpd)	(genpd->flags & GENPD_FLAG_OPP_TABLE_FW)
 #define genpd_is_dev_name_fw(genpd)	(genpd->flags & GENPD_FLAG_DEV_NAME_FW)
+#define genpd_is_no_sync_state(genpd)	(genpd->flags & GENPD_FLAG_NO_SYNC_STATE)
 
 static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
 		const struct generic_pm_domain *genpd)
@@ -2351,6 +2352,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
 	atomic_set(&genpd->sd_count, 0);
 	genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
+	genpd->sync_state = GENPD_SYNC_STATE_OFF;
 	genpd->device_count = 0;
 	genpd->provider = NULL;
 	genpd->device_id = -ENXIO;
@@ -2606,6 +2608,8 @@ static bool genpd_present(const struct generic_pm_domain *genpd)
 int of_genpd_add_provider_simple(struct device_node *np,
 				 struct generic_pm_domain *genpd)
 {
+	struct fwnode_handle *fwnode;
+	struct device *dev;
 	int ret;
 
 	if (!np || !genpd)
@@ -2619,6 +2623,15 @@ int of_genpd_add_provider_simple(struct device_node *np,
 
 	genpd->dev.of_node = np;
 
+	fwnode = of_fwnode_handle(np);
+	dev = get_dev_from_fwnode(fwnode);
+	if (!dev && !genpd_is_no_sync_state(genpd)) {
+		genpd->sync_state = GENPD_SYNC_STATE_SIMPLE;
+		device_set_node(&genpd->dev, fwnode);
+	}
+
+	put_device(dev);
+
 	ret = device_add(&genpd->dev);
 	if (ret)
 		return ret;
@@ -2643,7 +2656,7 @@ int of_genpd_add_provider_simple(struct device_node *np,
 	if (ret)
 		goto err_opp;
 
-	genpd->provider = &np->fwnode;
+	genpd->provider = fwnode;
 	genpd->has_provider = true;
 
 	return 0;
@@ -2668,8 +2681,11 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 				  struct genpd_onecell_data *data)
 {
 	struct generic_pm_domain *genpd;
+	struct fwnode_handle *fwnode;
+	struct device *dev;
 	unsigned int i;
 	int ret = -EINVAL;
+	bool sync_state = false;
 
 	if (!np || !data)
 		return -EINVAL;
@@ -2680,6 +2696,13 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 	if (!data->xlate)
 		data->xlate = genpd_xlate_onecell;
 
+	fwnode = of_fwnode_handle(np);
+	dev = get_dev_from_fwnode(fwnode);
+	if (!dev)
+		sync_state = true;
+
+	put_device(dev);
+
 	for (i = 0; i < data->num_domains; i++) {
 		genpd = data->domains[i];
 
@@ -2690,6 +2713,12 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 
 		genpd->dev.of_node = np;
 
+		if (sync_state && !genpd_is_no_sync_state(genpd)) {
+			genpd->sync_state = GENPD_SYNC_STATE_ONECELL;
+			device_set_node(&genpd->dev, fwnode);
+			sync_state = false;
+		}
+
 		ret = device_add(&genpd->dev);
 		if (ret)
 			goto error;
@@ -2712,7 +2741,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 			WARN_ON(IS_ERR(genpd->opp_table));
 		}
 
-		genpd->provider = &np->fwnode;
+		genpd->provider = fwnode;
 		genpd->has_provider = true;
 	}
 
@@ -3430,6 +3459,25 @@ static int genpd_provider_probe(struct device *dev)
 
 static void genpd_provider_sync_state(struct device *dev)
 {
+	struct generic_pm_domain *genpd = container_of(dev, struct generic_pm_domain, dev);
+
+	switch (genpd->sync_state) {
+	case GENPD_SYNC_STATE_OFF:
+		break;
+
+	case GENPD_SYNC_STATE_ONECELL:
+		of_genpd_sync_state(dev->of_node);
+		break;
+
+	case GENPD_SYNC_STATE_SIMPLE:
+		genpd_lock(genpd);
+		genpd_power_off(genpd, false, 0);
+		genpd_unlock(genpd);
+		break;
+
+	default:
+		break;
+	}
 }
 
 static struct device_driver genpd_provider_drv = {
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 9329554b9c4a..d68e07dadc99 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -133,6 +133,12 @@ enum genpd_notication {
 	GENPD_NOTIFY_ON,
 };
 
+enum genpd_sync_state {
+	GENPD_SYNC_STATE_OFF = 0,
+	GENPD_SYNC_STATE_SIMPLE,
+	GENPD_SYNC_STATE_ONECELL,
+};
+
 struct dev_power_governor {
 	bool (*power_down_ok)(struct dev_pm_domain *domain);
 	bool (*suspend_ok)(struct device *dev);
@@ -193,6 +199,7 @@ struct generic_pm_domain {
 	unsigned int performance_state;	/* Aggregated max performance state */
 	cpumask_var_t cpus;		/* A cpumask of the attached CPUs */
 	bool synced_poweroff;		/* A consumer needs a synced poweroff */
+	enum genpd_sync_state sync_state; /* How sync_state is managed. */
 	int (*power_off)(struct generic_pm_domain *domain);
 	int (*power_on)(struct generic_pm_domain *domain);
 	struct raw_notifier_head power_notifiers; /* Power on/off notifiers */
-- 
2.43.0

