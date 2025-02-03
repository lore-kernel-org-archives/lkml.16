Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A668202C20;
	Mon,  3 Feb 2025 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580507; cv=none; b=Z1WRaPYnLOORp/OcPtFWtscTjEUbsp2Ap6VN10Kl5a+Q5i9kCSM8ZMxyRqPQc50goKa2Kud+xQ2Fv5IQfRj2yB34AgT8+3YnPVj9uSzZbocoDT2xEhwfEURoeGxaR5eFe5mczJee9DNq88e9GatzLOLFSJ+meAss4tgMQAiVIN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580507; c=relaxed/simple;
	bh=aQDbay049/YWg1F5NCoyLcdzJG7ygeLEJlfy7mzWD8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJBLTxcKgufpMrOMPWQ0XOfHrHu2xOGd36CIF5KiWnLal4DpgImr5AjcNG3OXmQTUrms9OgFIrk2ixVcZ/TRjuI2yNw5cnJiFY6hHGjQopI6hsMuL0e2chNSEcU5GY4V3zEi1ds0NFnCMih/sacGlIaIZmKDe4Crn9/jQO3BS8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RMCWjD9y; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RMCWjD9y"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 265964427A;
	Mon,  3 Feb 2025 11:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738580503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YawhMMjsJd2hf/Fm4hW3F3LghMDiVLWEo+AjiYB3EiE=;
	b=RMCWjD9y33VxQ2eq2IFIJ5aRNg7rMBaXYp8MMrJPE+B+jttBBlIaldJ/UI5GURd6RDUvB+
	Pzsal3v8+Rq3WrzADS3y9nfYcBiR9xFAFCFOX4B/SEMTcIa9xv4J0ehIuFX8QmfUtCCO/s
	rV9DxdMgezP9CEoAQn7+Za6r9wS3FsTndl2t8092QZU1zhMGtUzLtLpgavdiOKE37ekq4F
	0tbmsbkkvp5+0wkOtGMOuGqOhQh0JgnD8S/PDs7sXNGwKX/re+9wWzX8zKZ6gCkEia94Ur
	oRFuRguGLlfcBZLzhX9VKelkvCXgJLhl0WzbOSbEqRKZU85U1qfQdMheTMi4vg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 03 Feb 2025 12:01:05 +0100
Subject: [PATCH v4 1/2] hwmon: Add Congatec Board Controller monitoring
 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-congatec-board-controller-hwmon-v4-1-ff6c76a4662c@bootlin.com>
References: <20250203-congatec-board-controller-hwmon-v4-0-ff6c76a4662c@bootlin.com>
In-Reply-To: <20250203-congatec-board-controller-hwmon-v4-0-ff6c76a4662c@bootlin.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Lee Jones <lee@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com, 
 linux-doc@vger.kernel.org, Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcutfhitghhrghrugcuoehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkedthedvieethedtleetffehudevleegledvteegvdeujeeghffhkeeggfefudevnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgdphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnhgvthdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnu
 higqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhhfihmohhnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjuggvlhhvrghrvgesshhushgvrdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

Add support for the Congatec Board Controller. This controller exposes
temperature, voltage, current and fan sensors.

The available sensors list cannot be predicted. Some sensors can be
present or not, depending the system.
The driver has an internal list of all possible sensors, for all Congatec
boards. The Board Controller gives to the driver its sensors list, and
their status (active or not).

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 Documentation/hwmon/cgbc-hwmon.rst |  63 ++++++++
 Documentation/hwmon/index.rst      |   1 +
 MAINTAINERS                        |   1 +
 drivers/hwmon/Kconfig              |  10 ++
 drivers/hwmon/Makefile             |   1 +
 drivers/hwmon/cgbc-hwmon.c         | 304 +++++++++++++++++++++++++++++++++++++
 6 files changed, 380 insertions(+)

diff --git a/Documentation/hwmon/cgbc-hwmon.rst b/Documentation/hwmon/cgbc-hwmon.rst
new file mode 100644
index 000000000000..3a5e6e6e8639
--- /dev/null
+++ b/Documentation/hwmon/cgbc-hwmon.rst
@@ -0,0 +1,63 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver cgbc-hwmon
+========================
+
+Supported chips:
+
+ * Congatec Board Controller.
+
+   Prefix: 'cgbc-hwmon'
+
+Author: Thomas Richard <thomas.richard@bootlin.com>
+
+Description
+-----------
+
+This driver enables monitoring support for the Congatec Board Controller.
+This controller is embedded on the x86 SoMs of Congatec.
+
+Sysfs entries
+-------------
+
+The following sysfs entries list contains all sensors defined in the Board
+Controller. The available sensors in sysfs depend on the SoM and the
+system.
+
+============= ======================
+Name          Description
+============= ======================
+temp1_input   CPU temperature
+temp2_input   Box temperature
+temp3_input   Ambient temperature
+temp4_input   Board temperature
+temp5_input   Carrier temperature
+temp6_input   Chipset temperature
+temp7_input   Video temperature
+temp8_input   Other temperature
+temp9_input   TOPDIM temperature
+temp10_input  BOTTOMDIM temperature
+in0_input     CPU voltage
+in1_input     DC Runtime voltage
+in2_input     DC Standby voltage
+in3_input     CMOS Battery voltage
+in4_input     Battery voltage
+in5_input     AC voltage
+in6_input     Other voltage
+in7_input     5V voltage
+in8_input     5V Standby voltage
+in9_input     3V3 voltage
+in10_input    3V3 Standby voltage
+in11_input    VCore A voltage
+in12_input    VCore B voltage
+in13_input    12V voltage
+curr1_input   DC current
+curr2_input   5V current
+curr3_input   12V current
+fan1_input    CPU fan
+fan2_input    Box fan
+fan3_input    Ambient fan
+fan4_input    Chiptset fan
+fan5_input    Video fan
+fan6_input    Other fan
+============= ======================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 874f8fd26325..ef86489bb47c 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -53,6 +53,7 @@ Hardware Monitoring Kernel Drivers
    bel-pfe
    bpa-rs600
    bt1-pvt
+   cgbc-hwmon
    chipcap2
    coretemp
    corsair-cpro
diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..c85ce9deb397 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5874,6 +5874,7 @@ CONGATEC BOARD CONTROLLER MFD DRIVER
 M:	Thomas Richard <thomas.richard@bootlin.com>
 S:	Maintained
 F:	drivers/gpio/gpio-cgbc.c
+F:	drivers/hwmon/cgbc-hwmon.c
 F:	drivers/i2c/busses/i2c-cgbc.c
 F:	drivers/mfd/cgbc-core.c
 F:	drivers/watchdog/cgbc_wdt.c
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 4cbaba15d86e..974cd532f0e2 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -463,6 +463,16 @@ config SENSORS_BT1_PVT_ALARMS
 	  the data conversion will be periodically performed and the data will be
 	  saved in the internal driver cache.
 
+config SENSORS_CGBC
+	tristate "Congatec Board Controller Sensors"
+	depends on MFD_CGBC
+	help
+	  Enable sensors support for the Congatec Board Controller. It has
+	  temperature, voltage, current and fan sensors.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called cgbc-hwmon.
+
 config SENSORS_CHIPCAP2
 	tristate "Amphenol ChipCap 2 relative humidity and temperature sensor"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index b7ef0f0562d3..8af5fdbd5dff 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -59,6 +59,7 @@ obj-$(CONFIG_SENSORS_ASUS_ROG_RYUJIN)	+= asus_rog_ryujin.o
 obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
 obj-$(CONFIG_SENSORS_AXI_FAN_CONTROL) += axi-fan-control.o
 obj-$(CONFIG_SENSORS_BT1_PVT)	+= bt1-pvt.o
+obj-$(CONFIG_SENSORS_CGBC)	+= cgbc-hwmon.o
 obj-$(CONFIG_SENSORS_CHIPCAP2) += chipcap2.o
 obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
 obj-$(CONFIG_SENSORS_CORSAIR_CPRO) += corsair-cpro.o
diff --git a/drivers/hwmon/cgbc-hwmon.c b/drivers/hwmon/cgbc-hwmon.c
new file mode 100644
index 000000000000..772f44d56ccf
--- /dev/null
+++ b/drivers/hwmon/cgbc-hwmon.c
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * cgbc-hwmon - Congatec Board Controller hardware monitoring driver
+ *
+ * Copyright (C) 2024 Thomas Richard <thomas.richard@bootlin.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/hwmon.h>
+#include <linux/mfd/cgbc.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define CGBC_HWMON_CMD_SENSOR		0x77
+#define CGBC_HWMON_CMD_SENSOR_DATA_SIZE	0x05
+
+#define CGBC_HWMON_TYPE_MASK	GENMASK(6, 5)
+#define CGBC_HWMON_ID_MASK	GENMASK(4, 0)
+#define CGBC_HWMON_ACTIVE_BIT	BIT(7)
+
+struct cgbc_hwmon_sensor {
+	enum hwmon_sensor_types type;
+	bool active;
+	unsigned int index;
+	unsigned int channel;
+	const char *label;
+};
+
+struct cgbc_hwmon_data {
+	struct cgbc_device_data *cgbc;
+	unsigned int nb_sensors;
+	struct cgbc_hwmon_sensor *sensors;
+};
+
+enum cgbc_sensor_types {
+	CGBC_HWMON_TYPE_TEMP = 1,
+	CGBC_HWMON_TYPE_IN,
+	CGBC_HWMON_TYPE_FAN
+};
+
+static const char * const cgbc_hwmon_labels_temp[] = {
+	"CPU Temperature",
+	"Box Temperature",
+	"Ambient Temperature",
+	"Board Temperature",
+	"Carrier Temperature",
+	"Chipset Temperature",
+	"Video Temperature",
+	"Other Temperature",
+	"TOPDIM Temperature",
+	"BOTTOMDIM Temperature",
+};
+
+static const struct {
+	enum hwmon_sensor_types type;
+	const char *label;
+} cgbc_hwmon_labels_in[] = {
+	{ hwmon_in, "CPU Voltage" },
+	{ hwmon_in, "DC Runtime Voltage" },
+	{ hwmon_in, "DC Standby Voltage" },
+	{ hwmon_in, "CMOS Battery Voltage" },
+	{ hwmon_in, "Battery Voltage" },
+	{ hwmon_in, "AC Voltage" },
+	{ hwmon_in, "Other Voltage" },
+	{ hwmon_in, "5V Voltage" },
+	{ hwmon_in, "5V Standby Voltage" },
+	{ hwmon_in, "3V3 Voltage" },
+	{ hwmon_in, "3V3 Standby Voltage" },
+	{ hwmon_in, "VCore A Voltage" },
+	{ hwmon_in, "VCore B Voltage" },
+	{ hwmon_in, "12V Voltage" },
+	{ hwmon_curr, "DC Current" },
+	{ hwmon_curr, "5V Current" },
+	{ hwmon_curr, "12V Current" },
+};
+
+#define CGBC_HWMON_NB_IN_SENSORS	14
+
+static const char * const cgbc_hwmon_labels_fan[] = {
+	"CPU Fan",
+	"Box Fan",
+	"Ambient Fan",
+	"Chipset Fan",
+	"Video Fan",
+	"Other Fan",
+};
+
+static int cgbc_hwmon_cmd(struct cgbc_device_data *cgbc, u8 index, u8 *data)
+{
+	u8 cmd[2] = {CGBC_HWMON_CMD_SENSOR, index};
+
+	return cgbc_command(cgbc, cmd, sizeof(cmd), data, CGBC_HWMON_CMD_SENSOR_DATA_SIZE, NULL);
+}
+
+static int cgbc_hwmon_probe_sensors(struct device *dev, struct cgbc_hwmon_data *hwmon)
+{
+	struct cgbc_device_data *cgbc = hwmon->cgbc;
+	struct cgbc_hwmon_sensor *sensor = hwmon->sensors;
+	u8 data[CGBC_HWMON_CMD_SENSOR_DATA_SIZE], nb_sensors, i;
+	int ret;
+
+	ret = cgbc_hwmon_cmd(cgbc, 0, &data[0]);
+	if (ret)
+		return ret;
+
+	nb_sensors = data[0];
+
+	hwmon->sensors = devm_kzalloc(dev, sizeof(*hwmon->sensors) * nb_sensors, GFP_KERNEL);
+	sensor = hwmon->sensors;
+
+	for (i = 0; i < nb_sensors; i++) {
+		enum cgbc_sensor_types type;
+		unsigned int channel;
+
+		/*
+		 * No need to request data for the first sensor.
+		 * We got data for the first sensor when we ask the number of sensors to the Board
+		 * Controller.
+		 */
+		if (i) {
+			ret = cgbc_hwmon_cmd(cgbc, i, &data[0]);
+			if (ret)
+				return ret;
+		}
+
+		type = FIELD_GET(CGBC_HWMON_TYPE_MASK, data[1]);
+		channel = FIELD_GET(CGBC_HWMON_ID_MASK, data[1]) - 1;
+
+		if (type == CGBC_HWMON_TYPE_TEMP && channel < ARRAY_SIZE(cgbc_hwmon_labels_temp)) {
+			sensor->type = hwmon_temp;
+			sensor->label = cgbc_hwmon_labels_temp[channel];
+		} else if (type == CGBC_HWMON_TYPE_IN &&
+			   channel < ARRAY_SIZE(cgbc_hwmon_labels_in)) {
+			/*
+			 * The Board Controller doesn't differentiate current and voltage sensors.
+			 * Get the sensor type from cgbc_hwmon_labels_in[channel].type instead.
+			 */
+			sensor->type = cgbc_hwmon_labels_in[channel].type;
+			sensor->label = cgbc_hwmon_labels_in[channel].label;
+		} else if (type == CGBC_HWMON_TYPE_FAN &&
+			   channel < ARRAY_SIZE(cgbc_hwmon_labels_fan)) {
+			sensor->type = hwmon_fan;
+			sensor->label = cgbc_hwmon_labels_fan[channel];
+		} else {
+			dev_warn(dev, "Board Controller returned an unknown sensor (type=%d, channel=%d), ignore it",
+				 type, channel);
+			continue;
+		}
+
+		sensor->active = FIELD_GET(CGBC_HWMON_ACTIVE_BIT, data[1]);
+		sensor->channel = channel;
+		sensor->index = i;
+		sensor++;
+		hwmon->nb_sensors++;
+	}
+
+	return 0;
+}
+
+static struct cgbc_hwmon_sensor *cgbc_hwmon_find_sensor(struct cgbc_hwmon_data *hwmon,
+							enum hwmon_sensor_types type, int channel)
+{
+	struct cgbc_hwmon_sensor *sensor = NULL;
+	int i;
+
+	/*
+	 * The Board Controller doesn't differentiate current and voltage sensors.
+	 * The channel value (from the Board Controller point of view) shall be computed for current
+	 * sensors.
+	 */
+	if (type == hwmon_curr)
+		channel += CGBC_HWMON_NB_IN_SENSORS;
+
+	for (i = 0; i < hwmon->nb_sensors; i++) {
+		if (hwmon->sensors[i].type == type && hwmon->sensors[i].channel == channel) {
+			sensor = &hwmon->sensors[i];
+			break;
+		}
+	}
+
+	return sensor;
+}
+
+static int cgbc_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
+			   long *val)
+{
+	struct cgbc_hwmon_data *hwmon = dev_get_drvdata(dev);
+	struct cgbc_hwmon_sensor *sensor = cgbc_hwmon_find_sensor(hwmon, type, channel);
+	struct cgbc_device_data *cgbc = hwmon->cgbc;
+	u8 data[CGBC_HWMON_CMD_SENSOR_DATA_SIZE];
+	int ret;
+
+	ret = cgbc_hwmon_cmd(cgbc, sensor->index, &data[0]);
+	if (ret)
+		return ret;
+
+	*val = (data[3] << 8) | data[2];
+
+	/*
+	 * For the Board Controller 1lsb = 0.1 degree centigrade.
+	 * Other units are as expected.
+	 */
+	if (sensor->type == hwmon_temp)
+		*val *= 100;
+
+	return 0;
+}
+
+static umode_t cgbc_hwmon_is_visible(const void *_data, enum hwmon_sensor_types type, u32 attr,
+				     int channel)
+{
+	struct cgbc_hwmon_data *data = (struct cgbc_hwmon_data *)_data;
+	struct cgbc_hwmon_sensor *sensor;
+
+	sensor = cgbc_hwmon_find_sensor(data, type, channel);
+	if (!sensor)
+		return 0;
+
+	return sensor->active ? 0444 : 0;
+}
+
+static int cgbc_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+				  int channel, const char **str)
+{
+	struct cgbc_hwmon_data *hwmon = dev_get_drvdata(dev);
+	struct cgbc_hwmon_sensor *sensor = cgbc_hwmon_find_sensor(hwmon, type, channel);
+
+	*str = sensor->label;
+
+	return 0;
+}
+
+static const struct hwmon_channel_info * const cgbc_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
+	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_INPUT | HWMON_C_LABEL, HWMON_C_INPUT | HWMON_C_LABEL,
+			   HWMON_C_INPUT | HWMON_C_LABEL),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_LABEL, HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL, HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL, HWMON_F_INPUT | HWMON_F_LABEL),
+	NULL
+};
+
+static const struct hwmon_ops cgbc_hwmon_ops = {
+	.is_visible = cgbc_hwmon_is_visible,
+	.read = cgbc_hwmon_read,
+	.read_string = cgbc_hwmon_read_string,
+};
+
+static const struct hwmon_chip_info cgbc_chip_info = {
+	.ops = &cgbc_hwmon_ops,
+	.info = cgbc_hwmon_info,
+};
+
+static int cgbc_hwmon_probe(struct platform_device *pdev)
+{
+	struct cgbc_device_data *cgbc = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	struct cgbc_hwmon_data *data;
+	struct device *hwmon_dev;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->cgbc = cgbc;
+
+	ret = cgbc_hwmon_probe_sensors(dev, data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to probe sensors");
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cgbc_hwmon", data, &cgbc_chip_info,
+							 NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static struct platform_driver cgbc_hwmon_driver = {
+	.driver = {
+		.name = "cgbc-hwmon",
+	},
+	.probe = cgbc_hwmon_probe,
+};
+
+module_platform_driver(cgbc_hwmon_driver);
+
+MODULE_AUTHOR("Thomas Richard <thomas.richard@bootlin.com>");
+MODULE_DESCRIPTION("Congatec Board Controller Hardware Monitoring Driver");
+MODULE_LICENSE("GPL");

-- 
2.39.5

