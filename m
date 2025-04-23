Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5048A17B421;
	Wed, 23 Apr 2025 16:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745424870; cv=none; b=ndGx+hBdHPNlvwhnVAylHbcAlg7DFStrIsUbr1X6rtkrnL6LogMe0S0qSMz+RBJTACiwtqoWkKyQjMSdgryYM+KIYxJJUoBcbULg/aAI6FHW2q47X6PcojJ7R84yLKszE0govB7JzPTq02Vimumc7rWtWPgIjjWs4BXs7dnfVTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745424870; c=relaxed/simple;
	bh=u2WHQ+ulAOKjQww0T8nhaN1AuWQKWah8fcMg9dvTeAo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TgJXvw5tEFL6TSfxjYKrp25dn4y75Ot//6hNkX47/smN05kGGGJd3OM0tM/Oe7FyUc5ZNnAmfETuv1b1Ii2FZo6okWp/lqzLT80Gp4u3k0PLf/x08Onp1PH2y+T8UPcMzRkq5PnwK6efNRk5jgjY4ox7gHF9RV80EE+Z5Iguwqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llIFZKHl; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llIFZKHl"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22401f4d35aso71905ad.2;
        Wed, 23 Apr 2025 09:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745424868; x=1746029668; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbm0MYz/Snn5GTSIsILgCRMCDiLDb03j0g6ohbWHNcQ=;
        b=llIFZKHlqf4JJ3N6IPuX6o5LS3S58vQOvrn3ARfRbJh5haXSDnzmZW1sIkIzelQNyv
         u2e4/s9RiEBCzWSh/lyp2sAV7LgFyGxC0Et797j89ZqnLhYETHVk43PeFqzV2GDAXqxI
         qmA4oGTp8XzFG71KR+vBYMT4JNiVXo9Uh+Z0WqKAdy0Iljki8ATXxi1zvqvpKBMjk4SI
         PJzGvfNOc6Xvg7F3kULA1+mWcGUS7AsA6Ipvcp0Dl1hBlmt3Se5MmVACsfC1geW5to1s
         M13JpSD6GRuKIYw/wPSt0j9L9qpsG0MwhPl8dETgbh44FG9sO1zDDk26ZqpHbPVozfol
         VW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745424868; x=1746029668;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xbm0MYz/Snn5GTSIsILgCRMCDiLDb03j0g6ohbWHNcQ=;
        b=J+85MsE07EzuhWOQfPzHbILndxndMNhVAIZMT0Gyn4pQ/GPwoqZgw1c7+8EzGtsy3e
         9hymRHCEj7xrlvACYvNYNl0aYj/S5nXNqmNZ8d5tvEH01BfDHEriNWOPxXPnMelYdvgg
         OKySZz9ynqLLfY0ImgULTWR0AlFysLG2OcjlPUoeQyhkV82+kELb1dBTSKwVPZ3fLHzw
         UYNVu6U56Nl5IjzlieolCnwMwHebGdg2V5aXZ6z9DUjPIeblcjQSirfckT64eN37ruQV
         cY1xOtECn29AuFjYVH9G8x0K3g4wtbHo7ohwfMQ+Yn9Pu8zWVQFnfeopSIzFLquCX0pO
         KHAw==
X-Forwarded-Encrypted: i=1; AJvYcCVOYg2AASTTOnF/pfPDItCDtpYh7e0DI1E1Gv4kTQZGlniM7YFkmfPtgZjgAdZvXI5KIKMr4zwpq7TlHgV1pZxnp6Z1Lw==@vger.kernel.org, AJvYcCWBLgNmcaucom71XlpKLwqZZzKh9os09Z25gf5C1K5LwmeTn9mAVNzbP9cf5EIHGyQASx/Ey81uPkaB/gc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAQg8C9u/CNvY5UGWbi0OMEst0yAD5lkhTAeB8WNfxcUauOD6Z
	BeJMSVOwGI0Fy2TcqZ5+SAViUOLW8Hj7SpfjnWRrWWSnVWos4nBZ
X-Gm-Gg: ASbGncvK7PO4T+sM0fxOO9xKvsdIt4dwVx5TqNulz5UWS0PWYgP1VfoRSPuuBQ5u2L3
	nrjDIGaiD2fjZxm7AzIS9aukHUQQccpiA+yprad0dfP0ceWiW4I1gttjjETg8yWOFceupa4mzys
	URwR3RQrTuIF46JMtzFIQfRo1OkuF1zCDxxEe5m87EMw5VE0L0zcDE7SK8L+j1B4B1ouSyVBcl/
	ZCVG5+s2cVRV7tPL4uO3FA9M/yRzN9XJonlbp2kFMRLPpl61LEDJRzztTAL2p95ONxHW7l1p7pS
	4yL0HlBkonjPlkfR+Mf2OJ9nU+fgMisJ1w==
X-Google-Smtp-Source: AGHT+IHyioSF4OvVOr8p+6fFMIfKbDX0xY/TNTq4JnFhtnxiB7MIjpAV+ZkV751ueGWWQudfJb8z2A==
X-Received: by 2002:a17:902:f0d2:b0:224:1eaa:5de1 with SMTP id d9443c01a7336-22c535830e1mr207608875ad.18.1745424868353;
        Wed, 23 Apr 2025 09:14:28 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fde74fsm106638035ad.220.2025.04.23.09.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 09:14:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Apr 2025 13:14:24 -0300
Message-Id: <D9E5H5B9X448.12FJT48775C50@gmail.com>
Cc: "Lyndon Sanche" <lsanche@lyndeno.ca>, "Mario Limonciello"
 <mario.limonciello@amd.com>, <platform-driver-x86@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] platform/x86: dell-pc: Transition to faux device
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Hans de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com>
 <20250411-dell-faux-v1-3-ea1f1c929b7e@gmail.com>
 <2afb6e58-44cb-486e-8062-074ff397dc2c@linux.intel.com>
 <1e8a6fe0-518d-4eac-9895-51179ca23f36@redhat.com>
In-Reply-To: <1e8a6fe0-518d-4eac-9895-51179ca23f36@redhat.com>

Hi all,

On Wed Apr 23, 2025 at 10:44 AM -03, Hans de Goede wrote:
> Hi Ilpo,
>
> On 23-Apr-25 3:27 PM, Ilpo J=C3=A4rvinen wrote:
>> On Fri, 11 Apr 2025, Kurt Borja wrote:
>>=20
>>> Use a faux device parent for registering the platform_profile instead o=
f
>>> a "fake" platform device.
>>>
>>> The faux bus is a minimalistic, single driver bus designed for this
>>> purpose.
>>=20
>> Hi Kurt, Hans & Greg,
>>=20
>> I'm not sure about this change. So dell-pc not a platform device but
>> a "fake".
>
> Arguably the dell-pc driver does not need a struct device at all,
> since it just exports /sys/firmware/acpi/platform_profile sysfs
> interface by using the relevant Dell SMBIOS interfaces for this.
>
> As such maybe we should just completely get rid of the whole
> struct device here?
>
> If we do decide to keep the struct device, then since the struct device
> seems to just be there to tie the lifetime of the platform_profile
> handler to, I guess that calling it a faux device is fair.

I think it's important to mention that a parent device is required to
register a platform profile, see [1].

I guess we could get away with removing the device altogether from here,
but that would require to find another suitable parent device. The
obvious choice would be the `dell-smbios` device, however that would
require exporting it in the first place.

For some reason, exporting devices doesn't seem right to me, so IMO a
faux device is a good choice here.

Another solution that would make more sense, lifetime wise, is to turn
this into an aux driver and let `dell-smbios` create the matching aux
device. I could do this, but I think it's overly complicated.

>
>> I'm not saying this is wrong, but feel I'm a bit just lost where the=20
>> dividing line is.
>
> In this case it seems to be clear that this is a faux device,
> but I do agree that sometimes the line can be a bit blurry.
>
> Regards,
>
> Hans
>
>
>
>
>> Is it just because this driver only happens to call
>> dell_send_request(), etc., not contains that low-level access code withi=
n?=20
>> Or is that dell-smbios "fake" too?

IMO `dell-smbios` is "fake" too? It is there only to expose either the
WMI or the SMM backend through a single sysfs interface.

I think a more natural design for `dell-smbios` would be an aux driver
that exposed it's interface through a class device. Maybe I'm wrong in
this regard though.

[1] https://elixir.bootlin.com/linux/v6.15-rc3/source/drivers/acpi/platform=
_profile.c#L556

--=20
 ~ Kurt

>>=20
>>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>>> ---
>>>  drivers/platform/x86/dell/dell-pc.c | 46 +++++++++++------------------=
--------
>>>  1 file changed, 13 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/x86=
/dell/dell-pc.c
>>> index 794924913be0c6f13ed4aed8b01ffd21f1d34dea..48cc7511905a62d2828e3a7=
b593b3d2dae893e34 100644
>>> --- a/drivers/platform/x86/dell/dell-pc.c
>>> +++ b/drivers/platform/x86/dell/dell-pc.c
>>> @@ -13,18 +13,18 @@
>>>  #include <linux/bitfield.h>
>>>  #include <linux/bitops.h>
>>>  #include <linux/bits.h>
>>> +#include <linux/device/faux.h>
>>>  #include <linux/dmi.h>
>>>  #include <linux/err.h>
>>>  #include <linux/init.h>
>>>  #include <linux/kernel.h>
>>>  #include <linux/module.h>
>>>  #include <linux/platform_profile.h>
>>> -#include <linux/platform_device.h>
>>>  #include <linux/slab.h>
>>> =20
>>>  #include "dell-smbios.h"
>>> =20
>>> -static struct platform_device *platform_device;
>>> +static struct faux_device *dell_pc_fdev;
>>>  static int supported_modes;
>>> =20
>>>  static const struct dmi_system_id dell_device_table[] __initconst =3D =
{
>>> @@ -246,7 +246,7 @@ static const struct platform_profile_ops dell_pc_pl=
atform_profile_ops =3D {
>>>  	.profile_set =3D thermal_platform_profile_set,
>>>  };
>>> =20
>>> -static int thermal_init(void)
>>> +static int dell_pc_faux_probe(struct faux_device *fdev)
>>>  {
>>>  	struct device *ppdev;
>>>  	int ret;
>>> @@ -258,51 +258,31 @@ static int thermal_init(void)
>>>  	if (ret < 0)
>>>  		return ret;
>>> =20
>>> -	platform_device =3D platform_device_register_simple("dell-pc", PLATFO=
RM_DEVID_NONE, NULL, 0);
>>> -	if (IS_ERR(platform_device))
>>> -		return PTR_ERR(platform_device);
>>> +	ppdev =3D devm_platform_profile_register(&fdev->dev, "dell-pc", NULL,
>>> +					       &dell_pc_platform_profile_ops);
>>> =20
>>> -	ppdev =3D devm_platform_profile_register(&platform_device->dev, "dell=
-pc",
>>> -					       NULL, &dell_pc_platform_profile_ops);
>>> -	if (IS_ERR(ppdev)) {
>>> -		ret =3D PTR_ERR(ppdev);
>>> -		goto cleanup_platform_device;
>>> -	}
>>> -
>>> -	return 0;
>>> -
>>> -cleanup_platform_device:
>>> -	platform_device_unregister(platform_device);
>>> -
>>> -	return ret;
>>> +	return PTR_ERR_OR_ZERO(ppdev);
>>>  }
>>> =20
>>> -static void thermal_cleanup(void)
>>> -{
>>> -	platform_device_unregister(platform_device);
>>> -}
>>> +static const struct faux_device_ops dell_pc_faux_ops =3D {
>>> +	.probe =3D dell_pc_faux_probe,
>>> +};
>>> =20
>>>  static int __init dell_init(void)
>>>  {
>>> -	int ret;
>>> -
>>>  	if (!dmi_check_system(dell_device_table))
>>>  		return -ENODEV;
>>> =20
>>> -	ret =3D thermal_init();
>>> -	if (ret)
>>> -		goto fail_thermal;
>>> +	dell_pc_fdev =3D faux_device_create("dell-pc", NULL, &dell_pc_faux_op=
s);
>>> +	if (!dell_pc_fdev)
>>> +		return -ENODEV;
>>> =20
>>>  	return 0;
>>> -
>>> -fail_thermal:
>>> -	thermal_cleanup();
>>> -	return ret;
>>>  }
>>> =20
>>>  static void __exit dell_exit(void)
>>>  {
>>> -	thermal_cleanup();
>>> +	faux_device_destroy(dell_pc_fdev);
>>>  }
>>> =20
>>>  module_init(dell_init);
>>>
>>>
>>=20

