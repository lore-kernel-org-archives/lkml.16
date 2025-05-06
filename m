Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D41219A95
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 21:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565612; cv=none; b=creHSBehPxDqrac3JizeiOWg10xgofO5BVbrIF80yQtdGu0DTtVRbminAhYmSHWsnqNj0BUXvcJrQvV4b/SCPuqkFXQyY7peR5mIsGjGTfCQuPhn1pw81Kiw1+oJh82Gm62ebsTQWucb6pY8zDXst2kgUaHhu8Qq3mX4D8ISiy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565612; c=relaxed/simple;
	bh=Q9A7ivkauVlgucb1lRiZVv7VAIqJk0Dt1cBSdIS+1MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RnOBhlths10CN6gVzu4JDJNduq8JDW9O+qvkbDwjwGG0TF6mdBsAtAhkMhI5EYz8s5PzrbkvTuyfzhhkPdX7eXVIdthoYlMtVQVC57CQayJGuitJ69DsgUpfYkgWTooBMrka6T8Q/GpURYKPKOWREQx9Fe25b+9fPr508EZD5es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=2CwLW1Py; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="2CwLW1Py"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d8020ba858so32216105ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 14:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746565609; x=1747170409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jme2oFU9Z+jcmGst64hAoFvbFfUFjd99f802R0svshY=;
        b=2CwLW1PyXFbTo+KJIED4xVw/kWSPXrjgkCGBU4tTYV3h9BPrCNmOXjUSt1PqTM/T2W
         AL0q2gM2BA1YmA9vFr+B6m578zIT11mVpbCXdAWf9lT1dvYnfIDnyzpUrg7B7i/x5M/b
         OgwKJOXA0nNPBqD54MvA+4ibqHEmt4kPsap18O677Kw9KDka1R4YLHUE2WQ0VJosvBsH
         yDIepJyN9YKUyqnbbZbDhYrOLp6RWI7lXC86DgZmTC/PPaW5pr6kHCvll9MVVPAEKMxv
         BO8QZFSm2XfgNOJw6K9gzVEE+M0Ktxa8xmoMvodffKryZgJfHtHONxE4JPVO8962D9oe
         dJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565609; x=1747170409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jme2oFU9Z+jcmGst64hAoFvbFfUFjd99f802R0svshY=;
        b=pJLCx19FlXDo+q9E/TYtemR0rVdpvxjXNZwcU8sewHkVO7ibxVH3IY4OOBLt5Po78E
         sjKr/rKbIIuICYnMBISfSyUK82GN7ycdF5e6jxZIT9IPJ06hpyyqvPn+glXy7yDfO/YM
         XcoFU4u4fQvmJdJZ0UbAw9jbSUYFw2yEVjHVPWcux8261NuTuXRSgr2PQV9ybC/duV4A
         +Uz//HF26kyljy1lk7flXv8vCyF6otP4TSKE3wCGXwb6ykYHQtlkZAoY9MEmDiCfEAaf
         cLlVnDF+TWAN6mQh6mpTxadU5RIay+QHnYFZ1NeE9P14+4rKBhC0iFZgjpBES0KzB7P1
         p5BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWApO0TdZaA45+ACYAbNuHUpWXSt5+CWD+lZ9qU/b+XiPd6GPeifHKNzof3kRcBFyil8Xcphn1ugeyr9g8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpnbetYnUNpgxFDVFtb+y6Ph65M3Z0nkqn1WPhhFhMPMSjwlAr
	kyOyc2HncxxQVNbn6Ng8ZxUiQAKSSieoqDbzBJLJEsg0USLU/flna2aP1OTW2CU=
X-Gm-Gg: ASbGncujsAlOS2rWf/SoshQqxYEoTUNef4c+WME/UDMAPDSQB2T6Ejtkpw80KtXPWsf
	4te2cTrhe0Czs2WJNSn+jgyyvyCj4X5oB6+zt/cf6h/cgMJJEAvh11WQWg6gGO2tybD7aDZ9ZAQ
	e9ONCnMFWv7bFYGJ4gfZ4+ysYe1Zv0dqqCAe/ekBdfk3MHbJJpQTrw75+N+kqw62rfCB1t+y22i
	/mFt5cffl0Tl7j5do3cM3kIkL8ItHxSClRBZf0udnZr1RqWbeItxaVBLB+Ofk1ytujnaMC+WEYf
	jLr34FKrF88FIi//m20AoyEg43Q7BKMpl3ngwqxEb0UgXicmVN4RXQgakPrNaEQgW19aFOsvqjW
	7kC43LW+HuIwO5Q==
X-Google-Smtp-Source: AGHT+IGYwKA4uXQW3ijIOTs5HDkFa1SjzFI8ZE8DNwl6JYQYd64vEUmEQBbyVONgtUbEbjRZVgQbwg==
X-Received: by 2002:a05:6e02:1c2c:b0:3d8:1d7c:e192 with SMTP id e9e14a558f8ab-3da738f849emr8607825ab.7.1746565607731;
        Tue, 06 May 2025 14:06:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa588basm2419559173.79.2025.05.06.14.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:06:47 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/6] clk: spacemit: set up reset auxiliary devices
Date: Tue,  6 May 2025 16:06:34 -0500
Message-ID: <20250506210638.2800228-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506210638.2800228-1-elder@riscstar.com>
References: <20250506210638.2800228-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new reset_name field to the spacemit_ccu_data structure.  If it is
non-null, the CCU implements a reset controller, and the name will be
used as the name for the auxiliary device that implements it.

Define a new type to hold an auxiliary device as well as the regmap
pointer that will be needed by CCU reset controllers.  Set up code to
initialize and add an auxiliary device for any CCU that implements reset
functionality.

Make it optional for a CCU to implement a clock controller.  This
doesn't apply to any of the existing CCUs but will for some new ones
that will be added soon.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 85 +++++++++++++++++++++++++++++++----
 include/soc/spacemit/ccu_k1.h | 12 +++++
 2 files changed, 89 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 9545cfe60b92b..6b1845e899e5f 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
@@ -21,6 +22,7 @@
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 
 struct spacemit_ccu_data {
+	const char *reset_name;
 	struct clk_hw **hws;
 	size_t num;
 };
@@ -710,6 +712,7 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_pll_data = {
+	/* The PLL CCU implements no resets */
 	.hws	= k1_ccu_pll_hws,
 	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
 };
@@ -751,8 +754,9 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.hws	= k1_ccu_mpmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
+	.reset_name	= "mpmu-reset",
+	.hws		= k1_ccu_mpmu_hws,
+	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
 
 static struct clk_hw *k1_ccu_apbc_hws[] = {
@@ -859,8 +863,9 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.hws	= k1_ccu_apbc_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
+	.reset_name	= "apbc-reset",
+	.hws		= k1_ccu_apbc_hws,
+	.num		= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
 
 static struct clk_hw *k1_ccu_apmu_hws[] = {
@@ -929,8 +934,9 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.hws	= k1_ccu_apmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
+	.reset_name	= "apmu-reset",
+	.hws		= k1_ccu_apmu_hws,
+	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static int spacemit_ccu_register(struct device *dev,
@@ -941,6 +947,10 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* Nothing to do if the CCU does not implement any clocks */
+	if (!data->hws)
+		return 0;
+
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
 				GFP_KERNEL);
 	if (!clk_data)
@@ -981,9 +991,63 @@ static int spacemit_ccu_register(struct device *dev,
 	return ret;
 }
 
+static void spacemit_cadev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	kfree(to_spacemit_ccu_adev(adev));
+}
+
+static void spacemit_adev_unregister(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int spacemit_ccu_reset_register(struct device *dev,
+				       struct regmap *regmap,
+				       const char *reset_name)
+{
+	struct spacemit_ccu_adev *cadev;
+	struct auxiliary_device *adev;
+	static u32 next_id;
+	int ret;
+
+	/* Nothing to do if the CCU does not implement a reset controller */
+	if (!reset_name)
+		return 0;
+
+	cadev = devm_kzalloc(dev, sizeof(*cadev), GFP_KERNEL);
+	if (!cadev)
+		return -ENOMEM;
+	cadev->regmap = regmap;
+
+	adev = &cadev->adev;
+	adev->name = reset_name;
+	adev->dev.parent = dev;
+	adev->dev.release = spacemit_cadev_release;
+	adev->dev.of_node = dev->of_node;
+	adev->id = next_id++;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
+}
+
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
+	const struct spacemit_ccu_data *data;
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -1012,11 +1076,16 @@ static int k1_ccu_probe(struct platform_device *pdev)
 					     "failed to get lock regmap\n");
 	}
 
-	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
-				    of_device_get_match_data(dev));
+	data = of_device_get_match_data(dev);
+
+	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
+	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register resets\n");
+
 	return 0;
 }
 
diff --git a/include/soc/spacemit/ccu_k1.h b/include/soc/spacemit/ccu_k1.h
index 7df75043e78af..8b2581fb3055d 100644
--- a/include/soc/spacemit/ccu_k1.h
+++ b/include/soc/spacemit/ccu_k1.h
@@ -2,6 +2,18 @@
 
 /* SpacemiT clock and reset driver definitions for the K1 SoC */
 
+/* Auxiliary device used to represent a CCU reset controller */
+struct spacemit_ccu_adev {
+	struct auxiliary_device adev;
+	struct regmap *regmap;
+};
+
+static inline struct spacemit_ccu_adev *
+to_spacemit_ccu_adev(struct auxiliary_device *adev)
+{
+	return container_of(adev, struct spacemit_ccu_adev, adev);
+}
+
 /* APBS register offset */
 #define APBS_PLL1_SWCR1			0x100
 #define APBS_PLL1_SWCR2			0x104
-- 
2.45.2

