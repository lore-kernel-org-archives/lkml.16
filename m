Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E052441A1;
	Mon, 10 Feb 2025 15:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199647; cv=none; b=P/HR9Jk0szrATQ/wMG3JXM7z16x2GMe73/BjCQo4je1j1paqTJGl6tJEN3n/BxuB88sLt3G4VuBadrf92X6v79NubzfPCWUwTUm1y5H1RlCnj9vJSEiPysBuSAP6BWuXBZQh8O3J1vg1SGPMynZ/w7N8BSIU8ZKFsM/ro5w47g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199647; c=relaxed/simple;
	bh=pddqfAGMHj8YYYp8C8hwTVOiAdmP2naJ4OoMdXU+dHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NaqWyowC1foWbktkXKPnzHN9LwqHEPIrCTb1PH2C9U+3JZ8umLqeIqRdM+Cu07XgLD5AKXUeOVKrQ9D2ix1FDSUa0TWAYuQgqqpnYChIyotztUBvNAiHuXgC29S70HqWBWlh4HHlVK2KK5bJYV3s9xy96jyvXT25aCUXGW40diA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=qX8d/Kyw; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=GlToWC3t reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="qX8d/Kyw";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GlToWC3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739199645; x=1770735645;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zCIkKRFP/FaYbigx+wNQiUdAKh8KaKGOhBsdIu/hVl8=;
  b=qX8d/KyweaZVMtQPjaxpVIg6CRRV9SZ3pRs2kzM9u16S4ckQlR1GHdNs
   k9JNtquTo3C2yKwtmQ8KRIe4w9/kDbqxNuwiHv7r5WboAykJjl7pwP7rH
   hhXrybw/5LAU05CHh5SCsk/toyrd5hvmG6v82kFU3QH3XCpgO5teZohWD
   fzhLg9f4A8FrvU/ZN5TUe6+mAzDSyaBQTi1v5OH04NlvlTu29HA4XUdlz
   N7cMP2N5geNN/cgn7B6aRLMaS2BqXNzNNHi1jRY7eDO4PlVPNCiXG6ryR
   diTHLwr3TgkjSkwNsib5iRZeCUQeuxTyEqkOhsMSEv0CrV+rYXOeofR68
   Q==;
X-CSE-ConnectionGUID: hwUrE1KtTzWpuJ2F2FGJPg==
X-CSE-MsgGUID: zNwR12AOTsilrpptPGA3Cw==
X-IronPort-AV: E=Sophos;i="6.13,274,1732575600"; 
   d="scan'208";a="41722365"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Feb 2025 16:00:43 +0100
X-CheckPoint: {67AA149B-24-BE46CFC6-C2AD582F}
X-MAIL-CPID: 0CB0F94F2F3D2C15B55DE093C1FA3DD4_1
X-Control-Analysis: str=0001.0A00639A.67AA149C.0064,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32EF016961E;
	Mon, 10 Feb 2025 16:00:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739199639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zCIkKRFP/FaYbigx+wNQiUdAKh8KaKGOhBsdIu/hVl8=;
	b=GlToWC3tBBIBHKfc491bnZyjujwPlLUcmKixu1lEPoAdryqxXJwvI9ueDrBP93CsMh9V7l
	9/DMmPcUxJZO8fSuO7QVjuSuHeEVFTID9PT8fmnW9STpZHoKJ5bx4Mkr1BasRZZ7+7WaZo
	zkXQfo8lEhmIzINOPdGdCjY2KQ6DLefpaLADQZHWszv3CNSIyt2bC/0i24RMrqhVWRRqRy
	UKVQw4Vp4czM27Y/Uw6pmwIhxsV5rEtsM9l+N2EbX0IZg6uzYcF1sOwe3otlSKwOw8bllf
	7LhtEWd1NkRh/yMFYn3bmzAX3uKcKidLswUx8gBIQTDYM/FrD9OngX1zMj7YJQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] hwmon: (gpio-fan) Add regulator support
Date: Mon, 10 Feb 2025 15:59:33 +0100
Message-Id: <20250210145934.761280-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210145934.761280-1-alexander.stein@ew.tq-group.com>
References: <20250210145934.761280-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

FANs might be supplied by a regulator which needs to be enabled as well.
This is implemented using runtime PM. Every time speed_index changes from
0 to non-zero and vise versa RPM is resumed or suspended.
Intitial RPM state is determined by initial value of speed_index.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/hwmon/gpio-fan.c | 86 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 4614d0ad86b3a..3d4719391ea90 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -20,6 +20,9 @@
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <linux/thermal.h>
 
 struct gpio_fan_speed {
@@ -42,6 +45,7 @@ struct gpio_fan_data {
 	bool			pwm_enable;
 	struct gpio_desc	*alarm_gpio;
 	struct work_struct	alarm_work;
+	struct regulator	*supply;
 };
 
 /*
@@ -123,15 +127,40 @@ static int __get_fan_ctrl(struct gpio_fan_data *fan_data)
 	return ctrl_val;
 }
 
-static void set_fan_speed(struct gpio_fan_data *fan_data, int speed_index)
+static int set_fan_speed(struct gpio_fan_data *fan_data, int speed_index)
 {
 	WARN_ON_ONCE(!mutex_is_locked(&fan_data->lock));
 
 	if (fan_data->speed_index == speed_index)
-		return;
+		return 0;
+
+	if (fan_data->speed_index == 0 && speed_index > 0) {
+		int ret;
+
+		ret = pm_runtime_resume_and_get(fan_data->dev);
+		if (ret < 0) {
+			dev_err(fan_data->dev,
+				"Failed to runtime_get device: %d\n", ret);
+			return ret;
+		}
+	}
 
 	__set_fan_ctrl(fan_data, fan_data->speed[speed_index].ctrl_val);
+
+	if (fan_data->speed_index > 0 && speed_index == 0) {
+		int ret;
+
+		ret = pm_runtime_put_sync(fan_data->dev);
+		if (ret < 0) {
+			dev_err(fan_data->dev,
+				"Failed to runtime_put device: %d\n", ret);
+			return ret;
+		}
+	}
+
 	fan_data->speed_index = speed_index;
+
+	return 0;
 }
 
 static int get_fan_speed_index(struct gpio_fan_data *fan_data)
@@ -499,6 +528,8 @@ static void gpio_fan_stop(void *data)
 	mutex_lock(&fan_data->lock);
 	set_fan_speed(data, 0);
 	mutex_unlock(&fan_data->lock);
+
+	pm_runtime_disable(fan_data->dev);
 }
 
 static int gpio_fan_probe(struct platform_device *pdev)
@@ -521,6 +552,16 @@ static int gpio_fan_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, fan_data);
 	mutex_init(&fan_data->lock);
 
+	fan_data->supply = devm_regulator_get_optional(dev, "fan");
+	if (IS_ERR(fan_data->supply)) {
+		err = PTR_ERR(fan_data->supply);
+		if (err != -ENODEV)
+			return dev_err_probe(dev, err,
+					     "Failed to get fan-supply");
+
+		fan_data->supply = NULL;
+	}
+
 	/* Configure control GPIOs if available. */
 	if (fan_data->gpios && fan_data->num_gpios > 0) {
 		if (!fan_data->speed || fan_data->num_speed <= 1)
@@ -548,6 +589,17 @@ static int gpio_fan_probe(struct platform_device *pdev)
 			return err;
 	}
 
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	/* If current GPIO state is active, mark RPM as active as well */
+	if (fan_data->speed_index > 0) {
+		int ret;
+
+		ret = pm_runtime_resume_and_get(&pdev->dev);
+		if (ret)
+			return ret;
+	}
+
 	/* Optional cooling device register for Device tree platforms */
 	fan_data->cdev = devm_thermal_of_cooling_device_register(dev, np,
 				"gpio-fan", fan_data, &gpio_fan_cool_ops);
@@ -565,6 +617,28 @@ static void gpio_fan_shutdown(struct platform_device *pdev)
 		set_fan_speed(fan_data, 0);
 }
 
+static int gpio_fan_runtime_suspend(struct device *dev)
+{
+	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (fan_data->supply)
+		ret = regulator_disable(fan_data->supply);
+
+	return ret;
+}
+
+static int gpio_fan_runtime_resume(struct device *dev)
+{
+	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (fan_data->supply)
+		ret = regulator_enable(fan_data->supply);
+
+	return ret;
+}
+
 static int gpio_fan_suspend(struct device *dev)
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
@@ -592,14 +666,18 @@ static int gpio_fan_resume(struct device *dev)
 	return 0;
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(gpio_fan_pm, gpio_fan_suspend, gpio_fan_resume);
+static const struct dev_pm_ops gpio_fan_pm = {
+	RUNTIME_PM_OPS(gpio_fan_runtime_suspend,
+		       gpio_fan_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(gpio_fan_suspend, gpio_fan_resume)
+};
 
 static struct platform_driver gpio_fan_driver = {
 	.probe		= gpio_fan_probe,
 	.shutdown	= gpio_fan_shutdown,
 	.driver	= {
 		.name	= "gpio-fan",
-		.pm	= pm_sleep_ptr(&gpio_fan_pm),
+		.pm	= pm_ptr(&gpio_fan_pm),
 		.of_match_table = of_gpio_fan_match,
 	},
 };
-- 
2.34.1

