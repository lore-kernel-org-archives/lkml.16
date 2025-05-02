Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E6B26AD9;
	Fri,  2 May 2025 01:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746149880; cv=none; b=j2M6+EokjXAQlv01U+DYgWjiYZP32NoJKvrvDN1NwslLQoopjMnvd6Hipjwqzk3FCx0cIePRFQTerM65BpV5nZ+Iy1yawGrylYndtctfndjugf2kizB+C/DUYAFV+YyMwePc+sPKDsnrai3M0eLMc0EAZj6ZFp9lL9AOx/YZKh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746149880; c=relaxed/simple;
	bh=U1YZoTYU0oSk4M4uAxmBAFVDwk9foIGSoq4giOEXiU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxWCTdNbvdJiOdZwiOF9F7DBeb+0czVPUOhLcBFTg56BTmYNPkSCW0ISNwEdaG1k0AI7MdWaQljtQx0Lbt9imAZp6Y5bboe2AqqwaplQr1mIas/ID08j1Wg495F0DtFzJluOeqRc2biridffpC4R8FPO0ojeRG9h61nEuTgtBkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=H98/lmzk; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="H98/lmzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746149861; x=1746754661; i=w_armin@gmx.de;
	bh=CIP25n9KZtzpMB70ULxQ12OQY1fnXyet8hEZwhqxBIg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=H98/lmzkACHW3giXScZQQjfC552X2h4+FFr+V6Y+dXgpbFhhrMEIQ/59fGDijr+C
	 VVgAD33nHs9Eow9FyIJYu0Rq4TDH2EdmSmngBtMwXXEh52PBJV7WzZj2/i5EZA5nv
	 AxGZ97Fg3/p4FYjPVDj52h4aLtV1NvC59Sv62EIc2058zyr0KQ57fJauu8mGTaM+l
	 2Xl/Old4OTJHjcjLgGXRVN6oNkmDlybOdBYAFqj3ESHvfotYogBpXkm9c4CMi5xh4
	 HJ1+BaLqCkD50TIPiWSzPG+vcDYGNah6Fr/HI728T2BWtFaAgdsZ0s2BKwqVDLVO3
	 FzykwYyeGKfbgpr1tg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSKy8-1udJ4X2JLM-00HlK1; Fri, 02
 May 2025 03:37:41 +0200
Message-ID: <a9ca01aa-5be8-4cdf-a109-f7ccd766bcf8@gmx.de>
Date: Fri, 2 May 2025 03:37:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86: alienware-wmi-wmax: Expose GPIO
 debug methods
To: kuurtb@gmail.com, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Gabriel Marcano <gabemarcano@yahoo.com>,
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20250427-awcc-gpio-v2-0-c731373b5d02@gmail.com>
 <20250427-awcc-gpio-v2-1-c731373b5d02@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250427-awcc-gpio-v2-1-c731373b5d02@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ctdDQCnnPQ9M+TgTeouHx6/lZ6rSsA7o43hlkaHkaLySy2fhFuL
 VM7kZrStTyakloF/9Kgu/6ZddswmfhaVz7gCob1dArMzP7bhf7aNP9PVu7UA85FRA+34pu8
 rvvAxvP73yhaBQBISrf2wfWjCE3nEUSU5zz2ryF8G5FRJ6v25VakPWdAaqkjr9B0OqzY/qf
 JCxMkVFDFFr5fyc1Y7Scg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Nr9Siux5SIA=;UfTcaI8AuGyUp116sYWAaVwxXHK
 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
 5c6SEgCmtvgPP2xxNTPnmatkp

Am 27.04.25 um 08:24 schrieb Kurt Borja via B4 Relay:

> From: Kurt Borja <kuurtb@gmail.com>
>
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
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   Documentation/ABI/testing/debugfs-alienware-wmi |  20 +++++
>   drivers/platform/x86/dell/alienware-wmi-wmax.c  | 108 ++++++++++++++++=
+++++++-
>   2 files changed, 127 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/debugfs-alienware-wmi b/Documenta=
tion/ABI/testing/debugfs-alienware-wmi
> index 48cfd4d0b002efd7b68d9c1d3aa91a3a05f49db5..d20b8627ac5f1528396549a8=
1481e26889bc410e 100644
> --- a/Documentation/ABI/testing/debugfs-alienware-wmi
> +++ b/Documentation/ABI/testing/debugfs-alienware-wmi
> @@ -42,3 +42,23 @@ Description:
>   		details.
>  =20
>   		RO
> +
> +What:		/sys/kernel/debug/alienware-wmi-<wmi_device_name>/gpio_ctl/total=
_gpios
> +Date:		May 2025
> +KernelVersion:	6.16
> +Contact:	Kurt Borja <kuurtb@gmail.com>
> +Description:
> +		Total number of GPIO pins reported by the device.
> +
> +		RO
> +
> +What:		/sys/kernel/debug/alienware-wmi-<wmi_device_name>/gpio_ctl/<pin_=
name>_pin
> +Date:		May 2025
> +KernelVersion:	6.16
> +Contact:	Kurt Borja <kuurtb@gmail.com>
> +Description:
> +		This file controls <pin_name> status.
> +
> +		See Documentation/wmi/devices/alienware-wmi.rst for details.
> +
> +		RW
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pl=
atform/x86/dell/alienware-wmi-wmax.c
> index faeddfe3b79e0aa51e7c8c6b23aa4ac5c7218706..8e682427580a629f48530d7c=
926db4587352c04c 100644
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
> @@ -217,6 +220,11 @@ enum AWCC_TEMP_SENSOR_TYPES {
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
> @@ -571,6 +579,38 @@ static int awcc_thermal_information(struct wmi_devi=
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
> @@ -1318,6 +1358,63 @@ static int awcc_debugfs_pprof_data_read(struct se=
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
> @@ -1327,7 +1424,7 @@ static void awcc_debugfs_remove(void *data)
>  =20
>   static void awcc_debugfs_init(struct wmi_device *wdev)
>   {
> -	struct dentry *root;
> +	struct dentry *root, *gpio_ctl;
>   	char name[64];
>  =20
>   	scnprintf(name, sizeof(name), "%s-%s", "alienware-wmi", dev_name(&wde=
v->dev));
> @@ -1344,6 +1441,15 @@ static void awcc_debugfs_init(struct wmi_device *=
wdev)
>   		debugfs_create_devm_seqfile(&wdev->dev, "pprof_data", root,
>   					    awcc_debugfs_pprof_data_read);
>  =20
> +	gpio_ctl =3D debugfs_create_dir("gpio_ctl", root);
> +
> +	debugfs_create_devm_seqfile(&wdev->dev, "total_gpios", gpio_ctl,
> +				    awcc_debugfs_total_gpios_read);
> +	debugfs_create_file_aux_num("dfu_pin", 0644, gpio_ctl, wdev,
> +				    AWCC_GPIO_PIN_DFU, &awcc_gpio_pin_fops);
> +	debugfs_create_file_aux_num("nrst_pin", 0644, gpio_ctl, wdev,
> +				    AWCC_GPIO_PIN_NRST, &awcc_gpio_pin_fops);

I just noticed: what happens if the total number of GPIOs is greater than/=
lower than 2?

Maybe you could instead name the debugfs files pinX with X being the pin n=
umber. Then you just
have to create the debugfs files inside a for loop.

What do you thing?

Thanks,
Armin Wolf

> +
>   	devm_add_action_or_reset(&wdev->dev, awcc_debugfs_remove, root);
>   }
>  =20
>
