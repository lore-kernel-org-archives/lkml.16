Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2052127CCF3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650673; cv=none; b=Jwxv2jJVvgBcpSc3AASOtTx01PP/oW4D90Oep2bkjI7KxNgU/KBj9RmQnt4rXvPY3eBsVNHYAuSCmacTV7u6nNNjKZuytjBFwSxoLlWL9FlZJHiapOB0k3OHDi38Ic9CyqheHKGE5JJWHw6X51FuZjm/cZYTqi2vtr8hVmuhu4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650673; c=relaxed/simple;
	bh=OA4jromlYLJuPZv6VQCmlOeksjHLrGmSNt4BfNaDGSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSwVzAvYq69WuTc/szPBA+nkdD0XonW9Q3RbVjpE7tW1XYm68q0K/M01QOsMHORUBxe0dkb26KfmFc/nw4D97yJvw0grXkRx5k7rkSmV4VP0Z6LTu7ImWY8f3N/MoUypHHQe6US31yf9+bdy+QsWqzlUpieAm9M0AxWBap+bUj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=dtvXBWHb; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="dtvXBWHb"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so695937f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749650669; x=1750255469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BTCfjBqUhGvCK3tOSUMojcW0+XnuttkbptOJMNNvbE=;
        b=dtvXBWHbCNurWx3a5BB46jjwBxfQfAv3pusMZQ7qVYtwOERBfKa8it0pacVrXzTlj0
         6C4n0XIPxCOo2A7BiZTG/MQ3y1K4n/3OXcgN9bu6NSfccrR8KHcdtXPw9QY6rVJDPmYe
         sM0+csMhNkVVYYLACCFaNQXoCRGLCSBChTLjQ9ECohItz0DBCwWLznvlx4ESCdPxt9rK
         KBxZzb9ihyKJF+OtN/PqKLvFIWmOT/ope6sAOC+ZlR0emTQ7xayGw/SObNxpAX0MXDUo
         l6KNqCN4HwNdb5gd4D5f5icJ/wbx2mwacZ1NJdXMgipdFijg7/MBF806J3XnVVepDk+Q
         KLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650669; x=1750255469;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3BTCfjBqUhGvCK3tOSUMojcW0+XnuttkbptOJMNNvbE=;
        b=k9rw6oJAqdbVCv9WAFvzL6cn+7Zxu3BSllaKgUqv8J5BeHYt27vVP/WbWKKHftH7gq
         9h2y05JJjREO9j9z4toKMvb0VYSGysF1ev5oBYTsmcNOpYOD44Wbue8o2liwlOa0Wipg
         axt18OKQ0+GcXaVB4wK1RghsqVrwslGPnKNWU9mICOfgbI8LMi0n1BH5BE5wQgX6LRI8
         mpH+wvJI+S2dSN+qZ6xzn5WDOZ+V5ohb1Z4x7GYI1l0CHmkR03+2syzc+UkMcLSfUZY4
         dcS1SqTwYBtLve4OdymBMu4sMnU8i43wVbEJcf9g0wgJ6iwGL5ds6mRPf4ZD9EUWQiVL
         ut8g==
X-Forwarded-Encrypted: i=1; AJvYcCUSd5h0dJcuixsMP79f4wZiWPHfxu61WLsRupy4hJpyD8HRCr1j/ruMRU16B+3RWQuLtq0OM/MByPSK3rM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9zAbyjb3FdPz1LJRm7Ccis8AhdORpf2drpOEEzGk5JpjGn4lZ
	gYfjKtDrNCMHHrNuLrporNgFFYTmQXBkhUfkRM9CifqFmEwui7UuTOztaknp+eilbJY=
X-Gm-Gg: ASbGnctDW0SWoFQdUbTPdoL2LxqpcO1yYMuTtJehmlLXXPKNvZZGI+wXR2wy2fOIQJu
	9E0IEI2C9WrYjoJhoaMkUIBrMFfB/xSenGRp6oGZtT2olnfFArVK6lNx8OUdgvWfJiu4agwki8I
	BeV6b94G2StIW8P+q9owPBn7BIEhF1H4XJV2RdgoDJEVAJwkgccxE4G/f/eXspXRtovLvfCrcQ1
	UMFd6eZDzLWwUvoZjgYh5W9OuJGw6ZbVUWZMEdZ2ctF2bMJSZL8IO1g4nBWhzlpUxzXT/hlS6Iz
	cJMj8gkCb8huKv00S27UFQYSI5LRfLJ6xdUISm1z6fykkTOqaZPKmzuCyGS9hMdj8HM=
X-Google-Smtp-Source: AGHT+IH5puOsDgFOqrg99fmpHre+dtPvWLLPewRWtQi6rISkKFiCSBYIpgbKI2zSD0B/SFG+BNhk8A==
X-Received: by 2002:a05:6000:1788:b0:3a4:da0e:5170 with SMTP id ffacd0b85a97d-3a55826bf41mr3006505f8f.27.1749650667629;
        Wed, 11 Jun 2025 07:04:27 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45325228c2esm22451735e9.37.2025.06.11.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 07:04:27 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:04:24 +0300
From: Joe Damato <joe@dama.to>
To: Justin Lai <justinlai0215@realtek.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	horms@kernel.org, jdamato@fastly.com, pkshih@realtek.com,
	larry.chiu@realtek.com
Subject: Re: [PATCH net-next 2/2] rtase: Link queues to NAPI instances
Message-ID: <aEmM6D9DKxxiarSP@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Justin Lai <justinlai0215@realtek.com>, kuba@kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, horms@kernel.org, jdamato@fastly.com,
	pkshih@realtek.com, larry.chiu@realtek.com
References: <20250610103334.10446-1-justinlai0215@realtek.com>
 <20250610103334.10446-3-justinlai0215@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610103334.10446-3-justinlai0215@realtek.com>

On Tue, Jun 10, 2025 at 06:33:34PM +0800, Justin Lai wrote:
> Link queues to NAPI instances with netif_queue_set_napi. This
> information can be queried with the netdev-genl API.
> 
> Signed-off-by: Justin Lai <justinlai0215@realtek.com>
> ---
>  drivers/net/ethernet/realtek/rtase/rtase.h    |  4 +++
>  .../net/ethernet/realtek/rtase/rtase_main.c   | 33 +++++++++++++++++--
>  2 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/realtek/rtase/rtase.h b/drivers/net/ethernet/realtek/rtase/rtase.h
> index 498cfe4d0cac..be98f4de46c4 100644
> --- a/drivers/net/ethernet/realtek/rtase/rtase.h
> +++ b/drivers/net/ethernet/realtek/rtase/rtase.h
> @@ -39,6 +39,9 @@
>  #define RTASE_FUNC_RXQ_NUM  1
>  #define RTASE_INTERRUPT_NUM 1
>  
> +#define RTASE_TX_RING 0
> +#define RTASE_RX_RING 1
> +
>  #define RTASE_MITI_TIME_COUNT_MASK    GENMASK(3, 0)
>  #define RTASE_MITI_TIME_UNIT_MASK     GENMASK(7, 4)
>  #define RTASE_MITI_DEFAULT_TIME       128
> @@ -288,6 +291,7 @@ struct rtase_ring {
>  	u32 cur_idx;
>  	u32 dirty_idx;
>  	u16 index;
> +	u8 ring_type;

Two questions:

1. why not use enum netdev_queue_type instead of making driver specific
values that are the opposite of the existing enum values ?

If you used the existing enum, you could omit the if below (see below), as
well?

2. is "ring" in the name redundant? maybe just "type"? asking because below
the code becomes "ring->ring_type" and maybe "ring->type" is better?

>  	struct sk_buff *skbuff[RTASE_NUM_DESC];
>  	void *data_buf[RTASE_NUM_DESC];
> diff --git a/drivers/net/ethernet/realtek/rtase/rtase_main.c b/drivers/net/ethernet/realtek/rtase/rtase_main.c
> index a88af868da8c..ef3ada91d555 100644
> --- a/drivers/net/ethernet/realtek/rtase/rtase_main.c
> +++ b/drivers/net/ethernet/realtek/rtase/rtase_main.c
> @@ -326,6 +326,7 @@ static void rtase_tx_desc_init(struct rtase_private *tp, u16 idx)
>  	ring->cur_idx = 0;
>  	ring->dirty_idx = 0;
>  	ring->index = idx;
> +	ring->ring_type = RTASE_TX_RING;
>  	ring->alloc_fail = 0;
>  
>  	for (i = 0; i < RTASE_NUM_DESC; i++) {
> @@ -345,6 +346,10 @@ static void rtase_tx_desc_init(struct rtase_private *tp, u16 idx)
>  		ring->ivec = &tp->int_vector[0];
>  		list_add_tail(&ring->ring_entry, &tp->int_vector[0].ring_list);
>  	}
> +
> +	netif_queue_set_napi(tp->dev, ring->index,
> +			     NETDEV_QUEUE_TYPE_TX,
> +			     &ring->ivec->napi);
>  }
>  
>  static void rtase_map_to_asic(union rtase_rx_desc *desc, dma_addr_t mapping,
> @@ -590,6 +595,7 @@ static void rtase_rx_desc_init(struct rtase_private *tp, u16 idx)
>  	ring->cur_idx = 0;
>  	ring->dirty_idx = 0;
>  	ring->index = idx;
> +	ring->ring_type = RTASE_RX_RING;
>  	ring->alloc_fail = 0;
>  
>  	for (i = 0; i < RTASE_NUM_DESC; i++)
> @@ -597,6 +603,9 @@ static void rtase_rx_desc_init(struct rtase_private *tp, u16 idx)
>  
>  	ring->ring_handler = rx_handler;
>  	ring->ivec = &tp->int_vector[idx];
> +	netif_queue_set_napi(tp->dev, ring->index,
> +			     NETDEV_QUEUE_TYPE_RX,
> +			     &ring->ivec->napi);
>  	list_add_tail(&ring->ring_entry, &tp->int_vector[idx].ring_list);
>  }
>  
> @@ -1161,8 +1170,18 @@ static void rtase_down(struct net_device *dev)
>  		ivec = &tp->int_vector[i];
>  		napi_disable(&ivec->napi);
>  		list_for_each_entry_safe(ring, tmp, &ivec->ring_list,
> -					 ring_entry)
> +					 ring_entry) {
> +			if (ring->ring_type == RTASE_TX_RING)
> +				netif_queue_set_napi(tp->dev, ring->index,
> +						     NETDEV_QUEUE_TYPE_TX,
> +						     NULL);
> +			else
> +				netif_queue_set_napi(tp->dev, ring->index,
> +						     NETDEV_QUEUE_TYPE_RX,
> +						     NULL);
> +

Using the existing enum would simplify this block?

  netif_queue_set_napi(tp->dev, ring->index, ring->type, NULL);

>  			list_del(&ring->ring_entry);
> +		}
>  	}
>  
>  	netif_tx_disable(dev);
> @@ -1518,8 +1537,18 @@ static void rtase_sw_reset(struct net_device *dev)
>  	for (i = 0; i < tp->int_nums; i++) {
>  		ivec = &tp->int_vector[i];
>  		list_for_each_entry_safe(ring, tmp, &ivec->ring_list,
> -					 ring_entry)
> +					 ring_entry) {
> +			if (ring->ring_type == RTASE_TX_RING)
> +				netif_queue_set_napi(tp->dev, ring->index,
> +						     NETDEV_QUEUE_TYPE_TX,
> +						     NULL);
> +			else
> +				netif_queue_set_napi(tp->dev, ring->index,
> +						     NETDEV_QUEUE_TYPE_RX,
> +						     NULL);
> +

Same as above?
