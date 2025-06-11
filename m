Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998082E6138
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749649921; cv=none; b=Z1XmVMHb+KpxMYEEZz9CBlgtDxqg8icILEJb/QGkSnnEvZC7GBKtcAn4wCKsT1YCG/WY5HLaEskRLd/XP51qzh27lpHTNnnt66SXdkr6xmaNdf8KHD6/0mFfGPvD5KtDliGjppmRJF7qaeHTRH3wFuEWJJn51dfqJkjbFbsqyvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749649921; c=relaxed/simple;
	bh=IQg6sE+GXGtuGT5EQ5comWisqQkhImYrlyIoJDnpRqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIVVRF8pc2UgnMHooJQAtE5UnWe2fATw3xOuSfMMf1ozNPuApwpKdtAJ6aCCl1PDjce4t82hfP07oWPtMklOCVK4f7LxLrI6yjcioscq4+LHFyUFRhG/fg8vg8yaJCeIGZjbKEnH/7urJAWu+10qwJNg6DVBKv7pehdIj1vYo0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=d0/+qU2W; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="d0/+qU2W"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so81652425e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749649918; x=1750254718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vk07ZvZc5eFy3eUxLG9h1u7SCyvu16FN4Lb9FHyD5Yg=;
        b=d0/+qU2WYrNGiH1HgXB1oVaVzBI9EiEZqgE2TwmKdPWzDv875VNcSXWG3pEcqf8tqj
         YOCL4L7UWUXZidzAsc6oN2YOiuH0KTX1/FFrgTdTQCQh0xxOPA2kcq7Dq8U0CGcpQjR1
         UVZ0LAZWB6bJGuXZ/YETZRBtBoAQ9EU8ekPdPHfLQoPEdPTNCDxvWTNpS7dnXyN4+3MP
         brU0oqYbGIzwBImd08/KltmEXtqW0nZQ3SnU13BIUxIGD3scL8bVBdcVaZjwmznKKhSC
         0Ok3/nfv9epU82Q4aSAOOulXWFMuZ0pnD5kL3Zla8e3xOllscCrZ4WnW0VSpOPjXhQ2E
         5SSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749649918; x=1750254718;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vk07ZvZc5eFy3eUxLG9h1u7SCyvu16FN4Lb9FHyD5Yg=;
        b=iQAv4OwWDgg8DX8zn3cmwP9+YVn2NOaaBJibl6II1+8PzhR2aHVHdvtV0J5UQJGTKj
         Kdu/KoqhMzpPBNOgFWSIjHlrPiEkwzTnfuhd/4zkR+UlCKxprqKxXyh0okS8JxFVXi1T
         4hrgDZ4+5nfx8ch5gfSAsgAbz4l3uPrX97dESjc/uhd5LbJ1VPoDZTEgkN50TRN0xfq4
         oah9SAHUw5R09+WX6Td9DAL26KblY0ueLiBytTm+Ac9YjvWRZvdYXyNIqU79c8Cvy9lZ
         cQVJFQDjR8TPN5tT/OJ00pS/eWF1DXiTbVwiK95SoRBED9H54fAa9845bx5hVzqCifsK
         RDag==
X-Forwarded-Encrypted: i=1; AJvYcCXznQ5nxxdXZizpnRS2uczBtKQgjLCik6JJDj6AFkfjh0yKSZYsylDxuUtB58TfoW9iws8oGUao/0zV7BA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWkGzKp0cUe0rjzjIeN6uwfmq0gxp8OqQY6erJcQKMhkLc1+4F
	VbWaSuAocWxR4UehVPbjDrTyP9pNVIWTeNwHK3p9hE2e8b6wj/TgtPpVZ4XJZczYgoc=
X-Gm-Gg: ASbGncsK9AT1QUzJEy+AhnlsUqmGHBRyfBXqoeQhdnExoHDAFOvn9G5lzhOQz/bhsLI
	jpOk4+8PSSTyIl/r1uJG4vgsVii8NDAP2Cqu+5oGxzsHMFrIX04z6thR3vCLZ8KA3B8OJvodHrb
	svQ4Jvm8mXGDSpZG5l6JsGYCtTniWxJDH31tbc4XnMbLlfWvNdu+Trzg3pLpUO1b2dOmyW684YM
	jS38NkJLbJiN0GhL+xTfr9aWceUrPnqH95WUD8Orp20nVdsm/OdNLEfkwC5TMdpUCV3i7Av6RXE
	D8jBZbQvvBL+sQ9ueByRRrfhNHCbvYO7HuE3SAaIqX0g9psC7lqUWT5+FN6IymhWyA0=
X-Google-Smtp-Source: AGHT+IG9nZtd3+hc45FxaZnApDjwjY+12DSVJ111XehV5YK/VpAjb4ZvVhEVhVJntSmvf+qT+b6/nQ==
X-Received: by 2002:a05:600c:83c6:b0:442:ccf0:41e6 with SMTP id 5b1f17b1804b1-45324879755mr36028615e9.3.1749649917743;
        Wed, 11 Jun 2025 06:51:57 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45325191994sm21839805e9.29.2025.06.11.06.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:51:57 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:51:53 +0300
From: Joe Damato <joe@dama.to>
To: Justin Lai <justinlai0215@realtek.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	horms@kernel.org, jdamato@fastly.com, pkshih@realtek.com,
	larry.chiu@realtek.com
Subject: Re: [PATCH net-next 1/2] rtase: Link IRQs to NAPI instances
Message-ID: <aEmJ-b8ogdb3U5M4@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Justin Lai <justinlai0215@realtek.com>, kuba@kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, horms@kernel.org, jdamato@fastly.com,
	pkshih@realtek.com, larry.chiu@realtek.com
References: <20250610103334.10446-1-justinlai0215@realtek.com>
 <20250610103334.10446-2-justinlai0215@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610103334.10446-2-justinlai0215@realtek.com>

On Tue, Jun 10, 2025 at 06:33:33PM +0800, Justin Lai wrote:
> Link IRQs to NAPI instances with netif_napi_set_irq. This
> information can be queried with the netdev-genl API.
> 
> Signed-off-by: Justin Lai <justinlai0215@realtek.com>
> ---
>  .../net/ethernet/realtek/rtase/rtase_main.c   | 20 +++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/realtek/rtase/rtase_main.c b/drivers/net/ethernet/realtek/rtase/rtase_main.c
> index 4d37217e9a14..a88af868da8c 100644
> --- a/drivers/net/ethernet/realtek/rtase/rtase_main.c
> +++ b/drivers/net/ethernet/realtek/rtase/rtase_main.c
> @@ -1871,6 +1871,18 @@ static void rtase_init_netdev_ops(struct net_device *dev)
>  	dev->ethtool_ops = &rtase_ethtool_ops;
>  }
>  
> +static void rtase_init_napi(struct rtase_private *tp)
> +{
> +	u16 i;
> +
> +	for (i = 0; i < tp->int_nums; i++) {
> +		netif_napi_add(tp->dev, &tp->int_vector[i].napi,
> +			       tp->int_vector[i].poll);

Maybe netif_napi_add_config can be used either in this patch or in an added
3rd patch to this series to support persitent NAPI config?

Otherwise:

Reviewed-by: Joe Damato <joe@dama.to>

> +		netif_napi_set_irq(&tp->int_vector[i].napi,
> +				   tp->int_vector[i].irq);
> +	}
> +}
> +
>  static void rtase_reset_interrupt(struct pci_dev *pdev,
>  				  const struct rtase_private *tp)
>  {
> @@ -1956,9 +1968,6 @@ static void rtase_init_int_vector(struct rtase_private *tp)
>  	memset(tp->int_vector[0].name, 0x0, sizeof(tp->int_vector[0].name));
>  	INIT_LIST_HEAD(&tp->int_vector[0].ring_list);
>  
> -	netif_napi_add(tp->dev, &tp->int_vector[0].napi,
> -		       tp->int_vector[0].poll);
> -
>  	/* interrupt vector 1 ~ 3 */
>  	for (i = 1; i < tp->int_nums; i++) {
>  		tp->int_vector[i].tp = tp;
> @@ -1972,9 +1981,6 @@ static void rtase_init_int_vector(struct rtase_private *tp)
>  		memset(tp->int_vector[i].name, 0x0,
>  		       sizeof(tp->int_vector[0].name));
>  		INIT_LIST_HEAD(&tp->int_vector[i].ring_list);
> -
> -		netif_napi_add(tp->dev, &tp->int_vector[i].napi,
> -			       tp->int_vector[i].poll);
>  	}
>  }
>  
> @@ -2206,6 +2212,8 @@ static int rtase_init_one(struct pci_dev *pdev,
>  		goto err_out_del_napi;
>  	}
>  
> +	rtase_init_napi(tp);
> +
>  	rtase_init_netdev_ops(dev);
>  
>  	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
> -- 
> 2.34.1
> 
> 
