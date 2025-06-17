Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE24169AE6;
	Tue, 17 Jun 2025 22:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750197781; cv=none; b=s9zkL0sbHiqXw7ZUQzgEO36L9VT4oX5AR8e/QFuR9TmjwxiLGUN0cReDwXcQ4u5an/3vlDcojmoqhJ9ZoIllTGf5AGFtvhiX6QuskuiAdjXFWm2rYqP7HTcTRSQezVJwV3yp7MOV1VuJnVApTYSYVnpdWa9PanFpa6WQWF8ZidU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750197781; c=relaxed/simple;
	bh=IYwhBocoQttwqti4KzzsLz7mIWxTlUfZKRvFXl5rOZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0RpBG0RXoTvoJ4i8Iphb0Bf4IWNErKwI34Oap92KyCMRKeR6nt3h8alXajiaV8txkK0/7dN1pO1mrlF9Gq/6Xt/MYPLjVX3fpTe0Y7eS6pL6TR3RtpCyGWApQv76jJnPqQ6XyCQ9Ez5ldt80UYRf4JWUo/n0+2hUbt6dDp8Ej8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=XBSYUyy4; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="XBSYUyy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750197768; x=1750802568; i=w_armin@gmx.de;
	bh=IYwhBocoQttwqti4KzzsLz7mIWxTlUfZKRvFXl5rOZs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XBSYUyy4fvblqrWCRwkdj9Re7JqSX9eiNj5nV4nFpxhT5lSdEzo/9+8AHDNvsj9o
	 BD7VfgftGZDye+5NQFmZCiE9MSEYKYEBKtbV4uK38y4r2WmSKvzfRs2aaHPd7CGW0
	 Uds/tSu+Yy6HB22z1zEAMNnWUJA4x+rjmh2HMw31Tka1Bv8rWaLvTTY8QFbaI+RYq
	 xScHudm1HoFqMVqXzdcE67N/TZSGzl7PB6ZXj5qrZQzMcnAnV7fWDKLJVusTySrig
	 nvEft/hTRT57xK0Qy+ChuPEaoiF9prPgIGY6/bH8lJya0ik4aMdCSt8yGyrfIUAAf
	 ARHuRqWJzQzGHRtXiw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3DJv-1uUgGI2xsT-0024iN; Wed, 18
 Jun 2025 00:02:47 +0200
Message-ID: <a01af201-328b-4017-ab17-16cbc4ecfff4@gmx.de>
Date: Wed, 18 Jun 2025 00:02:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] platform/x86: Add support for Uniwill laptop
 features
To: Werner Sembach <wse@tuxedocomputers.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <50c4d166-0254-4f5e-b006-85aef8d9dd02@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <50c4d166-0254-4f5e-b006-85aef8d9dd02@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jIW5LwIVNRdAyaBjRU4dtAMFovbLA5YIdPcYrjrpC70JeAnDlOg
 G9Vko6rwDFtImI+hsJo3vHv9mh8zkC4C9LksE1Q0Bd4luTBVa6sMbh/dKktZsuKoSB/VMCt
 UrnSpezco1++75GcXMwnQnhPP1zfrPrLVPXs/TAWJRWI8UBnMS791pg+Cd3cdaKzhKvHJTx
 elLcr7rDmq9crfRzAl5OA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cH50EjbrdMo=;r6xzHubFZGBQ8HyiwVoc00G7w7M
 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

Am 16.06.25 um 14:59 schrieb Werner Sembach:

> Hi Armin,
>
> Am 15.06.25 um 19:59 schrieb Armin Wolf:
>> This patch series adds support for the various features found on
>> laptops manufactured by Uniwill. Those features are:
>>
>> =C2=A0 - battery charge limiting
>> =C2=A0 - RGB lightbar control
>> =C2=A0 - hwmon support
>> =C2=A0 - improved hotkey support
>> =C2=A0 - keyboard-related settings
>>
>> This patch series is based on the following out-of-tree drivers:
>>
>> =C2=A0 - https://github.com/pobrn/qc71_laptop
>> =C2=A0 - https://github.com/tuxedocomputers/tuxedo-drivers
> Better use=20
> https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers
>>
>> Additionally the OEM software of the Intel Nuc x15 was
>> reverse-engineered to have a better understanding about the underlying
>> hardware interface.
>>
>> The first patch introduces the uniwill-wmi driver used for handling
>> WMI events on Uniwill devices. Due to a grave design error inside the
>> underlying WMI firmware interface (the WMI GUID was copied from the
>> Windows driver samples and is thus not unique) the driver cannot be
>> autoloaded. Instead drivers using this module will load it as an
>> module dependency.
>>
>> The second patch introduces the uniwill-laptop driver that does the
>> majority of the work. This driver talks to the embedded controller
>> yet another WMI interface to control the various features. Sadly this
>> WMI firmware interfaces suffers from the exact same issue (the WMI
>> GUID is not unique) and thus a DMI whitelist has to be used for
>> loading the driver.
>>
>> The last patch finally adds some documentation for configuring and
>> using both drivers.
>>
>> Special thanks go to:
>>
>> =C2=A0 - github user cyear for bring up this topic on the lm-sensors is=
sue
>> =C2=A0=C2=A0=C2=A0 tracker and being the tester for various prototype v=
ersions
>> =C2=A0 - github user dumingqiao for testing the battery, lightbar and
>> =C2=A0=C2=A0=C2=A0 keyboard-related features
>> =C2=A0 - Tuxedo computers for giving advice on how to design the usersp=
ace
>> =C2=A0=C2=A0=C2=A0 interface
>>
>> I send this series as an RFC to gather feedback and to request any
>> involved developers if they want to have their Co-developed-by tags
>> on the final patch series.
>
> Afaik most of the initial uniwill module in tuxedo-drivers was written=
=20
> by Christoffer, he is currently on holiday, but I will ask him when he=
=20
> is back. I also did later added to it later.
>
> Since this driver is a complete rewrite I'm not sure if a Co-developed=
=20
> by for Christoffer and me is appropriate, but we would ofc be happy=20
> about it. Maybe for finding out the EC register meanings that you=20
> probably at least partially copied over from tuxedo-drivers?
>
I did, but i mostly relied on the reverse-engineered OEM application for t=
hat.

> Or do you see another label more fitting?
>
I could also include your names inside the individual driver source code i=
n a special thank-you section.

Thanks,
Armin Wolf

> Best regards,
>
> Werner
>
>>
>> Armin Wolf (3):
>> =C2=A0=C2=A0 platform/x86: Add Uniwill WMI driver
>> =C2=A0=C2=A0 platform/x86: Add Uniwill laptop driver
>> =C2=A0=C2=A0 Documentation: laptops: Add documentation for uniwill lapt=
ops
>>
>> =C2=A0 .../ABI/testing/sysfs-driver-uniwill-laptop=C2=A0=C2=A0 |=C2=A0=
=C2=A0 53 +
>> =C2=A0 Documentation/admin-guide/laptops/index.rst=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 1 +
>> =C2=A0 .../admin-guide/laptops/uniwill-laptop.rst=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 68 +
>> =C2=A0 Documentation/wmi/devices/uniwill-laptop.rst=C2=A0 |=C2=A0 109 +=
+
>> =C2=A0 Documentation/wmi/devices/uniwill-wmi.rst=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 52 +
>> =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 17 +
>> =C2=A0 drivers/platform/x86/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 2 +
>> =C2=A0 drivers/platform/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0 3 +
>> =C2=A0 drivers/platform/x86/uniwill/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 49 +
>> =C2=A0 drivers/platform/x86/uniwill/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 8 +
>> =C2=A0 drivers/platform/x86/uniwill/uniwill-laptop.c | 1477 +++++++++++=
++++++
>> =C2=A0 drivers/platform/x86/uniwill/uniwill-wmi.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 178 ++
>> =C2=A0 drivers/platform/x86/uniwill/uniwill-wmi.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 122 ++
>> =C2=A0 13 files changed, 2139 insertions(+)
>> =C2=A0 create mode 100644=20
>> Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> =C2=A0 create mode 100644=20
>> Documentation/admin-guide/laptops/uniwill-laptop.rst
>> =C2=A0 create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>> =C2=A0 create mode 100644 Documentation/wmi/devices/uniwill-wmi.rst
>> =C2=A0 create mode 100644 drivers/platform/x86/uniwill/Kconfig
>> =C2=A0 create mode 100644 drivers/platform/x86/uniwill/Makefile
>> =C2=A0 create mode 100644 drivers/platform/x86/uniwill/uniwill-laptop.c
>> =C2=A0 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
>> =C2=A0 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h
>>
