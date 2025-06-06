Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A720C00B;
	Fri,  6 Jun 2025 10:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749204924; cv=none; b=kZBzcXWyXws6xHLEyLv2x7H09tcfRTNkt3CGdT8Pn/dC5BxTD2J4a3ysLurNr7UFwIVqsWnwY91iSTpjFAFuYHKVzYQmKQXwd6LdeqHKjqodoosK4EIcpI85WLVwUHgkN2G2vVMi+0ZgzahhF6z2/QdFX2bAxHhWu+V9LHTbdZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749204924; c=relaxed/simple;
	bh=L24GANeu0g8hEgu3+7YInBdMLbObkVzHCL14OVqBh90=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHeOrS93MRLvuaYrMSezl5aVGsCNt5iEUpxMEdJ3y/Cu+S2v7GZVuF07PlNx+gGmSaeMyZGdCviTtI8H330rhdaKmdLWqD2ER1E0jJJNMhzK1r34eliPW3bG9eQwyNNkbUVyKMBMePHZQKWG0OrVImhFojvU+qVf2QA/n+BiYzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvARLcEM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvARLcEM"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450ce671a08so12386425e9.3;
        Fri, 06 Jun 2025 03:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749204921; x=1749809721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NDtFnCkMReqqiUbpjeifRmII/hPtdUlD+iwNu+Nb/uo=;
        b=AvARLcEMWZo6k3n9ynSiw2BiIXw25ahg86tFvq3lI1KKaOmkE3ercQ14nCWE6V4F1w
         feD6W/oQrDxb9ptSNC7+0P1P20EJVtLob6f5/5Fj/rE3CPTPSAcjI7mAdtnfaiShsfxl
         xPIxHrqIsYeNd2sFch5xOw2TqElSKCh/FadRiUnxv4p43XwAOMtv1eGsVG2VplggVrfW
         TxYioBLoHxmC466tWO7ln+CzR7xQo4S/Wjvo4MW+W5XJXEnSW8zr4Fn1KZCZj9kqmNyz
         qqYlMyHt7Wnzy8Ysnm3onZ7V8JqHoWNPpw4z9LBzxU1A4K59xraAEKaCY2DgF5WzK0xo
         5OYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749204921; x=1749809721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDtFnCkMReqqiUbpjeifRmII/hPtdUlD+iwNu+Nb/uo=;
        b=T+Kx39v8w0PuLjojjekRIXV4jIIHG0QtY7T75fCjNxbtdmQqy9E8m/UPQ7jaIJ8ktz
         nMlXtoQXQ5VAulX9nH52yvJdyqKzis7rNNVRWzKRWaO2KgkB4sFMRwRPtaxTC9Jx7PTk
         9BJVc7H2v/8sD4LAKC/butirJ5aPba/rnCNVs+NANMrqwRn/MiV0ebnEwZrJqzztYkbe
         A+7GckujkmeSoEePqHyH2f4/jRtzZ4G2Cjqsl55LjdiZf+H/EaEDZUUR+QYMmdyPW/0m
         mwaZXq140vsQ5wwLxvHE3jGcPI8yXv2Amxm6L97YzV99/myUk6uQuQneN9SuxsIVOHEn
         iMQg==
X-Forwarded-Encrypted: i=1; AJvYcCUn5kHy9Oir+XYMjbwxcx93pZLHzET2rPG0qK7QtorfUSChLrV8gyYKS68vlmmOKPC58XVbTX61Cv10@vger.kernel.org, AJvYcCXOgeF1wSImSSl0Nx8OaOQHTxacFKBJxYxVSF43JpJSnX6t+jDvNVu0J0Y3FQ9+HMpGSfif/FglFcloM2by@vger.kernel.org
X-Gm-Message-State: AOJu0YzK91RiOXky6clgol0N0P37O02WnGajkkPKW1advn+utqEZNkjC
	lnSnL4F42RBGkbLOxnNUXrjME5en/p68SGDGZzlJqt3cpJhlpr42ZSDY+zuZlq3qZMhstQ==
X-Gm-Gg: ASbGncvFl4S04hPrn5/K2Btn7vaYL6o1vIEi0N6YVgl9EERyv9xmM+myT8b30YgGFCL
	FUF8SXccUMTirB9lAG/9URyE5eKvyjKdPYdpaRZHFLw3T80QrV2FecDvnKydMlXOj3oFV207NX8
	eGBDGASZTtuUnc4UoU/n59zc+gtm5LTWLWOx5BW5evZY6/GKm6p/+2jb0COWmwJ3FNFLNmv0oKi
	v84dP74K7HxY4SBWFaC2yujeaVMZ2+CKONByKwGm1L12Oq1H4bQgjCpiGslxSX7lXAH+7r/fMeA
	iZAvupzUIcLjzQl1jJuk00X3RiT7VuaEQ8mYzJ26rzLx7HO+rT/nO8kRgmy4D8aYrwR+UaGlhn8
	Q
X-Google-Smtp-Source: AGHT+IHkoGqyZU4A8UbDxOXpDq17ie8vVLoKYLh6DutXiqc0wb92kNu+EH/C1X6j+1vj63Y0RhyNSw==
X-Received: by 2002:a05:600c:1c85:b0:445:1984:247d with SMTP id 5b1f17b1804b1-4520136ee1amr26616255e9.7.1749204920556;
        Fri, 06 Jun 2025 03:15:20 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:1225:ec01:d1d7:779d:8019:7bb0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213726c44sm19113435e9.28.2025.06.06.03.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:15:20 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:15:18 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Frank Li <Frank.li@nxp.com>, Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <kffxck2gorwcdcokh6sf2p6vsnuketjimpbls3nqp6oapo5zdn@3yoxssd4ncxl>
References: <20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com>
 <20250604-adi-i3c-master-v1-2-0488e80dafcb@analog.com>
 <aECaFQzkPYdfjagK@lizhi-Precision-Tower-5810>
 <aEDCATbPA9173lGI@shikoro>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEDCATbPA9173lGI@shikoro>

Hi Wolfram,

On Thu, Jun 05, 2025 at 12:00:33AM +0200, Wolfram Sang wrote:
> Hi everyone,
> 
> On Wed, Jun 04, 2025 at 03:10:13PM -0400, Frank Li wrote:
> > On Wed, Jun 04, 2025 at 05:48:58PM +0200, Jorge Marques wrote:
> > > Add support for Analog Devices I3C Controller IP, an AXI-interfaced IP
> > > core that supports I3C and I2C devices, multiple speed-grades and
> > > I3C IBIs.
> > >
> > > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> 
> Hmm, I didn't get the original patches. They are probably still in the
> moderated queue?
> 

Yep the patch was held in the queue but are delivered now.

> > > +#define REG_VERSION			0x000
> > > +#define REG_ENABLE			0x040
> > > +#define REG_IRQ_MASK			0x080
> > > +#define REG_IRQ_PENDING			0x084
> > > +#define REG_CMD_FIFO			0x0d4
> > > +#define REG_CMDR_FIFO			0x0d8
> > > +#define REG_SDO_FIFO			0x0dc
> > > +#define REG_SDI_FIFO			0x0e0
> > > +#define REG_IBI_FIFO			0x0e4
> > > +#define REG_FIFO_STATUS			0x0e8
> > > +#define REG_OPS				0x100
> > > +#define REG_IBI_CONFIG			0x140
> > > +#define REG_DEV_CHAR			0x180
> 
> This register set has some 'cdns'-vibe to it. Maybe an earlier version?
> Not sure merging this into the cdns-driver is a good idea, the register
> set looks quite different to me. Note that I don't know cdns hardware, I
> just grew a habit of comparing register sets of new drivers to avoid
> duplicated drivers.
> 

This controller targets FPGAs, in particular low-cost ones. I am not
familar with cdns hw either. Overall the driver is strongly shaped by
the i3c ops, the spi-axi-spi-engine.c (also a FPGA IP) and the other
linux i3c controller drivers.

> Happy hacking,
> 
>    Wolfram

Best regards,
Jorge


> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

