Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8601AF4D5;
	Fri,  2 May 2025 05:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746164094; cv=none; b=DT43s3W/wgGgniiZPabMnJcAEkuuHGF202XQo5SdWGvn6n4ynVf7Td7YdH10OnOOAFOfD+JnaVoxtgGcFcmto8Cf6nyNjBa8Ew8sHkL1Z6pqf7lX8ubN52hs3YcKWpkuzzXvkWNu8I5kBrinUeVG7mV6ZErrxHyn+MVLRLXbdK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746164094; c=relaxed/simple;
	bh=I9TKtOfIz7e77mNMYQUfQHoe2lc+rT7bWls4rjgUVgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CwFgkZ3aYXdKtrXJDus+qyMO54QiRtoLKVhNzfWHTTSeDiUl91JpPkH7ESscffYTjAv/SmlUiZxmIHbmT3S6fYqGPIPucRzITCeprclftraCKCOdL032xgfSeJoEsbUdi4xDdiVYJFekNjZAALRh5zpWfFLmv5FwuDQ97R1z7ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObpHU2j4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObpHU2j4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA4DEC4CEEF;
	Fri,  2 May 2025 05:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746164094;
	bh=I9TKtOfIz7e77mNMYQUfQHoe2lc+rT7bWls4rjgUVgg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ObpHU2j4GevXiDr1kEd7XGzJYtijRgbzLCx9ZgXB/sTp3RwZs/n/uM6MHfWcebR5g
	 BUQFo4ubhPFL0w1mGPPjqVSo7icuHND0eGK3C4vtiR8G3Z98yELQQUpKGRsSkzuCwH
	 AUpG/gLvjaAvwGzRd67ri5qCW9cddl9I0KvvbvXT8hFU49t8TyWVHwlazwuLbS5q9F
	 GpNdMlxt2yzRYTulnexLesAgFRRieVXablY2fisoBhF3Lukkzd2OC7B4E6jIAoTeUc
	 x4k1PueFKzKOKwXSg1TX6CnI9KWeFFnkq4wqRBrweQFkWczC3EIInTnUamzu2xRVPg
	 F77VDj6pvbSGg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2FAC3ABAC;
	Fri,  2 May 2025 05:34:53 +0000 (UTC)
From: Sung-Chi Li via B4 Relay <devnull+lschyi.chromium.org@kernel.org>
Date: Fri, 02 May 2025 13:34:47 +0800
Subject: [PATCH v2 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-cros_ec_fan-v2-3-4d588504a01f@chromium.org>
References: <20250502-cros_ec_fan-v2-0-4d588504a01f@chromium.org>
In-Reply-To: <20250502-cros_ec_fan-v2-0-4d588504a01f@chromium.org>
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Sung-Chi Li <lschyi@google.com>, Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746164092; l=5119;
 i=lschyi@chromium.org; s=20250429; h=from:subject:message-id;
 bh=STzNXdU8ezymZTAK/gVnm4TwlGsm/I6wriR+2/nBIdg=;
 b=MkGVoQLKYLejauV+to63+g0hFH/2Jo3xzuCpl0EsnSlvdhZkvvChqPjQ5dsOO1HbMBJ3IZ/lJ
 jfif3UIb6OsDLP+AckGq7VavB7jiOndv01Rs3FYFF4IAQc+N6NFM7Yy
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
 Documentation/hwmon/cros_ec_hwmon.rst |  2 ++
 drivers/hwmon/cros_ec_hwmon.c         | 66 +++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

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
index c5e42e2a03a0c8c68d3f8afbb2bb45b93a58b955..abfcf44fb7505189124e78c651b0eb1e0533b4e8 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
+#include <linux/thermal.h>
 #include <linux/types.h>
 #include <linux/units.h>
 
@@ -27,6 +28,11 @@ struct cros_ec_hwmon_priv {
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
@@ -300,6 +306,34 @@ static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
 	NULL
 };
 
+static int
+cros_ec_hwmon_cooling_get_max_state(struct thermal_cooling_device *cdev,
+				    unsigned long *val)
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
+	int ret = cros_ec_hwmon_read_pwm_value(priv->hwmon_priv->cros_ec, priv->index, &read_val);
+
+	if (ret == 0)
+		*val = read_val;
+	return ret;
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
 static const struct hwmon_ops cros_ec_hwmon_ops = {
 	.read = cros_ec_hwmon_read,
 	.read_string = cros_ec_hwmon_read_string,
@@ -307,6 +341,12 @@ static const struct hwmon_ops cros_ec_hwmon_ops = {
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
@@ -374,6 +414,31 @@ static bool cros_ec_hwmon_probe_fan_control_supported(struct cros_ec_device *cro
 	       is_cros_ec_cmd_fulfilled(cros_ec, EC_CMD_THERMAL_AUTO_FAN_CTRL, 2);
 }
 
+static void cros_ec_hwmon_register_fan_cooling_devices(struct device *dev,
+						       struct cros_ec_hwmon_priv *priv)
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
+			dev, NULL, devm_kasprintf(dev, GFP_KERNEL, "cros-ec-fan%zu", i), cpriv,
+			&cros_ec_thermal_cooling_ops);
+	}
+}
+
 static int cros_ec_hwmon_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -402,6 +467,7 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
 	cros_ec_hwmon_probe_fans(priv);
 	priv->fan_control_supported =
 		cros_ec_hwmon_probe_fan_control_supported(priv->cros_ec);
+	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
 							 &cros_ec_hwmon_chip_info, NULL);

-- 
2.49.0.906.g1f30a19c02-goog


