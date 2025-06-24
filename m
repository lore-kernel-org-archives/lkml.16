Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F782D29AC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773538; cv=none; b=B3ao8IA7cMHFjHYOuUevh5P326guXT+ePUQNkzg9lsCQr/dBke8xv0UWx3Hrn8eQgpd4R7y2Vc9h9okvpuXtukjKYRxMpovXUbP62YQRcz0PBw+SJUjdwVkAbsOqwpW70SdSQfsdeVii3+Ks/JcS7GhGO19+Y6jgi+BiTRLryOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773538; c=relaxed/simple;
	bh=QN1IvyHstDSugmYHGn6RnWDC2TQ9UZa+iXsvZ7bn5nM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvJTcHNTVGroZEOJcNHxMRg47FSJWu1b9InK+c/PxE5sXBamBHrtd9Gc+BZUV8cE0OUmWEdFsy6qHbK84x7QeRlgtesYxbVk9J/DQIJrNDaU4I1qdkr6MN6DRglAc0na1ZlF1vqPWHVKFWkUp9fNXSIGj0kVmardmmOsIDlU98k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UVswQKlY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UVswQKlY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750773535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NJETF+d2pLQF55q4eo7VJUmA6BWdkOEFLVhwFcRS2Pc=;
	b=UVswQKlYlZAP3KHBj9AuqxoNIiQXg0bvBvzEiXkrDTcRsbj+QNJMu/3chPN7FYJ0TW57ZF
	rZay/FYDIGhwxCnXHMlqrqTdQnB+BALAGJXv2xhU4C0FvkuHhHzYhEHBDbKYqtho7SmVbB
	tX27qeusESrfzkliGogIl3LkfnuOj1g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-MxERrfDFOCeGgX7Ql2XvJA-1; Tue, 24 Jun 2025 09:58:54 -0400
X-MC-Unique: MxERrfDFOCeGgX7Ql2XvJA-1
X-Mimecast-MFC-AGG-ID: MxERrfDFOCeGgX7Ql2XvJA_1750773533
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4537f56ab74so3399805e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773533; x=1751378333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJETF+d2pLQF55q4eo7VJUmA6BWdkOEFLVhwFcRS2Pc=;
        b=P6DCJQuZOgE/dYIpykc4oe+OE68RA4hBhnoK0zz7PKpUPG/aeeG8AwPuvPy3oTuXbi
         TDLUDQ3J2XmF2iImHdsGZDZRl2R3icOplstXCqmxzpKFceyEEyvryhT/5ERmck93Dgwp
         l15vuqbAjJPPfmhZsuLIFPX/hU33dY4vq5gyPcDQuAL2cSQz1KFauW4p7YcEGYSQL2F5
         gFmQZsPS8K2R1gus1GQD21Ig5eQG8qoJluCxv0TzVcAotqdXlcWmguMctkfhbUFmLx9f
         6IFWRRHQgwglqCL5ILhvyFWyl2KNbF4AtLSHyIaFMhh8mdRHppS+tBC4VPUGVUO4SR9E
         g6gw==
X-Forwarded-Encrypted: i=1; AJvYcCW8OTX1AiJidsLIRzDmXmzQqvLydP9eujUZEo4g5Zns50EH6+3gU1Lr5JZto4zaMPGzGSO/V43tdeEUwjM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh6TDd7qXgr1Hm6/r+/bRUBX9+LzX4Q7+KybDjSAHRQftXAeAX
	1kgi7oggGpQd64dsRIG6GlQe3lKi515+5TeZzLSv3Bb+pFYMEHIllKmkZXVL9R5wCITh4YcGUZe
	MQPRpcmuZhytYhqvUCm7o9bBUFCocezz1TIim2Mh7zS1iRZhuSwOqe4AHW77jOIW8Yw==
X-Gm-Gg: ASbGnctFzXqRs7nYlvzfBxH0gNEJuSVNznnN9eIT2GF0gXkuUGY+yNd72PD43FORrzk
	q6Q4vT1IMk+fFpiKGo18RKCxaa02mOazNgh4sUMNJsvckpYsCaN1W5A0DKORoCK4+Zy7Ii7GerX
	iLP4iw4ng04iVHXtkzYp/7lZEf4yhcVPtHeLl5YtXy2u/IePiBdheR7XqwiA7dPIQ9LD8VhHSjU
	yWnwCgsn2iRcx6+ApnNr4VF8++xenpRibmRBfwm1BnsJze5ATiOcXHM8EsI/ySSTRxNLTrUggaX
	kwrmlB7AJ+L464gGZkwgbWJ8PfptwQ==
X-Received: by 2002:a05:600c:1f0e:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-453659ec182mr146030325e9.21.1750773532502;
        Tue, 24 Jun 2025 06:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1le+gfiCWzZWkjf0OUkmAjewnd0L9bTFZ1EQtrZaSsErFSbjeDCSumtctgWYOrMiiFumFTQ==
X-Received: by 2002:a05:600c:1f0e:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-453659ec182mr146030015e9.21.1750773531957;
        Tue, 24 Jun 2025 06:58:51 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805d21fsm1997899f8f.23.2025.06.24.06.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:58:51 -0700 (PDT)
Message-ID: <0de412ee-c9ce-463b-92ef-58a33fd132d1@redhat.com>
Date: Tue, 24 Jun 2025 15:58:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v13 06/11] net: mtip: Add mtip_switch_{rx|tx} functions
 to the L2 switch driver
To: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
References: <20250622093756.2895000-1-lukma@denx.de>
 <20250622093756.2895000-7-lukma@denx.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250622093756.2895000-7-lukma@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/25 11:37 AM, Lukasz Majewski wrote:
> This patch provides mtip_switch_tx and mtip_switch_rx functions
> code for MTIP L2 switch.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
> Changes for v13:
> - New patch - created by excluding some code from large (i.e. v12 and
>   earlier) MTIP driver
> ---
>  .../net/ethernet/freescale/mtipsw/mtipl2sw.c  | 252 ++++++++++++++++++
>  1 file changed, 252 insertions(+)
> 
> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> index 813cd39d6d56..a4e38e0d773e 100644
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> @@ -228,6 +228,39 @@ struct mtip_port_info *mtip_portinfofifo_read(struct switch_enet_private *fep)
>  	return info;
>  }
>  
> +static void mtip_atable_get_entry_port_number(struct switch_enet_private *fep,
> +					      unsigned char *mac_addr, u8 *port)
> +{
> +	int block_index, block_index_end, entry;
> +	u32 mac_addr_lo, mac_addr_hi;
> +	u32 read_lo, read_hi;
> +
> +	mac_addr_lo = (u32)((mac_addr[3] << 24) | (mac_addr[2] << 16) |
> +			    (mac_addr[1] << 8) | mac_addr[0]);
> +	mac_addr_hi = (u32)((mac_addr[5] << 8) | (mac_addr[4]));
> +
> +	block_index = GET_BLOCK_PTR(crc8_calc(mac_addr));
> +	block_index_end = block_index + ATABLE_ENTRY_PER_SLOT;
> +
> +	/* now search all the entries in the selected block */
> +	for (entry = block_index; entry < block_index_end; entry++) {
> +		mtip_read_atable(fep, entry, &read_lo, &read_hi);
> +		*port = MTIP_PORT_FORWARDING_INIT;
> +
> +		if (read_lo == mac_addr_lo &&
> +		    ((read_hi & 0x0000FFFF) ==
> +		     (mac_addr_hi & 0x0000FFFF))) {
> +			/* found the correct address */
> +			if ((read_hi & (1 << 16)) && (!(read_hi & (1 << 17))))
> +				*port = FIELD_GET(AT_PORT_MASK, read_hi);
> +			break;
> +		}
> +	}
> +
> +	dev_dbg(&fep->pdev->dev, "%s: MAC: %pM PORT: 0x%x\n", __func__,
> +		mac_addr, *port);
> +}
> +
>  /* Clear complete MAC Look Up Table */
>  void mtip_clear_atable(struct switch_enet_private *fep)
>  {
> @@ -820,10 +853,229 @@ static irqreturn_t mtip_interrupt(int irq, void *ptr_fep)
>  
>  static void mtip_switch_tx(struct net_device *dev)
>  {
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	unsigned short status;
> +	struct sk_buff *skb;
> +	unsigned long flags;
> +	struct cbd_t *bdp;
> +
> +	spin_lock_irqsave(&fep->hw_lock, flags);

This is called from napi (bh) context, and every other caller is/should
be BH, too. You should use

	spin_lock_bh()

Also please test your patches with CONFIG_LOCKDEP and
CONFIG_DEBUG_SPINLOCK enabled, thet will help finding this king of issues.

/P

> +	bdp = fep->dirty_tx;
> +
> +	while (((status = bdp->cbd_sc) & BD_ENET_TX_READY) == 0) {
> +		if (bdp == fep->cur_tx && fep->tx_full == 0)
> +			break;
> +
> +		dma_unmap_single(&fep->pdev->dev, bdp->cbd_bufaddr,
> +				 MTIP_SWITCH_TX_FRSIZE, DMA_TO_DEVICE);
> +		bdp->cbd_bufaddr = 0;
> +		skb = fep->tx_skbuff[fep->skb_dirty];
> +		/* Check for errors */
> +		if (status & (BD_ENET_TX_HB | BD_ENET_TX_LC |
> +				   BD_ENET_TX_RL | BD_ENET_TX_UN |
> +				   BD_ENET_TX_CSL)) {
> +			dev->stats.tx_errors++;
> +			if (status & BD_ENET_TX_HB)  /* No heartbeat */
> +				dev->stats.tx_heartbeat_errors++;
> +			if (status & BD_ENET_TX_LC)  /* Late collision */
> +				dev->stats.tx_window_errors++;
> +			if (status & BD_ENET_TX_RL)  /* Retrans limit */
> +				dev->stats.tx_aborted_errors++;
> +			if (status & BD_ENET_TX_UN)  /* Underrun */
> +				dev->stats.tx_fifo_errors++;
> +			if (status & BD_ENET_TX_CSL) /* Carrier lost */
> +				dev->stats.tx_carrier_errors++;
> +		} else {
> +			dev->stats.tx_packets++;
> +		}
> +
> +		if (status & BD_ENET_TX_READY)
> +			dev_err(&fep->pdev->dev,
> +				"Enet xmit interrupt and TX_READY.\n");
> +
> +		/* Deferred means some collisions occurred during transmit,
> +		 * but we eventually sent the packet OK.
> +		 */
> +		if (status & BD_ENET_TX_DEF)
> +			dev->stats.collisions++;
> +
> +		/* Free the sk buffer associated with this last transmit */
> +		dev_consume_skb_irq(skb);
> +		fep->tx_skbuff[fep->skb_dirty] = NULL;
> +		fep->skb_dirty = (fep->skb_dirty + 1) & TX_RING_MOD_MASK;
> +
> +		/* Update pointer to next buffer descriptor to be transmitted */
> +		if (status & BD_ENET_TX_WRAP)
> +			bdp = fep->tx_bd_base;
> +		else
> +			bdp++;
> +
> +		/* Since we have freed up a buffer, the ring is no longer
> +		 * full.
> +		 */
> +		if (fep->tx_full) {
> +			fep->tx_full = 0;
> +			if (netif_queue_stopped(dev))
> +				netif_wake_queue(dev);
> +		}
> +	}
> +	fep->dirty_tx = bdp;
> +	spin_unlock_irqrestore(&fep->hw_lock, flags);
>  }
>  
> +/* During a receive, the cur_rx points to the current incoming buffer.
> + * When we update through the ring, if the next incoming buffer has
> + * not been given to the system, we just set the empty indicator,
> + * effectively tossing the packet.
> + */
>  static int mtip_switch_rx(struct net_device *dev, int budget, int *port)
>  {
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	u8 *data, rx_port = MTIP_PORT_FORWARDING_INIT;
> +	struct switch_enet_private *fep = priv->fep;
> +	unsigned short status, pkt_len;
> +	struct net_device *pndev;
> +	struct ethhdr *eth_hdr;
> +	int pkt_received = 0;
> +	struct sk_buff *skb;
> +	struct cbd_t *bdp;
> +	struct page *page;
> +
> +	spin_lock_bh(&fep->hw_lock);
> +
> +	/* First, grab all of the stats for the incoming packet.
> +	 * These get messed up if we get called due to a busy condition.
> +	 */
> +	bdp = fep->cur_rx;
> +
> +	while (!((status = bdp->cbd_sc) & BD_ENET_RX_EMPTY)) {
> +		if (pkt_received >= budget)
> +			break;
> +
> +		pkt_received++;
> +		/* Since we have allocated space to hold a complete frame,
> +		 * the last indicator should be set.
> +		 */
> +		if ((status & BD_ENET_RX_LAST) == 0)
> +			dev_warn_ratelimited(&dev->dev,
> +					     "SWITCH ENET: rcv is not +last\n");

Probably you want to break the look when this condition is hit.

> +
> +		if (!fep->usage_count)
> +			goto rx_processing_done;
> +
> +		/* Check for errors. */
> +		if (status & (BD_ENET_RX_LG | BD_ENET_RX_SH | BD_ENET_RX_NO |
> +			      BD_ENET_RX_CR | BD_ENET_RX_OV)) {
> +			dev->stats.rx_errors++;
> +			if (status & (BD_ENET_RX_LG | BD_ENET_RX_SH)) {
> +				/* Frame too long or too short. */
> +				dev->stats.rx_length_errors++;
> +			}
> +			if (status & BD_ENET_RX_NO)	/* Frame alignment */
> +				dev->stats.rx_frame_errors++;
> +			if (status & BD_ENET_RX_CR)	/* CRC Error */
> +				dev->stats.rx_crc_errors++;
> +			if (status & BD_ENET_RX_OV)	/* FIFO overrun */
> +				dev->stats.rx_fifo_errors++;
> +		}
> +
> +		/* Report late collisions as a frame error.
> +		 * On this error, the BD is closed, but we don't know what we
> +		 * have in the buffer.  So, just drop this frame on the floor.
> +		 */
> +		if (status & BD_ENET_RX_CL) {
> +			dev->stats.rx_errors++;
> +			dev->stats.rx_frame_errors++;
> +			goto rx_processing_done;
> +		}
> +
> +		/* Get correct RX page */
> +		page = fep->page[bdp - fep->rx_bd_base];
> +		/* Process the incoming frame */
> +		pkt_len = bdp->cbd_datlen;
> +		data = (__u8 *)__va(bdp->cbd_bufaddr);
> +
> +		dma_sync_single_for_cpu(&fep->pdev->dev, bdp->cbd_bufaddr,
> +					pkt_len, DMA_FROM_DEVICE);
> +		prefetch(page_address(page));

Use net_prefetch() instead

> +
> +		if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> +			swap_buffer(data, pkt_len);
> +
> +		if (data) {
> +			eth_hdr = (struct ethhdr *)data;
> +			mtip_atable_get_entry_port_number(fep,
> +							  eth_hdr->h_source,
> +							  &rx_port);
> +			if (rx_port == MTIP_PORT_FORWARDING_INIT)
> +				mtip_atable_dynamicms_learn_migration(fep,
> +								      fep->curr_time,
> +								      eth_hdr->h_source,
> +								      &rx_port);
> +		}
> +
> +		if ((rx_port == 1 || rx_port == 2) && fep->ndev[rx_port - 1])
> +			pndev = fep->ndev[rx_port - 1];
> +		else
> +			pndev = dev;
> +
> +		*port = rx_port;

Do i read correctly that several network device use the same napi
instance? That will break napi assumptions and will incorrectly allow
napi merging packets coming from different devices.

> +
> +		/* This does 16 byte alignment, exactly what we need.
> +		 * The packet length includes FCS, but we don't want to
> +		 * include that when passing upstream as it messes up
> +		 * bridging applications.
> +		 */
> +		skb = netdev_alloc_skb(pndev, pkt_len + NET_IP_ALIGN);
> +		if (unlikely(!skb)) {
> +			dev_dbg(&fep->pdev->dev,
> +				"%s: Memory squeeze, dropping packet.\n",
> +				pndev->name);
> +			page_pool_recycle_direct(fep->page_pool, page);
> +			pndev->stats.rx_dropped++;
> +			goto err_mem;
> +		} else {

No need for the else statement above.

/P

