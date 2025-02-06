Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6D71A4E98
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866221; cv=none; b=g3QZJzyt6OPkakdLaINMGVfTR8aZjfvU5II78rXnjGF9WZPpgFTBINLxl7saxFKT48VnazPZcp31d0e5somH6Kdn18m8xI8KjPZ8H8QvwtwFPZq2Kvu6zRoM9qk6oWCe4BeE5ic3RPIK+sx3t+UOMH0o9lvoXe7RhFRlZpkQMgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866221; c=relaxed/simple;
	bh=ucfZEBgK7yNHdj3H6oyHJK0qZDE1K1JMGLWDliaebGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JvHDExOArPTWZTbN/FIJm5CF9tIlF7ohH2DziqwR1NIWwikM+aqpn9Ka7/vkA7Bq9A5XLFMq7Ni8z8ISZHFxpcfZgK+k/S+CzDifxBeM3zs5O/5BFGKPrAcnU7ixJgpa73K4+m9AEsSDRk+kaL/aes7xIrfvR5smGC6WTMPj2XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dtH+OA9z; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dtH+OA9z"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38db6e13947so976377f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738866217; x=1739471017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AB6GXJU+o+aIRSK7UeYMrt5UjMJvamba11+xgHvlj+I=;
        b=dtH+OA9zF+QJar/jO4QxA1eX8Qyy784Dn2sbET6jlw/kAn1GNpARThusRKA/dTwS4a
         hfYl/VMExlkN5WsgEq+YCNdnfXOhI0CvCs65XFw7sIaSF8WwKov6vuzLUWprJ8eGAnCX
         HuQGCUq3TmVQUxJfpctGObJSjnWD1j6RdnCoRoljyl82Ok3j3CVeX8rT2GCtw31JzWUQ
         AimVbimDqPGz36txtr69NZUlzztZIxhGAcoYv7MZvOmDHzchHktFT7hHAKkfXZooEbim
         PlRWG/0XCqWHeHktvLvdGYE36t1Jx7LbmyIrP32IMuzCa3XwiG1Sukbq35A7lxwi9826
         12ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866217; x=1739471017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AB6GXJU+o+aIRSK7UeYMrt5UjMJvamba11+xgHvlj+I=;
        b=XqMfhr7NrlOqrZjI6gLpCO4jbogWCLgiXiVwpFFrnID2rEvU7pdLYj+yBsUDOidEgF
         HYQ8DvsICOpA0yrCaMdl3jAOJ1fLpOsaYpXHK2T206L/zdgYkz7kx4GO4ISY/iG2MVsZ
         ubzqHNatJJjwbM4gpTfAxXk5N7QKP5FFtTMAkCZy8voNJkt3qkYMUbg5+tBHl5MUp9m0
         EXWngwdyOsgab1Sy0FGmYT/EaSx4VCNaRSXZ2E4UeZsHOk3drQU2gbjk3j3Y/kjrlRt8
         6C/cHHGpm71Jdx/hjSu/96SMWu/VuDtUfNI2y3nkwC2457DkgBjHwRRVc5sNkChwymnI
         qG4g==
X-Forwarded-Encrypted: i=1; AJvYcCVvBRKIk1oXkSyNfUJGiiXlUnBluGY+3Ei3BPxsphW8R9vqjky5e+Z2JKL9BpEMWhStC+kTajZpD00ZDGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG3B0KmhJ6VDRoZ1Gl3a38BnK85KCazaMyCkysSHi44S6q+LQ9
	9pB5MWTZZkRE54nRXh+HzKy0EwM19MjpAc23OegWnYRRON+QRbOKN2vv+oAJ/Hw=
X-Gm-Gg: ASbGnctdn6FJY0Rlq4v5xEeANEC9NJ3FNYLRXl8x1JHzEqt5pA2F2vjUH5ckPa4b7QX
	UuWJpOx1IeYEvmNrXmwzQhc/umKET1JuVj21t5nbMjMdy1HX4oHm1e+tsb7D7FDdp7LTF2YuM7a
	v4NHYB88G3KqJgsHL0ImT1SjOywzFmvDvRIO0RObkfh+WPZIRIVXj3DvPGQdD8dKGVPouLf+cwa
	pbSvtLFUh4GsHLZRF15N1fvjldLhLCiBZxZMxisYzXWoFjfDvm598yjeCum5r4WXpGzThKktoqz
	DowoC9CtgNOcWIDw1g==
X-Google-Smtp-Source: AGHT+IG/NuYEKi3zjDb1mUiLveCxnlUsFlouH8AlO0Xy3FZr9+sytk5Qojc3RdxtRuKqZM+G845QXw==
X-Received: by 2002:a05:6000:1448:b0:38d:b28f:5657 with SMTP id ffacd0b85a97d-38dc935f563mr9845f8f.43.1738866216839;
        Thu, 06 Feb 2025 10:23:36 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:a0d6:294f:5246:28d4])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4390d94d802sm66111445e9.12.2025.02.06.10.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:23:36 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] driver core: auxiliary bus: add device creation helper
Date: Thu,  6 Feb 2025 19:23:11 +0100
Message-ID: <20250206-aux-device-create-helper-v2-1-fa6a0f326527@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com>
References: <20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4145; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ucfZEBgK7yNHdj3H6oyHJK0qZDE1K1JMGLWDliaebGU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnpPrJYdW3M/ORih+QMS/r6D6T8sEV2nsy1XMtM
 qeVgAVj5DaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6T6yQAKCRDm/A8cN/La
 hQYoD/kBWWN9mhQG9dqL16DznagJvJky0H6Z37VjZOxzmEPyV6brT48BN4FHRsZV1Wy+sD24W5z
 rSh6kuO/EmS0LtuKnLy6fneweSMGP+99ZYdMtfEtIvwrEdw/XCXlIhU7OCpELP4AfxZXwBn6W0r
 FMz1EYDXH6X4DZE06iBsOn6KqWY0t3FpzlDcqTVTyRXV8Oxaz53rQmRXq0RTIhwk9DSjrfjLN6F
 lguYI4XPZecaXWSs9MckxAS7RDay2xkG20aC/mkpvTJSMfvMG/XMh4WlMvfxDhj9hTrbSrBPTHl
 6FV/GQwllMhqnsaC3EcGzI6u2NlkF5Ax1vOHS/lisZOU2sUFYeCVZFMea4zE1npwtXyhmTcL5Rr
 S3F1RBgDLupsTsEtRCWk4ApxH4wTiweue2VSjWUSyjNz8ormqM0donhbnc2DSMti54WVZaovFUX
 mZZvEJTQxR87zznfLT98p4mv0MHo3nYqpb0Lgzs5LBfGXAHf6b7ID2oVfYKjRsZWeQKvuvB3rJi
 nZrW2OteP8uPpRD2hUqmHYvlBUQeZ1FUorBpR/Cg2LQyj9xttnVULrAhmq94Klo6u8tzMI5b2bJ
 y+MI2ZdMWB1z4lVGLqomUDFt1sdef2+4r98FkgJqKmE69oKNvUwXeeFzACabQE8QrbEsxlk6zxR o6ohqpwktKcw20Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

Add a function helper to create a device on the auxiliary bus.

This is meant for fairly simple usage of the auxiliary bus, to avoid having
the same code repeated in the different drivers.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/base/auxiliary.c      | 88 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/auxiliary_bus.h |  6 +++
 2 files changed, 94 insertions(+)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..2594ec9a2d6f1696e064989b2bd5145a73beb159 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -385,6 +385,94 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
 }
 EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
 
+static void auxiliary_device_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+
+	kfree(auxdev);
+}
+
+static struct auxiliary_device *auxiliary_device_create(struct device *dev,
+							const char *modname,
+							const char *devname,
+							void *platform_data,
+							int id)
+{
+	struct auxiliary_device *auxdev;
+	int ret;
+
+	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
+	if (!auxdev)
+		return ERR_PTR(-ENOMEM);
+
+	auxdev->id = id;
+	auxdev->name = devname;
+	auxdev->dev.parent = dev;
+	auxdev->dev.platform_data = platform_data;
+	auxdev->dev.release = auxiliary_device_release;
+	device_set_of_node_from_dev(&auxdev->dev, dev);
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret) {
+		kfree(auxdev);
+		return ERR_PTR(ret);
+	}
+
+	ret = __auxiliary_device_add(auxdev, modname);
+	if (ret) {
+		/*
+		 * NOTE: It may look odd but auxdev should not be freed
+		 * here. auxiliary_device_uninit() calls device_put()
+		 * which call the device release function, freeing auxdev.
+		 */
+		auxiliary_device_uninit(auxdev);
+		return ERR_PTR(ret);
+	}
+
+	return auxdev;
+}
+
+static void auxiliary_device_destroy(void *_auxdev)
+{
+	struct auxiliary_device *auxdev = _auxdev;
+
+	auxiliary_device_delete(auxdev);
+	auxiliary_device_uninit(auxdev);
+}
+
+/**
+ * devm_auxiliary_device_create - create a device on the auxiliary bus
+ * @dev: parent device
+ * @modname: module name used to create the auxiliary driver name.
+ * @devname: auxiliary bus device name
+ * @platform_data: auxiliary bus device platform data
+ * @id: auxiliary bus device id
+ *
+ * Device managed helper to create an auxiliary bus device.
+ * The device create matches driver 'modname.devname' on the auxiliary bus.
+ */
+struct auxiliary_device *devm_auxiliary_device_create(struct device *dev,
+						      const char *modname,
+						      const char *devname,
+						      void *platform_data,
+						      int id)
+{
+	struct auxiliary_device *auxdev;
+	int ret;
+
+	auxdev = auxiliary_device_create(dev, modname, devname, platform_data, id);
+	if (IS_ERR(auxdev))
+		return auxdev;
+
+	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy,
+				       auxdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return auxdev;
+}
+EXPORT_SYMBOL_GPL(devm_auxiliary_device_create);
+
 void __init auxiliary_bus_init(void)
 {
 	WARN_ON(bus_register(&auxiliary_bus_type));
diff --git a/include/linux/auxiliary_bus.h b/include/linux/auxiliary_bus.h
index 65dd7f15437474468acf0e28f6932a7ff2cfff2c..c9ba8e718304c0ce27e16cdf53b18d81a290e4da 100644
--- a/include/linux/auxiliary_bus.h
+++ b/include/linux/auxiliary_bus.h
@@ -254,6 +254,12 @@ int __auxiliary_driver_register(struct auxiliary_driver *auxdrv, struct module *
 
 void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv);
 
+struct auxiliary_device *devm_auxiliary_device_create(struct device *dev,
+						      const char *modname,
+						      const char *devname,
+						      void *platform_data,
+						      int id);
+
 /**
  * module_auxiliary_driver() - Helper macro for registering an auxiliary driver
  * @__auxiliary_driver: auxiliary driver struct

-- 
2.45.2

