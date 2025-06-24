Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCE72C08C8
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772557; cv=none; b=Cr7K43E+xXeSpaaRH3gcWu3gDI3X3Z10GTk4ryxk59GHkuCmKpqSH3qO8YzuE4dGL91Isl6NHDQuTJ2NCJXsr3Rhzpa7/PFEMBrH8h7VCmQzvihNyidH9c4nqDh/AzR+bd+ZlnDRK14ZH+Gk0q3rIOYRmGOVNTtnuZ78aMpmmR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772557; c=relaxed/simple;
	bh=fkCKFp+R4NgDfnzuO2tWofrBCbSr7XsJ+eRJJT2WB5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSdHWh53QlCBd8jt2eMmd4JdQqsLiEr7dKqy/w7fmEA5B92lYMF4q7sba3YsHwf6RhcUruZa8J9eYGqpTW+R3DlJ6hLHJ1vf4Su4q8DF38/E1AOJq1jaD0CA2viD+1a3kC9rEJ6ZqH4Reu/CLny0cnfvnQalP08GsJ4Y/mFgY/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qkby1Lrg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qkby1Lrg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750772553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JvwWzJ+xEypawpGYP8KNWgLGz+0unVKUFrWTYj+42lI=;
	b=Qkby1Lrgsnp1FijgZ22z+kxOJ6KQu+sMgdu5Sj4UZSBUIIxZ+DkfbwVCpvdKYmZW6kOlie
	ldJpPFlNmNQ3Kdv7zIRZrjOqKbIOTdCg6bIOJc2ZkIDMYBp1UUaV6HXBpuSC6Va/n67b1J
	oa7mzaj9EDX0W4I9fs6t+YlSNkIS5fE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-f9RhXQaWPdOnoE6z9ZaNpg-1; Tue, 24 Jun 2025 09:42:32 -0400
X-MC-Unique: f9RhXQaWPdOnoE6z9ZaNpg-1
X-Mimecast-MFC-AGG-ID: f9RhXQaWPdOnoE6z9ZaNpg_1750772551
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450eaae2934so46153685e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772551; x=1751377351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JvwWzJ+xEypawpGYP8KNWgLGz+0unVKUFrWTYj+42lI=;
        b=o3wJK+o0SUDYEBnCVRKdfIA2HH/LMA43XrIz5uKoN1s2XwnuTcKFBZPGwDPvXf2YuM
         C7jpnx8vZYMZYDVxxwrdDYA8fy/VWcPSIo/8dQ6XRTQGRdiBka+3+X/lYHh3nCITdlrU
         Cvilk+H/18qrO+cU3zX7V9w6pqz35tGWejjV5bV5ashcOp8nHmYTr4vl5MXPqQt6IGfI
         sOceZ3f/TaFQ/mO2z0EJhEjK9bZCTi/kDbFhxP+SxZM/214jGNgW8TBLqiPl0MllD+Y2
         Gi5l+kzgSPPFckb6DJqFMON9FA3BeItapnTSiUbDhgQeJUoNTenSJ/E19KxYD6QJa62V
         x8Gg==
X-Forwarded-Encrypted: i=1; AJvYcCViKN2CwPEC05QrgXZSnECYb4ztt7T183fQeqJ71QcvUwJ1hWmEvj1H37vPnegCJFDRA3X4bjFeT9RJj98=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQquLY5AHNNa4bM2FSiohHnX7Nff6q6Ly2Q1LhJDsxHhKE6KG/
	syUy7ndFWV+PjOXgKTvp5QvoZF4k9LYGX4JAMc9geFLyCfrfYtKZ3KBufIYEV77o/pjoQkmYNvs
	lFuD8LV+p5IpEr4p4eCWjKvjAuWpDMdspxeJ4n1zcRB2bcJ28hJv5KFOoVMdgPRj4lQ==
X-Gm-Gg: ASbGncvR28+P12pY/cZoHXU2YYLAWbK2KftIYPMdUnl6G92C9YIfjCEUJHCPCterBhf
	Rxe1/N8Uwa+6ImDMBHUU0ENH1gl2v6HsKpW2y+Mweri39jYlTIV48GKXJs9oqBDwdPnzj4G37Lw
	2dHdl9BYcCNidikPfnT9zlDpq+di8TwTMi/z4PrEL7rsQ2KLlp5sZs6IBEFpU3ekZ+fwkD6mNF9
	ztjrmVXKo+MSgM3pRCfkl9uN8/0nHDKd1xdEywn5e7q5g12kLfOE7zs17aCa+WR3nc0nXT6dm91
	WWsYBOwKx+pA0IcEzi07v+ZSMsAezA==
X-Received: by 2002:a05:600c:a07:b0:450:d3c6:84d8 with SMTP id 5b1f17b1804b1-453659caaddmr170383535e9.14.1750772551225;
        Tue, 24 Jun 2025 06:42:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2Sny+uxCfoL7TQtqauFQPpY8QI669KPmHR2EgF9N41ErRRuNQBKLCDGmFU7bbd2Ddpv4HTQ==
X-Received: by 2002:a05:600c:a07:b0:450:d3c6:84d8 with SMTP id 5b1f17b1804b1-453659caaddmr170382835e9.14.1750772550636;
        Tue, 24 Jun 2025 06:42:30 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45374582452sm67189385e9.31.2025.06.24.06.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:42:30 -0700 (PDT)
Message-ID: <c82c19a6-fd0f-4efe-9d93-838b52102ff4@redhat.com>
Date: Tue, 24 Jun 2025 15:42:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v13 05/11] net: mtip: Add net_device_ops functions to
 the L2 switch driver
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
 <20250622093756.2895000-6-lukma@denx.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250622093756.2895000-6-lukma@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/25 11:37 AM, Lukasz Majewski wrote:
> This patch provides callbacks for struct net_device_ops for MTIP
> L2 switch.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> 
> ---
> Changes for v13:
> - New patch - created by excluding some code from large (i.e. v12 and
>   earlier) MTIP driver
> ---
>  .../net/ethernet/freescale/mtipsw/mtipl2sw.c  | 273 ++++++++++++++++++
>  1 file changed, 273 insertions(+)
> 
> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> index 5142f647d939..813cd39d6d56 100644
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> @@ -43,6 +43,15 @@
>  
>  #include "mtipl2sw.h"
>  
> +static void swap_buffer(void *bufaddr, int len)
> +{
> +	int i;
> +	unsigned int *buf = bufaddr;
> +
> +	for (i = 0; i < len; i += 4, buf++)
> +		swab32s(buf);
> +}
> +
>  /* Set the last buffer to wrap */
>  static void mtip_set_last_buf_to_wrap(struct cbd_t *bdp)
>  {
> @@ -444,6 +453,128 @@ static void mtip_config_switch(struct switch_enet_private *fep)
>  	       fep->hwp + ESW_IMR);
>  }
>  
> +static netdev_tx_t mtip_start_xmit_port(struct sk_buff *skb,
> +					struct net_device *dev, int port)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	unsigned short status;
> +	struct cbd_t *bdp;
> +	void *bufaddr;
> +
> +	spin_lock_bh(&fep->hw_lock);
> +
> +	if (!fep->link[0] && !fep->link[1]) {
> +		/* Link is down or autonegotiation is in progress. */
> +		netif_stop_queue(dev);
> +		spin_unlock_bh(&fep->hw_lock);
> +		return NETDEV_TX_BUSY;
> +	}
> +
> +	/* Fill in a Tx ring entry */
> +	bdp = fep->cur_tx;
> +
> +	status = bdp->cbd_sc;
> +
> +	if (status & BD_ENET_TX_READY) {
> +		/* All transmit buffers are full. Bail out.
> +		 * This should not happen, since dev->tbusy should be set.
> +		 */
> +		netif_stop_queue(dev);
> +		dev_err(&fep->pdev->dev, "%s: tx queue full!.\n", dev->name);
> +		spin_unlock_bh(&fep->hw_lock);
> +		return NETDEV_TX_BUSY;
> +	}
> +
> +	/* Clear all of the status flags */
> +	status &= ~BD_ENET_TX_STATS;
> +
> +	/* Set buffer length and buffer pointer */
> +	bufaddr = skb->data;
> +	bdp->cbd_datlen = skb->len;
> +
> +	/* On some FEC implementations data must be aligned on
> +	 * 4-byte boundaries. Use bounce buffers to copy data
> +	 * and get it aligned.spin
> +	 */
> +	if ((unsigned long)bufaddr & MTIP_ALIGNMENT) {
> +		unsigned int index;
> +
> +		index = bdp - fep->tx_bd_base;
> +		memcpy(fep->tx_bounce[index],
> +		       (void *)skb->data, skb->len);
> +		bufaddr = fep->tx_bounce[index];
> +	}
> +
> +	if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> +		swap_buffer(bufaddr, skb->len);
> +
> +	/* Save skb pointer. */
> +	fep->tx_skbuff[fep->skb_cur] = skb;
> +
> +	fep->skb_cur = (fep->skb_cur + 1) & TX_RING_MOD_MASK;
> +
> +	/* Push the data cache so the CPM does not get stale memory
> +	 * data.
> +	 */
> +	bdp->cbd_bufaddr = dma_map_single(&fep->pdev->dev, bufaddr,
> +					  MTIP_SWITCH_TX_FRSIZE,
> +					  DMA_TO_DEVICE);
> +	if (unlikely(dma_mapping_error(&fep->pdev->dev, bdp->cbd_bufaddr))) {
> +		dev_err(&fep->pdev->dev,
> +			"Failed to map descriptor tx buffer\n");
> +		dev->stats.tx_errors++;
> +		dev->stats.tx_dropped++;
> +		dev_kfree_skb_any(skb);
> +		goto err;
> +	}
> +
> +	/* Send it on its way.  Tell FEC it's ready, interrupt when done,
> +	 * it's the last BD of the frame, and to put the CRC on the end.
> +	 */
> +
> +	status |= (BD_ENET_TX_READY | BD_ENET_TX_INTR
> +			| BD_ENET_TX_LAST | BD_ENET_TX_TC);
> +
> +	/* Synchronize all descriptor writes */
> +	wmb();
> +	bdp->cbd_sc = status;
> +
> +	netif_trans_update(dev);
> +	skb_tx_timestamp(skb);
> +
> +	/* Trigger transmission start */
> +	writel(MCF_ESW_TDAR_X_DES_ACTIVE, fep->hwp + ESW_TDAR);
> +
> +	dev->stats.tx_bytes += skb->len;
> +	/* If this was the last BD in the ring,
> +	 * start at the beginning again.
> +	 */
> +	if (status & BD_ENET_TX_WRAP)
> +		bdp = fep->tx_bd_base;
> +	else
> +		bdp++;
> +
> +	if (bdp == fep->dirty_tx) {
> +		fep->tx_full = 1;
> +		netif_stop_queue(dev);

You may want to stop the queue earlier, i.e. when 75% or the like of the
tx ring is full. Also you can use netif_txq_maybe_stop() - with txq ==
netdev_get_tx_queue(dev, 0)

[...]
> +static void mtip_timeout(struct net_device *dev, unsigned int txqueue)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	struct cbd_t *bdp;
> +	int i;
> +
> +	dev->stats.tx_errors++;
> +
> +	if (IS_ENABLED(CONFIG_SWITCH_DEBUG)) {
> +		dev_info(&dev->dev, "%s: transmit timed out.\n", dev->name);
> +		dev_info(&dev->dev,
> +			 "Ring data: cur_tx %lx%s, dirty_tx %lx cur_rx: %lx\n",
> +			 (unsigned long)fep->cur_tx,
> +			 fep->tx_full ? " (full)" : "",
> +			 (unsigned long)fep->dirty_tx,
> +			 (unsigned long)fep->cur_rx);
> +
> +		bdp = fep->tx_bd_base;
> +		dev_info(&dev->dev, " tx: %u buffers\n", TX_RING_SIZE);
> +		for (i = 0; i < TX_RING_SIZE; i++) {
> +			dev_info(&dev->dev, "  %08lx: %04x %04x %08x\n",
> +				 (kernel_ulong_t)bdp, bdp->cbd_sc,
> +				 bdp->cbd_datlen, (int)bdp->cbd_bufaddr);
> +			bdp++;
> +		}
> +
> +		bdp = fep->rx_bd_base;
> +		dev_info(&dev->dev, " rx: %lu buffers\n",
> +			 (unsigned long)RX_RING_SIZE);
> +		for (i = 0 ; i < RX_RING_SIZE; i++) {
> +			dev_info(&dev->dev, "  %08lx: %04x %04x %08x\n",
> +				 (kernel_ulong_t)bdp,
> +				 bdp->cbd_sc, bdp->cbd_datlen,
> +				 (int)bdp->cbd_bufaddr);
> +			bdp++;
> +		}

Here you are traversing both rings without any lock, which looks race prone.

/P

