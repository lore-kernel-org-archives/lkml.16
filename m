Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D672A79F2;
	Sun, 27 Apr 2025 06:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745734898; cv=none; b=s6Ic616r1Je4E5LBb5atRwmOjzz4wU2+mrBt9jKWSY1WosN5GCLWDQ0/DWTG7m62WPJVn+YwzkBQtjxJevGcUSbv5nvg7hF1nqxgQWAuaZZ+68qLFFn4c7SX+nCj9G/NKpQhptoHCYBU9o0BIyjwpaG8fAGrGuVZ79WsMb98JTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745734898; c=relaxed/simple;
	bh=MQZrMoCO1OAuwTL/n9V+JzZCsfVeC4aTqtoOU5uCMWg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=U48+laEt7nC2cUCEevCaCqQAkR68RSLC6hL7XyXwitFHbPQgk/LTlalnWQE5pJ1GukPu0A5fNe25P7wTtTg1qJAx8Gw2Zhst6/6E+YqE0m9cqhCXiXHYLq4Wa0MNYKgqi8DrQ9XSp+0UvR8GUwQDDnZgnjxK+ucCtpWqURtRfdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmJo7uxl; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmJo7uxl"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736b34a71a1so4397283b3a.0;
        Sat, 26 Apr 2025 23:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745734896; x=1746339696; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+d11Mg8FjxGgjpOSABbPHxId1G+yHMmgIgF8dt7mqRw=;
        b=GmJo7uxl3sxtuPiuYdN16euj5IrCaqapREUAqJ3nEQ6Qv/rKJEHLuoOSBHqHJgZxgC
         8PuPeHQfydFOFXKe+zrkr1ygNj7+QFccPmF1LdMxisxJtLCIB4wbKjnjv20UMhr3nncJ
         Z8DQvw8mGzHwJB5CoLsomD3F+o8MptGbsHuUIXg6NsKlU/7JC0zIyDGizRb2gJWF9I3a
         aSKIY4gK90gmbG9kzWl8Kt9YKvc9RWE+lj5uRyu+YAEVnymbbIYOKdAMWZs/sA93vFtu
         Pp9E8Tg/n7JfEz/jdPmP0P0J/wKBKEB0U6VV+PZUubFkeJTM58js2z3RzsVdem/YGVB7
         NIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745734896; x=1746339696;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+d11Mg8FjxGgjpOSABbPHxId1G+yHMmgIgF8dt7mqRw=;
        b=cOUIUlCTuHVmH2s7j20zSwcSFNE9/Et+v3Myy6KqnlU5sRNnaJ9909FGobPZg/y2rk
         Pas6sWNaqb6u6wWi5IQMJqmhQIB87c8Mg814SUFPk/ORpqNB28PYlXjwNeebheYltH54
         EUxJQAMImpX9rY7Om1GtsJ/Mn8cTT63t1473ric4pgHZPWUX9CwViR4I6PgcqY+Gb/mr
         L5kcBlgXv0p/uYtg36NdRMdBSZXKBXsvzCmShFDnFpRSzlHAsV+rCuSN4lRQsvPEQQzy
         RrDXbDH4Ljc+xl1N/RvJUC6fI2wOR+TJ/XxOH+OmtdfuD5OsGrRSZlJTj3K9SFosNHhO
         DMOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYPNpPcnGQPklIOwHzpV6mrwtawcAgv2ldL9PamZGi0uJiTR77Sgj2TubJsrDC5pgRP5lsYpGfaK1OVKY=@vger.kernel.org, AJvYcCWgoyIZ54tt7IA/875WIsCTU0LN7YbqPkbgXPKt3iKt+lzsNDbqho2WGWRNwoPotpOOHwTEcK5OA5qC2rJV0BBSA980zA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4vHghxVp5YZJWv6u8zl8SSa7+5Bagmfr8t47TVj/H7Doht7I/
	CZl1VQP79dsXdCgq7a2qvIywTSUgCEvNWd0/ZmkS0Ql9qgs4V5nq
X-Gm-Gg: ASbGncudQIZURyYnmCJmWbfBviH5j8B3gxFLqhk5dRzaW/hrHbVKtZNj804j6Hn/AJN
	FAaHDkez9BlCBFniRGJOuxGfFRBlASR05xGzBt3y4E+MbYmctryJfPHN1WJv57iwl8eXNnn9N2t
	UMghSCgoYUQesJijKTFvQvCUrRpBwDfQ2lhdd83NHrsnkpHBDZMVUxiPawSLCqbZKZgGcIXCq8Z
	SfZlTGXHC/kXmuLPUn24e7sDuOMwgcBvvVAJhXiVX9AVorqN1n6PsByVKIiPZd5+4o418M/GbNY
	3olyPSXDw3eNW2I+oqohZwT/N0AO1I+R7g==
X-Google-Smtp-Source: AGHT+IEsnLW50BlD5CyWfjGErwIhZiqFOFsbAEVBkMxkkFB5fZqdp0yMeMY7uSSO6CKrkslG6IWHIA==
X-Received: by 2002:a05:6a20:c90d:b0:1f5:5b2a:f629 with SMTP id adf61e73a8af0-2046a6930a2mr7066159637.30.1745734896214;
        Sat, 26 Apr 2025 23:21:36 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9a0f1sm5905750b3a.137.2025.04.26.23.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 23:21:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Apr 2025 03:21:33 -0300
Message-Id: <D9H7DEEL3415.3HLF6NNF4EYCF@gmail.com>
Cc: "Gabriel Marcano" <gabemarcano@yahoo.com>,
 <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] platform/x86: alienware-wmi-wmax: Expose GPIO debug
 methods
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Armin Wolf" <W_Armin@gmx.de>, "Hans de Goede" <hdegoede@redhat.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250423-awcc-gpio-v1-0-160a11bc3f9a@gmail.com>
 <20250423-awcc-gpio-v1-1-160a11bc3f9a@gmail.com>
 <e10a3487-f768-4873-a468-7bd2160a325a@gmx.de>
In-Reply-To: <e10a3487-f768-4873-a468-7bd2160a325a@gmx.de>

On Sat Apr 26, 2025 at 10:07 PM -03, Armin Wolf wrote:
> Am 23.04.25 um 09:49 schrieb Kurt Borja:
>
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
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>   drivers/platform/x86/dell/alienware-wmi-wmax.c | 116 +++++++++++++++++=
+++++++-
>>   1 file changed, 115 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pl=
atform/x86/dell/alienware-wmi-wmax.c
>> index faeddfe3b79e0aa51e7c8c6b23aa4ac5c7218706..2e83be02d7c5f8ca8176f1ec=
39d9929790da0844 100644
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
>> @@ -65,6 +68,10 @@ static bool force_gmode;
>>   module_param_unsafe(force_gmode, bool, 0);
>>   MODULE_PARM_DESC(force_gmode, "Forces G-Mode when performance profile =
is selected");
>>  =20
>> +static bool gpio_debug;
>> +module_param_unsafe(gpio_debug, bool, 0);
>> +MODULE_PARM_DESC(gpio_debug, "Exposes GPIO debug methods to DebugFS");
>
> Hi,

Hi Armin,

>
> personally i thing that you can drop this module parameter. People using =
DebugFS should
> already know that they need to be careful.

I sure hope so. I know I was not careful when I started tinkering :p

I agree though, I'll drop it and follow your documentation suggestions.

>
> Other than that:
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>

Thanks a lot!

--=20
 ~ Kurt

>
>> +
>>   struct awcc_quirks {
>>   	bool hwmon;
>>   	bool pprof;
>> @@ -217,6 +224,11 @@ enum AWCC_TEMP_SENSOR_TYPES {
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
>> @@ -571,6 +583,38 @@ static int awcc_thermal_information(struct wmi_devi=
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
>> @@ -1318,6 +1362,63 @@ static int awcc_debugfs_pprof_data_read(struct se=
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
>> @@ -1327,7 +1428,7 @@ static void awcc_debugfs_remove(void *data)
>>  =20
>>   static void awcc_debugfs_init(struct wmi_device *wdev)
>>   {
>> -	struct dentry *root;
>> +	struct dentry *root, *gpio_ctl;
>>   	char name[64];
>>  =20
>>   	scnprintf(name, sizeof(name), "%s-%s", "alienware-wmi", dev_name(&wde=
v->dev));
>> @@ -1344,6 +1445,19 @@ static void awcc_debugfs_init(struct wmi_device *=
wdev)
>>   		debugfs_create_devm_seqfile(&wdev->dev, "pprof_data", root,
>>   					    awcc_debugfs_pprof_data_read);
>>  =20
>> +	if (gpio_debug) {
>> +		gpio_ctl =3D debugfs_create_dir("gpio_ctl", root);
>> +
>> +		debugfs_create_devm_seqfile(&wdev->dev, "total_gpios", gpio_ctl,
>> +					    awcc_debugfs_total_gpios_read);
>> +		debugfs_create_file_aux_num("dfu_pin", 0644, gpio_ctl, wdev,
>> +					    AWCC_GPIO_PIN_DFU,
>> +					    &awcc_gpio_pin_fops);
>> +		debugfs_create_file_aux_num("nrst_pin", 0644, gpio_ctl, wdev,
>> +					    AWCC_GPIO_PIN_NRST,
>> +					    &awcc_gpio_pin_fops);
>> +	}
>> +
>>   	devm_add_action_or_reset(&wdev->dev, awcc_debugfs_remove, root);
>>   }
>>  =20
>>

