Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64CF25228F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755021; cv=none; b=KpybwVNYfL+fDtLvm8+4wCISvzNB2CsO35JFoS1cXh+ugdlHhvFtpkq8RRA2n6vWkkvlYEuAQs6Ny6QxlNRtLhlALdIQFgReJyX8Js0YBi3l7pAgmpXrtlyD0H291SoC1ChMdP4MGwL5uDswiPIFL+ctiV5ijgVdmhUZEmKJ8Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755021; c=relaxed/simple;
	bh=RHnt4riCe3tECmLsFLD9gUCwsch/lcYJCoqBcKryU/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jw+JIftvrrUXA780MDi6j4RH/pBRi0f4V7h4HqphPXuRgy35k+SaWTJb+XFTuerFw6gxYZlvNBkvCRZ+POaBoY8Xm3KIWGjR8+42heDzAZmiKH1JWAua6JeVTIa+2yZbRDR64AS50PDkr6+NCXfp/kygikVN9/72cI/2DaNXby4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oqej+yEA; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oqej+yEA"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acbb85ce788so34698266b.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750755018; x=1751359818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EHpmU23em8yN1qh+7DH7e9w7FK3AHCkOn2wEo6h9tHE=;
        b=Oqej+yEAhNWvVXuClb2gfuLRSJ+oj2xqU3jeEUPfP3mpKezkq/EQw4Eo/J4npyzhSm
         1LmABmE7OrPaT7fofHHNNn4lDcHk6h0pB5Q+lJdc+Gd/JjrjA+EYnGxRsKP3OoCNphRJ
         twtRSNrlrWJEXszC7Q2CIUYs+IwEEMfFZCVP3/SuoPjbEkkigU+wJYdlOU+Rq4Qbty3y
         6Nw0k5wZBX8stHDgt6VNtXHTkq9m43SXlRVEup+GsQQPCy6d+tkh9vtBDNZhavp0/fKX
         XyUlVXWIl3fXA6+EvKEeF9lvJPdMggrwy3m8W6HUSeZ2AYQ7oXF/aK9mCmit5cNJyClf
         ww8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750755018; x=1751359818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHpmU23em8yN1qh+7DH7e9w7FK3AHCkOn2wEo6h9tHE=;
        b=X+uFyw5crX9oI9KUBq+ustof88zOYiALnCtSlwKKNc0NfOYsgWMQuRmWAdgj3V0dAp
         fwjEXEFDg2aoCIx5mkW/E7k4UdNgpbnUkF/ZrNkKHazIx8lvp7zsux7gjUt4sAW/8oMm
         G45WIsnmffBJt1JrhmcNk7p2rxIL29jAOEI3CPpYm9zgtWRaqL1em0i5DcDTBgxjpnld
         Cdr9IW/cnCwZT/Eu3uNX8W8lC23cwQ7zU7Ix/NjpSUzwudcJ94QOnfC8M/jDPHUm5lxJ
         8FWjiq8bPY/NJYgdaDacQtE5ZsGuRBjdH6Qb4D3MxP6v9QykgcIiw39yBsWflHsFg6bE
         Owbw==
X-Forwarded-Encrypted: i=1; AJvYcCWbFvpkFO9NcnhB/piAnch1xTXmNkCJuYx7ZexnqxhN/4lzXzc5tgIGs0Nal6v3cymfdX1o2fTAxG5wT+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyChdiOKkzYGUu/J0sGJg39Egn4s4DxIL8PSbs2OetPeCS8phSK
	iOq6SR8O1LDCjzNHWd94waIfvuwFfm6t4eSUvh4uafkJkS+TmqnH6G3+
X-Gm-Gg: ASbGncv7iGPOgLrBUFOX16jCC/WzqH5KJMFtE8koT6VIxTCtkAmoxs5wSZ9VFWtNouV
	8q5cRjlHrfgBw8lr9FQJBn4ZHHlN3tMJapx0Og234+kyufnIutFLJgfhAAUyuLUVP1cNRotS34Z
	Qz2ABc6ZkbgScnP2ejm1l57w0lJxbr4Wknvzs90rbmoxCrHPzS9GDXNNcrHeM5uSIndwKpxNwQ9
	zbVcVBbv6U4oeHrPiSGH73uUjI2Q5FksWkEQlGbZ4x0P58GnSbZt44379mvDSjMCwTtunnxc/tt
	cVuGwgTm8cuqJhqV20C5SmjiHK+f22z+aLOkUpwL6TYW815QZaP9KJqT7yv3YaE1DlwNmHfKC/5
	dSbLM5vA=
X-Google-Smtp-Source: AGHT+IGveatgUdV49WyOW3zS3s00AfqE2JvL6i015zyHkQaCi8dmlojKIdOMuDGYIIzX7KUs0CHMjA==
X-Received: by 2002:a17:907:8688:b0:ad5:45d6:5fd5 with SMTP id a640c23a62f3a-ae057b61756mr1390536066b.30.1750755017804;
        Tue, 24 Jun 2025 01:50:17 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053edc0e9sm854150266b.54.2025.06.24.01.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 01:50:17 -0700 (PDT)
Date: Tue, 24 Jun 2025 10:50:15 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i3c: master: Add inline i3c_readl_fifo() and
 i3c_writel_fifo()
Message-ID: <kkbswsflgmfl2khbtwnlsntyzpublt666ozgv7snw4sbv2oteh@ry4wvwkz7uxz>
References: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
 <20250622-i3c-writesl-readsl-v2-1-2afd34ec6306@analog.com>
 <aFl2F+AEa6S1iA/h@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFl2F+AEa6S1iA/h@lizhi-Precision-Tower-5810>

On Mon, Jun 23, 2025 at 11:43:19AM -0400, Frank Li wrote:
> On Sun, Jun 22, 2025 at 11:18:58AM +0200, Jorge Marques wrote:
> > The i3c abstraction excepts u8 buffers, but some controllers have a bus
>                       ^ expects?
> 
> > width of 32-bits and don't support flagging valid bytes, so it is
> > required to read/write long words and to use memcpy on the remainder of
> > the number of bytes by 32-bits to not write/read outside the buffer
> > bounds.
> 
> The I3C abstraction expects u8 buffers, but some controllers operate with
> a 32-bit bus width FIFO and cannot flag valid bytes individually. To avoid
> reading or writing outside the buffer bounds, use 32-bit accesses where
> possible and apply memcpy for any remaining bytes.
Hi Frank,

gotcha,
> 
> Frank
> >
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
> >  drivers/i3c/internals.h | 37 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> > index 433f6088b7cec8c77288ee24dbee8b18338aa1eb..88887b12122efafac81bcfdd093d943259e13a08 100644
> > --- a/drivers/i3c/internals.h
> > +++ b/drivers/i3c/internals.h
> > @@ -22,4 +22,41 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
> >  int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
> >  			       const struct i3c_ibi_setup *req);
> >  void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev);
> > +
> > +/**
> > + * i3c_master_writesl- Write bytes to long memory region from byte array
> 
> i3c_writel_fifo - Write data buffer to 32bit FIFO
> 
> > + * @addr: Register to write to
> 
> FIFO address
> 
> > + * @bytes: Pointer to the data bytes to write
> 
> bytes and nbytes is too similar, can you rename bytes to buf?
Yep
> 
> Check read_fifo also.
Ack
> 
> Frank

Regards,
Jorge
> > + * @nbytes: Number of bytes to write
> > + */
> > +static inline void i3c_writel_fifo(void __iomem *addr, const void *bytes,
> > +				   int nbytes)
> > +{
> > +	writesl(addr, bytes, nbytes / 4);
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
> > +static inline void i3c_readl_fifo(const void __iomem *addr, void *bytes,
> > +				  int nbytes)
> > +{
> > +	readsl(addr, bytes, nbytes / 4);
> > +	if (nbytes & 3) {
> > +		u32 tmp;
> > +
> > +		tmp = readl(addr);
> > +		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> > +	}
> > +}
> > +
> >  #endif /* I3C_INTERNAL_H */
> >
> > --
> > 2.49.0
> >
> >
