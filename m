Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B222949E4
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007668; cv=none; b=tlPnbmunvQO0G9p0QFkC3lL3slaNAJOelfw6r9Sfl8YYXleJkOKQSUTVMNz5TWF7/XIrdoIJ0Qp0PzL83muBYa9ERcC3F14WWw58qVOheH1jwUL4klb/5kbTEi1tj1ESVkzSl7WzR8kloe8D9cX7TVP2tfv/11pE9nExKpU5PN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007668; c=relaxed/simple;
	bh=BNU9PuywstX6I+IaQZdoVQWmlolUJAYeaZv61hYLkg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZppLmyJ0aQCQD2xTlUgmrX4KI5B1yP6sxAe9JejPQbKVQfVEoEnFnFVaiVivC//i63MQIMm7dx1DrE2hrtnKAoAron9nt9XdMdmSyQWjNp8tVwxPpzlF+XKv6HEGRDINeAa1RtFxCmdoyoDJEeq6BAnBQPM5Kldqx2qKDLlTOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Na+Ihge0; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Na+Ihge0"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so5353422e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007664; x=1748612464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KC7YC2/v/hospjziwcUkovuFHlTjTAcy5Zz+vdo8lIo=;
        b=Na+Ihge0zpyigW7TNffIf+MostbKgczA/7bnqO6OV12TVeDFQvjG6GoFjDQ6lPAL1Y
         3cLG4u6GSLBBbOQl0nEaXR2xVyaqsWDCzV6L/1o1YOSuagzB9FC1gD5cvuraOfYaHCzy
         hIjtN2vibL8XG2Ev0KAuqZ5wkflgKp5yZvpb7624AbVXfWE/PpJh4z/Jz52pA5et8fMN
         G/5X5EEOI/9yUEQNjiGPaVvzGPuzHSOOK3ZY0A7wAt7GTBgOtYKsSdIukGNJKTOGgYWG
         NvKKSStfgLirB4ej7QxTGZjYY0/Xy/UNHg+oYYSq9F8if8xuY+1sk6Ybsro9MyxrZtDh
         KoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007664; x=1748612464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KC7YC2/v/hospjziwcUkovuFHlTjTAcy5Zz+vdo8lIo=;
        b=qg/jsyCYLpoJqsH9wmDZ+70db7AbOe8v2aiSCqCzIArguKuIa8RHftZShOaAwnbrzt
         /vdV+lHBoQZ+HqGwi3LjKwA8+J/AyfrpZL40fi0cNKe28hqCgaWDZXxfMR5zFfx79V04
         aF4lKI32HJKEjdQeNUf/6dvz0D28iQDs2aizR0Ri63pf9DfP+vuxvCy2Hb3mtf5URBHG
         Kt3WBmEvMajoneJHftyo1yNMyejvMSMSP5PFT/HovySSf3KJg7WOLqYv8IM8YYQKwNyB
         UNfEUFA6/y6aYWXIthbwdWCqZW1Zk2gwy6dgZ5FUNTzEi8tJR9MUWayFRf7d8hZ6MIiP
         Mvjg==
X-Forwarded-Encrypted: i=1; AJvYcCUPzDqwxPiIHGWbg6mHI3//ixitTR8XWjp709P5q26EkVz/Rz64IvJZw9Qvzo2IaHZ/WA1AO60DyFKcPqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOKsD82dlPYbKqopFVvPnaC+9Leql8HuF9oPuAfHeHOQJpLljK
	lKMj+MW3joWasbgQshLLfqWBx5abhT9K6S0V5CQZBjnM4p7GvfaRk+zyXx1zqryArUw=
X-Gm-Gg: ASbGnctiYmIJg4WYCSiUJp7s+rqKXuUvj0VQS5hnO0jElf9U5Tpfzw5+Ze67UeoGSn9
	3QKd6S4QL+lBaG6SeaEn+8acOdcW/9DE59Ssl/3PFBk3QA4MOoyQCoFddTikzBe5mx+tDE9XERm
	JcabjIj7duK8IV7Cj4oMtI1gzdOsn+dwQu/WO6g+qwNq4/4r5ivIVWx094aQ49oeFUnqAU70SHm
	juP1gsz68lSFI4FMSAw4GLbxyBZtaliafAPi0xT+eJgU7HkJ13W0gGg9SmBgjcWHsVq/5sG+fgj
	vWLNloC0rCrRu1qE+qhi16Fl2t/wruoybwri81iiMKVP9hWAsxeWUPME4oXXvUqfaRMm0vSpge3
	KUDmfTJ46NBMpctcw+Zk21LHDnQ==
X-Google-Smtp-Source: AGHT+IEZ0JF0eQFf2usDsMtCl0D2zCseCjmw2y7+b0hDzAnm98HasW9P5zPUEvp49AX37vCRxzZGZQ==
X-Received: by 2002:a05:6512:630e:b0:54f:c1ae:f1b6 with SMTP id 2adb3069b0e04-550e99648bemr7875417e87.56.1748007664022;
        Fri, 23 May 2025 06:41:04 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:41:03 -0700 (PDT)
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
Subject: [PATCH v2 15/21] pmdomain: core: Add common ->sync_state() support for genpd providers
Date: Fri, 23 May 2025 15:40:12 +0200
Message-ID: <20250523134025.75130-16-ulf.hansson@linaro.org>
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

If the genpd provider's fwnode doesn't have an associated struct device
with it, we can make use of the generic genpd->dev and it corresponding
driver internally in genpd to manage ->sync_state().

More precisely, while adding a genpd OF provider let's check if the fwnode
has a device and if not, make the preparation to handle ->sync_state()
internally through the genpd_provider_driver and the genpd_provider_bus.

Note that, genpd providers may opt out from this behaviour by setting the
GENPD_FLAG_NO_SYNC_STATE config options for the genpds in question.

Suggested-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 52 +++++++++++++++++++++++++++++++++++++--
 include/linux/pm_domain.h |  7 ++++++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 4047af5a275d..c094ccbba151 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -189,6 +189,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
 #define genpd_is_rpm_always_on(genpd)	(genpd->flags & GENPD_FLAG_RPM_ALWAYS_ON)
 #define genpd_is_opp_table_fw(genpd)	(genpd->flags & GENPD_FLAG_OPP_TABLE_FW)
 #define genpd_is_dev_name_fw(genpd)	(genpd->flags & GENPD_FLAG_DEV_NAME_FW)
+#define genpd_is_no_sync_state(genpd)	(genpd->flags & GENPD_FLAG_NO_SYNC_STATE)
 
 static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
 		const struct generic_pm_domain *genpd)
@@ -2374,6 +2375,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
 	atomic_set(&genpd->sd_count, 0);
 	genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
+	genpd->sync_state = GENPD_SYNC_STATE_OFF;
 	genpd->device_count = 0;
 	genpd->provider = NULL;
 	genpd->device_id = -ENXIO;
@@ -2627,6 +2629,8 @@ static bool genpd_present(const struct generic_pm_domain *genpd)
 int of_genpd_add_provider_simple(struct device_node *np,
 				 struct generic_pm_domain *genpd)
 {
+	struct fwnode_handle *fwnode;
+	struct device *dev;
 	int ret;
 
 	if (!np || !genpd)
@@ -2637,6 +2641,15 @@ int of_genpd_add_provider_simple(struct device_node *np,
 
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
@@ -2661,7 +2674,7 @@ int of_genpd_add_provider_simple(struct device_node *np,
 	if (ret)
 		goto err_opp;
 
-	genpd->provider = &np->fwnode;
+	genpd->provider = fwnode;
 	genpd->has_provider = true;
 
 	return 0;
@@ -2686,8 +2699,11 @@ int of_genpd_add_provider_onecell(struct device_node *np,
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
@@ -2695,6 +2711,13 @@ int of_genpd_add_provider_onecell(struct device_node *np,
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
 
@@ -2705,6 +2728,12 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 
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
@@ -2727,7 +2756,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 			WARN_ON(IS_ERR(genpd->opp_table));
 		}
 
-		genpd->provider = &np->fwnode;
+		genpd->provider = fwnode;
 		genpd->has_provider = true;
 	}
 
@@ -3446,6 +3475,25 @@ static void genpd_provider_remove(struct device *dev)
 
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
 
 static struct genpd_provider_drv genpd_provider_drv = {
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

