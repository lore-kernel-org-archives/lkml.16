Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FC32594
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 00:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748476905; cv=none; b=TeXKxen1fLUAtkm/ztsQL96l+692107RBBKpBsFBe2FEwif7eSQZlLJkyO/4h35L3AiarVhuZx2zsStdVSp2zuhw4JYdSRRltyUXiqX6G4lvfNdCLVPQKidNpxHRB6wlPjQJiOHmit4YBmPmimhCzElGIlkeozxWSAJD1L4Q9j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748476905; c=relaxed/simple;
	bh=T3juE1hOUm6DFe5iT/pHd3UmRK7XfYewH+PUs5EwYN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKlHcPH+I7HP2uCBIeFdvfC9GA45sUeTB88NAmzclAEIV4YT0xhsM05yVzAL4ikaq9A8kge+FtqPJhVMX2lkcQoB/DaV+u1qS4L0/sQmW636arc9cqoCiMEmmrKkaumdPI/0cAWgBGsl0e5MhScwdZClTz9ibOUyuEIAG9Ug30Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=DV50x740; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="DV50x740"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742c27df0daso225871b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1748476903; x=1749081703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHrYl8KlTDJV9fZehVT6wNYFoGVLZmH/YM7SP1Otey4=;
        b=DV50x740ZiLdVCWqwMXcv60Mn8RJ2GTIDm9RssFMLLKlsTVJ7qvZwzKSQvTUMFKcDm
         pX9NFcvIoO6gQTqCB/XXC+I4YTZDJf2DJaP1h2NtUzIB009Rr8fxhRLWX0mbOhsFihZJ
         Ipefk4NVQBOSKfNa6+g3fpZlkts8X2YOoSY5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748476903; x=1749081703;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HHrYl8KlTDJV9fZehVT6wNYFoGVLZmH/YM7SP1Otey4=;
        b=oiSwbXjfuI2i81PCW6VBvw8onPUWz8POyDq4eZokPreqoXgW71LhhVKe/hfefVID3T
         ixs3RUzK3vmST6MALJJKwxVOxkyx9aGy58JPi4S6HNajpCPSHWvkVWKbXUppGs1M4UlI
         T+f3tE0FOszRf60yi6erSY/odb9QnbwBEEkh1iuKYufUbSSvf0LPDg2zrtIVN3kmFGD5
         6kntn4GhDXB1x9l3Jt7s6ba+ly4ludPiNjWjlydezWzmvNt9ls1U44Q8lk69mnIRqFSx
         HT3sD+VY0ZKnNBEvvlifD9n+edcJ+tHiOeFEFhy7wxRUpIvRdGBITxVsnP7sVr8LKD34
         4Xbw==
X-Forwarded-Encrypted: i=1; AJvYcCU3K7FNGnrNV360NW+BI9soIPSuHmZ3PsSJjV41sFGcPS+uKqwRc/QIum4dlg11wEPLKmW5LIrDkCx/ndA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkF3kiksyZkVksN/kx2dRVqqlBW5zomx8VkFf1vABYZG6i+POr
	gIrY2cmYJifh5SWirjpnm9avVWw5eBNPH/LjHoegoUcfjkheydgrwE1dngeS3+8EwWg=
X-Gm-Gg: ASbGncuLzme8rd4PSUabYCa53hsXqm3UqJI/KcCctKJwvAkW6PBiyVoEmuzbwgec2IX
	9EbIjaOznr2E4lx0iFRXYwwNs2xHrbNbfkj+WjwC5gO1OetlzqwuMpfNkHxLI/SINP5Z1zoRykx
	8+/C5QnY54bPOFT9GsXKzNBU3AXUJ82/IucJK5UulXw66Q1PdJtScorJMjPkMOiW6ULmfoJMl6I
	ZOsugwYvIRqRGLNTDdXd2L6H8mB0t23QXdPTOTins7m8xGzJNtrhS7uoG5RTbqVPIZ0v+QNzoBt
	jNO6rcUGqTm2tCLg+ont/fo4WJHNvT6z40Hb2RHUoJ31XjGUsG5vCZs8vYnFiG7AW/vEewnaI1C
	UOHhVb4K+skybKITuxb8i5LU=
X-Google-Smtp-Source: AGHT+IGh6QFynq+YuUMFZqTG/73Ufan/2rkYRYNy6qC4rW91iir86PkvuJN/O02OksGF7UPuPg4WFQ==
X-Received: by 2002:a05:6a00:1407:b0:742:a77b:8c3 with SMTP id d2e1a72fcca58-747b0c72ba6mr275550b3a.4.1748476901844;
        Wed, 28 May 2025 17:01:41 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafaebsm165546b3a.87.2025.05.28.17.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 17:01:41 -0700 (PDT)
Date: Wed, 28 May 2025 17:01:38 -0700
From: Joe Damato <jdamato@fastly.com>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: niklas.soderlund@ragnatech.se, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, richardcochran@gmail.com, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] net: ethernet: rtsn: Fix a null pointer dereference in
 rtsn_probe()
Message-ID: <aDej4pD_ZzB8ZQdP@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	niklas.soderlund@ragnatech.se, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, richardcochran@gmail.com, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
References: <20250524075825.3589001-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524075825.3589001-1-haoxiang_li2024@163.com>

On Sat, May 24, 2025 at 03:58:25PM +0800, Haoxiang Li wrote:
> Add check for the return value of rcar_gen4_ptp_alloc()
> to prevent potential null pointer dereference.

Was the null deref observed in the wild? Asking because I am
wondering if this is clean up instead of a Fixes ?

> Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/net/ethernet/renesas/rtsn.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
> index 6b3f7fca8d15..f5df3374d279 100644
> --- a/drivers/net/ethernet/renesas/rtsn.c
> +++ b/drivers/net/ethernet/renesas/rtsn.c
> @@ -1260,6 +1260,10 @@ static int rtsn_probe(struct platform_device *pdev)
>  	priv->pdev = pdev;
>  	priv->ndev = ndev;
>  	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev);
> +	if (!priv->ptp_priv) {
> +		ret = -ENOMEM;
> +		goto error_free;
> +	}
>  
>  	spin_lock_init(&priv->lock);
>  	platform_set_drvdata(pdev, priv);
> -- 
> 2.25.1
> 
> 
