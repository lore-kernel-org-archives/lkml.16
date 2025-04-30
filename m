Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13E6225A3B;
	Wed, 30 Apr 2025 22:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053007; cv=none; b=nUSM8bfHUTUSndX40ZRx5mAA0QBqte//NB1UszGgCUS69Hq5u5YSFMfs+AkCr1bQ2y5vEXEK/8mpBma4kx+rePm40GlzF8swtEjwDox/O0fAin6lj/NN7HWrvGBJs0K6z61DpuAY8KxfYiLfsnuXb7L2RuH4Oxpc8Rp1XH4XaoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053007; c=relaxed/simple;
	bh=dISd+N+HMd+yQEGsvUtemqXoW3Igt343eoWGtsWnDlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGtJAfxJKWsGg2jIpsrb7tuVfaSw8RT2ZHq+VTAx5+mIlFs5ZIXFD5a9/WHdHAp1tFyADp/GD9XFK33IgkSr+A6LQEhULXOZZ4BubgLq2nojl5g2YuFz0XFVeEDdaY5VHVkb/Sj7eDIMB7tjpxoZkpdc8httnn/gdHO9TCJ0clA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8VaqIRg; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8VaqIRg"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e8ec399427so4374776d6.2;
        Wed, 30 Apr 2025 15:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746053005; x=1746657805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fanbo0paPBUBXhFMWx1nyQAi5WFjbZwo9JNNJ+WKtHw=;
        b=c8VaqIRglcU5O5Zx3f9S11HnSTKAr8sieMe7CIeXg6ax+FAE/MFLZTpleR/n53t90+
         v3mFYkcgKbi2eSfhj70yCp2JMAH2NZewtMmyszi1YhM1rM/uobwf3fMxYgYGtz+G9Oa8
         ImKXNdq+mlrnWaoMQPvjny8q9NaCAGJXNSC6UsaluRHRyTIBN1Jre1qEOY8Mlf+PbJmZ
         9LxOstkahhXZ1cy1G4OmqPsTiHlx5D44y8T44lc+7NB+Y25xmzPU3Su7POclMv5oM1eS
         SNT1p/A5Y+Jxlqg9wnoTXgeRGDQ4P34D/+cIuws4majMDLRnSUBUl6mc4vxhhq8WyylG
         /+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746053005; x=1746657805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fanbo0paPBUBXhFMWx1nyQAi5WFjbZwo9JNNJ+WKtHw=;
        b=qtK99FQXLDI28JxSQrUkOI+H21M50Sg177/0WTr/68VatZc6hHMJxdQIylNmmvIg7z
         EDHWE+W95xEmtRaTPM47XtgYVKqN6RBGC/ODdrq0bkHHtRliTYs606LShXA4/p3iNn+h
         RhHsVIIS6muylV8EYVOyJg2fuhP/85t26qo3RuGFGJb4zpUvyITV6O621l+Rd29X0bmd
         XTr3HNiGKGBKrQGlD6d0DTeh+agsK4z3ADaxKMqoFeeIrD1C2Va3uYN7eTXAZ9DrxSsW
         QiYcNAPx27/8pbcT+NNrLeEO2tn6Bf/shbibIq9AA9LgYhDeVGuCMg7Dh0g/KRU4gRst
         qNSA==
X-Forwarded-Encrypted: i=1; AJvYcCW0z5cJy9zH7y0ttLX3alILjMF/Tv6L8mrpuXoJZ51BmGV/7ON0hNrqcIoRoWlLB2MFYEAMabmPL2rh@vger.kernel.org, AJvYcCWFkfsIYe2JxwrwuuJh6nf8J0y7fmkcXkzuR/qanW/I45ykVWsJ21uT/weRnVJywq0kfDhT70seOH4IWR4Z@vger.kernel.org, AJvYcCWeHtX2Ae8WyKUv/d1Vgb42bQVgmHHwZrUIVMWdywJopOmL0gydaogzmbAUA9b1BhCRoO0pb6Pb5CAI@vger.kernel.org
X-Gm-Message-State: AOJu0YxytOgfNwBLv7Ne3w1u3IcLXciNzLHVPLG5JTec0Jx2hmNJ+PKV
	FqJDCIPI+i7B4ddTHsRkuWfXB1tb5hnfBvs5XNteG4wbYUsDswj7
X-Gm-Gg: ASbGncskhRC0xPnPum5GOdKWTIyXk+N2lb8rXZM+R0fGDRYsIEt7roEq8sCJYMXlc1L
	HbMBw/VOFyBWd1ekiHHzFVZqbgD2BtUFO4xjGZB50ibo4rTC/yax/CHvM7bwQs3TLCu21ZlEN+R
	hRLmCAPdVckyoH7rj9pNMJsLjEMP25VKjgnEVeq5jxUCJhNyga9f7VDy1fVIrQKsx+j4JOthMhO
	mE3u6cFtzCbGYB5il/v6uIEzbzGf1NDk2quAbEuia4S0rSSHEV5HERCexyq0RYIxguoZMmcsFnv
	9NIjMipf4MWQqoze
X-Google-Smtp-Source: AGHT+IFO1aCRIZ/0N8Q8OG8yNS/rlnBCUVOfqQhrwjWHjsgTBzgmkOJlnBxrxLot12lUcMwexg9s9Q==
X-Received: by 2002:a05:6214:5004:b0:6e6:6713:3ea8 with SMTP id 6a1803df08f44-6f509118d8dmr20881566d6.23.1746053004612;
        Wed, 30 Apr 2025 15:43:24 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe6abef4sm13590726d6.18.2025.04.30.15.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:43:24 -0700 (PDT)
Date: Thu, 1 May 2025 06:43:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] clk: sophgo: Add support for newly added precise
 compatible
Message-ID: <otuaro3xh2ut3kurcomrq5j3guyyj7uhhwgngqdqqrrcpvlk6t@4wqbxy3m3tq7>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
 <20250430-radiance-rebuilt-2caa906d5e6f@spud>
 <20250430-snort-raider-dbf10d14993f@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-snort-raider-dbf10d14993f@spud>

On Wed, Apr 30, 2025 at 04:37:01PM +0100, Conor Dooley wrote:
> On Wed, Apr 30, 2025 at 04:33:39PM +0100, Conor Dooley wrote:
> > On Wed, Apr 30, 2025 at 10:09:30AM +0800, Inochi Amaoto wrote:
> > > Add of device id definition for newly added precise compatible.
> > > 
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  drivers/clk/sophgo/clk-cv1800.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
> > > index e0c4dc347579..e10221df6385 100644
> > > --- a/drivers/clk/sophgo/clk-cv1800.c
> > > +++ b/drivers/clk/sophgo/clk-cv1800.c
> > > @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device *pdev)
> > >  
> > >  static const struct of_device_id cv1800_clk_ids[] = {
> > >  	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
> > > +	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
> > 
> > Given the same data is used here, should there not be fallbacks in the
> > dt for some of these? For example, 1812 to 1800? Or is that not okay,
> > because 1800 is not a real device id?
> > 
> > >  	{ .compatible = "sophgo,cv1810-clk", .data = &cv1810_desc },
> > > +	{ .compatible = "sophgo,cv1812h-clk", .data = &cv1800_desc },
> > >  	{ .compatible = "sophgo,sg2000-clk", .data = &sg2000_desc },
> > > +	{ .compatible = "sophgo,sg2002-clk", .data = &sg2000_desc },
> 
> Actually, this one is a better example. sg2000 is not marked deprecated.
> sg2002 uses the same match data. Why is no fallback to sg2000 used for
> the sg2002 case?

Yeah, It is a good idea. I will take it, thanks,

Regards,
Inochi
