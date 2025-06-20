Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5C222576E;
	Fri, 20 Jun 2025 06:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402157; cv=none; b=S0+XkaD3LP/FGa39oGJkUxGyxELEKuJ9JMrWz7CtjSaMhHmrnL36aIe1qWLfxoip63RgbtS0pLZAnWzYs9jpuDQOJ7rR0HWnbcPAIcaU4ZfxW/5cUzc7lb3uokVT//P1ca6SmdRX6C7Ft8ONuphACmLqr+pyCt8tOADIC4CvtXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402157; c=relaxed/simple;
	bh=BEkffVQT+dv7o7JSwK7QKog6snh6NOxNxBOGgfcXDok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uSCTbPb/qDGR9fQVJZcyf5h3CL5d2A7vhuV4VrsM9DXP+tAWSUsQlWygwjxS16HwbuBxxIEk5S1j51VDwwc0fpPiWp9r7DkMQQSpreciBSKVEsYVP3OSzypLTdL1Sv8AWaWSWU5+SfE1b7B+OjUR0CRknIICHQKJc9j1rz9InX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceKJbs2Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceKJbs2Y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE4A5C4CEF0;
	Fri, 20 Jun 2025 06:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750402155;
	bh=BEkffVQT+dv7o7JSwK7QKog6snh6NOxNxBOGgfcXDok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ceKJbs2YD7+RLH8J1KKpOpJbdEJWuHJWkoKDuXNVC3UJLXJFqbe8IPbwHGF+yd0di
	 /RaZLN17kfAN1eUBZ/yqyqNpqpTNFnn7IlWLRg69x+k9rNHlh7XpsMTcvuoCNi+kje
	 kf5QsySvHvnWJd1YQ8Bbmyh+nA2STxYkRLYbWjcHHxcqJfq7P+F08ubqJGgLmQfnnq
	 +VTbSVzTgDmZiVH9C16H69VwIP+Rajeclf4+HMeS0L3936C0ZcpiGIm69i3+LsZFOG
	 iyMD8pGsI1WmomHO+EwV6Tz2aMEdxABubGkxmczvwhDdY8+nmqolzpD0FQ6GCKLZ1g
	 bsvxiKlyz945A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FBFC71155;
	Fri, 20 Jun 2025 06:49:15 +0000 (UTC)
From: Sung-Chi Li via B4 Relay <devnull+lschyi.chromium.org@kernel.org>
Date: Fri, 20 Jun 2025 14:49:14 +0800
Subject: [PATCH v5 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250620-cros_ec_fan-v5-3-5979ea1abb31@chromium.org>
References: <20250620-cros_ec_fan-v5-0-5979ea1abb31@chromium.org>
In-Reply-To: <20250620-cros_ec_fan-v5-0-5979ea1abb31@chromium.org>
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Sung-Chi Li <lschyi@google.com>, Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750402154; l=5577;
 i=lschyi@chromium.org; s=20250429; h=from:subject:message-id;
 bh=KPNY8JaV/QeHp/C+finyouQ2u8z+FuTEAFYw/TlqxZI=;
 b=LzNgaYb9DGqCAHr5PWnfQgKBLVZzwz9hBJRJCZOQoQYcoIFC4oMFUl0x0isJUUrhM0mZpnR1r
 ZraMYeZmu47DCaiKdVp7OZ3tKgtacCAV14gDj7btF7nRTgvjNgKVEne
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=9gCZPRJmYyHDt6VN9FV2UreFcUr73JFrwYvmsltW9Y8=
X-Endpoint-Received: by B4 Relay for lschyi@chromium.org/20250429 with
 auth_id=392
X-Original-From: Sung-Chi Li <lschyi@chromium.org>
Reply-To: lschyi@chromium.org

From: Sung-Chi Li <lschyi@chromium.org>

Register fans connected under EC as thermal cooling devices as well, so
these fans can then work with the thermal framework.

During the driver probing phase, we will also try to register each fan
as a thermal cooling device based on previous probe result (whether the
there are fans connected on that channel, and whether EC supports fan
control). The basic get max state, get current state, and set current
state methods are then implemented as well.

Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
Acked-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Documentation/hwmon/cros_ec_hwmon.rst |  2 +
 drivers/hwmon/cros_ec_hwmon.c         | 85 +++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/cros_ec_hwmon.rst
index 355557a08c9a54b4c177bafde3743e7dc02218be..6db812708325f7abb6d319af3312b4079e6923c6 100644
--- a/Documentation/hwmon/cros_ec_hwmon.rst
+++ b/Documentation/hwmon/cros_ec_hwmon.rst
@@ -27,3 +27,5 @@ Fan and temperature readings are supported. PWM fan control is also supported if
 the EC also supports setting fan PWM values and fan mode. Note that EC will
 switch fan control mode back to auto when suspended. This driver will restore
 the fan state to what they were before suspended when resumed.
+If a fan is controllable, this driver will register that fan as a cooling device
+in the thermal framework as well.
diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index e26590e6e3b5894678791696a41820120bde6cd5..38469703dc012b4ae02b0dc41d717df7264050f3 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
+#include <linux/thermal.h>
 #include <linux/types.h>
 #include <linux/units.h>
 
@@ -31,6 +32,11 @@ struct cros_ec_hwmon_priv {
 	u8 manual_fan_pwm[EC_FAN_SPEED_ENTRIES];
 };
 
+struct cros_ec_hwmon_cooling_priv {
+	struct cros_ec_hwmon_priv *hwmon_priv;
+	u8 index;
+};
+
 static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index, u16 *speed)
 {
 	int ret;
@@ -306,6 +312,42 @@ static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
 	NULL
 };
 
+static int cros_ec_hwmon_cooling_get_max_state(struct thermal_cooling_device *cdev,
+					       unsigned long *val)
+{
+	*val = 255;
+	return 0;
+}
+
+static int cros_ec_hwmon_cooling_get_cur_state(struct thermal_cooling_device *cdev,
+					       unsigned long *val)
+{
+	const struct cros_ec_hwmon_cooling_priv *priv = cdev->devdata;
+	u8 read_val;
+	int ret;
+
+	ret = cros_ec_hwmon_read_pwm_value(priv->hwmon_priv->cros_ec, priv->index, &read_val);
+	if (ret)
+		return ret;
+
+	*val = read_val;
+	return 0;
+}
+
+static int cros_ec_hwmon_cooling_set_cur_state(struct thermal_cooling_device *cdev,
+					       unsigned long val)
+{
+	const struct cros_ec_hwmon_cooling_priv *priv = cdev->devdata;
+
+	return cros_ec_hwmon_write_pwm_input(priv->hwmon_priv->cros_ec, priv->index, val);
+}
+
+static const struct thermal_cooling_device_ops cros_ec_thermal_cooling_ops = {
+	.get_max_state = cros_ec_hwmon_cooling_get_max_state,
+	.get_cur_state = cros_ec_hwmon_cooling_get_cur_state,
+	.set_cur_state = cros_ec_hwmon_cooling_set_cur_state,
+};
+
 static const struct hwmon_ops cros_ec_hwmon_ops = {
 	.read = cros_ec_hwmon_read,
 	.read_string = cros_ec_hwmon_read_string,
@@ -381,6 +423,48 @@ static bool cros_ec_hwmon_probe_fan_control_supported(struct cros_ec_device *cro
 	       is_cros_ec_cmd_available(cros_ec, EC_CMD_THERMAL_AUTO_FAN_CTRL, CROS_EC_HWMON_THERMAL_AUTO_FAN_CTRL_CMD_VERSION);
 }
 
+static void cros_ec_hwmon_register_fan_cooling_devices(struct device *dev,
+						       struct cros_ec_hwmon_priv *priv)
+{
+	struct cros_ec_hwmon_cooling_priv *cpriv;
+	struct thermal_cooling_device *cdev;
+	const char *type;
+	size_t i;
+
+	if (!IS_ENABLED(CONFIG_THERMAL))
+		return;
+
+	if (!priv->fan_control_supported)
+		return;
+
+	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
+		if (!(priv->usable_fans & BIT(i)))
+			continue;
+
+		cpriv = devm_kzalloc(dev, sizeof(*cpriv), GFP_KERNEL);
+		if (!cpriv) {
+			dev_warn(dev, "no memory for registering fan %zu as a cooling device\n", i);
+			continue;
+		}
+
+		type = devm_kasprintf(dev, GFP_KERNEL, "%s-fan%zu", dev_name(dev), i);
+		if (!type) {
+			dev_warn(dev, "no memory to compose cooling device type for fan %zu\n", i);
+			continue;
+		}
+
+		cpriv->hwmon_priv = priv;
+		cpriv->index = i;
+		cdev = devm_thermal_of_cooling_device_register(dev, NULL, type, cpriv,
+							       &cros_ec_thermal_cooling_ops);
+		if (IS_ERR(cdev)) {
+			dev_warn(dev, "failed to register fan %zu as a cooling device: %pe\n", i,
+				 cdev);
+			continue;
+		}
+	}
+}
+
 static int cros_ec_hwmon_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -408,6 +492,7 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
 	cros_ec_hwmon_probe_temp_sensors(dev, priv, thermal_version);
 	cros_ec_hwmon_probe_fans(priv);
 	priv->fan_control_supported = cros_ec_hwmon_probe_fan_control_supported(priv->cros_ec);
+	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
 							 &cros_ec_hwmon_chip_info, NULL);

-- 
2.50.0.rc2.701.gf1e915cc24-goog


