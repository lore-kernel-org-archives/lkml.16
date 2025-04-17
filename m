Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE04E1D63D6;
	Thu, 17 Apr 2025 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744884540; cv=none; b=noMXLZsa12PtrPTgDiYFQ76FWbzwFYc/c3WXr2w7/YmNWemJfoPP3uf/l6sxv4TiROO7tEHO6mQ/toKWqThZmHp+VCAHIJXsAe0NfXqk8tlOYq21kUeupc/12yvVOxyQndCNhksBNS9XULsoQt9HCOVWVil82zFNK7TLBnAn5YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744884540; c=relaxed/simple;
	bh=10pNOVV0gQLeU0Jbw1YIJzu9t4BhwJ4GIrZhQVMTtdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+qZ33oED+1k50vUyC2vUS54Hum0NdxydmvyF+ab4Gu1Shw/mDzR8YuJzWPIzuKZJQTTBdufaZoYNwF9QKdA6fHuF2DntxATmvI+SsCmW+X/nJoIvrrii6G7Cx3HApwVSSgP7jXfGmwtiQy8jNRiwHiU5Wji3zWY6YpG1dwDD+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=U8pl/SFw; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="U8pl/SFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744884535; x=1745489335; i=wahrenst@gmx.net;
	bh=KboW8T0LwmdQHDzhaLO8y9T+QaLii17k/39YhKZ8oxI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=U8pl/SFwG4FteTqjHlyBNWNeoj/6Cg6bgUncQSCwQitCyBL4N0vL/R4jQtd26i3B
	 GrTZeWZMwrVhLBkjd26/ClIUm5mfPDdzucSaOJLqZYY9yTrwl7NMwhmCYz1pn8QQE
	 pnN9+6qDC79tO6JoI9YQ/uN1n04OfWwObfiGrPLaEWKLH9SyfjqNQG9GZ/7InCF7p
	 R7a0BMcEBFFbvBQlnU5RDq27MqbypErqHZU1RdudZSSKwQ6/D4yS6/Ytd9G/b/ntG
	 LeftBAqZ+8eeAinoLFMf2/b1tU76CNdvIVbICJuFQrFElfaxp4bNuFvwJcwut4K0d
	 FZcmcLvkA+ScL4dNvg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5fIW-1uCUmL3Avy-009VWA; Thu, 17
 Apr 2025 12:08:55 +0200
Message-ID: <14654c19-fa26-4d37-8f0f-9cf092982b67@gmx.net>
Date: Thu, 17 Apr 2025 12:08:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: bcm: rpi: Add NULL check in
 raspberrypi_clk_register()
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, popcornmix@gmail.com,
 mripard@kernel.org, u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, nathan@kernel.org,
 dave.stevenson@raspberrypi.com
References: <CAPY8ntAFHW3kiqCnXjFtzL9FnRoQ69v8+3yJ+jR8_W8Bb+6d8A@mail.gmail.com>
 <20250402020513.42628-1-bsdhenrymartin@gmail.com>
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
In-Reply-To: <20250402020513.42628-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Vp3a+37uaw4BVeCxFEXatGI5F4P8nElZTeg0boA2hoAHEK14seC
 yQF09nylKm//RzK80Ccl1Nxq5xx+AXMmnju2sSrSL6/Xd0A3KTGWeA0gAcs0RGhEkhFZU79
 pKrs8ZnayWwIslZqi1R1HDP1936LRCb1l7TQJlsh0r9izdjT4kwqc1tudY2OAK1D+YIpe7r
 6UZT+IMtS59ieG7LFSePw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7FDxd8SGR7E=;gMwnoXSoReXFUKsr4zsYdoIONYG
 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

Am 02.04.25 um 04:05 schrieb Henry Martin:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> raspberrypi_clk_register() does not check for this case, which results
> in a NULL pointer dereference.
>
> Add NULL check after devm_kasprintf() to prevent this issue.
>
> Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

Just a note, please don't send new patch versions as a reply to older=20
ones. This makes them harder to find.

Thanks
> ---
> V1 -> V2: Correct the commit hash in the Fixes: tag.
>
>   drivers/clk/bcm/clk-raspberrypi.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-ras=
pberrypi.c
> index 0e1fe3759530..720acc10f8aa 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -286,6 +286,8 @@ static struct clk_hw *raspberrypi_clk_register(struc=
t raspberrypi_clk *rpi,
>   	init.name =3D devm_kasprintf(rpi->dev, GFP_KERNEL,
>   				   "fw-clk-%s",
>   				   rpi_firmware_clk_names[id]);
> +	if (!init.name)
> +		return ERR_PTR(-ENOMEM);
>   	init.ops =3D &raspberrypi_firmware_clk_ops;
>   	init.flags =3D CLK_GET_RATE_NOCACHE;
>  =20

