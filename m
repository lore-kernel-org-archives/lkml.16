Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE602741A2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370474; cv=none; b=qzRLu47nw+7kfQWLkMsiN12HrHmcvaC3B/1GqrXi8imTgnBvdkhz/jGsrssXEK0i1+5YiiNYUuM2NGLRKh+rvvqQ7aKDt1/RBWbzKcuoLuHN5+hNIrj5EMiVJolztY3R3rGBdPk+pi0tYBRksrYhe1qbGf6LW6RCz9Lm/0n7AgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370474; c=relaxed/simple;
	bh=MQCAjJcJip6Amsxmt2Lzclp4RD2ddw7DtBpQ6/OAbs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9fubPhdT0G86NomSvoIIg5sKBqj7Y5rnX8enVc8WclsiQAe1nZOUlpufusCMa7dzbttNswkGN2XkNX8VsK6IUsciZwMz9al5JgdZiNR3vAIxfoQXH4KT9vmzKCVictiocqxL2KZVoWoxDDMF7Z7rOziR289M96EVGH/CskvTBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M/PmXTXR; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M/PmXTXR"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32addf54a01so57412891fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370471; x=1751975271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CajxEdIrhbFO4ax/v+i8H3+X7djNNFGL84d/W5pIrjo=;
        b=M/PmXTXRKn3/Bw9FHdFU3Z1l01jiCLltFb7kkH5RnF6zfGQCDjEqI0U8T3QogMRGjP
         yHhP5lIiPd6Z0YnbsjiuaKIJqtMS/o7Yhjp+tR2Q9A5vpu6Pyp9QAZVES1O8x81Fpqgh
         d+kyhbztnoVwai3qR+gtoSLCxv2npT7oJiOsMWqjp0Csqt9+ZuRLFhd6w1VHbAyKR5QZ
         ErMXWRvaIGR0Z+iB18GflhBrZ8Msc8R3wuVv3lEgcBKa2FrKE3GMltjpjz8bBvKC8HLy
         vcAjNMq/CwiG91CDVcJis5eyFZ+z4MlyUW1mHjL8UY6DY0Dx46dJueBsF/TNGFHN0H78
         TzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370471; x=1751975271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CajxEdIrhbFO4ax/v+i8H3+X7djNNFGL84d/W5pIrjo=;
        b=tV7npDvArFaRLsrCcKYTHo90UjXuJt3WoqRy92rVzHmVIcKuf8YIYsDy2G6NA88EK1
         HCjG1GTSRkxGIKFw/FyGDofN+PCvIszM8gL/DP3cmt9hgnnAwS/oVIM8jmSBiUscmej7
         aseuYKsZJxWEtymtx3hk/WqslQcOAx5Nqq+hMWqgrHmIUvNZJ6clqor9VYBTbU0aZJsY
         eAdy9oK/n89qRICDpfhKW8lrrgOzHcKS00zaXKmLVJh/5WEdzZY0K/2nng7v34ibSiMp
         Wil8HFhy55RorbJDQr1DXYFNVCZWhWiLUbPGFvD4MnPwqL7u0bU1WtSbyqfDvFnuNcPd
         8sEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW74CW9p86eI60VPnmoyd1CORk6qqe6UYTKSQI1X3G5YArKlXN14kyssyxPCaFo/iA6fK5FRQfPEeUk2TE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRGl8471m7esUt1K0FVYBncz4NL+B6N7R46C5vYYDBy2qHp6q9
	uO38NIem9vLnH9Vec88llrCTM+Xt15SBVXOlb+Sn5/+dsSqO/4Z9vl7vuIn8NLXCTz4=
X-Gm-Gg: ASbGnctc2npReg0H0iOuXLE+ba5sfh73Nq/7zIBxq+ZpGTyEVmwryJyt/iuz7l2uPlq
	F5K6qouJ321pkpmZQ6t00lTAYZky+Tl0pFQ0FogoxvwSEgCx13Tbv4fWrQKkOQNL5G+42u/CFhJ
	mcUPCFe04Ml7JdILrLPGGRQ3emN4VEJLSmM7W5d7FA3SHErDGTnje8MjZdapwxKjk3Vv6UQxZoH
	4VElEXS59VEiENJ6FM6GTEceO0zOa/ppN3HNl9nsMEa3J3LZ/bhMB0Sppc5jX7KtsQQdKGrpUNu
	1Sw5ihkNKQ0axYi7sa0dJnrMKJp2p1Kb3fO1fygUODCYeEB0eUU3XHipYm2ghyps9OHYFWlCPjm
	5jki6A8pdC4QB4z/29Z2L0jNmEPzKiyE21QUASUjOIj1ftl0=
X-Google-Smtp-Source: AGHT+IGMamMYGx3FPuo7ZJUyd1tcu3muckiZRnDf4isS1MMvNhp9nd+F41aF57MMOFDi0e6yJafIcA==
X-Received: by 2002:a05:6512:1112:b0:553:543d:d96b with SMTP id 2adb3069b0e04-5550b869e02mr5271751e87.11.1751370470821;
        Tue, 01 Jul 2025 04:47:50 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:50 -0700 (PDT)
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
Subject: [PATCH v3 05/24] pmdomain: core: Add a bus and a driver for genpd providers
Date: Tue,  1 Jul 2025 13:47:07 +0200
Message-ID: <20250701114733.636510-6-ulf.hansson@linaro.org>
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

When we create a genpd via pm_genpd_init() we are initializing a
corresponding struct device for it, but we don't add the device to any
bus_type. It has not really been needed as the device is used as cookie to
help us manage OPP tables.

However, to prepare to make better use of the device, let's add a new genpd
provider bus_type and a corresponding genpd provider driver. Subsequent
changes will make use of this.

Suggested-by: Saravana Kannan <saravanak@google.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- Dropped unnecessary callbacks and convert to use struct device_driver.

---
 drivers/pmdomain/core.c | 53 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 93d71164fc56..a41f5f91e87f 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -27,6 +27,16 @@
 /* Provides a unique ID for each genpd device */
 static DEFINE_IDA(genpd_ida);
 
+/* The bus for genpd_providers. */
+static const struct bus_type genpd_provider_bus_type = {
+	.name		= "genpd_provider",
+};
+
+/* The parent for genpd_provider devices. */
+static struct device genpd_provider_bus = {
+	.init_name = "genpd_provider",
+};
+
 #define GENPD_RETRY_MAX_MS	250		/* Approximate */
 
 #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)		\
@@ -2262,6 +2272,8 @@ static int genpd_alloc_data(struct generic_pm_domain *genpd)
 	genpd->gd = gd;
 	device_initialize(&genpd->dev);
 	genpd->dev.release = genpd_provider_release;
+	genpd->dev.bus = &genpd_provider_bus_type;
+	genpd->dev.parent = &genpd_provider_bus;
 
 	if (!genpd_is_dev_name_fw(genpd)) {
 		dev_set_name(&genpd->dev, "%s", genpd->name);
@@ -3360,16 +3372,55 @@ int of_genpd_parse_idle_states(struct device_node *dn,
 }
 EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
 
+static int genpd_provider_probe(struct device *dev)
+{
+	return 0;
+}
+
+static void genpd_provider_sync_state(struct device *dev)
+{
+}
+
+static struct device_driver genpd_provider_drv = {
+	.name = "genpd_provider",
+	.bus = &genpd_provider_bus_type,
+	.probe = genpd_provider_probe,
+	.sync_state = genpd_provider_sync_state,
+	.suppress_bind_attrs = true,
+};
+
 static int __init genpd_bus_init(void)
 {
 	int ret;
 
+	ret = device_register(&genpd_provider_bus);
+	if (ret) {
+		put_device(&genpd_provider_bus);
+		return ret;
+	}
+
+	ret = bus_register(&genpd_provider_bus_type);
+	if (ret)
+		goto err_dev;
+
 	ret = bus_register(&genpd_bus_type);
 	if (ret)
-		return ret;
+		goto err_prov_bus;
+
+	ret = driver_register(&genpd_provider_drv);
+	if (ret)
+		goto err_bus;
 
 	genpd_bus_registered = true;
 	return 0;
+
+err_bus:
+	bus_unregister(&genpd_bus_type);
+err_prov_bus:
+	bus_unregister(&genpd_provider_bus_type);
+err_dev:
+	device_unregister(&genpd_provider_bus);
+	return ret;
 }
 core_initcall(genpd_bus_init);
 
-- 
2.43.0

