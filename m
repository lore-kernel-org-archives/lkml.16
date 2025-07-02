Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9B2111BF;
	Wed,  2 Jul 2025 08:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445330; cv=none; b=tG5lVXdU/Ed2LvK9yerWAKzYxAeH5KwuhXFVcAxbttbegV7T9RpIow1shEheQVvZJPLPmUqvFIdQ5Mro8rIRKN3VcblfyY27hL/G67wv3tIdtxTdal4feKd3WSMH1zgBsxVW0hGJKEX50fYWEAPiHsfbT62vAmYDBjvN4rv+Dgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445330; c=relaxed/simple;
	bh=+tEN468+Pz0ZLeoxMngBSW2D7LstgZ1Ov8e/gnQ7aHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AsBP2uFbRAnd/VNNl699Cb6dmikii0vROOkjWgtYGDYddf7YrFcT9sK3PQhM87nxPCWAb1pSEK3EBF31naSwhIk8QNFwMFzzGzLtOpVSs28fLoRVk4lIsuAcvkwn++6AKdOUUeIlkVA+AQnqP7/pUqMGVg72r67IwRhCS9TO4Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5Q96JCa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5Q96JCa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675D4C4CEED;
	Wed,  2 Jul 2025 08:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751445330;
	bh=+tEN468+Pz0ZLeoxMngBSW2D7LstgZ1Ov8e/gnQ7aHI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=W5Q96JCazLbjPRQ1yZYpUUjo3fnPBjViKKVntg/YCa+TP6dD51z5dpvqkMmaPkr8N
	 duRDh8y2USHpWkINvsCECpWmHaZ62xQq+s2U0wgWprrbCQMG+owuBUAq4QiqMddt7l
	 3xx4QByZI3nwAw4JeleNNroZJl7DBIdCraEaVRB/klLx+NG8/SdOD0/0CwoMR2ayk2
	 WXTXzsJaNTPgg4qIqli5f2W4krEEcgPseppPWCpsGMIKxZHThYuazruRIJkaKXVqAX
	 XDYxEjTVJwd1Ao3YX9QbTNJNaNumLVwIl5HFJ4KUaf76mKZCYpE1s9zfkrO8+CTCLv
	 TGtdmKs76qWNA==
Message-ID: <c893384d-4134-4510-be87-11a2c9ba6cc7@kernel.org>
Date: Wed, 2 Jul 2025 10:35:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: hwmon: add EMC2101 driver
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 jdelvare@suse.com, linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250701181228.1196102-1-noltari@gmail.com>
 <20250701181228.1196102-4-noltari@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250701181228.1196102-4-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/07/2025 20:12, Álvaro Fernández Rojas wrote:
> The Microchip EMC2101 is a SMBus 2.0 fan controller with temperature
> monitoring.
> It supports up to 1 fan, 1 internal temperature sensor, 1 external
> temperature sensor and an 8 entry look up table to create a
> programmable temperature response.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  drivers/hwmon/Kconfig   |   10 +
>  drivers/hwmon/Makefile  |    1 +
>  drivers/hwmon/emc2101.c | 2175 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2186 insertions(+)
>  create mode 100644 drivers/hwmon/emc2101.c
> 
>  v2: multiple improvements:
>   - Remove FAN_RPM_MIN definition.
>   - Rename FAN_FALSE_READ to FAN_MIN_READ.
>   - pwm_auto_point_temp_hyst_store(): simplify function.
>   - emc2101_fan_min_read(): add missing FAN_MIN_READ condition.
>   - emc2101_fan_min_write(): fix tach_count calculation.
>   - emc2101_init(): fix REG_TACH_MIN value.
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 079620dd4286..360b9f66275c 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2002,6 +2002,16 @@ config SENSORS_EMC1403
>  	  Threshold values can be configured using sysfs.
>  	  Data from the different diodes are accessible via sysfs.
>  
> +config SENSORS_EMC2101
> +	tristate "SMSC EMC2101"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for the SMSC EMC2101
> +	  fan controller chips.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called emc2101.
> +
>  config SENSORS_EMC2103
>  	tristate "SMSC EMC2103"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 48e5866c0c9a..70e95096c6f2 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -73,6 +73,7 @@ obj-$(CONFIG_SENSORS_DRIVETEMP)	+= drivetemp.o
>  obj-$(CONFIG_SENSORS_DS620)	+= ds620.o
>  obj-$(CONFIG_SENSORS_DS1621)	+= ds1621.o
>  obj-$(CONFIG_SENSORS_EMC1403)	+= emc1403.o
> +obj-$(CONFIG_SENSORS_EMC2101)	+= emc2101.o
>  obj-$(CONFIG_SENSORS_EMC2103)	+= emc2103.o
>  obj-$(CONFIG_SENSORS_EMC2305)	+= emc2305.o
>  obj-$(CONFIG_SENSORS_EMC6W201)	+= emc6w201.o
> diff --git a/drivers/hwmon/emc2101.c b/drivers/hwmon/emc2101.c
> new file mode 100644
> index 000000000000..65f2eff27aaf
> --- /dev/null
> +++ b/drivers/hwmon/emc2101.c
> @@ -0,0 +1,2176 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for Microchip EMC2101 fan controller.
> + *
> + * Copyright 2025 Álvaro Fernández Rojas <noltari@gmail.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/util_macros.h>
> +
> +#define REG_TEMP_INT			0x00
> +#define REG_TEMP_EXT_HI			0x01
> +#define REG_STATUS			0x02
> +#define  ADC_BUSY			BIT(7)
> +#define  TEMP_INT_HIGH			BIT(6)
> +#define  EEPROM_ERROR			BIT(5)
> +#define  TEMP_EXT_HIGH			BIT(4)
> +#define  TEMP_EXT_LOW			BIT(3)
> +#define  TEMP_EXT_FAULT			BIT(2)
> +#define  TEMP_EXT_CRIT			BIT(1)
> +#define  TACH_LOW			BIT(0)
> +#define REG_CONFIG			0x03
> +#define  ALERT_IRQ_ACK			BIT(7)
> +#define  FAN_STANDBY_ENABLE		BIT(6)
> +#define  FAN_STANDBY_MODE		BIT(5)
> +#define  FAN_MODE_DAC			BIT(4)
> +#define  SMBUS_TOUT_DISABLE		BIT(3)
> +#define  PIN_FUNC_TACH			BIT(2)
> +#define  TEMP_EXT_CRIT_UNLOCK		BIT(1)
> +#define  PIN_ASSERT_3_EXC		BIT(0)
> +#define REG_CONV_RATE			0x04
> +#define  CONV_RATE_MASK			0xf
> +#define REG_TEMP_INT_MAX		0x05
> +#define REG_TEMP_EXT_MAX_HI		0x07
> +#define REG_TEMP_EXT_MIN_HI		0x08
> +#define REG_TEMP_EXT_FORCE		0x0c
> +#define REG_ONE_SHOT			0x0f
> +#define REG_TEMP_EXT_LO			0x10
> +#define REG_SCRATCHPAD_1		0x11
> +#define REG_SCRATCHPAD_2		0x12
> +#define REG_TEMP_EXT_MAX_LO		0x13
> +#define REG_TEMP_EXT_MIN_LO		0x14
> +#define REG_ALERT_MASK			0x16
> +#define  IRQ_TEMP_INT_MAX_DISABLE	BIT(6)
> +#define  IRQ_TEMP_EXT_MAX_DISABLE	BIT(4)
> +#define  IRQ_TEMP_EXT_MIN_DISABLE	BIT(3)
> +#define  IRQ_TEMP_EXT_CRIT_DISABLE	BIT(1)
> +#define  IRQ_TACH_MIN_DISABLE		BIT(0)
> +#define REG_EXT_IDEALITY		0x17
> +#define  EXT_IDEALITY_START		9846
> +#define  EXT_IDEALITY_STEP		13
> +#define  EXT_IDEALITY_VAL(x)		(EXT_IDEALITY_START + \
> +					 ((x) * EXT_IDEALITY_STEP))
> +#define  EXT_IDEALITY_MASK		0x3f
> +#define REG_BETA_COMP			0x18
> +#define  BETA_COMP_AUTO			BIT(3)
> +#define  BETA_COMP_DISABLE		7
> +#define  BETA_COMP_2_33			6
> +#define  BETA_COMP_1_00			5
> +#define  BETA_COMP_0_43			4
> +#define  BETA_COMP_0_33			3
> +#define  BETA_COMP_0_25			2
> +#define  BETA_COMP_0_18			1
> +#define  BETA_COMP_0_11			0
> +#define  BETA_COMP_MASK			0x7
> +#define REG_TEMP_EXT_CRIT		0x19
> +#define REG_TEMP_EXT_CRIT_HYST		0x21
> +#define REG_TACH_LO			0x46
> +#define REG_TACH_HI			0x47
> +#define REG_TACH_MIN_LO			0x48
> +#define REG_TACH_MIN_HI			0x49
> +#define REG_FAN_CONFIG			0x4a
> +#define  FAN_EXT_TEMP_FORCE		BIT(6)
> +#define  FAN_LUT_DISABLE		BIT(5)
> +#define  FAN_POL_INV			BIT(4)
> +#define  FAN_CLK_SEL			BIT(3)
> +#define  FAN_CLK_OVR			BIT(2)
> +#define  TACH_FALSE_READ_DISABLE	BIT(0)
> +#define  TACH_FALSE_READ_MASK		0x3
> +#define REG_FAN_SPIN			0x4b
> +#define  FAN_SPIN_UP_ABORT		BIT(5)
> +#define  FAN_SPIN_UP_POWER_SHIFT	3
> +#define  FAN_SPIN_UP_POWER_100		(3 << FAN_SPIN_UP_POWER_SHIFT)
> +#define  FAN_SPIN_UP_POWER_75		(2 << FAN_SPIN_UP_POWER_SHIFT)
> +#define  FAN_SPIN_UP_POWER_50		(1 << FAN_SPIN_UP_POWER_SHIFT)
> +#define  FAN_SPIN_UP_POWER_0		(0 << FAN_SPIN_UP_POWER_SHIFT)
> +#define  FAN_SPIN_UP_POWER_MASK		(0x3 << FAN_SPIN_UP_POWER_SHIFT)
> +#define  FAN_SPIN_UP_TIME_3200		7
> +#define  FAN_SPIN_UP_TIME_1600		6
> +#define  FAN_SPIN_UP_TIME_800		5
> +#define  FAN_SPIN_UP_TIME_400		4
> +#define  FAN_SPIN_UP_TIME_200		3
> +#define  FAN_SPIN_UP_TIME_100		2
> +#define  FAN_SPIN_UP_TIME_50		1
> +#define  FAN_SPIN_UP_TIME_0		0
> +#define  FAN_SPIN_UP_TIME_MASK		0x7
> +#define REG_FAN_SET			0x4c
> +#define  FAN_SET_MASK			0x3f
> +#define REG_PWM_FREQ			0x4d
> +#define  PWM_FREQ_MASK			0x1f
> +#define REG_PWM_FREQ_DIV		0x4e
> +#define REG_FAN_LUT_HYST		0x4f
> +#define  FAN_LUT_HYST_MASK		0x1f
> +#define REG_FAN_LUT_TEMP(x)		(0x50 + (0x2 * (x)))
> +/* Write only with FAN_LUT_DISABLE */
> +#define  FAN_LUT_TEMP_MASK		0x7f
> +#define REG_FAN_LUT_SPEED(x)		(0x51 + (0x2 * (x)))
> +/* Write only with FAN_LUT_DISABLE */
> +#define  FAN_LUT_SPEED_MASK		0x3f
> +#define REG_AVG_FILTER			0xbf
> +#define  FILTER_SHIFT			1
> +#define  FILTER_L2			(3 << FILTER_SHIFT)
> +#define  FILTER_L1			(1 << FILTER_SHIFT)
> +#define  FILTER_NONE			(0 << FILTER_SHIFT)
> +#define  FILTER_MASK			(0x3 << FILTER_SHIFT)
> +#define  ALERT_PIN_TEMP_COMP		BIT(0)
> +#define REG_PRODUCT_ID			0xfd
> +#define REG_MANUFACTURER_ID		0xfe
> +#define REG_REVISION			0xff
> +
> +#define CLK_FREQ_ALT			1400
> +#define CLK_FREQ_BASE			360000
> +
> +#define FAN_LUT_COUNT			8
> +#define FAN_LUT_HYST_DEF		4
> +#define FAN_LUT_HYST_MIN		0
> +#define FAN_LUT_HYST_MAX		31
> +#define FAN_MIN_READ			0xffff
> +#define FAN_RPM_FACTOR			5400000
> +
> +#define MANUFACTURER_ID			0x5d
> +
> +#define TEMP_EXT_HI_FAULT		0x7f
> +#define TEMP_EXT_LO_FAULT_OPEN		0x00
> +#define TEMP_EXT_LO_FAULT_SHORT		0xe0
> +
> +#define TEMP_LO_FRAC			125
> +#define TEMP_LO_SHIFT			5
> +#define TEMP_LO_MASK			(0x3 << TEMP_LO_SHIFT)
> +
> +#define TEMP_MIN			-64
> +#define TEMP_MAX			127
> +#define TEMP_MAX_FRAC			750
> +
> +enum emc2101_fan_spin_up_abort {
> +	EMC2101_FAN_SPIN_ABORT_DISABLE = 0,
> +	EMC2101_FAN_SPIN_ABORT_ENABLE
> +};
> +
> +enum emc2101_fan_standby {
> +	EMC2101_FAN_STBY_DISABLE = 0,
> +	EMC2101_FAN_STBY_ENABLE
> +};
> +
> +enum emc2101_mode {
> +	EMC2101_MODE_PWM = 0,
> +	EMC2101_MODE_DAC
> +};
> +
> +enum ecm2101_product_id {
> +	EMC2101 = 0x16,
> +	EMC2101_R = 0x28
> +};
> +
> +enum emc2101_pwm_enable {
> +	EMC2101_PWM_MANUAL = 1,
> +	EMC2101_PWM_LUT = 2
> +};
> +
> +enum emc2101_pwm_polarity {
> +	EMC2101_POL_NORMAL = 0,
> +	EMC2101_POL_INVERTED
> +};
> +
> +enum emc2101_temp_channels {
> +	EMC2101_TC_INT = 0,
> +	EMC2101_TC_EXT,
> +	EMC2101_TC_FORCE,
> +	EMC2101_TC_NUM
> +};
> +
> +enum emc2101_temp_diode {
> +	EMC2101_TD_CPU = 1,
> +	EMC2101_TD_2N3904 = 2
> +};
> +
> +struct emc2101_data {
> +	struct i2c_client *client;
> +	struct device *dev;
> +	struct mutex mutex;

Add a comment describing what you are protecting here. It looks so far
like you could just use regmap and drop the mutex, but I didn't check
thoroughly.

> +};



...

> +
> +static int emc2101_probe(struct i2c_client *client)
> +{
> +	struct i2c_adapter *adapter = client->adapter;
> +	struct device *dev = &client->dev;
> +	struct emc2101_data *data;
> +	struct device *hwmon_dev;
> +
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
> +		return -EIO;
> +
> +	data = devm_kzalloc(dev, sizeof(struct emc2101_data), GFP_KERNEL);

sizeof(*)

> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	data->dev = dev;
> +	mutex_init(&data->mutex);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
> +							 &emc2101_chip_info,
> +							 emc2101_hwmon_groups);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	dev_info(dev, "%s: sensor '%s'\n", dev_name(hwmon_dev), client->name);

Drivers should be silent oon success. We already know that this probed
based on sysfs.

> +
> +	return emc2101_init(data);
> +}
> +
> +static int emc2101_detect(struct i2c_client *client, struct i2c_board_info *info)
> +{
> +	struct i2c_adapter *adapter = client->adapter;
> +	s32 manufacturer, product, revision;
> +	struct device *dev = &adapter->dev;
> +
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
> +		return -ENODEV;
> +
> +	manufacturer = i2c_smbus_read_byte_data(client, REG_MANUFACTURER_ID);
> +	if (manufacturer != MANUFACTURER_ID)
> +		return -ENODEV;
> +
> +	product = i2c_smbus_read_byte_data(client, REG_PRODUCT_ID);
> +	switch (product) {
> +	case EMC2101:
> +		strscpy(info->type, "emc2101", I2C_NAME_SIZE);
> +		break;
> +	case EMC2101_R:
> +		strscpy(info->type, "emc2101-r", I2C_NAME_SIZE);
> +		break;
> +	default:
> +		return -ENODEV;
> +	}
> +
> +	revision = i2c_smbus_read_byte_data(client, REG_REVISION);
> +
> +	dev_info(dev, "Found %s at 0x%02x (rev 0x%02x).\n",
> +		 info->type, client->addr, revision);
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id emc2101_ids[] = {
> +	{ "emc2101" },
> +	{ "emc2101-r" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, emc2101_ids);
> +
> +static const struct of_device_id emc2101_of_match_table[] = {
> +	{ .compatible = "microchip,emc2101", },
> +	{ .compatible = "microchip,emc2101-r", },

Devices are compatible then? Express it in the bindings and drop this entry.

> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, emc2101_of_match_table);
> +
> +static const unsigned short emc2101_address_list[] = {
> +	0x4c, I2C_CLIENT_END
> +};
> +
Best regards,
Krzysztof
