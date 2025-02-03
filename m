Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA9D7082B
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 06:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.74.137.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738565851; cv=none; b=mZGuVlZwG4CjVAH/lB9YdqWPhx1O9TIcT7VrnSnQtfsGHUzBUAcoifx0xK8mEFpOoVVpVJSsQHCLcqnh+jWtCiCWuwFoNMs38RaVe6wC0lyVW1o4sXW7oLYIKe8xnsJo7riQNe7bWfF+cCbaPujtPznJuop1ESwIUNZI511jxZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738565851; c=relaxed/simple;
	bh=Dnm7Dq1UIHp6/LaIVBzQmOcnhfi7C5T3vPn99EjoNL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NS4P5Pk/qZyB+L4mr/EGh4eLlRLHQafaY/VT5xr0YO08rKtz3tfncQBg95OMQ+/zwh+ssTvJ3+EmFzmMETsgXKqfYIRcpVmJcp85muer8eQGlhW9uvY55mB27pjw25r1TlUGySkA+wCtQus8CrRUWoLtzLZzVHYxKY9XEV2H4q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com; spf=pass smtp.mailfrom=atmark-techno.com; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=Hp/h6E8B; arc=none smtp.client-ip=35.74.137.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="Hp/h6E8B"
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=Hp/h6E8B;
	dkim-atps=neutral
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 9718B4A6
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:57:28 +0900 (JST)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so7825518a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 22:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1738565847; x=1739170647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KBpu38zoJhnbBuVt7xq5HkK4w7WkM2eVS3E6Ag+EQIY=;
        b=Hp/h6E8BDAuOYYLVlCjmOW5RP+cC5hxkU5uKpRzS2l8yMfMpaKZvtzKBs1wl8rr8CI
         RJ/dCS4tN1fBNaKT2oDm5Y5Xz2H6hEl+jwNAzWUMEcAg6u3ib5By9rK3ZOUFC5S9aEn+
         TBDbNs9eltlcWYC0DMgaHbO8TNdkq658hJMZLiAZmEUbZFLMuoNrox31nLmbfKN4OR6o
         Aqz1hnjvv2ZB3qj6UH1D4zBb1OgJqAcLMWBteAoVc/AYrJoflDAO6JOdGMrKwZUFi+PN
         LIeiTNoZM45K9z8fzDTwn/mX5V3xYezjnDTvkWEWiAlfJF/Xvgd2JLCkV27hPFBTlTC8
         qozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738565847; x=1739170647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBpu38zoJhnbBuVt7xq5HkK4w7WkM2eVS3E6Ag+EQIY=;
        b=P4izcnwKya0zvf8IfRH1zfsNmNoGQv0dZ4S95kmRR5GQoGcy1xQCbV9WJCEUQhIuk2
         FgxkcEDGrk5yH3EFX4AVnN6cxAEcYwQ0jNeAIWqQildQAjm/Ys6j1EoZR0SvNUUbBH0M
         XVhiB8bZg5DyB/635RNAin5pErcQwib91oYcrqjlkOmDjs11XN9tx5/rzZmG3vxlCUmc
         0m7lB9eaFrkjhXCOrmVbohhx2raOKXFEojr3oPSCgD0MYpRq3lAseU/p0UmE5wym6Lyd
         UMvwsUC2PI7W7sYD/CnHAhn5L7rFrIa4G05/dVTkKRGD1xKyKHphhpox8HQqT2JV4tgV
         vK3A==
X-Forwarded-Encrypted: i=1; AJvYcCUfRoO4tYsEJ0ZyMpR1zc3NlXHZdla5IiC34C2xPQJmIak4vhjgDuBhdlw7gAFpXQxfkRQUU10KRPTZ7LQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YziwU4TjH2w+54v7WbCFQijUrobkR7TOKnMh7YoUbFfdPRiEUQF
	WFEePKmyyjVIZaR65SmezyFTLf8+5qN7eC1fhZ5ZiSqj4NL/bEzdmMn4XmPdBsGqvJ3udkp042/
	ZEn7xnehhd8175D2C9sGYS0ICcQIcDXmE1WlOdr2xa/ijQIwglKIsNcHKBF1IvoI=
X-Gm-Gg: ASbGncuuqJg/gWNnYh3TCvAClUmDf/errVLxQXGsOP5vWoFGvVlpcj3Cm55ppS9vF72
	hWfje66TDYX7sLPOLWEzhY3gubaTItQd0fh3f/HF3U+Ipyx9eLQUpxCe3bT6HHE6PWS+//kHAnt
	k6ruYKZGerIjkNXA5uHuFEj6wKk/t6cI4mxuM4wnrwPFbMUyHe85FiAZH+gpcuZyNk7DW06Ahf5
	L2Szw/MunP5E54mjuOF6luHWRobIkybCbkvyfqbYsdRRvdkyTSRpQrxHsBWHrMuzJ5Cdace3k3x
	lDEJbammkgOwBJKL58AtZF97fepnBqKSLUea18RyUi+okdb97ITS7w8E3obsXBsA
X-Received: by 2002:a17:90b:2c84:b0:2ee:b2e6:4275 with SMTP id 98e67ed59e1d1-2f83ac65958mr26047456a91.26.1738565847621;
        Sun, 02 Feb 2025 22:57:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeQG0nwmZr51/0vcXCzKKQK+KfHdJ43jCCy1lp4o7bkMpfm/h39HEEtpxsyBUKAvfYNo9pgA==
X-Received: by 2002:a17:90b:2c84:b0:2ee:b2e6:4275 with SMTP id 98e67ed59e1d1-2f83ac65958mr26047432a91.26.1738565847216;
        Sun, 02 Feb 2025 22:57:27 -0800 (PST)
Received: from localhost (162.198.187.35.bc.googleusercontent.com. [35.187.198.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31efbcbsm68878385ad.30.2025.02.02.22.57.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Feb 2025 22:57:26 -0800 (PST)
Date: Mon, 3 Feb 2025 15:57:15 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: phy: mxs: silence EPROBE_DEFER error on boot
Message-ID: <Z6BoyybpbaLet6jf@atmark-techno.com>
References: <20250203-defer_usb2-v2-1-69b3a941371a@atmark-techno.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-defer_usb2-v2-1-69b3a941371a@atmark-techno.com>

Dominique Martinet wrote on Mon, Feb 03, 2025 at 03:32:05PM +0900:
> Use dev_err_probe to silence EPROBE_DEFER error on boot on i.MX8ULP:
> [    0.127301] mxs_phy 29910000.usb-phy: can't get the clock, err=-517
> 
> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
> ---
> Changes in v2:
> - removed redundant error message and now useless braces, thank you for
>   the quick feedback!
> - adjusted message alignment (that was also bugging me...)
> - Link to v1: https://lore.kernel.org/r/20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 7490f1798b461c39c29bb74e1e57e0a4adce2bd7..39b75199d11c6f9ec21174c20d0465cb79c133fb 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -769,11 +769,9 @@ static int mxs_phy_probe(struct platform_device *pdev)
>  		return PTR_ERR(base);
>  
>  	clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(clk)) {
> -		dev_err(&pdev->dev,
> -			"can't get the clock, err=%ld", PTR_ERR(clk));
> -		return PTR_ERR(clk);
> -	}
> +	if (IS_ERR(clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
> +				     "can't get the clock");

Looking at the usb251xb patch also made me notice this is missing a
trailing newline, but I'm surprised because it "worked fine" (I don't
see garbage at the end of the line in my dmesg with the old 517 error)

There's no other missing \n in this file though so I guess I'll just
send a v3 in doubt, but I'm now curious if it really is needed and
couldn't find anything about that.

Anyway, sorry for the spam, and thanks for the quick review earlier!
-- 
Dominique
