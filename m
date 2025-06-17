Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1337D289824
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146226; cv=none; b=EvtP8CHBvNYXww5XBJ8KNUOMpjL0Bqo7KTVrhZia6XP1qsGoTRMDe11YLRwZTXUJ07oElkf//RU8y3PSB9iss87yGAT7xZ4bF4F39NFt8mrRULppffAIv/65wrnACLmxJUMOraOfEusd/1xbDxqPRH0z8MW7vgtqs7gx5YNIcvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146226; c=relaxed/simple;
	bh=Wanilknuq/oxgKqar3VDDdKU9mWKxoMxEl1gryaM9SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUJbwuMhpTuiRxjIo3setya2WQL1nbov7bVNULv4aSnt4DNCiXrmnRnxbiWHiSBxo7J6Gne0Myv4IVgca0LZMvusNe7PC0GVsQG6VGPEPs9EUdaWZO+1EnUsKLbkC9kAaIefbDL4Op+aCCJJdUQ2rNrxjsE0+rnCXegFSwEWqL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2QTY16Pa; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2QTY16Pa"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f71831abso4836304f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750146221; x=1750751021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yr/0G9QcVKTsH2nCRZsPlndI4/213HWXG/qnBI+qj0g=;
        b=2QTY16PaPiD0pPXyYQUkBdgV+Y4+1psm6/V2qfmB4Lq68p9Lm72KQg+CPoYBs3OLGi
         ooFfLnEetDdmDWAKCC1Vn3lS3uXachGRa/Ld74pHGnKq09F7KPxVUlJjWO2nzK+C/mHb
         oRdkNYYvpQGegdZZsk3O6SkDA5tt37ecZD9pciazCUtNpcfSUeVLqwLKrSjwp7+84F2p
         9p3rmpZ39PKJhiHvGIZAOpCLCEk9F/EFapU7co6qmyN5Y6kKVbIoRXH5YCEKKD/s95oT
         I6FWP9bD1K6PfQzaeQ18JkCtuDp9KaurmXlFZKNl6MHHYv8y8zmXp/BaJWwIRFxIKjT1
         sgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750146221; x=1750751021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yr/0G9QcVKTsH2nCRZsPlndI4/213HWXG/qnBI+qj0g=;
        b=YoVK16jGhNHb92PwyOIbYR2V6tCiTsYd71dKU1l41V24ln3M/Ncqcen8v+LWT2NkaW
         ObqReyGOb8RmbApQZgxwMV48BeGbUosPtXFoRkv48fxjZTR7hbYGMOmbMv7dg6srq/9q
         L3vo8yrHL+TIzCw4uW8B1QOOEPVRDkyATwq0QBwIFSjdZUfReTU6/rIQoQfhdHQdUGhG
         WXNbDrlI4wsnMk3cDCtyNb6zP2/xgaJyTZPIoyRNxs0VZNDQ2Ng20RE/SFV48Nxv/iST
         jANJXiznMPc2VAzFZdmb9+J3wgGXpWVRT/gVOrNRzPlfsVpzEsxD+kZDDcRdyjzufkSf
         LlSw==
X-Forwarded-Encrypted: i=1; AJvYcCXr4ecH0aMpPZKPO8+smPbwkwhO0XwloFuX6OedpTVUf5kGjdMKR2ImfABNEZeV5KGsIUYMV9rcUV8ulww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo2y4BkAxyqIkvwClxdOvpToo8QdNnEeKR2ncaxlnhckbXS8Vu
	7S+sNcU8Cv1bOqEer2Ad06t/y9hEz1PAe6hQlbxhdceuaWZtdVBPiVCGSId13zefhXk=
X-Gm-Gg: ASbGnctxcgzfO4mNxP2S8QOExpT71GJkqqXOinhkdvYztPShLHLIoq04VkJcKu4v3s5
	t/8FwD5rMm2EgxTlqFiaRtXlAJOjSmI+lU9lrTp1FcPksBE9SwRkvROw4MYMU7tn6G3iF1JFVNl
	UQoS5exSKuohJU7b7uT44bhGAB9M61xGZtsFQ6uGeLAJsgc4ixMLnU/Nb5DS8tdrGs7f/5P4b4R
	0foGSAP7IaGf4RKJDgdPFLe0lWJpqCkOiBz4Y1fxC8LuKPrlNUNNEqjcla2lwFtwFbvxus0E2L9
	IhXFEbr07sBD1iq7uKkXYcPsl2Qc2KA6ofmi4yHkHzzBgFjk15Gmfm1gNaqMuz5gMixC0/FzkVk
	/Bjv+KAnF6OZTFZle4oGmBm+KQ8Jb
X-Google-Smtp-Source: AGHT+IHjO2Se+CNiFhQkijyy0zThy6btDct+3FCrSMJqJK2Ek1zZ0kq2x91GfZpIV9vpmdDOKsNMTg==
X-Received: by 2002:a05:6000:2302:b0:3a5:2cf3:d6ab with SMTP id ffacd0b85a97d-3a5723aeae3mr10062193f8f.39.1750146221186;
        Tue, 17 Jun 2025 00:43:41 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b18f96sm13293332f8f.66.2025.06.17.00.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:43:40 -0700 (PDT)
Date: Tue, 17 Jun 2025 09:43:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Abin Joseph <abin.joseph@amd.com>, michal.simek@amd.com, 
	yanzhen@vivo.com, radhey.shyam.pandey@amd.com, palmer@rivosinc.com, git@amd.com, 
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: zynqmp_dma: Add shutdown operation support
Message-ID: <rgjc7ujikyznrri27u6v3zst2m44423g46rlfnkfncr24jwx6z@mfwwvhe3upby>
References: <20250612162144.3294953-1-abin.joseph@amd.com>
 <aFENfW0v0gmtY2Gu@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pas4lfeknrusfsyc"
Content-Disposition: inline
In-Reply-To: <aFENfW0v0gmtY2Gu@vaman>


--pas4lfeknrusfsyc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dmaengine: zynqmp_dma: Add shutdown operation support
MIME-Version: 1.0

Hello Vinod,

On Tue, Jun 17, 2025 at 12:08:53PM +0530, Vinod Koul wrote:
> On 12-06-25, 21:51, Abin Joseph wrote:
> > Implement shutdown hook to ensure dmaengine could be stopped inorder for
> > kexec to restart the new kernel.
> >=20
> > Signed-off-by: Abin Joseph <abin.joseph@amd.com>
> > ---
> >  drivers/dma/xilinx/zynqmp_dma.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >=20
> > diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqm=
p_dma.c
> > index d05fc5fcc77d..8f9f1ef4f0bf 100644
> > --- a/drivers/dma/xilinx/zynqmp_dma.c
> > +++ b/drivers/dma/xilinx/zynqmp_dma.c
> > @@ -1178,6 +1178,18 @@ static void zynqmp_dma_remove(struct platform_de=
vice *pdev)
> >  		zynqmp_dma_runtime_suspend(zdev->dev);
> >  }
> > =20
> > +/**
> > + * zynqmp_dma_shutdown - Driver shutdown function
> > + * @pdev: Pointer to the platform_device structure
> > + */
> > +static void zynqmp_dma_shutdown(struct platform_device *pdev)
> > +{
> > +	struct zynqmp_dma_device *zdev =3D platform_get_drvdata(pdev);
> > +
> > +	zynqmp_dma_chan_remove(zdev->chan);
> > +	pm_runtime_disable(zdev->dev);
> > +}
> > +
> >  static const struct of_device_id zynqmp_dma_of_match[] =3D {
> >  	{ .compatible =3D "amd,versal2-dma-1.0", .data =3D &versal2_dma_confi=
g },
> >  	{ .compatible =3D "xlnx,zynqmp-dma-1.0", },
> > @@ -1193,6 +1205,7 @@ static struct platform_driver zynqmp_dma_driver =
=3D {
> >  	},
> >  	.probe =3D zynqmp_dma_probe,
> >  	.remove =3D zynqmp_dma_remove,
> > +	.shutdown =3D zynqmp_dma_shutdown,
>=20
> Why not do all operations performed in remove..?

=2Eremove() isn't called on shutdown.

Having said that, most other drivers also don't handle .shutdown(). IMHO
this is special enough that this warrants a comment. Or is kexec a
reason to silence *all* DMA and most drivers should have a .shutdown
callback?

Best regards
Uwe

--pas4lfeknrusfsyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhRHJ4ACgkQj4D7WH0S
/k6fcwf/ZARJglob++15lJ5FJZx+lpM9MqpTeUGMKnMzw6B014DEmMpCveShyVjN
pyGyLhkwI9RHVm9w0L3Gw5tRsEk6gD228K8xE/8hLk+HYNPYqsXlE/B+2AM+Y50/
Taac6eUG7W9ZGdz6nQxSvROz5tqT5r4WpYvN+TC6hyb7H4KVB963oWjZtwONnBJH
/bsc2E3kw4J+wctryB6wce6W3ajZEkpaMyyMdzAWTcJ+DFQICD+vb5lJM8Ob8iyH
RSdhNesjl2KzAFDd75PCPRrUuD08Ndu1Wq35d1+du85WP4vLoiBR7mrW4YSjW5iI
cu529KsUImojosD6g6IMeCKHknJMqw==
=Lai6
-----END PGP SIGNATURE-----

--pas4lfeknrusfsyc--
