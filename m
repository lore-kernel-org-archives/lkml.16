Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C4625E45A;
	Sun, 11 May 2025 20:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746996807; cv=none; b=CT8k3JuWd6a9zinLmt21goWJPVH68FT79wmBh+Z1nvbnyKOw0LH4SawW6BDQu5/Tmb13bxEPVljOf+FCyT+lv9eVyT1utSvZPvb4uP8nL6f+Y9Aee51XxFemjlOWXVMvZEfG0ni22sWrRgNR81ysVKbz1CARNFr4jS13O6uc2T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746996807; c=relaxed/simple;
	bh=lxVqT6fVrxp3st8VNJBf2MocKXWigeCZ+B0AprVLg14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RNGTw7S9ibQAbnj5R7Sfk3Hal78VTaY9V5g9tw3mhwY5SgtnisdLp18DV98yQq/hhtJQO0p4Z6EjITzdw4sJEQnXNTZ3ZCm9LFu401PYWrGV6cuQ3QatrekdOrloIyvcJTesMBvlTYu1DKu7Iw6tCiUuf7wX0oqMDRrOtjn7A6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=h+zh1jxP; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="h+zh1jxP"
Received: from localhost.localdomain (x5996a826.customers.hiper-net.dk [89.150.168.38])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 08D492E0A47A;
	Sun, 11 May 2025 23:44:37 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1746996280;
	bh=Prktr/wUoxhrqc+n5hi2mCrepwPtH3enZVLiFIXWbZY=; h=From:To:Subject;
	b=h+zh1jxPppLqx413m1/fZcTRfHtLRa15nOZl7yktDPqzijyb4u8YUSAe/ItlPf345
	 1PvR/ndmkAx9irwWtvC/6lC3hbTe426u6d0PitFKgQNzTcQdzM5OdhoFMQ6/S5ChI4
	 ODcroasdL5mv8uj3V/ih7hZjo4f0d6ftZPQqqMcg=
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
Subject: [PATCH v1 01/10] platform/x86: msi-wmi-platform: Use input buffer for
 returning result
Date: Sun, 11 May 2025 22:44:18 +0200
Message-ID: <20250511204427.327558-2-lkml@antheas.dev>
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
 <174699627977.27565.11929832264375726108@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

From: Armin Wolf <W_Armin@gmx.de>

Modify msi_wmi_platform_query() to reuse the input buffer for
returning the result of a WMI method call. Using a separate output
buffer to return the result is unnecessary because the WMI interface
requires both buffers to have the same length anyway.

Co-developed-by: Antheas Kapenekakis <lkml@antheas.dev>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
---
 drivers/platform/x86/msi-wmi-platform.c | 53 ++++++++++++-------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index dc5e9878cb682..41218a9d6e35d 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -21,6 +21,7 @@
 #include <linux/mutex.h>
 #include <linux/printk.h>
 #include <linux/rwsem.h>
+#include <linux/string.h>
 #include <linux/types.h>
 #include <linux/wmi.h>
 
@@ -140,19 +141,19 @@ static int msi_wmi_platform_parse_buffer(union acpi_object *obj, u8 *output, siz
 }
 
 static int msi_wmi_platform_query(struct msi_wmi_platform_data *data,
-				  enum msi_wmi_platform_method method, u8 *input,
-				  size_t input_length, u8 *output, size_t output_length)
+				  enum msi_wmi_platform_method method, u8 *buffer,
+				  size_t length)
 {
 	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct acpi_buffer in = {
-		.length = input_length,
-		.pointer = input
+		.length = length,
+		.pointer = buffer
 	};
 	union acpi_object *obj;
 	acpi_status status;
 	int ret;
 
-	if (!input_length || !output_length)
+	if (!length)
 		return -EINVAL;
 
 	/*
@@ -169,7 +170,7 @@ static int msi_wmi_platform_query(struct msi_wmi_platform_data *data,
 	if (!obj)
 		return -ENODATA;
 
-	ret = msi_wmi_platform_parse_buffer(obj, output, output_length);
+	ret = msi_wmi_platform_parse_buffer(obj, buffer, length);
 	kfree(obj);
 
 	return ret;
@@ -185,17 +186,15 @@ static int msi_wmi_platform_read(struct device *dev, enum hwmon_sensor_types typ
 				 int channel, long *val)
 {
 	struct msi_wmi_platform_data *data = dev_get_drvdata(dev);
-	u8 input[32] = { 0 };
-	u8 output[32];
+	u8 buffer[32] = { 0 };
 	u16 value;
 	int ret;
 
-	ret = msi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, input, sizeof(input), output,
-				     sizeof(output));
+	ret = msi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, buf, sizeof(buf));
 	if (ret < 0)
 		return ret;
 
-	value = get_unaligned_be16(&output[channel * 2 + 1]);
+	value = get_unaligned_be16(&buffer[channel * 2 + 1]);
 	if (!value)
 		*val = 0;
 	else
@@ -245,13 +244,17 @@ static ssize_t msi_wmi_platform_write(struct file *fp, const char __user *input,
 		return ret;
 
 	down_write(&data->buffer_lock);
-	ret = msi_wmi_platform_query(data->data, data->method, payload, data->length, data->buffer,
+	ret = msi_wmi_platform_query(data->data, data->method, data->buffer,
 				     data->length);
 	up_write(&data->buffer_lock);
 
 	if (ret < 0)
 		return ret;
 
+	down_write(&data->buffer_lock);
+	memcpy(data->buffer, payload, data->length);
+	up_write(&data->buffer_lock);
+
 	return length;
 }
 
@@ -348,23 +351,21 @@ static int msi_wmi_platform_hwmon_init(struct msi_wmi_platform_data *data)
 
 static int msi_wmi_platform_ec_init(struct msi_wmi_platform_data *data)
 {
-	u8 input[32] = { 0 };
-	u8 output[32];
+	u8 buffer[32] = { 0 };
 	u8 flags;
 	int ret;
 
-	ret = msi_wmi_platform_query(data, MSI_PLATFORM_GET_EC, input, sizeof(input), output,
-				     sizeof(output));
+	ret = msi_wmi_platform_query(data, MSI_PLATFORM_GET_EC, buffer, sizeof(buffer));
 	if (ret < 0)
 		return ret;
 
-	flags = output[MSI_PLATFORM_EC_FLAGS_OFFSET];
+	flags = buffer[MSI_PLATFORM_EC_FLAGS_OFFSET];
 
 	dev_dbg(&data->wdev->dev, "EC RAM version %lu.%lu\n",
 		FIELD_GET(MSI_PLATFORM_EC_MAJOR_MASK, flags),
 		FIELD_GET(MSI_PLATFORM_EC_MINOR_MASK, flags));
 	dev_dbg(&data->wdev->dev, "EC firmware version %.28s\n",
-		&output[MSI_PLATFORM_EC_VERSION_OFFSET]);
+		&buffer[MSI_PLATFORM_EC_VERSION_OFFSET]);
 
 	if (!(flags & MSI_PLATFORM_EC_IS_TIGERLAKE)) {
 		if (!force)
@@ -378,27 +379,25 @@ static int msi_wmi_platform_ec_init(struct msi_wmi_platform_data *data)
 
 static int msi_wmi_platform_init(struct msi_wmi_platform_data *data)
 {
-	u8 input[32] = { 0 };
-	u8 output[32];
+	u8 buffer[32] = { 0 };
 	int ret;
 
-	ret = msi_wmi_platform_query(data, MSI_PLATFORM_GET_WMI, input, sizeof(input), output,
-				     sizeof(output));
+	ret = msi_wmi_platform_query(data, MSI_PLATFORM_GET_WMI, buffer, sizeof(buffer));
 	if (ret < 0)
 		return ret;
 
 	dev_dbg(&data->wdev->dev, "WMI interface version %u.%u\n",
-		output[MSI_PLATFORM_WMI_MAJOR_OFFSET],
-		output[MSI_PLATFORM_WMI_MINOR_OFFSET]);
+		buffer[MSI_PLATFORM_WMI_MAJOR_OFFSET],
+		buffer[MSI_PLATFORM_WMI_MINOR_OFFSET]);
 
-	if (output[MSI_PLATFORM_WMI_MAJOR_OFFSET] != MSI_WMI_PLATFORM_INTERFACE_VERSION) {
+	if (buffer[MSI_PLATFORM_WMI_MAJOR_OFFSET] != MSI_WMI_PLATFORM_INTERFACE_VERSION) {
 		if (!force)
 			return -ENODEV;
 
 		dev_warn(&data->wdev->dev,
 			 "Loading despite unsupported WMI interface version (%u.%u)\n",
-			 output[MSI_PLATFORM_WMI_MAJOR_OFFSET],
-			 output[MSI_PLATFORM_WMI_MINOR_OFFSET]);
+			 buffer[MSI_PLATFORM_WMI_MAJOR_OFFSET],
+			 buffer[MSI_PLATFORM_WMI_MINOR_OFFSET]);
 	}
 
 	return 0;
-- 
2.49.0

