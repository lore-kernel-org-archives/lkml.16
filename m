Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF620253950
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755344; cv=none; b=E17BEMY5/b62ppZ30t6PrOcnAK3tqX4dTeLPOjpwJG2Yp71l6lZqQ/Y+Xke2RV2liM1B5en1dB3GZ4IFZE2zcqqyMZWlhBoSFxUkLFBmI7GaOjCDixVSMz3thLEhWUANP//d8KQYqFL/ex6WmE+egKDL5roFp1d0cnrGcYSsHqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755344; c=relaxed/simple;
	bh=oA/kVapZVBq+Jn+0EX2e6Q6xqSf3j6xJwCLDuYFK1Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlmRRRJcuRepIyRRyL6KTFKP2jkh9Vki1lLNwXMOJVziSPajsyAzJT4uDqq0RSJELiOXSfp/GUuGSPW4rt6Q4sQ0DH1OYa1csoYTCAfRWDRABukNrE2jKzq9kTfPEcL/vm5RkRe4xQy7rl67h5mPWFU1VB0AFlZUAlf3swAKz1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFcqB1n2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFcqB1n2"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45348bff79fso55907965e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750755341; x=1751360141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPGm+ksyyEeqsaZkk6KIgowMLGKZ7TrwFEqIL98DU2A=;
        b=fFcqB1n2/8CbTiRRH6sgILVLXfIXA4z0msHb4Oz1D2owBKXUODtIhMKk0ucglC3lHE
         YS4BekQNwpxYVnQw3zuGnl71dybK+coQ2wgsN5gFfBDVTydzZbJ2+MAqbuYxFd01U/4Y
         bsimtyTL5+j/GOGlF6PXfzSlIgD0NXHWy8oG3lgfc0XTSeGPVQMUjCY0hzTl1iECi1R7
         fkKOMd/odhjaLWxW3T9WRDcSubu1Pe6I6Rv+SvV4KdJS/UzCtCFyKtu3SZW6pCd/sMzG
         Z4l55VyV0MRBdkJ0rrZiz8Xb1UYUxwl1iMyOEui9LexGD1WKrXFlF0NZ2I6eO7zmwNgg
         v2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750755341; x=1751360141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPGm+ksyyEeqsaZkk6KIgowMLGKZ7TrwFEqIL98DU2A=;
        b=fXjKMFUB1yEtdW/OtURcQyN4Q8nlXzs6FLPVVm+yqrD7UdcOzmR4lmfvoJCqFKijPm
         XyPWS/iCqarZ33Ee6Ua7edEhyaxrhf3+2y1OL/xr7P9Dep8ABOBYaEV4TAFS4GbcCV7f
         /k9MR5FrHnHDYbR0OZ69POSMF0LG8ODp+JnvgF9XaZj7Mglc2qSdEkx7vJfv7GQGkUF+
         Z/5uIAmO+//bsOe98nN6KDYzeZ+DkdhoQ3qVZXbsK1H/RmuygvUESZnD7LF3ofVb4MCO
         kCFvZLuWmniIM+cyMN3B0CIsZ4fsCGwz1jmbyrt0gtcxaFDwBX8TRaE2QHP4BRYrVf3/
         6drw==
X-Forwarded-Encrypted: i=1; AJvYcCVM8fHZsBdObmj4GoRVSfTJjGDamCRgSd5gImEW/UUdJnMeJXfAtQZQ+PWKeZ93y529qoX8IfPi0QOb5Uo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD31rdCrq83rCyqAWjp+J7qdfq3/Q5KiKUCvhDsCavDemAeu2K
	Z59Q9x8L+jYufAjRzhV7mHUy1/Qvn4YFK0s8Qwx6n+/EZurO++gJgFpc
X-Gm-Gg: ASbGnct3G+OW62nTSZ4x4PnCZ71TCtb8+P1WKVBbdNkWvJ96psR51yRP1lYSAH7ENFa
	Ejd1LHUlSFtHnyIOj5YyooQwOBkjeVb3hwPk0AaFfEXJZFcUelerT5DwzeWIooto5Fyl4UoO8Vz
	oaeuD3Pk7iedOcc8k4x4Mie6EbHQeRVFjfcgg7Ywc/fyOQe4RWzfpcdH8XlGdCLFIVmBTWdfc6u
	ODED+hm4hz/MDOfZ3c59X2EGwrwbJOIx9r5K/gBefU6mLLTYFtEU98Jb30qAVMY4pkAfx23yqcN
	pmIPpbOgoap5CtYwFuOBQU04fxuTxhqWQdz2UMsrSi5TYcVdtYTY6l7QoFbXrTmcbYNRKk4PZdS
	fGCaxu/4=
X-Google-Smtp-Source: AGHT+IFi/6S11Ns8YaVWTB7lAOqARcQT5hiRsABwqS8+fvcL2CzddPVFXXjj9JPj4DA/1iVPexHNew==
X-Received: by 2002:a05:600c:1c98:b0:450:cf00:20f5 with SMTP id 5b1f17b1804b1-45367067893mr164029145e9.9.1750755340683;
        Tue, 24 Jun 2025 01:55:40 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97ac4asm167215095e9.3.2025.06.24.01.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 01:55:40 -0700 (PDT)
Date: Tue, 24 Jun 2025 10:55:37 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i3c: master: cdns: Use i3c_master_writesl() and
 i3c_master_readsl()
Message-ID: <lzpi6excrkarkya7w2tgirxzpktrt67csg3pkquyw5er5w65au@ymh5kanqbaa4>
References: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
 <20250622-i3c-writesl-readsl-v2-2-2afd34ec6306@analog.com>
 <aFl2j4BvOxzl/2nh@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFl2j4BvOxzl/2nh@lizhi-Precision-Tower-5810>

On Mon, Jun 23, 2025 at 11:45:19AM -0400, Frank Li wrote:
> On Sun, Jun 22, 2025 at 11:18:59AM +0200, Jorge Marques wrote:
> > Use common inline i3c_master_writesl()/i3c_master_readsl() methods to
> 
> API name changed, you need update it also, include subject.
> 
> Frank
> 
Ack

Regards,
Jorge
> > simplify code since the FIFO of controller is a 32bit width.
> >
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
> >  drivers/i3c/master/i3c-master-cdns.c | 25 +++++--------------------
> >  1 file changed, 5 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> > index fd3752cea654954ed1e37337754e45fddbbbf68e..321c04d2109ec1951f2b07a9d1b88c6aaf055c95 100644
> > --- a/drivers/i3c/master/i3c-master-cdns.c
> > +++ b/drivers/i3c/master/i3c-master-cdns.c
> > @@ -23,6 +23,8 @@
> >  #include <linux/spinlock.h>
> >  #include <linux/workqueue.h>
> >
> > +#include "../internals.h"
> > +
> >  #define DEV_ID				0x0
> >  #define DEV_ID_I3C_MASTER		0x5034
> >
> > @@ -427,25 +429,13 @@ to_cdns_i3c_master(struct i3c_master_controller *master)
> >  static void cdns_i3c_master_wr_to_tx_fifo(struct cdns_i3c_master *master,
> >  					  const u8 *bytes, int nbytes)
> >  {
> > -	writesl(master->regs + TX_FIFO, bytes, nbytes / 4);
> > -	if (nbytes & 3) {
> > -		u32 tmp = 0;
> > -
> > -		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
> > -		writesl(master->regs + TX_FIFO, &tmp, 1);
> > -	}
> > +	i3c_writel_fifo(master->regs + TX_FIFO, bytes, nbytes);
> >  }
> >
> >  static void cdns_i3c_master_rd_from_rx_fifo(struct cdns_i3c_master *master,
> >  					    u8 *bytes, int nbytes)
> >  {
> > -	readsl(master->regs + RX_FIFO, bytes, nbytes / 4);
> > -	if (nbytes & 3) {
> > -		u32 tmp;
> > -
> > -		readsl(master->regs + RX_FIFO, &tmp, 1);
> > -		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> > -	}
> > +	i3c_readl_fifo(master->regs + RX_FIFO, bytes, nbytes);
> >  }
> >
> >  static bool cdns_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
> > @@ -1330,12 +1320,7 @@ static void cdns_i3c_master_handle_ibi(struct cdns_i3c_master *master,
> >  	buf = slot->data;
> >
> >  	nbytes = IBIR_XFER_BYTES(ibir);
> > -	readsl(master->regs + IBI_DATA_FIFO, buf, nbytes / 4);
> > -	if (nbytes % 3) {
> > -		u32 tmp = __raw_readl(master->regs + IBI_DATA_FIFO);
> > -
> > -		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
> > -	}
> > +	i3c_readl_fifo(master->regs + IBI_DATA_FIFO, buf, nbytes);
> >
> >  	slot->len = min_t(unsigned int, IBIR_XFER_BYTES(ibir),
> >  			  dev->ibi->max_payload_len);
> >
> > --
> > 2.49.0
> >
> >
