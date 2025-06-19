Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911F623C514;
	Thu, 19 Jun 2025 07:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750318977; cv=none; b=seZQyxsdN75pPWJT5QBtTRrqKrKodGUUnNF1reJOyFMRelrxQ1bQCVG9WlrHC1m0Jaf7/AvriywTNQzD+KfTwLgWKDIowGtrN8kBzS/3I53jBJ5VUSMXV+/G/OJe/aAGsXuB/HsBV9PA2P1G7yIGVCN1kDfRwye0x0xKu2ggdmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750318977; c=relaxed/simple;
	bh=b9H0FqFFqqf2pAqLpYWLcjBdkrZBk0Ky1iKnCLvRI9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZBbIn0oWDFGt/XzFiXPvzb1XR8OuvbSA91fDd/j/8SU6X7KcJoI7bzKgvhwR3zf0HiksukPnw7HvZ0VR3aQ3ph2aBO1Y5voHuABZAG2qTMY+n0ufb9QHTzVOAucct+MyoGwyqbksBMQNxRBQhFT/BkcESKZhDrpCZcL/Ht6KYtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqmH35+j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqmH35+j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3FC15C4CEEA;
	Thu, 19 Jun 2025 07:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750318977;
	bh=b9H0FqFFqqf2pAqLpYWLcjBdkrZBk0Ky1iKnCLvRI9I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rqmH35+jtZenmjM56osIg0bIvaSaUcCnVKTIJBfFU6MgwZYpoD0wRGj2NHr9ht87s
	 TI5C/jehznwWdHNPHk2KvMDGjO3zYEcg6ZOpEs6mc6GfSwJWZ8Krvov0iPpLU2gaUA
	 UDNT/BBU4YB+yMEOi09scfTJNdyhy/RYidUc857a0Mki7VsHJrCGIyURM//hOvki04
	 9BDi8h1WczRfnC+1MXfNImpou+JQC6zCpunJBiKwXBLoOJvCozPTzrx+z7psyYv3WM
	 /R8ajZKz0NRtwtk3sf0jjmYi3lkJ0m3pwiR19E2WwWWlMzIlosBZspP57h694zPtj5
	 LdazrcxFhnpvw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29725C7115B;
	Thu, 19 Jun 2025 07:42:57 +0000 (UTC)
From: Sung-Chi Li via B4 Relay <devnull+lschyi.chromium.org@kernel.org>
Date: Thu, 19 Jun 2025 15:42:54 +0800
Subject: [PATCH v4 1/3] platform/chrome: update pwm fan control host
 commands
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-cros_ec_fan-v4-1-ca11548ce449@chromium.org>
References: <20250619-cros_ec_fan-v4-0-ca11548ce449@chromium.org>
In-Reply-To: <20250619-cros_ec_fan-v4-0-ca11548ce449@chromium.org>
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Sung-Chi Li <lschyi@google.com>, Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750318976; l=2194;
 i=lschyi@chromium.org; s=20250429; h=from:subject:message-id;
 bh=eTkgZyPaJnNGt3GF+wBV3FuUrCXpaB4J4qpBRGHJ4Jc=;
 b=KJ/LKjnHbQ8IDrDi4tvGf1Yc9/hvC7gnMFmvQOY1cl9sJihv3PvIhF1Fud7tsQjiMQOtYhIih
 TFk2S4jVwLNA/Z8w7sjVHXrQAgAReNpR9HjZcQexsQIvOtpCXTdHfZ6
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
index c74edd735a0e3992a06affa62d63a0882bb75967..e41e04d01e93d33704af76a7eac95d53bdb1fd54 100644
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
@@ -3137,14 +3147,31 @@ struct ec_params_thermal_set_threshold_v1 {
 
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
2.50.0.rc2.701.gf1e915cc24-goog


