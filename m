Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DC527466D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370477; cv=none; b=an94L2TwCFWK7v8vpf09f+LIizSHLl/2zxWIv8wdedDmOy2inK5A+CCF3rWs3hEiT1+myeNjBEOwdNztdjHDLkdeWA59hMPilhtq0pjXy4ysVacxzM7nbYXzHtSNXKf1c83qilq3fm9SXzk9063bSvNVOeShSQmbNc/kQaoQR2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370477; c=relaxed/simple;
	bh=GSQjDAAw/2UFfOSDhN4XP7m6qEVN6g7wVlZceYPRiQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bp2lIK180XvS5Ti8GeravWVomL9VhBvmkZBuLGAiL6qEjn9bwKe/+/7EeU225AbVCCo81jc3QhnNGsFTs5FcgyQeXy3MpG24FMugq3osqCxYFao0DNSi+exOUWpF0HcYYoSS20tUQgg8wo7y7SiCZN1KCurIhoolz6LcWpNGYcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l5iOuLpQ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l5iOuLpQ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553dceb342aso2910741e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370474; x=1751975274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8snE3wteaj05up9xuc38N+GpWHiyr4TVp4DRKu79Vw=;
        b=l5iOuLpQMOVzxO/4T1vXdMRsDV9x6YeySVd2w7IqZuVzHDCpI5gqs6OdGo7D6tE6XF
         MR9CctnrRHOkfXAmAzYP9WG8WYLohxYfKkLw0LygKZmMGdbbjEO24Y8XDlVr9Nrfjqzg
         4J1dfYpd6bP7pFY9byI/mogq0My2YKWd+k04ioCyu5i4+q1BP81g9gWbCQLI5QFyANCP
         cEP0Qwc5w62bbmv2nA36zcsacjyoxF9Oq8qEsBGhNTSYBSeyhnhBWbwjb/Mg+D9DcduM
         iDoMezsJ6l6w8GjN/PlAfZOn1a0tnLmzKK7DE28xCCRtIExDUbCJ6VHpi4mRS2RQp9PX
         XYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370474; x=1751975274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8snE3wteaj05up9xuc38N+GpWHiyr4TVp4DRKu79Vw=;
        b=tfimEBVce8xNXii+JvLgq5csOvbS+z8z0n04OTQh4VfJY8d1nlM7JtKw1x+/aFahPk
         Rzlq12thq/EzJfSbMmL9T+Zn8+objvDqKW7YUJRh/vtqekKIkbPhCyV1Ru/r4dtWKO32
         LPjKjJXdBG3sZfZOiI7qjcjW06bwid3ckw16uDEVa4iTW3r08I+H9+hyI2IbvNu9MbtV
         J6Qp7fFSlaGpAma81J6wbPOeNA4LZViSoUSNM+U9ITTLlu5g4tQD7+FAc5GEZNJlwj2T
         KXpC8pg0oaYudKQb0e4WkPPQWYdS0Pq+6I4H/WIV7kZWXu3MqpQQZcRVol10TcYdwSjj
         rojQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7Xo5ZcJqBwWN4ZtZikgH9+aJtdzZTHzcndUBnSC6ds59GUXta2OUq5BghMWuO+wsB/2KSLmEenhF1dGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCmFldpLZ3m0YdcbURT+XCSluxK3RBssaCcJMhc1uXdyIN9RBw
	GAjY66bubPeOIHvq56mjWutsNc72MPegTlPGBT/O7veCfo6aKK9ZWJ4yeaUvNA25WGc=
X-Gm-Gg: ASbGncu4SSWhgsrrRf88TPs/YGUIU4B03wcX0kTGVpwOLzNU/xncbYKn/JpugyaO3Nu
	ArZV7imeRYsz59TNUoR3G6mzm/4C3yNDRjbTkGKFxInGRCMEDuEnnMf1QCf+UKl7/LKOZUkJ2g6
	Kugg2wLyJ4+94Jy7YNayKUKXOBrUkdvGcnNQh12C7aMnizICJPiO7kVcBRwQ4FulIaBwE5k9ZRM
	MUqTGwGLvWWd0KVNg7RP66tzGXBDl9LOArkwLtRbmIpEfSMxYeo3gTuOkltDeKOB8JbSEd47f+E
	cIaYxuAWmJVNwL0GpJJ3HRROgxHOvJfTLofJxNucc9iXEzkEuzaRENs8P8eqOny2MELMiGHk8q0
	zAt3NMeguqJqX2/FaRvSNdKV7yf3ZSq8D0ue2
X-Google-Smtp-Source: AGHT+IGHOXSS3IfRhKJLvej9F7sNLg96swujqTnE5kCTQPPh6ovfx1jtoUYgG1FeyEuKZgdZjCc4VA==
X-Received: by 2002:a05:6512:1590:b0:553:3073:c38b with SMTP id 2adb3069b0e04-5550b8293fbmr5034875e87.1.1751370473628;
        Tue, 01 Jul 2025 04:47:53 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:53 -0700 (PDT)
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
Subject: [PATCH v3 07/24] pmdomain: core: Export a common ->sync_state() helper for genpd providers
Date: Tue,  1 Jul 2025 13:47:09 +0200
Message-ID: <20250701114733.636510-8-ulf.hansson@linaro.org>
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

In some cases the typical platform driver that act as genpd provider, may
need its own ->sync_state() callback to manage various things. In this
regards, the provider most likely wants to allow its corresponding genpds
to be powered-off.

For this reason, let's introduce a new genpd helper function,
of_genpd_sync_state() that helps genpd provider drivers to achieve this.

Suggested-by: Saravana Kannan <saravanak@google.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 27 +++++++++++++++++++++++++++
 include/linux/pm_domain.h |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 79dc0bf406f0..0a6593a1b1c8 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3396,6 +3396,33 @@ int of_genpd_parse_idle_states(struct device_node *dn,
 }
 EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
 
+/**
+ * of_genpd_sync_state() - A common sync_state function for genpd providers
+ * @np: The device node the genpd provider is associated with.
+ *
+ * The @np that corresponds to a genpd provider may provide one or multiple
+ * genpds. This function makes use @np to find the genpds that belongs to the
+ * provider. For each genpd we try a power-off.
+ */
+void of_genpd_sync_state(struct device_node *np)
+{
+	struct generic_pm_domain *genpd;
+
+	if (!np)
+		return;
+
+	mutex_lock(&gpd_list_lock);
+	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
+		if (genpd->provider == of_fwnode_handle(np)) {
+			genpd_lock(genpd);
+			genpd_power_off(genpd, false, 0);
+			genpd_unlock(genpd);
+		}
+	}
+	mutex_unlock(&gpd_list_lock);
+}
+EXPORT_SYMBOL_GPL(of_genpd_sync_state);
+
 static int genpd_provider_probe(struct device *dev)
 {
 	return 0;
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 0b18160901a2..3578196e6626 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -431,6 +431,7 @@ int of_genpd_remove_subdomain(const struct of_phandle_args *parent_spec,
 struct generic_pm_domain *of_genpd_remove_last(struct device_node *np);
 int of_genpd_parse_idle_states(struct device_node *dn,
 			       struct genpd_power_state **states, int *n);
+void of_genpd_sync_state(struct device_node *np);
 
 int genpd_dev_pm_attach(struct device *dev);
 struct device *genpd_dev_pm_attach_by_id(struct device *dev,
@@ -476,6 +477,8 @@ static inline int of_genpd_parse_idle_states(struct device_node *dn,
 	return -ENODEV;
 }
 
+static inline void of_genpd_sync_state(struct device_node *np) {}
+
 static inline int genpd_dev_pm_attach(struct device *dev)
 {
 	return 0;
-- 
2.43.0

