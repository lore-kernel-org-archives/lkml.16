Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B6327C150;
	Tue, 29 Apr 2025 08:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914467; cv=none; b=jSXWnkm1skNsoP8EhjW5fLK6SK0U4LMXODYrZlBTtffkJr6dbtqS2z4glLwBIRC8e3hHv/NancEExLhEp5KBsccvf8oV8ThrM2sD7XOzTQYdLrmrQ+p1j+iX01GeyT/fHhguDb3WQbJvgHVPWDC5LHcNfr6SkkgR7eLPGumerqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914467; c=relaxed/simple;
	bh=1+DCRbeGHM7PQfOjrqPCPY/9L/UOCvZq4UXq4SRoJPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKXpK7NsAqU1Qb89n0NyE/yAvx5pJY2IXkXb+2PP7ej/UFU8CVXnOZi9hGJVi1ccsxEPC7y78Sh2bg4Rg4mBlFGXlf/qr/55XFNPuuETigugqZEyhe+vchiWMtuqXcXrUDDo9yWNrk7JrPRgPz/rcRhDGJ/8S7cfa7vn6cgnzmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1qucDkz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1qucDkz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A86A2C4CEEF;
	Tue, 29 Apr 2025 08:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745914466;
	bh=1+DCRbeGHM7PQfOjrqPCPY/9L/UOCvZq4UXq4SRoJPs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b1qucDkz7iOyfooAgJMp4MXEx3oS1KevmoImMsbj45NpWetaVOTmiXIAzKbFH9v7S
	 j2PPA3Bk1CupMxDuQpuooa7JJRhJ/Bcd/oQqB37oY5SzVGfLQZI7qybnnnoyG0LiFW
	 9tLc6wB3H5zl1qqtL7CwBCH1QWJfJ0LYhGJ4HhyuShr+FWqfm1tEw6nB77WUw1Ufeo
	 o2lMWjUWODwN8jK98EDf4XZfsPBi4jIigoFp3ITchgMTKguuEoZYS/PUX7uqAU/mu/
	 J8tleYtJYBFwk1SxMVoLc8MT2nkmE6jL6QZuBiUUbX3jtNmx8ruHs0K+CaUDkUWdRj
	 B8r0hR+JEySOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE79C369DC;
	Tue, 29 Apr 2025 08:14:26 +0000 (UTC)
From: Sung-Chi Li via B4 Relay <devnull+lschyi.chromium.org@kernel.org>
Date: Tue, 29 Apr 2025 16:14:23 +0800
Subject: [PATCH 3/3] hwmon: (cros_ec) register fans into thermal framework
 cooling devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-cros_ec_fan-v1-3-a8d9e3efbb1a@chromium.org>
References: <20250429-cros_ec_fan-v1-0-a8d9e3efbb1a@chromium.org>
In-Reply-To: <20250429-cros_ec_fan-v1-0-a8d9e3efbb1a@chromium.org>
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Sung-Chi Li <lschyi@google.com>, Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745914465; l=5122;
 i=lschyi@chromium.org; s=20250429; h=from:subject:message-id;
 bh=CzzdhK1tpMOhvzur2FZyTlxUzTR8H+S2R1Q7+/4BMLA=;
 b=8m4Hke9PBnFU82gso9aL9qCn+SYp3bKudu0m/mK3sHYP/lWXlxINLK68OhfWnHS5ZCDfKzj4l
 iFhG6t6mxhvB7/9mEPWNu8IE8W7tsB45j2t+IqlZeSb7T1Cb8nGaqp0
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
---
 Documentation/hwmon/cros_ec_hwmon.rst |  2 +
 drivers/hwmon/cros_ec_hwmon.c         | 72 +++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/cros_ec_hwmon.rst
index 5b802be120438732529c3d25b1afa8b4ee353305..82c75bdaf912a116eaafa3149dc1252b3f7007d2 100644
--- a/Documentation/hwmon/cros_ec_hwmon.rst
+++ b/Documentation/hwmon/cros_ec_hwmon.rst
@@ -27,3 +27,5 @@ Fan and temperature readings are supported. PWM fan control is also supported if
 the EC also supports setting fan PWM values and fan mode. Note that EC will
 switch fan control mode back to auto when suspended. This driver will restore
 the fan state before suspended.
+If a fan is controllable, this driver will register that fan as a cooling device
+in the thermal framework as well.
diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 1139074d3eb003ee72bbe54a954647ced40f6d21..c38c61bba431fe25322793f7dd5db59fcc95daaf 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
+#include <linux/thermal.h>
 #include <linux/types.h>
 #include <linux/units.h>
 
@@ -30,6 +31,11 @@ struct cros_ec_hwmon_priv {
 	u8 manual_fan_pwm_values[EC_FAN_SPEED_ENTRIES];
 };
 
+struct cros_ec_hwmon_cooling_priv {
+	struct cros_ec_hwmon_priv *hwmon_priv;
+	u8 index;
+};
+
 static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index, u16 *speed)
 {
 	int ret;
@@ -340,6 +346,38 @@ static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
 	NULL
 };
 
+static int
+cros_ec_hwmon_cooling_get_max_state(struct thermal_cooling_device *cdev,
+				    unsigned long *val)
+{
+	*val = 100;
+	return 0;
+}
+
+static int
+cros_ec_hwmon_cooling_get_cur_state(struct thermal_cooling_device *cdev,
+				    unsigned long *val)
+{
+	const struct cros_ec_hwmon_cooling_priv *priv = cdev->devdata;
+	u8 raw_val;
+	int ret = cros_ec_hwmon_read_pwm_raw_value(priv->hwmon_priv->cros_ec,
+						   priv->index, &raw_val);
+
+	if (ret == 0)
+		*val = raw_val;
+	return ret;
+}
+
+static int
+cros_ec_hwmon_cooling_set_cur_state(struct thermal_cooling_device *cdev,
+				    unsigned long val)
+{
+	const struct cros_ec_hwmon_cooling_priv *priv = cdev->devdata;
+
+	return cros_ec_hwmon_set_pwm_raw_value(priv->hwmon_priv, priv->index,
+					       val);
+}
+
 static const struct hwmon_ops cros_ec_hwmon_ops = {
 	.read = cros_ec_hwmon_read,
 	.read_string = cros_ec_hwmon_read_string,
@@ -347,6 +385,12 @@ static const struct hwmon_ops cros_ec_hwmon_ops = {
 	.is_visible = cros_ec_hwmon_is_visible,
 };
 
+static const struct thermal_cooling_device_ops cros_ec_thermal_cooling_ops = {
+	.get_max_state = cros_ec_hwmon_cooling_get_max_state,
+	.get_cur_state = cros_ec_hwmon_cooling_get_cur_state,
+	.set_cur_state = cros_ec_hwmon_cooling_set_cur_state,
+};
+
 static const struct hwmon_chip_info cros_ec_hwmon_chip_info = {
 	.ops = &cros_ec_hwmon_ops,
 	.info = cros_ec_hwmon_info,
@@ -421,6 +465,33 @@ cros_ec_hwmon_probe_fan_control_supported(struct cros_ec_hwmon_priv *priv)
 	priv->fan_control_supported = true;
 }
 
+static void
+cros_ec_hwmon_register_fan_cooling_devices(struct device *dev,
+					   struct cros_ec_hwmon_priv *priv)
+{
+	struct cros_ec_hwmon_cooling_priv *cpriv;
+	size_t i;
+
+	if (!priv->fan_control_supported)
+		return;
+
+	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
+		if (!(priv->usable_fans & BIT(i)))
+			continue;
+
+		cpriv = devm_kzalloc(dev, sizeof(*cpriv), GFP_KERNEL);
+		if (!cpriv)
+			return;
+
+		cpriv->hwmon_priv = priv;
+		cpriv->index = i;
+		devm_thermal_of_cooling_device_register(
+			dev, NULL,
+			devm_kasprintf(dev, GFP_KERNEL, "cros-ec-fan%zu", i),
+			cpriv, &cros_ec_thermal_cooling_ops);
+	}
+}
+
 static int cros_ec_hwmon_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -452,6 +523,7 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
 	cros_ec_hwmon_probe_temp_sensors(dev, priv, thermal_version);
 	cros_ec_hwmon_probe_fans(priv);
 	cros_ec_hwmon_probe_fan_control_supported(priv);
+	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
 
 	platform_priv->hwmon_dev = devm_hwmon_device_register_with_info(
 		dev, "cros_ec", priv, &cros_ec_hwmon_chip_info, NULL);

-- 
2.49.0.901.g37484f566f-goog


