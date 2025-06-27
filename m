Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ED325DAFF;
	Fri, 27 Jun 2025 21:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059766; cv=none; b=dP8VmYUoGIII/WRsbeTHPkMeOrYRttO7dm2qoxURQkcOr9FXX6Hq0bvZEOUtoMbMsJhhCh05nRkVkUW+U8E95TVVCfZO7aWnpbmv6GfZJxfNCSIHDeAfccINixewChC+370TcpxsHamhfNvubyPhdXskAHuL1A6fGIOePaPRGH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059766; c=relaxed/simple;
	bh=N97nvFwtdl90865mk771PfQ/KF4VVJLYZIN6Cs6jKAE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=P2VnPGg7Abpc5UIuoYZgzoiVEilsbIIqtIJDQkzCfriCgUJSF3ErdJJMh/V7VDj8vfbI1tQ7NCYoQ8dri5qHGBJih1GOc3hvcjzjQcmL9904XfIu+PnquY/AXm3zrD7gklgxYlioGuvd2v8NeaxaS1kR59H0oBJYsoElVJ+e0hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsriAmDK; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsriAmDK"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-313154270bbso31136a91.2;
        Fri, 27 Jun 2025 14:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751059764; x=1751664564; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PzJSDyiIELqDj/d+NVM8mR/dEA9dW0Mg1tiXeZEkSJs=;
        b=PsriAmDKicaNAwsitlrW5PSoDbGr8BXzK2oIn/ihKklGoX457xEB0pxINIuip8oqGv
         4U8jjolSY1AQswqu7upbJ9l8El4qFCgPbpdGFCzu+0Mat5kaZ2iY6P+dMe5xqD7gE7Xs
         uUOW1b95wL5rG2BLO6CDJCBf4ztihic+6fAM++/AW3u0aiuwZFU6otqnUm3R8CQVHzvS
         wznrIMTlk/ThsaUixIEE5LhpxPO1oCmWpqvNwB8XIgDnnbBTX7hwsolzP2u7pujoe55p
         pTHSimNj9yDYcC7/hu4FJF38RNUn+ITUq8RkKYYx0Ym1pOom2CFz1Oj8G6NpQTk8WmGr
         xYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751059764; x=1751664564;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzJSDyiIELqDj/d+NVM8mR/dEA9dW0Mg1tiXeZEkSJs=;
        b=FlBNo8A0j3TbOLS9eE2HJuyiwM3XuBRu6ALNlRW5i9o0s9XPVgIw1aRGa4A0IKmhhO
         JpJ9iNEvs09Iv81C+FgILwMFP1KS0RgkSnWB4SVDh795ymjxGLZzZxq2BZ9ibuxi0f4C
         dCjzF8sCBPmVw88kVwI3avwRbqu2kyt4mD3YnuoFYsjyHYgGfvty5mk54LLMvZg++jkR
         TydWDCu3AMFoaKfsqr3qW/a8n4Uyy0OsfZI74kjoucUx1c5m2acDmgQyIW6ucf+Lr+iX
         ZZl+IxLdX9FuuBBykgCBEPsgBSRbyu5Opz4ZjRuD0/jp3yd8O97fFRHNOBu03pp4ARaB
         ZBSw==
X-Forwarded-Encrypted: i=1; AJvYcCWyNczGdUQwrFVik6EINd/GM9YUxlagPNefsHIjByf3VFg9G0XArrXYeOxGD/jC3Cig7/sOLWh/h8PXni7CiQuIj4kIQg==@vger.kernel.org, AJvYcCXz3WEU4vQdMOICo+DG1Ixcx7kHTYvvYlQAgNvbW2w0dnVcr73ZomaRsUmDBVVYNqq2bcibe2vOUB+ddso=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYWlilEKihnOW8eDtIN4jeeQD07CaaiSxI59rDahRwGTgM553f
	wjPDbkEBFgIo2Iph0dDFnyg5bQh+OD8ACfkve2YBgtsRwHX+vv1UX6/P
X-Gm-Gg: ASbGncueWcmuIABi/ubnehr7LYQFHAj74d0M6gucJxAJvtWC3M8nO/YA4xvDHnA4Y2Z
	BQwI/Jdgc/YEUskwmTE5B1iuSHosHwRynDb9PCFX4iSPrNDfnsD0heuRbwHIuUw8D6bTc9AdX2V
	JLh7JkEl5LC97BRaHcj7eiD4/I/QrQMFHej3IXFBYVl1Ps0oh7wKNRJ691ssT/trLjb30p6j+rD
	7cbCDPocS7h662SBdqYskA2CKbY11387G3+Snet9/OartX2mdhRkdJn4gl9syIstpwlqMmZpmyU
	4wzJRI2RY615a6qI0LP1gBSjFJDwncCsdzOtLHgzlRzDNMfG8hgSi60=
X-Google-Smtp-Source: AGHT+IFf3HpHm+vMMOuNPlSgz7AefKhyzkVVTh0a7NTYXytjvSZGJ7HwbUbw1GuEXetgUUo5Qgz6Sg==
X-Received: by 2002:a17:90a:d603:b0:313:db0b:75e4 with SMTP id 98e67ed59e1d1-318c9288263mr7791368a91.33.1751059764387;
        Fri, 27 Jun 2025 14:29:24 -0700 (PDT)
Received: from localhost ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c150d959sm3108624a91.38.2025.06.27.14.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 14:29:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=f9fa37f2e671fa9a6c56202a7260752149da78fe6b978ac304144ee9d19f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Jun 2025 18:29:19 -0300
Message-Id: <DAXMVOI4AXHY.18HUV9THTG0DJ@gmail.com>
Cc: <mpearson-lenovo@squebb.ca>, <hdegoede@redhat.com>,
 <ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: lenovo-hotkey: Handle missing hardware
 features gracefully
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Armin Wolf" <W_Armin@gmx.de>, <xy-jackie@139.com>,
 <alireza.bestboyy@gmail.com>, <atescula@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250627195436.3877-1-W_Armin@gmx.de>
 <DAXLSMRH9E6Y.3Q8Z59YG2B50C@gmail.com>
 <fb08672d-881b-458c-b8ed-1a27ca93fe7d@gmx.de>
In-Reply-To: <fb08672d-881b-458c-b8ed-1a27ca93fe7d@gmx.de>

--f9fa37f2e671fa9a6c56202a7260752149da78fe6b978ac304144ee9d19f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Jun 27, 2025 at 6:17 PM -03, Armin Wolf wrote:
> Am 27.06.25 um 22:38 schrieb Kurt Borja:
>
>> Hi Armin,
>>
>> On Fri Jun 27, 2025 at 4:54 PM -03, Armin Wolf wrote:
>>> Not all devices support audio mute and microphone mute LEDs, so the
>>> explicitly checks for hardware support while probing. However missing
>>> hardware features are treated as errors, causing the driver so fail
>>> probing on devices that do not support both LEDs.
>>>
>>> Fix this by simply ignoring hardware features that are not present.
>>> This way the driver will properly load on devices not supporting both
>>> LEDs and will stop throwing error messages on devices with no LEDS
>>> at all.
>> This patch makes me wonder what is the policy around issues like this.
>> In fact I've submitted and changes that do the exact opposite :p
>> Like commit: 4630b99d2e93 ("platform/x86: dell-pc: Propagate errors when
>> detecting feature support")
>>
>> IMO missing features should be treated as errors. i.e. The probe should
>> fail.
>
> IMHO the probe should only fail if some features are deemed essential, li=
ke
> required ACPI methods. Optional features like in this case LEDs should be
> handled by the driver in a graceful manner if possible.
>
>>
>> Quoting documentation [1]:
>>
>> 	If a match is found, the device=E2=80=99s driver field is set to the
>> 	driver and the driver=E2=80=99s probe callback is called. This gives th=
e
>> 	driver a chance to verify that it really does support the
>> 	hardware, and that it=E2=80=99s in a working state.
>>
>> And again [2]:
>>
>> 	This callback holds the driver-specific logic to bind the driver
>> 	to a given device. That includes verifying that the device is
>> 	present, that it=E2=80=99s a version the driver can handle, that driver
>> 	data structures can be allocated and initialized, and that any
>> 	hardware can be initialized.
>>
>> Both of these makes me wonder if such a "fail" or error message should
>> be fixed in the first place. In this case the probe correctly checks for
>> device support and fails if it's not found, which is suggested to be the
>> correct behavior.
>
> The driver should only fail probing if it cannot handle some missing feat=
ures.
> In this case however both features (audio mute LED and mic mute LED) are =
completely
> optional and the driver should not fail to load just because one of them =
is absent.

I agree, both are individually optional, but at least one should be
required.

>
> Just think about machines supporting only a single LED (audio or mic mute=
). Currently
> the driver would fail to load on such devices leaving the users with noth=
ing.

That's very true.

But I do still think if both fail the probe should still fail. Maybe
there is a way to accomplish this?

I'm thinking of something like

if (lenovo_super_hotkey_wmi_led_init(MIC_MUTE, dev) ||
    lenovo_super_hotkey_wmi_led_init(AUDIO_MUTE, dev))
    return -ENODEV;

What do you think?

>
>>
>> BTW this also leaks `wpriv`, which would remain allocated for no reason.
>
> wpriv will be freed using devres, so no memory leak here. However i admit=
 that there is
> some room for optimizations, however i leave this to the maintainer of th=
e driver in
> question.

Leak was a bit of an overstatement :) But if both features are missing
it would be kinda leaked, in practice.

>
> Thanks,
> Armin Wolf
>
>>
>>
>> [1] https://docs.kernel.org/driver-api/driver-model/binding.html
>> [2] https://docs.kernel.org/driver-api/driver-model/driver.html
>>


--=20
 ~ Kurt


--f9fa37f2e671fa9a6c56202a7260752149da78fe6b978ac304144ee9d19f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaF8NMwAKCRAWYEM49J/U
Zq/MAP43RcMOug9PHqtyPp8hxLwpmiw1OL2C+HeGNdgROp7aLwD+IMFNPVSATQBt
ypCbYADZoqn9p6xC69w7/74Y88YqJgw=
=4GiE
-----END PGP SIGNATURE-----

--f9fa37f2e671fa9a6c56202a7260752149da78fe6b978ac304144ee9d19f--
