Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AC514B950;
	Wed, 16 Apr 2025 21:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744838595; cv=none; b=jfA4O+WbZFOOPFcfSODjqYZUONYI2K001GkQ9aAp2l09dA6y6lmdWrl4ZEtWzWQzWKLZ1qmqvd6/lKkB2C7qa/Onyq1vKUMTFil7Oj5/yiqifT5fIaZHlx+tS3EDLRXPAGGR2paqU0TkbKGsFzscVvHsN46I6HG9Ugd9lWXzdM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744838595; c=relaxed/simple;
	bh=FoKNQjFf4A5u8dgZht9fwIb3xHdbbN5luDPUaBeUt1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxfszk8jJ3LNhtvOXNVGQMsDqeC2cWLQ0FD4yLIA1XOx+WgY9w/MLUfTNPR6UYjMSwEokCZTYqDr8UyemJbRgGUuRXwy5ma2HpMgVmANvzkNQWsRRkixzO0os5RzlnPMeTXctYBNz8xHU1YCzo9y85PoQwuccCowemdTtWyiY1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hvdCmlkY; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hvdCmlkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1744838573; x=1745443373; i=w_armin@gmx.de;
	bh=C7hYTHPAAm3LTrIxcunlNaUl2i4d2gPLVVW5TYqz/ik=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hvdCmlkYg6EG3VGUIwScp4bHwydUqJTGG0AI3Pe3iiFTi7KUULF0g4w2tKLwI5o8
	 Xno8TGHNzOwzGPq0F9pfHxuW6pKoghSj0Pgj2K030RwcMwo/RNMcdLwL3PFF6aVXo
	 QwMTGr4ob4RaWdoaTIb+CvRmCfe0OVBWwffDJ+A9GJ1GQXblY0QmO4VSg0Uuk/tH8
	 jWENkdzdxkvzbD3b6+jaxHZS4K8lbS/6WO9wNexbdMvRvS28qJKLjhx/y5uRwN4Fi
	 ndde1Lw7scb90wUyDQmsFDpCn1//vEjXJs8vUswxJHAw9YKtJ/M66Ys7mk+AgOdzy
	 ROj3QULqm1RbgqD1Gg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhU9Z-1ujhdf42yZ-00l3Mf; Wed, 16
 Apr 2025 23:22:53 +0200
Message-ID: <d64c9a83-58b2-45d4-899f-772ecaa33d8a@gmx.de>
Date: Wed, 16 Apr 2025 23:22:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] platform/x86: Add lenovo-wmi-helpers
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
 linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>
References: <20250408012815.1032357-1-derekjohn.clark@gmail.com>
 <20250408012815.1032357-3-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250408012815.1032357-3-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dECs7HWbdLtxdIBvZuDb+WT5S7ofdGyx59E7B9f20CCpXvWaGAZ
 VUyw/X0d8YzUK/OkG79RQh/zszoXIG7fL5hcqDuBsuwMp2nZa/wLqtPZDjEKxn6NR0rbTMM
 hi7CX86gLzgVXVtOdHqRAocchXo3VIajeTZOY1gm/xdnbFTZou9MlwxSflrG4h45Wniy4MO
 kXKyE2+1G11D4xCiIV50A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nvx6beBaYcw=;yQZ0mx6IOPfXwTcjFRArS30xw2Z
 0RQRgyj9D6CRUMC8vYSXcIxqWqohW/Dx1MIn6MVHhbTk0CcCfPVD1UsGR9AjxofAOAB4m+dpJ
 ndR6laVErI9XSVOEU2CIOrfDHVYKLwAh2G3lDYQLkhNiYty3QIrruQzxVTXlBQUi2WlNLj1ga
 kj3Urmb7lz1QJMKXDKY9diG/K6TU8yD4003UyuUkOZ5jovU5gtFQseeY/KtNWsfVo422aEDMm
 PKqLZQ6omgxObu7EzRoHdrdr37eS4vR8yM52V2XV5QikvqaMg3yzUw+X3dpmaiYJ3OMOFCDjE
 QwomF582VLNYFAdf8Dv7IZL8iTPD/d3oWdTj2NCKScayFailbWJ3KJz69XX3LeMOAXVtE2zv3
 gInVFV3tNtXIUHlkG71MWA+U6FGlkedGKUwMzsU8HVN0DVZVBsgaFzQgyOOxdyhr0q0aGSTE2
 jfLzphZiYt2RS1aOJtJX0LU2urr1/AXB61ySsK3fuwb3kAjhZQnNai+0xlqZofKqXSdJcsHwx
 YCooYbdinNampy/6VCRUDuLe6RjA0C1VibUmRXdcTtX8F3Tv20uUUwVPWZ0Tj4FJ+JPuTCKlt
 UI48KA0aGkDtdlyzm8Ms+P/7H33dxMXIpn/aPDaCtuNS4ra6y/BJGROTq6Qq7NlovOhpfiacT
 ptSiTmsAIBsG5QbpvXb/V5qjZuTpKhXN81mcVIstAW10QbX5ZNMWOlVDrK6yBRhfT5gvI3zB3
 /OXY/o7ZJgm2ZUZhjaj4FWlT91We4THQ6FSYW40tJzY/0LpGyQ6oaRK+pv3/dRxPSxYvQWqfZ
 pn0jJmceS15cbUZ9y70AjrlHxdmzDr7RYHtp+w6mxKiMRR2elHdvFFBbuIbGPxhgK/ZDLy0ID
 LgCJqC7HCUXGHvo6WCPup2t9AKfZo/Nr0RVxlvNIXSH4cF8OyHWzBM/JF+vCCIknkWDku1Ok5
 OXDeTEjxqOCWNEymgPVjCkQvlULxySClpj4H8A6l2EOOhj/UcENlU+PNdpe62e0/V0LSfnfRw
 AG0xJjZYiKlsQCJAqGxXKDa/70nQzcgcEhfmNGNw80Z6Qg/M//CJMPPtyNsb3paXplhWSo6mK
 8C0KaI0XTIJiPo40QzQUm9z6dPG+hNTsFOJi81T54/QkeX8u8bxzG/ANOtRlglGhLuMtJ4jvn
 lBKNL0R1EfUuwSvxorHngA1qtDmnqwqqjnyBOj5KevuThNs3M+v2aduJoVeIlOWWyjrK3km94
 F7CAhGfKnGXxHJvJ9/1UmVFX0+MsquFCQGIavmg2wEOueHDEBgEuUoQaPXLshV/YCCfEAjqLo
 AEU1XBM6Nsqnnpq3W5xJpWwllLqWfc1Z7XIfWpjKXkeauRGAdFPgNsTjdEbiXaKI6KmVkFNhO
 yN0ZYsTCoo0MybrdHh+88j7Ye4YRK1mNw6xe80sLIAi/Z3qhef2iWRcy+nMgtV/gvRVB0UeBf
 A2XdHPq51E1ZCwdPMcE1BUSdwZ6JTnn1GK+86jdC2Nx8kkbWzhuhj3widysnLG3q6O5e+E2M3
 JRxVP1uIb/q4VZSfCLHqVDmaXlzvDWc8fGFsRiQKQ1r2PFbPNewQFuO8cg1qO2BgIviE2BViY
 jLbk1+9DFu4xQzk1afE7XOJd3xwQWvEb8gOH6lsmi1VIlosD5xBcndoCFlypfzh89DghEwZT6
 L5yhl/1Frx3FfTXdltrAA5+k11LFqVF3fzlKWeKISLayhDJWOx4/TTfUfVRDNE0UIUhW2CR59
 R64T8Elb4520i2yls3AHpERGBOaSBAwqqkX9CNtx0YlL34CnUSlPQ2Lb7jubXCYJFlyj+wY8f
 z1Yul2OU5ZxIYK5u9aRKu7B05fu4Y9UBOqgiXCPrSEQXSYH4fqA3mQucj44cbVK86S8OBmfLa
 DfzAZxmBSHY4N5P5iRnuBzfjUpq4UnbPLJTMPqODopahOPN8LP+eNdzJ9IrI5T9GMbDCEV752
 +KmN9LDJOpOx7fRfQ2hG/Ewr2mC5bVr73o+lhX0h4QSRdEX0piGwH+2OmU0tcx0F2czCaXonW
 rQQPlr37F/xCC5GhQC4bag+k0wYZs+c94PyKK7DRA+AYuypkNShQXCC82SuzMQU5j1tZRmCDG
 YUlgKhKq7hBxpZH7cyW/Kbyz1uEIdhXRy9RdGrqGEhUTVOtZkfi8Bc/MVTleeFXFvONyZjaGH
 ND0bAS7VYFp3akq+VU0J2e0PEmOkXd7PBtK8tCNdCQZ0sKNb5gGtTXjM0j3JtRx88DbL6smyF
 RmMT6wmIH66eZyYnKNqInmB9EG0UUi9Gb6NO2BfD9BKBAO0WR6t0rxRi5Vlg9RSLkz1vj1+hO
 6tqtaMri4Mxbm2J9e9b83F8NZoX/M6kq9aAhYinmmopU2g/tWW/Ooi1bB0UF6j5tgxPacjx4i
 aMxNjTU1ZLZKMJ1nG2dTiymF01ssMt1cGWEJnCcHj9QqfcSNfwWOdKr831e1Ux3bjb7WXB598
 70rStsmsrx83ZApf1IfCqxT/1fSklEVuAlCd4mCR5aFkcoqe5wX6aJdna9n/oSKq0jsXvLFI9
 o38s6ObwwA8oXF5yRafBG+42bSQKDFVEQ4S0XYGKeibEdr5lQZ1tKzUD77Oy9JAdVgBlpddkQ
 tyUMZ0C0vhwgtUOYhV0vCkJ8Rb5s/9fGrcI+7Dwblq94LwRVDdi8jgGmByR+nq0hAJvZo4csy
 CtJgttvBI/HFBgeAZVjSMXs70HWwHOS+y45/4jzra6+Idtl5sK9LviUFPbzIrDRzzUE6zNB65
 OA1VnjJdBE/FcbaLuruSQ8zSSx7k2gQk0wLtTBxAd59Ja2lp+0BHAjhWqkEiPxlecFWHEcUpi
 /AS7I0TNg+VRj+QxHtxBV3le9Z1nsIL09YTgJF/DbOYSv20PGRFHk5y7DULX0ls7jF3msY42U
 t61olTgjH/XDY/O8hjpW423JN3BqDpRy8JiDD2haAmJUeL52mNenStsMYqpNRHZjejVyiaf6J
 sIOT9SWUE4DM1PmY8nPfOKzcUUn3HT0O9eZLqpLybA59/2AiYE5MCTM28h0JbBrt+p1m2/mrR
 /7kZCIA9Y2+913liYm8/Yc=

Am 08.04.25 um 03:28 schrieb Derek J. Clark:

> Adds lenovo-wmi-helpers, which provides a common wrapper function for
> wmidev_evaluate_method that does data validation and error handling.

Apart from the minor issue found by Ilpo i see no problems with this patch=
,
so with this minor issue being fixed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v5:
>   - Fixes from v4 review.
>   - Combine all previous methods into a single function that takes a
>     buffer for the wmi method arguments.
> v4:
>   - Changed namespace to LENOVO_WMI_HELPERS from LENOVO_WMI.
>   - Changed filenames to lenovo-wmi-helpers from lenovo-wmi.
>   - Removed structs and functions implemented by other drivers.
> ---
>   MAINTAINERS                               |  2 +
>   drivers/platform/x86/Kconfig              |  4 ++
>   drivers/platform/x86/Makefile             |  1 +
>   drivers/platform/x86/lenovo-wmi-helpers.c | 74 +++++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-helpers.h | 20 ++++++
>   5 files changed, 101 insertions(+)
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
>  =20
>   LENOVO WMI HOTKEY UTILITIES DRIVER
>   M:	Jackie Dong <xy-jackie@139.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 43407e76476b..bece1ba61417 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -459,6 +459,10 @@ config IBM_RTL
>   	 state =3D 0 (BIOS SMIs on)
>   	 state =3D 1 (BIOS SMIs off)
>  =20
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
>  =20
>   # Intel
>   obj-y				+=3D intel/
> diff --git a/drivers/platform/x86/lenovo-wmi-helpers.c b/drivers/platfor=
m/x86/lenovo-wmi-helpers.c
> new file mode 100644
> index 000000000000..166e87fef156
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-helpers.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Legion WMI helpers driver.
> + *
> + * The Lenovo Legion WMI interface is broken up into multiple GUID inte=
rfaces
> + * that require cross-references between GUID's for some functionality.=
 The
> + * "Custom Mode" interface is a legacy interface for managing and displ=
aying
> + * CPU & GPU power and hwmon settings and readings. The "Other Mode" in=
terface
> + * is a modern interface that replaces or extends the "Custom Mode" int=
erface
> + * methods. The "Gamezone" interface adds advanced features such as fan
> + * profiles and overclocking. The "Lighting" interface adds control of =
various
> + * status lights related to different hardware components. Each of thes=
e
> + * drivers uses a common procedure to get data from the WMI interface,
> + * enumerated here.
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/cleanup.h>
> +#include <linux/errno.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/wmi.h>
> +
> +#include "lenovo-wmi-helpers.h"
> +
> +/**
> + * lwmi_dev_evaluate_int() - Helper function for calling WMI methods th=
at
> + * return an integer.
> + * @wdev: Pointer to the WMI device to be called.
> + * @instance: Instance of the called method.
> + * @method_id: WMI Method ID for the method to be called.
> + * @buf: Buffer of all arguments for the given method_id.
> + * @size: Length of the buffer.
> + * @retval: Pointer for the return value to be assigned.
> + *
> + * Calls wmidev_valuate_method for Lenovo WMI devices that return an AC=
PI
> + * integer. Validates the return value type and assigns the value to th=
e
> + * retval pointer.
> + *
> + * Return: 0 on success, or on error.
> + */
> +int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 met=
hod_id,
> +			  unsigned char *buf, size_t size, u32 *retval)
> +{
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *ret_obj __free(kfree) =3D NULL;
> +	struct acpi_buffer input =3D { size, buf };
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
> +EXPORT_SYMBOL_NS_GPL(lwmi_dev_evaluate_int, "LENOVO_WMI_HELPERS");
> +
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo WMI Helpers Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi-helpers.h b/drivers/platfor=
m/x86/lenovo-wmi-helpers.h
> new file mode 100644
> index 000000000000..b76633603dcc
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-helpers.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
> +
> +#ifndef _LENOVO_WMI_HELPERS_H_
> +#define _LENOVO_WMI_HELPERS_H_
> +
> +#include <linux/types.h>
> +
> +struct wmi_device;
> +
> +struct wmi_method_args_32 {
> +	u32 arg0;
> +	u32 arg1;
> +};
> +
> +int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 met=
hod_id,
> +			  unsigned char *buf, size_t size, u32 *retval);
> +
> +#endif /* !_LENOVO_WMI_HELPERS_H_ */
