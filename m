Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54AA26B2BE
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523973; cv=none; b=iwy9YiCQ1dk33DkYb16tN8hyRQz40riR68PNfQPC9+4qxtcIhAqI99vV07/+2j0SMBXsaGuC6sU2MOBJBKADqWwOSsLQxyenxd4sgt/+XQXIEg7rreSzk5opwO+hisHOVQ6kYcbkNkxYds1NCxXScfqRlh7Do6SC5wacaZTmWtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523973; c=relaxed/simple;
	bh=wt//UxgywGSXYRvzRt4PXjL5bjHJUnNsBGZo0dbvufU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=beyffz1PDOE24uoEhpgupNURSyBrwhh+3V3o8wGMWw+ZmATr5bsy3/kwHYs3rVAHa4YhktN+AwE+7B1kNX+ds5DvAIIAPgUydqtaLHiFjxyMfnTMqcR5gPGADHHGotgE5b7m3iSGifIYByw8DKvYNVeuXfa11/Q4qmQ3pCuMUYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F5g0noTT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F5g0noTT"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-441c99459e9so16117725e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746523970; x=1747128770; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nGT9uv0lzPx3oU6XAhFYncy4NYk5F/6MJ4HISb7Jycc=;
        b=F5g0noTTSTEWQcchUWTsbl/VsNboEl663VkP0OyhfZdJnhA3iD9SAu1+WMCTEbGYfA
         kP0K+J8Rm8oUs6qC4Vsi+0oMJBNVzh2OrQM4Yag2+4co/KNYF+8ikC7qgTDDg2ymKeLD
         vgRfeLQib+BsrhsjLJbhkHKpb6lNKLQDWdcOnQmUAtxTWG1W0lAo9l23DvPa+9MjxlhC
         7n8IgSaOA8Rqgry+P8rh47txpn2TqPBxfVr08hRz/xFwgbl3T7/dVMbjPEzIbFWm6ihL
         RTAZKY73C0+yGr8peLyULz/93l5a3LoOid4wYqc9OOo9oQlnkJPwnw/Ko6uBKZJKWGIE
         SUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523970; x=1747128770;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGT9uv0lzPx3oU6XAhFYncy4NYk5F/6MJ4HISb7Jycc=;
        b=MbyXBVPIWIcvLEJ4oI1dxzWaSAO8jks2LCqV6J2sR3ioGaHxjGptw8pJpnGO6n7zqW
         IeBAF7Jgkpzz6/InglWmgXIYH+O8FbMlV01ipoVOz0rmi8dbjmIMBLWkta0rXZTt1+go
         PLOOdmcK7KcXdn5QACOwsNuCCnVoAvteDquuTW9Od/DaP/SMxbzNtSmgUMR1X3DCs0on
         XNzfvhjHGqWvu09uuy1rRz1DJHgIU/jDn2ajCIvH9ps1SdVq/IYOReNp+cGlRqt8222k
         ncZVQJOAwYofbejMqa+vYlnUugnI8j0pz55o0Y1j0dQuVVcpY7VdfPbVim3/kMXc6Au/
         617w==
X-Forwarded-Encrypted: i=1; AJvYcCVgetP1tpLI6Vak9klcp+rGl6s/8gzqtR58U0CNDmzJpukod+El0mqFkujhzBNTxFenv9W4piEiO2+XXt4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5egkHY3WFqr3GBl5bEp6uz6h4dDnqiHJg2uCJ8kTQ2p87s395
	8/QLlc3LZsevYicXrrDStImgwtHjBxfiC8yURKzJ63dFE2vEaepvynot2o0AlyU=
X-Gm-Gg: ASbGncuqraMq/bBxRefYdBrQH493hq4dJi9+kmq3BeaMXkPQlH2LQHjUx0Fd2tzMZKI
	IfWqecCBt3nzFgX1S2XSV/lGZN1BonMiw3tCRs0xkHi2lNdr2R5QeBWymLMlSmkIHF+2aFKeMZt
	v+HDUtgfgxCwwuuUjWAOjwe2BYwiuyb6MiGOinejmwjjq8f4Ihk1ENjtLBUSX9O6RfWxwhPhQ8j
	2WcRtILq3XqCa79rI6KFUDZyaMdn8YtnkYh17If+reX3QjVytVNlRLtbaxfKcrUcVABOLWbfAp4
	tZVKNAbs1SBLP6TjtXBTEQVj/kG9B/A0a26iEawQRuNeymlOJmzsreXr
X-Google-Smtp-Source: AGHT+IHdLZzgnxP5h0abh3m/L4WAmBk1ccvvnKktbTa4WSRN5LJxHjEx/OsPWCml+VS+d3iYSSIb6Q==
X-Received: by 2002:a05:600c:8218:b0:43c:f616:f08 with SMTP id 5b1f17b1804b1-441bbec1835mr128722905e9.8.1746523970073;
        Tue, 06 May 2025 02:32:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b89ee171sm161598935e9.17.2025.05.06.02.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:32:49 -0700 (PDT)
Date: Tue, 6 May 2025 12:32:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mtd: rawnand: loongson1: Fix error code in
 ls1x_nand_dma_transfer()
Message-ID: <aBnXPYLSNJASR51f@stanley.mountain>
References: <aBSEwag_ducqOwy7@stanley.mountain>
 <CAJhJPsUZz2kwMyWPDrc_ktb5O6ECcAyO1OrXXVWh9yvkrKRidg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJhJPsUZz2kwMyWPDrc_ktb5O6ECcAyO1OrXXVWh9yvkrKRidg@mail.gmail.com>

On Tue, May 06, 2025 at 05:16:03PM +0800, Keguang Zhang wrote:
> On Fri, May 2, 2025 at 4:39 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The "desc" variable is NULL and PTR_ERR(NULL) is zero/success.  Return
> > a negative error code instead.
> >
> > Fixes: d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller Driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > It's hard to know what the patch prefix should be here.  Ideally when we
> > add a new driver we would use the patch prefix for the driver.
> >
> > Tired: subsystem: Add driver XXX
> > Wired: subsystem: XXX: Add driver for XXX
> >
> >  drivers/mtd/nand/raw/loongson1-nand-controller.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > index 6a369b1c7d86..8754bb4f8b56 100644
> > --- a/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > +++ b/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > @@ -371,7 +371,7 @@ static int ls1x_nand_dma_transfer(struct ls1x_nand_host *host, struct ls1x_nand_
> >         desc = dmaengine_prep_slave_single(chan, dma_addr, op->len, xfer_dir, DMA_PREP_INTERRUPT);
> >         if (!desc) {
> >                 dev_err(dev, "failed to prepare DMA descriptor\n");
> > -               ret = PTR_ERR(desc);
> > +               ret = -ENOMEM;
> 
> Thank you for fixing this issue.
> However, I believe -EIO is more appropriate than -ENOMEM, since
> dmaengine_prep_slave_single() can return errors other than -ENOMEM.
> 

It's not an I/O error so -EIO isn't correct.

There are a bunch of reasons it could fail but most likely
dma_pool_alloc() failed.  I think -ENOMEM is correct.

regards,
dan carpenter

