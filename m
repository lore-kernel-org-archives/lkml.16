Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFC328B509
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638451; cv=none; b=tvX5cSF4M584q1HIytII4Vjc0U5fllHLh0FF2QTcRxbxID143VTi8PdwoZs1wsVdGG5KPgeD6PY8XQdoGXZJ7v8mxmjuHs4expLuTLgltFwGSnnkugo7MjU6gsOEHoaC8tEOKh3GekNrlt+6sp/r5ZR+sQd/Uzthq2JVo2TFOVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638451; c=relaxed/simple;
	bh=EK2I+PIDSegdPp//dTcXMle/m2bG3MDkkTJ0GRpOWaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAhoOHfyi1mT1kXRFsp+KtEuoam8Uus4eLgcslFPMGI0ToTiK3nsvxgByq2EFgb+xPRSC2HSk02TOrZvJKtNqjdQgB/I8Ur9Smg7NpDVGE75DwWUFnj73xzKcrCN4fTycW40oy+4C2Vzot+IcN1JJofkwQmJKk9LvDwomUJN8mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dCN7Koml; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dCN7Koml"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfe574976so921765e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 10:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746638447; x=1747243247; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZIDIc+98VT1uzADSEdsyAT7FWEyMDLAchzu3TvkXi1A=;
        b=dCN7KomlMk1JGtp7bNKag2Q1HMu+y0S+xgl89Ts5SdoDRZNhhIsG2UikAKzcDaIymj
         5jvMg/fRpn+jelkx6/O+6bdStDOdfu9WXJi/Qm0HOFKyziH39pdOurqRAk1I3dc2VTbL
         VsZ6ckyj/jIduAL3tqBZvilEzrvhDbBB4qpQ09yjpk58YONvXhtwPAqgVCBRFOsnxpX+
         vqakyph3cDOplhr54dzysiICn2SQuBsDhOO7SmSa6l41Uy6I4QjYBy327xvHtp1prU3i
         NVaoAASPyeHVIkL9XsellWgqmzJdzx8rTPHtSMaxbrlnlKViY1469qSvyg4iYQR5RT7z
         J+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746638447; x=1747243247;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIDIc+98VT1uzADSEdsyAT7FWEyMDLAchzu3TvkXi1A=;
        b=JSXlJWCKW1pWglK3iel2HZbw96j8//8KWHSR2Kh0w0cvMFdf08d1fjm2UwJ5ilmMwg
         UrW49ATPaOPrOncfA/cP1K/ug+EO/rLLL1ByCgrB5YWpvXSzgRb65wQPl17/ldoTJD4x
         UfQRPwVP9ePTQ9f147A89B0/ZWsk0lkIy3lMqNljAiHgKvNv4vHOsHSTKLBPma3ruIZ8
         U444wA+B5dAqHryXwRmzUHs6aANaB93hyRkS2gK2ZFTEej7PF+quAr2J127Ij/r9Rjha
         1AFpsmyCtVohEV0LuwORk6R9A4UBm6wYwr+Njtv3byFYHjD4PfihnM7YjLhh5b7XPyd4
         iS9w==
X-Forwarded-Encrypted: i=1; AJvYcCXY2AYLE/czWLO9+twe1l/ob1kzvddMFIJLaSxEF6PFNa2jRleepzm+V/49vN9ufnh/ka5/XvQXmJYdUJg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9BUSHu0rlHTHVTJyX6w4dFULtTDMzmgJWGIR+o5ic+z+KKvQY
	C2VzU4vjxZ8FbL2fg5oI/xnCZzBJV+I6oVI0xp0QCXlh5P5QjK8eNIQSrNuMjBuQJzZGY0Txwow
	d
X-Gm-Gg: ASbGncvO80xHF9nyRpTwoWFrr9+6J3QCL63HELFP2XOGYbix4lUiLbl/M5KLIFGCSKB
	o0AZ3xJ3paoKppCnJry7xwgrpLHO9NAY876SRBJZiSRhAWepGaPK0zrJkoOzujFnjGZ/svpO1qA
	085zh/xCWSby45cO2gXYWeJBdXsTSC2lBV0nvYF0SlSB9CEkKN1+6piZm6Xe47TbdGCAsueKHvj
	uh9filrggVIIDEtqNOpTBQPg6yzkVb+AEEA3qqj4tHRk0uWM+iphE+hNQOC67WV7O9fEi6tfEgO
	gUWqBFqd6OiZf2tI4Ff/a4bEzE88oxgEHtesmNzP3NU1Zg==
X-Google-Smtp-Source: AGHT+IEgJ+zhZsE37EffQPRp8AYlsaRDot3L3dV0W/8v18j/U3bL8+1nDlYSIXsP5Wo9mJZnrHE3Fw==
X-Received: by 2002:a05:600c:a413:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-441d44dd4a6mr34168545e9.24.1746638447619;
        Wed, 07 May 2025 10:20:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd350d96sm7383635e9.18.2025.05.07.10.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 10:20:47 -0700 (PDT)
Date: Wed, 7 May 2025 20:20:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] regulator: tps65219: Fix erorr codes in probe()
Message-ID: <aBuWbImT1jgm2QTt@stanley.mountain>
References: <aBtZHEkgYGK33fWk@stanley.mountain>
 <43f5dfb3-ea3a-4f1d-b3bd-9e62f976b651@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43f5dfb3-ea3a-4f1d-b3bd-9e62f976b651@wanadoo.fr>

On Wed, May 07, 2025 at 07:17:25PM +0200, Christophe JAILLET wrote:
> Le 07/05/2025 à 14:59, Dan Carpenter a écrit :
> > There is a copy and paste error and we accidentally use "PTR_ERR(rdev)"
> > instead of "error".  The "rdev" pointer is valid at this point so the
> > existing code returns a positive value instead of instead of a negative
> > error code.
> > 
> > Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Regulator IRQs")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/regulator/tps65219-regulator.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Hi,
> 
> > 
> > diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
> > index b16b300d7f45..f5cd8e33e518 100644
> > --- a/drivers/regulator/tps65219-regulator.c
> > +++ b/drivers/regulator/tps65219-regulator.c
> > @@ -454,7 +454,7 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
> >   						  irq_type->irq_name,
> >   						  &irq_data[i]);
> >   		if (error)
> > -			return dev_err_probe(tps->dev, PTR_ERR(rdev),
> > +			return dev_err_probe(tps->dev, error,
> >   					     "Failed to request %s IRQ %d: %d\n",
> >   					     irq_type->irq_name, irq, error);
> 
> and error can also be removed in the message as well, with the corresponding
> %d.
> 

Good point.  Also I spelled "error" wrong in the subject.

regards,
dan carpenter

