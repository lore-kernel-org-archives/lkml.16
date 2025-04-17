Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032C8252284
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899940; cv=none; b=FKqNqjbu7dUhiNKZiTJfwoTd4ATqIWK9mT8Ro8sUZkMhWMq20jIxaw7T33ZlrhAUYJDQcf4qd3F5ghqtUkfCwYQ7MMcKKWJVwnIG4lupc/mkRKfR/vUtjuRpr40937cP40te6U9YuAOVzqXocvONbElyVIZAS0QLKIL3XBy8R98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899940; c=relaxed/simple;
	bh=9Au4Fe2OLSeRsUR1xwYHxdSnAkAsfOjjKZwl2VCoWc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qLfRGM0bYzgrx2UawoIfF6T+mn369q7q1py4Bb7RZms/gUPUiqCTGESi1Q64oBto0sn1LB7YScEtVujOW7a7LoWXDTsf0+Y1ET2s7NbYLTW1P/mRztuq+dyE49ZtMhsmU7gPRm/HNT8lfRdvRI4XEjQOpJQuU9X7hvW1DgX06eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ijiDNEaB; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ijiDNEaB"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54d42884842so1113205e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899937; x=1745504737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J79qRcZGJZJmCItGNs9XR09SxwFcm6gRBRDcexcVIfk=;
        b=ijiDNEaBaxLMYig1oNR9LWDd2a1dIGwM9A8nWnjLQkun68n+s0wh1avqAqo8GHOuO8
         T5nsMhnjs0lRWoV7I8ayUpgtmvo+483R0M46LOlAREimkJOi9lnu4lPNgapEnZhn+YWT
         wT1MucED4DaSYGbhXNna0P1XSv3o+dCOzLaFGmwVzryKNk1Fct3xLxndNP3dsfmtz51e
         b0JkdyqN6GzRuxD8BtuVc9PdHmQ3c7KNwNvjGwZQvY+rRt4EL9EuHN7GYPF4oOkeH4Lz
         gn+eQczWUlalS8PbbqQ3v7Os4KJmqNjGdBq89Vv5DgG6bYYz6CjnTuD+JhvOJerDEFgu
         BZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899937; x=1745504737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J79qRcZGJZJmCItGNs9XR09SxwFcm6gRBRDcexcVIfk=;
        b=JctAocEEDGSEjtfeaUuU5TP+UXWiqsXqMNYyQbeffmy1rToKcwZenN206BIPZqKUbv
         wQA/AcRmSvzGmsNPlys0nX0dkwcdzJckTLut2aXaDEAlHB7quNmZH87mzJeF7wPMz9Mt
         ojCNEOFdlNsKCHENMHHPvgLEUy/T1Ry4WGfH+9Je5EasbQKO3+mU60BAPNds1uZZsXiW
         p1/6vENc7I18SBRYLiaQrGADvdpRvacrzzUJmjmJosBteNf6aYKktDMyVcK1dqWKiENj
         Vf3F+7UU0Q4wFkIir/hFr/HMYHuqhTYFIotrhO+Vu1+Qs9kVamTWib3jUbxVuiHmDkdQ
         YrMw==
X-Forwarded-Encrypted: i=1; AJvYcCV3IUxVixxdEEmbdSfS9e6yMKg8YqNDmX1KYFQazUhDIpgwf12FQ4tuaqG9CtzCQnStLUiuE6NoDMGalmg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/PTPHv6ebfyNofcSS03edp8bw+uMwJE160q4YisUBVK97aBJR
	yadMNXnwmAbfZAFC4+32BwbvzTv7W8HlhD5QJadJDBVJiByZj3wCZ5PbgCjfDLI=
X-Gm-Gg: ASbGncvJzhcJSyd2y0MnJ3WIWiEYT9/lXTjY0Y3LBgijF//9rytNAYSDytyhx92bIjE
	XxxBdDgfHf36wLKQKlghMgjc+3aX8IUcSkhB7e75Wih9dv24sgqz6rOLiorpTm7jH2kDF/+8PLv
	POVZF1rw746v1hK14SXjsYaEJk7H0XQeDkLgpy+uuG0c+wJcZY1XroAdeIUF+USgkzLgD9D/BXT
	AjFIF4oCpjQQpiQv7eNyxzZvc3RNuG7lelV9DOVslDJV88wvOwKvvS8jD6ubYpyt56U8Dj+Rv1M
	Bas1ZpaChNbQSd34HAQf7dW9bBAKt8PAZ2Yb5gsmtwVC7otdWHjGsa8GELx50bXGwmlc5QKfldM
	LBqQvcXKdS1ku/pIs6LsdjUu2ZA==
X-Google-Smtp-Source: AGHT+IFiUhuBtQQApad2nNH4tL0zFojb+VPiB8t6cSOcnI01Uz7KMV7xXLgUmCgNPnGefcFd0iptEA==
X-Received: by 2002:ac2:4e0b:0:b0:54a:cc11:b558 with SMTP id 2adb3069b0e04-54d64ab204amr1985603e87.33.1744899937335;
        Thu, 17 Apr 2025 07:25:37 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:36 -0700 (PDT)
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
Subject: [PATCH 04/11] pmdomain: core: Add a bus and a driver for genpd providers
Date: Thu, 17 Apr 2025 16:25:02 +0200
Message-ID: <20250417142513.312939-5-ulf.hansson@linaro.org>
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

When we create a genpd via pm_genpd_init() we are initializing a
corresponding struct device for it, but we don't add the device to any
bus_type. It has not really been needed as the device is used as cookie to
help us manage OPP tables.

However, to prepare to make better use of the device let's add a new genpd
provider bus_type and a corresponding genpd provider driver. Subsequent
changes will make use of this.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 89 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 035b65563947..da51a61a974c 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -27,6 +27,11 @@
 /* Provides a unique ID for each genpd device */
 static DEFINE_IDA(genpd_ida);
 
+/* The parent for genpd_provider devices. */
+static struct device genpd_provider_bus = {
+	.init_name = "genpd_provider",
+};
+
 #define GENPD_RETRY_MAX_MS	250		/* Approximate */
 
 #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)		\
@@ -44,6 +49,14 @@ static DEFINE_IDA(genpd_ida);
 static LIST_HEAD(gpd_list);
 static DEFINE_MUTEX(gpd_list_lock);
 
+#define to_genpd_provider_drv(d) container_of(d, struct genpd_provider_drv, drv)
+
+struct genpd_provider_drv {
+	struct device_driver drv;
+	int (*probe)(struct device *dev);
+	void (*remove)(struct device *dev);
+};
+
 struct genpd_lock_ops {
 	void (*lock)(struct generic_pm_domain *genpd);
 	void (*lock_nested)(struct generic_pm_domain *genpd, int depth);
@@ -2225,6 +2238,26 @@ static int genpd_set_default_power_state(struct generic_pm_domain *genpd)
 	return 0;
 }
 
+static int genpd_provider_bus_probe(struct device *dev)
+{
+	struct genpd_provider_drv *drv = to_genpd_provider_drv(dev->driver);
+
+	return drv->probe(dev);
+}
+
+static void genpd_provider_bus_remove(struct device *dev)
+{
+	struct genpd_provider_drv *drv = to_genpd_provider_drv(dev->driver);
+
+	drv->remove(dev);
+}
+
+static const struct bus_type genpd_provider_bus_type = {
+	.name		= "genpd_provider",
+	.probe		= genpd_provider_bus_probe,
+	.remove		= genpd_provider_bus_remove,
+};
+
 static void genpd_provider_release(struct device *dev)
 {
 	/* nothing to be done here */
@@ -2262,6 +2295,8 @@ static int genpd_alloc_data(struct generic_pm_domain *genpd)
 	genpd->gd = gd;
 	device_initialize(&genpd->dev);
 	genpd->dev.release = genpd_provider_release;
+	genpd->dev.bus = &genpd_provider_bus_type;
+	genpd->dev.parent = &genpd_provider_bus;
 
 	if (!genpd_is_dev_name_fw(genpd)) {
 		dev_set_name(&genpd->dev, "%s", genpd->name);
@@ -3355,9 +3390,61 @@ int of_genpd_parse_idle_states(struct device_node *dn,
 }
 EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
 
+static int genpd_provider_probe(struct device *dev)
+{
+	return 0;
+}
+
+static void genpd_provider_remove(struct device *dev)
+{
+}
+
+static void genpd_provider_sync_state(struct device *dev)
+{
+}
+
+static struct genpd_provider_drv genpd_provider_drv = {
+	.drv = {
+		.name = "genpd_provider",
+		.bus = &genpd_provider_bus_type,
+		.sync_state = genpd_provider_sync_state,
+		.suppress_bind_attrs = true,
+	},
+	.probe = genpd_provider_probe,
+	.remove = genpd_provider_remove,
+};
+
 static int __init genpd_bus_init(void)
 {
-	return bus_register(&genpd_bus_type);
+	int ret;
+
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
+	ret = bus_register(&genpd_bus_type);
+	if (ret)
+		goto err_prov_bus;
+
+	ret = driver_register(&genpd_provider_drv.drv);
+	if (ret)
+		goto err_bus;
+
+	return 0;
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

