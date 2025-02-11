Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DD126216C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294909; cv=none; b=dxh3yumnFIEuwfx3j5RtJvbgOMGHiRxMBOIJ8v+InI4ISt375ygWw7TccQIRaGFZM0IsJAsE9YYg5Dnqaq6EyWUGGA5E6hIlKC6r7g5BNkY0x4oq1bjWjbAY3cjlqTdLjQ5yMsG1L9qryQUvTN0aHdSBLfHoxC/yrJr3RLnIDVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294909; c=relaxed/simple;
	bh=ucfZEBgK7yNHdj3H6oyHJK0qZDE1K1JMGLWDliaebGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U0UHDxRNZy+7tO6pSSfoXC5mPlUyrsiMFgA+PsFtXN10ZvnHzaEZNBYitHeAnJeXOsLoQcHRKkN+UFUnPXjGL3MQ/+vRACwyu2zxirmrKZruSJlI14nlfPngS33qXg6jTl7gGBMYxkguvz+A/bxxiPU88kgzI52gOlEoa/SeQf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FcHZaNiv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FcHZaNiv"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dcb7122c1so3788628f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294905; x=1739899705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AB6GXJU+o+aIRSK7UeYMrt5UjMJvamba11+xgHvlj+I=;
        b=FcHZaNiv9mHnDaIH0N9tWNN1xoIkQrP1WDg+0cHDBeKYldPqAShfPJ5oikoDXOsz2H
         rUQrmfAWFuEBRc3y1hyoC/S+I3X5m0ASktfZng0djkTzFlDe+hSGqq6kxmsiK3gQnYA2
         lyQ/qfRKXu8KaUGgzzASYhad58FiLGnHJZZoDXuhfMY6JZk+eQ7InPkNefGp5nLXscgS
         33Dh2I5a+DcQHP4Q5lTnk0beIR4Kn0BRYf88IzwkLoalPxM/xF0m4uSkfbgoj2AFTbc4
         Z2NBwqQ+RycPZeSpDfvncWU6pM1A45MhcPBwOAvP69Bu/kCWxlwLLMSw4XEKf29HrkJS
         RaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294905; x=1739899705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AB6GXJU+o+aIRSK7UeYMrt5UjMJvamba11+xgHvlj+I=;
        b=ihyeXzhUtQ1Uag0XeLXYQTm7+lLrm8Ws8ffEPujjbmISzWv1uhINs9UBxohvn0wgZh
         O4NQF/0ls/XQVEVNzFUZWi5cfadM1kguLUKWC4o8OeIyEf8hQzrvJdm+H6vikwmy3RU/
         196xDDQ5eaQ77dMBGwbLrIIaPxW3dPO0yjrl2cw9QcwaeXTOqf/Q0/w1ImMrvr49ne4D
         87WYM7yG5xsZWNUG1mEhgVm++D1wrTS+VXz1KbPCy9hKeeT+N8G051Dka6xrv2LF9TBw
         rR/kZYEIbhwLH2Q6TlOUejC5Vw0H3jrxcK8A7zhlPQvG/v47ncTD5V7jIYQO4B0mdnjP
         twmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCGG6cSCAMCIlTQbEWvEBszf1qOD6KO5N5ORlWZpZz7vj+UjnYXhmX/DH1EoG2Qcc8witXlIyFC12Sd+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3TgBqFh86Pb7yJb5ku7p4WN3H8WDzPxYbOvKyDvP9oMQyS0RL
	+ztwKZoY8DstpLlnUgqqJurywiJf3n07ksviSbCOx4DPitNPmEdcvfjnHtSR+Nuzwy15udWJRWF
	DwBE=
X-Gm-Gg: ASbGncvy9gjkRmfbWqD10cM7aE6vR7zz8Ry8UingT/YYZskB/TPY035YG/LbNLiN90u
	YRNzVqQGxxQhgsyy0EyoY0XVHfGXbDW/YhHYK7A06B2PEqax6breyicqDcxpQALoz1QCjA6By+4
	QvhgJBm8kaJUTLZJtXVjSSAnCKbwD2ex9ovTzbfFMpkwAMndPac8+ehwXFpU1kiw+5QLeAZCHyZ
	VdsKyXE7MmO4ng47JJkpJ3nA0dZdBjSESmjPDeCk8vrw4ILKJ/WMCdedLYjRKFRRjOOC29iRIBC
	TjI5zFJlSe+WR5+iRg==
X-Google-Smtp-Source: AGHT+IGEw+jOkSpcKmBaxutiJl3/DmddQ/HzeL84bwQCCI1vPUuRi9ITz632LqnxzLJBMcBoGkAPow==
X-Received: by 2002:a5d:64e7:0:b0:38d:e070:6cf5 with SMTP id ffacd0b85a97d-38de94afeb4mr625140f8f.51.1739294905297;
        Tue, 11 Feb 2025 09:28:25 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:24 -0800 (PST)
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
Date: Tue, 11 Feb 2025 18:27:57 +0100
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
Message-ID: <20250211172757.9L-k2KS6wK49TLAnGiYs3vCfOABZr-GTIciHvEoUaE0@z>

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

