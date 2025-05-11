Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213E4262FF6;
	Sun, 11 May 2025 20:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746996301; cv=none; b=SaUs6XMCS8rPovScO4QlD3UMoVv9qfIJdH9rB+GoCgSwCuNdKD6Q8CXRvmZHTLOzSSstWzG23LiyEG1DcRLlySV+vWqC46ixVoEd5nAWqFxqB5nSdpp59yqUg8ju9VQyhvOq2UawsHy23aTK4oAlCfE6dr26YWnBPktwCIpRqGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746996301; c=relaxed/simple;
	bh=7W2ynPb+GWUHYkq+13QBa7AhkJJC8fkL2TK8e3N3oH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RIHs7J36HeENFiPWZnCcS6gDdfImHIfCJ/JQgX39tufgiLyies/wvFNSpUOT89hbxoYi/A6XBZ74uYR7vaNHElC6c2lKLdlnkASpI7fUvHjk7RssgRkJlh8aVJEuuqm28i43qu5worJE67WxYwmryO1GzbQezVEnMWEFUfL8cGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Vc4Bci/5; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Vc4Bci/5"
Received: from localhost.localdomain (x5996a826.customers.hiper-net.dk [89.150.168.38])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id BF2F22E0A4FD;
	Sun, 11 May 2025 23:44:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1746996297;
	bh=SiKkfgsqPmiEofXzj87y/JV1KOZHBaOsXJ78Qapas3g=; h=From:To:Subject;
	b=Vc4Bci/5ibaVRZS1k5OnPN1ritLDzjfuRmTu+81EW3R4U/I/QMu1kBes3rOmt2mc3
	 L9Wp4Cf7PMrfTztqMLAwuO8QjEjsxhpYDgitWxBvK7iOcnnaLgAm7BBPjRjfVbFoNz
	 1Mw545tvDCchgt8eGSxYftDYzda5o8a/xoo+7Pgs=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 89.150.168.38) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Kurt Borja <kuurtb@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v1 08/10] platform/x86: msi-wmi-platform: Drop excess fans in
 dual fan devices
Date: Sun, 11 May 2025 22:44:25 +0200
Message-ID: <20250511204427.327558-9-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511204427.327558-1-lkml@antheas.dev>
References: <20250511204427.327558-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174699629656.28048.2062799627441253450@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Currently, the platform driver always exposes 4 fans, since the
underlying WMI interface reads 4 values from the EC. However, most
devices only have two fans. Therefore, at least in the case of the
Claw series, quirk the driver to only show two hwmon fans.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/msi-wmi-platform.c | 28 ++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index 46928fb4da8a6..eaf0eb25e349b 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -121,6 +121,7 @@ enum msi_wmi_platform_method {
 struct msi_wmi_platform_quirk {
 	bool shift_mode;	/* Shift mode is supported */
 	bool charge_threshold;	/* Charge threshold is supported */
+	bool dual_fans;		/* For devices with two hwmon fans */
 	int pl_min;		/* Minimum PLx value */
 	int pl1_max;		/* Maximum PL1 value */
 	int pl2_max;		/* Maximum PL2 value */
@@ -216,6 +217,7 @@ static struct msi_wmi_platform_quirk quirk_default = {};
 static struct msi_wmi_platform_quirk quirk_gen1 = {
 	.shift_mode = true,
 	.charge_threshold = true,
+	.dual_fans = true,
 	.pl_min = 8,
 	.pl1_max = 43,
 	.pl2_max = 45
@@ -223,6 +225,7 @@ static struct msi_wmi_platform_quirk quirk_gen1 = {
 static struct msi_wmi_platform_quirk quirk_gen2 = {
 	.shift_mode = true,
 	.charge_threshold = true,
+	.dual_fans = true,
 	.pl_min = 8,
 	.pl1_max = 30,
 	.pl2_max = 37
@@ -635,6 +638,23 @@ static const struct hwmon_chip_info msi_wmi_platform_chip_info = {
 	.info = msi_wmi_platform_info,
 };
 
+static const struct hwmon_channel_info * const msi_wmi_platform_info_dual[] = {
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT
+			   ),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_ENABLE,
+			   HWMON_PWM_ENABLE
+			   ),
+	NULL
+};
+
+static const struct hwmon_chip_info msi_wmi_platform_chip_info_dual = {
+	.ops = &msi_wmi_platform_ops,
+	.info = msi_wmi_platform_info_dual,
+};
+
 static int msi_wmi_platform_profile_probe(void *drvdata, unsigned long *choices)
 {
 	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
@@ -1227,9 +1247,11 @@ static int msi_wmi_platform_hwmon_init(struct msi_wmi_platform_data *data)
 {
 	struct device *hdev;
 
-	hdev = devm_hwmon_device_register_with_info(&data->wdev->dev, "msi_wmi_platform", data,
-						    &msi_wmi_platform_chip_info,
-						    msi_wmi_platform_hwmon_groups);
+	hdev = devm_hwmon_device_register_with_info(
+		&data->wdev->dev, "msi_wmi_platform", data,
+		data->quirks->dual_fans ? &msi_wmi_platform_chip_info_dual :
+					&msi_wmi_platform_chip_info,
+		msi_wmi_platform_hwmon_groups);
 
 	return PTR_ERR_OR_ZERO(hdev);
 }
-- 
2.49.0

