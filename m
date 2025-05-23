Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D81297B89
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017307; cv=none; b=FjtI5N+OSIgDAb+YTmBYLMMiEbng3R9tgKiBs/CgLAbQ8pC+PJGvNJAwraK6gUUIBTl7dkLFt/R2tuulGfkWaVRNb2yDEDgqef5Tn14EnXXrvAGSqf+c3mIvNAt4BZSPOTsTWQviFUgwTM0EyT5seUaw21hNGakbqqqEqhTG0bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017307; c=relaxed/simple;
	bh=BujhNJcIfJdCrltgcQz6MNassde82rEbsesI1Wbty8U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Fc3jjQsjI9BeJWgbomYvCCseTTfOPYX+6EF1srjHVRneICtRp6XP+2xocF+4/thtK/ZEi2FJWNpE0siX3CuvTDvlMsdG2Vu/Cal3UTlN/06XoGkmVBFdXmOGRSyv7cfCrlVQhTCW05t0Nm6QdufHo4FkdFL7z+18hOokd5CIVqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cRC0UiDN; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cRC0UiDN"
Message-ID: <b35cdeb3-399e-4ca0-a9a4-66bab45bd7e4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748017293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eXlfdMIujoEWEfC9MCFXNwyGXVaiR+vqx4I+fOV2LpA=;
	b=cRC0UiDNCqZcN6BiCFcSi7WyBG7RHQ/NaavE5iXAjkOSdJagNosatR+NIg0yTNRHOMRQeJ
	gsLSdNrIvX8gOYYtmOPHCP6Bc2qPiQ2yeewLyrlzKsYAQMe0DEZoNLwaPpytrw/dHjMfY8
	fbfnntgHadynhOa0PsMl2BmsNbQsvr8=
Date: Fri, 23 May 2025 12:21:10 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net] net: xilinx: axienet: Fix Tx skb circular buffer
 occupancy check in dmaengine xmit
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Suraj Gupta <suraj.gupta2@amd.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, michal.simek@amd.com, radhey.shyam.pandey@amd.com,
 horms@kernel.org
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com, harini.katakam@amd.com
References: <20250521181608.669554-1-suraj.gupta2@amd.com>
 <57443336-2098-42c9-be6d-468cdbd9b312@linux.dev>
Content-Language: en-US
In-Reply-To: <57443336-2098-42c9-be6d-468cdbd9b312@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/23/25 12:20, Sean Anderson wrote:
> On 5/21/25 14:16, Suraj Gupta wrote:
>> In Dmaengine flow, driver maintains struct skbuf_dma_descriptor rings each
>> element of which corresponds to a skb. In Tx datapath, compare available
>> space in skb ring with number of skbs instead of skb fragments.
>> Replace x * (MAX_SKB_FRAGS) in netif_txq_completed_wake() and
>> netif_txq_maybe_stop() with x * (1 skb) to fix the comparison.
>> 
>> Fixes: 6a91b846af85 ("net: axienet: Introduce dmaengine support")
>> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
>> ---
>>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>> index 1b7a653c1f4e..6011d7eae0c7 100644
>> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>> @@ -880,7 +880,7 @@ static void axienet_dma_tx_cb(void *data, const struct dmaengine_result *result)
>>  	dev_consume_skb_any(skbuf_dma->skb);
>>  	netif_txq_completed_wake(txq, 1, len,
>>  				 CIRC_SPACE(lp->tx_ring_head, lp->tx_ring_tail, TX_BD_NUM_MAX),
>> -				 2 * MAX_SKB_FRAGS);
>> +				 2);
>>  }
>>  
>>  /**
>> @@ -914,7 +914,7 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, struct net_device *ndev)
>>  
>>  	dma_dev = lp->tx_chan->device;
>>  	sg_len = skb_shinfo(skb)->nr_frags + 1;
>> -	if (CIRC_SPACE(lp->tx_ring_head, lp->tx_ring_tail, TX_BD_NUM_MAX) <= sg_len) {
>> +	if (CIRC_SPACE(lp->tx_ring_head, lp->tx_ring_tail, TX_BD_NUM_MAX) <= 1) {
>>  		netif_stop_queue(ndev);
>>  		if (net_ratelimit())
>>  			netdev_warn(ndev, "TX ring unexpectedly full\n");
>> @@ -964,7 +964,7 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, struct net_device *ndev)
>>  	txq = skb_get_tx_queue(lp->ndev, skb);
>>  	netdev_tx_sent_queue(txq, skb->len);
>>  	netif_txq_maybe_stop(txq, CIRC_SPACE(lp->tx_ring_head, lp->tx_ring_tail, TX_BD_NUM_MAX),
>> -			     MAX_SKB_FRAGS + 1, 2 * MAX_SKB_FRAGS);
>> +			     1, 2);
>>  
>>  	dmaengine_submit(dma_tx_desc);
>>  	dma_async_issue_pending(lp->tx_chan);
> 
> Reviwed-by: Sean Anderson <sean.anderson@linux.dev>

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

*spelling
