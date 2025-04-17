Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DD725392F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899949; cv=none; b=qnN1U/DXp/22cI99r37pYF7KwRAddIxiwOd+tfqhX2VI2avTPHKJZpLPAoY2/5ML/svGfpKdhWWSXtOeVCAyOwctgrafUxOKR7HartqyDOiokCv6GnNQZV0lbjNnB5/T8JPRW2TWA+k0IhDbaxMTflwz92PA7PkDfniRqMtL0oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899949; c=relaxed/simple;
	bh=aN8FEk2gTwraQmA2Okw28VZvXnn4IpMUEhiRqft6pRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmDuvejiqz1hV51kWdBS3oC1y+YfnZogLaM0zfL107z9uUdXzHD7SXeUMgh4JwNM3JocCAhR0e6RV6ZRn1B6YN7WwTupaPBVel8z1x6tUU+qHxxabcmV28MLGR32wIzz3ETLx1JZfJr7jacUyBu2kqhJabHsNKDgBKVx9aVPyBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yVy5L502; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yVy5L502"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5497590ffbbso820404e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899945; x=1745504745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DgFXHRgSnMuDIPCx1JNgWD3fMJlP6odjvf+kJnYpPA=;
        b=yVy5L5027EaTAPgylmnLEUY4rL1ClD7aXMlPabQGjdrOWE3+rJHrvCarDc1m1xPcUM
         yOciC6OW8iEeQ04/nYzhTtDI+SK8I9yOdIX3JR2WRnQY00VNz8NnJw6z83j81GGa4YKG
         0kcpmfruS7MiTPIUNjKoo+oPgfDXyDk4Q1A2mKGSY3Q9VEyza/ES5bmgcdCRrL9qzkuc
         gPAt5DO1fRLK+bD3TXEnD8aFD6CFFVBeagf2Bdvujg8x6YhUd1K/q08u6jRPHsy+dHVP
         1bAbsT/buFntkLuF0M4AAgSeyeeilCBtLjlwuEp9ZVXt3GliXvHO7kce5tE272FmXUq6
         sD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899945; x=1745504745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DgFXHRgSnMuDIPCx1JNgWD3fMJlP6odjvf+kJnYpPA=;
        b=hOZ/9qetl7ZIQop7M4TLvRiEU5Mn3EMsuQJ0RB2ecxucR/hLTxqJp6FzuPCvCykVy7
         PHn4++7laZnbrjK7+A+CbkjmSabbS5Tkz9rKDvYH5Gw0AStBsxG5YgOc4DrsfX6wB9Tj
         oihv+Hh8gVrHf8UWhym3j2j9WO0zkKPkv1jW3g+EFFuoVjS2aK7NH/BpJnNV/KFhlz18
         xEWL/QfDMcVph+hF0Elz6PZqKTOOnqqEo0nUxvJ9z9uBPscT3bE3WN6JmhvHbKS1anUt
         srd/X/cEvXBEGf04P7zxuyZGDtMEdqXcbbnM50ZkcWPrJDTD3EYcJgHQm9FBTHFaCQ6t
         lKWg==
X-Forwarded-Encrypted: i=1; AJvYcCV5SHSZyoj27TxUKASfHtvndKlzA16xSzuJeKBZWhgqAfUqS94sLKGCexrywsSEGHgH3A85V1P667xK7Ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM/0mt0Fw40bkVZAzc/DPl4QyJ5XbWaef8N23E0FTRjDCBPNKN
	+F/umdne3EQdgsUosm52fqMwpz5HBDB+zXHgIujqsyHZy6+8uTV1gMbQj2rvlgM=
X-Gm-Gg: ASbGncvFNsCwkE4srD/lzGu+QQw8MI2PqnMLlbLb7r9VxudGDTH3i7/QDeSF2uBbm8s
	pXjb0i7KGW1D/NhxZ9N+ujgrLimLJ7PBn1nqlwTjZT/bDrZeCOoSn7lOaTA0Q2btzKNwHbRtU+j
	G9+fJ4ijI/heJVow8Bq3eo5zGprVRSn5ukPRTTF7dtLGu7KTRteHqy/w40woKA69pSyA7xnoXFk
	MN+PcbNic1Onp+kt/jvTmp0mOT5KOLCvwj00REqwFoY68t4x22AL7UXzs1jQtXth5H1ScXB00Yo
	sX9dBZ6hrkJa4wE79VP97wnjD6K9De/E2JbpLsd+CmvUB9CDc8wpiioQosI9V171kMoKGar+FjD
	bmoEhjt3Hsf3+Tt8=
X-Google-Smtp-Source: AGHT+IHdJaQxomsfYSS+f0K9itIKdmZijhFhwWEW6ghpA5npqy5MAC8rCQkmORhb5jt3ng77hEg7hw==
X-Received: by 2002:a05:6512:3055:b0:54b:117c:a070 with SMTP id 2adb3069b0e04-54d64af157dmr2157090e87.57.1744899944885;
        Thu, 17 Apr 2025 07:25:44 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:44 -0700 (PDT)
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
Subject: [PATCH 08/11] pmdomain: core: Add internal ->sync_state() support for genpd providers
Date: Thu, 17 Apr 2025 16:25:06 +0200
Message-ID: <20250417142513.312939-9-ulf.hansson@linaro.org>
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

If the genpd provider's fwnode doesn't have an associated struct device
with it, we can make use of the generic genpd->dev and it corresponding
driver internally in genpd to manage ->sync_state().

More precisely, while adding a genpd OF provider let's check if the fwnode
has a device and if not, make the preparation to handle ->sync_state()
internally through the genpd_provider_driver and the genpd_provider_bus.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h |  7 +++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 512f89e6d302..9c5a77bf59d2 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2374,6 +2374,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
 	atomic_set(&genpd->sd_count, 0);
 	genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
+	genpd->sync_state = GENPD_SYNC_STATE_OFF;
 	genpd->device_count = 0;
 	genpd->provider = NULL;
 	genpd->device_id = -ENXIO;
@@ -2656,6 +2657,7 @@ int of_genpd_add_provider_simple(struct device_node *np,
 				 struct generic_pm_domain *genpd)
 {
 	struct fwnode_handle *fwnode;
+	struct device *dev;
 	int ret;
 
 	if (!np || !genpd)
@@ -2665,6 +2667,10 @@ int of_genpd_add_provider_simple(struct device_node *np,
 		return -EINVAL;
 
 	fwnode = &np->fwnode;
+	dev = fwnode->dev;
+
+	if (!dev)
+		genpd->sync_state = GENPD_SYNC_STATE_SIMPLE;
 
 	device_set_node(&genpd->dev, fwnode);
 
@@ -2718,8 +2724,10 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 {
 	struct generic_pm_domain *genpd;
 	struct fwnode_handle *fwnode;
+	struct device *dev;
 	unsigned int i;
 	int ret = -EINVAL;
+	bool sync_state = false;
 
 	if (!np || !data)
 		return -EINVAL;
@@ -2728,6 +2736,10 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 		data->xlate = genpd_xlate_onecell;
 
 	fwnode = &np->fwnode;
+	dev = fwnode->dev;
+
+	if (!dev)
+		sync_state = true;
 
 	for (i = 0; i < data->num_domains; i++) {
 		genpd = data->domains[i];
@@ -2737,6 +2749,11 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 		if (!genpd_present(genpd))
 			goto error;
 
+		if (sync_state) {
+			genpd->sync_state = GENPD_SYNC_STATE_ONECELL;
+			sync_state = false;
+		}
+
 		device_set_node(&genpd->dev, fwnode);
 
 		ret = device_add(&genpd->dev);
@@ -3453,6 +3470,25 @@ static void genpd_provider_remove(struct device *dev)
 
 static void genpd_provider_sync_state(struct device *dev)
 {
+	struct generic_pm_domain *genpd = container_of(dev, struct generic_pm_domain, dev);
+
+	switch (genpd->sync_state) {
+	case GENPD_SYNC_STATE_OFF:
+		break;
+
+	case GENPD_SYNC_STATE_ONECELL:
+		of_genpd_sync_state(dev);
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
index e9a1f8975c4f..2185ee9e4f7c 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -127,6 +127,12 @@ enum genpd_notication {
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
@@ -187,6 +193,7 @@ struct generic_pm_domain {
 	unsigned int performance_state;	/* Aggregated max performance state */
 	cpumask_var_t cpus;		/* A cpumask of the attached CPUs */
 	bool synced_poweroff;		/* A consumer needs a synced poweroff */
+	enum genpd_sync_state sync_state; /* How sync_state is managed. */
 	int (*power_off)(struct generic_pm_domain *domain);
 	int (*power_on)(struct generic_pm_domain *domain);
 	struct raw_notifier_head power_notifiers; /* Power on/off notifiers */
-- 
2.43.0

