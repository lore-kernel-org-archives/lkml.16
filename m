Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0E41A5B8C;
	Sat, 26 Apr 2025 17:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745688624; cv=none; b=me9Gvk+wPVxqVAjeCrS00PkI/N6ZpWS5G4GRF0rQkz4ypFfAVofmk35CMiC6hIdp4gslSkjx4IrQfwy0mtJbMsX8ZU2L+83AZ+jF1pEkGn1uXGOsFGZbLhr84cSMVnZ48FmnGgLnTcUu3Bg/i2nQmT5DQPbV3CQrQMHSxkoF0Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745688624; c=relaxed/simple;
	bh=3rqsMKtWYDv+r8R4qstirUguRIBQx1JjmyO2tayz8yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+1XP8lU59/bXJc6gOO0HgoPo+zUnTR76Sfg7bQN2mzgSHCMc2UbNnc/dTP5t+s5hOjVK+SYv6Wp2AqXxXnxoGuKr8Mqg1wz8/cgqIIPsX3EH5K7v2Zljl0lxJmmDqiTOE6rkZWS2PKg5GZDyNqwIGCLlti+5aGsAGm89LP5MOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=3RUMcQOc; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="3RUMcQOc"
Received: from localhost.localdomain (unknown [IPv6:2a02:2149:8b6a:d000:ae13:99fc:9070:c966])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 58D5E2E02AAA;
	Sat, 26 Apr 2025 20:30:12 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1745688613;
	bh=x9LFsdTOoazevFIUaxIYSzwUMDS93xWcqV9TosqY6No=; h=From:To:Subject;
	b=3RUMcQOcp8YeJVwekq6EOoyoBjgDwfz+L7QxR/TcQvf+tTCq9WWjNHo5e1WH1Gu9k
	 IOwCuZndVzqyAOArqFS9c2x0IZWmRvLfhnbNI2pfNzdqydWO+kfm1ng0t/iIS+zoMS
	 vOi1Wx6xm03qCg2qaqKuZWFIkoMOQkf5esAlOMkg=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a02:2149:8b6a:d000:ae13:99fc:9070:c966) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Eileen <eileen@one-netbook.com>,
	Antheas Kapenekakis <lkml@antheas.dev>,
	Joshua Tam <csinaction@pm.me>
Subject: [PATCH v1 2/2] platform/x86: oxpec: Add support for the OneXPlayer G1
Date: Sat, 26 Apr 2025 19:29:55 +0200
Message-ID: <20250426172955.13957-3-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426172955.13957-1-lkml@antheas.dev>
References: <20250426172955.13957-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174568861309.7707.203268381697569054@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

The OneXPlayer G1 is a new clamshell formfactor by OneXPlayer.
It has the same registers as an OneXPlayer X1, with the only
difference being the lack of a turbo led.

Tested-by: Joshua Tam <csinaction@pm.me>
Suggested-by: Joshua Tam <csinaction@pm.me>
Signed-off-by: Joshua Tam <csinaction@pm.me>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/oxpec.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 86ac32eadd6ef..93e923b24feb6 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -58,6 +58,7 @@ enum oxp_board {
 	oxp_mini_amd_a07,
 	oxp_mini_amd_pro,
 	oxp_x1,
+	oxp_g1,
 };
 
 static enum oxp_board board;
@@ -241,6 +242,20 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = (void *)oxp_fly,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER G1 A"),
+		},
+		.driver_data = (void *)oxp_g1,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER G1 i"),
+		},
+		.driver_data = (void *)oxp_g1,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
@@ -337,6 +352,7 @@ static umode_t tt_toggle_is_visible(struct kobject *kobj,
 	case oxp_mini_amd_a07:
 	case oxp_mini_amd_pro:
 	case oxp_x1:
+	case oxp_g1:
 		return attr->mode;
 	default:
 		break;
@@ -370,6 +386,7 @@ static ssize_t tt_toggle_store(struct device *dev,
 		break;
 	case oxp_2:
 	case oxp_x1:
+	case oxp_g1:
 		reg = OXP_2_TURBO_SWITCH_REG;
 		mask = OXP_TURBO_TAKE_VAL;
 		break;
@@ -414,6 +431,7 @@ static ssize_t tt_toggle_show(struct device *dev,
 		break;
 	case oxp_2:
 	case oxp_x1:
+	case oxp_g1:
 		reg = OXP_2_TURBO_SWITCH_REG;
 		mask = OXP_TURBO_TAKE_VAL;
 		break;
@@ -502,6 +520,7 @@ static bool oxp_psy_ext_supported(void)
 {
 	switch (board) {
 	case oxp_x1:
+	case oxp_g1:
 	case oxp_fly:
 		return true;
 	default:
@@ -640,6 +659,7 @@ static int oxp_pwm_enable(void)
 	case oxp_mini_amd_a07:
 	case oxp_mini_amd_pro:
 	case oxp_x1:
+	case oxp_g1:
 		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_MANUAL);
 	default:
 		return -EINVAL;
@@ -666,6 +686,7 @@ static int oxp_pwm_disable(void)
 	case oxp_mini_amd_a07:
 	case oxp_mini_amd_pro:
 	case oxp_x1:
+	case oxp_g1:
 		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_AUTO);
 	default:
 		return -EINVAL;
@@ -692,6 +713,7 @@ static int oxp_pwm_read(long *val)
 	case oxp_mini_amd_a07:
 	case oxp_mini_amd_pro:
 	case oxp_x1:
+	case oxp_g1:
 		return read_from_ec(OXP_SENSOR_PWM_ENABLE_REG, 1, val);
 	default:
 		return -EOPNOTSUPP;
@@ -720,6 +742,7 @@ static int oxp_pwm_fan_speed(long *val)
 		return read_from_ec(ORANGEPI_SENSOR_FAN_REG, 2, val);
 	case oxp_2:
 	case oxp_x1:
+	case oxp_g1:
 		return read_from_ec(OXP_2_SENSOR_FAN_REG, 2, val);
 	case aok_zoe_a1:
 	case aya_neo_2:
@@ -753,6 +776,7 @@ static int oxp_pwm_input_write(long val)
 		return write_to_ec(ORANGEPI_SENSOR_PWM_REG, val);
 	case oxp_2:
 	case oxp_x1:
+	case oxp_g1:
 		/* scale to range [0-184] */
 		val = (val * 184) / 255;
 		return write_to_ec(OXP_SENSOR_PWM_REG, val);
@@ -792,6 +816,7 @@ static int oxp_pwm_input_read(long *val)
 		break;
 	case oxp_2:
 	case oxp_x1:
+	case oxp_g1:
 		ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
 		if (ret)
 			return ret;
-- 
2.49.0

