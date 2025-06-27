Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969C01E521D;
	Fri, 27 Jun 2025 23:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751065280; cv=none; b=eshmvrfsZ42s7TGmNubWm2FHz+h4qPN3Sga2iBht3v3EGgbGYhCaVXkf02aqw8LlNEQAeqLKTZCAW7U4vX7IODE6ZkfYXcfzKzqAwigH4P+kmmyZAtj/f0HeSEaZELZBBmw6IPiqfx4zZVGbSU1/VlmsFb9o6+IFr9dqqLl3+e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751065280; c=relaxed/simple;
	bh=UphjruZ7ku5y054XVzILDzzMMQ+jyk8kILerc8SVjjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TSz4N/b8wWLS30hpXFaUh6NFCjOMg/TAcay7Un22C+LMiNxee3SC28aQ1ksOinbIDP5W2DF5b7WDxXe7CMFdlS2u65BMqecop6nG3pAsx9nkEBky9L3Czc+PhTYCYgIa1Nof21+/uDANiqsCsbbkd456Y6K/Thjsf6FY/98nIHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=YkrMtLgO; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="YkrMtLgO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1751065264; x=1751670064; i=w_armin@gmx.de;
	bh=Os6H+MV8daYceFBocNQgXHKEVFSkyxfMDj45sTAz04Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YkrMtLgObqnWJ8m33e7iehfiax/Dth8eM/KRLbXpJm6RdBk+VonmAoCT1WlDyvbh
	 UsLWF49SY0P7uqCEkGIckNeI8zgJTGbPI0mvyq6wjt7gK2yASvI5K8ZYthJJj7PrT
	 PwRkNYDqp7QOlE/selI+fch2tS2ZwdRUAOtCGmb9Q9aLieg9iPmnA2sGl89jBqOtA
	 r7pBndxj2ZcO8EmNjnppShoNZ0KCtoFY5EYZT0+k8p4VaTNptujtLGBqEdq8Il9vw
	 VNG5tq7SenjXllLtVhlWmAM2Z/YK1WahFzsWI2shslrAqPQ62Ao2jjsiHOJLcDJtg
	 LRlP9sgL1B9EMI9eXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1psI-1uT6D21Iqm-000ftL; Sat, 28
 Jun 2025 01:01:04 +0200
Message-ID: <50361e3c-c947-4df8-97fd-4963d18ee4f2@gmx.de>
Date: Sat, 28 Jun 2025 01:01:01 +0200
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
 <fb08672d-881b-458c-b8ed-1a27ca93fe7d@gmx.de>
 <DAXMVOI4AXHY.18HUV9THTG0DJ@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <DAXMVOI4AXHY.18HUV9THTG0DJ@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JoE1U66/T66GLnjsMNtM/BckH5sx3eU/885pIQtsjmF4ierjeDE
 gtqxH/s+HOmI1YacKKMnr8oArF4+RV5K1Jlnjq+zJ8YuzIZOu2L8KidRWJ/0ueTulUq7/9g
 RSTxW/6vnelJyR9mbOJL4hSSmfcqXWVdkCFPyQLG8mnSbbkOCO6xlgPMEVKOmbpBg5H2X2n
 2aMhcJ0LjtTr7AdcY83ug==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lG550R3BJLU=;h6xK6C0qLx3iml8tcIuVEZNLb+K
 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

Am 27.06.25 um 23:29 schrieb Kurt Borja:

> On Fri Jun 27, 2025 at 6:17 PM -03, Armin Wolf wrote:
>> Am 27.06.25 um 22:38 schrieb Kurt Borja:
>>
>>> Hi Armin,
>>>
>>> On Fri Jun 27, 2025 at 4:54 PM -03, Armin Wolf wrote:
>>>> Not all devices support audio mute and microphone mute LEDs, so the
>>>> explicitly checks for hardware support while probing. However missing
>>>> hardware features are treated as errors, causing the driver so fail
>>>> probing on devices that do not support both LEDs.
>>>>
>>>> Fix this by simply ignoring hardware features that are not present.
>>>> This way the driver will properly load on devices not supporting both
>>>> LEDs and will stop throwing error messages on devices with no LEDS
>>>> at all.
>>> This patch makes me wonder what is the policy around issues like this.
>>> In fact I've submitted and changes that do the exact opposite :p
>>> Like commit: 4630b99d2e93 ("platform/x86: dell-pc: Propagate errors wh=
en
>>> detecting feature support")
>>>
>>> IMO missing features should be treated as errors. i.e. The probe shoul=
d
>>> fail.
>> IMHO the probe should only fail if some features are deemed essential, =
like
>> required ACPI methods. Optional features like in this case LEDs should =
be
>> handled by the driver in a graceful manner if possible.
>>
>>> Quoting documentation [1]:
>>>
>>> 	If a match is found, the device=E2=80=99s driver field is set to the
>>> 	driver and the driver=E2=80=99s probe callback is called. This gives =
the
>>> 	driver a chance to verify that it really does support the
>>> 	hardware, and that it=E2=80=99s in a working state.
>>>
>>> And again [2]:
>>>
>>> 	This callback holds the driver-specific logic to bind the driver
>>> 	to a given device. That includes verifying that the device is
>>> 	present, that it=E2=80=99s a version the driver can handle, that driv=
er
>>> 	data structures can be allocated and initialized, and that any
>>> 	hardware can be initialized.
>>>
>>> Both of these makes me wonder if such a "fail" or error message should
>>> be fixed in the first place. In this case the probe correctly checks f=
or
>>> device support and fails if it's not found, which is suggested to be t=
he
>>> correct behavior.
>> The driver should only fail probing if it cannot handle some missing fe=
atures.
>> In this case however both features (audio mute LED and mic mute LED) ar=
e completely
>> optional and the driver should not fail to load just because one of the=
m is absent.
> I agree, both are individually optional, but at least one should be
> required.
>
>> Just think about machines supporting only a single LED (audio or mic mu=
te). Currently
>> the driver would fail to load on such devices leaving the users with no=
thing.
> That's very true.
>
> But I do still think if both fail the probe should still fail. Maybe
> there is a way to accomplish this?
>
> I'm thinking of something like
>
> if (lenovo_super_hotkey_wmi_led_init(MIC_MUTE, dev) ||
>      lenovo_super_hotkey_wmi_led_init(AUDIO_MUTE, dev))
>      return -ENODEV;
>
> What do you think?

Normally i would agree to such a thing, but in this case the underlying WM=
I device
supports many more functions that are currently not supported by this driv=
er. Additionally
the driver cannot control when the WMI device is registered, so it has to =
be prepared to
encounter a device without the features it supports.

Also keep in mind that a failing probe attempt produces a irritating error=
 message.

>>> BTW this also leaks `wpriv`, which would remain allocated for no reaso=
n.
>> wpriv will be freed using devres, so no memory leak here. However i adm=
it that there is
>> some room for optimizations, however i leave this to the maintainer of =
the driver in
>> question.
> Leak was a bit of an overstatement :) But if both features are missing
> it would be kinda leaked, in practice.

I see, however i would leave this to the maintainer of the driver because =
i have no hardware
to test the resulting patches :/.

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
>>
>>>
>>> [1] https://docs.kernel.org/driver-api/driver-model/binding.html
>>> [2] https://docs.kernel.org/driver-api/driver-model/driver.html
>>>
>
