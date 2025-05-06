Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E316E27875F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530166; cv=none; b=TPEv82JVuoTl0rgXk0/+Lg8QFWWaqYEyDlcGapIPQprSDvlNo+cAYwGe1xySAg0CwgwvKixOXZBRiPdbx4i2SAn+dqDV3m6Ofnd3pW/7uwvb/op/zz7ArEYcU1ZAMmA/wWXMSX8vj/gSGxu0qwJ7ftyEgP84bv7maHyo2ucKAsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530166; c=relaxed/simple;
	bh=Ic6iSBqqOYzgqBs0HWZuf5LIeAmlU/Dk/nOP/28CaHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUEJ8STTk9PYUUr2ZcVxsXThNcL8qUIZHHMeriVLYVec2wWwYcz9esL7/tAHW9KF/EvKyyTLH/NYMGGl8Aa+NnlWrphRx8nOQK2vYz3C6XeVF7d84FpjibbPTZuEHZ95XnrS/DCIR6ZyCHk25mAuMXWISl/re/jBl7UIHspufwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q8h74pHz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q8h74pHz"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso50367625e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 04:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746530162; x=1747134962; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AZCwgOWOOCWTlbTNg+Glm3yWO7Px7uzRJr4qQIo37HE=;
        b=q8h74pHzgCsX2aFWHKuI7jWS0k5ifTSuGh+hdR6G4sVgVqHRmD1nLZVAyQUfUYq96e
         IsNxObUHqkcVkzSJM+sg+NtKaa7b4SxyC1/i8voGv7GDeCApBd12VY+NUmdvNXn3EVcU
         NercAKKrONxgUJetuGfmvQnIzbYgXWgawWRu2Pm9OOy5bw5aOeO/YrYppAXRS4okSHzg
         /B00IqjDsFL7OSQqw6rWVuLyddk3duXdNt075YOQh9NYu6Wa/XhVKLfB+NOtpVjWO+Gg
         d/wQjO298/WcGJmABbtOoU29QmhdXDjU1CET7U5dHIRKOXZrmr3k1jaTvdXRvL1aiRYl
         k3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746530162; x=1747134962;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZCwgOWOOCWTlbTNg+Glm3yWO7Px7uzRJr4qQIo37HE=;
        b=emeWtkSZExPJ//Ak1swLK8GBF9dgasWPWd6USo2H6aKFhkyNJ6rA0v3eeCbVD9K3bg
         uH685Q121zkA3jsLwPKa2TJyhbKCAH4bl5NHIkWK1kEb2tmowUCHa1Crqe3iQg38OhxJ
         cxcPXJRMnp2fJ/r97A8Oz0g8kkGcC8HniY5lDDx2IkzanjRtnN3fvI6wmwzungH3htn0
         2ieGpf+Sxfpu7fwA+gUNmtDHQRkA7IoG4afYRFPDHSBJzvsAHqNmekT8ymv4vYYVjtbX
         X9btOrqgljqZAe9lts8OZjP255nX98aUUdwlVoSYgbuGycGGd+b3pa/YkJAwGb4etYLE
         zfNg==
X-Forwarded-Encrypted: i=1; AJvYcCX4f9Fl6e7bifW/uHUv3pVR7dDrgpZj9LiL4lrzB+j0jEXuURin8A3eXDYRxcsUtZqMAT9KsbNikKBWKvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwylDRuc/HjUoFVAp2LrBV2GeeZlLV+Yuy2Acus+SPwr73Q4uKu
	zTYEJXjY6IgedOJT/GQrlcjYUfN/bAEyw+UOEGCNDDzpFBxlJwElpUp4sXBCxGA=
X-Gm-Gg: ASbGncvMtfgzy0tQ8E3ZxQ008bXz77XzW2IkJQsy8TE2jVE5u7bejoLO17S4Ngpnt5r
	Dl+dbABH+7Yh6SRT3YeY7gDiIeYOzuSJAyiwH+wGMS9s7BEMcqVPLtMOEMyt0ltNdM5CI9KNItT
	MRHmk7wrBcO8/VMeDcdk+MapPL14KdpdQF8/2ZidzGycNlvfvKFEs3UG06RBDxOsTqEI5FNzwxW
	KUsM9hn9vq9h8fx2U8WB/5cVp1Cb2T0mbvB8FGccyk3/aYtlNtuO22VpR7ANKFYCxKeHAMq4mJg
	cR5zEw544qiLK8MRMHodLpP1KB5VTch0F/e3mjbJ2L3hu8rxHke/4unz
X-Google-Smtp-Source: AGHT+IEb/FzHjC2BdixzCZvpPpVp5jderqE1DM9mJQuUaUitas1wO3yPRwuVgog0ub9hO25i19Te4w==
X-Received: by 2002:a05:600c:4ec6:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-441c48dc0a1mr103108985e9.16.1746530162207;
        Tue, 06 May 2025 04:16:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b8a286b9sm164637705e9.28.2025.05.06.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:16:01 -0700 (PDT)
Date: Tue, 6 May 2025 14:15:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mtd: rawnand: loongson1: Fix error code in
 ls1x_nand_dma_transfer()
Message-ID: <aBnvbYaE-tud_o0x@stanley.mountain>
References: <aBSEwag_ducqOwy7@stanley.mountain>
 <CAJhJPsUZz2kwMyWPDrc_ktb5O6ECcAyO1OrXXVWh9yvkrKRidg@mail.gmail.com>
 <aBnXPYLSNJASR51f@stanley.mountain>
 <CAJhJPsX2-Q+Yq86_Vdyxe-_SVR0j1e5buE8Yw+RbJgp6Kadh8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJhJPsX2-Q+Yq86_Vdyxe-_SVR0j1e5buE8Yw+RbJgp6Kadh8Q@mail.gmail.com>

On Tue, May 06, 2025 at 06:01:15PM +0800, Keguang Zhang wrote:
> On Tue, May 6, 2025 at 5:32 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Tue, May 06, 2025 at 05:16:03PM +0800, Keguang Zhang wrote:
> > > On Fri, May 2, 2025 at 4:39 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > > >
> > > > The "desc" variable is NULL and PTR_ERR(NULL) is zero/success.  Return
> > > > a negative error code instead.
> > > >
> > > > Fixes: d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller Driver")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > ---
> > > > It's hard to know what the patch prefix should be here.  Ideally when we
> > > > add a new driver we would use the patch prefix for the driver.
> > > >
> > > > Tired: subsystem: Add driver XXX
> > > > Wired: subsystem: XXX: Add driver for XXX
> > > >
> > > >  drivers/mtd/nand/raw/loongson1-nand-controller.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > > index 6a369b1c7d86..8754bb4f8b56 100644
> > > > --- a/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > > +++ b/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > > @@ -371,7 +371,7 @@ static int ls1x_nand_dma_transfer(struct ls1x_nand_host *host, struct ls1x_nand_
> > > >         desc = dmaengine_prep_slave_single(chan, dma_addr, op->len, xfer_dir, DMA_PREP_INTERRUPT);
> > > >         if (!desc) {
> > > >                 dev_err(dev, "failed to prepare DMA descriptor\n");
> > > > -               ret = PTR_ERR(desc);
> > > > +               ret = -ENOMEM;
> > >
> > > Thank you for fixing this issue.
> > > However, I believe -EIO is more appropriate than -ENOMEM, since
> > > dmaengine_prep_slave_single() can return errors other than -ENOMEM.
> > >
> >
> > It's not an I/O error so -EIO isn't correct.
> >
> > There are a bunch of reasons it could fail but most likely
> > dma_pool_alloc() failed.  I think -ENOMEM is correct.
> >
> 
> Have you reviewed the implementation of ls1x_dma_prep_slave_sg()?

The ls1x_dma_prep_slave_sg() has basically two error cases, buggy drivers
and allocation errors.  Someone could argue that if people pass invalid
data then the correct return is -EINVAL but in these cases it's a buggy
driver and we fix bugs, we don't work around them.  So the correct
return is -ENOMEM.

> Errors in this function can be caused not only by -ENOMEM, but also by -EINVAL.
> Moreover, in most cases, the error handling logic for
> dmaengine_prep_slave_single() returns -EIO when the function returns
> NULL.

There are some that return -EIO but hardly the majority.  Other places
return -ENOMEM or -EINVAL.  It's not worth going back and fixing all of
these but really -ENOMEM is the correct return.

regards,
dan carpenter

