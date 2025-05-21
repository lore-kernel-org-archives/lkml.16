Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7CC21FF55
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817722; cv=none; b=M/Djae8OUrHMPaaY1A/mQb+b4CViusd+q7gz+jLEQNbdlftPyhjvQ6iYzgVGCBx2kJrbOiubof3KtR3jheJT2O2xNZndkSKukL9N555rXcwBbzMROg8k0VSCO+5h9877I1H7UypZfdnbp49xmTXKZGb4rduXa8lxp82n1fIztS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817722; c=relaxed/simple;
	bh=fMf0+1JY6WrrM6lpokLaFwP2Ca6MELinKk9MUgKHkOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=U76gPY3TMexce0ixqzZ7Am/UFbdlR6FpNy2tR9dEZBM/nxoNgAgJXIE+GnkJDKHuOnweEGifbPUi6WNpinqwVzYJBL3o8BI9n00bmmv5lE8/ESYlIUFoEp+hQO72fXFjUBUkrc3HYqndOm7m+8UfubzwUjf1vn9wponc7uZAXx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=og6IgfPq; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="og6IgfPq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1747817709; x=1748422509; i=wahrenst@gmx.net;
	bh=a6akibYcMhh8pP0khWPzhyWMGm65J/vm1mu982pNiEI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=og6IgfPqGgMhEiGTsHOrvtQEqCuAVyJTd9NO8Yw+ymyRSa6relSQESOE26v9tX6U
	 ioMT+6tIL5z32CC5nq9HDUujGJ27hSmIoI9XJVWW4eK8mLePNNbXoQj4MQDgjaVWQ
	 oX/PI9bPjIkwcm4ZfLN7vcZsm1Uqez21dUDo20Ze6m36YLDrwo0dfinUPl6P9QEeo
	 /n7+muEaTDMxlnAH0FzCRxuI7b5T3Np3uThNbfzBlBsBixbkCE8Ibtfyr0WBGu/8b
	 7D8clDTfF8gkorFbwCk1YEQ7L7b7aRAz9kw6gq7/1YLVt5qNlsbjkHYoWS+QQar1p
	 0vQJedH6QFLRY7dTOw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M26rD-1uFCNx49Gb-000hOR; Wed, 21
 May 2025 10:55:09 +0200
Message-ID: <e5659e34-511c-4137-9ffe-152bb0777146@gmx.net>
Date: Wed, 21 May 2025 10:55:08 +0200
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
References: <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>
 <aCWK-09YW1i2lPgj@Z926fQmE5jqhFMgp6>
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
In-Reply-To: <aCWK-09YW1i2lPgj@Z926fQmE5jqhFMgp6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sv5m7R4Rbu8SR1Q/Z0CVHHZEx4DmmjPtjTuJBDdD2DA25xlwplz
 /h8NGBXFzVIVifAuJZU8/KNAjBYy4F41n0rOUfTvXFoWghYYNHm8Tra+jBr1vB6bBwAXKv9
 vrjXwOpNe1D4KF5RvAGgw4sJGRfmbYtypCAv1aRGEJGSsuI15xy9oNm81Z24Yccr2DlhiIX
 cHVTCjuILol5lE2nlHaGw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fD1AEVjP7WM=;nN7lBuswuK6AP4mVX+fMsAYjeAt
 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

Hi Etienne,

please always increase the version of your patch, in case you change=20
something.

Am 15.05.25 um 08:34 schrieb Etienne Buira:
> Raspberry firmware driver expected said firmware to answer by 1 second.
> That seems to work fine for most cases, but with
> RPI_FIRMWARE_NOTIFY_DISPLAY_DONE, that IIUC may need to reconfigure a
> monitor, i end up reliably having timeouts:
> [    2.861407] ------------[ cut here ]------------
> [    2.865512] Firmware transaction 0x00030066 timeout
I think we can strip down the trace to this line.
> [    2.865549] WARNING: CPU: 3 PID: 42 at drivers/firmware/raspberrypi.c=
:128 rpi_firmware_property_list+0x21c/0x29c
> [    2.880751] CPU: 3 UID: 0 PID: 42 Comm: kworker/u16:1 Not tainted 6.1=
5.0-rc6 #1 PREEMPT
> [    2.888944] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)
> [    2.894848] Workqueue: events_unbound deferred_probe_work_func
> [    2.900752] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTY=
PE=3D--)
> [    2.907801] pc : rpi_firmware_property_list+0x21c/0x29c
> [    2.913089] lr : rpi_firmware_property_list+0x21c/0x29c
> [    2.918376] sp : ffffffc0803139c0
> [    2.921725] x29: ffffffc0803139e0 x28: ffffff8040bbef50 x27: ffffff80=
410c0f40
> [    2.928953] x26: ffffffd7055d9e28 x25: ffffffc0801e0008 x24: 00000000=
00001000
> [    2.936179] x23: ffffff80410c1080 x22: 000000000000000a x21: ffffff80=
410c0f00
> [    2.943405] x20: 000000000000000c x19: ffffffc0801e0000 x18: ffffffc0=
8030d0a0
> [    2.950632] x17: 0000000000000000 x16: 0000000000000000 x15: 00000000=
00000000
> [    2.957858] x14: 0000000000000000 x13: 0000000000000000 x12: 00000000=
00000000
> [    2.965085] x11: 0000000000000000 x10: 0000000000000000 x9 : 00000000=
00000000
> [    2.972311] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 00000000=
00000000
> [    2.979537] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000=
00000000
> [    2.986764] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 00000000=
00000000
> [    2.993992] Call trace:
> [    2.996458]  rpi_firmware_property_list+0x21c/0x29c (P)
> [    3.001747]  rpi_firmware_property+0x70/0xd8
> [    3.006064]  vc4_drm_bind+0x12c/0x378
> [    3.009765]  try_to_bring_up_aggregate_device+0x22c/0x308
> [    3.015230]  __component_add+0xec/0x224
> [    3.019106]  component_add+0x14/0x30
> [    3.022720]  vc4_hdmi_dev_probe+0x1c/0x40
> [    3.026773]  platform_probe+0x68/0xf0
> [    3.030474]  really_probe+0xc0/0x3ac
> [    3.034088]  __driver_probe_device+0x7c/0x174
> [    3.038495]  driver_probe_device+0x40/0x100
> [    3.042725]  __device_attach_driver+0x10c/0x1e0
> [    3.047308]  bus_for_each_drv+0x88/0x100
> [    3.051273]  __device_attach+0xa0/0x1c8
> [    3.055151]  device_initial_probe+0x14/0x30
> [    3.059381]  bus_probe_device+0xc8/0xcc
> [    3.063259]  deferred_probe_work_func+0xb8/0x12c
> [    3.067930]  process_one_work+0x160/0x2d4
> [    3.071983]  worker_thread+0x2d8/0x400
> [    3.075773]  kthread+0x12c/0x208
> [    3.079034]  ret_from_fork+0x10/0x20
> [    3.082647] ---[ end trace 0000000000000000 ]---
>
> Raising the timeout to 3 seconds (ought to be enough=C2=AE) doesn't trig=
ger
> timeouts anymore for me and proceeds to the next failure.
Based on the recent findings, please provide more context in the commit=20
message and add a link to the firmware issue:

Link: https://github.com/raspberrypi/firmware/issues/1970
> Signed-off-by: Etienne Buira <etienne.buira@free.fr>
> ---
Please add the patch change log here as documented in

https://www.kernel.org/doc/html/latest/process/submitting-patches.html
>   drivers/firmware/raspberrypi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberry=
pi.c
> index 7ecde6921a0a..8c45a152e3ba 100644
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c
> @@ -58,7 +58,7 @@ rpi_firmware_transaction(struct rpi_firmware *fw, u32 =
chan, u32 data)
>   	reinit_completion(&fw->c);
>   	ret =3D mbox_send_message(fw->chan, &message);
>   	if (ret >=3D 0) {
> -		if (wait_for_completion_timeout(&fw->c, HZ)) {
> +		if (wait_for_completion_timeout(&fw->c, 3 * HZ)) {
>   			ret =3D 0;
>   		} else {
>   			ret =3D -ETIMEDOUT;

