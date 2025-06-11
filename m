Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6F8268C55
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637797; cv=none; b=nHnd+qRiOTjofUAlkrofOxhSZ8fycnFPtyApHQTIhxQfCjrGi5uNoqPRmhq8i5PwlN/Zo6OeT0HEzbDl6SGZD7a6EfJhrMZ7q4T1M+LXSodlY22W2HZJmeFQDDPqVFDHq7iXUH5xqExfI7XK+Jv41IswziXwV+wlXCjAk+W1H7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637797; c=relaxed/simple;
	bh=YlHXxMugl9yjOiNKeFUjiSUYbzIfe6d6gCIYXllOlIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BtSlYA+K0e2ttQm6q6VxrCH/l7/fIQeCaXH3TzIFqt+t2mF+8pj6RV2lsXMP3fiBzjEexJRPDphRpQ3ql7t3bfIDg0lUWdThW/7wzKxrORQmqXyqfIevmHjP1/gYqWKvRqlzch+PDERdZC233nZYAxjPy6hyZphM1L1bn2/xjOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fRSPguXx; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fRSPguXx"
Message-ID: <cdcd54ff-ff67-4ad8-8aa7-baa711928242@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749637792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vsD0r2ubczrvxe7E6Hz3oR1VDIOnDQXAzS4kwGFiDY0=;
	b=fRSPguXxdP+bxFKXzw8IXPvBDS7PNhulrJ5AKNaVBxE/HU5Sy8+bASY2d9tYSO8RYqBZ9Y
	OpqAXd/4ejqf/HgKyaGjLGSfkBizkMG/JrEgEFI7RHEL4hePKPX68ihcfBIQpWBtJrwZle
	LX45PMC+xyaBy+CAu+fxUDRdbDXZk9s=
Date: Wed, 11 Jun 2025 11:29:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v8 06/11] net: ti: prueth: Adds HW timestamping
 support for PTP using PRU-ICSS IEP module
To: Parvathi Pudi <parvathi@couthit.com>, danishanwar@ti.com,
 rogerq@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ssantosh@kernel.org,
 richardcochran@gmail.com, s.hauer@pengutronix.de, m-karicheri2@ti.com,
 glaroque@baylibre.com, afd@ti.com, saikrishnag@marvell.com,
 m-malladi@ti.com, jacob.e.keller@intel.com, diogo.ivo@siemens.com,
 javier.carrasco.cruz@gmail.com, horms@kernel.org, s-anna@ti.com,
 basharath@couthit.com
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pratheesh@ti.com,
 prajith@ti.com, vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
 krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
References: <20250610105721.3063503-1-parvathi@couthit.com>
 <20250610123245.3063659-7-parvathi@couthit.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250610123245.3063659-7-parvathi@couthit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 10/06/2025 13:32, Parvathi Pudi wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> PRU-ICSS IEP module, which is capable of timestamping RX and
> TX packets at HW level, is used for time synchronization by PTP4L.
> 
> This change includes interaction between firmware and user space
> application (ptp4l) with required packet timestamps. The driver
> initializes the PRU firmware with appropriate mode and configuration
> flags. Firmware updates local registers with the flags set by driver
> and uses for further operation. RX SOF timestamp comes along with
> packet and firmware will rise interrupt with TX SOF timestamp after
> pushing the packet on to the wire.
> 
> IEP driver is available in upstream and we are reusing for hardware
> configuration for ICSSM as well. On top of that we have extended it
> with the changes for AM57xx SoC.
> 
> Extended ethtool for reading HW timestamping capability of the PRU
> interfaces.
> 
> Currently ordinary clock (OC) configuration has been validated with
> Linux ptp4l.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> ---
>   drivers/net/ethernet/ti/icssg/icss_iep.c      |  42 ++
>   drivers/net/ethernet/ti/icssm/icssm_ethtool.c |  23 +
>   drivers/net/ethernet/ti/icssm/icssm_prueth.c  | 443 +++++++++++++++++-
>   drivers/net/ethernet/ti/icssm/icssm_prueth.h  |  11 +
>   .../net/ethernet/ti/icssm/icssm_prueth_ptp.h  |  85 ++++
>   5 files changed, 602 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_ptp.h

[...]

> @@ -732,9 +949,22 @@ int icssm_emac_rx_packet(struct prueth_emac *emac, u16 *bd_rd_ptr,
>   		src_addr += actual_pkt_len;
>   	}
>   
> +	if (pkt_info->timestamp) {
> +		src_addr = (void *)PTR_ALIGN((uintptr_t)src_addr,
> +					   ICSS_BLOCK_SIZE);
> +		dst_addr = &ts;
> +		memcpy(dst_addr, src_addr, sizeof(ts));
> +	}
> +
>   	if (!pkt_info->sv_frame) {
>   		skb_put(skb, actual_pkt_len);
>   
> +		if (icssm_prueth_ptp_rx_ts_is_enabled(emac) &&
> +		    pkt_info->timestamp) {
> +			ssh = skb_hwtstamps(skb);
> +			memset(ssh, 0, sizeof(*ssh));
> +			ssh->hwtstamp = ns_to_ktime(ts);
> +		}
>   		/* send packet up the stack */
>   		skb->protocol = eth_type_trans(skb, ndev);
>   		netif_receive_skb(skb);

Could you please explain why do you need to copy timestamp to a
temporary variable if you won't use it in some cases? I believe these
2 blocks should be placed under the last if condition and simplified a
bit, like

+		if (icssm_prueth_ptp_rx_ts_is_enabled(emac) &&
+		    pkt_info->timestamp) {
+			src_addr = (void*)PTR_ALIGN((uintptr_t)src_addr,
+					   ICSS_BLOCK_SIZE);
+			memcpy(&ts, src_addr, sizeof(ts));
+			ssh = skb_hwtstamps(skb);
+			ssh->hwtstamp = ns_to_ktime(ts);
+		}

This will avoid useless copy when the packet will be dropped anyway, WDYT?
