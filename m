Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9314C41C7F;
	Tue, 11 Feb 2025 17:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739296005; cv=none; b=iD4F1zHO6b2No0tRv6SvnHvGF/GP8NYc6HRwHM2RbWSTO2JeCqpgBesQiRbNZRjktUOWvgqW+Qz1cfb2xZmmToRtERCoj1sth7XtqudiqyfZ28OlkQ74A5KWdS6v4pfifIjEKkDCxyuDmIvVwAeJkGHb2jhu8sGiKOfUQnQ8TGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739296005; c=relaxed/simple;
	bh=OM750PX+GM6omgY7H5ZVkXVZczPIRx2AABuP2iIlJ3k=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=OlH+W7Odi2DT84cOvZokKp5B3wb0z42UT6rHFBU2wTgn9KP4EBjlQgflAvZCnYFUXjcTNZ7Id/PQ1CeiXxfhwjfk3/9SKfE6X/XcpyIATN8CBbspaUnL/ZmXNB/iDqpkbA3O924jJerspQzrWpcUYhc5vmbiqJOQ25NrxdPN0v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a23pctpw; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a23pctpw"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e53a91756e5so4936248276.1;
        Tue, 11 Feb 2025 09:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739296002; x=1739900802; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17z9WvxPFneZGd1ktho08KBzK3IXZzOqjdsa7bOBhic=;
        b=a23pctpwr8C4SfqDSuuPIKiYMzrKqi5DrBoYcuIvUS7VIhH4AQ0q1Hd48Yj8iy/6O+
         JAXcEkLBR1UIXeJbGK7OFivweD3MG+yU6COdpvSii5SKU4JTvDurONqhCjF+A+6k8D03
         k8fAIf3m2eqPgfyIdqJlu3tUYFHGY8jMQMQqlgYd0j+6FxfIqZiGGj6XIgGp49eLi0i2
         vBwjGi9lQLa98zEBi0XFWvOSc6gK8FKl5foxg9/N7AEuxEYpEijC2lx2t9PWdaZ+1BVc
         JcK8N33/uR3U7S6LD7+K2XnOTvHYyNlQ3UsireQCvC7Ho+FLyupE+hFodBdR5x3BYfuY
         /H+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739296002; x=1739900802;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=17z9WvxPFneZGd1ktho08KBzK3IXZzOqjdsa7bOBhic=;
        b=kzxAL8/zLHMguWD/4koOfaI0rnRDieaZx3mJvZJCnDGzHWrqGgHyBQZ1uW21bbKde6
         TyTlNwIr7dIv16im4kVB76rdN2Aiwblwmz2PRYEGYw40F8/dQZZ+rFXXuBaybQUQpll7
         VkzV37WJHmc0UHoOp+LhGBsfTxTd/B0Pxwgqk1MIhLuo8Sz2VNRJ5tHFzDK1xz7Mwr13
         t1TgjARq7r+kqI//QPcYj+EFRqcbPtZSC84JOqhIvb0pPGNLg8lFihOIFKkHaV6q44Rh
         YIcH4fx5KCqj7KPcckpr1vG5UZb9lDzoSZlQWjwuCXo6d3ZDmXd69+CiTcGDKZc6ZKKc
         0HjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsaPu+vTpgg8Bxk5FngD32/CKGWBJNA7+y1NQj7H25V4WTmwyclHsAHO34NLV7u7x4K5xGhHBR6nrrQ8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc2NZMZkPh1RUmT7/VxcAjG0QZJe2JHZcqh3IPwCgzFdexsrkv
	wznCeQuRxqqFHvMLFjHX11BiQh+ChnNK1BvAQxQvtA8A/caL+upB1B/FDw==
X-Gm-Gg: ASbGncvjPyunXO/dd8bOOMODJNFd3lkDcYdDGrEjFxKkS3uegDGLABraWU2Gm6cFRWk
	OT3K/MXyQ45dU5yw8M9bCtTGCX3iJHs5p1zoK4kGs/MTdehDvrkPqkdoJOeKxg/1uN0IXx/XAA3
	rRxnya3BMbMx9cIFvani+EE/T8ZnMFE1H1RpWHiEn4Id80qvfT8kHNZhg826qAm9yDVoVuElGzO
	YBRYkWqYQuugwQuGpB60nGIizKqgvgzx9dCrcdJgCJ/WzR0OkhTZsj1X0gACPcz4dAA1uRm6HCp
	JmoE67eN
X-Google-Smtp-Source: AGHT+IGQ5gC01hdvr8VTf5YsoGXb2UXG0Q2y2gUYXEM0i0qQhqueht93GdaXYRKV0bYPjinm6/0yLw==
X-Received: by 2002:a05:6902:1105:b0:e5a:c8ea:3287 with SMTP id 3f1490d57ef6-e5d9f120803mr263805276.25.1739296002478;
        Tue, 11 Feb 2025 09:46:42 -0800 (PST)
Received: from localhost ([2800:bf0:61:1288:72d5:e7e1:d832:2e3d])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a1f3602sm3423416276.12.2025.02.11.09.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:46:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Feb 2025 12:46:40 -0500
Message-Id: <D7PSZ410LJW6.3VNZ4VU0H5VUC@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>
Cc: <platform-driver-x86@vger.kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Armin Wolf" <W_Armin@gmx.de>, "Mario
 Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 02/14] platform/x86: alienware-wmi: Add WMI Drivers
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-3-kuurtb@gmail.com>
 <Z6t7IjcOFuAbztfn@black.fi.intel.com>
In-Reply-To: <Z6t7IjcOFuAbztfn@black.fi.intel.com>

On Tue Feb 11, 2025 at 11:30 AM -05, Andy Shevchenko wrote:
> On Fri, Feb 07, 2025 at 10:45:58AM -0500, Kurt Borja wrote:
>> Add WMI drivers for LEGACY and WMAX devices.
>>=20
>> This involves moving the platform device registration to a helper
>> function that is now called from the driver's preferred WMI device
>> driver probe. In the case of the WMAX this is done only if
>> `!quirks->thermal` because the newer WMAX interface doesn't support any
>> of the LED features of this driver. This also eliminates the need to
>> check for `quirks->num_zones > 0` inside alienfx_probe().
>>=20
>> Only one WMI driver is registered on module initialization to prevent
>> registering a duplicate platform device.
>>=20
>> Additionally, create_thermal_profile() now takes wmi_device * instead of
>> platform_device *.
>
> ...
>
>> +static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
>> +{
>> +	struct device *dev =3D &pdata->wdev->dev;
>> +	struct platform_device *pdev;
>>  	int ret;
>> =20
>> +	pdev =3D platform_device_register_data(NULL, "alienware-wmi",
>> +					     PLATFORM_DEVID_NONE, pdata,
>> +					     sizeof(*pdata));
>> +	if (IS_ERR(pdev))
>> +		return PTR_ERR(pdev);
>> +
>> +	dev_set_drvdata(dev, pdev);
>> +	ret =3D devm_add_action_or_reset(dev, alienware_alienfx_remove, pdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>
> 	return devm_add_action_or_reset(...);

Right!

>
>> +}
>
> ...
>
>> +static const struct wmi_device_id alienware_legacy_device_id_table[] =
=3D {
>> +	{ LEGACY_CONTROL_GUID, NULL },
>
> Drop that ' , NULL' part, it makes an additional burden if the type of th=
e
> driver_data is ever changed.

Makes sense.

>
>> +	{ },
>
> No comma in the terminator entries.

Makes sense.

>
>> +};
>
> ...
>
>> +static const struct wmi_device_id alienware_wmax_device_id_table[] =3D =
{
>> +	{ WMAX_CONTROL_GUID, NULL },
>> +	{ },
>> +};
>
> Ditto.
>
> ...
>
>> +static int __init alienware_wmax_wmi_init(void)
>> +{
>> +	return wmi_driver_register(&alienware_wmax_wmi_driver);
>> +}
>> +
>> +static void __exit alienware_wmax_wmi_exit(void)
>> +{
>> +	wmi_driver_unregister(&alienware_wmax_wmi_driver);
>> +}
>
> I believe we have module_wmi_driver() which can be used after the split
> (haven't checked those patches yet).

This module has two WMI drivers, so I believe this can't be used.

--=20
 ~ Kurt

