Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FDA28FFE2;
	Thu, 10 Apr 2025 21:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744320552; cv=none; b=VyzCoA2omTFpjwCr+hTtOI/SdtPUh9hC+XQ2sZhOhD+ku0Ibt3wJL4aO3+QtQsMJtpFpl1ExJNpAxUKaK0gOse0pifksu0Nwml8cWJ7B/FpG3GUKAGeRylSdAccW/SjXWx+YvR5+HfQCvCCsUN89YInQASrEc/S3op4oHQtwZZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744320552; c=relaxed/simple;
	bh=QLxN7ctifJkDnCgQYaZeJXufEu1hGD/bjEkL8FGsVJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G27Ozt0ST0tlJHubhJhT8w6j66Jg3cuun/NpuqUWAGtcJX6olCo8nZ4jBSzHAER/ChKyQ4061MFdn0UHdcEDn3hcFi1+pDNzQEIuhnjUPv4HbVqga2i/e2qVdcequwd6H1bRPgXJ0y1+yiCOXa8BW8mZf09NP/KQgmy0DOjr614=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=nvKraJfN; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="nvKraJfN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1744320539; x=1744925339; i=w_armin@gmx.de;
	bh=FJWCKOtWx7OTTBP5s2xBxAOQliOoYe7knIn3ejxzxps=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nvKraJfNSL042yJVZjicEb+CIIEMB6DCwulm/f9SaFijUZ226vvUFpygOPYOaQXe
	 jI1+R9XamIbhQpu8pf2SqALTu/zxURlWmlFX0k5ds7u3aWfPcCTx4rXlenG9tt5r3
	 q5EvFn3rkHYNNTKACSVjg8pAs+Z2oMuvPRu2CFfxK+UlPg3qW/yS7NNdAoeI1ZVE6
	 hqhAKEYLDwiRe+UpAZT8sF1yhQKWCsa1kzhQi3thXoXZ54tFbdmgNNx3z247iehoI
	 yZ9kmaw1bNEyx2gnuffC0xo3c2i6gwvrO8VM9SmlO846NRoeBbKklhY3cO3uEt8gp
	 97WJkcB1hgHKwroG/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MsYv3-1tB1Jw0zr1-00zpOb; Thu, 10 Apr 2025 23:28:59 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lkml@antheas.dev
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: msi-wmi-platform: Workaround a ACPI firmware bug
Date: Thu, 10 Apr 2025 23:28:53 +0200
Message-Id: <20250410212853.334891-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mHNcsEMGGLvy1gkHzqyGE6S4suWUgL4Y1Vxn3a+wz3P9c+qKSnm
 M8da/9N1IAnAzbrWlaDTDsiLq3LBDQDhbdObWaJ1/8IaK0Zy+SYxKUc7bUpuAC4D6Ww90K9
 KJ+rNaYhODbfoI4Tk9bNcZBDvBUlJhYIS80YM5cF5uCmRaVINnJ5wwhqOBb6xPDF4IqJbo+
 oBmL7lM6ZKL+6EHhUs5Bw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kHawWCkYUjo=;FkZHdfJAg6ebZOkA6FeVv3Uz4sw
 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

The ACPI byte code inside the ACPI control method responsible for
handling the WMI method calls uses a global buffer for constructing
the return value, yet the ACPI control method itself is not marked
as "Serialized".
This means that calling WMI methods on this WMI device is not
thread-safe, as concurrent WMI method calls will corrupt the global
buffer.

Fix this by serializing the WMI method calls using a mutex.

Fixes: 9c0beb6b29e7 ("platform/x86: wmi: Add MSI WMI Platform driver")
Tested-by: Antheas Kapenekakis <lkml@antheas.dev>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../wmi/devices/msi-wmi-platform.rst          |  4 +
 drivers/platform/x86/msi-wmi-platform.c       | 99 ++++++++++++-------
 2 files changed, 67 insertions(+), 36 deletions(-)

diff --git a/Documentation/wmi/devices/msi-wmi-platform.rst b/Documentatio=
n/wmi/devices/msi-wmi-platform.rst
index 31a136942892..73197b31926a 100644
=2D-- a/Documentation/wmi/devices/msi-wmi-platform.rst
+++ b/Documentation/wmi/devices/msi-wmi-platform.rst
@@ -138,6 +138,10 @@ input data, the meaning of which depends on the subfe=
ature being accessed.
 The output buffer contains a single byte which signals success or failure=
 (``0x00`` on failure)
 and 31 bytes of output data, the meaning if which depends on the subfeatu=
re being accessed.

+.. note::
+   The ACPI control method responsible for handling the WMI method calls =
is not thread-safe.
+   This is a firmware bug that needs to be handled inside the driver itse=
lf.
+
 WMI method Get_EC()
 -------------------

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x8=
6/msi-wmi-platform.c
index 9b5c7f8c79b0..dc5e9878cb68 100644
=2D-- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -10,6 +10,7 @@
 #include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/device/driver.h>
@@ -17,6 +18,7 @@
 #include <linux/hwmon.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/printk.h>
 #include <linux/rwsem.h>
 #include <linux/types.h>
@@ -76,8 +78,13 @@ enum msi_wmi_platform_method {
 	MSI_PLATFORM_GET_WMI		=3D 0x1d,
 };

-struct msi_wmi_platform_debugfs_data {
+struct msi_wmi_platform_data {
 	struct wmi_device *wdev;
+	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
+};
+
+struct msi_wmi_platform_debugfs_data {
+	struct msi_wmi_platform_data *data;
 	enum msi_wmi_platform_method method;
 	struct rw_semaphore buffer_lock;	/* Protects debugfs buffer */
 	size_t length;
@@ -132,8 +139,9 @@ static int msi_wmi_platform_parse_buffer(union acpi_ob=
ject *obj, u8 *output, siz
 	return 0;
 }

-static int msi_wmi_platform_query(struct wmi_device *wdev, enum msi_wmi_p=
latform_method method,
-				  u8 *input, size_t input_length, u8 *output, size_t output_length)
+static int msi_wmi_platform_query(struct msi_wmi_platform_data *data,
+				  enum msi_wmi_platform_method method, u8 *input,
+				  size_t input_length, u8 *output, size_t output_length)
 {
 	struct acpi_buffer out =3D { ACPI_ALLOCATE_BUFFER, NULL };
 	struct acpi_buffer in =3D {
@@ -147,9 +155,15 @@ static int msi_wmi_platform_query(struct wmi_device *=
wdev, enum msi_wmi_platform
 	if (!input_length || !output_length)
 		return -EINVAL;

-	status =3D wmidev_evaluate_method(wdev, 0x0, method, &in, &out);
-	if (ACPI_FAILURE(status))
-		return -EIO;
+	/*
+	 * The ACPI control method responsible for handling the WMI method calls
+	 * is not thread-safe. Because of this we have to do the locking ourself=
.
+	 */
+	scoped_guard(mutex, &data->wmi_lock) {
+		status =3D wmidev_evaluate_method(data->wdev, 0x0, method, &in, &out);
+		if (ACPI_FAILURE(status))
+			return -EIO;
+	}

 	obj =3D out.pointer;
 	if (!obj)
@@ -170,22 +184,22 @@ static umode_t msi_wmi_platform_is_visible(const voi=
d *drvdata, enum hwmon_senso
 static int msi_wmi_platform_read(struct device *dev, enum hwmon_sensor_ty=
pes type, u32 attr,
 				 int channel, long *val)
 {
-	struct wmi_device *wdev =3D dev_get_drvdata(dev);
+	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
 	u8 input[32] =3D { 0 };
 	u8 output[32];
-	u16 data;
+	u16 value;
 	int ret;

-	ret =3D msi_wmi_platform_query(wdev, MSI_PLATFORM_GET_FAN, input, sizeof=
(input), output,
+	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, input, sizeof=
(input), output,
 				     sizeof(output));
 	if (ret < 0)
 		return ret;

-	data =3D get_unaligned_be16(&output[channel * 2 + 1]);
-	if (!data)
+	value =3D get_unaligned_be16(&output[channel * 2 + 1]);
+	if (!value)
 		*val =3D 0;
 	else
-		*val =3D 480000 / data;
+		*val =3D 480000 / value;

 	return 0;
 }
@@ -231,7 +245,7 @@ static ssize_t msi_wmi_platform_write(struct file *fp,=
 const char __user *input,
 		return ret;

 	down_write(&data->buffer_lock);
-	ret =3D msi_wmi_platform_query(data->wdev, data->method, payload, data->=
length, data->buffer,
+	ret =3D msi_wmi_platform_query(data->data, data->method, payload, data->=
length, data->buffer,
 				     data->length);
 	up_write(&data->buffer_lock);

@@ -277,17 +291,17 @@ static void msi_wmi_platform_debugfs_remove(void *da=
ta)
 	debugfs_remove_recursive(dir);
 }

-static void msi_wmi_platform_debugfs_add(struct wmi_device *wdev, struct =
dentry *dir,
+static void msi_wmi_platform_debugfs_add(struct msi_wmi_platform_data *dr=
vdata, struct dentry *dir,
 					 const char *name, enum msi_wmi_platform_method method)
 {
 	struct msi_wmi_platform_debugfs_data *data;
 	struct dentry *entry;

-	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
+	data =3D devm_kzalloc(&drvdata->wdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return;

-	data->wdev =3D wdev;
+	data->data =3D drvdata;
 	data->method =3D method;
 	init_rwsem(&data->buffer_lock);

@@ -298,82 +312,82 @@ static void msi_wmi_platform_debugfs_add(struct wmi_=
device *wdev, struct dentry

 	entry =3D debugfs_create_file(name, 0600, dir, data, &msi_wmi_platform_d=
ebugfs_fops);
 	if (IS_ERR(entry))
-		devm_kfree(&wdev->dev, data);
+		devm_kfree(&drvdata->wdev->dev, data);
 }

-static void msi_wmi_platform_debugfs_init(struct wmi_device *wdev)
+static void msi_wmi_platform_debugfs_init(struct msi_wmi_platform_data *d=
ata)
 {
 	struct dentry *dir;
 	char dir_name[64];
 	int ret, method;

-	scnprintf(dir_name, ARRAY_SIZE(dir_name), "%s-%s", DRIVER_NAME, dev_name=
(&wdev->dev));
+	scnprintf(dir_name, ARRAY_SIZE(dir_name), "%s-%s", DRIVER_NAME, dev_name=
(&data->wdev->dev));

 	dir =3D debugfs_create_dir(dir_name, NULL);
 	if (IS_ERR(dir))
 		return;

-	ret =3D devm_add_action_or_reset(&wdev->dev, msi_wmi_platform_debugfs_re=
move, dir);
+	ret =3D devm_add_action_or_reset(&data->wdev->dev, msi_wmi_platform_debu=
gfs_remove, dir);
 	if (ret < 0)
 		return;

 	for (method =3D MSI_PLATFORM_GET_PACKAGE; method <=3D MSI_PLATFORM_GET_W=
MI; method++)
-		msi_wmi_platform_debugfs_add(wdev, dir, msi_wmi_platform_debugfs_names[=
method - 1],
+		msi_wmi_platform_debugfs_add(data, dir, msi_wmi_platform_debugfs_names[=
method - 1],
 					     method);
 }

-static int msi_wmi_platform_hwmon_init(struct wmi_device *wdev)
+static int msi_wmi_platform_hwmon_init(struct msi_wmi_platform_data *data=
)
 {
 	struct device *hdev;

-	hdev =3D devm_hwmon_device_register_with_info(&wdev->dev, "msi_wmi_platf=
orm", wdev,
+	hdev =3D devm_hwmon_device_register_with_info(&data->wdev->dev, "msi_wmi=
_platform", data,
 						    &msi_wmi_platform_chip_info, NULL);

 	return PTR_ERR_OR_ZERO(hdev);
 }

-static int msi_wmi_platform_ec_init(struct wmi_device *wdev)
+static int msi_wmi_platform_ec_init(struct msi_wmi_platform_data *data)
 {
 	u8 input[32] =3D { 0 };
 	u8 output[32];
 	u8 flags;
 	int ret;

-	ret =3D msi_wmi_platform_query(wdev, MSI_PLATFORM_GET_EC, input, sizeof(=
input), output,
+	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_EC, input, sizeof(=
input), output,
 				     sizeof(output));
 	if (ret < 0)
 		return ret;

 	flags =3D output[MSI_PLATFORM_EC_FLAGS_OFFSET];

-	dev_dbg(&wdev->dev, "EC RAM version %lu.%lu\n",
+	dev_dbg(&data->wdev->dev, "EC RAM version %lu.%lu\n",
 		FIELD_GET(MSI_PLATFORM_EC_MAJOR_MASK, flags),
 		FIELD_GET(MSI_PLATFORM_EC_MINOR_MASK, flags));
-	dev_dbg(&wdev->dev, "EC firmware version %.28s\n",
+	dev_dbg(&data->wdev->dev, "EC firmware version %.28s\n",
 		&output[MSI_PLATFORM_EC_VERSION_OFFSET]);

 	if (!(flags & MSI_PLATFORM_EC_IS_TIGERLAKE)) {
 		if (!force)
 			return -ENODEV;

-		dev_warn(&wdev->dev, "Loading on a non-Tigerlake platform\n");
+		dev_warn(&data->wdev->dev, "Loading on a non-Tigerlake platform\n");
 	}

 	return 0;
 }

-static int msi_wmi_platform_init(struct wmi_device *wdev)
+static int msi_wmi_platform_init(struct msi_wmi_platform_data *data)
 {
 	u8 input[32] =3D { 0 };
 	u8 output[32];
 	int ret;

-	ret =3D msi_wmi_platform_query(wdev, MSI_PLATFORM_GET_WMI, input, sizeof=
(input), output,
+	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_WMI, input, sizeof=
(input), output,
 				     sizeof(output));
 	if (ret < 0)
 		return ret;

-	dev_dbg(&wdev->dev, "WMI interface version %u.%u\n",
+	dev_dbg(&data->wdev->dev, "WMI interface version %u.%u\n",
 		output[MSI_PLATFORM_WMI_MAJOR_OFFSET],
 		output[MSI_PLATFORM_WMI_MINOR_OFFSET]);

@@ -381,7 +395,8 @@ static int msi_wmi_platform_init(struct wmi_device *wd=
ev)
 		if (!force)
 			return -ENODEV;

-		dev_warn(&wdev->dev, "Loading despite unsupported WMI interface version=
 (%u.%u)\n",
+		dev_warn(&data->wdev->dev,
+			 "Loading despite unsupported WMI interface version (%u.%u)\n",
 			 output[MSI_PLATFORM_WMI_MAJOR_OFFSET],
 			 output[MSI_PLATFORM_WMI_MINOR_OFFSET]);
 	}
@@ -391,19 +406,31 @@ static int msi_wmi_platform_init(struct wmi_device *=
wdev)

 static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *co=
ntext)
 {
+	struct msi_wmi_platform_data *data;
 	int ret;

-	ret =3D msi_wmi_platform_init(wdev);
+	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->wdev =3D wdev;
+	dev_set_drvdata(&wdev->dev, data);
+
+	ret =3D devm_mutex_init(&wdev->dev, &data->wmi_lock);
+	if (ret < 0)
+		return ret;
+
+	ret =3D msi_wmi_platform_init(data);
 	if (ret < 0)
 		return ret;

-	ret =3D msi_wmi_platform_ec_init(wdev);
+	ret =3D msi_wmi_platform_ec_init(data);
 	if (ret < 0)
 		return ret;

-	msi_wmi_platform_debugfs_init(wdev);
+	msi_wmi_platform_debugfs_init(data);

-	return msi_wmi_platform_hwmon_init(wdev);
+	return msi_wmi_platform_hwmon_init(data);
 }

 static const struct wmi_device_id msi_wmi_platform_id_table[] =3D {
=2D-
2.39.5

