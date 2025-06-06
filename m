Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE24286D5B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749208685; cv=none; b=pBkeULyRVM8srhJH6uIk+RWZUBQe5vjiW4IEJHF6qug4zU+ZN0+iJaPx53GO8aTb3xLny7194IFiZi6kiIoetUvQl8lV+DYj4wt55gr0Z/p1tvEizL0y9MGMYZ9jY6ldyZ2WRD4jodRE361Ec4TrOGsvq3G1kCr5hxJYWVfvFR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749208685; c=relaxed/simple;
	bh=2Zf9PqQ/xdsUa49ohUw4b0FzbCTktzpyC6txhBl+f2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YaDDHyrzCHNxESzpZv6tcEOYCGrOTLBBfcjKmiy0yN6InGi4aB4ExG/15wxhixt3Cb+j+noBffbAM4UZy/dC29S3GgbCzHrJiTzjRWPYXZHAkuYMpewUMt6ARnx9cpr5b+EAMf2hDBpRbNB0H0yvg+F/OwvZ9WAt45Tm5aOVgFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DBKCcI3b; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DBKCcI3b"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-601f278369bso3965751a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 04:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749208679; x=1749813479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9UeLBEeNgVFZxNvwdqTWlF8knLYtgrdcWBf2xtn+Ko=;
        b=DBKCcI3bfOOqblSO59w3vot2T5GnEqknF0Su7dLvhZMIBNr8p9BZ95rbGQbs3j4WpD
         qbCqEYY4hLdbAhb3jWAM/2NyRD+25CDi5k5tBlusNs7gxbHSWTpwAc18MRXAolRyD/x9
         KHxaM76gTLUXbwsQtU4VVHC9Bbe1B05dEhSP0wcTErxGdzmOdauyErGGZNi/yIENpjcr
         GS5mcAYz5FliR/9cUX2FdYs6igndNfZ2S4ql5b9CBk2K4gfygovFfhGcqB8fFbjJwjBu
         FKDBTtlIxndAzYjsRtVlNuF7Sit+Yo82+6a4us7WK2tZKW+ZsAnHZwe0U5HmIM7NYLlN
         dvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749208679; x=1749813479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9UeLBEeNgVFZxNvwdqTWlF8knLYtgrdcWBf2xtn+Ko=;
        b=ZjEorTLqctYVJdS+3VVpehc01GTofFH7L75/dg0DKT8giBTwEUiIhPFd/9Xk78L2YV
         NdXJU5YZ2DlV1alm+eXsIyKZie2NFJbB0LkK3NOJn2kG5AqJg7ACoVTV8hc9OKoPYf/a
         y5IAqSba9w4WXG4TBxkT2NiOxjFyyDhKeBM10q9Gw72L2rWAsD7poO1UqQhXcNZ3jTuN
         j60DzNi4LKTg1zjD7mw/0fLDCJ9u5Rw33G3EnWGMoME42Udim/kc2CujFiUJjTwlGafE
         InW7cppwvui6e7Bgf2j/yUB5VMSSP5cnwqVh5JMAkre0/AUSuFBq2nLMGHkwPTOEBdyA
         X9WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeIbN3wukOSbftPkFfaB4aaPB5EC1IAZewGRTRomm9AYEAHvv7mcJPuymQp0ooJZ3iIuf5JWHxlZT3Wd8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgxzx0PSynYrUvOpmmNZilx0VCnmP0A6rVVlCorbpad3jk6Gjc
	R9CI/vN0kn1B5Jk2Y5eTsRftxc0j/dk1zIbYJmbefireqhqo2VGZ1FOFpEuJCIj6W0g=
X-Gm-Gg: ASbGnctA84QVRqBfXsKUby5uM+8gpbb/nx1ExbWU1VzLsuUvWWXwvs+oGnrJp/d5Y9W
	Timq+pphXPSwc9RrQp3WP2I5dAw+naLWbSkfHRMZ4r/jLXYE8vzfsm3+n6v7ulyUKpTV5p0C2cd
	0ZA4ZYXTeSeP+s53fI88LLyKxfXRULyYqgEme/DwKWiSmlG0bjlpkWdbKkFutnMd9m+xi+I1a5R
	nYBceli4lgtJ9p2BjXRYPs7PCCem5tEFjShILGeW8yv1+jfnmUBHZKQ9yr7op2NlcLkSa/4xdlA
	QqIY76XF/TjwmqASOtatwNZOOyyLpiYSjnwH4QfvpSWZwunxu2maWevt8xoCg4zP5BiG6ObPZVa
	hzrliXw==
X-Google-Smtp-Source: AGHT+IG4VTq1mx5DeffErAs95tbKPfwNXjlN3PvJEQqp28QpBbWUEU9bT6nIWpBgMvdagmloO4L2qg==
X-Received: by 2002:a17:907:d24:b0:adb:41b1:feca with SMTP id a640c23a62f3a-ade1ab99b91mr213537666b.61.1749208678682;
        Fri, 06 Jun 2025 04:17:58 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc7b566sm98704566b.164.2025.06.06.04.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 04:17:58 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	len.brown@intel.com,
	pavel@kernel.org,
	ulf.hansson@linaro.org,
	jic23@kernel.org,
	daniel.lezcano@linaro.org,
	dmitry.torokhov@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	bhelgaas@google.com,
	geert@linux-m68k.org,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	fabrizio.castro.jz@renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 1/2] PM: domains: Add devres variant for dev_pm_domain_attach()
Date: Fri,  6 Jun 2025 14:17:48 +0300
Message-ID: <20250606111749.3142348-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606111749.3142348-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250606111749.3142348-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The dev_pm_domain_attach() function is typically used in bus code alongside
dev_pm_domain_detach(), often following patterns like:

static int bus_probe(struct device *_dev)
{
    struct bus_driver *drv = to_bus_driver(dev->driver);
    struct bus_device *dev = to_bus_device(_dev);
    int ret;

    // ...

    ret = dev_pm_domain_attach(_dev, true);
    if (ret)
        return ret;

    if (drv->probe)
        ret = drv->probe(dev);

    // ...
}

static void bus_remove(struct device *_dev)
{
    struct bus_driver *drv = to_bus_driver(dev->driver);
    struct bus_device *dev = to_bus_device(_dev);

    if (drv->remove)
        drv->remove(dev);
    dev_pm_domain_detach(_dev);
}

When the driver's probe function uses devres-managed resources that depend
on the power domain state, those resources are released later during
device_unbind_cleanup().

Releasing devres-managed resources that depend on the power domain state
after detaching the device from its PM domain can cause failures.

For example, if the driver uses devm_pm_runtime_enable() in its probe
function, and the device's clocks are managed by the PM domain, then
during removal the runtime PM is disabled in device_unbind_cleanup() after
the clocks have been removed from the PM domain. It may happen that the
devm_pm_runtime_enable() action causes the device to be runtime-resumed.
If the driver specific runtime PM APIs access registers directly, this
will lead to accessing device registers without clocks being enabled.
Similar issues may occur with other devres actions that access device
registers.

Add devm_pm_domain_attach(). When replacing the dev_pm_domain_attach() and
dev_pm_domain_detach() in bus probe and bus remove, it ensures that the
device is detached from its PM domain in device_unbind_cleanup(), only
after all driver's devres-managed resources have been release.

For flexibility, the implemented devm_pm_domain_attach() has 2 state
arguments, one for the domain state on attach, one for the domain state on
detach.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- dropped devm_pm_domain_detach_off(), devm_pm_domain_detach_on()
  and use a single function devm_pm_domain_detach()

Changes in v2:
- none; this patch is new

 drivers/base/power/common.c | 50 +++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h   |  6 +++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
index 781968a128ff..82ea20b343f5 100644
--- a/drivers/base/power/common.c
+++ b/drivers/base/power/common.c
@@ -115,6 +115,56 @@ int dev_pm_domain_attach(struct device *dev, bool power_on)
 }
 EXPORT_SYMBOL_GPL(dev_pm_domain_attach);
 
+/**
+ * devm_pm_domain_detach - devres action for devm_pm_domain_attach() to
+ * detach a device from its domain.
+ * @dev: device to detach.
+ * @res: indicate if the device should be powered off
+ *
+ * This function reverse the actions from devm_pm_domain_attach().
+ * It will be invoked during the remove phase from drivers implicitly.
+ */
+static void devm_pm_domain_detach(struct device *dev, void *res)
+{
+	bool *power_off = res;
+
+	dev_pm_domain_detach(dev, *power_off);
+}
+
+/**
+ * devm_pm_domain_attach - devres-enabled version of dev_pm_domain_attach()
+ * @dev: Device to attach.
+ * @power_on: Use to indicate whether we should power on the device
+ *            when attaching.
+ *
+ * NOTE: this will also handle calling dev_pm_domain_detach() for
+ * you during remove phase.
+ *
+ * Returns 0 on successfully attached PM domain, or a negative error code in
+ * case of a failure.
+ */
+int devm_pm_domain_attach(struct device *dev, bool power_on)
+{
+	bool *power_off;
+	int ret;
+
+	power_off = devres_alloc(devm_pm_domain_detach, sizeof(*power_off), GFP_KERNEL);
+	if (!power_off)
+		return -ENOMEM;
+
+	ret = dev_pm_domain_attach(dev, power_on);
+	if (ret) {
+		devres_free(power_off);
+		return ret;
+	}
+
+	*power_off = power_on;
+	devres_add(dev, power_off);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_pm_domain_attach);
+
 /**
  * dev_pm_domain_attach_by_id - Associate a device with one of its PM domains.
  * @dev: The device used to lookup the PM domain.
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 0b18160901a2..f78b6b4dd734 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -509,6 +509,7 @@ struct device *dev_pm_domain_attach_by_name(struct device *dev,
 int dev_pm_domain_attach_list(struct device *dev,
 			      const struct dev_pm_domain_attach_data *data,
 			      struct dev_pm_domain_list **list);
+int devm_pm_domain_attach(struct device *dev, bool power_on);
 int devm_pm_domain_attach_list(struct device *dev,
 			       const struct dev_pm_domain_attach_data *data,
 			       struct dev_pm_domain_list **list);
@@ -539,6 +540,11 @@ static inline int dev_pm_domain_attach_list(struct device *dev,
 	return 0;
 }
 
+static inline int devm_pm_domain_attach(struct device *dev, bool power_on)
+{
+	return 0;
+}
+
 static inline int devm_pm_domain_attach_list(struct device *dev,
 					     const struct dev_pm_domain_attach_data *data,
 					     struct dev_pm_domain_list **list)
-- 
2.43.0

