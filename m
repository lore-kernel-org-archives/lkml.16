Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51C5253324;
	Fri,  2 May 2025 07:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746171413; cv=none; b=BqIkP5s85BZTo4L+z83QDJcEV2sN7aNyYbCJF45JPFKtk/tVaoA1cmnq08Pr0tMpKriHpRX0ajVzJbpPBKuxevtl5jaDC7ezhZKDQgD6HU/eIoKvounO5elxMRwJiFqrY4u/KxMCT0yWGN8JAc27cfFsuWCkOfgrw0wP6Mrex6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746171413; c=relaxed/simple;
	bh=roFlnpVaOkJRnUKk2TAT4NVwJTBwEKsaK9SclVDAaME=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PNhxyi+K4jLfIr9gUoI+QMhcAF8QyH3R6kIWGVHdXeLQbKNxHV4l7RK6693CHHUz2CCrUz4TjrwcbJtoBjHOAhNce5xpGv/G3W2UlkgjnTWvdqJnnFMHoMB6+BBgrgxnZ5irwLKvBxyGxiIJFRFWD9wntgDa+FTbfbxWhhF3j/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2KLyeLK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2KLyeLK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224191d92e4so17825595ad.3;
        Fri, 02 May 2025 00:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746171411; x=1746776211; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fqjEGtmGoJf2sbtZ/i9zfGJzB3lbn9+UF5slCDp0fc=;
        b=O2KLyeLKQ/bhl1MQEGDGJTveIw7IuhZRDHBRS/NqxgOh1OZsg4sQ6/3+/HvFgcMm4g
         c16rJQt6aPovGL52R1KFiqyBhBz6o6Pc+F+IX9lPckHrr7LikNR2cZGvzz9gANodZAxz
         +ngtm69bTg9FINcqGxQOfEuAKN2j25iTkt/kzaP3b0Zyn2upO8Fm5SIQkjIQUr3z20TQ
         WCZWtT0FsGXrIW0TtlMvq3wwFepcRehIjn/HAmAk2K1A03ipzASCXeX/Ptysjg+Yj3Wj
         DvAsfMIynVAi4+9jXXdzZXctjCqGqxCFXLiNQi0rMvI9nZZelIQ4R2y3CEJh6UmbH8f+
         4UyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746171411; x=1746776211;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3fqjEGtmGoJf2sbtZ/i9zfGJzB3lbn9+UF5slCDp0fc=;
        b=EV3bU6otg1qaYFK2LJkGb7ZGawQfQrUfkHQyHlC2Iw5+Tg0+HfuTVQlYkjng3VZeYO
         fRMcRRivZ+Yq6uC/lHM8gevAZNZ4z+ymDW+VrTt61VKU4fgDyioWEgzUMEDxa+uaY/tg
         k23qb4tcA0XgvSwlEZplQYHOxjNPPEqzf90t7m+DE48hCTddz7Mr3kPO0XpgCC4zCTK0
         k/XzH64BdtdSLhP0EkLc/4q4bddvMtzBgxskjnr34hJs8uPYaY6VyJG5Eo3ivPoeDESR
         86JcjzJrI9mquWFV5xVGgrDLnffu04YvdZDHGWOy6+g5CwA2FE1T0Q/74uttjf/vt7YU
         VIeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG2oc0H4KNFyd3tw3de/ZyDKcppjR56wyPhxvGKkUvofy018Dkj2uMt7fBGj63h9xDaqhvSBcKXws2kw0=@vger.kernel.org, AJvYcCXG83OWv2x6/QGzIPU89HMeuRwrUUgzX6rkgy+FS4Pr897QGhBCKIORVN1g/F2ERn4Lqcm+dFPOhB4sMeF+n99ZXX5JvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaAxjwC/6EGeh3ooB61b4JqmDkNSkxB4VcTEW+cz1JzYw+wmHX
	lKcZt5Bile/kI9pTSuIKYXEMdDMyu4RqytjTZTTxqwdqAo5dqC1x
X-Gm-Gg: ASbGncvGUJ/YuHUzenYxEd70tTg62orJCw/OmtI8VuwHLayRxPXyqql3lpH+NpbeDAC
	puqCbiDcRlrzJQkITh6Ur9w2268+qpaG1JUFxk4eXlVpptV99mdAQoEnjc/G4n5OqHoQ1mY1DaE
	EVtFbC7kup4XSryUZMr/R9wzmWvYowyG3Oj02Sb/TTciceijI1QlEgbs8Bsuxrrm49eJDcgYLOR
	W+QTHRqRTCS657atEEnPryTSdItOTHl8GcfF0e8bVuhB0yL/0qAs6XJXX2wezgnVGeNcXA8UHYT
	Uxqzi3YQeFynmiBPwdXnqyKPp/kAy3+RgQ==
X-Google-Smtp-Source: AGHT+IG/4H+GqeLnM2l4L6jewkwUSurUhYTiaRifBzDge4EGNYHqSABVhAH8TjJ+b8YVWT8qHxEMkQ==
X-Received: by 2002:a17:903:1aef:b0:224:2384:5b40 with SMTP id d9443c01a7336-22e10329baamr35199505ad.24.1746171410809;
        Fri, 02 May 2025 00:36:50 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150eae99sm1241925ad.19.2025.05.02.00.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 00:36:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 May 2025 04:36:47 -0300
Message-Id: <D9LI3QJTLK0T.2D8JGFI6XRJD4@gmail.com>
Cc: "Gabriel Marcano" <gabemarcano@yahoo.com>,
 <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] platform/x86: alienware-wmi-wmax: Expose GPIO
 debug methods
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Armin Wolf" <W_Armin@gmx.de>, "Hans de Goede" <hdegoede@redhat.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250427-awcc-gpio-v2-0-c731373b5d02@gmail.com>
 <20250427-awcc-gpio-v2-1-c731373b5d02@gmail.com>
 <a9ca01aa-5be8-4cdf-a109-f7ccd766bcf8@gmx.de>
In-Reply-To: <a9ca01aa-5be8-4cdf-a109-f7ccd766bcf8@gmx.de>

On Thu May 1, 2025 at 10:37 PM -03, Armin Wolf wrote:
> Am 27.04.25 um 08:24 schrieb Kurt Borja via B4 Relay:
>
>> From: Kurt Borja <kuurtb@gmail.com>
>>
>> Devices with the AWCC interface come with a USB RGB-lighting STM32 MCU,
>> which has two GPIO pins with debug capabilities:
>>
>>   - Device Firmware Update mode (DFU)
>>   - Negative Reset (NRST)
>>
>> The WMAX device has methods to toggle or read the state of these GPIO
>> pins. Expose these methods through DebugFS, hidden behind an unsafe
>> module parameter to avoid common users from toying with these without
>> consideration.
>>
>> Suggested-by: Gabriel Marcano <gabemarcano@yahoo.com>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>   Documentation/ABI/testing/debugfs-alienware-wmi |  20 +++++
>>   drivers/platform/x86/dell/alienware-wmi-wmax.c  | 108 ++++++++++++++++=
+++++++-
>>   2 files changed, 127 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/debugfs-alienware-wmi b/Documenta=
tion/ABI/testing/debugfs-alienware-wmi
>> index 48cfd4d0b002efd7b68d9c1d3aa91a3a05f49db5..d20b8627ac5f1528396549a8=
1481e26889bc410e 100644
>> --- a/Documentation/ABI/testing/debugfs-alienware-wmi
>> +++ b/Documentation/ABI/testing/debugfs-alienware-wmi
>> @@ -42,3 +42,23 @@ Description:
>>   		details.
>>  =20
>>   		RO
>> +
>> +What:		/sys/kernel/debug/alienware-wmi-<wmi_device_name>/gpio_ctl/total=
_gpios
>> +Date:		May 2025
>> +KernelVersion:	6.16
>> +Contact:	Kurt Borja <kuurtb@gmail.com>
>> +Description:
>> +		Total number of GPIO pins reported by the device.
>> +
>> +		RO
>> +
>> +What:		/sys/kernel/debug/alienware-wmi-<wmi_device_name>/gpio_ctl/<pin_=
name>_pin
>> +Date:		May 2025
>> +KernelVersion:	6.16
>> +Contact:	Kurt Borja <kuurtb@gmail.com>
>> +Description:
>> +		This file controls <pin_name> status.
>> +
>> +		See Documentation/wmi/devices/alienware-wmi.rst for details.
>> +
>> +		RW
>> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pl=
atform/x86/dell/alienware-wmi-wmax.c
>> index faeddfe3b79e0aa51e7c8c6b23aa4ac5c7218706..8e682427580a629f48530d7c=
926db4587352c04c 100644
>> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
>> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
>> @@ -38,6 +38,9 @@
>>   #define AWCC_METHOD_GET_FAN_SENSORS		0x13
>>   #define AWCC_METHOD_THERMAL_INFORMATION		0x14
>>   #define AWCC_METHOD_THERMAL_CONTROL		0x15
>> +#define AWCC_METHOD_FWUP_GPIO_CONTROL		0x20
>> +#define AWCC_METHOD_READ_TOTAL_GPIOS		0x21
>> +#define AWCC_METHOD_READ_GPIO_STATUS		0x22
>>   #define AWCC_METHOD_GAME_SHIFT_STATUS		0x25
>>  =20
>>   #define AWCC_FAILURE_CODE			0xFFFFFFFF
>> @@ -217,6 +220,11 @@ enum AWCC_TEMP_SENSOR_TYPES {
>>   	AWCC_TEMP_SENSOR_GPU			=3D 0x06,
>>   };
>>  =20
>> +enum AWCC_GPIO_PINS {
>> +	AWCC_GPIO_PIN_DFU			=3D 0x00,
>> +	AWCC_GPIO_PIN_NRST			=3D 0x01,
>> +};
>> +
>>   enum awcc_thermal_profile {
>>   	AWCC_PROFILE_USTT_BALANCED,
>>   	AWCC_PROFILE_USTT_BALANCED_PERFORMANCE,
>> @@ -571,6 +579,38 @@ static int awcc_thermal_information(struct wmi_devi=
ce *wdev, u8 operation, u8 ar
>>   	return awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args,=
 out);
>>   }
>>  =20
>> +static int awcc_fwup_gpio_control(struct wmi_device *wdev, u8 pin, u8 s=
tatus)
>> +{
>> +	struct wmax_u32_args args =3D {
>> +		.operation =3D pin,
>> +		.arg1 =3D status,
>> +		.arg2 =3D 0,
>> +		.arg3 =3D 0,
>> +	};
>> +	u32 out;
>> +
>> +	return awcc_wmi_command(wdev, AWCC_METHOD_FWUP_GPIO_CONTROL, &args, &o=
ut);
>> +}
>> +
>> +static int awcc_read_total_gpios(struct wmi_device *wdev, u32 *count)
>> +{
>> +	struct wmax_u32_args args =3D {};
>> +
>> +	return awcc_wmi_command(wdev, AWCC_METHOD_READ_TOTAL_GPIOS, &args, cou=
nt);
>> +}
>> +
>> +static int awcc_read_gpio_status(struct wmi_device *wdev, u8 pin, u32 *=
status)
>> +{
>> +	struct wmax_u32_args args =3D {
>> +		.operation =3D pin,
>> +		.arg1 =3D 0,
>> +		.arg2 =3D 0,
>> +		.arg3 =3D 0,
>> +	};
>> +
>> +	return awcc_wmi_command(wdev, AWCC_METHOD_READ_GPIO_STATUS, &args, sta=
tus);
>> +}
>> +
>>   static int awcc_game_shift_status(struct wmi_device *wdev, u8 operatio=
n,
>>   				  u32 *out)
>>   {
>> @@ -1318,6 +1358,63 @@ static int awcc_debugfs_pprof_data_read(struct se=
q_file *seq, void *data)
>>   	return 0;
>>   }
>>  =20
>> +static int awcc_debugfs_total_gpios_read(struct seq_file *seq, void *da=
ta)
>> +{
>> +	struct device *dev =3D seq->private;
>> +	struct wmi_device *wdev =3D to_wmi_device(dev);
>> +	u32 count;
>> +	int ret;
>> +
>> +	ret =3D awcc_read_total_gpios(wdev, &count);
>> +	if (ret)
>> +		return ret;
>> +
>> +	seq_printf(seq, "%u\n", count);
>> +
>> +	return 0;
>> +}
>> +
>> +static int awcc_gpio_pin_show(struct seq_file *seq, void *data)
>> +{
>> +	unsigned long pin =3D debugfs_get_aux_num(seq->file);
>> +	struct wmi_device *wdev =3D seq->private;
>> +	u32 status;
>> +	int ret;
>> +
>> +	ret =3D awcc_read_gpio_status(wdev, pin, &status);
>> +	if (ret)
>> +		return ret;
>> +
>> +	seq_printf(seq, "%u\n", status);
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t awcc_gpio_pin_write(struct file *file, const char __user=
 *buf,
>> +				   size_t count, loff_t *ppos)
>> +{
>> +	unsigned long pin =3D debugfs_get_aux_num(file);
>> +	struct seq_file *seq =3D file->private_data;
>> +	struct wmi_device *wdev =3D seq->private;
>> +	bool status;
>> +	int ret;
>> +
>> +	if (!ppos || *ppos)
>> +		return -EINVAL;
>> +
>> +	ret =3D kstrtobool_from_user(buf, count, &status);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D awcc_fwup_gpio_control(wdev, pin, status);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +DEFINE_SHOW_STORE_ATTRIBUTE(awcc_gpio_pin);
>> +
>>   static void awcc_debugfs_remove(void *data)
>>   {
>>   	struct dentry *root =3D data;
>> @@ -1327,7 +1424,7 @@ static void awcc_debugfs_remove(void *data)
>>  =20
>>   static void awcc_debugfs_init(struct wmi_device *wdev)
>>   {
>> -	struct dentry *root;
>> +	struct dentry *root, *gpio_ctl;
>>   	char name[64];
>>  =20
>>   	scnprintf(name, sizeof(name), "%s-%s", "alienware-wmi", dev_name(&wde=
v->dev));
>> @@ -1344,6 +1441,15 @@ static void awcc_debugfs_init(struct wmi_device *=
wdev)
>>   		debugfs_create_devm_seqfile(&wdev->dev, "pprof_data", root,
>>   					    awcc_debugfs_pprof_data_read);
>>  =20
>> +	gpio_ctl =3D debugfs_create_dir("gpio_ctl", root);
>> +
>> +	debugfs_create_devm_seqfile(&wdev->dev, "total_gpios", gpio_ctl,
>> +				    awcc_debugfs_total_gpios_read);
>> +	debugfs_create_file_aux_num("dfu_pin", 0644, gpio_ctl, wdev,
>> +				    AWCC_GPIO_PIN_DFU, &awcc_gpio_pin_fops);
>> +	debugfs_create_file_aux_num("nrst_pin", 0644, gpio_ctl, wdev,
>> +				    AWCC_GPIO_PIN_NRST, &awcc_gpio_pin_fops);
>
> I just noticed: what happens if the total number of GPIOs is greater than=
/lower than 2?
>
> Maybe you could instead name the debugfs files pinX with X being the pin =
number. Then you just
> have to create the debugfs files inside a for loop.
>
> What do you thing?

Hi Armin,

I was a bit reluctant when I first made the patch because I wanted to
keep things simple.

I haven't seen any laptop with a GPIO count \neq 2, however some
ACPI implementations of this method don't handle invalid values very
well, so I'll take this approach just in case.

Thanks for your comments!

--=20
 ~ Kurt

>
> Thanks,
> Armin Wolf
>
>> +
>>   	devm_add_action_or_reset(&wdev->dev, awcc_debugfs_remove, root);
>>   }
>>  =20
>>

