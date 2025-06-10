Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BCA25F7A1;
	Tue, 10 Jun 2025 05:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749534947; cv=none; b=QhaLB4/gPcqb9QHVTARYVm5d+XgGX8CIkS2+SlHo9CP93gZMtgbZg8MEOc6syz898WcnVEQS/Kx+qF+8Rmd4X9klGhqvEr7VdB3cV1dg84w4PsrDv9q15oJrh2z4eWkZYedkKQz+vZuDhaPeLXbRKlkZq39RZcqKfPlPV8J7LfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749534947; c=relaxed/simple;
	bh=+0T4z0vO9qztnIaSDV6wvJwobwxP00WKo9U6P6mCqsY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iRcfQObv3JsCZ6lu8OxJZT3hJ4jhI09hkxqj4TrDIu/Kl5sUBu3sZjjK6JcESgzd/Fn2A2YYmoXHTjt8nxvmdRcEBvMoKToRj+HOr4qjlOrhgywJTS/8Nq1C4pPT1A0bDkHqgl1ws9NwUDKOCXEhud+yNClYFRKD22ZDwZIVF7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=lQq3BAJt; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="lQq3BAJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1749534937; x=1750139737; i=w_armin@gmx.de;
	bh=ya1jvm18dSySPEFJ9hfzMKwh8h+hgB4EyhzLjDqHpwo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lQq3BAJtTbX4afhegvFzrPITZFU7XUOKJVuqAwhxVm7RzRCKUGlBS/DmTOWf4NZS
	 S11LRBSJZ3cfHGYUGho1OG+V5MqUVp/L13XtZOK+e4OcVpIif4ftu9C0I+h2McCv0
	 S827sVZu5iibs3qd+yDySFh+YNLbWOiPpn3SP9oY9TruatgbmZsz5EhJCc2RzhYCj
	 o9bQ6ZIkcOx81u8HDtLTAXNdaB46UgEgVsgM3kGwF1QKrBK1TtoTtMrLwa19UJzL3
	 t2ptB2nb92svHC4e9/H0+BGegGVbMFm4MyVlsUrZGgQX8wj+ePlag0RCwbMgAvqwq
	 gGA407LQNFW50Zgr+Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mv2xU-1ugGFc21S4-00xuhz; Tue, 10 Jun 2025 07:55:36 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: Dell.Client.Kernel@dell.com,
	jithu.joseph@intel.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	corbet@lwn.net,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: wmi: Fix WMI device naming issue
Date: Tue, 10 Jun 2025 07:55:26 +0200
Message-Id: <20250610055526.23688-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250610055526.23688-1-W_Armin@gmx.de>
References: <20250610055526.23688-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aqYyXzPJpKpke3K+7J3eeh4ja9j78VzP06y9bL8SV1ag5Cv9rvQ
 uXoyEUcwrq4Hizo1X1P51EdMohwPl3gmofOpNPAsJAg2euYzcpq6OhbVByyUID+FAfxZ+IA
 wY7jYz+EXOaRf/3rg9CneoAy6/k1ppmSXJpV1/rK6us4nI6tl8E0YEledPQJBdvZwfR5ktn
 8lw1d404S/mlcZdPAYXEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aSPhYlOm4kE=;3pDw7KDnyf35stweq/BgNHhMY9G
 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
 w+7WXrd

When multiple WMI devices with the same GUID are present
inside a given system, the WMI driver core might fail to
register all of them.

Consider the following scenario:

	WMI devices (<GUID>[-<ID>]):
	05901221-D566-11D1-B2F0-00A0C9062910	(on PNP0C14:00)
	05901221-D566-11D1-B2F0-00A0C9062910-1	(on PNP0C14:01)

If the WMI core driver somehow unbinds from PNP0C14:00, the following
will happen upon rebinding:

1. The WMI driver core counts all registered WMI devices with a GUID
   of 05901221-D566-11D1-B2F0-00A0C9062910 (count: 1).

2. The new WMI device will be named
   "05901221-D566-11D1-B2F0-00A0C9062910-1" because another device
   with the same GUID is already registered (on PNP0C14:01).

3. The new WMI device cannot be registered due to a name conflict.

Use a IDA when building the WMI device name to avoid such name
collisions by ensuring that a given WMI device ID is not reused.

Userspace applications using udev for WMI device detection are not
impacted by this change. Additionally userspace applications that do
fully support the existing naming scheme are also not impacted. Only
userspace applications using hardcoded sysfs paths will break.
Introduce a kconfig option for restoring the old naming scheme to
give developers time to fix any compatibility issues.

Tested on a Asus Prime B650-Plus.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/Kconfig |  9 +++++++++
 drivers/platform/x86/wmi.c   | 37 +++++++++++++++++++++++++++++++-----
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index e5cbd58a99f3..ddc9bf501428 100644
=2D-- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -37,6 +37,15 @@ config ACPI_WMI
 	  It is safe to enable this driver even if your DSDT doesn't define
 	  any ACPI-WMI devices.
=20
+config ACPI_WMI_LEGACY_DEVICE_NAMES
+	bool "Use legacy WMI device naming scheme"
+	depends on ACPI_WMI
+	help
+	  Say Y here to force the WMI driver core to use the old WMI device nami=
ng
+	  scheme when creating WMI devices. Doing so might be necessary for some
+	  userspace applications but will cause the registration of WMI devices =
with
+	  the same GUID to fail in some corner cases.
+
 config WMI_BMOF
 	tristate "WMI embedded Binary MOF driver"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index e46453750d5f..21b7e54bd7ab 100644
=2D-- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -20,6 +20,7 @@
 #include <linux/bits.h>
 #include <linux/build_bug.h>
 #include <linux/device.h>
+#include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -74,6 +75,8 @@ struct wmi_guid_count_context {
 	int count;
 };
=20
+static DEFINE_IDA(wmi_ida);
+
 /*
  * If the GUID data block is marked as expensive, we must enable and
  * explicitily disable data collection.
@@ -978,6 +981,19 @@ static int guid_count(const guid_t *guid)
 	return context.count;
 }
=20
+static int wmi_dev_set_name(struct wmi_block *wblock, int count)
+{
+	if (IS_ENABLED(CONFIG_ACPI_WMI_LEGACY_DEVICE_NAMES)) {
+		if (count)
+			return dev_set_name(&wblock->dev.dev, "%pUL-%d", &wblock->gblock.guid,
+					    count);
+		else
+			return dev_set_name(&wblock->dev.dev, "%pUL", &wblock->gblock.guid);
+	}
+
+	return dev_set_name(&wblock->dev.dev, "%pUL-%d", &wblock->gblock.guid, w=
block->dev.dev.id);
+}
+
 static int wmi_create_device(struct device *wmi_bus_dev,
 			     struct wmi_block *wblock,
 			     struct acpi_device *device)
@@ -986,7 +1002,7 @@ static int wmi_create_device(struct device *wmi_bus_d=
ev,
 	struct acpi_device_info *info;
 	acpi_handle method_handle;
 	acpi_status status;
-	int count;
+	int count, ret;
=20
 	if (wblock->gblock.flags & ACPI_WMI_EVENT) {
 		wblock->dev.dev.type =3D &wmi_type_event;
@@ -1057,11 +1073,18 @@ static int wmi_create_device(struct device *wmi_bu=
s_dev,
 	if (count < 0)
 		return count;
=20
-	if (count) {
-		dev_set_name(&wblock->dev.dev, "%pUL-%d", &wblock->gblock.guid, count);
+	if (count)
 		set_bit(WMI_GUID_DUPLICATED, &wblock->flags);
-	} else {
-		dev_set_name(&wblock->dev.dev, "%pUL", &wblock->gblock.guid);
+
+	ret =3D ida_alloc(&wmi_ida, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	wblock->dev.dev.id =3D ret;
+	ret =3D wmi_dev_set_name(wblock, count);
+	if (ret < 0) {
+		ida_free(&wmi_ida, wblock->dev.dev.id);
+		return ret;
 	}
=20
 	device_initialize(&wblock->dev.dev);
@@ -1147,6 +1170,7 @@ static int parse_wdg(struct device *wmi_bus_dev, str=
uct platform_device *pdev)
 			dev_err(wmi_bus_dev, "failed to register %pUL\n",
 				&wblock->gblock.guid);
=20
+			ida_free(&wmi_ida, wblock->dev.dev.id);
 			put_device(&wblock->dev.dev);
 		}
 	}
@@ -1246,7 +1270,10 @@ static void acpi_wmi_notify_handler(acpi_handle han=
dle, u32 event, void *context
=20
 static int wmi_remove_device(struct device *dev, void *data)
 {
+	int id =3D dev->id;
+
 	device_unregister(dev);
+	ida_free(&wmi_ida, id);
=20
 	return 0;
 }
=2D-=20
2.39.5

