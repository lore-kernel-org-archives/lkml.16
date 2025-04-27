Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAD12288EA;
	Sun, 27 Apr 2025 01:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745716085; cv=none; b=XETS8W8p1+OpuZxj0Mleen5CW2LtN0J60GLqOI1mJIp1sUA6vGL2duI2/jBoyr/ARPdVjgHjV4BNOpf32NXwLcMH0imLnNTTUE7fyD3PUH1NL9t3vxENXD9ElMvChVwvMSD+PUcrGjDgzgVF2G4RoWLEOnPzK7OZQZyzgimL7xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745716085; c=relaxed/simple;
	bh=Eg83GBAPa8swUL/mhgXWbev1gNQmfsjgXb00ZfYlWDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c5vHRNKo0ZF3iJioi8mRq/fH/xZTPl4UJrg4ZOB4cLJ4A3Oy/e9JY7r5+PyIXEcTcU2GdyQIUNFjrupAMHasKoqecObI4v9+0MEUTmcA4eclcbTm4RK8/Sx0zZ7Oy0ogvdQbubGR0lpcgT20fjS+ZaJljU5FYS7LPZchPdx32JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=YT1S2MB+; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="YT1S2MB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1745716070; x=1746320870; i=w_armin@gmx.de;
	bh=phRj6pqNADKZGNhDA+KKR1JUG3P3sbdGaOjVlUaE1UM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YT1S2MB+kTyZTUrv/fZopX39124a4/lLWjtVwY5mQGTKrhBIUPTh3ybqEbJKXr1H
	 mu8pPQPRV4HKHcdtEbl9J4dx/33B+GM9zW+6+pNwnUn7i7eGNuqgP12AcpDAArAJ8
	 d6mrlX/J0QGr1qgDM+Nm9lrpMArCKswUu1xBbbCn5fE1uTUHKtNTtzNADtOnBuynB
	 NvbKge7TxAfWT0ynLZJnMTsDRbA22IhBRjblVlMXEeUXvD4niZZHUKgjbfTaDee9/
	 vMvozReDuSzSZIO3PzkM6NrQN+oY+ckAA86tf2zv4Y3WnQrfYdao7RZmLQnYNgMkg
	 FB+872dMtTPsO0GEPw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0oBr-1v2cRn2QhJ-013Dzq; Sun, 27
 Apr 2025 03:07:50 +0200
Message-ID: <e10a3487-f768-4873-a468-7bd2160a325a@gmx.de>
Date: Sun, 27 Apr 2025 03:07:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: alienware-wmi-wmax: Expose GPIO debug
 methods
To: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Gabriel Marcano <gabemarcano@yahoo.com>,
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20250423-awcc-gpio-v1-0-160a11bc3f9a@gmail.com>
 <20250423-awcc-gpio-v1-1-160a11bc3f9a@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250423-awcc-gpio-v1-1-160a11bc3f9a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:juidhLbjNmFhA8uMamFSTJmvanlNPcW3U9ZrzLdW+fWHOEBCzYv
 CVVDoZP8/ZHB8dIYxqXblCEiHYhNMmDBw9zk4WASV/FrvbQHStDdxbV+1209XWFQaKeHp3b
 NJZg3gYxKDxmkqU2xt0jyxN9zbBHxUlmlYWUKQcomjd9BSmZnuU70Mo1FW4iCXil7tDuQee
 eFq/xDpq0x2wM6zEkg/tQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1y+1vTDUyA0=;6VeXIoZatnROQnud0bM+J9HuAyW
 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
 musQ=

Am 23.04.25 um 09:49 schrieb Kurt Borja:

> Devices with the AWCC interface come with a USB RGB-lighting STM32 MCU,
> which has two GPIO pins with debug capabilities:
>
>   - Device Firmware Update mode (DFU)
>   - Negative Reset (NRST)
>
> The WMAX device has methods to toggle or read the state of these GPIO
> pins. Expose these methods through DebugFS, hidden behind an unsafe
> module parameter to avoid common users from toying with these without
> consideration.
>
> Suggested-by: Gabriel Marcano <gabemarcano@yahoo.com>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi-wmax.c | 116 +++++++++++++++++=
+++++++-
>   1 file changed, 115 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pl=
atform/x86/dell/alienware-wmi-wmax.c
> index faeddfe3b79e0aa51e7c8c6b23aa4ac5c7218706..2e83be02d7c5f8ca8176f1ec=
39d9929790da0844 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -38,6 +38,9 @@
>   #define AWCC_METHOD_GET_FAN_SENSORS		0x13
>   #define AWCC_METHOD_THERMAL_INFORMATION		0x14
>   #define AWCC_METHOD_THERMAL_CONTROL		0x15
> +#define AWCC_METHOD_FWUP_GPIO_CONTROL		0x20
> +#define AWCC_METHOD_READ_TOTAL_GPIOS		0x21
> +#define AWCC_METHOD_READ_GPIO_STATUS		0x22
>   #define AWCC_METHOD_GAME_SHIFT_STATUS		0x25
>  =20
>   #define AWCC_FAILURE_CODE			0xFFFFFFFF
> @@ -65,6 +68,10 @@ static bool force_gmode;
>   module_param_unsafe(force_gmode, bool, 0);
>   MODULE_PARM_DESC(force_gmode, "Forces G-Mode when performance profile =
is selected");
>  =20
> +static bool gpio_debug;
> +module_param_unsafe(gpio_debug, bool, 0);
> +MODULE_PARM_DESC(gpio_debug, "Exposes GPIO debug methods to DebugFS");

Hi,

personally i thing that you can drop this module parameter. People using D=
ebugFS should
already know that they need to be careful.

Other than that:
Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +
>   struct awcc_quirks {
>   	bool hwmon;
>   	bool pprof;
> @@ -217,6 +224,11 @@ enum AWCC_TEMP_SENSOR_TYPES {
>   	AWCC_TEMP_SENSOR_GPU			=3D 0x06,
>   };
>  =20
> +enum AWCC_GPIO_PINS {
> +	AWCC_GPIO_PIN_DFU			=3D 0x00,
> +	AWCC_GPIO_PIN_NRST			=3D 0x01,
> +};
> +
>   enum awcc_thermal_profile {
>   	AWCC_PROFILE_USTT_BALANCED,
>   	AWCC_PROFILE_USTT_BALANCED_PERFORMANCE,
> @@ -571,6 +583,38 @@ static int awcc_thermal_information(struct wmi_devi=
ce *wdev, u8 operation, u8 ar
>   	return awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args,=
 out);
>   }
>  =20
> +static int awcc_fwup_gpio_control(struct wmi_device *wdev, u8 pin, u8 s=
tatus)
> +{
> +	struct wmax_u32_args args =3D {
> +		.operation =3D pin,
> +		.arg1 =3D status,
> +		.arg2 =3D 0,
> +		.arg3 =3D 0,
> +	};
> +	u32 out;
> +
> +	return awcc_wmi_command(wdev, AWCC_METHOD_FWUP_GPIO_CONTROL, &args, &o=
ut);
> +}
> +
> +static int awcc_read_total_gpios(struct wmi_device *wdev, u32 *count)
> +{
> +	struct wmax_u32_args args =3D {};
> +
> +	return awcc_wmi_command(wdev, AWCC_METHOD_READ_TOTAL_GPIOS, &args, cou=
nt);
> +}
> +
> +static int awcc_read_gpio_status(struct wmi_device *wdev, u8 pin, u32 *=
status)
> +{
> +	struct wmax_u32_args args =3D {
> +		.operation =3D pin,
> +		.arg1 =3D 0,
> +		.arg2 =3D 0,
> +		.arg3 =3D 0,
> +	};
> +
> +	return awcc_wmi_command(wdev, AWCC_METHOD_READ_GPIO_STATUS, &args, sta=
tus);
> +}
> +
>   static int awcc_game_shift_status(struct wmi_device *wdev, u8 operatio=
n,
>   				  u32 *out)
>   {
> @@ -1318,6 +1362,63 @@ static int awcc_debugfs_pprof_data_read(struct se=
q_file *seq, void *data)
>   	return 0;
>   }
>  =20
> +static int awcc_debugfs_total_gpios_read(struct seq_file *seq, void *da=
ta)
> +{
> +	struct device *dev =3D seq->private;
> +	struct wmi_device *wdev =3D to_wmi_device(dev);
> +	u32 count;
> +	int ret;
> +
> +	ret =3D awcc_read_total_gpios(wdev, &count);
> +	if (ret)
> +		return ret;
> +
> +	seq_printf(seq, "%u\n", count);
> +
> +	return 0;
> +}
> +
> +static int awcc_gpio_pin_show(struct seq_file *seq, void *data)
> +{
> +	unsigned long pin =3D debugfs_get_aux_num(seq->file);
> +	struct wmi_device *wdev =3D seq->private;
> +	u32 status;
> +	int ret;
> +
> +	ret =3D awcc_read_gpio_status(wdev, pin, &status);
> +	if (ret)
> +		return ret;
> +
> +	seq_printf(seq, "%u\n", status);
> +
> +	return 0;
> +}
> +
> +static ssize_t awcc_gpio_pin_write(struct file *file, const char __user=
 *buf,
> +				   size_t count, loff_t *ppos)
> +{
> +	unsigned long pin =3D debugfs_get_aux_num(file);
> +	struct seq_file *seq =3D file->private_data;
> +	struct wmi_device *wdev =3D seq->private;
> +	bool status;
> +	int ret;
> +
> +	if (!ppos || *ppos)
> +		return -EINVAL;
> +
> +	ret =3D kstrtobool_from_user(buf, count, &status);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D awcc_fwup_gpio_control(wdev, pin, status);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +DEFINE_SHOW_STORE_ATTRIBUTE(awcc_gpio_pin);
> +
>   static void awcc_debugfs_remove(void *data)
>   {
>   	struct dentry *root =3D data;
> @@ -1327,7 +1428,7 @@ static void awcc_debugfs_remove(void *data)
>  =20
>   static void awcc_debugfs_init(struct wmi_device *wdev)
>   {
> -	struct dentry *root;
> +	struct dentry *root, *gpio_ctl;
>   	char name[64];
>  =20
>   	scnprintf(name, sizeof(name), "%s-%s", "alienware-wmi", dev_name(&wde=
v->dev));
> @@ -1344,6 +1445,19 @@ static void awcc_debugfs_init(struct wmi_device *=
wdev)
>   		debugfs_create_devm_seqfile(&wdev->dev, "pprof_data", root,
>   					    awcc_debugfs_pprof_data_read);
>  =20
> +	if (gpio_debug) {
> +		gpio_ctl =3D debugfs_create_dir("gpio_ctl", root);
> +
> +		debugfs_create_devm_seqfile(&wdev->dev, "total_gpios", gpio_ctl,
> +					    awcc_debugfs_total_gpios_read);
> +		debugfs_create_file_aux_num("dfu_pin", 0644, gpio_ctl, wdev,
> +					    AWCC_GPIO_PIN_DFU,
> +					    &awcc_gpio_pin_fops);
> +		debugfs_create_file_aux_num("nrst_pin", 0644, gpio_ctl, wdev,
> +					    AWCC_GPIO_PIN_NRST,
> +					    &awcc_gpio_pin_fops);
> +	}
> +
>   	devm_add_action_or_reset(&wdev->dev, awcc_debugfs_remove, root);
>   }
>  =20
>
