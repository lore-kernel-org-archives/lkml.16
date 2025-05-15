Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC861361
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747331297; cv=none; b=AaSrgE3RjUXj1ON7KccUaRa5+IyclM6iBaVMhP+enEafc1rHBWxiLQqAdFt7TTnPJ58s2frsnb+Cncw+UPUdlUO5MJxZvXPw6LrVZOxep/f8WckZWxCXy0m6eB7TqXN8rRGni25v5ICptdU/yQnPjlq/N1aJYoYffSeNz63ngGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747331297; c=relaxed/simple;
	bh=9Bzjrt/aF1wmcItkdOAGOOGhJsKy/3Mmy3qeEpi024M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=ccXwF0Yk5++pIRjVgMQdTHjeQipo+4+U8D3k0DQKV8p7BQp9/Nq6xikmGnY/2fiyWnW7l4eNn4pWvCj2jq6czzKTq488suMdpuyNulRZyHzdDz1DqM/tlP0nmtRfbqJif6io0QL3eDvfbhsftIe6dTHMJ/WuShSK0OL2aPDlTWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=mDbhAmbl; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="mDbhAmbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1747331285; x=1747936085; i=wahrenst@gmx.net;
	bh=9Bzjrt/aF1wmcItkdOAGOOGhJsKy/3Mmy3qeEpi024M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mDbhAmblAy20JhmWQ1dQeytX+gMC0aEjHCqin1DH5klyo1DIyqE+1gfjKrS6wL+8
	 3spGNUkTPEIcHy/RMf3+CdCLsCkGkDgJxJe6FsqO1os/Kqs3yrmpTvAzADF3kb/p3
	 z/wXRjeuIOaMQjZV/xDQsEviQBtXgmUfe9Nzo0UXgk6oKiOx+cq4mfCAUG1NP/FD3
	 xXXXohSaPS1KERTLlvX3p4NhJ+NZiYcys8moN2mLOrlBgfTdHk0sIw2ATaLmOu4qe
	 gvy68ysJDSPwP6ZMKxd2ifC/e+ehDYi8C3SPsAQhL1D0j19JM0ZoU0U9RZ+53gJby
	 6/2V4FjyQDKj71gs1w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.103] ([91.41.216.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOiHf-1ucWzK2iul-00JN2F; Thu, 15
 May 2025 19:48:05 +0200
Message-ID: <0703ff48-e781-49b6-8a8d-7cdbec73bb92@gmx.net>
Date: Thu, 15 May 2025 19:48:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware/raspberrypi: raise timeout to 3s
To: Etienne Buira <etienne.buira@free.fr>
References: <aCIiEp3CXD2o9dTw@Z926fQmE5jqhFMgp6>
 <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>
 <aCWMrJcldfrsNTQq@Z926fQmE5jqhFMgp6>
 <ffeb860f-5522-4130-ae47-45a6068b17ea@gmx.net>
 <aCW3d7tc27Awj62K@Z926fQmE5jqhFMgp6>
 <cecda824-4f47-4e4c-bee9-1a59cd5d801c@gmx.net>
 <aCXUeOmy28tqg6Oy@Z926fQmE5jqhFMgp6>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org
In-Reply-To: <aCXUeOmy28tqg6Oy@Z926fQmE5jqhFMgp6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:g+68iJNx6FnST12fqo/EXY2IF4DdWYiZuDaXzPhQRM4V1072fy7
 ybK5ykmDexDoZKcjo8CapV1bWzEwfK8x9fCScKw2EGvK9LBNVC4abUuberKL1blWxITaaFV
 ofVydJqlbApls0WWuXNr87EMOCU1A19En4eRqeNbDMfyXCRheOSyDlgDF20XJ2UnT/RuohJ
 2MetqC6EY0/J1zC57z+6g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+nYBk95IOFI=;aSSSDBTxUfgZDpSFcbQ1bzaBZ9Q
 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
 tvbEVbHq0nPfu0glRmjWJf5pqSg/XGeE3l

Hi Etienne,

Am 15.05.25 um 13:48 schrieb Etienne Buira:
> On Thu, May 15, 2025 at 12:31:38PM +0200, Stefan Wahren wrote:
>> Am 15.05.25 um 11:44 schrieb Etienne Buira:
>>> Hi Stefan, and thank you for your interest.
>>>
>>> On Thu, May 15, 2025 at 09:42:43AM +0200, Stefan Wahren wrote:
>>>> Hi Etienne,
>>>>
>>>> Am 15.05.25 um 08:41 schrieb Etienne Buira:
>>>>> On Wed, May 14, 2025 at 06:20:32PM +0200, Stefan Wahren wrote:
>>>>>> Hi Etienne,
>>>>>>
>>>>>> Am 12.05.25 um 18:30 schrieb Etienne Buira:
>>>>> ../..
>>>>>> Out of curiosity and because i never saw this issue, could you plea=
se
>>>>>> provide more details?
>>>>>> There is nothing connected to HDMI 0 & 1 ?
>>>>>> Which firmware version are you running?
>>>> Please provide the dmesg output, so we can extract the firmware versi=
on.
>>> Firmware version is 2025-02-17T20:03:07, i also attach the full gzippe=
d
>>> dmesg, as long as a patch of extra traces used.
>>> I did not specifically test other firmware versions for the timeout
>>> issue (but i did for video output).
>> Thanks, i'll try to reproduce.
>>
>> Sorry, i forgot but is this reproducible with a recent stable 6.12.x ke=
rnel?
> Just reproduced with pristine 6.12.28.
>
okay, i've update the firmware on my older Raspberry Pi 4 to the same=20
version as yours. But even with your configuration i don't see this kind=
=20
of fallout. So I think we shouldn't apply this patch until we really=20
know what's going on.

You don't have another Raspberry Pi 4 by any chance?
Another cause might be the toolchain. Currently I use a not so fresh gcc=
=20
11.3.1 from Linaro.

Except of this, I noticed that your configuration doesn't enable=20
DWC2_DUAL_ROLE and the LEDS_TRIGGER.

Best regards

