Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AF627442;
	Sun, 29 Jun 2025 22:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751237554; cv=none; b=aL6jtnwUfHhWNkspzCjoO3vpOBLwmB8mYODTkp+ZgiX91JUY0SG3xNFDFJTQmHE6NiltOIDJDyr27Qs4J6a2FYDmWOcMzEAwMxOHoi5K4VjuSaGbmWRCkZR04RRrKxo9GOIXIvx4pO1o99rChVYlOxxppLXEcy9GeAmqKJNBpE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751237554; c=relaxed/simple;
	bh=rvm0SVykY3q0tN1MojpkEXUiiuD5k1BE9nznQCcJxq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DUGJ3g7GpVFL2UR7GfwCyyG7hKEu3hoar6EP3SclDYKHiKILuK43unbPviW3a9uvEaA11QuxrcVnWX03Mna69QrgQjjo7iw7qcYLCM9wTNOdn+zzZNZdlXw/11GX67M0Y19aVwOS4fOIqtmwMxw5quQU2Dk5mJqabjnqlVbAkaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MzYE2QFb; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MzYE2QFb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1751237542; x=1751842342; i=w_armin@gmx.de;
	bh=mz3FpkdkHJQaiSyXomXcgEhha4poTzmmkBzxDccCBF4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MzYE2QFbYHdk/CFY4tWDXUDR/SMXlc+HPBR2fulzNIvNy2DcI1FHmajemAKm6upF
	 jdD5thRqsQX9QO6nCixH8Hfr++we8hyROuVqEQWmRHBu78+u/oZWqdWnAlar+2aPm
	 ZFf/o+zteDNSF//VfnApt4CAsKlUXTSOoX5mieikzZpNpQml8oeBl35ZQ87c/2pSD
	 Q8fMXlWGkZmCbggWn7JpGk6/VEGen/KntT8VAg3ou1672YLh6DQmT8Hwby/yjPy5Z
	 /tcuKhEQIp8NhhDRoIh2TqZwV7LFa2qXRSevfGX163YOprY1zsAL7QPbn+IlL1S2v
	 AmuotcU6LMxY0uq8Sg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7QxL-1um5tI3v93-0163sS; Mon, 30
 Jun 2025 00:52:22 +0200
Message-ID: <e6426b13-0ed4-4740-9ac4-1aecc80c6f3f@gmx.de>
Date: Mon, 30 Jun 2025 00:52:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: lenovo-hotkey: Handle missing hardware
 features gracefully
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Kurt Borja <kuurtb@gmail.com>,
 Jackie Dong <xy-jackie@139.com>, alireza.bestboyy@gmail.com,
 atescula@gmail.com
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250627195436.3877-1-W_Armin@gmx.de>
 <DAXLSMRH9E6Y.3Q8Z59YG2B50C@gmail.com>
 <fb08672d-881b-458c-b8ed-1a27ca93fe7d@gmx.de>
 <DAXMVOI4AXHY.18HUV9THTG0DJ@gmail.com>
 <50361e3c-c947-4df8-97fd-4963d18ee4f2@gmx.de>
 <7f2496e7-7092-46a2-885f-8e8f44fc0af1@app.fastmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <7f2496e7-7092-46a2-885f-8e8f44fc0af1@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:E1Enxi+ylKjoISJa7OwWMqmoALh3AT+cbXHVNqAg5mOq0n1nMGG
 +D5kFNiiJ9CNmtmgZjW8swt5bKTIK1Yp4eB4u5nXL4jAAhm7usIESUkK+/Cz5g4N5E6LSeL
 PlCsPtYbS/IyKA5EyintMDwxBUV7TJMbDbqzQlZUD/VuE/boD09nzhCSfIG0TFsoCZuBLkz
 hzsDJAJKqkkCK2dijGoRQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qriN5TET4Ko=;zPXVe0s6/94jk8RSAzmzm+TPb2U
 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

Am 29.06.25 um 22:36 schrieb Mark Pearson:

> Hi Armin & Kurt,
>
> On Sat, Jun 28, 2025, at 8:01 AM, Armin Wolf wrote:
>> Am 27.06.25 um 23:29 schrieb Kurt Borja:
>>
>>> On Fri Jun 27, 2025 at 6:17 PM -03, Armin Wolf wrote:
>>>> Am 27.06.25 um 22:38 schrieb Kurt Borja:
>>>>
>>>>> Hi Armin,
>>>>>
>>>>> On Fri Jun 27, 2025 at 4:54 PM -03, Armin Wolf wrote:
>>>>>> Not all devices support audio mute and microphone mute LEDs, so the
>>>>>> explicitly checks for hardware support while probing. However missi=
ng
>>>>>> hardware features are treated as errors, causing the driver so fail
>>>>>> probing on devices that do not support both LEDs.
>>>>>>
>>>>>> Fix this by simply ignoring hardware features that are not present.
>>>>>> This way the driver will properly load on devices not supporting bo=
th
>>>>>> LEDs and will stop throwing error messages on devices with no LEDS
>>>>>> at all.
>>>>> This patch makes me wonder what is the policy around issues like thi=
s.
>>>>> In fact I've submitted and changes that do the exact opposite :p
>>>>> Like commit: 4630b99d2e93 ("platform/x86: dell-pc: Propagate errors =
when
>>>>> detecting feature support")
>>>>>
>>>>> IMO missing features should be treated as errors. i.e. The probe sho=
uld
>>>>> fail.
>>>> IMHO the probe should only fail if some features are deemed essential=
, like
>>>> required ACPI methods. Optional features like in this case LEDs shoul=
d be
>>>> handled by the driver in a graceful manner if possible.
>>>>
>>>>> Quoting documentation [1]:
>>>>>
>>>>> 	If a match is found, the device=E2=80=99s driver field is set to th=
e
>>>>> 	driver and the driver=E2=80=99s probe callback is called. This give=
s the
>>>>> 	driver a chance to verify that it really does support the
>>>>> 	hardware, and that it=E2=80=99s in a working state.
>>>>>
>>>>> And again [2]:
>>>>>
>>>>> 	This callback holds the driver-specific logic to bind the driver
>>>>> 	to a given device. That includes verifying that the device is
>>>>> 	present, that it=E2=80=99s a version the driver can handle, that dr=
iver
>>>>> 	data structures can be allocated and initialized, and that any
>>>>> 	hardware can be initialized.
>>>>>
>>>>> Both of these makes me wonder if such a "fail" or error message shou=
ld
>>>>> be fixed in the first place. In this case the probe correctly checks=
 for
>>>>> device support and fails if it's not found, which is suggested to be=
 the
>>>>> correct behavior.
>>>> The driver should only fail probing if it cannot handle some missing =
features.
>>>> In this case however both features (audio mute LED and mic mute LED) =
are completely
>>>> optional and the driver should not fail to load just because one of t=
hem is absent.
>>> I agree, both are individually optional, but at least one should be
>>> required.
>>>
>>>> Just think about machines supporting only a single LED (audio or mic =
mute). Currently
>>>> the driver would fail to load on such devices leaving the users with =
nothing.
>>> That's very true.
>>>
>>> But I do still think if both fail the probe should still fail. Maybe
>>> there is a way to accomplish this?
>>>
>>> I'm thinking of something like
>>>
>>> if (lenovo_super_hotkey_wmi_led_init(MIC_MUTE, dev) ||
>>>       lenovo_super_hotkey_wmi_led_init(AUDIO_MUTE, dev))
>>>       return -ENODEV;
>>>
>>> What do you think?
>> Normally i would agree to such a thing, but in this case the underlying
>> WMI device
>> supports many more functions that are currently not supported by this
>> driver. Additionally
>> the driver cannot control when the WMI device is registered, so it has
>> to be prepared to
>> encounter a device without the features it supports.
>>
>> Also keep in mind that a failing probe attempt produces a irritating
>> error message.
>>
>>>>> BTW this also leaks `wpriv`, which would remain allocated for no rea=
son.
>>>> wpriv will be freed using devres, so no memory leak here. However i a=
dmit that there is
>>>> some room for optimizations, however i leave this to the maintainer o=
f the driver in
>>>> question.
>>> Leak was a bit of an overstatement :) But if both features are missing
>>> it would be kinda leaked, in practice.
>> I see, however i would leave this to the maintainer of the driver
>> because i have no hardware
>> to test the resulting patches :/.
>>
> As a note, I'm on vacation for three weeks and avoiding accessing work e=
mails, so won't be able to discuss this with Jackie properly until I'm bac=
k.
>
> For history/context - this particular driver was a bit of a oddity as th=
e Ideapads aren't in the Lenovo Linux program (hope they will be one day).=
 We had a Thinkbook that is using the same LUDS interface, that we were Li=
nux certifying, and LED support is a requirement to work.
>
> I do think this needs revisiting a bit. I am leaning to agreeing that it=
 shouldn't error out - but we were also being careful to not have this cau=
se problems on HW we ourselves don't have access to. It would be nice if i=
t could be extended to more platforms though.
>
> I don't have the specs handy right now (would need to go on the Lenovo V=
PN for that). Is it OK if we re-visit this when I'm back at home and worki=
ng?
> Jackie - please do have a look and think about this in the meantime.
>
> Mark

Sure thing, we can wait a bit here. The issue is a purely cosmetic one (er=
ror message on devices without both LEDs), so we can take
our time.

Thanks,
Armin Wolf

