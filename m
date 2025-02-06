Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A9119CD01
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866222; cv=none; b=mv1cAV/EP3UPA6V3AdJwDRDXAf9xRF9KQWbpVdAjCezrY8E5v+ib0D6GtzD0iOkGqDeK15TL5R25ApNlSgm4jfKXAx/CdLU59MyqN8w6uKVRxGXCVrv4WRr9FEwNdyv7zs/RqGR8gyHw54EzTwyUMsjOWQPk5GLsfqdr/pWoLW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866222; c=relaxed/simple;
	bh=gEXSWbheU05wAl9Cb6rsorvg/2q4nl7DHvFNyzkBTuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pKK68s8QA8586y2bwTHDIjO8HU0L4k3VfLODDhB0XEgD+6xQmoJ7pxPkLD9rMtlDhfzuoeBzNX5eGv7hC3990zbXc+WPJvbAsl6uu6FjFj9R2nTagCRNfsQiu56i0qiUXKD4p0+Rd3ib9V4zHoopQrM8SJTfKUBv2ZHPlzmGFMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SCQHuGTd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SCQHuGTd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso8654625e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738866218; x=1739471018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVkLyEb06XrvJwGPoL0+lLyTG47VSyl765KLb97swYw=;
        b=SCQHuGTdC7eFBWZbmVisvAuNBHSFbEBjFgA5VLbj60tTwjjB6VsypfOLkvTmzkg4+w
         DUNvk948bRSGmtoqZvG8MLdFFp8E6WKQSS94X2FNsC1xKJkmMqalvDqas4Cju5DdZ17Y
         /IqbL3ulAHMcN31eJyqr9laV9v0X2FBPI/TAeeSEy/v3m0aSs/0HSkuw0Bc2vULPEze1
         Vv7wtN5Ex0uBnXshw7ZMUr69FCc71KBMlsjCo2QyI/RGj9IO5S5pqsBzJi5IPgEz7pKM
         5w4CxuQBk4gEveo+77hNSiJQIA/KPEod3T/sO+YFH6qr/8kV/kDVtruyIDLx9TmmEC8E
         hXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866218; x=1739471018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVkLyEb06XrvJwGPoL0+lLyTG47VSyl765KLb97swYw=;
        b=lhTqiKu0w1/sYR16pnPYf46WvApb3+8bJ8ZFpgUoCQ7WmZO+MaiYuyZxXQ0Xkntk7Y
         Zmg+WAFOfKi9OydlzXx9UWraZNe5kvCwL5ENEtrksYluBO9mWIvuubL7Z1uFI692CtlC
         gKQnjagfpPHBMcmsl4lSnYItD8WP3SxoGPcroqhI93qNEP+HoKU1b+k6lDfQ6ZmuLPJl
         /LU998W8Dxu8sbD/ovrXcRDSmNPTFW8KuIGhYGqbd67ABtRZxkUh7p7kKH74Lrj/G259
         VFpNpQ0sfcGfFL0X29kbltxVrpB43sb0DR5nBUnOACXQb42Z2x6Sa0+biFK3KRCVo+Yi
         73rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGzj1wM7C5xGpWF4BqEJqXUDJrTAzkaHodJgV273dllOi/sOF/h7Aoxb0IgvnMr+PkLR6zibIXVvzr7ac=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkZhcMlhSLjGK+RYgpopcvV3GtU7+q36WQWoPpJB7VNqGtiRFx
	Sl4ocNyk4TO9KkLt7aFXIjHbUQ2yhNVinXo0RtjH3kR303tS9xtIMukAepLi0Ps=
X-Gm-Gg: ASbGnctdaNpujsX3OXWwtotY2OFSa/cGVUiEpcaW4/EL/EaSUIcn5psNzGBKDCaSbxj
	Yy281qv+3a/3TFjY58lLjPc01ERrPSfgPjC7aqVwrx01M5GmSEQX4u9l1f2np0OVPhipqA8+kHM
	E60JGbFJFhb1pRxxF6D7LbRD7grdiQVZdRBj56Z+osKv3OjLDofkwOVR4rg7Yel1+zctweMuEds
	ASe/SLhyiWAqqQOCTPSTlONyPKeqiZAVC08988OUUDg06m6LRe/rRlK0auN5iolek0h6ErlJzYG
	MOGvGKdcC6kmZMctbQ==
X-Google-Smtp-Source: AGHT+IGEyfloo4HAMqO46UIhMIq6TD/k5Cqd9h/6FWUmSuslr2XyXjQd4IQtsG8h3DyFJvrNQ+F0KQ==
X-Received: by 2002:a05:600c:3d0b:b0:436:6160:5b81 with SMTP id 5b1f17b1804b1-43924990da1mr4648345e9.14.1738866218598;
        Thu, 06 Feb 2025 10:23:38 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:a0d6:294f:5246:28d4])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4390d94d802sm66111445e9.12.2025.02.06.10.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:23:37 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] reset: mpfs: use the auxiliary device creation helper
Date: Thu,  6 Feb 2025 19:23:12 +0100
Message-ID: <20250206-aux-device-create-helper-v2-2-fa6a0f326527@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=gEXSWbheU05wAl9Cb6rsorvg/2q4nl7DHvFNyzkBTuI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnpPrKJSrN2nKQGVaPXNFezUgV/oU17RAS6hJMC
 eMuXu+IGeiJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6T6ygAKCRDm/A8cN/La
 hUndEACDXpAOTok0T/1MoM+ELQCc+RRFZJuG6IUAM+W4fIZ6QKApY+Cl5HbaAh8lNyRzH0yMm9b
 Ao8ZzNcvfEDuDOUpXoGobGLbtS8dPHM1FaxxoB2qMBS8AA4U9rcOzKQsfeD7OiTAZXKXQUR1Cxf
 7T6Tm5xSSxuuMI/YCtxls0FuhyGcbTmpH14smy5CkR+/k+UDVCo418SD4SYSFrf9Aqe6dsTlsKe
 npNZDYHKT3mS0pKH3GJHNUuRfDgc/XUTs+6WdAs2rHJcwJPQe9IC3Sc/+hb8laSwIjfjCwYgBHq
 I2ANTb1T7r1mLdfFrCDRkmVkbs3zbHr8kt5Jmzv8UY36gmwI48r9dwYTj3SlhAKGISdIRUxjZtM
 r0JGXbgw52h50anI/RKPn7JB20BZUBU+xo63VanqU62MIUiR86eoVvrLi5ZeCdU2Oy/O1EcH6O9
 3fpj1hZ+Zc9Ak3F0brzM6pvY7mScxbsF3tf8Oipm5/4QLbcjcjfAyAaLRY4XK6M3DcS+PMxQq2W
 laAvIQDecOy2B/5yKoD2QeuPz6kvWskZMi+3SzC1oidOqA8lhCy4zvpiU+ryeGqrb/x1rrAHATA
 k559Yy7+87yYwQIiz3/w4/5beJR4A2DF+Vf3FiG2wA6mHcVmEeWaeGsiH2DpSV0AItOVqlP8Dpa Py/Y9A32ERcsC2g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-mpfs.c | 53 ++++------------------------------------------
 1 file changed, 4 insertions(+), 49 deletions(-)

diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index 574e59db83a4fcf30b60cb5f638607a2ec7b0580..61b8eb42faed809cbffd944f21927236833b2c0e 100644
--- a/drivers/reset/reset-mpfs.c
+++ b/drivers/reset/reset-mpfs.c
@@ -155,62 +155,17 @@ static int mpfs_reset_probe(struct auxiliary_device *adev,
 	return devm_reset_controller_register(dev, rcdev);
 }
 
-static void mpfs_reset_unregister_adev(void *_adev)
-{
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void mpfs_reset_adev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk_dev)
-{
-	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return ERR_PTR(-ENOMEM);
-
-	adev->name = "reset-mpfs";
-	adev->dev.parent = clk_dev;
-	adev->dev.release = mpfs_reset_adev_release;
-	adev->id = 666u;
-
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ERR_PTR(ret);
-	}
-
-	return adev;
-}
-
 int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *base)
 {
 	struct auxiliary_device *adev;
-	int ret;
 
-	adev = mpfs_reset_adev_alloc(clk_dev);
+	adev = devm_auxiliary_device_create(clk_dev, KBUILD_MODNAME,
+					    "reset-mpfs", (__force void *)base,
+					    666u);
 	if (IS_ERR(adev))
 		return PTR_ERR(adev);
 
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	adev->dev.platform_data = (__force void *)base;
-
-	return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, adev);
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, "MCHP_CLK_MPFS");
 

-- 
2.45.2

