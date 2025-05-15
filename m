Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFC92798EC
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294968; cv=none; b=Chqt25kMUz6Yv8hZ3H6u/C9Yc2+0zbexQ0CGgnF+q+d5joCxf+1SZxbRgjCtxAgtNFsFj/emR/Ue9CxcBgi1pDfwf8crej7qEo4J2y2MXfBpHEm5BY/NtKPsvH6ipgPVv+RdUU+8xjqQWwCNQHyDQwqtzoWXaph1hNR+UumHdXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294968; c=relaxed/simple;
	bh=9+e9KzR5OZs9OOFp0dWbdBJKr7hsOOVIlpr6DtqWzfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KkbkrZdyk9N6L2Zs/H+lRIRTUXWuzLLkpi/d/bxkFsMymxBF6b9c3OiM8M7gt4IoICxx6dCWegl55qnxB3NtiEnMQe00Gvk5u6f7KAHOW/2OTyOHlhRukjbl+xOEHTs5PQQCt73N1A23JreL7RvPXzw43pnqtmjSUrRpRR+sBFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=duQpicWt; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="duQpicWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1747294963; x=1747899763; i=wahrenst@gmx.net;
	bh=9+e9KzR5OZs9OOFp0dWbdBJKr7hsOOVIlpr6DtqWzfE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=duQpicWtdghHVt50Eid4mEgGCAHSO5QvA82S+3T95mvDdXYByphd698+2WNXyOVh
	 V0c8VDzNKamN+J66NBAvA63u2dk46WncsDBOeMHcMIWJCn1YaFRkW2whzR6uaO7d/
	 fnEF49JAlLw0wofT6K5wg6GDIKrBFxjgzredmKrS24If0uw9mT4Zg+cRKTzo+Ub1O
	 0mxtUZFODJEFIVXY/ygHN9VIvvCi5ca/t/Iz0vUzeMdjnwa9bhuDXrzKkQddYsyTx
	 RLznNMF63mbb7LyjpCzuhy45cUn6/Ems8msgv/QFZusdJX1zXdPxVxVOEiq0DGvnI
	 2es8uM+BE3sI2qd94g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.103] ([91.41.216.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpUYu-1ulF8x2k0K-00em5f; Thu, 15
 May 2025 09:42:43 +0200
Message-ID: <ffeb860f-5522-4130-ae47-45a6068b17ea@gmx.net>
Date: Thu, 15 May 2025 09:42:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware/raspberrypi: raise timeout to 3s
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Etienne Buira <etienne.buira@free.fr>, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <aCIiEp3CXD2o9dTw@Z926fQmE5jqhFMgp6>
 <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>
 <aCWMrJcldfrsNTQq@Z926fQmE5jqhFMgp6>
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
In-Reply-To: <aCWMrJcldfrsNTQq@Z926fQmE5jqhFMgp6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xUKADVGJvawN9EOvs1BVKQgMvs8OfwzgqQ/csHDyx0bzfA2CDel
 RxPQ9S/b52gqD0u69d3M927HQ7UebRQsx+yX9l5vrF4/Qahg9gTRphmkiuiMrwbaUDFLOG9
 hd02eTiQd3YJzIn69QWW8VbEpexjc8dbtH2vpqo1+5BLblFbn7VkBPwrSkaPgl7gKJr6S9b
 BJI/DvtUEhxx9XbYugEbA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qNUFzKS9vy8=;Mn1CvtV/peoRIncsMwDHVJoj9iI
 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

Hi Etienne,

Am 15.05.25 um 08:41 schrieb Etienne Buira:
> On Wed, May 14, 2025 at 06:20:32PM +0200, Stefan Wahren wrote:
>> Hi Etienne,
>>
>> Am 12.05.25 um 18:30 schrieb Etienne Buira:
> ../..
>> Out of curiosity and because i never saw this issue, could you please
>> provide more details?
>> There is nothing connected to HDMI 0 & 1 ?
>> Which firmware version are you running?
Please provide the dmesg output, so we can extract the firmware version.
>> Do you use a special configuration?
In this case, i meant the kernel configuration. Do you use=20
arm64/defconfig or arm/multi_v7_lpae_defconfig or a custom one?

Do you use U-Boot or not?
> Hi Stefan
>
> There is nothing very special, hdmi0 is connected to a monitor, there's
Did you tried to connect a different monitor? Does the timeout still occur=
s?

Best regards
> a (independantly powered) hdd on usb3, keyboard/mouse on usb2 ports, a
> Gb network wire, UART, and nothing else.
>
> The afore-mentioned next failure is also about graphic stack (hdmi
> signal is lost as soon as VC4 driver loads), i seeked for help here:
> https://lists.freedesktop.org/archives/dri-devel/2025-May/505475.html
> (btw, if you have a hint...).
>
> Regards.
>

