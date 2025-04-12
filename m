Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1088134BD
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 16:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744476210; cv=none; b=T8FJZEGmH4YzDpAbb2iFNImKlk89cEoQFseSu7ayVgvN186Tp5YijE/4G41veUwpzaSfoXOai3ir/BzL8BnLQtvEpo8sLBFZO6tXanmgkiG36bODQGmj3pMACrYHT2x0mjqBBIc6wESu/Biup2iUZix4LMUawyd0uY10MwBN3fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744476210; c=relaxed/simple;
	bh=QyGAX3gvnNPkHq56Ks2u/KuVyL37Hy9JBP+koRLpqqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+c+mzOUKrghrV8o4aXedJNzOhEHf1z3rCbN6ALs6A73pZj35gWwjd29nPWa5Mc553V5S9NT+1NuDJIiWhNP/hfgjn+rCFPngw7tQAOBXBa7wT7w0EfZN8r1EabrwzrqS7V0PF80uIqXQgb5RUvSaM65u0HKzwjGwMvUi8Ud5f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k3gH4QIn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k3gH4QIn"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0618746bso22738395e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 09:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744476207; x=1745081007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tgJ7FmlMySY/gakk4Le0yZ8LtG7TbtIjOQVOYVhLjjQ=;
        b=k3gH4QInP1HlFuzVkqJzqutWowx+ZtBlr2tNI6M+dzNC2ShjGDw3u0ycvQ+VChMQML
         QsfrC0GihqABN79/2UGefnqlFq60pFFxAPE6ZCK0IBc1cOOYyJpFEpyuWQgNX5GjCyt3
         DWEsBD5jpYE6zPNriGc83VwXQg65zdTkzpBYpAX3QM5up47ynfGmL/GYQy4A/miwKJvB
         kqK4FzeV7JRp690dfD0t2EYXLRKtTLQ06A/Gan6vqC48d6CTzfIqUbkdTC5MKId8t5X7
         cO5jrcq2gZhaJk5neKzuNGzMkph3BCCzSmxBVgGMPCuMDpGl83hLKcOCNW6vNEN37tMI
         hWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744476207; x=1745081007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgJ7FmlMySY/gakk4Le0yZ8LtG7TbtIjOQVOYVhLjjQ=;
        b=R0kOtMRCbwfP1+RWSreC6Dg6m4SO41uXqDpPaQzq0JVmOhrIfg6c2NpZ3HuJ1icqVZ
         3k4awp6HKsrxRVK1O2Iy9qdOAk7KZauDWFZDW6JqPbNrFXofJDY3rvwafreab9SF9d3y
         cDxLFGXY+HxkiAE/VI7GH6CnPiAkkyitB80kDv8jBPoJG6UOMK5Up141XNVC4cF1eE/M
         KEeliNKhJSCMCNFaRm26pr883MFAGq2AbYZLRPcl3x2bdqDFEyVlK98T+xpDJ4jUfMnS
         VcI61/GaXukUNXKdf4adyX5xJQ+Fe189yM+PM8PrnTfT1ugENQ0DdJPeYwKjTq7cIAVN
         74kw==
X-Forwarded-Encrypted: i=1; AJvYcCXGhz0dh0LyoCQiWKFTi/57ZVKcCTEyx++Bl4vUDmWL5L9TC6UOSVxI0C6uktNgKa46I23+KyMUKdWk9iE=@vger.kernel.org
X-Gm-Message-State: AOJu0YybAZyMGIXc7t8NC9pZk5CpnxUSN2/dbkQ/CQLLMsH5WjG/g3Gu
	3Y45MjosfT0eoGO+Q6tL1JY6S+196D3B/nTXsJ16BQimEu3k3a2b92FKTwj73JI=
X-Gm-Gg: ASbGncsH69HNZqzNyStKUSRzCUVx55258R/f9ktsVeEhGDqOFC1xeKngz+yn4kULaNQ
	KIb/wfW7X/GPunGXZA3znKj2UbD3fKQU0zurjBkF+OKsSOCgsFNb5q7pbqfAbzF4aUtS0ho9Nr1
	1p2mSiU9cziJY3C6UmIjvUWrZ3TXLOJw+R44OLeYOkApqr7ak9hm2IAsJnUD7rIihx8YnhQcz2m
	/qtzEujS0Z4M2DH0GaVx/lgtBBsApxBvD1CPMKrY3cwwOXqjpmQls2KHxb7zGNeXoG25bdKnRWH
	Obe0ziDSWIOUP91zkNdbl6HywM4uhPm3vwaavUqv0U4NyElXS2/LPy4X
X-Google-Smtp-Source: AGHT+IGdnRf+gEkkeW8b9r86hiA8RBuVbjG/9HFncHylTiqjI9Go6YaMUkdgogkwYq1c+nx6je/y+A==
X-Received: by 2002:a05:6000:40cb:b0:397:3900:ef80 with SMTP id ffacd0b85a97d-39ea520081cmr5520055f8f.22.1744476207180;
        Sat, 12 Apr 2025 09:43:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae977a7fsm5467993f8f.45.2025.04.12.09.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 09:43:26 -0700 (PDT)
Date: Sat, 12 Apr 2025 19:43:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] gpio: aggregator: Fix Smatch warnings
Message-ID: <7bed7798-1671-4926-8d97-2e9ce34a683d@stanley.mountain>
References: <cover.1744452787.git.dan.carpenter@linaro.org>
 <52ap2hc6ii7hlk2zixxf455nens3rxtwvrrwhlv4ii5avpgmcq@lbrdov3ygay3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52ap2hc6ii7hlk2zixxf455nens3rxtwvrrwhlv4ii5avpgmcq@lbrdov3ygay3>

On Sat, Apr 12, 2025 at 11:45:08PM +0900, Koichiro Den wrote:
> On Sat, Apr 12, 2025 at 01:14:53PM GMT, Dan Carpenter wrote:
> > Fix some static checker warnings from Smatch:
> > https://github.com/error27/smatch
> > 
> > Dan Carpenter (5):
> >   gpio: aggregator: fix "_sysfs" prefix check in
> >     gpio_aggregator_make_group()
> >   gpio: aggregator: Fix gpio_aggregator_line_alloc() checking
> >   gpio: aggregator: Return an error if there are no GPIOs in
> >     gpio_aggregator_parse()
> >   gpio: aggregator: Fix error code in gpio_aggregator_activate()
> >   gpio: aggregator: Fix leak in gpio_aggregator_parse()
> > 
> >  drivers/gpio/gpio-aggregator.c | 21 ++++++++++++---------
> >  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> Thank you very much for spotting these issues. I doubt myself for having
> overlooked these.

Heh.  Don't beat yourself up.  Humans can never compete with a computer
at being nit-picky.

regards,
dan carpenter

