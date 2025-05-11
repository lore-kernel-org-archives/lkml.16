Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBE425E441;
	Sun, 11 May 2025 20:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746996806; cv=none; b=JWzePHvrVc+JKTZL+1xYMlwwhxncpkfwWwJME4OOrFQ6F2VAxZbou9i4o8W9JoQzj7IhyhnJvw1/4ALPgQwmigxVnZkHUnLP4oBfyCbqIr9Lb9PFZmaj5O+xSZFc6lx4zZ8grQ68eDHGesBvucXqXIAtA4DDUwmReqmIdv4442k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746996806; c=relaxed/simple;
	bh=BpRiUEkykFFxmO6Nb5gIYaR0NfbGv/J3jo+sqA5HoLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCrIbDnUaDoAwwJy+4k5K1+TMpkIhYKg+Nq86DkQMOs222omkr7aTXSd1vre70kIggUA43XAE11zP4QbULsbUiaAlEpEv5B55Hcf8Dgnz6ekjeWdI1I2u7NSQhIaiEDn4JykCPzuao+WlVQAAh+Kc7MpNPQvzNt3XWl/ptZWjAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=r67q5xHp; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="r67q5xHp"
Received: from localhost.localdomain (x5996a826.customers.hiper-net.dk [89.150.168.38])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 81F812E0A48C;
	Sun, 11 May 2025 23:44:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1746996284;
	bh=MHrWlgs+N01hBSgFhNm7P6i9ul6uIvdp2jaUCTHGVik=; h=From:To:Subject;
	b=r67q5xHpVpa9JrQt7aSGQEnrkuTUTZnNFF/ZzxrNyXMK591efwnYo+eILIR3+PuYp
	 euy7QaCmxizoF+sL1WNrkfS6Cjcae+mwTDuuZXj4bAv/TAfqy2FJZnGVebuNjZrPRT
	 QoYCWtEmdYm4+R264udqO7B8exF+h9qVh1GGANFw=
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
Subject: [PATCH v1 03/10] platform/x86: msi-wmi-platform: Add quirk system
Date: Sun, 11 May 2025 22:44:20 +0200
Message-ID: <20250511204427.327558-4-lkml@antheas.dev>
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
 <174699628445.27701.9153414834377873410@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

MSI uses the WMI interface as a passthrough for writes to the EC
and uses a board name match and a quirk table from userspace on
Windows. Therefore, there is no auto-detection functionality and
we have to fallback to a quirk table.

Introduce it here, prior to starting to add features to it.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/msi-wmi-platform.c | 45 +++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index f0d1b8e1a2fec..408d42ab19e20 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -14,6 +14,7 @@
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/device/driver.h>
+#include <linux/dmi.h>
 #include <linux/errno.h>
 #include <linux/hwmon.h>
 #include <linux/kernel.h>
@@ -79,8 +80,12 @@ enum msi_wmi_platform_method {
 	MSI_PLATFORM_GET_WMI		= 0x1d,
 };
 
+struct msi_wmi_platform_quirk {
+};
+
 struct msi_wmi_platform_data {
 	struct wmi_device *wdev;
+	struct msi_wmi_platform_quirk *quirks;
 	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
 };
 
@@ -124,6 +129,39 @@ static const char * const msi_wmi_platform_debugfs_names[] = {
 	"get_wmi"
 };
 
+static struct msi_wmi_platform_quirk quirk_default = {};
+static struct msi_wmi_platform_quirk quirk_gen1 = {
+};
+static struct msi_wmi_platform_quirk quirk_gen2 = {
+};
+
+static const struct dmi_system_id msi_quirks[] = {
+	{
+		.ident = "MSI Claw (gen 1)",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_BOARD_NAME, "MS-1T41"),
+		},
+		.driver_data = &quirk_gen1,
+	},
+	{
+		.ident = "MSI Claw AI+ 7",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_BOARD_NAME, "MS-1T42"),
+		},
+		.driver_data = &quirk_gen2,
+	},
+	{
+		.ident = "MSI Claw AI+ 8",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_BOARD_NAME, "MS-1T52"),
+		},
+		.driver_data = &quirk_gen2,
+	},
+};
+
 static int msi_wmi_platform_parse_buffer(union acpi_object *obj, u8 *output, size_t length)
 {
 	if (obj->type != ACPI_TYPE_BUFFER)
@@ -413,6 +451,7 @@ static int msi_wmi_platform_init(struct msi_wmi_platform_data *data)
 static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *context)
 {
 	struct msi_wmi_platform_data *data;
+	const struct dmi_system_id *dmi_id;
 	int ret;
 
 	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
@@ -422,6 +461,12 @@ static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *context)
 	data->wdev = wdev;
 	dev_set_drvdata(&wdev->dev, data);
 
+	dmi_id = dmi_first_match(msi_quirks);
+	if (dmi_id)
+		data->quirks = dmi_id->driver_data;
+	else
+		data->quirks = &quirk_default;
+
 	ret = devm_mutex_init(&wdev->dev, &data->wmi_lock);
 	if (ret < 0)
 		return ret;
-- 
2.49.0

