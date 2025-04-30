Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92ED2236FC;
	Wed, 30 Apr 2025 22:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746052720; cv=none; b=oy14qa5rn05QOuhIggWkc8c1euKXbyurTuX5W7CzqlImHvQUs6rVPpj4tuR6qrwpPsioBzDTgtAzIu4hLCwQYj9cCHPOj3N60VYABR8m3QfHBNORAGKG8uI7EzdfdV43xT6nnlhdrhNR1gICAS+N9ybYPKuzToWsd/bVBEl2iPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746052720; c=relaxed/simple;
	bh=j0wnjooFp3JJtS2LTkueCo6fpgCMwlyPh6llYs4IbKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rABHaT7m0VTAeVOL2HCAtQlr6g+/d77/Wa+3rrjxJzYT/iXzQDwEwvDPrM7+/z9tMJVO0/7lszKsU3/pVbt2zYzmnZ180bTrjaq2RsF06TNJElIQ+p6ioh2jTSfSVtLAL86HmTUMbU9FZPNeuzTBY3BxEr60xtvF2Ki4i39VXzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IR7xgxlz; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IR7xgxlz"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c9376c4bddso38910985a.3;
        Wed, 30 Apr 2025 15:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746052718; x=1746657518; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vQMd4+KE05AiC2tiYMqBEsrGqf6EspjdNnY21/A2l/0=;
        b=IR7xgxlzdTr4niBf9TLlJanzc6KFfcQjUwKkTMGEpkEK+aSLFkdbJIwMkFgWHD7/Kz
         rsp/fn86nDhxyJHCaHLy/MTfy4SXWYZgJZz9vTxuQ10H7QqAj+x/nQwT/w4QeQurW60V
         9GEZ7AUsgcWM9oVYKQ3USRR1cu+P+AoZ9XFS6lrCclrh5m6cBMxUhiIi9YFZTQGLpoeh
         mT89/xJE0pedzwVB2wmzvtwkcm5DA3OGWnPywhzFx2q2P8SGV4g42NSqKMgh1VaSlixA
         waUUB4rsyPME3iXOne28KAh13+H+/gdy7WgcoZJHl08xbaCocqVRlw/JMcYyPglSA+Oc
         cjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746052718; x=1746657518;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQMd4+KE05AiC2tiYMqBEsrGqf6EspjdNnY21/A2l/0=;
        b=F5D2mWdieDXmNssPrn7+y1L1o8lBzLKH/xotCqnF6WnVw2IeBxhR7TeQR1Hitb+Rkb
         3cwDRbrnle6x8C0Ye32J31nu3AsG8mibEzqnl+uGQCxRvkH1J8SYlkdBG0vtvTWjg5t+
         mHJFBKQ76TR7VRmbMpERyKCJNltyjliRBUvxc5laBc/zXlXI2Rl6bo5WXquxBnX7fkVK
         TXazBrevsIhjYs4D9TARW64l8MegwK4E62hdHt73QE+ibDCA82t61FPr/lDqRVE43DEB
         Hhx1fWaX9GBssmzDgaRJ4QnmzOgMttpxYHFXg/bncUbrfV1KAFYPV/OLyx0WNWRpHAaU
         JJBg==
X-Forwarded-Encrypted: i=1; AJvYcCWNHAoY5y4J6BzbP0GICvN2w5SGCs3OfnZr9Lj3jRKQ50qiDjrq9YqtlIkkbZVJNgjOajIP4mTe0WqF@vger.kernel.org, AJvYcCXfGBAvaTlYTnr6tvCUkO6gPMkp3mEKNXlTN06Vu3zXP51TyrN1Cqp7ecSjWRVvK0WoC0RWetSB3luwEwkg@vger.kernel.org
X-Gm-Message-State: AOJu0YxsCWQ6Bra4G7naatl7Bw9FH4Ft9UmS2AcGNoHWhHy0cefV5+v8
	un5Kf7C3ZwakTyLcR8UobpB5r3umlt8WeN25KpDQGpKNu9bP/rhOMLKvGs+3
X-Gm-Gg: ASbGnctyOwUkwsr6EgrcKeH7N0R0om+P+K/j5X95zfTeVC2xSxI/lVEjiHSzeSg8Nra
	hL/dmjwlOW/cr6qqKMt7BsMrHlKrEJgRprENiEaNESufFzfm7kJzgxQBFkqfGNvlSnLmY8IFCWO
	szR3WS0KiO09mTCL75BuzB/d6SjgXuZ6PSRo/uUalkxFY8sI6xvdH2hRwQYfdbD8LsXp1mB3XII
	S8liJPDVkAaB5O9xDL4vp+6JGCQGtKPiM0Qx066BzOAthlS7xGaFT5+Lh5VHQp6Zo+yCBdic0Te
	FhjOmZgUDRoE/btm
X-Google-Smtp-Source: AGHT+IEPKtkVF8ujzFEgXSiPNo+Q85srLA3blCN17p2R6lHtYzaH97Dg/qRUupCq5aMr7gFzbI+8rg==
X-Received: by 2002:a05:620a:248c:b0:7c5:9c13:2858 with SMTP id af79cd13be357-7cacee78829mr17841585a.0.1746052717703;
        Wed, 30 Apr 2025 15:38:37 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cacdee0d90sm15158085a.87.2025.04.30.15.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:38:37 -0700 (PDT)
Date: Thu, 1 May 2025 06:38:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: sophgo: Add support for newly added precise
 compatible
Message-ID: <miemx3dszewxyu33ymwbrdmyjxa7emay4z3wst6fgbsk6kdpn5@aa434epgrszf>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
 <9ea234373b18a91c6a2f7a41c441002de1e92e98.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ea234373b18a91c6a2f7a41c441002de1e92e98.camel@gmail.com>

On Wed, Apr 30, 2025 at 05:39:52PM +0200, Alexander Sverdlin wrote:
> Hi Inochi!
> 
> On Wed, 2025-04-30 at 10:09 +0800, Inochi Amaoto wrote:
> > Add of device id definition for newly added precise compatible.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/clk/sophgo/clk-cv1800.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
> > index e0c4dc347579..e10221df6385 100644
> > --- a/drivers/clk/sophgo/clk-cv1800.c
> > +++ b/drivers/clk/sophgo/clk-cv1800.c
> > @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device *pdev)
> >  
> >  static const struct of_device_id cv1800_clk_ids[] = {
> >  	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
> > +	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
> >  	{ .compatible = "sophgo,cv1810-clk", .data = &cv1810_desc },
> > +	{ .compatible = "sophgo,cv1812h-clk", .data = &cv1800_desc },
>                                                            ^
> Should it have been "cv1810_desc" instead?
> 

Yeah, this is a mistake. I will fix it.

> >  	{ .compatible = "sophgo,sg2000-clk", .data = &sg2000_desc },
> > +	{ .compatible = "sophgo,sg2002-clk", .data = &sg2000_desc },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, cv1800_clk_ids);
> 
> -- 
> Alexander Sverdlin.
