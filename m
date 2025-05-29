Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731A021ABA0
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748508245; cv=none; b=ttF6pgdh3BO4syHlHbceuZcDdYtBdwhBa+B/RggFHMxRjHrN2wl26EmbE6tXyWkGrKTtk5GoDUWOT25r9219GBEO8k1sEbxh5I+k8AX/8yUX5K0sphqWyFGbDuR+zcAKA29p7EjDxkNpULweMv5zQWQCIQJj1ZvikjlLLr2DGeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748508245; c=relaxed/simple;
	bh=P988X+j2cpjXTunHdywSt5widwrftav4mCwicXbZReQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqRK0ho0P0YqPC5ph2nPpuay4wEk/LVZcCvODn/DzI+5T4cx7AfHe9eBIFeXCVZ8hMYdZoTPy2W9OwtXwhEXd4V0mS6cnirREjFmTRRWgCh6E6KIf8JebB3WAZdmkbIZTzOjzD2dr2ZL87AqMRORQNDOeQBKdJU7q5c4emBhJK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VfiqJC3M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VfiqJC3M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748508242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9F1AyUc8E8n9yeZIf5vw56v5InQeBZLcKuG+dGd7CQc=;
	b=VfiqJC3MP619VaA0Brr5dg0ySTW2DbwbHcb19w82CQQ8Hf3PUZo5mJ4LUzEfrFiQY17wLr
	iSH/Ir+VihLlcPXyTvDvragKPhpl2ooHIAf3aOxcSr5+6760lsgdnMWjQ1XvGC61IeC44C
	J/3UFctgCCO9BDjO+x/PK0i1+G1V+J8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-S-ObhSkrPT-cvLOVis21ug-1; Thu, 29 May 2025 04:44:00 -0400
X-MC-Unique: S-ObhSkrPT-cvLOVis21ug-1
X-Mimecast-MFC-AGG-ID: S-ObhSkrPT-cvLOVis21ug_1748508240
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-440667e7f92so5128525e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 01:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748508239; x=1749113039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9F1AyUc8E8n9yeZIf5vw56v5InQeBZLcKuG+dGd7CQc=;
        b=LPGfDz6HAWisluiIbpGwUypO+39jEdFHbesEd8af1TCVK+KkPqVmvNtjVdn+CsQCVe
         BcsQj6rYSmnKuQIe3RTI/0DNbW6mfRmcyGedbd+ZxbqbcaipC+4Gb4sHUtKoxw4AaR5m
         imRvDbfE3KPHac1FAdHjarmCO1o4+cXkVREZg58MI5B3d4Zr2igsgDKZyOHFXR7fIBG7
         bJNf6odJ1px2r8ydn165jvcT3yAhlSTPuTFrBNjInrGntOv0uMqf3vYxhooml4nULN+Z
         RGIarebtLs21U6mjolyaeHDcc6pZvn5YONfjkV3pntnW64ZzBS6lv1Xht1Kal7VR8K3D
         s3kA==
X-Forwarded-Encrypted: i=1; AJvYcCUXF5x6nbt+sAPieAG+vVOcyVwiMdVOZy75aRB9hnXMjuobr1L9uD3cRCCUO1AcobS0jo3U6lzEF3RMm2U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2W4efDPonOavhbwoZqZs6nigNYR5qQeuxKqGtwiAj9FN4ytm6
	p4KlhMKsP37YFg5zcoVoUEm0J8CjgE+e07hr98lJ/Cy3Ro+qLFmooRrzgwNq7bttA0g19QRfeRq
	OfeP44GsYFlnPcVLj7jwksm3hpoQ9/aa3M23jKGx9NmPPPdo98yMgKucLqTNs+sOcUw==
X-Gm-Gg: ASbGnctk56lr2liTjQ580q0w3mKkpTk18urnpCZwd2bc3ypK0tkmjKbcUZIVrfOnrWy
	A6Oow2DsEtfFNghbjuPCF+CM1sHQjf9vhkLeroYWEDfMAzHRZkSgxARwCN+cpW3tjqJh1vO1B0G
	zQ8JPnOm/7l5gfg3Y6KFJNJnNvWXkafA65ARrf0mQ6rLGLJvWxwjQM+gzXt9IPTHbRdBRXuLXPJ
	NaAGycTtiI0bjzs4ApCypmCB1h03EsZlXLuhOTfyajILDhVCvOrnyxY+jEMp7teDuqfS+nXoHdw
	lCdEvtSD3nAbucikqTnvqu7cNwq2qb7b3ey0LI+aW92EOlW2RLt6uKCZi4k=
X-Received: by 2002:a05:600c:6215:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-44c933ed932mr180609205e9.33.1748508239271;
        Thu, 29 May 2025 01:43:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFswQtvfSvNa9PDN1FqTqNOAN2DsMJlj+GqnmV0wxODM5kDCL47pz79wZsKUTl0iK8d06a4FA==
X-Received: by 2002:a05:600c:6215:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-44c933ed932mr180609025e9.33.1748508238797;
        Thu, 29 May 2025 01:43:58 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cce5:2e10:5e9b:1ef6:e9f3:6bc4? ([2a0d:3341:cce5:2e10:5e9b:1ef6:e9f3:6bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c9d4sm1325738f8f.38.2025.05.29.01.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 01:43:58 -0700 (PDT)
Message-ID: <0df20c3e-bd51-415f-bfdf-f88bbd39f260@redhat.com>
Date: Thu, 29 May 2025 10:43:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v12 4/7] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250522075455.1723560-1-lukma@denx.de>
 <20250522075455.1723560-5-lukma@denx.de>
 <f738d1ed-7ade-4a37-b8fd-25178f7c1dee@redhat.com>
 <20250528125329.084ab649@wsk>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250528125329.084ab649@wsk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/28/25 12:53 PM, Lukasz Majewski wrote:
>> On 5/22/25 9:54 AM, Lukasz Majewski wrote:
>>> +/* dynamicms MAC address table learn and migration */
>>> +static void mtip_aging_timer(struct timer_list *t)
>>> +{
>>> +	struct switch_enet_private *fep = from_timer(fep, t,
>>> timer_aging); +
>>> +	fep->curr_time = mtip_timeincrement(fep->curr_time);
>>> +
>>> +	mod_timer(&fep->timer_aging,
>>> +		  jiffies +
>>> msecs_to_jiffies(LEARNING_AGING_INTERVAL)); +}  
>>
>> It's unclear to me why you need to maintain a timer just to update a
>> timestamp?!?
>>
> 
> This timestamp is afterwards used in:
> mtip_atable_dynamicms_learn_migration(), which in turn manages the
> entries in switch "dynamic" table (it is one of the fields in the
> record.
> 
>> (jiffies >> msecs_to_jiffies(LEARNING_AGING_INTERVAL)) & ((1 <<
>> AT_DENTRY_TIMESTAMP_WIDTH) - 1)
>>
> 
> If I understood you correctly - I shall remove the timer and then just
> use the above line (based on jiffies) when
> mtip_atable_dynamicms_learn_migration() is called (and it requires the
> timestamp)?
> 
> Otherwise the mtip_timeincrement() seems like a nice wrapper on
> incrementing the timestamp.

Scheduling a timer to obtain a value you can have for free is not a good
resource usage strategy. Note that is a pending question/check above:
verify that the suggested expression yield the expected value in all the
possible use-case.

>>> +	if (!fep->link[0] && !fep->link[1]) {
>>> +		/* Link is down or autonegotiation is in progress.
>>> */
>>> +		netif_stop_queue(dev);
>>> +		spin_unlock_irqrestore(&fep->hw_lock, flags);
>>> +		return NETDEV_TX_BUSY;  
>>
>> Intead you should probably stop the queue when such events happen
> 
> Please correct me if I'm wrong - the netif_stop_queue(dev); is called
> before return. Shall something different be also done?

The xmit routine should assume the link is up and the tx ring has enough
free slot to enqueue a packet. After enqueueing it should check for
enough space availble for the next xmit and stop the queue, likely using
the netif_txq_maybe_stop() helper.

Documentation/networking/driver.rst

>>> +	}
>>> +
>>> +	/* Clear all of the status flags */
>>> +	status &= ~BD_ENET_TX_STATS;
>>> +
>>> +	/* Set buffer length and buffer pointer */
>>> +	bufaddr = skb->data;
>>> +	bdp->cbd_datlen = skb->len;
>>> +
>>> +	/* On some FEC implementations data must be aligned on
>>> +	 * 4-byte boundaries. Use bounce buffers to copy data
>>> +	 * and get it aligned.
>>> +	 */
>>> +	if ((unsigned long)bufaddr & MTIP_ALIGNMENT) {
>>> +		unsigned int index;
>>> +
>>> +		index = bdp - fep->tx_bd_base;
>>> +		memcpy(fep->tx_bounce[index],
>>> +		       (void *)skb->data, skb->len);
>>> +		bufaddr = fep->tx_bounce[index];
>>> +	}
>>> +
>>> +	if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
>>> +		swap_buffer(bufaddr, skb->len);  
>>
>> Ouch, the above will kill performances.
> 
> This unfortunately must be done in such a way (the same approach is
> present on fec_main.c) as the IP block is implemented in such a way
> (explicit conversion from big endian to little endian).
> 
>> Also it looks like it will
>> access uninitialized memory if skb->len is not 4 bytes aligned.
>>
> 
> There is a few lines above a special code to prevent from such a
> situation ((unsigned long)bufaddr & MTIP_ALIGNMENT).

The problem here is not with memory buffer alignment, but with the
packet length, that can be not a multiple of 4. In such a case the last
swap will do an out-of-bound read touching uninitialized data.

>>> +	bdp->cbd_sc = status;
>>> +
>>> +	netif_trans_update(dev);
>>> +	skb_tx_timestamp(skb);
>>> +
>>> +	/* For port separation - force sending via specified port
>>> */
>>> +	if (!fep->br_offload && port != 0)
>>> +		mtip_forced_forward(fep, port, 1);
>>> +
>>> +	/* Trigger transmission start */
>>> +	writel(MCF_ESW_TDAR_X_DES_ACTIVE, fep->hwp + ESW_TDAR);  
>>
>> Possibly you should check skb->xmit_more to avoid ringing the doorbell
>> when not needed.
> 
> I couldn't find skb->xmit_more in the current sources. Instead, there
> is netdev_xmit_more().

Yeah, I referred to the old code, sorry.

> However, the TX code just is supposed to setup one frame transmission
> and hence there is no risk that we trigger "empty" transmission.

The point is that doorbell ringing is usually very expensive (slow) for
the H/W. And is not needed when netdev_xmit_more() is true, because the
another xmit operation will follow. If you care about performances you
should leverage such info.

> 
>>> +	/* First, grab all of the stats for the incoming packet.
>>> +	 * These get messed up if we get called due to a busy
>>> condition.
>>> +	 */
>>> +	bdp = fep->cur_rx;
>>> +
>>> +	while (!((status = bdp->cbd_sc) & BD_ENET_RX_EMPTY)) {
>>> +		if (pkt_received >= budget)
>>> +			break;
>>> +
>>> +		pkt_received++;
>>> +		/* Since we have allocated space to hold a
>>> complete frame,
>>> +		 * the last indicator should be set.
>>> +		 */
>>> +		if ((status & BD_ENET_RX_LAST) == 0)
>>> +			dev_warn_ratelimited(&dev->dev,
>>> +					     "SWITCH ENET: rcv is
>>> not +last\n"); +
>>> +		if (!fep->usage_count)
>>> +			goto rx_processing_done;
>>> +
>>> +		/* Check for errors. */
>>> +		if (status & (BD_ENET_RX_LG | BD_ENET_RX_SH |
>>> BD_ENET_RX_NO |
>>> +			      BD_ENET_RX_CR | BD_ENET_RX_OV)) {
>>> +			dev->stats.rx_errors++;
>>> +			if (status & (BD_ENET_RX_LG |
>>> BD_ENET_RX_SH)) {
>>> +				/* Frame too long or too short. */
>>> +				dev->stats.rx_length_errors++;
>>> +			}
>>> +			if (status & BD_ENET_RX_NO)	/*
>>> Frame alignment */
>>> +				dev->stats.rx_frame_errors++;
>>> +			if (status & BD_ENET_RX_CR)	/* CRC
>>> Error */
>>> +				dev->stats.rx_crc_errors++;
>>> +			if (status & BD_ENET_RX_OV)	/* FIFO
>>> overrun */
>>> +				dev->stats.rx_fifo_errors++;
>>> +		}
>>> +
>>> +		/* Report late collisions as a frame error.
>>> +		 * On this error, the BD is closed, but we don't
>>> know what we
>>> +		 * have in the buffer.  So, just drop this frame
>>> on the floor.
>>> +		 */
>>> +		if (status & BD_ENET_RX_CL) {
>>> +			dev->stats.rx_errors++;
>>> +			dev->stats.rx_frame_errors++;
>>> +			goto rx_processing_done;
>>> +		}
>>> +
>>> +		/* Process the incoming frame */
>>> +		pkt_len = bdp->cbd_datlen;
>>> +		data = (__u8 *)__va(bdp->cbd_bufaddr);
>>> +
>>> +		dma_unmap_single(&fep->pdev->dev, bdp->cbd_bufaddr,
>>> +				 bdp->cbd_datlen,
>>> DMA_FROM_DEVICE);  
>>
>> I have read your explaination WRT unmap/map. Actually you don't need
>> to do any mapping here, 
> 
> There are 16 cbd_t descriptors allocated (as dma_alloc_coherent). Those
> descriptors contain pointer to data (being read in this case).

I'm referring to the actual packet payload, that is the buffer at
bdp-cbd_bufaddr with len bdp->cbd_datlen; I'm not discussing the
descriptors contents.

> Hence the need to perform dma_map_single() for each descriptor, 

You are not unmapping the descriptor, you are unmapping the packet payload.

>> since you are unconditionally copying the
>> whole buffer (why???)
> 
> Only the value of 
> pkt_len = bdp->cbd_datlen; is copied to SKB (after byte swap_buffer()).

The relevant line is:

		skb_copy_to_linear_data(skb, data, pkt_len);

AFAICS that copies whole packet contents, which is usually quite
sub-optimal from performance PoV.

>> and re-using it.
>>
>> Still you need a dma_sync_single() to ensure the CPUs see the correct
>> data.
> 
> The descriptors - i.e. struct cbd_t fields are allocated with
> dma_alloc_coherent(), so this is OK.

I'm talking about packets contents, not packet descriptors. Please
re-read the above and have a look at other drivers code.

An additional point that I missed in the previous review is that the rx
allocation schema is quite uncorrect. At ring initialization time you
allocate full skbs, while what you need and use is just raw buffers for
the packet payload. Instead you could/should use the page pool:

Documentation/networking/page_pool.rst

That will also help doing the right thing WRT DMA handling.

>> This patch is really too big, I'm pretty sure I missed some relevant
>> issues. You should split it in multiple ones: i.e. initialization and
>> h/w access, rx/tx, others ndos.
> 
> It is quite hard to "scatter" this patch as:
> 
> 1. I've already split it to several files (which correspond to
> different "logical" entities - like mtipl2sw_br.c).
> 2. The mtipl2sw.c file is the smallest part of the "core" of the
> driver.
> 3. If I split it, then at some point I would break bisectability for
> imx28.

Note that each patch don't need to provide complete functionality. i.e.
patch 1 could implement ndo_open()/close and related helper, leaving
ndo_start_xmit() and napi_poll empty and avoid allocating the rx
buffers. patch 2 could implement the rx patch, patch 3 the tx path.

The only constraint is that each patch will build successufully, which
is usually easy to achieve.

A 2K lines patches will probably lead to many more iterations and
unhappy (or no) reviewers.

/P

