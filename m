Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7AB1F4180;
	Tue, 13 May 2025 20:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747169929; cv=none; b=lx6PBNWPONU1GnldQyGWcYFKl+3BHoQxB++ZpZNbd77YyIeSFGXxKN6BTXDYFY7jBDser6IF3yXC39RnzmMyU+JVFB05DK6MxvZEMQfB1fkUZ4iG6i4mUkUSzB9UuqA2ecoIYmCaxdJjPLrCUw88NTE8vdAvnNWAsm7JfS6AzRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747169929; c=relaxed/simple;
	bh=G+dL2lmJCmTlnb/VZYUNtrzP7hbXL5e6ydE+pwbnTig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sRf95EpW5UOHZsJPGGc0kmmtYSkWSALYP9ZA4LeeqBwPYxMdX41peZE8mQcmPTHhAtyQTHa/CeXrwz3N6X7MnxRG8cLWUTcdfA6hwXg6Mp1I6t0g9ArYom23cU9a/tZz1X4emyerXw3NO2Xda5r2E+fGBGiUsFKxrhRmJoWtkL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=BVym6ytl; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="BVym6ytl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747169922; x=1747774722; i=w_armin@gmx.de;
	bh=oeMlP+t9JIZfrGi5LOdL+/KuE3L+G6ybrsw58/4uSn4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BVym6ytlMd9EOcDDIOyYHwTQWLJ6G3K5xVray8o0iNdmddaZ8dDiEcLfSK0QzQA3
	 zBu8sngiUbH+MZ5aNVvAw8XqzY1t0plausuOWsUUKs/SNbdYKRe/lilOSRExnP85j
	 SDVUONCQZX9nmFgy2dcodn57yDoidQAQzFHyoBW98ooeuz7IYOUZf/rOxUUR3qznj
	 DKhSXD6zSrYb1fxxnQNrMDkzGRdRLAD8fxJAru+llB4JPIeyKZM24kV7vldeFzsFh
	 jkGU22yFHQELbfwz4KYYTMy0t+flEnGUjZsMvCTgOXcHpOmCJGMPmMWX9Tu8XRVKu
	 mfd+OtvTyuBUZbRKLA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVN6j-1uO3gD0Ijv-00TxDj; Tue, 13
 May 2025 22:58:42 +0200
Message-ID: <f4ef43c4-db8d-4722-b286-b82877ca202c@gmx.de>
Date: Tue, 13 May 2025 22:58:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] platform/x86: msi-wmi-platform: Add support for
 fan control
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Kurt Borja <kuurtb@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-5-lkml@antheas.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250511204427.327558-5-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nHhGyRMdLz6AKqN6nTH0eYL+r/Lod9HkIk8Wc+BP86rQrr9Znsh
 cxGPo5n58jmvRnGK80cjqAQL7ENkS1Qhc5OLNBmRGEIsHZqSv4Jd/AUpjHRtuuAsiGPL34k
 vD2PGsJKwJOw8JbT/UxD+VROll43RmNTUf3egqSSgXotBOFR6XWlQtiGzxpFuGRpVaeonTw
 LQcf/Bj2dEhHzZXpnEHrA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vjqdk0KmXMU=;V1uUkDc4dzWT2oUPop5zk8xIN9j
 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
 UsgAQsawjgqaCq6O45Cfua/CI+hI3LsZir

Am 11.05.25 um 22:44 schrieb Antheas Kapenekakis:

> From: Armin Wolf <W_Armin@gmx.de>
>
> Adds fan curve support for the MSI platform. These devices contain
> support for two fans, where they are named CPU and GPU but in the
> case of the Claw series just map to left and right fan.

I assume that not all devices support this feature? If so then please hide=
 it behind
a quirk.

Thanks,
Armin Wolf

> Co-developed-by: Antheas Kapenekakis <lkml@antheas.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   .../wmi/devices/msi-wmi-platform.rst          |  26 ++
>   drivers/platform/x86/msi-wmi-platform.c       | 328 +++++++++++++++++-
>   2 files changed, 337 insertions(+), 17 deletions(-)
>
> diff --git a/Documentation/wmi/devices/msi-wmi-platform.rst b/Documentat=
ion/wmi/devices/msi-wmi-platform.rst
> index 73197b31926a5..704bfdac5203e 100644
> --- a/Documentation/wmi/devices/msi-wmi-platform.rst
> +++ b/Documentation/wmi/devices/msi-wmi-platform.rst
> @@ -169,6 +169,32 @@ The fan RPM readings can be calculated with the fol=
lowing formula:
>  =20
>   If the fan speed reading is zero, then the fan RPM is zero too.
>  =20
> +The subfeature ``0x01`` is used to retrieve the fan speed table for the=
 CPU fan. The output
> +data contains the fan speed table and two bytes with unknown data. The =
fan speed table
> +consists of six 8-bit entries, each containing a fan speed value in per=
cent.
> +
> +The subfeature ``0x02`` is used tho retrieve the same data for the GPU =
fan.
> +
> +WMI method Set_Fan()
> +--------------------
> +
> +The fan speed tables can be accessed using subfeature ``0x01`` (CPU fan=
) and subfeature ``0x02``
> +(GPU fan). The input data has the same format as the output data of the=
 ``Get_Fan`` WMI method.
> +
> +WMI method Get_AP()
> +-------------------
> +
> +The current fan mode can be accessed using subfeature ``0x01``. The out=
put data contains a flag
> +byte and two bytes of unknown data. If the 7th bit inside the flag byte=
 is cleared then all fans
> +are operating in automatic mode, otherwise the fans operate based on th=
e fan speed tables
> +accessible thru the ``Get_Fan``/``Set_Fan`` WMI methods.
> +
> +WMI method Set_AP()
> +-------------------
> +
> +The current fan mode can be changed using subfeature ``0x01``. The inpu=
t data has the same format
> +as the output data of the ``Get_AP`` WMI method.
> +
>   WMI method Get_WMI()
>   --------------------
>  =20
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/=
x86/msi-wmi-platform.c
> index 408d42ab19e20..9ac3c6f1b3f1d 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -16,13 +16,18 @@
>   #include <linux/device/driver.h>
>   #include <linux/dmi.h>
>   #include <linux/errno.h>
> +#include <linux/fixp-arith.h>
>   #include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
>   #include <linux/kernel.h>
> +#include <linux/kstrtox.h>
> +#include <linux/minmax.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
>   #include <linux/printk.h>
>   #include <linux/rwsem.h>
>   #include <linux/string.h>
> +#include <linux/sysfs.h>
>   #include <linux/types.h>
>   #include <linux/wmi.h>
>  =20
> @@ -34,9 +39,11 @@
>  =20
>   #define MSI_WMI_PLATFORM_INTERFACE_VERSION	2
>  =20
> +/* Get_WMI() WMI method */
>   #define MSI_PLATFORM_WMI_MAJOR_OFFSET	1
>   #define MSI_PLATFORM_WMI_MINOR_OFFSET	2
>  =20
> +/* Get_EC() and Set_EC() WMI methods */
>   #define MSI_PLATFORM_EC_FLAGS_OFFSET	1
>   #define MSI_PLATFORM_EC_MINOR_MASK	GENMASK(3, 0)
>   #define MSI_PLATFORM_EC_MAJOR_MASK	GENMASK(5, 4)
> @@ -44,6 +51,18 @@
>   #define MSI_PLATFORM_EC_IS_TIGERLAKE	BIT(7)
>   #define MSI_PLATFORM_EC_VERSION_OFFSET	2
>  =20
> +/* Get_Fan() and Set_Fan() WMI methods */
> +#define MSI_PLATFORM_FAN_SUBFEATURE_FAN_SPEED		0x0
> +#define MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE	0x1
> +#define MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE	0x2
> +#define MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE	0x1
> +#define MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE	0x2
> +
> +/* Get_AP() and Set_AP() WMI methods */
> +#define MSI_PLATFORM_AP_SUBFEATURE_FAN_MODE	0x1
> +#define MSI_PLATFORM_AP_FAN_FLAGS_OFFSET	1
> +#define MSI_PLATFORM_AP_ENABLE_FAN_TABLES	BIT(7)
> +
>   static bool force;
>   module_param_unsafe(force, bool, 0);
>   MODULE_PARM_DESC(force, "Force loading without checking for supported =
WMI interface versions");
> @@ -221,9 +240,201 @@ static int msi_wmi_platform_query(struct msi_wmi_p=
latform_data *data,
>   	}
>   }
>  =20
> +static ssize_t msi_wmi_platform_fan_table_show(struct device *dev, stru=
ct device_attribute *attr,
> +					       char *buf)
> +{
> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr)=
;
> +	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
> +	u8 buffer[32] =3D { sattr->nr };
> +	u8 fan_percent;
> +	int ret;
> +
> +	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, buffer, siz=
eof(buffer));
> +	if (ret < 0)
> +		return ret;
> +
> +	fan_percent =3D buffer[sattr->index + 1];
> +	if (fan_percent > 100)
> +		return -EIO;
> +
> +	return sysfs_emit(buf, "%d\n", fixp_linear_interpolate(0, 0, 100, 255,=
 fan_percent));
> +}
> +
> +static ssize_t msi_wmi_platform_fan_table_store(struct device *dev, str=
uct device_attribute *attr,
> +						const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr)=
;
> +	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
> +	u8 buffer[32] =3D { sattr->nr };
> +	long speed;
> +	int ret;
> +
> +	ret =3D kstrtol(buf, 10, &speed);
> +	if (ret < 0)
> +		return ret;
> +
> +	speed =3D clamp_val(speed, 0, 255);
> +
> +	guard(mutex)(&data->wmi_lock);
> +
> +	ret =3D msi_wmi_platform_query_unlocked(data, MSI_PLATFORM_GET_FAN,
> +					      buffer, sizeof(buffer));
> +	if (ret < 0)
> +		return ret;
> +
> +	buffer[0] =3D sattr->nr;
> +	buffer[sattr->index + 1] =3D fixp_linear_interpolate(0, 0, 255, 100, s=
peed);
> +
> +	ret =3D msi_wmi_platform_query_unlocked(data, MSI_PLATFORM_SET_FAN,
> +					      buffer, sizeof(buffer));
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t msi_wmi_platform_temp_table_show(struct device *dev, str=
uct device_attribute *attr,
> +						char *buf)
> +{
> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr)=
;
> +	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
> +	u8 buffer[32] =3D { sattr->nr };
> +	u8 temp_c;
> +	int ret;
> +
> +	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_TEMPERATURE,
> +				     buffer, sizeof(buffer));
> +	if (ret < 0)
> +		return ret;
> +
> +	temp_c =3D buffer[sattr->index + 1];
> +
> +	return sysfs_emit(buf, "%d\n", temp_c);
> +}
> +
> +static ssize_t msi_wmi_platform_temp_table_store(struct device *dev, st=
ruct device_attribute *attr,
> +						 const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr)=
;
> +	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
> +	u8 buffer[32] =3D { sattr->nr };
> +	long temp_c;
> +	int ret;
> +
> +	ret =3D kstrtol(buf, 10, &temp_c);
> +	if (ret < 0)
> +		return ret;
> +
> +	temp_c =3D clamp_val(temp_c, 0, 255);
> +
> +	guard(mutex)(&data->wmi_lock);
> +
> +	ret =3D msi_wmi_platform_query_unlocked(data, MSI_PLATFORM_GET_TEMPERA=
TURE,
> +					      buffer, sizeof(buffer));
> +	if (ret < 0)
> +		return ret;
> +
> +	buffer[0] =3D sattr->nr;
> +	buffer[sattr->index + 1] =3D temp_c;
> +
> +	ret =3D msi_wmi_platform_query_unlocked(data, MSI_PLATFORM_SET_TEMPERA=
TURE,
> +					      buffer, sizeof(buffer));
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point1_temp, msi_wmi_platform_=
temp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE, 0x0);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point2_temp, msi_wmi_platform_=
temp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE, 0x3);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point3_temp, msi_wmi_platform_=
temp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE, 0x4);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point4_temp, msi_wmi_platform_=
temp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE, 0x5);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point5_temp, msi_wmi_platform_=
temp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE, 0x6);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point6_temp, msi_wmi_platform_=
temp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE, 0x7);
> +
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point1_pwm, msi_wmi_platform_f=
an_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE, 0x1);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point2_pwm, msi_wmi_platform_f=
an_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE, 0x2);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point3_pwm, msi_wmi_platform_f=
an_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE, 0x3);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point4_pwm, msi_wmi_platform_f=
an_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE, 0x4);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point5_pwm, msi_wmi_platform_f=
an_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE, 0x5);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point6_pwm, msi_wmi_platform_f=
an_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE, 0x6);
> +
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point1_temp, msi_wmi_platform_=
temp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE, 0x0);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point2_temp, msi_wmi_platform_=
temp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE, 0x3);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point3_temp, msi_wmi_platform_=
temp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE, 0x4);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point4_temp, msi_wmi_platform_=
temp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE, 0x5);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point5_temp, msi_wmi_platform_=
temp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE, 0x6);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point6_temp, msi_wmi_platform_=
temp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE, 0x7);
> +
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point1_pwm, msi_wmi_platform_f=
an_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE, 0x1);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point2_pwm, msi_wmi_platform_f=
an_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE, 0x2);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point3_pwm, msi_wmi_platform_f=
an_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE, 0x3);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point4_pwm, msi_wmi_platform_f=
an_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE, 0x4);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point5_pwm, msi_wmi_platform_f=
an_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE, 0x5);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point6_pwm, msi_wmi_platform_f=
an_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE, 0x6);
> +
> +static struct attribute *msi_wmi_platform_hwmon_attrs[] =3D {
> +	&sensor_dev_attr_pwm1_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point6_temp.dev_attr.attr,
> +
> +	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point6_pwm.dev_attr.attr,
> +
> +	&sensor_dev_attr_pwm2_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point6_temp.dev_attr.attr,
> +
> +	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point6_pwm.dev_attr.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(msi_wmi_platform_hwmon);
> +
>   static umode_t msi_wmi_platform_is_visible(const void *drvdata, enum h=
wmon_sensor_types type,
>   					   u32 attr, int channel)
>   {
> +	if (type =3D=3D hwmon_pwm && attr =3D=3D hwmon_pwm_enable)
> +		return 0644;
> +
>   	return 0444;
>   }
>  =20
> @@ -233,24 +444,102 @@ static int msi_wmi_platform_read(struct device *d=
ev, enum hwmon_sensor_types typ
>   	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
>   	u8 buffer[32] =3D { 0 };
>   	u16 value;
> +	u8 flags;
>   	int ret;
>  =20
> -	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, buf, sizeof=
(buf));
> -	if (ret < 0)
> -		return ret;
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			buffer[0] =3D MSI_PLATFORM_FAN_SUBFEATURE_FAN_SPEED;
> +			ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, buffer,
> +						     sizeof(buffer));
> +			if (ret < 0)
> +				return ret;
> +
> +			value =3D get_unaligned_be16(&buffer[channel * 2 + 1]);
> +			if (!value)
> +				*val =3D 0;
> +			else
> +				*val =3D 480000 / value;
> +
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_enable:
> +			buffer[0] =3D MSI_PLATFORM_AP_SUBFEATURE_FAN_MODE;
> +			ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_AP, buffer,
> +						     sizeof(buffer));
> +			if (ret < 0)
> +				return ret;
> +
> +			flags =3D buffer[MSI_PLATFORM_AP_FAN_FLAGS_OFFSET];
> +			if (flags & MSI_PLATFORM_AP_ENABLE_FAN_TABLES)
> +				*val =3D 1;
> +			else
> +				*val =3D 2;
> +
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
>  =20
> -	value =3D get_unaligned_be16(&buffer[channel * 2 + 1]);
> -	if (!value)
> -		*val =3D 0;
> -	else
> -		*val =3D 480000 / value;
> +static int msi_wmi_platform_write(struct device *dev, enum hwmon_sensor=
_types type, u32 attr,
> +				  int channel, long val)
> +{
> +	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
> +	u8 buffer[32] =3D { };
> +	int ret;
>  =20
> -	return 0;
> +	switch (type) {
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_enable:
> +			guard(mutex)(&data->wmi_lock);
> +
> +			buffer[0] =3D MSI_PLATFORM_AP_SUBFEATURE_FAN_MODE;
> +			ret =3D msi_wmi_platform_query_unlocked(
> +				data, MSI_PLATFORM_GET_AP, buffer,
> +				sizeof(buffer));
> +			if (ret < 0)
> +				return ret;
> +
> +			buffer[0] =3D MSI_PLATFORM_AP_SUBFEATURE_FAN_MODE;
> +			switch (val) {
> +			case 1:
> +				buffer[MSI_PLATFORM_AP_FAN_FLAGS_OFFSET] |=3D
> +					MSI_PLATFORM_AP_ENABLE_FAN_TABLES;
> +				break;
> +			case 2:
> +				buffer[MSI_PLATFORM_AP_FAN_FLAGS_OFFSET] &=3D
> +					~MSI_PLATFORM_AP_ENABLE_FAN_TABLES;
> +				break;
> +			default:
> +				return -EINVAL;
> +			}
> +
> +			return msi_wmi_platform_query_unlocked(
> +				data, MSI_PLATFORM_SET_AP, buffer,
> +				sizeof(buffer));
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
>   }
>  =20
>   static const struct hwmon_ops msi_wmi_platform_ops =3D {
>   	.is_visible =3D msi_wmi_platform_is_visible,
>   	.read =3D msi_wmi_platform_read,
> +	.write =3D msi_wmi_platform_write,
>   };
>  =20
>   static const struct hwmon_channel_info * const msi_wmi_platform_info[]=
 =3D {
> @@ -260,6 +549,10 @@ static const struct hwmon_channel_info * const msi_=
wmi_platform_info[] =3D {
>   			   HWMON_F_INPUT,
>   			   HWMON_F_INPUT
>   			   ),
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_ENABLE,
> +			   HWMON_PWM_ENABLE
> +			   ),
>   	NULL
>   };
>  =20
> @@ -268,8 +561,8 @@ static const struct hwmon_chip_info msi_wmi_platform=
_chip_info =3D {
>   	.info =3D msi_wmi_platform_info,
>   };
>  =20
> -static ssize_t msi_wmi_platform_write(struct file *fp, const char __use=
r *input, size_t length,
> -				      loff_t *offset)
> +static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const ch=
ar __user *input,
> +					      size_t length, loff_t *offset)
>   {
>   	struct seq_file *seq =3D fp->private_data;
>   	struct msi_wmi_platform_debugfs_data *data =3D seq->private;
> @@ -303,7 +596,7 @@ static ssize_t msi_wmi_platform_write(struct file *f=
p, const char __user *input,
>   	return length;
>   }
>  =20
> -static int msi_wmi_platform_show(struct seq_file *seq, void *p)
> +static int msi_wmi_platform_debugfs_show(struct seq_file *seq, void *p)
>   {
>   	struct msi_wmi_platform_debugfs_data *data =3D seq->private;
>   	int ret;
> @@ -315,19 +608,19 @@ static int msi_wmi_platform_show(struct seq_file *=
seq, void *p)
>   	return ret;
>   }
>  =20
> -static int msi_wmi_platform_open(struct inode *inode, struct file *fp)
> +static int msi_wmi_platform_debugfs_open(struct inode *inode, struct fi=
le *fp)
>   {
>   	struct msi_wmi_platform_debugfs_data *data =3D inode->i_private;
>  =20
>   	/* The seq_file uses the last byte of the buffer for detecting buffer=
 overflows */
> -	return single_open_size(fp, msi_wmi_platform_show, data, data->length =
+ 1);
> +	return single_open_size(fp, msi_wmi_platform_debugfs_show, data, data-=
>length + 1);
>   }
>  =20
>   static const struct file_operations msi_wmi_platform_debugfs_fops =3D =
{
>   	.owner =3D THIS_MODULE,
> -	.open =3D msi_wmi_platform_open,
> +	.open =3D msi_wmi_platform_debugfs_open,
>   	.read =3D seq_read,
> -	.write =3D msi_wmi_platform_write,
> +	.write =3D msi_wmi_platform_debugfs_write,
>   	.llseek =3D seq_lseek,
>   	.release =3D single_release,
>   };
> @@ -389,7 +682,8 @@ static int msi_wmi_platform_hwmon_init(struct msi_wm=
i_platform_data *data)
>   	struct device *hdev;
>  =20
>   	hdev =3D devm_hwmon_device_register_with_info(&data->wdev->dev, "msi_=
wmi_platform", data,
> -						    &msi_wmi_platform_chip_info, NULL);
> +						    &msi_wmi_platform_chip_info,
> +						    msi_wmi_platform_hwmon_groups);
>  =20
>   	return PTR_ERR_OR_ZERO(hdev);
>   }
