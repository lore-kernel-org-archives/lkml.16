Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24D9284694
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544901; cv=none; b=QrQrW9wTKEt4oSJ0q9rvR6WZOEBpsyw979NksB/aQUqrvPItLG9OMV5h5fGPVtMNGpV+5clrIPnlJMKsS4DbAXspxgxyUNG3a4FC1eokirmQtxQa2TEoe8SkmD1MxCoDL6k5iBBBvPtBAqvjDuFkSameW3QbfjA3fuJ6cFcThj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544901; c=relaxed/simple;
	bh=RrFCrLCDb2vVGDp7qDTtvDgB7VhO8TX1bChwTPYRekQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VxvfSsjnFW+k8VLABEaBLkVxObs06/pMYsGG3AxTpkjFEZ+Dp3mBaoG+T4PW0SJDoBzQYnDFZtnGs9NAwXKTa6X+3SVpuY6L31jzN061mt98FlqDTvftvZitNG2mDsse3MyMlZYi9pkc4P5c0YoHmh63I1mAp/4v2Tyxdc3w71Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UJ8pQsTh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UJ8pQsTh"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22c33ac23edso63888455ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746544897; x=1747149697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LUMMAqzLfeU2BhLtLW4k1zZhIkqrr7YldwnF+3gqRqE=;
        b=UJ8pQsThEqTqAkNZ7+wvythibhM6QLHad1B5K0qbZotRMUU9Er+gvGohjeMEZN6iq2
         y/+Pno2UB+mNvg70PK5nSJuN4Dayhcn5eQCoeO7iLIr2PLudktmaY1EF9VTKBJqjmv2H
         Egh65+L0t2Lomwbu2fJ3S8qqvoB338zUaCGsx/O9eS1kAsC2IYbcn30TQST+A8/jgKrU
         xkE5WVEYRmGUKDp0VVdciWsANguEYGzqrVnstf3+DXAnt0+tfo9g1lodhWgR4TcstmvV
         KFGObojl0fiMczJHycmx3HFOzJEQfcZ0QtQHWStSIcO75UFLu/+rUxV86gL1G6YkIFpM
         v/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544897; x=1747149697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUMMAqzLfeU2BhLtLW4k1zZhIkqrr7YldwnF+3gqRqE=;
        b=Ld8X0Y/WS1VvJ8XQbT+NS8q2u5oCMYC2J/B4/+bfKP2BtsOII9Sydbq3337Ap50aPt
         M10Pk8xktGoe4NwUWqtuzMqRdCfwXDNa7YH4n77skhXpCg2d5FJHowH0YVlrCJHIseEI
         mwHx84ON/apqLXUqZ8of3PL6Nd6KAfxVFRxVJ1aidK6uOhq/BKExFj1fr3nE289ZGOLm
         GdAVAMD831ipm6/CH5yVjuE28W06Jol4fAHedGJELv4C1UofK2M9+yutUd6JLEo6jxxQ
         S3RDJLTGejojolyFHKzRIlCJtOiZ8EgvXPxG108yOTnP1P/sHqfc3CQleMZ0YvHC8yOF
         s7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWrsTNBu3Dg9FH3RlGmPkSX+9lEPaJ4W6Je/p8ajhALpBkcjDgt6sbD5xpyS5J5tevGunzK0VuMfvIDje0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4oVBGDuPHS+5djsLWY38Xcp6kxHkWIVVq/RWkGwqCme8ts5SK
	v0NvEFElsVhLbvPeDvgULdZBesEEhC3QmtVQYoCdJLkqzMy7xNbKNV0tB13R6wE=
X-Gm-Gg: ASbGncuKVkzP0H50X+rma1/JIq+IRBIRYk92sq7w1gmfb8h+yBM6umhYaAUHWk/Q9JE
	sAq7DKitHnpHipicu80zLxrt1dW6ET+3Hf9Zyl3U5Iut0uStT/ASBgDoffMmOhffJsGxJvjix9l
	umhD04r2QfWAnO/v7thhsh2C/oA19RWUl03wszbuxPreM3htdIQbJXbyQ7KmIeYny8RBPEA6HWL
	XSR37A8/KRvx0NLDmLOATYkk/YGLpcazyF2gwyABfrHjZuL1ZSrwjZYLwc4Ju7T4f5ZkEhezxrz
	SA+zzdK0P68QQvbtQ1o8mVVz1nBaqv7gGGookfd48g==
X-Google-Smtp-Source: AGHT+IG9qR+Bw2uygv8xQSXKT77iYKR8E4JwPxPN+b6XzkhfQ8z4EFuMOu2q9YdcGCpJtb1y5nY+aw==
X-Received: by 2002:a17:902:d40b:b0:22e:4a2e:8ae7 with SMTP id d9443c01a7336-22e4a2e9073mr19297995ad.22.1746544897093;
        Tue, 06 May 2025 08:21:37 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fc7c:b927:d229:c0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15232224sm75295875ad.253.2025.05.06.08.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:21:36 -0700 (PDT)
Date: Tue, 6 May 2025 09:21:34 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/3] remoteproc: imx_rproc: skip clock enable when M-core
 is managed by the SCU
Message-ID: <aBoo_p1KlmOieJ50@p14s>
References: <20250505154849.64889-1-hiagofranco@gmail.com>
 <20250505154849.64889-2-hiagofranco@gmail.com>
 <20250506043835.GB24259@nxa18884-linux>
 <20250506123619.egobussm6b74imso@hiago-nb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506123619.egobussm6b74imso@hiago-nb>

On Tue, May 06, 2025 at 09:36:19AM -0300, Hiago De Franco wrote:
> Hi Peng,
> 
> On Tue, May 06, 2025 at 12:38:35PM +0800, Peng Fan wrote:
> > On Mon, May 05, 2025 at 12:48:47PM -0300, Hiago De Franco wrote:
> > >From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > >For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> > >before Linux starts (e.g., by the bootloader) and it is being managed by
> > >the SCU, the SCFW will not allow the kernel to enable the clock again.
> > >This currently causes an SCU fault reset when the M-core is up and
> > >running and the kernel boots, resetting the system.
> > >
> > >Therefore, add a check in the clock enable function to not execute it if
> > >the M-core is being managed by the SCU.
> > >
> > >This change affects only the i.MX8X and i.MX8 family SoCs, as this is
> > >under the IMX_RPROC_SCU_API method.
> > 
> > I would rewrite as below: "
> > 
> > For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> > by the bootloader, M-core and Linux are in same SCFW(System Controller
> > Firmware) partition, so linux has permission to control M-core.
> > 
> > But when M-core is started, the SCFW will automatically enable the clock
> > and configure the rate, and any users that wanna to enable the clock
> > will get error 'LOCKED' from SCFW. So current imx_rproc.c probe function
> > gets failure because clk_prepare_enable returns failure. Then
> > the power domain of M-core is powered off when M-core is still running,
> > SCU(System Controller Unit) will get a fault reset, and system restarts.
> > 
> > To address the issue, ignore handling the clk for i.MX8X and i.MX8 M-core,
> > because SCFW automatically enables and configures the clock.
> > "
> > 
> > You may update if you wanna.
> > 
> > >
> > >Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > >Suggested-by: Peng Fan <peng.fan@oss.nxp.com>
> > 
> > -> peng.fan@nxp.com
> 
> Thanks for the review, I will update the suggestions on a v2. Meanwhile,
> I will wait a little bit for other feedbacks.
>

I suggest you go ahead with a v2 - I have a fair amount of patches to review and
my time to do so is currently very limited.

> > 
> > Thanks,
> > Peng
> > 
> > >---
> > > drivers/remoteproc/imx_rproc.c | 4 ++--
> > > 1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > >diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > >index 74299af1d7f1..627e57a88db2 100644
> > >--- a/drivers/remoteproc/imx_rproc.c
> > >+++ b/drivers/remoteproc/imx_rproc.c
> > >@@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> > > 	struct device *dev = priv->dev;
> > > 	int ret;
> > > 
> > >-	/* Remote core is not under control of Linux */
> > >-	if (dcfg->method == IMX_RPROC_NONE)
> > >+	/* Remote core is not under control of Linux or it is managed by SCU API */
> > >+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
> > > 		return 0;
> > > 
> > > 	priv->clk = devm_clk_get(dev, NULL);
> > >-- 
> > >2.39.5
> > >
> 
> Cheers,
> Hiago.
