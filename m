Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D8645009;
	Mon,  3 Feb 2025 03:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738554259; cv=none; b=FkzDjp7ghvP1m7dc8ovCflfhrUVk/zJSPqJwTjO3sLvqgoz0gaWw/rUTdRT3xAJM4ioW0feJnyT4xtmANTKqieGYpXZbwFlkzqjGh/Pvsvms7Wr/WLN+YHfarSgeGzoPl4HhEef1bZcy/IPwmBlJ+E1gUuxKiDkVbkDuvNQgQSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738554259; c=relaxed/simple;
	bh=Wp99182AkTFqDJl4wZTchFzd2M+OFA1zhhQoeHWdJCY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HslYTkhLt0CTehudA38BTH8Sl/JvmpWiCGkWQxo0149VuXhCSmvFWpTYshNdYdebQ8FIcJpTmUXTLZv5kXYtIWKyfdm3XW9ub827bPgIGGbef7LcjDVOgoQdM09ymCgA7hNi2hX/4l9MS0EYpBwnwj1A82KLxRf7CT+rJekk6DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=DWaLK4Wa; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="DWaLK4Wa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738554254;
	bh=Wp99182AkTFqDJl4wZTchFzd2M+OFA1zhhQoeHWdJCY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DWaLK4WayH54o8v7DdeKvhmSSvpefqr4vxexVIH1MYxQ6wNAqnbrayBeakLRIB57a
	 WOTQLYaXFxtDzIdqXBIAd/31pYXCBOjqw0PgjYHwqyqrKoxGoLchkEknDGrAvA7jS0
	 ZhB+jKWqUPRVmvGVrlRQxDREYx5S3dmLpoIMVJVgCgRXPYA5ozKtKil+ayY0ziPMY6
	 rBNocLhukHJjLiBqeXk/LyvapgfdyGa6N/8X2DjvpCA+qTlE1ynmhAlbjtoUjZqMuI
	 nqShEZSdAYps4cMvbWR6Bv0O6g7vWGcfZhCGWldEgNEdADR0sLjVaFaxOhb9zEyuYd
	 5IcjOcfsaTUug==
Received: from [192.168.68.112] (58-7-156-140.dyn.iinet.net.au [58.7.156.140])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E54D973C54;
	Mon,  3 Feb 2025 11:44:09 +0800 (AWST)
Message-ID: <ee2f8d2315e27e800643195bdacba9f88ce2d2c6.camel@codeconstruct.com.au>
Subject: Re: [PATCH 5/6] USB: gadget: Use str_enable_disable-like helpers
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Peter Chen
 <peter.chen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alan
 Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	usb-storage@lists.one-eyed-alien.net
Date: Mon, 03 Feb 2025 14:14:09 +1030
In-Reply-To: <20250114-str-enable-disable-usb-v1-5-c8405df47c19@linaro.org>
References: <20250114-str-enable-disable-usb-v1-0-c8405df47c19@linaro.org>
	 <20250114-str-enable-disable-usb-v1-5-c8405df47c19@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-01-14 at 21:05 +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with
> helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.=C2=A0 Ternar=
y
> =C2=A0=C2=A0 operator has three arguments and with wrapping might lead to=
 quite
> =C2=A0=C2=A0 long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
> =C2=A0=C2=A0 file.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> =C2=A0drivers/usb/gadget/function/f_ecm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0drivers/usb/gadget/function/f_ncm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/usb/gadget/function/u_serial.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 ++-
> =C2=A0drivers/usb/gadget/legacy/inode.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/usb/gadget/udc/aspeed-vhub/hub.c=C2=A0=C2=A0=C2=A0 |=C2=A0 =
3 ++-

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au> #aspeed

