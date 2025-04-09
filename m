Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9CA1EF371;
	Wed,  9 Apr 2025 06:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744181686; cv=none; b=Z4NrqQ804nJkdYz7jUlLtyhlkUZh223pIe9yfjnRXV6//EEKsL79bpHKVmP8SoUQIsX4Uq52Oc5ZSr8pRZtQuNldMkhucI/JxCqYV1KzXtXKOiNlAGcfc6FTw7lJWeebIQjCwPdMmRfuGy+bvPNi72xgaFvncEkZkQQBmM66qdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744181686; c=relaxed/simple;
	bh=N2Ql7XE06BfJOvsUbi1FFm2hRKOzU2ggVSI2kdalZI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e68oZOWM3awVInfiq9M3cqBTN00Ev5oceEgMpUbWqiQCB/JrthgHI43oAAJBJdSzHqaV1SwrX+mqyvzAaPjN2VGZcJd/vjkGnEw9NOCDeTX5rbTOsom+wsxq4xsT0vzuzJBZowLP4OofyvNXa3sHybUTlNbj1l1F5pK+BMbY8+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=pIB1Cb03; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=IM0A0iJT reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="pIB1Cb03";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="IM0A0iJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744181683; x=1775717683;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Q6+UEGaM07beYSVq7txElg3igRbrlGhkQ6SKj0rGMEs=;
  b=pIB1Cb03zFi1LnGnGGdTKfWRfasvWy1Wz2EbuIWc67ohA5gV9TCOF4S/
   SyITdQwB5DaY72yWV6ryfceA39dwJIdgfIkBpaRIBlpauGFO2jT+nHuyX
   jTDacwwc4CMt9zPic50GNxheqSONroOrkAaTQWQNR7M/p4gtTQKcBDQNe
   IDLVnu1WmuZuqg4Tbv/A2FfBxTq/gea03Jcw7/NNms3N9WA1vRSOeR5ya
   flnJ4Xm/XH8hzO0+kqsmLdPQtgrWARUk/h/Glbo1Nv/ysarDX3tjpOZi4
   a5pNmJMPXDIqgSXdI22x/xToHMw7hmssLZ8niKLugsT0j1M9y8DjLvzzS
   g==;
X-CSE-ConnectionGUID: yb9vgwJiRdSvn9TbThY0GQ==
X-CSE-MsgGUID: 2Dp7tbY4SS2M+x/fNS+Q1A==
X-IronPort-AV: E=Sophos;i="6.15,200,1739833200"; 
   d="scan'208";a="43417865"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Apr 2025 08:54:39 +0200
X-CheckPoint: {67F619AF-2E-DC4DC9A0-F4F29281}
X-MAIL-CPID: 7CD51142A2A0AC6D93C942DA02FD42FC_0
X-Control-Analysis: str=0001.0A006371.67F619AC.0096,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EEA0164843;
	Wed,  9 Apr 2025 08:54:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744181675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q6+UEGaM07beYSVq7txElg3igRbrlGhkQ6SKj0rGMEs=;
	b=IM0A0iJT+UOj21PQbTwYJbNds5PEehmoEMsTmsFhS1O6DImFdpKMN0ZSKLwhxQ9bD+z3x3
	oUTBS4a+v2nqro2EDW4epbD98cwy6mwE0QuJHAnJTvi3wWoGbcq86WUzB9qYrZeR4bdHGx
	Tj/ItuTVSDMFGJ2XP4MCF2PGA7yYdTbXrSgsh/iTSqzZCgz/f523wj96q9tT59KdpLJXHx
	0ZqKSVNrAALNK9Xfcj1w+ccEtVXeXN/xCbtpnFlYcPO8Oy2Q+KzNXVRzDJp8ACv0EovjNz
	m09kDAwA/0oWH8UFAX7r6feCIGQvEr46criNZusd68TRVaOUv4YzLVpfJO/8rw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/1] hwmon: (gpio-fan) Add regulator support
Date: Wed,  9 Apr 2025 08:54:26 +0200
Message-ID: <20250409065430.1413439-1-alexander.stein@ew.tq-group.com>
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

Changes in v5:
* Fix an uninitialized variable, detected by kernel test robot

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
 drivers/hwmon/gpio-fan.c | 103 +++++++++++++++++++++++++++++++++------
 1 file changed, 87 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index cee3fa146d69a..2f507bb76a8fb 100644
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
+	int ret = 0;
 
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

