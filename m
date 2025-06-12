Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783BE42048
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749738359; cv=none; b=fG6bbocNBWyDyY3NldR9abZbIegdaqgdh0D2Y3trVZEJIvPCW2t7f5+awS4JUr+hCsXroFFkF64+gGOYJmoIjS92AOqOmDoXdu9CRk5jiC8N9KS5TOjYiBLmtdH6SAWjjh0gZnYPUTx1S5mFcg0DmMCbiH3tvCza2FT2W6QOn0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749738359; c=relaxed/simple;
	bh=ApF8vBWEk/Mxf+COrA4pHzNgYDC969mE44V8IPsB400=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uR7nJOUdveyQKD6HoLRbzp5+/qBd11oFUBI0HO5uJbM4yhCo3TLLFnpPqm5TXnjF7q/0DABMFZ1+39xPspVHcBirYZVa9HddA0gGbHDS6MkXOVW0P75R57sRHt9SFnPIRYJYwrdTss9qWIToJWy0muiNau1GrXqpJqdCUw3zihM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=FQof/u5+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="FQof/u5+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-453066fad06so7981855e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749738356; x=1750343156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dRuAS/zUdBPIbw/8bXhZ48yEMTP9V1WRvDJONrZWng=;
        b=FQof/u5+XPWjd6NV2IFJb/4KDZU3/J7pgIEP2R1sm03mDbWsQ4WHEWrtxOQVcl4Ibv
         rJnxh/tYt05LCn6V8Bm/IAag8/2NWnzyW1SlWlKnO75yTGINCuhKYdIQSD3Y/pngMnlq
         tENBY5RAfxQxA0ZqJYMWat/DKSerPorUM5Dg0iHsDjt2+3gD29BAR/YzWDxbx1W3ivWs
         OSUrDN540zZmnavTSsZKl8uBqycr4kinUPwXmBcMzMRYyqimR1C5pc2qBQrIDqofNwYT
         KKnNLaV2ADfYozEk2iJmlVQXKfLffXPvz3w43joLsl84iurtthyLPnP2PigSqumFD3E0
         aGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749738356; x=1750343156;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0dRuAS/zUdBPIbw/8bXhZ48yEMTP9V1WRvDJONrZWng=;
        b=mrBcXsy+vSl2qmAQZpYED9aqJYjGnHULiEEREmkWtNMYiqzqcap3XnOpsMSYPfud75
         fVjzF9/leg6e9izRSh1ZBFgy8whNLuzjnxWpZSjvysPdkyDutywp+jxs7aWkZHvP5qYF
         hNgfXvTtedtLzznUuVvEFOYNKfChfgUGTd6Pk5N6h9VcqrU6d2G4kxNFgkduMIa285z8
         sJQcQMfi+WDUf0yVuYX57pzcMvflPZYoJp8MzBU5+YA3HDNS+xWpEGKe1QeJO6ranDGL
         WNoaUMIwUqGGYVSPAZtKg90vMar93kTkdDElcdiI/9W2UFm0zeHjjaNlk1mM3ehmk0jF
         JX6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUw2b5UPOpUacJ4j4qrFHD9/oENTJoYs+t8YU84JUxefW0vhPe/0HxGZejS0eA9kDw8JR1+pQAvMUvbSbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbCwXkXwF7pNM+gTeOiHuh6/M7QnlPKYAeSpjkzTGlv69yf8Y5
	hZW1vPJFC4ZM1lumQ2mzxlqp59wXP+JRNZ5KaaWycRDmTXBIvUH5hUOV0VHu3dnqqvE=
X-Gm-Gg: ASbGncuiWD9J5C2l9ORtqgkbQgNcnAUfBAjNOrW7qIhqxEWWRKkVTdmvQXagyqB+zlO
	IqdtDJJZOs97lhbzzABOSRU7kXtznHmAsTSk4r8Ac9YL8LfGOeHh76bQB2GoPgs/OSPWBmA6d4H
	G+DtsCQG/TM7N1b93MzIsN58fWwgYZv9F7LrWBH1M5K5kaVFxdracAQ97Tw8rHAAdUkyo9YiDTn
	9iIYirATErM/MvaTNCbaTTW39WhztxYf+4GGL0rTH6xZ4iMvI7qfa767utMonxywIb2MaHEcjZL
	pROvMCUr7PNaewg5u55LNLFHqp2/hJHPyNZpou1cXT5/cWJzMkSrD72bYdhK86An5YoupoJA
X-Google-Smtp-Source: AGHT+IFvlefm01oYPM1h9ExnmLfkUHYFh6gyuhvhlTFDJV5yDSLIyUvQ0kWkWHYwVMpiGkMEole17Q==
X-Received: by 2002:a05:6000:1887:b0:3a4:e672:deef with SMTP id ffacd0b85a97d-3a5586dc42dmr6618337f8f.36.1749738355672;
        Thu, 12 Jun 2025 07:25:55 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a56199a930sm2174154f8f.35.2025.06.12.07.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:25:55 -0700 (PDT)
Date: Thu, 12 Jun 2025 17:25:52 +0300
From: Joe Damato <joe@dama.to>
To: Breno Leitao <leitao@debian.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH net-next 2/2] netdevsim: collect statistics at RX side
Message-ID: <aErjcH3NPbdP7Usx@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Breno Leitao <leitao@debian.org>, Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
References: <20250611-netdevsim_stat-v1-0-c11b657d96bf@debian.org>
 <20250611-netdevsim_stat-v1-2-c11b657d96bf@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-netdevsim_stat-v1-2-c11b657d96bf@debian.org>

On Wed, Jun 11, 2025 at 08:06:20AM -0700, Breno Leitao wrote:
> When the RX side of netdevsim was added, the RX statistics were missing,
> making the driver unusable for GenerateTraffic() test framework.
> 
> This patch adds proper statistics tracking on RX side, complementing the
> TX path.
> 
> Signed-off-by: Breno Leitao <Leitao@debian.org>
> ---
>  drivers/net/netdevsim/netdev.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
> index 67871d31252fe..590cb5bb0d20b 100644
> --- a/drivers/net/netdevsim/netdev.c
> +++ b/drivers/net/netdevsim/netdev.c
> @@ -39,12 +39,16 @@ MODULE_IMPORT_NS("NETDEV_INTERNAL");
>  
>  static int nsim_napi_rx(struct nsim_rq *rq, struct sk_buff *skb)
>  {
> +	struct net_device *dev = rq->napi.dev;
> +
>  	if (skb_queue_len(&rq->skb_queue) > NSIM_RING_SIZE) {
>  		dev_kfree_skb_any(skb);
> +		dev_dstats_rx_dropped(dev);
>  		return NET_RX_DROP;
>  	}
>  
>  	skb_queue_tail(&rq->skb_queue, skb);
> +	dev_dstats_rx_add(dev, skb->len);
>  	return NET_RX_SUCCESS;
>  }

Hm, I was wondering: is it maybe better to add the stats code to nsim_poll or
nsim_rcv instead?

It "feels" like other drivers would be bumping RX stats in their NAPI poll
function (which is nsim_poll, the naming of the functions is a bit confusing
here), so it seems like netdevsim maybe should too?
