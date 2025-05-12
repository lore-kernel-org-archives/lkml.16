Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88724255E2E;
	Mon, 12 May 2025 07:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747033921; cv=none; b=bLWHILNjj8STImAYfQ7jM4JVPfmionHbFUXSnnbON0tXiTvRr0wJoJPlp8OMAyHLy4bKIUWv/m1GUhe43uTxkM7cov9aXWDrfvBNMJ5OIO5sGVM3oQ4ceuL7+oUiwcUtUrNLD4RyneucJ/3H4a6aeXWFRomO+m7uem+HpT+qkno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747033921; c=relaxed/simple;
	bh=eUjqDdKBS2zL1kx29M2yENFNnQfhfsbkf7b/7DRRHQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GIH7zHzOOzM3Y2rZ4pswE8AMNtReZEESzv581qo7bBHdpA4Q2goda0ymVhLzVW9XWWyeVgT52339o5taFi6Wg6NA8oat9iZLF172zXxpyn0EGrINYylp4QL2qsWORH5DpJLGlncALUGtJ+q70KNSS4T/nvBmrC+Nt8uDpqTDWcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLgrRBDW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLgrRBDW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13FF6C4CEE9;
	Mon, 12 May 2025 07:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747033921;
	bh=eUjqDdKBS2zL1kx29M2yENFNnQfhfsbkf7b/7DRRHQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HLgrRBDWpf3YQPnlMlwcExZgkZPbCRDss6xVr05TKvfH3krlP25j1EUPeVdvh34sx
	 48LqJ6zoFDTaXoMvWCp0QH8qkoqBFVP86uSA/DOHk/lehsT7p+ExsSVJFKRHaR6Fxn
	 RF2dz06n0OdKEmxeeEUtKBc/nxBe8uVQox/F3qgpqP8fK/qo4DmredEyT2fPlQVypT
	 Ea26X5G0U67Dt60RcIATQ34m0CwRpFRoATxQjMDxDTtGPOBdqfzkSCTq/c6hYdGzas
	 SutGoNx5F603zYLF8SmEuHmFt2lSNvnOyjxAJyIJxbOqB/j7CG0Io+WcVCj5tlGRrt
	 v/K3z1s59f3NA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A40C3ABCB;
	Mon, 12 May 2025 07:12:01 +0000 (UTC)
From: Sung-Chi Li via B4 Relay <devnull+lschyi.chromium.org@kernel.org>
Date: Mon, 12 May 2025 15:11:55 +0800
Subject: [PATCH v3 1/3] platform/chrome: update pwm fan control host
 commands
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-cros_ec_fan-v3-1-a9f2b255f0cd@chromium.org>
References: <20250512-cros_ec_fan-v3-0-a9f2b255f0cd@chromium.org>
In-Reply-To: <20250512-cros_ec_fan-v3-0-a9f2b255f0cd@chromium.org>
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Sung-Chi Li <lschyi@google.com>, Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747033920; l=2191;
 i=lschyi@chromium.org; s=20250429; h=from:subject:message-id;
 bh=ZOgwOYZVjUXZ6RTrMDo27YFHFay56ACec6L1AV4NBj0=;
 b=iF2cEAUtBSNcQPsejuC/9n0Qj2WSkXAEkJJ4Dkkp4D+nrEFiD4EEeTt5aYbPvprgQgW9DV7RR
 pi/iu3CgRkKCmRHimEQCbhPAgL3L+mZ4lpY9Z2+r5t5dUYbkHgqe6aw
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
2.49.0.1015.ga840276032-goog


