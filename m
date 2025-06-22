Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A31A937
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 08:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750581821; cv=none; b=dxAhNl4DSD5Hez+5EGR/0ol15ejTIoO6We87HSOq5uQjAaqi0rWrCxoM1XAp9v+bogXc/Ca2WbH44VtXwRD3c9cI3KnwJ4majI5aloqwamnLz8ACxOOo0lwez5IvaX6usgSO41ENMQD5QPBfYIOQqNRbtg3IiInxntImNBKQO2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750581821; c=relaxed/simple;
	bh=2wwiSWkhKBMyDuEnFuHRPHuJsZo0hdXlLrbaC3KzV2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5XxFO3Dnyvv3QByF2uKT2vb0nVswSb4xek8X1pFbrF2PhZe7ktPBcjYajWhgtIpC7xBQqiZaHULmyobuQgS97QJHxjuXbbAbHstzGKdXLEH7+Lchr+A3BjBYJD/lw08BzqW9YPTyKaicvsbSj3e5QH3NTxOesMeufb2UCEuSNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8vgihKg; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8vgihKg"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso2722730f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 01:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750581818; x=1751186618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=962UG/WjfeGvO1clnj/Kvo3yAvg5LKIDDvZZU4WDKpE=;
        b=e8vgihKgtMfKWUn+UV0Mz23aS+/kpjcRoUOhxruYjssmIrI2uW7XrkxGEWuWvY0Vrl
         iXJr7GkkH2ZOjJBwsHq6yxllfIkrueeFOSzBlyUwcxsKTiK81Y86v2EbmjSI7W8dzkcx
         plWVcWFKiXD5EGuOnVsUPmXgnGQLGTBClilBt7ktrq8QLCl7tHgAdPPW/YCM5MMVwm6Z
         WfQU8cvKyAPq/lOCOkIlRmGkw7xlh9AANsN9e6sDvEtofpMKqVonLY2HwT0JGwc2SuzM
         M+a1IhEQsy0OSn9Uiu6/9pxeRAmNr6fje5IxYYUiNWOqRSvNwSx7wc8UHY9XNRuYr2DP
         u+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750581818; x=1751186618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=962UG/WjfeGvO1clnj/Kvo3yAvg5LKIDDvZZU4WDKpE=;
        b=JpmdlouaicQnw3gd2sUrcdjHSUISVry4HMRskrcTA2lFNp/x682bODu97Tj/Pc5Efx
         WRAiGL9HkmveMGVGcAj00zyfQJBLtPAK+RtnI15ApC2bPhRCt9IV+kZ2B3X5H8vXADBG
         8LjtOhivz8e9WthTxPTqP4a/YexdvJjQn8k7Sfmn3lM3SK5qDFeQ5wtWui/MYo6l8bRK
         Ch9B0Am81CV5WQE3O2eg/Vkj7cKNt86F4sqYbcBIUFI2/Nljnn9CpO67ty746RiCfrlt
         f6mJQWkDEi5ONdbpgBMYcvyRRGQtQNnimfTny6I6CSUFzkLcXeMOzgFlmb732ES/Udzi
         K/yg==
X-Forwarded-Encrypted: i=1; AJvYcCXhVjBTUBJhrtN4bAvj3R5juvXP16fnNmC8rlFkBe/z3bPeOjM6PSt/r/0i1HIlYKpAAXwbTZawdmFgS6A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo0wqcYCWlqsvEtqfxgsgrkLJL+cirCmbqUDyIPo8WKbAKAOQ6
	UjCvceFpnjvycFc8UX+ngJoF5oI9Nejs2D9jqN+77W5VpkUnCDgSsyL5
X-Gm-Gg: ASbGnctS6/Ab9fC6I5kmLP4/+YMg5ymz8vfqSkCGPAT8twWhf14pnwfTLc/U4GAra1k
	PHOKnyuRLdGcUK9NYtdVEWuBSLbhGNoAk2+CwhHuP1cmMuZvDu4ar/TkL8JIcpQo2Qp24n+SEEz
	SjqGNVPXGkKl7KD6+9QKB0KCYQPKpmVTNHNTZFkXb2aTHiCA+LEdsEvFeRsm/pAgqSJHtjhnR6b
	gp48JlA7OK5IC9nnB26oJme8tk0/5RgJ9nD87eY2oUW/yF86nREvthABoCF9MaSq8YykGbk/blY
	Tm+xsAKBnegvMU6Cj8UYxLnkz6gYXytVLriLZ0lCynivQysGpOdbCVluH9beIPc3r9dhFHu3yRs
	BhgYnYR2vQkY=
X-Google-Smtp-Source: AGHT+IGYvF6Ktr46LKGJGqo5Y7atGzFDJs6HcvtBskYedFf93GhmSAEMG1Hy3kV3R/91xJe9ZSrZUA==
X-Received: by 2002:a05:6000:26c1:b0:3a4:fbaf:3f99 with SMTP id ffacd0b85a97d-3a6d12dd6e7mr7694500f8f.13.1750581817594;
        Sun, 22 Jun 2025 01:43:37 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:12d0:5a01:b4d7:fc8d:4cb4:dd35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d145e520sm6388390f8f.20.2025.06.22.01.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 01:43:37 -0700 (PDT)
Date: Sun, 22 Jun 2025 10:43:35 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i3c: master: Add inline i3c_master_readsl and
 i3c_master_writesl
Message-ID: <z6hrfvw3ubkob67k7bvg2qovsxwenh3e76bdtdjgsbnpchniwn@6hxhf3sxynxv>
References: <20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com>
 <20250620-i3c-writesl-readsl-v1-1-e0aa1c014dff@analog.com>
 <aFWrSHg2M1lq8kGt@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFWrSHg2M1lq8kGt@lizhi-Precision-Tower-5810>

On Fri, Jun 20, 2025 at 02:41:12PM -0400, Frank Li wrote:
> On Fri, Jun 20, 2025 at 06:54:59PM +0200, Jorge Marques wrote:
> > The i3c abstraction excepts u8 buffers, but some controllers have a bus
> > width of 32-bits and don't support flagging valid bytes, so it is
> > required to read/write long words and to use memcpy on the remainder of
> > the number of bytes by 32-bits to not write/read outside the buffer
> > bounds.
> >
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
> >  include/linux/i3c/master.h | 36 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> > index c67922ece617d6320c0c7e4838c2e7edda8c19f5..11401f2acb42e4d3a60df33b7c794d8a0360cdc2 100644
> > --- a/include/linux/i3c/master.h
> > +++ b/include/linux/i3c/master.h
> 
> suggest move to drivers/i3c/internals.h becaue only master drivers use it.
> 
Hi Frank,
Ok, also renaming to i3c_writel_fifo() and i3c_readl_fifo() as well
reworking the commit messages.
> > @@ -674,6 +674,42 @@ i3c_master_get_bus(struct i3c_master_controller *master)
> >  	return &master->bus;
> >  }
> >
> > +/**
> > + * i3c_master_writesl- Write bytes to long memory region from byte array
> > + * @addr: Register to write to
> > + * @bytes: Pointer to the data bytes to write
> > + * @nbytes: Number of bytes to write
> > + */
> > +static inline void i3c_master_writesl(void __iomem *addr, const u8 *bytes,
> > +				      int nbytes)
> 
> const void *bytes
> 
Ack.

> > +{
> > +writesl(addr, bytes, nbytes / 4);
> 
> fix indention
> 
> Frank
> 
Ack.

Best regards,
Jorge
> > +	if (nbytes & 3) {
> > +		u32 tmp = 0;
> > +
> > +		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
> > +		writel(tmp, addr);
> > +	}
> > +}
> > +
> > +/**
> > + * i3c_master_readsl - Read bytes from long memory region to byte array
> > + * @addr: Register to read from
> > + * @bytes: Pointer to the buffer to store read bytes
> > + * @nbytes: Number of bytes to read
> > + */
> > +static inline void i3c_master_readsl(const void __iomem *addr, u8 *bytes,
> > +				     int nbytes)
> > +{
> > +readsl(addr, bytes, nbytes / 4);
> > +	if (nbytes & 3) {
> > +		u32 tmp;
> > +
> > +		tmp = readl(addr);
> > +		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> > +	}
> > +}
> > +
> >  struct i3c_generic_ibi_pool;
> >
> >  struct i3c_generic_ibi_pool *
> >
> > --
> > 2.49.0
> >
> >
