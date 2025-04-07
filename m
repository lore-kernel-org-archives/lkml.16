Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FF415F330
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033161; cv=none; b=s9VptiKmCv269obsr0nHBiFWyNoftpkHSWTXCLdHYTue+LoQooMIYQx4qz3Du4dG9TQu2HBPO7Hf2C5uUBJRW9KiKhAURYWCas/20dm9q67bZEbFjSzZb5v01EerXSOj61aYnWBkwmT3o8tOquR9nbvRdX0XRNhd8g7T1bVH0tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033161; c=relaxed/simple;
	bh=K2B70rjx6AVKvb+f2MnjZ8QorEs+RwFW1h90Y3YwRBw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GS/BFI9wnm1FRiL11qTmx2pe0T25Fe2G91xoBwePQrMSSxrG12ApMI9FmbG35xHunURNwGT8xFoCHZ8IS7m7fmJeIL03yijx8xyMCTALdzNQrTQ6QY4BXjsg0WUIiGX2UryN9Ivkckj7ohfO1WcEoytyCiM9ep+XAFsA/IS0tP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=D6VTNmtF; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="D6VTNmtF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1744033157; x=1744292357;
	bh=K2B70rjx6AVKvb+f2MnjZ8QorEs+RwFW1h90Y3YwRBw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=D6VTNmtFxnAO6oa6rh3SPul2/4MB0Yp+6Hid41lsgRZ6DxXTl5l61cX3v+2GfXfQx
	 xVhXH/4slJNjG1ZycaXEva9knQrTMHe69YHTX4gyUqiZMTNsUi0gZgm8pEXamlXbb3
	 oLT4b++93+k4wvsvciyWx0VTwygqP3KjQBKrnIyd2Zm/0jvSPjK4uJCcrAL9/HdEZ1
	 oOdjgwkPAkDBRHnI/W9eQQdjGp82LCRV9OMEiVH4VtRX7kZWcsrXGX5UY2AJUujOXo
	 ap9XkPaA9BU1OFX9YUMNtuSxoo2HDMbxVi1MDyDKvND+15DFj+IymrfhzXmhT9G48j
	 kNflQ3mbGwbuQ==
Date: Mon, 07 Apr 2025 13:39:00 +0000
To: Chen Ni <nichen@iscas.ac.cn>
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org, matchstick@neverthere.org, arnd@arndb.de, nathan@kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: fmh_gpib: Remove unnecessary print function dev_err()
Message-ID: <YtywgRJRN9ANtEiSyfy176u-CVBbWl66cyJYux27ismpRife21AZPaAymJnsAcjW06V_J_Rl6RBuqm40yOvobfnz37QmZ3XaeFNCDsKhNSQ=@protonmail.com>
In-Reply-To: <20250407031110.2382308-1-nichen@iscas.ac.cn>
References: <20250407031110.2382308-1-nichen@iscas.ac.cn>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 2df7a5f8475d20200373ef5cb769b15a207cad6e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, April 7th, 2025 at 05:11, Chen Ni <nichen@iscas.ac.cn> wrote:

>=20
>=20
> Function dev_err() is redundant because platform_get_irq()
> already prints an error.
>=20
> Signed-off-by: Chen Ni nichen@iscas.ac.cn
>=20
> ---
> drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/g=
pib/fmh_gpib/fmh_gpib.c
> index 53f4b3fccc3c..5f64f3d989ef 100644
> --- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
> +++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
> @@ -1424,10 +1424,8 @@ static int fmh_gpib_attach_impl(struct gpib_board =
*board, const gpib_board_confi
> (unsigned long)resource_size(e_priv->dma_port_res));
>=20
>=20
> irq =3D platform_get_irq(pdev, 0);
> - if (irq < 0) {
> - dev_err(board->dev, "request for IRQ failed\n");
>=20
> + if (irq < 0)
> return -EBUSY;
> - }
> retval =3D request_irq(irq, fmh_gpib_interrupt, IRQF_SHARED, pdev->name, =
board);
>=20
> if (retval) {
> dev_err(board->dev,
>=20
> --
> 2.25.1

LGTM,
Reviewed-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@proton=
mail.com>
