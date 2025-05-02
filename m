Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8FB1B041E;
	Fri,  2 May 2025 05:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746164094; cv=none; b=BfoFc8AcIOHLIn8YYBNXwJ9WEeBDVrIazAEmJy0eUgmtfG3Pybhj7DtfIhPCGPqd6Jw0+A8nCU0kqQKaTpj9GDUNo65IkCw2PdtC+8xAQGK+W8KZvP5ZIOVtOo9WJfMHYBKbHke2AsoKoV+0gNm54dLg4y0SimzsV4UowjXSf4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746164094; c=relaxed/simple;
	bh=ZHF6lZG6H0CLXxqER5TXOaxCAJ/9ZDc6g5NfObH5I+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BvIwiZOZy20nhsWbOAPQtIWI+unvyliJ2xWIdn7/TePVAODImm028Szn0PWWXIkHvNEUCU3QACrRoWoshsdkrfWexzM8JYR8t790v5RqdHlh3CCvb/gGmx1RSuAB9JJdKVlNoYhXnWPWR1gK8vTd9SdQNZO6T99gRISpE6/H//w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWmRM4v5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWmRM4v5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3CA6C4CEEE;
	Fri,  2 May 2025 05:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746164093;
	bh=ZHF6lZG6H0CLXxqER5TXOaxCAJ/9ZDc6g5NfObH5I+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mWmRM4v5wNhXj/mTCWE3K5ZU0VpXsxfUMd2MCqIk9yJXn92u91JvyUKr5A+lNkX6K
	 OFp8hJP6Z1AKK/A98VaMsw10uq0OLTDDJOTiQRy765H45sfoDcNd/IJDDdYU7+iXIr
	 xE2fZXPMuF7f4SNaZZd2A0P8A/7zue5t4OA4HGM6rZ+AReOjKPg+ysCJA4zP/TjIID
	 mWiUjAWbPZz4nCIMa7WydqQxIS/J70YsR3K6elicPHo7v9+zdya85ZUiuiWWaYfp2u
	 sgdp1AWeo+WCMvwvgfZIwwI624C5fbIHTlVSlMm+lLdLVqJ6FCwK8LpgVZn+uLmz3A
	 xPotZgASfr3yA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35E6C3ABA3;
	Fri,  2 May 2025 05:34:53 +0000 (UTC)
From: Sung-Chi Li via B4 Relay <devnull+lschyi.chromium.org@kernel.org>
Date: Fri, 02 May 2025 13:34:45 +0800
Subject: [PATCH v2 1/3] platform/chrome: update pwm fan control host
 commands
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-cros_ec_fan-v2-1-4d588504a01f@chromium.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746164092; l=2190;
 i=lschyi@chromium.org; s=20250429; h=from:subject:message-id;
 bh=4T0NUcv5bDwOZ86UnzqLmBBo6gQiZCHpqea0lTmvUmo=;
 b=XLKkGq/1Nn45mqPASW5UteQy9xW/ap+7lqblzHQgsw7oA1mTAIaHJcpuMFdmruZvAvvDHxCu3
 x2BTKrf3vB9DC3oACybKeVEc+my275KhfDxr2JDLNtISgQofArILAzU
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=9gCZPRJmYyHDt6VN9FV2UreFcUr73JFrwYvmsltW9Y8=
X-Endpoint-Received: by B4 Relay for lschyi@chromium.org/20250429 with
 auth_id=392
X-Original-From: Sung-Chi Li <lschyi@chromium.org>
Reply-To: lschyi@chromium.org

From: Sung-Chi Li <lschyi@chromium.org>

Update cros_ec_commands.h to include definitions for getting PWM fan
duty, getting and setting the fan control mode.

Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
---
 include/linux/platform_data/cros_ec_commands.h | 29 +++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 1f4e4f2b89bb936b4b1c3f4162fec203b196cbc8..2ac1a30f9a3195bfc9dffc72fe5c5b92d83f1ef2 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -1825,6 +1825,16 @@ struct ec_response_pwm_get_duty {
 	uint16_t duty;     /* Duty cycle, EC_PWM_MAX_DUTY = 100% */
 } __ec_align2;
 
+#define EC_CMD_PWM_GET_FAN_DUTY 0x0027
+
+struct ec_params_pwm_get_fan_duty {
+	uint8_t fan_idx;
+} __ec_align1;
+
+struct ec_response_pwm_get_fan_duty {
+	uint32_t percent; /* Percentage of duty cycle, ranging from 0 ~ 100 */
+} __ec_align4;
+
 /*****************************************************************************/
 /*
  * Lightbar commands. This looks worse than it is. Since we only use one HOST
@@ -3105,14 +3115,31 @@ struct ec_params_thermal_set_threshold_v1 {
 
 /****************************************************************************/
 
-/* Toggle automatic fan control */
+/* Set or get fan control mode */
 #define EC_CMD_THERMAL_AUTO_FAN_CTRL 0x0052
 
+enum ec_auto_fan_ctrl_cmd {
+	EC_AUTO_FAN_CONTROL_CMD_SET = 0,
+	EC_AUTO_FAN_CONTROL_CMD_GET,
+};
+
 /* Version 1 of input params */
 struct ec_params_auto_fan_ctrl_v1 {
 	uint8_t fan_idx;
 } __ec_align1;
 
+/* Version 2 of input params */
+struct ec_params_auto_fan_ctrl_v2 {
+	uint8_t fan_idx;
+	uint8_t cmd; /* enum ec_auto_fan_ctrl_cmd */
+	uint8_t set_auto; /* only used with EC_AUTO_FAN_CONTROL_CMD_SET - bool
+			   */
+} __ec_align4;
+
+struct ec_response_auto_fan_control {
+	uint8_t is_auto; /* bool */
+} __ec_align1;
+
 /* Get/Set TMP006 calibration data */
 #define EC_CMD_TMP006_GET_CALIBRATION 0x0053
 #define EC_CMD_TMP006_SET_CALIBRATION 0x0054

-- 
2.49.0.906.g1f30a19c02-goog


