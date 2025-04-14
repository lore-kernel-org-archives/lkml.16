Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E870F2957A1;
	Mon, 14 Apr 2025 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639100; cv=none; b=G5BWKzc8L5VmLkXEmlqwGVRh62MKRhXtL4JjMZtz4eXcXrNcvhR09rhjMKOstO37WMS0c1j41fYhVrykuTSP++tV0HtIuaPv3i6W59bUq9p1/c7rfwUlOIZMZAvLFzSieP1EKmmvyCv4+9DswsffsiOpYt5C2xOEJHfIdvDvvik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639100; c=relaxed/simple;
	bh=d/7DVfX/MMhP9cx7igxz0Z9JfAH3blgdoVXTbJ2cJ6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UD6UUjBTrK0qw2OijpVK14AXTpH8Ovesyl4tmcrfRPtGHSlTyrZLkWQ0u858qm0KNeuYqJnXOBx9/RW4UCT3BduLemzXfvrysEPSApe/btvFvtaALIJapDIGBNiZahJfgU/TJF9LqMEUhSw4qPPCKXHloZVTuqrDYkMW3kut5/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=LzTJDwqN; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="LzTJDwqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1744639090; x=1745243890; i=w_armin@gmx.de;
	bh=sFO8lXXKZyi2PMPz1mu2Pazgg7iVLSJumakleqIEFUI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LzTJDwqNPVeEpMRzLpL7ls60IwKj1U5So5yCT39S9TcpdLGe7fUVy3MkwTMUDgDG
	 HhO5fn0vKQv8WiAORxNy8R+TERMiJQvOhpdKBfUobA9joD66wGdvZxfdbFZV7WSXr
	 idaeMoEC006icAjxPCZRTTH8mn6/zm0GhNKoWd52M9HDlOk5HhsNYK9fSNk4DMo66
	 daQ5Uh6sxZ6HDM7EAD7sO7f8cpSEgnEYAjl+l8Mb7Epmn5Xqzjk32e284JJABKYCV
	 ij95DxdaL6mrq1qCZqwACehGI1NHikUWwq4edO87OdkCj2tHLlsky7WxXwy+nZFFw
	 Izi0v0Aw+bv1wF4h/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MiJZE-1tQIXX2iOc-00pB55; Mon, 14 Apr 2025 15:58:10 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lkml@antheas.dev
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] platform/x86: msi-wmi-platform: Workaround a ACPI firmware bug
Date: Mon, 14 Apr 2025 15:57:59 +0200
Message-Id: <20250414135759.6920-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414135759.6920-1-W_Armin@gmx.de>
References: <20250414135759.6920-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8tlIa64fiSiI8ftfeg2qQg4VINAH/WvEYzDZHdImxu3uueEC1uY
 fuBfbqSme2/AkFRByJpPXcY0ZLf+lqaOWEd1CHDqQkGYFJ62u6nHtqt0SU2j82hcuS+f82K
 5TEBSFKj7aPlFFxjr/WRhIwxMSnohD0UA/C9P9nFG2uL6ILvO1U/Iw+6YPKv4LMehaHTjgg
 Gj6/KaJnj+Sl+iG8sR08g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yMd9wlZ+kqY=;HVyHx5Usq1/L+r8mWLroOw6UIPK
 UYD5rXg4qmJOgpj4ZWL82vhS+218ubcVIiTqF7ktfATdXytBRQ8KewbrOraQaBH9R26cpiCA9
 URluW0pnkO0ByaIh3kSciInpmj4KO8lsVx4aKr8x9ZqJQBa7KLRdfImE60TgJ3aojOcdHc+gH
 08ZgCIyvG01Ic3w+rZbuTekp7Ly4FwCJ1fkC681KRYkEq9XUGHRZ8kC4mstxliMxu3Fr9QJfg
 06gGlPJVhBT8kghiriUHO80zmqzRObuUFmzlSujlGzXpQMnOYqQlSfSx8bBsrJsHb1R+jr7t+
 wZw7jYlrmrKMORml0H8q3kOKdnyRcY8V1oZ83oe0e/cgWKqCngb0cqna5vLz65Lz8GXMfqOg5
 PPM4ntqu7s8WZff1ajc61TmSoL2e8TaDLQj3uGK8GNSc4MiKe4eb7PHuxIje3EizESbKaZQ00
 7odG1UHwQvwPGhVhWsdXn5Ou+3VXisHWW/OJZksgv2mn0qNNjR8XTNjJKHpn4tG8/Veh0VjE8
 xRdF6kwBivts+vbP5DzoOWcRLxDio4JwgWBEk0H5SnfvC2xqwpFExMrddqPtELYC/DyenLhba
 pZO+BN9IbrmEKEKhi3l2oLkPbrnn5bgaJqm7EnAW5HNU9inSb6n4x9Yl4Cfgj5fKZkJjQL0lo
 0WiqPpeE2BGNcIHBTJJ3oAGakWL3WXgdIOzkYrJ2bz60BDwpwKqu7DupyUb8Xik6oClUG4leE
 QhnYIOzwvxnOVL//RhIiZTMgMw3Mg0i0X/SjRX3C7ZKOo/xp08BxhaO01pUx6PdD+t0gEygOd
 m0YXxNzrOWuggmVGDENxMhIBDnJKvKnuEJLkgShQGSw80XyPWq/YnshOwHqqdnANDgLXvnWE0
 qVW+AFuij+iH5zh7+OpZQQu2fCkZ29+UD0eE3LmJK/h8xZ6uXK6n6KOCWYB1dyb1Ny0MvJh80
 pAUxVEowFJDBH5UFBYKE9D5XaNaoGMKwrtuqZjBQqVjeP+16Axd06fkQ3xujnY8JSmDRnTUod
 zBHBXAJ4WIeeiibK1/sp7TPLbnyd6jxgExgTR7jycq/+h4wXmV0uUT/DRTr3rI/vevLubomzz
 lPAt86aeqQE5vycfY6jgguUpI7gskp7MYgK+7D7+89gM17I/JCRWuIOFo/AKdUFb2+x27JHXe
 2JBIwIf6yrPc3Fc8SsHNzgYeLQMVDrxyU2GbNSNO92jGPoIp1hT1xmGJQE1Zu6IeSyFXIdAA3
 fRojIxQrJqcmG8URXkxVcMOVoRBOxRuQjdHHWH88eOjliSijEcavYEjVc9+dFdWmWunG5KWLR
 6jcHY8XjG6uwhDBHKVL4wHCAzPTehWjvw7nfopkvyce9K9utLoFcLYpmaHuftBdmha1AqGyIV
 qxOTuwPIhkizJ21nzZs4+1rYVVRPIfNh8jAcpbebm3103/F17pFEuZqSBGj/zA0CFLwP8HeLb
 G8pzEM7txzLmnlCHgU2k0ZjbjWGA=

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
Changes since v1:
 - move variable renaming into a separate patch
=2D--
 .../wmi/devices/msi-wmi-platform.rst          |  4 +
 drivers/platform/x86/msi-wmi-platform.c       | 91 ++++++++++++-------
 2 files changed, 63 insertions(+), 32 deletions(-)

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
index e15681dfca8d..dc5e9878cb68 100644
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
@@ -170,13 +184,13 @@ static umode_t msi_wmi_platform_is_visible(const voi=
d *drvdata, enum hwmon_senso
 static int msi_wmi_platform_read(struct device *dev, enum hwmon_sensor_ty=
pes type, u32 attr,
 				 int channel, long *val)
 {
-	struct wmi_device *wdev =3D dev_get_drvdata(dev);
+	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
 	u8 input[32] =3D { 0 };
 	u8 output[32];
 	u16 value;
 	int ret;

-	ret =3D msi_wmi_platform_query(wdev, MSI_PLATFORM_GET_FAN, input, sizeof=
(input), output,
+	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, input, sizeof=
(input), output,
 				     sizeof(output));
 	if (ret < 0)
 		return ret;
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

