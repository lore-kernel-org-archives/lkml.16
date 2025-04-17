Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3E0251790
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899947; cv=none; b=ZRQ+N3ge9kiCHD1DDMgdJqzUgy9ZEc6BNYOrZNnvZZiGoH6omOPZoxxB66ddueq1faEVD77HnA7wL4tMXpxDJCOzuSaK5h+UP+iv9Jl/Ak8GIf2WnYW11KM1BA3J1pEM7C1MsWYjWVQntA2Q6Wu0A/fIoV8qM5MwDmcZbVk5pL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899947; c=relaxed/simple;
	bh=FqR3ie5m0T6TcJOI5Kn3DIPxCD+sBdJQs7QWqLz654U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IOENhCZmB4RPBdQGlgawi9kpjaOXjP32ckZlQa3r5sTx0kOP/SL7HRhNR35UF+DdqV5tA1kgbdROQkffglI9oMPc6NFCvbt6/u4stUSDfe+GVZZzYwqXCmbcSZUV9Vrxrs7uW7tuuvVolu4n+zCYNt0kI/SRvvKMOYyRrBvidDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YqrtB9e/; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YqrtB9e/"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-549967c72bcso989150e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899943; x=1745504743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs1DiDLKgL3lDGnxl5GpSbOlFK1Fei/oMNx+3W/PVKs=;
        b=YqrtB9e/dAIQd68nqjFw+ZhU5O6J8ph+hwiTU2zM+nnYJDz38FYcEyvM1hzRMkingf
         FaKDMWdDnkt/UItpPReuufZxklkw78xT/Pge2adoHgMCDlvJbUp9zL+Tqg4NToeeXu7K
         +rlv61dmedqmJlDbO1cFVBtL0Ht94lvXskO614M7Z3s533glvg6gms0vunDP25IfQ8BQ
         rRwgu7VOCXO89fGRQGJ+CWCqjVOi/DFjK1A/afgpPQrxmOr8qDfVzQoXqLLpdijfHSvl
         zsptgAauzDTXAVKpya8/sCEetQb634YcE8fw8WEOmSaHbEGvoOlE7DiyhaICJyZ37UfZ
         fTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899943; x=1745504743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zs1DiDLKgL3lDGnxl5GpSbOlFK1Fei/oMNx+3W/PVKs=;
        b=atdRiwIA+C9om2rMfg58jcjQJip+cLRVgXAgzpCLiHCjaMRGvtGGqgvKX6hFQXJXrX
         7vM4r4SOM7PoMcvifDhadUwViyRSYWxKAGS7MDmwt2MMT+zNgW4Gq3YUsWA+3H8jdxCU
         kAXu2lx2CbONriRzSJcYNTSdO0sjznnzWmGaeuebvtZLnaI5YJC2ZH+qo8wEDrk9KLqu
         NtDcrUE/fOZ+dyba2cD8+mn2Rg2uR7WfSd9qd4HSetNW5vNFXBSiaTZxDcnJTZhRx419
         sGUJV+jsWqbC+KQQDZCBwR21MBscSIHtDxH9ozwEvPWfR21YRyZwkOOAS8Vf9+OmAJVH
         Caeg==
X-Forwarded-Encrypted: i=1; AJvYcCWkp0t22CmNx/6GP6DWX9/pBu5IFTFxmxs2IC2Eyhh5nYBHSP6O0FWww3sZ1qCH6gNN3ziY27tbbxH45XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOe/NRC+d9ZdG7+NjUy/+tPe7tGWLPlZn9gLx3SCF4ceQFDZfo
	98sMIYKpOBejlGnP7ZB90+wB37xqHfnnMv3d2FotyRcQZy0lz3RWwG0EXeDCXB0=
X-Gm-Gg: ASbGncvCiq4wAYRqPoog380zR5A+ZJcZe0SJOcEpojWK4qlpr9Bpisd1CmeqYJWoz7N
	H49t9ND4Jp4sIyw7RC1PM13pyU/6z7zaGlHdgJHKma/Tz0TSp0DEyWGuY1YY7FOfzAAzX9NZaJv
	+Ou+7V+GEfETy0+TvZHebTkKddaq2Izyy9JyVpZgEmJp+z1/WgkEcIcHrFXvQLD2a8H9WPSE48z
	azBcK+zhis+0hggU5NKQ3OTV9bKoPlShV53J901yLP5SC7Vdx8BKHRA5/TV0Wab7wb08R7/kFyT
	eGb15w5gSlCdngzpGoPqFp2qz3CMnSuhYFqnvY+Lslg0jpBNt3dzc+THpdf3MS0AfmnvmWSjwHg
	g8dObPwg5Q/2W1vk=
X-Google-Smtp-Source: AGHT+IFUfAkPBWbRU7FiTAZgfCwrsStrMYMu+aAN9vO0F45zoHnvuEwiowloBQTqx+0Po2lAcPUf0g==
X-Received: by 2002:a05:6512:3d0d:b0:549:39b1:65c2 with SMTP id 2adb3069b0e04-54d64af049dmr2076429e87.48.1744899943408;
        Thu, 17 Apr 2025 07:25:43 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:42 -0700 (PDT)
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
Subject: [PATCH 07/11] pmdomain: core: Export a common ->sync_state() helper for genpd providers
Date: Thu, 17 Apr 2025 16:25:05 +0200
Message-ID: <20250417142513.312939-8-ulf.hansson@linaro.org>
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

In some cases the typical platform driver that act as genpd provider, may
need its own ->sync_state() callback to manage various things. In this
regards, the provider most likely wants to allow its corresponding genpds
to be powered-off.

For this reason, let's introduce a new genpd helper function,
of_genpd_sync_state() that helps genpd provider drivers to achieve this.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 28 ++++++++++++++++++++++++++++
 include/linux/pm_domain.h |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 5aba66ac78f1..512f89e6d302 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2619,6 +2619,34 @@ static bool genpd_present(const struct generic_pm_domain *genpd)
 	return ret;
 }
 
+/**
+ * of_genpd_sync_state() - A common sync_state function for genpd providers
+ * @dev: The device the genpd provider is associated with.
+ *
+ * The @dev that corresponds to a genpd provider may provide one or multiple
+ * genpds. This function makes use of the device node for @dev to find the
+ * genpds that belongs to the provider. For each genpd we try a power-off.
+ */
+void of_genpd_sync_state(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct generic_pm_domain *genpd;
+
+	if (!np)
+		return;
+
+	mutex_lock(&gpd_list_lock);
+	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
+		if (genpd->provider == &np->fwnode) {
+			genpd_lock(genpd);
+			genpd_power_off(genpd, false, 0);
+			genpd_unlock(genpd);
+		}
+	}
+	mutex_unlock(&gpd_list_lock);
+}
+EXPORT_SYMBOL_GPL(of_genpd_sync_state);
+
 /**
  * of_genpd_add_provider_simple() - Register a simple PM domain provider
  * @np: Device node pointer associated with the PM domain provider.
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 0b18160901a2..e9a1f8975c4f 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -418,6 +418,7 @@ struct genpd_onecell_data {
 };
 
 #ifdef CONFIG_PM_GENERIC_DOMAINS_OF
+void of_genpd_sync_state(struct device *dev);
 int of_genpd_add_provider_simple(struct device_node *np,
 				 struct generic_pm_domain *genpd);
 int of_genpd_add_provider_onecell(struct device_node *np,
@@ -438,6 +439,8 @@ struct device *genpd_dev_pm_attach_by_id(struct device *dev,
 struct device *genpd_dev_pm_attach_by_name(struct device *dev,
 					   const char *name);
 #else /* !CONFIG_PM_GENERIC_DOMAINS_OF */
+static inline void of_genpd_sync_state(struct device *dev) {}
+
 static inline int of_genpd_add_provider_simple(struct device_node *np,
 					struct generic_pm_domain *genpd)
 {
-- 
2.43.0

