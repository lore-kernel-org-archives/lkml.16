Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B64118C02E;
	Mon,  5 May 2025 00:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404890; cv=none; b=tvGQh0L9xbcRO9QgYazAgdYcTw217oqh1P3RxBqeU47cdrWvxgpMwke/ZC4DNj/99i+bqkbL9Uptk0nFZAZ4yAsevbgH7kU2E9MPZT13HIShCgcb8F4+DslNy9WMSroCvi+rk/hbzh2hmYv9SWVZgf10TfHYbft9WH55tShzjlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404890; c=relaxed/simple;
	bh=43gFJ5Fa97xaAvKTcfonW16J7pZGJrnSHDvMCF0kVPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhANinXIlKchd2iDbBO7LyNOSW9NSS2VLwAtbiTAxsG9/8wi2p/rox4BfV7+Us+Q7GtsMPECojnOhqpqUrnJDJ7UHiYEqjSQRT7WmBhwfGorFW6NXFXaDiIVZpMU1qqw9NnXQroeqF+xR6HUtX/LCC0ijALR15TkbJRWk61btus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=poMkWxer; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="poMkWxer"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746404881; x=1747009681; i=w_armin@gmx.de;
	bh=43gFJ5Fa97xaAvKTcfonW16J7pZGJrnSHDvMCF0kVPQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=poMkWxerht/HO7XoGZlXFps7kZiTmYI7cUoTBUwLPWe+y8zaq+YPo6RU7CyRvqRc
	 jAPQDOG5F2xXohQWeaI2SM5F/+zS6zbV03ft+/oMaczcLv0Ay9OyS6BDncdW6srOI
	 PJSYlKxyfojnQmIH+wLK9zf4Id1hct/kMkxkdC5LxygiWBTpGrGDwbGQQPrUIAtao
	 AbuyudwQiob9W2z0RNB7JnQ85pubEYDrHWLWMuMY3HDwGwUsQh0/PNdoBNbs6oyxD
	 yyV62LIrfAMzZVjOBLRJFPBxlWYqDiY1PQ1BcGjNsGXDqbCz8Ci4rrCbUv3CZmxwF
	 G3dE0sNQXUIHN70Eig==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvbFs-1v4NoF1hH4-00uZSp; Mon, 05
 May 2025 02:28:01 +0200
Message-ID: <6cbabcc6-a5e8-43d1-8398-1b272384841d@gmx.de>
Date: Mon, 5 May 2025 02:27:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Suspend/resume failing due to SPD5118
To: Guenter Roeck <linux@roeck-us.net>, Luca Carlon <carlon.luca@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, lucas.demarchi@intel.com
References: <9625330e-e3e9-49ea-9979-653091dfbe16@gmx.de>
 <20250504184117.4795-1-carlon.luca@gmail.com>
 <310fe3a3-e585-46e0-aae7-3e4d41af1f53@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <310fe3a3-e585-46e0-aae7-3e4d41af1f53@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yOcn1uPogfJJl7+uL12LnnDKiz+FN3ca/Jrqefb5dZOLKd+Mrp8
 1rzKOgJtZbXxSTrxfiTLctzy8qc4w3z2JOHkIwa8cs0ozTntfCLQc2D5b6ifPodiyP/WJ3x
 uRhMMxCI9wHFxiq6wO0dqT3JbeU3fKsS55m39CIocUevh61clRr8Z6emao6Um80YSzpUl3k
 W8euxIBp2zQpVyb5wfRNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KrYgkjHguME=;IxYAPBEhOzhiEsFsKVVpJyXIiqx
 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

Am 05.05.25 um 01:31 schrieb Guenter Roeck:

> On 5/4/25 11:41, Luca Carlon wrote:
> ...
>> When I was told that the problem may lie in the i2c bus, I started to=
=20
>> search elsewhere
>> and this thread came up:=20
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D213345. I
>> therefore provided in that thread some more info I collected.
>>
>
> From there:
>
> [=C2=A0=C2=A0=C2=A0 5.416572] i801_smbus 0000:00:1f.4: SPD Write Disable=
 is set
>
> I think you are out of luck. The above is incompatible with spd5118=20
> devices;
> See [1] for details. I don't immediately see why that would cause the=20
> i2c bus
> to lock up, but even if it didn't lock up the bus I don't see a means=20
> to get
> this to work.
>
> It is still puzzling that reading the i2c data using i2cdump fails.=20
> The spd5118
> driver should not even probe if that is the case. Maybe Armin has an=20
> idea.
>
> Guenter

I have an idea, see the bugzilla post for details.

Thanks,
Armin Wolf

>
> ---
> [1]=20
> https://lore.kernel.org/linux-i2c/20250430-for-upstream-i801-spd5118-no-=
instantiate-v2-0-2f54d91ae2c7@canonical.com/
>
>
