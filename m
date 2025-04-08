Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500AF26A0B0;
	Tue,  8 Apr 2025 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107722; cv=none; b=gYDZCizgN3ChsYzkjOfLFlCtP3NpZcrSwFWq92HIl90NZoUmo3g/EH3gy5A96TiV/cHswOth6AqzGqip++yvblDv8YN71AhXr9ifc1FNZKQLAqw0vZO1b9HqXRJ4+vnk7PTr26YwISDZRCl/cKtmo3PWf0pCeMn28cE8gTNQYvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107722; c=relaxed/simple;
	bh=kW169fO0RpY/+rGsMs2l23ts5GiJ7vh0EquJelb/FMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NmoKaLLL0MGj/mLJyUPYxYAS3veDlvSMSx3i2RA4dl8kjpwv7HDEDky91aeeR8Oi8xFL7pNJlsZfrnLBuAOPb7kQuyTO7YjBvI8yKnwwzyKEC/sQUzUqhJ4cF7nPnFCLvBrIx5azeN9zrzNMrhLypf/8pWRHLLOTXm9OOKLXNQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Ie2J6+qP; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=kwGaR6Ed reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Ie2J6+qP";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="kwGaR6Ed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744107717; x=1775643717;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kQCILYForvdSSZKdbwYnu54OBicHccdomwEb/SSTZx4=;
  b=Ie2J6+qP8OL0e4QFSOpusPx2vJ4dP8//UspZyIZRKjibHuQQPzzOIfBs
   2cbLx9P+YVp5pMlo0cLiP+yKznrFTB0q+EfoLfzWSVUbSTRs/WUMAkFo+
   v6aWPiHQsPT69NrvOh3b2WdgUajAHN2zC2K+k8Og+j98h1NT2613tvlJm
   s/C0rRnSu+7Go5WLv/Av1w0qMaSiKKJPK2HGb0/lSW6YxGgXPbBOkp107
   j9zO5IgUW4WSaV+i5ri60bEmgHKIb4E7wYpMilyKq70RjirwnlLBeWIrG
   4vxrszIr3rOCoEaJfQWQbmUM+iLB8rdKCJC6UBhkTD9Mr/tu0wZEDnSLi
   Q==;
X-CSE-ConnectionGUID: 0ezRVQ9+TGaYaVhr3aydRQ==
X-CSE-MsgGUID: LPAYV0x3Qb2hPF4RRBvMxA==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43398928"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 12:21:54 +0200
X-CheckPoint: {67F4F8C2-A-2417938-F0170C2B}
X-MAIL-CPID: 531252E7980E3343F5D93C7CC353A8CA_2
X-Control-Analysis: str=0001.0A006374.67F4F8B3.0015,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4312F1609E4;
	Tue,  8 Apr 2025 12:21:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744107709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kQCILYForvdSSZKdbwYnu54OBicHccdomwEb/SSTZx4=;
	b=kwGaR6EdaZjC1I88+ljAkFcPI9lFKCQYSQ1YvMVLVvCINZnqH3aRU5h7qrme8MhiPvFf3B
	d5W178oSrYFbp1DnyXWgsEgkCwzp7YkwKRuP2gyWLVyDJNLmFF7rJWsfyzoiAyLHVjcGQU
	JFy4FMa0Qr4KHcuxlWWCBlFR8xuE84dY485ssTQVUgwcMVUe/Bm5VHxvqxbWVeo+VYIyMV
	jFarTaBXLEF1Tk8jP9Sgv/coo+jTWasJwFGJcUvLmdovWkyTEx8QEKLia2AidU4mnC44ZX
	AysAvXBQP33VjUKkWUSyOqOR5QSzaJazZWq6Q+9UARj2wx8OEE8Lt2n3xouvZg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/1] hwmon: (gpio-fan) Add regulator support
Date: Tue,  8 Apr 2025 12:21:44 +0200
Message-ID: <20250408102145.576852-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
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
Patch 1 & 2 from v1 [1] have already been applied, although number 2 [2] is not
yet showing in next-20250305. Patches 3 & 4 (just removing comments) from v1
have been dropped, so only this patch remains.

Changes in v4:
* Remove unecessary variable initialization
* Simplify return code handling

Changes in v3:
* Remove noisy dev_err calls related to runtime pm
* Properly propagate return codes from set_fan_speed

Changes in v2:
* Make regulator non-optional

[1] https://lore.kernel.org/all/20250210145934.761280-1-alexander.stein@ew.tq-group.com/
[2] https://web.git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?h=hwmon-next&id=9fee7d19bab635f89223cc40dfd2c8797fdc4988
---
 drivers/hwmon/gpio-fan.c | 103 +++++++++++++++++++++++++++++++++------
 1 file changed, 87 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index cee3fa146d69a..66035106cbd3b 100644
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
@@ -125,13 +129,32 @@ static int __get_fan_ctrl(struct gpio_fan_data *fan_data)
 }
 
 /* Must be called with fan_data->lock held, except during initialization. */
-static void set_fan_speed(struct gpio_fan_data *fan_data, int speed_index)
+static int set_fan_speed(struct gpio_fan_data *fan_data, int speed_index)
 {
 	if (fan_data->speed_index == speed_index)
-		return;
+		return 0;
+
+	if (fan_data->speed_index == 0 && speed_index > 0) {
+		int ret;
+
+		ret = pm_runtime_resume_and_get(fan_data->dev);
+		if (ret < 0)
+			return ret;
+	}
 
 	__set_fan_ctrl(fan_data, fan_data->speed[speed_index].ctrl_val);
+
+	if (fan_data->speed_index > 0 && speed_index == 0) {
+		int ret;
+
+		ret = pm_runtime_put_sync(fan_data->dev);
+		if (ret < 0)
+			return ret;
+	}
+
 	fan_data->speed_index = speed_index;
+
+	return 0;
 }
 
 static int get_fan_speed_index(struct gpio_fan_data *fan_data)
@@ -176,7 +199,7 @@ static ssize_t pwm1_store(struct device *dev, struct device_attribute *attr,
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
 	unsigned long pwm;
 	int speed_index;
-	int ret = count;
+	int ret;
 
 	if (kstrtoul(buf, 10, &pwm) || pwm > 255)
 		return -EINVAL;
@@ -189,12 +212,12 @@ static ssize_t pwm1_store(struct device *dev, struct device_attribute *attr,
 	}
 
 	speed_index = DIV_ROUND_UP(pwm * (fan_data->num_speed - 1), 255);
-	set_fan_speed(fan_data, speed_index);
+	ret = set_fan_speed(fan_data, speed_index);
 
 exit_unlock:
 	mutex_unlock(&fan_data->lock);
 
-	return ret;
+	return ret ? ret : count;
 }
 
 static ssize_t pwm1_enable_show(struct device *dev,
@@ -211,6 +234,7 @@ static ssize_t pwm1_enable_store(struct device *dev,
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
 	unsigned long val;
+	int ret;
 
 	if (kstrtoul(buf, 10, &val) || val > 1)
 		return -EINVAL;
@@ -224,11 +248,11 @@ static ssize_t pwm1_enable_store(struct device *dev,
 
 	/* Disable manual control mode: set fan at full speed. */
 	if (val == 0)
-		set_fan_speed(fan_data, fan_data->num_speed - 1);
+		ret = set_fan_speed(fan_data, fan_data->num_speed - 1);
 
 	mutex_unlock(&fan_data->lock);
 
-	return count;
+	return ret ? ret : count;
 }
 
 static ssize_t pwm1_mode_show(struct device *dev,
@@ -279,7 +303,7 @@ static ssize_t set_rpm(struct device *dev, struct device_attribute *attr,
 		goto exit_unlock;
 	}
 
-	set_fan_speed(fan_data, rpm_to_speed_index(fan_data, rpm));
+	ret = set_fan_speed(fan_data, rpm_to_speed_index(fan_data, rpm));
 
 exit_unlock:
 	mutex_unlock(&fan_data->lock);
@@ -386,6 +410,7 @@ static int gpio_fan_set_cur_state(struct thermal_cooling_device *cdev,
 				  unsigned long state)
 {
 	struct gpio_fan_data *fan_data = cdev->devdata;
+	int ret;
 
 	if (!fan_data)
 		return -EINVAL;
@@ -395,11 +420,11 @@ static int gpio_fan_set_cur_state(struct thermal_cooling_device *cdev,
 
 	mutex_lock(&fan_data->lock);
 
-	set_fan_speed(fan_data, state);
+	ret = set_fan_speed(fan_data, state);
 
 	mutex_unlock(&fan_data->lock);
 
-	return 0;
+	return ret;
 }
 
 static const struct thermal_cooling_device_ops gpio_fan_cool_ops = {
@@ -499,6 +524,8 @@ static void gpio_fan_stop(void *data)
 	mutex_lock(&fan_data->lock);
 	set_fan_speed(data, 0);
 	mutex_unlock(&fan_data->lock);
+
+	pm_runtime_disable(fan_data->dev);
 }
 
 static int gpio_fan_probe(struct platform_device *pdev)
@@ -521,6 +548,11 @@ static int gpio_fan_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, fan_data);
 	mutex_init(&fan_data->lock);
 
+	fan_data->supply = devm_regulator_get(dev, "fan");
+	if (IS_ERR(fan_data->supply))
+		return dev_err_probe(dev, PTR_ERR(fan_data->supply),
+				     "Failed to get fan-supply");
+
 	/* Configure control GPIOs if available. */
 	if (fan_data->gpios && fan_data->num_gpios > 0) {
 		if (!fan_data->speed || fan_data->num_speed <= 1)
@@ -548,6 +580,17 @@ static int gpio_fan_probe(struct platform_device *pdev)
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
@@ -568,41 +611,69 @@ static void gpio_fan_shutdown(struct platform_device *pdev)
 	}
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
+	int ret = 0;
 
 	if (fan_data->gpios) {
 		fan_data->resume_speed = fan_data->speed_index;
 		mutex_lock(&fan_data->lock);
-		set_fan_speed(fan_data, 0);
+		ret = set_fan_speed(fan_data, 0);
 		mutex_unlock(&fan_data->lock);
 	}
 
-	return 0;
+	return ret;
 }
 
 static int gpio_fan_resume(struct device *dev)
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
+	int ret = 0;
 
 	if (fan_data->gpios) {
 		mutex_lock(&fan_data->lock);
-		set_fan_speed(fan_data, fan_data->resume_speed);
+		ret = set_fan_speed(fan_data, fan_data->resume_speed);
 		mutex_unlock(&fan_data->lock);
 	}
 
-	return 0;
+	return ret;
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
2.43.0

