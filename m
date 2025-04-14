Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737F32820D4;
	Mon, 14 Apr 2025 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639505; cv=none; b=k25R2H663RJPtN/Go/+wPZXmF8G/HMNZzkffrddi0ww5E8Z9Ioz1UU9diru6pr18iMpzRCqGLZSITF/NN0iAfLNrbBLDpDko6TKMKTCWzdHD9Y+FDFQeg2f6+pbkXHGGL1jpi13hCTCLcV1LERjj3I3WGXh4sbBmOrq3qgt+eVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639505; c=relaxed/simple;
	bh=/4ocoLvf4S8bhG2FxJMmMl4doxS3PVW64uGPLox8axQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jROJrO7Gt7m5DbRZHs1jw91Gl9pMlzmqrFjhXVLVa9tD6hMZtto4unAJditbLouO0QvghfZGIqKquMo1V5qIkeLvxFdFe8LUwAmInIJR/I5M9wHMdwo93sXsV4naNqEinOaiR0EjG1wUm711fe2IQCsprOhoszEq+6pPVHAsv/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=scX/tRZA; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="scX/tRZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1744639500; x=1745244300; i=w_armin@gmx.de;
	bh=MvP0U8fmpFwBQqte82N05PcRTzTzpZHT4tUaFTJQPj8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=scX/tRZAPhfBP/fWF6HjfDOgPtUUdwogN8yWJppU3lEaAxEuV8OaU01lXIgbUBDF
	 ntqPaiJLgdoTWMUJRt/DN/hLLXsr2esOcwa17s+gUqhHld1APv6z35B4evXWcJFnG
	 3KiWF10vJohp3o4SZznFheceyg5Fz+WJMfJW3mF7Qct9yLC1Ey/4jcbK3q9KVvD2B
	 hX634paBxwb3qF/f0ShoNpE6yu6++DHs//kLbcKdM0CByTTIG2Y4fHZ70AJuOyx02
	 IhAxLQLLC+qpEmj2MDjzxj+jkjFs0atsAcXqlfCDMRQVs04ZSwqw+K6mFnPjvoi5z
	 9AQ4PwZJJkW5jaAUEg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MAfUo-1ttN921KG0-004a8c; Mon, 14 Apr 2025 16:05:00 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lkml@antheas.dev
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] platform/x86: msi-wmi-platform: Workaround a ACPI firmware bug
Date: Mon, 14 Apr 2025 16:04:53 +0200
Message-Id: <20250414140453.7691-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414140453.7691-1-W_Armin@gmx.de>
References: <20250414140453.7691-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XXKSQDY1Fs8CNtEEcKvY0XcGO/PIKjZONhMvXIanGrxob8zMabk
 JT3JrK2QMd2TxQENteweYmKoiP2R+7KT38Vlyyh1WQTlJeTlz/jQEW04a1XdJ9TmNS4FOq2
 w9m1PNPyz3y5QirAoLkosWvjqNC8ijQT3Qgdbv+SSZyX2OwYJtqAlUOJsVdcc1OUeryG8Im
 0RMrC0dIOW6uQX38Wm2Fw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iInYpDG3F0s=;+H7/605fpbIUxqqSlUhA+/nlmOA
 ZhF9OJN4VzsWuy6zRdLLdxMYm+c4/9feoSZfMAsDP424UcQfG+alhh/bNiyerGXlXcbEnBUX9
 jlgjRwPqlfJ96KJHdRCQ29RTXZsIU9xhVPTS9I6hHSywpF92YVdxCgSyHGFq8ceJGiVM372f4
 LbJyP6nbrWnhRYbCkyh22HRnB2hqr8l/F+kpjDNfBWkWS6zLSqW4e/6DR8C95x9jmw1zM9fjf
 aFeXo1Ud3a5YQ+kcqlsFeV1g3eY5eQZsrcMn1xlYOD3ymNMBYagQi1iEKV0+hbvZYDlSs/QIW
 TpcF0Yt+dT+4WUKH9WrESfW5+6xvrqia8BzjBh+yj70QpSTyhMcsjvJ+xyNcSSXBP5cX6ywvp
 VSJtKHAHK7GTEUmp0p7MEzU08m6VeWfUj2dqnwCXmjKnDtW8NjE/kN2V4ceurCF3CVjNj/sDI
 Pb4cttXFDB6OG+rN9zC/9giJZkUJ9ZQeM9Dr5ColWyAQZABUdBHcPpe3Ehw+yoQHjA+7/ywPz
 ssKrFqmcHBTArIO2k4vhiJjoCKCq8wguSNE2z0U31LW7HybV5LUWdAPlQKK4XYLH7tQRd4qtG
 LENGyHm6/M6xQsnWL+gqZbfwT3/nVAfD7bMGc5AB8ZZCSPxE6b1XujAfiasyIyI3wQyETkoZE
 eKK2UPet9LR0Ty05/mJuUN0ETyRPnIcF0BCxhx1/3YzoJ3Nmi+a/XBtnjV6nkKmcCegslHaGI
 G3qt0gAMRCMfCspiAX6FeBalmrFZENHJRbpkZdu0Zt6BRz9vum5wi505Nmg7yZlsV9x6OL7dX
 nw5Mk46LiMwo2eZ2i9RRLoYt3tbeGcO4XgOrEPXPRZnN3vXulUPmbtTgfr45FmAVM2EDxVYiN
 pI3kAsI3Hx06dCD+3t1/U5HgnxVL+2JYBpUUeXFWrEy/7NGB3LNZmj4/tCgt0oRgS/85sXYOQ
 Cf7njvytjf4BHQFh4ifiitXDRGNM/iBl1FDN9JziwwcPtqKn3e3Lna9WyEZWWpJbueJcCu+iq
 Qltu2WgFGWahXoMTS65YSm40LPTcOZKzbtPaNambo7zP6vYd3pNjLLa8+fIYRHCP9Q6//4EBe
 CartpTKAxwxBtEKBmVzyAsCTShonNGpx8K0QdFLe72h8SSIbqy7oRu8bR1kO4hOPcvjCkTY5+
 dUvJR8o60DpbCvItY3VMHzgGlFyJtcml//2WqAbvK+FjSzaBEKa4pwj2PkYBt7BP+v2GJgG1P
 C2/JVEHqxtmkLaxKXEAfgBF6ZfjiMfyxU7dKd9km0Dl8ccS3nbcaBBHdlavxnwYdBTTmcl4ai
 5Qdzvn/0TMa0Ta8XuQ01KR6zcJae+e9FrWza8O0IwNMd6R5BSnpsUB5f4v0xgsSEAXIclgBwq
 +FbWGzI8bQ/67+NSh79kcV+1ZCRIr5/Jm/LXKO+MQ5ri4O72pV6cJ8/Ubk0EzSVKKqMWEBHrm
 sVnj7aDf3FeZsue61NWdOvUOIaILkedvdgkNCRDyXk6HYICdV

The ACPI byte code inside the ACPI control method responsible for
handling the WMI method calls uses a global buffer for constructing
the return value, yet the ACPI control method itself is not marked
as "Serialized".
This means that calling WMI methods on this WMI device is not
thread-safe, as concurrent WMI method calls will corrupt the global
buffer.

Fix this by serializing the WMI method calls using a mutex.

Cc: <stable@vger.kernel.org> # 6.x.x: 609e303: platform/x86: msi-wmi-platf=
orm: Rename "data" variable
Fixes: 9c0beb6b29e7 ("platform/x86: wmi: Add MSI WMI Platform driver")
Tested-by: Antheas Kapenekakis <lkml@antheas.dev>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Changes since v2:
 - add necessary tag for stable

Changes since v1:
 - split variable renaming into separate patch
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

