Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54330288DA
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747394267; cv=none; b=t00xVrBT+lugLZZt1Um6eDaXiFjnJJUw8o312b+mMDTr9+SoZ6mhhYlObqOeYVF9ZMPjbEovqpwisAO0iEmEz3xGDZzvVYFTj+McIyw+b0LSF067WbjcjF/rcyXnfk9l94GiEox7fktlmPeUGQHE+izbVkSFuR/9Im1oBV5/LTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747394267; c=relaxed/simple;
	bh=DVqwDtcCWBl7UTuRuXRA8ctOOQGibZdxGhys65KoJHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jKsIkZFvW8eWAiwUnv65+nwmOXwXIH5ycQxC7Jy4BjODid2oY8KPdw6tyJ9Zh26+lawmgt9lEtYYy0L4jvdJx7hjnDVJm0ZrwaD+3kLJmieQjRH56kpzWobnGjxUJ5EERDznuchc97NntPWdWqwYfYIpi6bxETL9ZYGxvffKG/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=twivDTwL; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="twivDTwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1747394262; x=1747999062; i=wahrenst@gmx.net;
	bh=DVqwDtcCWBl7UTuRuXRA8ctOOQGibZdxGhys65KoJHc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=twivDTwLlDLsTBXJHjtn/svTMr9a4mvDCIiuh5rVqH0ukYcY71h7zTq5CVdWuJ7x
	 ClO50Qy92PeIXGoefwjmfMShwlXumOnZ3QTasCAJAV7eysu3Z2ZBX9mzi7Hrtp56I
	 BSS2G5qcMRMLE4J+w7Hweq4YdR6+Da/bOXkCVi+ZbKlUhvTKBm5LmPAUgWrrL3bqg
	 Y1UAih/oN/bGiMH8B2TOwEejKIJTbvnugwr67yw1p06V7UJYX1PLFdB/8I8wlwesa
	 OvneQVqYx9QAjRCPZYhvlSLbo4VuPXBX1A1B9SN7Wiglmy5GdRX5Xf/V9lIDlLJRg
	 dueDUwYTmvTa+6ARuA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.103] ([91.41.216.208]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgNcz-1utrib1OHf-00ej5f; Fri, 16
 May 2025 13:17:42 +0200
Message-ID: <77f25ee5-1079-4729-866c-cfdeeff1ad9a@gmx.net>
Date: Fri, 16 May 2025 13:17:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware/raspberrypi: raise timeout to 3s
To: Etienne Buira <etienne.buira@free.fr>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org
References: <aCIiEp3CXD2o9dTw@Z926fQmE5jqhFMgp6>
 <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>
 <aCWMrJcldfrsNTQq@Z926fQmE5jqhFMgp6>
 <ffeb860f-5522-4130-ae47-45a6068b17ea@gmx.net>
 <aCW3d7tc27Awj62K@Z926fQmE5jqhFMgp6>
 <cecda824-4f47-4e4c-bee9-1a59cd5d801c@gmx.net>
 <aCXUeOmy28tqg6Oy@Z926fQmE5jqhFMgp6>
 <0703ff48-e781-49b6-8a8d-7cdbec73bb92@gmx.net>
 <aCZqVzM5h9lwbfpQ@Z926fQmE5jqhFMgp6>
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
In-Reply-To: <aCZqVzM5h9lwbfpQ@Z926fQmE5jqhFMgp6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/5QlBpXfawZjhqctYTy/lPDxEfavvKrpt71RkPFushWFfjs0AUk
 q4lNEDGkU5gzNnO0ORg986ggbZr9BoYTTtHXxyi1Sf/feUplakbuBgXpomlBvyD1lNIGjrU
 cngrfJGa0J/kXarintpBcy1VZYp7x+CbkffZhlSgBxuP/pNoUTzAUma9Oe66Y6MYUUy4uNT
 1AwpkP+1UZGuU8hoXK+rw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:B6SZw/f9dY8=;a+rIg0fElLTftbgu53ff8rMlwJW
 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
 +e7+jSKzQWr+77wB/q/oww=

Am 16.05.25 um 00:27 schrieb Etienne Buira:
> Hi Stefan
>
> On Thu, May 15, 2025 at 07:48:04PM +0200, Stefan Wahren wrote:
>> Hi Etienne,
>>
>> Am 15.05.25 um 13:48 schrieb Etienne Buira:
>>> On Thu, May 15, 2025 at 12:31:38PM +0200, Stefan Wahren wrote:
>>>> Am 15.05.25 um 11:44 schrieb Etienne Buira:
>>>>> Hi Stefan, and thank you for your interest.
>>>>>
>>>>> On Thu, May 15, 2025 at 09:42:43AM +0200, Stefan Wahren wrote:
>>>>>> Hi Etienne,
>>>>>>
>>>>>> Am 15.05.25 um 08:41 schrieb Etienne Buira:
>>>>>>> On Wed, May 14, 2025 at 06:20:32PM +0200, Stefan Wahren wrote:
>>>>>>>> Hi Etienne,
>>>>>>>>
>>>>>>>> Am 12.05.25 um 18:30 schrieb Etienne Buira:
>>>>>>> ../..
>>>>>>>> Out of curiosity and because i never saw this issue, could you pl=
ease
>>>>>>>> provide more details?
>>>>>>>> There is nothing connected to HDMI 0 & 1 ?
>>>>>>>> Which firmware version are you running?
>>>>>> Please provide the dmesg output, so we can extract the firmware ver=
sion.
>>>>> Firmware version is 2025-02-17T20:03:07, i also attach the full gzip=
ped
>>>>> dmesg, as long as a patch of extra traces used.
>>>>> I did not specifically test other firmware versions for the timeout
>>>>> issue (but i did for video output).
>>>> Thanks, i'll try to reproduce.
>>>>
>>>> Sorry, i forgot but is this reproducible with a recent stable 6.12.x =
kernel?
>>> Just reproduced with pristine 6.12.28.
>>>
>> okay, i've update the firmware on my older Raspberry Pi 4 to the same
>> version as yours. But even with your configuration i don't see this kin=
d
>> of fallout. So I think we shouldn't apply this patch until we really
>> know what's going on.
> Ok, thank you, did you make sure a powered hdmi sink were connected? I
> noticed there is no timeout if no hdmi is plugged (but there were when
> monitor were powered off, maybe specific to my monitor).
Yes, HDMI monitor was connected to HDMI 0 and powered on. Raspberry Pi=20
OS started as expected.

The fact that your SDIO interface triggers a warning, which I also don't=
=20
get let me think this is not just related to HDMI interface.

[=C2=A0=C2=A0=C2=A0 3.603736] mmc0: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D SDHCI REGISTER DUMP =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[=C2=A0=C2=A0=C2=A0 3.603739] mmc0: sdhci: Sys addr:=C2=A0 0x00000000 | Ve=
rsion: 0x00009902
[=C2=A0=C2=A0=C2=A0 3.646852] mmc0: sdhci: Blk size:=C2=A0 0x00000000 | Bl=
k cnt: 0x00000000
[=C2=A0=C2=A0=C2=A0 3.646856] mmc0: sdhci: Argument:=C2=A0 0x00000000 | Tr=
n mode: 0x00000000
[=C2=A0=C2=A0=C2=A0 3.646859] mmc0: sdhci: Present:=C2=A0=C2=A0 0x01ff0001=
 | Host ctl: 0x00000000
[=C2=A0=C2=A0=C2=A0 3.665697] mmc0: sdhci: Power:=C2=A0=C2=A0=C2=A0=C2=A0 =
0x0000000f | Blk gap: 0x00000000
[=C2=A0=C2=A0=C2=A0 3.672214] mmc0: sdhci: Wake-up:=C2=A0=C2=A0 0x00000000=
 | Clock: 0x00003947
[=C2=A0=C2=A0=C2=A0 3.678736] mmc0: sdhci: Timeout:=C2=A0=C2=A0 0x00000000=
 | Int stat: 0x00000000
[=C2=A0=C2=A0=C2=A0 3.685254] mmc0: sdhci: Int enab:=C2=A0 0x00ff0003 | Si=
g enab: 0x00ff0003
[=C2=A0=C2=A0=C2=A0 3.685257] mmc0: sdhci: ACmd stat: 0x00000000 | Slot in=
t: 0x00000000
[=C2=A0=C2=A0=C2=A0 3.685260] mmc0: sdhci: Caps:=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x00000000 | Caps_1: 0x00000000
[=C2=A0=C2=A0=C2=A0 3.712672] mmc0: sdhci: Cmd:=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00000000 | Max curr: 0x00000001
[=C2=A0=C2=A0=C2=A0 3.719186] mmc0: sdhci: Resp[0]:=C2=A0=C2=A0 0x00000000=
 | Resp[1]: 0x00000000
[=C2=A0=C2=A0=C2=A0 3.725708] mmc0: sdhci: Resp[2]:=C2=A0=C2=A0 0x00000000=
 | Resp[3]: 0x00000000
[=C2=A0=C2=A0=C2=A0 3.732230] mmc0: sdhci: Host ctl2: 0x00000000
[=C2=A0=C2=A0=C2=A0 3.736724] mmc0: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[=C2=A0=C2=A0=C2=A0 3.819205] mmc0: new high speed SDIO card at address 00=
01
>
>> You don't have another Raspberry Pi 4 by any chance?
> No, i don't.
>
>> Another cause might be the toolchain. Currently I use a not so fresh gc=
c
>> 11.3.1 from Linaro.
> Previous tries were cross built. I tried a native build with (Gentoo
> packages) gcc 14.2.1_p20241221, binutils 2.44, and glibc 2.40-r8; but
> got same result.
> Will do a software upgrade overnight to try with more up to date build
> system.
I will try to update my toolchain, but this will take some time.
>
>> Except of this, I noticed that your configuration doesn't enable
>> DWC2_DUAL_ROLE and the LEDS_TRIGGER.
> I have no use of them (and i have a lot of things to disable, but i
> prefer to do that starting with a working system).
I this case you can disable DWC2 completely, because USB host is=20
provided by xhci driver. LEDS_TRIGGER is used for the ACT LED as heartbeat=
.
>
> Regards.
>

