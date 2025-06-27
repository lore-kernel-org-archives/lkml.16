Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FD225D216;
	Fri, 27 Jun 2025 21:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059072; cv=none; b=dwZpxjIm3lIG1jvzpabGRWDcN0hRAYrz6SpfEV3AJSNJyNnxXd2Tw5TaqEoi6saLgrmduStVgaSusltJzrQRtXmjOXWwkvF/GGOr98TqaB0/EJ/nf9UQR/0r6QMTQvk/5sPj+aUmYpuY2NZviiSSv6Po9c/sTSf9L5stBsk8TR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059072; c=relaxed/simple;
	bh=46OzNVkRxRjwuY8XahBfoPsnWrf5p8qI7Kq0sySJayA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hy8gsbIaH8OtBNnVxWTFy2ZnEq9gw7Gn3ABfdkLZK5oMtd0y79mjxZsMkhdwtEs+AfWqmN3uIWiA3ZuoHXORBMubfkRaVeH7vHE7obiBeMYvHW/iJMvXcdb9JYuVo+0A3LC+PbOAb7hZhydvRjpb2YZpSLk86Nf+UmiYMjmebBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=S9ahRf3d; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="S9ahRf3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1751059058; x=1751663858; i=w_armin@gmx.de;
	bh=jZHU1RbRiYRaSMJ0ICMNw2hfoCZDDrQwKqqd8k29eMA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=S9ahRf3dLAZfHCOc8AHyqnjBsDqsWg1u7oAcfPo9nm/IrXnHC3HyucEaRpbS+4zT
	 bXRd8t2STcm2dOFqB1pLaz2oncMwqoi7Kvx4SAEiTMEEudDZNyHNaI9ScN2aT4mRI
	 2U644rFJedzeExIlS/OLkKgsQiMI5Lt3MC9dJO6xk+u1cvlzY+8VdcaSlUFWNk5mO
	 qva6Ewh8ezWDrMg+fiAC6nUqfdoc9xk2f/v4R8iR1Gk56hmyw5w9qqV0XooZtbf2H
	 5rmRrz+lQi1HtmBjAdEC7W71WtW80CuJjGpcSsMtArNKAkCF+Av+6BFoFQEr5yFU5
	 xjIJ7o/4uhqG/n8gWg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MG9kM-1uWPZG14g8-00F3Il; Fri, 27
 Jun 2025 23:17:38 +0200
Message-ID: <fb08672d-881b-458c-b8ed-1a27ca93fe7d@gmx.de>
Date: Fri, 27 Jun 2025 23:17:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: lenovo-hotkey: Handle missing hardware
 features gracefully
To: Kurt Borja <kuurtb@gmail.com>, xy-jackie@139.com,
 alireza.bestboyy@gmail.com, atescula@gmail.com
Cc: mpearson-lenovo@squebb.ca, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250627195436.3877-1-W_Armin@gmx.de>
 <DAXLSMRH9E6Y.3Q8Z59YG2B50C@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <DAXLSMRH9E6Y.3Q8Z59YG2B50C@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UvXVT1TB/Ek01zfMDBBMQTq4WM4cGzR5yw2DyTKoTIWZ1+Ngdlu
 ekH/NjkIDeafqshfSM6keOo1+Nxbh36iDgR21cRqPRV23x/0UPsQLlV4SdjqGlOsH+yjN6Q
 Q33dWFmzSk8Ex6DDv/NuoXodlX/6OuOa3TwMTOG/VeaJksT3cdeLp6LNdUMzb1U9hXIa39E
 1pnIj8ECbJpbViHwPXFXA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Rh80T3zbNJ4=;bJqJILA0GDaG5sPCQ8QDnay4QVn
 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

Am 27.06.25 um 22:38 schrieb Kurt Borja:

> Hi Armin,
>
> On Fri Jun 27, 2025 at 4:54 PM -03, Armin Wolf wrote:
>> Not all devices support audio mute and microphone mute LEDs, so the
>> explicitly checks for hardware support while probing. However missing
>> hardware features are treated as errors, causing the driver so fail
>> probing on devices that do not support both LEDs.
>>
>> Fix this by simply ignoring hardware features that are not present.
>> This way the driver will properly load on devices not supporting both
>> LEDs and will stop throwing error messages on devices with no LEDS
>> at all.
> This patch makes me wonder what is the policy around issues like this.
> In fact I've submitted and changes that do the exact opposite :p
> Like commit: 4630b99d2e93 ("platform/x86: dell-pc: Propagate errors when
> detecting feature support")
>
> IMO missing features should be treated as errors. i.e. The probe should
> fail.

IMHO the probe should only fail if some features are deemed essential, lik=
e
required ACPI methods. Optional features like in this case LEDs should be
handled by the driver in a graceful manner if possible.

>
> Quoting documentation [1]:
>
> 	If a match is found, the device=E2=80=99s driver field is set to the
> 	driver and the driver=E2=80=99s probe callback is called. This gives th=
e
> 	driver a chance to verify that it really does support the
> 	hardware, and that it=E2=80=99s in a working state.
>
> And again [2]:
>
> 	This callback holds the driver-specific logic to bind the driver
> 	to a given device. That includes verifying that the device is
> 	present, that it=E2=80=99s a version the driver can handle, that driver
> 	data structures can be allocated and initialized, and that any
> 	hardware can be initialized.
>
> Both of these makes me wonder if such a "fail" or error message should
> be fixed in the first place. In this case the probe correctly checks for
> device support and fails if it's not found, which is suggested to be the
> correct behavior.

The driver should only fail probing if it cannot handle some missing featu=
res.
In this case however both features (audio mute LED and mic mute LED) are c=
ompletely
optional and the driver should not fail to load just because one of them i=
s absent.

Just think about machines supporting only a single LED (audio or mic mute)=
. Currently
the driver would fail to load on such devices leaving the users with nothi=
ng.

>
> BTW this also leaks `wpriv`, which would remain allocated for no reason.

wpriv will be freed using devres, so no memory leak here. However i admit =
that there is
some room for optimizations, however i leave this to the maintainer of the=
 driver in
question.

Thanks,
Armin Wolf

>
>
> [1] https://docs.kernel.org/driver-api/driver-model/binding.html
> [2] https://docs.kernel.org/driver-api/driver-model/driver.html
>
