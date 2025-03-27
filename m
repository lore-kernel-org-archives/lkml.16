Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC104A06;
	Thu, 27 Mar 2025 00:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743036076; cv=none; b=luEqoDF1paf21lYxcKTV2ESBlhzKQy8in9UI9igI9wFsWSfH8CEK9DTlSebO9DNg/oraju1LS7Ya6UEGSh8srEsiDgb0EcqZDt4R1CrAmW1lqx94YEh19J+74/lDbey2lRhng6antFJ2hpDIEz190MVmUXNRnv3c9udIzQLKXnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743036076; c=relaxed/simple;
	bh=nllaNRj7tVvsOLwPHnVVoNSVp3iyywc0MTxWLzgVpP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cKossMbyrqxyIdEbMwMB0OacNlGc18o4kSNZchEWrHSp3aO6BkNOtLINPfeHwh1jQYM3CnJ5SbXYi/6xU/FUego5v24Dtd0E18ZoEs+CvGJIKtjI+JlnUT7PLuadhYtGPYFCfXMfFCTjUtZlcJIHPEs2i8efMn/89TfBr7/KvHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=tj1MrFmn; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="tj1MrFmn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1743036047; x=1743640847; i=w_armin@gmx.de;
	bh=3g23WOwiuNk0/Qezc2ROuc/+Usnh12tpZK//8LkSNw8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tj1MrFmnXI6l5iZQ6ZSB5aiW7eZTTowieAb1jeep+F1OLpmRroiIvOkGWadXLWwm
	 Ebz5bbfqfIG6TsWNzXPSXsJf0hQker3eKCbD/Nuo/0k0aBMwLZ/40hRlWyWsbBJ38
	 IyVeBJ/6guO74dwUoLDr6tTe3x9YUGkPO71DxwN6iUE387zQQ3jl53UEt5ajvU2L5
	 i0kRF4uR6pNJ06JmoZqko2YN8772H45UFECaq+L1IDlyXLcB7PlndOQNCwZP1uXmG
	 xOmG0IIyRgvjTEbWdMU62vgt0UDNKEHScjs8WeIxXcRwQ2NWhB4djdk1Apvu7ppCw
	 2XIru+Z/VZn7Z8ZOzg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKGZ-1tvgZD3im1-009vtd; Thu, 27
 Mar 2025 01:40:47 +0100
Message-ID: <24e1ed43-9095-4489-9b21-4d619fc5d62b@gmx.de>
Date: Thu, 27 Mar 2025 01:40:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6 RESEND] platform/x86: Add lenovo-wmi-helpers
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250317144326.5850-1-derekjohn.clark@gmail.com>
 <20250317144326.5850-3-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250317144326.5850-3-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vo2T7FcHdAWCtTik5M2ZETajAik4WgkutIwnGtbu/feLMObhYPi
 F8j5Pxiol8eQShAgHkC7q6IW/GPOO186eSRAXCaiu7oKpASGZZ8jDWZMH8pCl9XCKw3+40i
 zoXyDa2sp1sNU+M+fHWo4EXH79rkJOTdDWlZi/poD5OZGvgNRgadyNknggcZqh0dDzinM8q
 IFNv1TzAHLv4c0MlwADig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hIpP5qqiw4I=;2DH0qwwxXwcVb1bfpRA6Qpi5Ygv
 to2ULXh+El8RYhhKVpdH+jFMrPvfTYGcWK0kFO/VFLNxQB9ADSM5Ee/j9sljLIX4+JmuVPCvV
 9ZDquxHr8AvISRzHm0+/yPJ/RVQBz7SLP4TSVO1Lqoh/rv8/L1stPVaCSiJZ+4e295QqkCSEt
 08dio0CvzsUE2Rp0mq27bzsHUUYGaS6HxgtDHaYTRh6QsN4J8LxHh7dki541+7ETjTTmKjahK
 l6JLWaOigAr+ELepulD32HX+IAIJ8Qn1aGmaGA6nnDcp6LaiG6w5bstINHvKnrpDSmpKpsg2s
 qMVf2v4WMy+Brh+3kvffoTRlNHud3fJde/N5rGLPZXIY+aIyPMG9vaRmvn0eZqqFgK72qBT4N
 EHXeEBwjI3ksMNNmzqW9nDIfY51HzA/OReUFevwirP+nSjLip6BM0NfwOZXKabA0L1Ulg9eTW
 g/rXnmxEfPUUNdm9+7U3xXK6s/CAh/tScowFOAB4Bh5NvaTnI5yGeD7mfo38RDOX4lR1/NrkJ
 SQe87xoDkj8fLguy5jzmwMSZ0cefgVE/wUwleyv+VeftWSqpZgNHrzfZJTJB0+LiHB0PKGzM2
 IbUgn2UbKtoFw50iup01+4GHmnpT384hfyeMoyOonmGGCgxprMNU+xuC/0Jeo53ur3LQdqwzR
 7ft7zR0goP50NrI3MxxZUcgcpjOJijdxqY9m4475rb4d6PDqxCv/36qXJWevRCFzS9N1G6Mhg
 B0Xd45pudkHjs0A7Wx5QCWAaMSLJ0UT7qcDvdffUhegdKD3+72T+7G68vQ6aiNndlyTObIXMr
 erstCZINdLemI91E1GHTuY0gcmAAqFpvEidk4ITtAT8ViBQUOETcAxHPb4d1iRSx3pjM69/xX
 szFa5+Q6zXEPfn9C7BjQvPNYYzCLSzMosqpgqt9lWYKYcrpN620r0HVbTITTtCpiZRpZ5Do6c
 ePCxfIgX4nZ1s5MzOIP2pnGetMEtgSVEPERWovGsUHS0Sc6iabeaDoNfRWD5lg42CjYnOusqq
 ihK0/SwZortZzrWKsJS9E3h/HWcO5D06ayZsRuT1rqQpjX7H/UjmEn/UYRVvuzGAjL7gbmtuC
 1o4nvRWbOhVF4ExYfE5kqmf8suFsBIBWx6JjhRC5VnM3xKrM9aLrCVXuvveNVGRdZ3NFEdoim
 1cvkmIpkiFFL4YjIee3AnrJtXaVle4Z6F8Mz0s6CFMrpOHkMDrcfaXz8cALDG/YbuoQirUfAU
 RJ0XeooK1W2HFqSNepslwBhCYwmy2+1+bGSakcqRQLpUlugrGBhWJrd//UVcREyyva3Zl8+9j
 7Qb/eM25+/Y1HQwNHCypK3HT7D9lHrreJ/OnRG1nkjdZi7QVpDPNiaJAz3WxNlajlKsDYHN+r
 riIv/08WNg/hHaGSlCNblrLPB7tPdIHD7xVty+Ve9tmLhCnnnMyb1sCHP6Ep4zEa3763CYGPs
 VMR4OOz3n6NiZkzKR3VfryKKPMpw=

Am 17.03.25 um 15:43 schrieb Derek J. Clark:

> Adds documentation for all new lenovo-wmi drivers.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v4:
>   - Changed namespace to LENOVO_WMI_HELPERS from LENOVO_WMI.
>   - Changed filenames to lenovo-wmi-helpers from lenovo-wmi.
>   - Removed structs and functions implemented by other drivers.
> ---
>   MAINTAINERS                               |  2 +
>   drivers/platform/x86/Kconfig              |  4 ++
>   drivers/platform/x86/Makefile             |  1 +
>   drivers/platform/x86/lenovo-wmi-helpers.c | 64 +++++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-helpers.h | 24 +++++++++
>   5 files changed, 95 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 675f4b26426d..3a370a18b806 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13164,6 +13164,8 @@ L:	platform-driver-x86@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>   F:	Documentation/wmi/devices/lenovo-wmi-other.rst
> +F:	drivers/platform/x86/lenovo-wmi-helpers.c
> +F:	drivers/platform/x86/lenovo-wmi-helpers.h
>
>   LENOVO WMI HOTKEY UTILITIES DRIVER
>   M:	Jackie Dong <xy-jackie@139.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 43407e76476b..bece1ba61417 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -459,6 +459,10 @@ config IBM_RTL
>   	 state =3D 0 (BIOS SMIs on)
>   	 state =3D 1 (BIOS SMIs off)
>
> +config LENOVO_WMI_HELPERS
> +	tristate
> +	depends on ACPI_WMI
> +
>   config IDEAPAD_LAPTOP
>   	tristate "Lenovo IdeaPad Laptop Extras"
>   	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index 650dfbebb6c8..5a9f4e94f78b 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi.o
>   obj-$(CONFIG_YOGABOOK)		+=3D lenovo-yogabook.o
>   obj-$(CONFIG_YT2_1380)		+=3D lenovo-yoga-tab2-pro-1380-fastcharger.o
>   obj-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D lenovo-wmi-camera.o
> +obj-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D lenovo-wmi-helpers.o
>
>   # Intel
>   obj-y				+=3D intel/
> diff --git a/drivers/platform/x86/lenovo-wmi-helpers.c b/drivers/platfor=
m/x86/lenovo-wmi-helpers.c
> new file mode 100644
> index 000000000000..36d553502223
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-helpers.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Legion WMI helpers driver. The Lenovo Legion WMI interface is
> + * broken up into multiple GUID interfaces that require cross-reference=
s
> + * between GUID's for some functionality. The "Custom Method" interface=
 is a
> + * legacy interface for managing and displaying CPU & GPU power and hwm=
on
> + * settings and readings. The "Other Mode" interface is a modern interf=
ace
> + * that replaces or extends the "Custom Method" interface methods. The
> + * "Gamezone" interface adds advanced features such as fan profiles and
> + * overclocking. The "Lighting" interface adds control of various statu=
s
> + * lights related to different hardware components. Each of these drive=
rs
> + * uses a common procedure to get data fro the WMI interface, enumerate=
d here.
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + *
> + */
> +
> +#include <linux/wmi.h>

Hi,

please also include linux/acpi.h, linux/cleanup.h, linux/errno.h, linux/mo=
dule.h and linux/export.h.

> +#include "lenovo-wmi-helpers.h"
> +
> +/*

Please make sure that the doc comments are valid kernel doc comments, see =
https://docs.kernel.org/doc-guide/kernel-doc.html
for details. For example please make sure that the comments start with a "=
/**".

It would also be nice if you actually describe the purpose of each functio=
n.

> + * lwmi_dev_evaluate_method() - Helper function to call wmidev_evaluate=
_method
> + * for Lenovo WMI device method calls that return an ACPI integer.
> + * @wdev: Pointer to the WMI device to be called.
> + * @instance: Instance of the called method.
> + * @method_id: WMI Method ID for the method to be called.
> + * @buf: Buffer of all arguments for the given method_id.
> + * @size: Length of the buffer.
> + * @retval: Pointer for the return value to be assigned.
> + *
> + * Returns: 0, or an error.
> + */
> +int lwmi_dev_evaluate_method(struct wmi_device *wdev, u8 instance,
> +			     u32 method_id, unsigned char *buf, size_t size,
> +			     u32 *retval)
> +{
> +	struct acpi_buffer input =3D { size, buf };

Reverse X-mas tree declaration order please.

Thanks,
Armin Wolf

> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *ret_obj __free(kfree) =3D NULL;
> +	acpi_status status;
> +
> +	status =3D wmidev_evaluate_method(wdev, instance, method_id, &input,
> +					&output);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	if (retval) {
> +		ret_obj =3D output.pointer;
> +		if (!ret_obj)
> +			return -ENODATA;
> +
> +		if (ret_obj->type !=3D ACPI_TYPE_INTEGER)
> +			return -ENXIO;
> +
> +		*retval =3D (u32)ret_obj->integer.value;
> +	}
> +	return 0;
> +};
> +EXPORT_SYMBOL_NS_GPL(lwmi_dev_evaluate_method, "LENOVO_WMI_HELPERS");
> +
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo WMI Helpers Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi-helpers.h b/drivers/platfor=
m/x86/lenovo-wmi-helpers.h
> new file mode 100644
> index 000000000000..7e0d7870790e
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-helpers.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + *
> + */
> +#include <linux/notifier.h>
> +#include <linux/platform_profile.h>
> +
> +#ifndef _LENOVO_WMI_HELPERS_H_
> +#define _LENOVO_WMI_HELPERS_H_
> +
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +struct wmi_method_args_32 {
> +	u32 arg0;
> +	u32 arg1;
> +};
> +
> +int lwmi_dev_evaluate_method(struct wmi_device *wdev, u8 instance,
> +			     u32 method_id, unsigned char *buf, size_t size,
> +			     u32 *retval);
> +
> +#endif /* !_LENOVO_WMI_HELPERS_H_ */
