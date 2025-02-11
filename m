Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA6A15D5B6;
	Tue, 11 Feb 2025 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739296798; cv=none; b=f4zuy7EnOGByV7ULzxhH6340drV4tl9Cq7iRkPD0i9yF8gCJzG9eUCmTulnE1PW08JcuoF3ZfZ4IjKTuNLoR6ysxSfS/eAGgEXCN5NxtJ85LX4VCQEqujGdRwNB0nrIbUGqoxNo7h72nKOP75TrnXGGGRCHcH+20dGDBgH90WUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739296798; c=relaxed/simple;
	bh=Tt49HMArmT6+zPjF6F93BpYLk0kKvJ0ovrkP7V66OW4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=TLI9VA6mx2U3WYpKP/5k74py/2rFj7CNaeIjeI+yTQCxjnUmWdbjCo5sxdu7TlCz/yLhDSPEJH1IFx5Bwka0jZJIAnWyOy0BwftuK/B8Vsdlzj6HVQxza4zythaQ0WGAjExQreUi4jiBnR1XAonZPpSak6O+pMDZ9Y4BJyJHloc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewKZ7TNa; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewKZ7TNa"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ef9b8b4f13so52239327b3.2;
        Tue, 11 Feb 2025 09:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739296796; x=1739901596; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qm6+6kkNX9gpwt/hUVJiTnK3x42za7kbK1WsZtFxEJk=;
        b=ewKZ7TNa1i8hqpXxURCNAn2lSjVS9+aMhHgDpZrzdCZLbq/YATJfcaXvvK0RYELnSk
         Elw4ScWpqy5X2LAr++yHVxcCC7yZw2imm+ZuRr4x50syb7mf7F1/n9lxqlrU5GSBiydO
         usdCuj9SVTsYoIOI6wxXhxeAJzZV/3DQxZChGKjXS/olsWn9GP7Sa9SOkFPHzXTKOxeT
         /7xCCcOhFdfqCyyOSSkGhDeoieavMN5W4SkFj+IMhoCz4OSQiu3bXyo9YZRIZ+bK4eB5
         n1pTW4iqUWxojrCXhnLox9tM+B7GEzQG7+X4kSclulAqLLhyW9VFBQj7Mh3ioZGiwwrM
         k+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739296796; x=1739901596;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qm6+6kkNX9gpwt/hUVJiTnK3x42za7kbK1WsZtFxEJk=;
        b=nCh+h5Xj21PGZbso0WPNLX/iRASkRx7wOxGJy3I41IxNrYUP5SH92w+sh8LUvQMgK7
         hPSF9lLUWFttTaf2G5+MKqlu9mjsrXm4ls57iSc9X1zEYm4qHZrfxISdpaZ6X6DMWmIT
         JcBY1ol5WkyAFMX674vGZcc/3Yd8BC47mbfshgD8f/6XXGcMk+y0BuVHqJIH+H6oMIxN
         fmm6dAj58i9+XfpyfRaMI6pvipC3hiAUuz1WUg+Hyca+kM4W5Ff/BxUvTX5Pvqkyampw
         ImuubP7XmtfikeFUfYhN3Zp/78H0oQHl5BtCJ4mt2L6LQTSvTkL2mBbiKay0grLJ2CPW
         Oy4g==
X-Forwarded-Encrypted: i=1; AJvYcCXnIOHX9qjFTHgHrLBCtOq2pgyY/jLTGkckTTQQIaiXLwtiTl+yQ2KsBU1YWiXIJxBucWfLadcpM8ntZBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX4rWZ3Qfo9bO6656Z+qfiBfghnG9I6XlcaQ0CtLTLytwc6ayY
	/TOI6bIyrIPugClp5cFX0WerC0Dc7oyy7WzTDTKHqiCZ+l2QUo7wB6c9mw==
X-Gm-Gg: ASbGncvZ6XJ1dvC/crwl0a5AxGNUhsoxfR/pTzDO+rZrpcUv7luxXzyI7gk0JpO2DGZ
	NH0XvUYOzwDxCQA3FGsckdSwZznh0ojtha9XyHdOt2/nEHrRkxxwhAHQIBZkoYkB7D6p2KirHux
	dETCufmxBIGlV6HpDarYr+OMixRczuteEckF95+yoLvXp1UNSKNzRZxdwKwJW7R9fFONcsF41pB
	PomgSIN3xd0YET4+bItQlUCnQM+4CTSUXQJM+eKcS/OwMKlu3WiJaRAQgbwY4tD5rAOjaZjvF0b
	7QcGSiWG
X-Google-Smtp-Source: AGHT+IFJVejdHt+pvnd65gDaBrpvD0HrQbJYSh82BdZYJFlYefIggdvla7JLh0gLG/eBjF9UdeQrvA==
X-Received: by 2002:a05:690c:9683:b0:6f7:534b:560a with SMTP id 00721157ae682-6fb1f171d84mr5711487b3.8.1739296795878;
        Tue, 11 Feb 2025 09:59:55 -0800 (PST)
Received: from localhost ([2800:bf0:61:1288:72d5:e7e1:d832:2e3d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99ffc073fsm22029157b3.99.2025.02.11.09.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:59:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Feb 2025 12:59:53 -0500
Message-Id: <D7PT98IDXMUV.G2F1LRF8BX7@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>
Cc: <platform-driver-x86@vger.kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Armin Wolf" <W_Armin@gmx.de>, "Mario
 Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 11/14] platform/x86: Split the alienware-wmi driver
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-12-kuurtb@gmail.com>
 <Z6uBJ9AC5XgZTlJG@black.fi.intel.com>
In-Reply-To: <Z6uBJ9AC5XgZTlJG@black.fi.intel.com>

On Tue Feb 11, 2025 at 11:56 AM -05, Andy Shevchenko wrote:
> On Fri, Feb 07, 2025 at 10:46:07AM -0500, Kurt Borja wrote:
>> Split alienware-wmi WMI drivers into different files. This is done
>> seamlessly by copying and pasting, however some blocks are reordered.
>
> ...
>
>>  obj-$(CONFIG_ALIENWARE_WMI)		+=3D alienware-wmi.o
>>  alienware-wmi-objs			:=3D alienware-wmi-base.o
>> +alienware-wmi-y				+=3D alienware-wmi-legacy.o
>> +alienware-wmi-y				+=3D alienware-wmi-wmax.o
>
> Oh my... it's even inconsistent!

Again, this is an already used pattern:

	https://elixir.bootlin.com/linux/v6.14-rc2/source/drivers/platform/x86/del=
l/Makefile#L14

I add configuration entries later. Is the order of the changes wrong? or
is it the entire approach? Do other modules here need a fix?

>
> ...
>
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/wmi.h>
>
> Too little headers are being included. At very quick glance a dozen
> or so is missing...

Ack.

>
>> +#include "alienware-wmi.h"
>
> ...
>
>> +static struct attribute *hdmi_attrs[] =3D {
>> +	&dev_attr_cable.attr,
>> +	&dev_attr_source.attr,
>> +	NULL,
>
> No comma in the terminator entry.

Ack.

>
>> +};
>
> ...
>
>> +static struct attribute *amplifier_attrs[] =3D {
>> +	&dev_attr_status.attr,
>> +	NULL,
>> +};
>
> Ditto.
>
> ...
>
>> +{
>> +	struct alienfx_platdata *pdata =3D dev_get_platdata(dev);
>> +	struct wmax_basic_args in_args =3D {
>> +		.arg =3D 0,
>> +	};
>> +	u32 out_data;
>> +	int ret;
>> +
>> +	ret =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_STAT=
US,
>> +				    &in_args, sizeof(in_args), &out_data);
>> +	if (!ret) {
>> +		if (out_data =3D=3D 0)
>> +			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
>> +		else if (out_data =3D=3D 1)
>> +			return sysfs_emit(buf, "disabled [s5] s5_s4\n");
>> +		else if (out_data =3D=3D 2)
>> +			return sysfs_emit(buf, "disabled s5 [s5_s4]\n");
>
> The whole code inherited same issues like redundant 'else'. Please, refac=
tor.

This is not my code, so a separate patch would be needed.

>
>> +	}
>> +
>> +	pr_err("alienware-wmi: unknown deep sleep status: %d\n", ret);
>> +	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
>> +}
>
> ...
>
>> +static ssize_t deepsleep_store(struct device *dev, struct device_attrib=
ute *attr,
>> +			       const char *buf, size_t count)
>> +{
>> +	struct alienfx_platdata *pdata =3D dev_get_platdata(dev);
>> +	struct wmax_basic_args args;
>> +	int ret;
>> +
>> +	if (strcmp(buf, "disabled\n") =3D=3D 0)
>> +		args.arg =3D 0;
>> +	else if (strcmp(buf, "s5\n") =3D=3D 0)
>> +		args.arg =3D 1;
>> +	else
>> +		args.arg =3D 2;
>
> sysfs_match_string()

Same as above.

>
>> +	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf=
);
>> +
>> +	ret =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_CONT=
ROL,
>> +				    &args, sizeof(args), NULL);
>> +	if (!ret)
>> +		pr_err("alienware-wmi: deep sleep control failed: results: %u\n", ret=
);
>> +
>> +	return count;
>> +}
>
>> +
>
> Redundant blank line.
>
>> +static DEVICE_ATTR_RW(deepsleep);
>
> ...
>
>> +static struct attribute *deepsleep_attrs[] =3D {
>> +	&dev_attr_deepsleep.attr,
>> +	NULL,
>
> No comma.
>
>> +};
>
> ...
>
>> +	if ((code & WMAX_THERMAL_TABLE_MASK) =3D=3D WMAX_THERMAL_TABLE_USTT &&
>> +	    (code & WMAX_THERMAL_MODE_MASK) <=3D THERMAL_MODE_USTT_LOW_POWER)
>> +		return true;
>> +
>> +	return false;
>
> 	return ...
>
> but if you wish, this one is okay.

This was done for readibility. Also this would require a different
patch.

>
> ...
>
>> +static int thermal_profile_probe(void *drvdata, unsigned long *choices)
>> +{
>> +	enum platform_profile_option profile;
>> +	struct awcc_priv *priv =3D drvdata;
>> +	enum wmax_thermal_mode mode;
>> +	u8 sys_desc[4];
>> +	u32 first_mode;
>> +	u32 out_data;
>> +	int ret;
>> +
>> +	ret =3D wmax_thermal_information(priv->wdev, WMAX_OPERATION_SYS_DESCRI=
PTION,
>> +				       0, (u32 *) &sys_desc);
>
> How do you guarantee an alignment? Yes, it might be good for the specific
> hardware, but in general this is broken code.

This is a good question. I'm not really sure how to fix this tho. Is it
fine to just pass a __packed struct? Also this would require another
patch.

>
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	first_mode =3D sys_desc[0] + sys_desc[1];
>
>> +	for (u32 i =3D 0; i < sys_desc[3]; i++) {
>
> Why u32? unsigned int looks more natural here.
>
>> +		ret =3D wmax_thermal_information(priv->wdev, WMAX_OPERATION_LIST_IDS,
>> +					       i + first_mode, &out_data);
>> +
>> +		if (ret =3D=3D -EIO)
>> +			return ret;
>> +
>> +		if (ret =3D=3D -EBADRQC)
>> +			break;
>> +
>> +		if (!is_wmax_thermal_code(out_data))
>> +			continue;
>> +
>> +		mode =3D out_data & WMAX_THERMAL_MODE_MASK;
>> +		profile =3D wmax_mode_to_platform_profile[mode];
>> +		priv->supported_thermal_profiles[profile] =3D out_data;
>
>> +		set_bit(profile, choices);
>
> Do you need it to be atomic?

I don't think so. `choices` belongs to this thread only.

>
>> +	}
>> +
>> +	if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))
>> +		return -ENODEV;
>> +
>> +	if (awcc->gmode) {
>> +		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =3D
>> +			WMAX_THERMAL_MODE_GMODE;
>> +
>> +		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>> +	}
>> +
>> +	return 0;
>> +}
>
> ...
>
>> +static const struct wmi_device_id alienware_wmax_device_id_table[] =3D =
{
>> +	{ WMAX_CONTROL_GUID, NULL },
>> +	{ },
>
> No comma.
>
>> +};
>
> ...
>
>> +int __init alienware_wmax_wmi_init(void)
>> +{
>> +	const struct dmi_system_id *id;
>> +
>> +	id =3D dmi_first_match(awcc_dmi_table);
>> +	if (id)
>> +		awcc =3D id->driver_data;
>> +
>> +	if (force_platform_profile) {
>> +		if (!awcc)
>> +			awcc =3D &empty_quirks;
>> +
>> +		awcc->pprof =3D true;
>> +	}
>> +
>> +	if (force_gmode) {
>> +		if (awcc)
>> +			awcc->gmode =3D true;
>> +		else
>> +			pr_warn("force_gmode requires platform profile support\n");
>> +	}
>> +
>> +	return wmi_driver_register(&alienware_wmax_wmi_driver);
>> +}
>> +
>> +void __exit alienware_wmax_wmi_exit(void)
>> +{
>> +	wmi_driver_unregister(&alienware_wmax_wmi_driver);
>> +}
>
> Why not moving these boilerplate to ->probe() and use module_wmi_driver()=
?

This 3 files are a single module and it has two WMI drivers so this
can't be used.

--=20
 ~ Kurt

