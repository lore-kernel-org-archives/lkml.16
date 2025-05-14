Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D551DAC92
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239639; cv=none; b=n/okQTS86QYwVxnfOOlyvH08CnexfqvqWAxAuK36QA6VzyR/wzIW77WDQXPeOHL5Da5QKfOOk91GFdtcu7xoPKLq0Qc37attntH4nBvU5TVQahg2FPg5Ihx3aMom8zwnLSq97oAUS+d7riBy/x4VfSVJpqYop/W0OQhFnnqN3nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239639; c=relaxed/simple;
	bh=4co7SJeB2QNLxlAQXWoe3LyNcha31/8tB2nPx/Lp2EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=E+nUb3/lF36nfxw6KZd1Expy6bKse3XWV27gCnzq5raHS7aiUCpFVgtw2vpk6Xi/d5PnD9Yi3h0FaTLD6YH/KT//jf0BvDRjKFfIYlwp1IbiAik4AKLXP5UgFYUaA6y6kQOP5dVc8O61pgivYFn4G2lDlZ47/cNMfD+7iJApNNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=oFqeCPkA; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="oFqeCPkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1747239633; x=1747844433; i=wahrenst@gmx.net;
	bh=ZO1mLgqTiRWIm6Umk9Wd2X9pBpnWz+JywKSrseBWGCo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oFqeCPkA+u66zVNDurvJNs6imP7nzTIlWFgqNXW5QCbEAOpSsM+eqmV8KKnBY6uA
	 zre0ZrPqAuBQijovMS9gLLs3OQG7hkDf+LAqD3dXpd4U0zsTVT8K5tXzKtEmjlGOm
	 qzWDs3tJ4pfO2jSDbLVU+7c+x4haKyZAXVJvTLlS4HILwrIX2AQRudOHAWS5MNYFS
	 LLOm7l2pCHPqKb3FnSdI87m5uG3KAFqFRjztlu3sZy09aQ0YD9HbfRXfmNgw1aN3F
	 fvOmki3qaPYFrl0QbKhfnGFmCXFBpqpPm1wglV/D7r9cETq5ak9OFrzSkd6f42dXn
	 wPFXWzHSoW7mT0uG0A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.103] ([91.41.216.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MowGU-1ulbva3EAo-00k50U; Wed, 14
 May 2025 18:20:32 +0200
Message-ID: <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>
Date: Wed, 14 May 2025 18:20:32 +0200
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
In-Reply-To: <aCIiEp3CXD2o9dTw@Z926fQmE5jqhFMgp6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zlRoFfrw20BgMJv3TYrgRgUpiPFdv9JJkFmOKCwvbh369xPvzXm
 5YZpW5ikrktgKlvIRK1Ew9CIutsCEAu3UgQa/hKC44jCadPjIABuW847HZOPie1BMmJDhzo
 Ojpmaleyk21CNhQG3L9KU6gCFq/Bb8+zbSOUzt/FosKRsjjhC7YNkS592XF8/DK+U1dDh01
 0OFTuoKdwKxZOiGwWoVUA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wxmxLvKKQfE=;aqGWEp0mXeRnTo+Y9B7vrJPNjud
 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
 HImE=

Hi Etienne,

Am 12.05.25 um 18:30 schrieb Etienne Buira:
> Raspberry firmware driver expected said firmware to answer by 1 second.
> That seems to work fine for most cases, but with
> RPI_FIRMWARE_NOTIFY_DISPLAY_DONE, that IIUC may need to reconfigure a
> monitor, i end up reliably having timeouts:
> [    2.861407] ------------[ cut here ]------------
> [    2.865512] Firmware transaction 0x00030066 timeout
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
>
> Signed-off-by: Etienne Buira <etienne.buira@free.fr>
> ---
>   drivers/firmware/raspberrypi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberry=
pi.c
> index 7ecde6921a0a..e3c998def0e1 100644
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c
> @@ -58,7 +58,7 @@ rpi_firmware_transaction(struct rpi_firmware *fw, u32 =
chan, u32 data)
>   	reinit_completion(&fw->c);
>   	ret =3D mbox_send_message(fw->chan, &message);
>   	if (ret >=3D 0) {
> -		if (wait_for_completion_timeout(&fw->c, HZ)) {
> +		if (wait_for_completion_timeout(&fw->c, 3*HZ)) {
generally i'm fine with this change, but could you please add spaces=20
around the operator? This should better align to the coding style.

Out of curiosity and because i never saw this issue, could you please=20
provide more details?
There is nothing connected to HDMI 0 & 1 ?
Which firmware version are you running?
Do you use a special configuration?

Best regards
>   			ret =3D 0;
>   		} else {
>   			ret =3D -ETIMEDOUT;

