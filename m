Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18571FFC46
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262084; cv=none; b=kZWE7BpcJ4jIi9kPCR81/C8t7gmou3z4Ty1NOW4WGWCSI9AQRTFTq6yLxLbxXhWfw8PBXxZpzt3xTA4Jdz3H32Yvjfjldd67KBtS9zMdPTDptT4biOtLBcUUfrpd3Q515VEzL/6aSMYQsvWmngjrdxYjbVXutKyhwGkFS/Itgfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262084; c=relaxed/simple;
	bh=KWwzDCjjG18fT8xW6cAYE3VLd5IE15tUhmWcO65s6W4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m0KR3AYCUwrnFHOSoKxGCJvDCb9S6q3ir1Xv+hU+ESvqCFsFlr2BVw9/JuuBmCsIGQejT8ogPTDkjR0oSNpBphmUrf+1Kz44l0nTcJ55A6c58LKeBAXzlXBXG+oVSvVyyY39gldMmeoiDHgmw8kQW9qEDxrSCxkPVYf2Ky8J+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LgBdsi46; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LgBdsi46"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad216a5a59cso280729966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748262079; x=1748866879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbJUWdOsVxF3giB8Ozh7+t9RUE5aBB4VpYJNrYUW3+w=;
        b=LgBdsi46z5+XwnfILszp4c8/5WuDQuBXLmggFxLUq1yvsDgncpyteGnl2BWvAyNMiR
         pvkh0wMQom90xhNCcjnp4RZ5i3KXUXi61vQeOUKtpCKhD/nFpjVeIHw4atVwdy7hdwX1
         z5XHLKDKumWau8QxOmzjXVHmOCqLypV4KfIcajFjS7C98LScKpbGyDseqBSKJD0BL89o
         3s10DCSvSWfnNVE8xE6V5DLn9u4FSF5n/QY5CKl4XdObcV1peaHpskKBmTaF2asCjr29
         YL63XYdncn69jIRPpk5KdCD2gAGWZNTW5lIr236eSNXShUXsF00Krl93WT59cDPvqBQ6
         rsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748262079; x=1748866879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbJUWdOsVxF3giB8Ozh7+t9RUE5aBB4VpYJNrYUW3+w=;
        b=bDkQInbR7SQonqGIWcEQ02KgT6MuLFJBEne7q+jcTVQD1M/AO9grn3vHLYew9cu1Ez
         Ld53HEc9TtM+Ailow/mRB+g+Nb0ShNOAjb9j55wyex9RXi8mRcp/55xuqWzxY56NoFtx
         vfLuQ4e69dJn9bM9OgoAWejQDRpdw6BkN0gU8eL3tUEbLWf32dDWlwycrT/GOeMWEaiM
         0stHxoLGxooZcv+uItSfRShZ9OtODHFGNp6WVvBXKaqaW2YKnIDRqetY3r/0ZRmUOhfA
         1OuR8MSw6HTHrYi12qskJZXRFc4nceV5zDwXFqhhu9Nrs2kxTVlHNLInMp826c1+d+Ft
         6VIw==
X-Forwarded-Encrypted: i=1; AJvYcCXtmCpf6lNgxKFrBwO1gWl69dz9arH8XMy9IrmVIMZl1Dq3iL+k8PNhwi5xPh6R6bzOdm9mqZ+ZMyoLqfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyajdgoFU5CoZRLi0MT0awG2i9+p2SQICXO16q3zLf/40hopl1n
	cUf9RekQlnlgUVz67Xtr5C5fnno6HKt+fZ2J7qgJk/lQpEAR7gYGesfGycq4RghLK18=
X-Gm-Gg: ASbGncsl5IJZqKmgUBz/iVRhSUN21S2nsqJ4skur1XKbgVyh7xUECNB3R9/dJ+2cthh
	61GTWpIYrWpbjvWPnR+XrwYKw9ov56CIRl17wz3ggdeSTe/R17l3E+NBAgFLypDpPltutaItzpD
	LHrQofnd2H+XnYXn7utlpOFAthwcsuDcHx9nzxBaFCcP1uwO7gD9rn45nNYnpCATeaAlLx8EyHO
	CDsGkVFgKD6NO5e1JWRAv8y+NfbV2fgP4VJ4dp6UxvClyu2cFsncVHMG86/C7bLo0KWAhDWNEB8
	QI41QxS8vzu5rLthh+IUn1EVmTVDJ9FbXbU24zLqap+p0SgcnyKM9MAnJPP5II1GCvd8HaBI0xH
	dXfxv
X-Google-Smtp-Source: AGHT+IFzn8pObOT2e9m03kGlgIH4jUcwkUCOFOcpQ8RfJK68WHE+CNfFZct1ljVHOLC2VTkxUWLOVg==
X-Received: by 2002:a17:907:7fa5:b0:ad4:cc66:1524 with SMTP id a640c23a62f3a-ad85b21206amr829348166b.54.1748262078944;
        Mon, 26 May 2025 05:21:18 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d071c36sm1687630066b.64.2025.05.26.05.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 05:21:18 -0700 (PDT)
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
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	bhelgaas@google.com,
	geert@linux-m68k.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 1/2] PM: domains: Add devres variant for dev_pm_domain_attach()
Date: Mon, 26 May 2025 15:20:53 +0300
Message-ID: <20250526122054.65532-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526122054.65532-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250526122054.65532-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v2:
- none; this patch is new

 drivers/base/power/common.c | 59 +++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h   |  8 +++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
index 781968a128ff..6ef0924efe2e 100644
--- a/drivers/base/power/common.c
+++ b/drivers/base/power/common.c
@@ -115,6 +115,65 @@ int dev_pm_domain_attach(struct device *dev, bool power_on)
 }
 EXPORT_SYMBOL_GPL(dev_pm_domain_attach);
 
+/**
+ * devm_pm_domain_detach_off - devres action for devm_pm_domain_attach() to
+ * detach a device and power it off.
+ * @dev: device to detach.
+ *
+ * This function reverse the actions from devm_pm_domain_attach().
+ * It will be invoked during the remove phase from drivers implicitly.
+ */
+static void devm_pm_domain_detach_off(void *dev)
+{
+	dev_pm_domain_detach(dev, true);
+}
+
+/**
+ * devm_pm_domain_detach_on - devres action for devm_pm_domain_attach() to
+ * detach a device and power it on.
+ * @dev: device to detach.
+ *
+ * This function reverse the actions from devm_pm_domain_attach().
+ * It will be invoked during the remove phase from drivers implicitly.
+ */
+static void devm_pm_domain_detach_on(void *dev)
+{
+	dev_pm_domain_detach(dev, false);
+}
+
+/**
+ * devm_pm_domain_attach - devres-enabled version of dev_pm_domain_attach()
+ * @dev: Device to attach.
+ * @attach_power_on: Use to indicate whether we should power on the device
+ *                   when attaching (true indicates the device is powered on
+ *                   when attaching).
+ * @detach_power_off: Used to indicate whether we should power off the device
+ *                    when detaching (true indicates the device is powered off
+ *                    when detaching).
+ *
+ * NOTE: this will also handle calling dev_pm_domain_detach() for
+ * you during remove phase.
+ *
+ * Returns 0 on successfully attached PM domain, or a negative error code in
+ * case of a failure.
+ */
+int devm_pm_domain_attach(struct device *dev, bool attach_power_on,
+			  bool detach_power_off)
+{
+	int ret;
+
+	ret = dev_pm_domain_attach(dev, attach_power_on);
+	if (ret)
+		return ret;
+
+	if (detach_power_off)
+		return devm_add_action_or_reset(dev, devm_pm_domain_detach_off,
+						dev);
+
+	return devm_add_action_or_reset(dev, devm_pm_domain_detach_on, dev);
+}
+EXPORT_SYMBOL_GPL(devm_pm_domain_attach);
+
 /**
  * dev_pm_domain_attach_by_id - Associate a device with one of its PM domains.
  * @dev: The device used to lookup the PM domain.
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 0b18160901a2..ee798b090d17 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -509,6 +509,8 @@ struct device *dev_pm_domain_attach_by_name(struct device *dev,
 int dev_pm_domain_attach_list(struct device *dev,
 			      const struct dev_pm_domain_attach_data *data,
 			      struct dev_pm_domain_list **list);
+int devm_pm_domain_attach(struct device *dev, bool attach_power_on,
+			  bool detach_power_off);
 int devm_pm_domain_attach_list(struct device *dev,
 			       const struct dev_pm_domain_attach_data *data,
 			       struct dev_pm_domain_list **list);
@@ -539,6 +541,12 @@ static inline int dev_pm_domain_attach_list(struct device *dev,
 	return 0;
 }
 
+static int devm_pm_domain_attach(struct device *dev, bool attach_power_on,
+				 bool detach_power_off)
+{
+	return 0;
+}
+
 static inline int devm_pm_domain_attach_list(struct device *dev,
 					     const struct dev_pm_domain_attach_data *data,
 					     struct dev_pm_domain_list **list)
-- 
2.43.0

