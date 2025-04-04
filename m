Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACEB12D1F1;
	Fri,  4 Apr 2025 13:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.39.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774140; cv=none; b=RD/Cm0O5jsVl15K30XjwzPFAM1sbmN3A16t8o4JSs6ZSPWVvNztDj5JkTt44w+l2KIeabJH68oD6JqD0AB0AC0VPOMcvftkdKBw+UFwL7KRXOdz4RV/ToHfrNBRdQRCjpAm8aEBp+ISSca8Fky7/dXNkQduGSeELRbExgJMINXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774140; c=relaxed/simple;
	bh=6SAs7ZiWvqWG3XPpQsQtnVyH6fMBaB/n6b1668EDrmw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TZrJHlkS5L/p8/nAOF3+IE+hzYINdpiS3HHKz4BVcf883VR/0J4JZQz+MgqyTTvZdeqQV0E1m13msu/jK66Sc4aTTv98dX2obM1nDAtAfMCzKlcAxfOXwFXKHvdS5umxmjWz9X/wQ0O7dUawjVhjco0naLJMLJkr4XEzZT6xwNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com; spf=pass smtp.mailfrom=dh-electronics.com; dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b=BwRXDgMb; arc=none smtp.client-ip=188.68.39.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b="BwRXDgMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1743774104;
	bh=fy8WY+eU9dK+jaA1NumMddQBYAbhrFBEaD8MJdiHjGM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=BwRXDgMbbs8loO4tUgMIhxqSQHLV4AN1wy5ONt/s8y5vGULDMKD3ifMcWCBM+ILx8
	 OwYhL5E8VDxKJ+n8y+ZgkgvlUWW2LpL+qNEJomFNQd3lNwEG7CI2LPXZcbcA3d3i/U
	 xSF8LWYY7G2j8/9HNCoag9hfSgUGs+GlodFJMKDjQWl2XufgM5V0UpECnuf5IcEyFQ
	 tHokH/b3Jt9GjxdA/qa4X+2z9lwIKQkSzakm/7/l3+UpfVb8AGewkeCnEMXXzDvmOr
	 rGTur2v6Rq6lbrGWXvXowh20+xBjvDmLDgjsgciLPy2kLuzue3+1JNBa1zIA6ExdCq
	 jGX7WJumfBRqg==
From: Johann Neuhauser <jneuhauser@dh-electronics.com>
To: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: Johann Neuhauser <jneuhauser@dh-electronics.com>, Jonathan Corbet
	<corbet@lwn.net>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>
Subject: [PATCH 1/3] regulator: userspace-consumer: Add uevent reporting for regulator events
Date: Fri, 4 Apr 2025 15:40:07 +0200
Message-ID: <20250404134009.2610460-2-jneuhauser@dh-electronics.com>
X-klartext: yes
In-Reply-To: <20250404134009.2610460-1-jneuhauser@dh-electronics.com>
References: <20250404134009.2610460-1-jneuhauser@dh-electronics.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Generate uevents when regulator events such as voltage changes, overcurrent,
or enable/disable transitions occur. A separate uevent is emitted for each
individual regulator event bit, allowing precise event handling in userspace
via udev rules.

The emitted uevent key `EVENT=` corresponds directly to the event types defined
in include/uapi/regulator/regulator.h.

This provides a flexible, user-friendly mechanism to monitor and handle
regulator events from userspace.

Signed-off-by: Johann Neuhauser <jneuhauser@dh-electronics.com>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/userspace-consumer.c | 74 +++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/userspace-consumer.c b/drivers/regulator/userspace-consumer.c
index 72bb5ffb49a8..01cf07d42682 100644
--- a/drivers/regulator/userspace-consumer.c
+++ b/drivers/regulator/userspace-consumer.c
@@ -11,6 +11,7 @@
  *   Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
 #include <linux/module.h>
@@ -29,6 +30,9 @@ struct userspace_consumer_data {
 
 	int num_supplies;
 	struct regulator_bulk_data *supplies;
+
+	struct kobject *kobj;
+	struct notifier_block nb;
 };
 
 static ssize_t name_show(struct device *dev,
@@ -115,12 +119,68 @@ static const struct attribute_group attr_group = {
 	.is_visible =  attr_visible,
 };
 
+/*
+ * This should probably be placed elsewhere in the regulator framework...
+ */
+static const char *regulator_event_str(unsigned long event)
+{
+	switch (event) {
+	case REGULATOR_EVENT_ABORT_DISABLE:
+		return "ABORT_DISABLE";
+	case REGULATOR_EVENT_ABORT_VOLTAGE_CHANGE:
+		return "ABORT_VOLTAGE_CHANGE";
+	case REGULATOR_EVENT_DISABLE:
+		return "DISABLE";
+	case REGULATOR_EVENT_ENABLE:
+		return "ENABLE";
+	case REGULATOR_EVENT_FAIL:
+		return "FAIL";
+	case REGULATOR_EVENT_FORCE_DISABLE:
+		return "FORCE_DISABLE";
+	case REGULATOR_EVENT_OVER_CURRENT:
+		return "OVER_CURRENT";
+	case REGULATOR_EVENT_OVER_TEMP:
+		return "OVER_TEMP";
+	case REGULATOR_EVENT_PRE_DISABLE:
+		return "PRE_DISABLE";
+	case REGULATOR_EVENT_PRE_VOLTAGE_CHANGE:
+		return "PRE_VOLTAGE_CHANGE";
+	case REGULATOR_EVENT_REGULATION_OUT:
+		return "REGULATION_OUT";
+	case REGULATOR_EVENT_UNDER_VOLTAGE:
+		return "UNDER_VOLTAGE";
+	case REGULATOR_EVENT_VOLTAGE_CHANGE:
+		return "VOLTAGE_CHANGE";
+	default:
+		return NULL;
+	}
+}
+
+static int regulator_userspace_notify(struct notifier_block *nb, unsigned long event, void *unused)
+{
+	struct userspace_consumer_data *drvdata = container_of(nb, struct userspace_consumer_data, nb);
+	char env_buf[128];
+	char *envp[] = { "NAME=event", env_buf, NULL };
+	unsigned int bit;
+
+	for_each_set_bit(bit, &event, BITS_PER_TYPE(event)) {
+		const char *event_str = regulator_event_str(BIT(bit));
+
+		if (event_str && event_str[0] != '\0') {
+			scnprintf(env_buf, sizeof(env_buf), "EVENT=%s", event_str);
+			kobject_uevent_env(drvdata->kobj, KOBJ_CHANGE, envp);
+		}
+	}
+
+	return NOTIFY_OK;
+}
+
 static int regulator_userspace_consumer_probe(struct platform_device *pdev)
 {
 	struct regulator_userspace_consumer_data tmpdata;
 	struct regulator_userspace_consumer_data *pdata;
 	struct userspace_consumer_data *drvdata;
-	int ret;
+	int i, ret;
 
 	pdata = dev_get_platdata(&pdev->dev);
 	if (!pdata) {
@@ -153,6 +213,7 @@ static int regulator_userspace_consumer_probe(struct platform_device *pdev)
 	drvdata->num_supplies = pdata->num_supplies;
 	drvdata->supplies = pdata->supplies;
 	drvdata->no_autoswitch = pdata->no_autoswitch;
+	drvdata->kobj = &pdev->dev.kobj;
 
 	mutex_init(&drvdata->lock);
 
@@ -184,6 +245,13 @@ static int regulator_userspace_consumer_probe(struct platform_device *pdev)
 	}
 	drvdata->enabled = !!ret;
 
+	drvdata->nb.notifier_call = regulator_userspace_notify;
+	for (i = 0; i < drvdata->num_supplies; i++) {
+		ret = devm_regulator_register_notifier(drvdata->supplies[i].consumer, &drvdata->nb);
+		if (ret)
+			goto err_enable;
+	}
+
 	return 0;
 
 err_enable:
@@ -195,6 +263,10 @@ static int regulator_userspace_consumer_probe(struct platform_device *pdev)
 static void regulator_userspace_consumer_remove(struct platform_device *pdev)
 {
 	struct userspace_consumer_data *data = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < data->num_supplies; i++)
+		devm_regulator_unregister_notifier(data->supplies[i].consumer, &data->nb);
 
 	sysfs_remove_group(&pdev->dev.kobj, &attr_group);
 
-- 
2.39.5

