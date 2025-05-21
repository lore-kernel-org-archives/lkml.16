Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D2A1D7989
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747838591; cv=none; b=O/2k5jp1m910BOnCe4erb4HD3/bWk+LZ46V/tLHAp82R9oo7gauu+khnMmRUKND3TVzkX4eelqe6iT6NdnxzXqCUXqg/QAlnejdXxfPKS3eqZLIi+IbN0zBSICIQk929x3rDGqJsPEubkXo317AEa1J671FwQWKkVpbLkYVqBes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747838591; c=relaxed/simple;
	bh=gUwcBOVwmBGZbnpTFEi7ITrisKjfwLPwG8rK08nVLas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VEs1gQn7UVqJgSUvQasb7Zd9SzNP1c2rPUOWSgT58VPejaB05za2fslQQS11shypR09016nii/EV9cIgHP/q8/MwrAS8r0JvgYX8dkq4pgpDQY62XtlkxwPOh8KICdOvrmgqvBcraRKGHi3Sy/yLJ5gM5dUr8PgLImnR7/FeqsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=nfR0bkhN; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="nfR0bkhN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1747838586;
	bh=gUwcBOVwmBGZbnpTFEi7ITrisKjfwLPwG8rK08nVLas=;
	h=From:Date:Subject:To:Cc:From;
	b=nfR0bkhN3TaQAwjWNn0Y0L1KqbrdI+dzuV8Ceze9Ry7rOe25APRx1grpuoLF67oDD
	 2JUFwPG/zSX70ts6/wc87a92XLHbek4ifUvwrvPKwBTQRVLbv2xcwhCXtUH5aDhANL
	 6OkW1ixts8CVkFuuenAQWsmJGtkvF1D+vNHnWNi0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 21 May 2025 16:42:51 +0200
Subject: [PATCH] mfd: cros_ec: Separate charge-control probing from USB-PD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250521-cros-ec-mfd-chctl-probe-v1-1-6ebfe3a6efa7@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAGrmLWgC/x3MQQqEMAxA0atI1hNoqxbGq8gsaowacKykIkLx7
 haXb/F/hsQqnKCrMiifkiRuBfZTAS1hmxllLAZnXGtaZ5E0JmTC/zQiLXSsuGscGH0TfB3oS9Y
 bKPWuPMn1nvvffT+HnZElaQAAAA==
X-Change-ID: 20250521-cros-ec-mfd-chctl-probe-64a63ac9c160
To: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747838586; l=2260;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=gUwcBOVwmBGZbnpTFEi7ITrisKjfwLPwG8rK08nVLas=;
 b=oF45TE5BS13P0F875i6zxfjLXbgVS3Tk6qOm+yjtDC6PfrXYgz/c/OTDUhvQmcrYLHb/V5Rx2
 BC1ujxXXzkDCBKQhPtYVv5DaPjzMeLYdPnO1SVXCyLOLTZM4VUVQqeL
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The charge-control subsystem in the ChromeOS EC is not strictly tied to
its USB-PD subsystem.
Since commit 7613bc0d116a ("mfd: cros_ec: Don't load charger with UCSI")
the presence of EC_FEATURE_UCSI_PPM would inhibit the probing of the
charge-control driver.
Furthermore recent versions of the EC firmware in Framework laptops
hard-disable EC_FEATURE_USB_PD to avoid probing cros-usbpd-charger,
which then also breaks cros-charge-control.

Instead use the dedicated EC_FEATURE_CHARGER.

Link: https://github.com/FrameworkComputer/EmbeddedController/commit/1d7bcf1d50137c8c01969eb65880bc83e424597e
Fixes: 555b5fcdb844 ("mfd: cros_ec: Register charge control subdevice")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/mfd/cros_ec_dev.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 9f84a52b48d6a8994d23edba999398684303ee64..dc80a272726bb16b58253418999021cd56dfd975 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -87,7 +87,6 @@ static const struct mfd_cell cros_ec_sensorhub_cells[] = {
 };
 
 static const struct mfd_cell cros_usbpd_charger_cells[] = {
-	{ .name = "cros-charge-control", },
 	{ .name = "cros-usbpd-charger", },
 	{ .name = "cros-usbpd-logger", },
 };
@@ -112,6 +111,10 @@ static const struct mfd_cell cros_ec_ucsi_cells[] = {
 	{ .name = "cros_ec_ucsi", },
 };
 
+static const struct mfd_cell cros_ec_charge_control_cells[] = {
+	{ .name = "cros-charge-control", },
+};
+
 static const struct cros_feature_to_cells cros_subdevices[] = {
 	{
 		.id		= EC_FEATURE_CEC,
@@ -148,6 +151,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_keyboard_leds_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_keyboard_leds_cells),
 	},
+	{
+		.id		= EC_FEATURE_CHARGER,
+		.mfd_cells	= cros_ec_charge_control_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_charge_control_cells),
+	},
 };
 
 static const struct mfd_cell cros_ec_platform_cells[] = {

---
base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
change-id: 20250521-cros-ec-mfd-chctl-probe-64a63ac9c160

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

