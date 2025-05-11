Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2321E485;
	Sun, 11 May 2025 23:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747006386; cv=none; b=Hwc63mxda5kIjXHRn1kwmoOK6gM4auPZ8UIPjBUi5lJNuRnFzNQy/dtHl4LdMFHYvWhoefYyfgYm224OReUo+vkf3YChwuZYnj9MbIjEHTq1a67tZg2W2lQH47+SgaazMXMeXLDLX/4DKBYPflJ04Wdw04SULHq14p+SxnZugBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747006386; c=relaxed/simple;
	bh=+x4tZCaiJZUYz5iO1vCvk2bFPh0fSWN3rnuEWbyjg58=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=gL2/9UfR9phIYayQ+7zFP4Sfw8SbamsmWGq+06T6HHMDtYh+MbiXm/bSJ8XVHelOUfvWUth66ZeMB/EY9G2fB2BZg4EQ2h2tH09GmUUsqJzg/c4VRsmFcMopWS8e/Fvl4qcIjuBjR1EzLB9taaAWczQxrxo8hXI0LofurHWRKuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOFyubUW; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOFyubUW"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4ddb32c3787so2572106137.0;
        Sun, 11 May 2025 16:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747006383; x=1747611183; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:cc:to:from:subject
         :message-id:date:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZafnBO0JwI/lTsmozs8BqxlxPr5UFzoAtXAg/CyYH8o=;
        b=IOFyubUWwA69Bn54ScAbghK2MMo9ApnvCiU0zUqPUc1th2zx6O7Mdzi45puFyc2Glx
         x++tI1zVXZBPvvNHLFAqY/O81aAUEREEF58tGBrxTRnU0dM3aCdCe6pjju3540W23f5a
         dRCAsk5q0mv4X8+qUj+NcEzqmcBu8n2KKjk40ByUFYJVVPcxatUlZrbYCVkdpfhWTG7Y
         bmiCZU71biENYRYII1gD/2bJWLJdoMaO60XtR+8X5sgldNAhSHjRP/zd5UJzqIYiGVry
         CMpNHZ91UNi8bCx7DFo14NGX4MO6yMKeoJb1e2m5tzOwCs08qnLZwE+Qh/hjZI0CqWNX
         geEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747006383; x=1747611183;
        h=in-reply-to:references:content-transfer-encoding:cc:to:from:subject
         :message-id:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZafnBO0JwI/lTsmozs8BqxlxPr5UFzoAtXAg/CyYH8o=;
        b=ddZAC8ELMvYgMLT1z99rEb/crchw8g349DaJ3uQsLB4vsZIrhVDHpHO5EMBcunex/P
         0rsQHEuTuQcpPEEU6/1pDssShcyCr7iSXBiFOH4BZAX4LMnBLOlF2HZYZgLC9u55pgjD
         xuEtBsQ8m2RDqtaDZrQlo5eFaR3hr0S6gwMqRgUj7cgnB/poYp7Lbhc5gXbVIs0fS1+g
         vceFi8V+TYXrr2QqtTkZDa1Ol763KZ6IJT+UieeOinnfeSHCiqiQOK65sddC/jpp9Y5/
         wjmaLwiHu6iYuAIkkuK+kBz6IYzZtrNoO2U8SWLcd14EUvotUze0yOZ5eFgBCEG44QWm
         DHFw==
X-Forwarded-Encrypted: i=1; AJvYcCURNpugkigVdRGlNzWj2c1Y7wqeZbqC5i3KmqX37kwPV0YCdZx6qiZRBG0UDVDLcaQiLcUHyiTaBI8=@vger.kernel.org, AJvYcCWgeQ1GHOkrbBjS9gKw8wVlfB/BfUXPfXC8sQVXXod0P7Vmxjda3ajtRpNn3f3G57CotEJPtlXr3AJlh9ddVjy1/P4B+g==@vger.kernel.org, AJvYcCX94GywSI2B4cAxfeW7u7e6pBmjK0nzTW3os/XRxaAB5ncch/la/HdcdQX4V2dfjBQuZVVBVt4haoMi7R7k@vger.kernel.org, AJvYcCXFZ0Hs5thMjZr9O6ioRrunW5lYaXWw9cG7diC0tQnvWnCs+WXVbhXIeyLOAm2Gdxdnb0VTNQUI6wqzsx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl6CVAA/bQuuXdGHozbKQqVyk8U/LYjTBP3ADzO0gwpJrGymVk
	nZBMac9e1mmv+qHIzbolfR0f/0NpCo0YSM0cztmUahG/8l80Dbqh
X-Gm-Gg: ASbGncuo5AjRN7I7bjqzQ54UmdOMQ9LSQYoAAJYoyZEExClwIlct3KL+p7j3HC3F2y4
	SHshdLk1tPlbjFkuSrKRfDIq+HaevQ1grm5gNOdeO74oDc01RduCd+IxNi+2QiU4vSbGt+Qm2yD
	ACjyN8fJzRpUZ8XqtV2YqE5lwdQU4pse/yW6QZ2W2GMxvPjXRhtu2uEiIztaVR8ev9QsyWnhOJZ
	97w4rnlsA1Sj5wdOmDt5HgSSzwBToonnPqwQ+fIAvzEsdLI/ZFSwmXmvMTlopffMwIHkyfV2Puu
	d7tBDAN+Pywakwye6vlC4wI0IBDO8BGb5wMVopdv07Ou
X-Google-Smtp-Source: AGHT+IHeVOyam2IRzPXtOTnQ3VFx/cH55LQWlhLs+Tt7XiXW63H7nvA9nS6MZ3QS52HhVTOlg3q9Rw==
X-Received: by 2002:a67:e893:0:b0:4de:f0c7:e7bd with SMTP id ada2fe7eead31-4def0c7ec9bmr7105018137.8.1747006382928;
        Sun, 11 May 2025 16:33:02 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f6298361sm4405696241.32.2025.05.11.16.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 16:33:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=b950af4e1cb01e685aa2c0e2d7aa61372745bba3dbe5cc8bba2b699e3b70;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 11 May 2025 20:32:58 -0300
Message-Id: <D9TQ2QVT8GCX.TCSHS7VQANRS@gmail.com>
Subject: Re: [PATCH v1 04/10] platform/x86: msi-wmi-platform: Add support
 for fan control
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Antheas Kapenekakis" <lkml@antheas.dev>,
 <platform-driver-x86@vger.kernel.org>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>, "Hans
 de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Jean Delvare" <jdelvare@suse.com>,
 "Guenter Roeck" <linux@roeck-us.net>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-5-lkml@antheas.dev>
In-Reply-To: <20250511204427.327558-5-lkml@antheas.dev>

--b950af4e1cb01e685aa2c0e2d7aa61372745bba3dbe5cc8bba2b699e3b70
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
> From: Armin Wolf <W_Armin@gmx.de>
>
> Adds fan curve support for the MSI platform. These devices contain
> support for two fans, where they are named CPU and GPU but in the
> case of the Claw series just map to left and right fan.
>
> Co-developed-by: Antheas Kapenekakis <lkml@antheas.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  .../wmi/devices/msi-wmi-platform.rst          |  26 ++
>  drivers/platform/x86/msi-wmi-platform.c       | 328 +++++++++++++++++-
>  2 files changed, 337 insertions(+), 17 deletions(-)
>
> diff --git a/Documentation/wmi/devices/msi-wmi-platform.rst b/Documentati=
on/wmi/devices/msi-wmi-platform.rst
> index 73197b31926a5..704bfdac5203e 100644
> --- a/Documentation/wmi/devices/msi-wmi-platform.rst
> +++ b/Documentation/wmi/devices/msi-wmi-platform.rst
> @@ -169,6 +169,32 @@ The fan RPM readings can be calculated with the foll=
owing formula:
> =20
>  If the fan speed reading is zero, then the fan RPM is zero too.
> =20
> +The subfeature ``0x01`` is used to retrieve the fan speed table for the =
CPU fan. The output
> +data contains the fan speed table and two bytes with unknown data. The f=
an speed table
> +consists of six 8-bit entries, each containing a fan speed value in perc=
ent.
> +
> +The subfeature ``0x02`` is used tho retrieve the same data for the GPU f=
an.
> +
> +WMI method Set_Fan()
> +--------------------
> +
> +The fan speed tables can be accessed using subfeature ``0x01`` (CPU fan)=
 and subfeature ``0x02``
> +(GPU fan). The input data has the same format as the output data of the =
``Get_Fan`` WMI method.
> +
> +WMI method Get_AP()
> +-------------------
> +
> +The current fan mode can be accessed using subfeature ``0x01``. The outp=
ut data contains a flag
> +byte and two bytes of unknown data. If the 7th bit inside the flag byte =
is cleared then all fans
> +are operating in automatic mode, otherwise the fans operate based on the=
 fan speed tables
> +accessible thru the ``Get_Fan``/``Set_Fan`` WMI methods.
> +
> +WMI method Set_AP()
> +-------------------
> +
> +The current fan mode can be changed using subfeature ``0x01``. The input=
 data has the same format
> +as the output data of the ``Get_AP`` WMI method.
> +
>  WMI method Get_WMI()
>  --------------------
> =20
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x=
86/msi-wmi-platform.c
> index 408d42ab19e20..9ac3c6f1b3f1d 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -16,13 +16,18 @@
>  #include <linux/device/driver.h>
>  #include <linux/dmi.h>
>  #include <linux/errno.h>
> +#include <linux/fixp-arith.h>
>  #include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
>  #include <linux/kernel.h>
> +#include <linux/kstrtox.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/printk.h>
>  #include <linux/rwsem.h>
>  #include <linux/string.h>
> +#include <linux/sysfs.h>
>  #include <linux/types.h>
>  #include <linux/wmi.h>
> =20
> @@ -34,9 +39,11 @@
> =20
>  #define MSI_WMI_PLATFORM_INTERFACE_VERSION	2
> =20
> +/* Get_WMI() WMI method */
>  #define MSI_PLATFORM_WMI_MAJOR_OFFSET	1
>  #define MSI_PLATFORM_WMI_MINOR_OFFSET	2
> =20
> +/* Get_EC() and Set_EC() WMI methods */
>  #define MSI_PLATFORM_EC_FLAGS_OFFSET	1
>  #define MSI_PLATFORM_EC_MINOR_MASK	GENMASK(3, 0)
>  #define MSI_PLATFORM_EC_MAJOR_MASK	GENMASK(5, 4)
> @@ -44,6 +51,18 @@
>  #define MSI_PLATFORM_EC_IS_TIGERLAKE	BIT(7)
>  #define MSI_PLATFORM_EC_VERSION_OFFSET	2
> =20
> +/* Get_Fan() and Set_Fan() WMI methods */
> +#define MSI_PLATFORM_FAN_SUBFEATURE_FAN_SPEED		0x0
> +#define MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE	0x1
> +#define MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE	0x2
> +#define MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE	0x1
> +#define MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE	0x2

Would be nice to have all these subfeatures described in docs.

> +
> +/* Get_AP() and Set_AP() WMI methods */
> +#define MSI_PLATFORM_AP_SUBFEATURE_FAN_MODE	0x1
> +#define MSI_PLATFORM_AP_FAN_FLAGS_OFFSET	1
> +#define MSI_PLATFORM_AP_ENABLE_FAN_TABLES	BIT(7)
> +
>  static bool force;
>  module_param_unsafe(force, bool, 0);
>  MODULE_PARM_DESC(force, "Force loading without checking for supported WM=
I interface versions");
> @@ -221,9 +240,201 @@ static int msi_wmi_platform_query(struct msi_wmi_pl=
atform_data *data,
>  	}
>  }
> =20
> +static ssize_t msi_wmi_platform_fan_table_show(struct device *dev, struc=
t device_attribute *attr,
> +					       char *buf)
> +{
> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr);
> +	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
> +	u8 buffer[32] =3D { sattr->nr };
> +	u8 fan_percent;
> +	int ret;
> +
> +	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, buffer, size=
of(buffer));
> +	if (ret < 0)
> +		return ret;
> +
> +	fan_percent =3D buffer[sattr->index + 1];
> +	if (fan_percent > 100)
> +		return -EIO;
> +
> +	return sysfs_emit(buf, "%d\n", fixp_linear_interpolate(0, 0, 100, 255, =
fan_percent));
> +}
> +
> +static ssize_t msi_wmi_platform_fan_table_store(struct device *dev, stru=
ct device_attribute *attr,
> +						const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr);
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
> +	buffer[sattr->index + 1] =3D fixp_linear_interpolate(0, 0, 255, 100, sp=
eed);
> +
> +	ret =3D msi_wmi_platform_query_unlocked(data, MSI_PLATFORM_SET_FAN,
> +					      buffer, sizeof(buffer));
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t msi_wmi_platform_temp_table_show(struct device *dev, stru=
ct device_attribute *attr,
> +						char *buf)
> +{
> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr);
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

HWMON ABI specifies temps are given in millidegrees for tempX_*
attributes.

It does not specify anything for `auto_point` attributes, but I think
this should be millidegrees, for consistency.

> +
> +	return sysfs_emit(buf, "%d\n", temp_c);
> +}
> +
> +static ssize_t msi_wmi_platform_temp_table_store(struct device *dev, str=
uct device_attribute *attr,
> +						 const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr);
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
> +	ret =3D msi_wmi_platform_query_unlocked(data, MSI_PLATFORM_GET_TEMPERAT=
URE,
> +					      buffer, sizeof(buffer));
> +	if (ret < 0)
> +		return ret;
> +
> +	buffer[0] =3D sattr->nr;
> +	buffer[sattr->index + 1] =3D temp_c;
> +
> +	ret =3D msi_wmi_platform_query_unlocked(data, MSI_PLATFORM_SET_TEMPERAT=
URE,
> +					      buffer, sizeof(buffer));
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point1_temp, msi_wmi_platform_t=
emp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE, 0x0);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point2_temp, msi_wmi_platform_t=
emp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE, 0x3);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point3_temp, msi_wmi_platform_t=
emp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE, 0x4);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point4_temp, msi_wmi_platform_t=
emp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE, 0x5);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point5_temp, msi_wmi_platform_t=
emp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE, 0x6);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point6_temp, msi_wmi_platform_t=
emp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE, 0x7);
> +
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point1_pwm, msi_wmi_platform_fa=
n_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE, 0x1);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point2_pwm, msi_wmi_platform_fa=
n_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE, 0x2);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point3_pwm, msi_wmi_platform_fa=
n_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE, 0x3);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point4_pwm, msi_wmi_platform_fa=
n_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE, 0x4);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point5_pwm, msi_wmi_platform_fa=
n_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE, 0x5);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point6_pwm, msi_wmi_platform_fa=
n_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE, 0x6);
> +
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point1_temp, msi_wmi_platform_t=
emp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE, 0x0);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point2_temp, msi_wmi_platform_t=
emp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE, 0x3);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point3_temp, msi_wmi_platform_t=
emp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE, 0x4);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point4_temp, msi_wmi_platform_t=
emp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE, 0x5);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point5_temp, msi_wmi_platform_t=
emp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE, 0x6);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point6_temp, msi_wmi_platform_t=
emp_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE, 0x7);
> +
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point1_pwm, msi_wmi_platform_fa=
n_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE, 0x1);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point2_pwm, msi_wmi_platform_fa=
n_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE, 0x2);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point3_pwm, msi_wmi_platform_fa=
n_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE, 0x3);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point4_pwm, msi_wmi_platform_fa=
n_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE, 0x4);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point5_pwm, msi_wmi_platform_fa=
n_table,
> +			       MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE, 0x5);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point6_pwm, msi_wmi_platform_fa=
n_table,
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
>  static umode_t msi_wmi_platform_is_visible(const void *drvdata, enum hwm=
on_sensor_types type,
>  					   u32 attr, int channel)
>  {
> +	if (type =3D=3D hwmon_pwm && attr =3D=3D hwmon_pwm_enable)
> +		return 0644;
> +
>  	return 0444;
>  }
> =20
> @@ -233,24 +444,102 @@ static int msi_wmi_platform_read(struct device *de=
v, enum hwmon_sensor_types typ
>  	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
>  	u8 buffer[32] =3D { 0 };
>  	u16 value;
> +	u8 flags;
>  	int ret;
> =20
> -	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, buf, sizeof(=
buf));
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
> =20
> -	value =3D get_unaligned_be16(&buffer[channel * 2 + 1]);
> -	if (!value)
> -		*val =3D 0;
> -	else
> -		*val =3D 480000 / value;
> +static int msi_wmi_platform_write(struct device *dev, enum hwmon_sensor_=
types type, u32 attr,
> +				  int channel, long val)
> +{
> +	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
> +	u8 buffer[32] =3D { };
> +	int ret;
> =20
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

Broken format on these calls.

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
>  }
> =20
>  static const struct hwmon_ops msi_wmi_platform_ops =3D {
>  	.is_visible =3D msi_wmi_platform_is_visible,
>  	.read =3D msi_wmi_platform_read,
> +	.write =3D msi_wmi_platform_write,
>  };
> =20
>  static const struct hwmon_channel_info * const msi_wmi_platform_info[] =
=3D {
> @@ -260,6 +549,10 @@ static const struct hwmon_channel_info * const msi_w=
mi_platform_info[] =3D {
>  			   HWMON_F_INPUT,
>  			   HWMON_F_INPUT
>  			   ),
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_ENABLE,
> +			   HWMON_PWM_ENABLE
> +			   ),
>  	NULL
>  };
> =20
> @@ -268,8 +561,8 @@ static const struct hwmon_chip_info msi_wmi_platform_=
chip_info =3D {
>  	.info =3D msi_wmi_platform_info,
>  };
> =20
> -static ssize_t msi_wmi_platform_write(struct file *fp, const char __user=
 *input, size_t length,
> -				      loff_t *offset)
> +static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const cha=
r __user *input,

Maybe mention this renames in commit messsage?

--=20
 ~ Kurt

> +					      size_t length, loff_t *offset)
>  {
>  	struct seq_file *seq =3D fp->private_data;
>  	struct msi_wmi_platform_debugfs_data *data =3D seq->private;
> @@ -303,7 +596,7 @@ static ssize_t msi_wmi_platform_write(struct file *fp=
, const char __user *input,
>  	return length;
>  }
> =20
> -static int msi_wmi_platform_show(struct seq_file *seq, void *p)
> +static int msi_wmi_platform_debugfs_show(struct seq_file *seq, void *p)
>  {
>  	struct msi_wmi_platform_debugfs_data *data =3D seq->private;
>  	int ret;
> @@ -315,19 +608,19 @@ static int msi_wmi_platform_show(struct seq_file *s=
eq, void *p)
>  	return ret;
>  }
> =20
> -static int msi_wmi_platform_open(struct inode *inode, struct file *fp)
> +static int msi_wmi_platform_debugfs_open(struct inode *inode, struct fil=
e *fp)
>  {
>  	struct msi_wmi_platform_debugfs_data *data =3D inode->i_private;
> =20
>  	/* The seq_file uses the last byte of the buffer for detecting buffer o=
verflows */
> -	return single_open_size(fp, msi_wmi_platform_show, data, data->length +=
 1);
> +	return single_open_size(fp, msi_wmi_platform_debugfs_show, data, data->=
length + 1);
>  }
> =20
>  static const struct file_operations msi_wmi_platform_debugfs_fops =3D {
>  	.owner =3D THIS_MODULE,
> -	.open =3D msi_wmi_platform_open,
> +	.open =3D msi_wmi_platform_debugfs_open,
>  	.read =3D seq_read,
> -	.write =3D msi_wmi_platform_write,
> +	.write =3D msi_wmi_platform_debugfs_write,
>  	.llseek =3D seq_lseek,
>  	.release =3D single_release,
>  };
> @@ -389,7 +682,8 @@ static int msi_wmi_platform_hwmon_init(struct msi_wmi=
_platform_data *data)
>  	struct device *hdev;
> =20
>  	hdev =3D devm_hwmon_device_register_with_info(&data->wdev->dev, "msi_wm=
i_platform", data,
> -						    &msi_wmi_platform_chip_info, NULL);
> +						    &msi_wmi_platform_chip_info,
> +						    msi_wmi_platform_hwmon_groups);
> =20
>  	return PTR_ERR_OR_ZERO(hdev);
>  }


--b950af4e1cb01e685aa2c0e2d7aa61372745bba3dbe5cc8bba2b699e3b70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaCEzrgAKCRAWYEM49J/U
ZlbZAP9QljaJ2vlpDvif+bPOtAccfbkVWUf8Ojlym9BBTp+AWQD/Q1Jc4plpQ+2B
zYyweeO3OJUMed1cLWOsdGPAMr3eUQI=
=C+8+
-----END PGP SIGNATURE-----

--b950af4e1cb01e685aa2c0e2d7aa61372745bba3dbe5cc8bba2b699e3b70--
