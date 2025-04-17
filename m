Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9BC253B5E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899953; cv=none; b=IekVLlD/fULloayZu2UcmUjqrBkrwT509PrYFB1HDvkhBy6uOp3tXTIegKs5BepcIgXtQOkmWHnUYcbQjYS/aQFq/qd8Mns7FHr0b9D6H0YZqksUocnuueUpL2CKfQ9zq36vdzVXWnRMQp+yMNFICsrNGG0DXZULSUHpdQ3wJco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899953; c=relaxed/simple;
	bh=48SzkSnXlpWKVmmQp8Xqs1VLpprH9LVATX3NaTD9rCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pfyc2XwhqEcgr7c0YSoa9wAp1hbx5giNl8EWTKNStQIPpv9dDfKfSCMwnAlDRHCQDC8OFIqD/ZTVuNQpVbtgZ81B6CzqUwA8GUZF5FM5gap6sZtu0RpCnoQmmuf9/Yg8ReeeFsefu0fmfQR+QYMDVUCCIQiSLYD9y8w8R2XeJnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/xXi1vh; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/xXi1vh"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54954fa61c9so1119047e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899950; x=1745504750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4svnLFbJnv3zIx0N7VYQw66/h1rJWDrzgMSBi0aPAY=;
        b=q/xXi1vhy8qZNIKGxy0KduFJ4Mn6lZAR+KFfwpi9cP4Unjvs4leHFgWkWkPCYS/btJ
         KziYMUTLjbUPzYtbU0k6NekMsaiLTKPScdlSFa1NaHfkvmwKaQrqE7YXBFnMjlnm8IV8
         Qi1le9H+d2WyR3Up84Lzoqb52jVzxPqKLFTUHdlvI6iwFmZ4Qbiij2oYgqCq4s29BYx7
         XEXkxxXHpxl39zp29ZqlSkyD7ys9lrThI7fonwe07XkzBXdkdAZQe+o6WHt/1qDSJ16N
         zsh5mp86Vz1i0WE4T+FAcJ3RGuh9+lPNoZWuwlSC04XXe4TUDL+KZ4kA3plpntTdPbMr
         uKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899950; x=1745504750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4svnLFbJnv3zIx0N7VYQw66/h1rJWDrzgMSBi0aPAY=;
        b=eVAynNKw1BFLluW4efGsO1WaFmubxwv3LwAv643g9M3050tql2iEPvl9OQXgavKHMq
         JvB73RnNVeUUlXMuNnScUkFEtOYkSh1N/cYrZt+FKhDsnTZ+z91EcT9cDzvvjuf2ZXBo
         zmiZ4nVsbOXYI0BakvaIDCZI2vRTVsy+Vzz9+6EeDLe5rCmyFuN6gUfqIxpwZXHcSHwT
         UWEcXjRdt1vHHm3lC5shTOW7UGBC/mlAqMtkqV8/UqWA/QUAkNQKK9qYoOW4SCe+d1ja
         W2Ch2BSIbhzBlKVUhiqEmAatUed7Sh+Fg9+zsC3U8DNBdiPSg8toLBIRJPqY0rl2F7xP
         AxaA==
X-Forwarded-Encrypted: i=1; AJvYcCW0zvkNh6Gy4wYcnwlsXiAH2Trz2IJ4d3tCpmJ/W/TwRwCw/khEUul1NqnRLz6eo+HZw3Ai7CxmSVObg3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkIfOG1jwyal0ivRZbSkOBHYqsFA/3z4kjtonGe1567/UWvP9B
	QCTA8OXGcCG0wmfAnY18qppKCIuU0zTXdt7L4ReyGvlP1Vr+pXInA16na8c7Dn8=
X-Gm-Gg: ASbGncsNREzceycOQK7IG/crTMjOyBRlirmgAXvwsDO2nIIwa18K4X7rUNhgKe443+j
	KYvxbhuBoiPNp/lZxl7LtoU3wSvLJq418pWIRs+zHJzhkJTyJA19Qfe3qvxh94go2yJ5DGDhGXV
	pkd4KcLJm48ZrHErrE06HGevGm0xbEXGSy7knLGY1Y0QZNf7P/hD23hTm3xtu4llriYfhNpgAKN
	wfyNfx/5lo1oMpNLshunm80KUKfLx785txcCF/6r7X+a86P4Es0CIw3vpv8pYNN0kaio+N2KRHg
	gqGUirCbheIbFpiLcFqllZeGrNctsujniy8fLgunt05dSUIqvjKDcgqCrYSIHPDsd/x4Dveqxzw
	BFvGCJE0pH4LVikA=
X-Google-Smtp-Source: AGHT+IFLZC+7o/XwKN7xuIyMZVwhsS5rHckZLNTwrcJeTbAwEvd5hmVT1e+JUJqkIv5jp8W5a7Ps7g==
X-Received: by 2002:a05:6512:2310:b0:54b:117c:1355 with SMTP id 2adb3069b0e04-54d64af41c9mr2069093e87.55.1744899949638;
        Thu, 17 Apr 2025 07:25:49 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:49 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] pmdomain: core: Leave powered-on genpds on until ->sync_state()
Date: Thu, 17 Apr 2025 16:25:09 +0200
Message-ID: <20250417142513.312939-12-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417142513.312939-1-ulf.hansson@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Powering-off a genpd that was on during boot, before all of its consumer
devices have been probed, is certainly prone to problems.

Let's fix these problems by preventing these genpds from being powered-off
until ->sync_state(). Note that, this only works for OF based platform as
->sync_state() are relying on fw_devlink.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 12 +++++++++++-
 include/linux/pm_domain.h |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 695d7d9e5582..a8c56f7a7ba0 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -212,6 +212,12 @@ static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
 	return ret;
 }
 
+#ifdef CONFIG_PM_GENERIC_DOMAINS_OF
+static bool genpd_may_stay_on(bool on) { return on; }
+#else
+static bool genpd_may_stay_on(bool on) { return false; }
+#endif
+
 static int genpd_runtime_suspend(struct device *dev);
 
 /*
@@ -933,11 +939,12 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	 * The domain is already in the "power off" state.
 	 * System suspend is in progress.
 	 * The domain is configured as always on.
+	 * The domain was on at boot and still need to stay on.
 	 * The domain has a subdomain being powered on.
 	 */
 	if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
 	    genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) ||
-	    atomic_read(&genpd->sd_count) > 0)
+	    genpd->stay_on || atomic_read(&genpd->sd_count) > 0)
 		return;
 
 	/*
@@ -2374,6 +2381,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
 	atomic_set(&genpd->sd_count, 0);
 	genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
+	genpd->stay_on = genpd_may_stay_on(!is_off);
 	genpd->sync_state = GENPD_SYNC_STATE_OFF;
 	genpd->device_count = 0;
 	genpd->provider = NULL;
@@ -2640,6 +2648,7 @@ void of_genpd_sync_state(struct device *dev)
 	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
 		if (genpd->provider == &np->fwnode) {
 			genpd_lock(genpd);
+			genpd->stay_on = false;
 			genpd_power_off(genpd, false, 0);
 			genpd_unlock(genpd);
 		}
@@ -3486,6 +3495,7 @@ static void genpd_provider_sync_state(struct device *dev)
 
 	case GENPD_SYNC_STATE_SIMPLE:
 		genpd_lock(genpd);
+		genpd->stay_on = false;
 		genpd_power_off(genpd, false, 0);
 		genpd_unlock(genpd);
 		break;
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 2185ee9e4f7c..c5358cccacad 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -193,6 +193,7 @@ struct generic_pm_domain {
 	unsigned int performance_state;	/* Aggregated max performance state */
 	cpumask_var_t cpus;		/* A cpumask of the attached CPUs */
 	bool synced_poweroff;		/* A consumer needs a synced poweroff */
+	bool stay_on;			/* Stay powered-on during boot. */
 	enum genpd_sync_state sync_state; /* How sync_state is managed. */
 	int (*power_off)(struct generic_pm_domain *domain);
 	int (*power_on)(struct generic_pm_domain *domain);
-- 
2.43.0

