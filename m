Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA851DDD1
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748225420; cv=none; b=kGkZdnIuhlbZmi1U77H6D9/pWzU62QYi8Nt1ZFLif8yqghxbamJNJUVe8p2TauAVDMGDIudwdYiZxO+pCACgocWK/pyPu/jhCPsOe79u6FUhisBol4l1MRtD2TZrKgj0k16MZwOV/wCcY4R+8NU+4wdRyx8e1mW3Z0zvnQnWL6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748225420; c=relaxed/simple;
	bh=8ciJHIlGj6pm5BNUqt8Pv95ThvlOa8sEQQhMJuAE0kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJUk1bvV+Dbc31+1QUeyQzzOIE6f7Wv/DiyVwPMTIMYHkh49ZAWntc+HfvInPCmhFWNJNIK+rR0ZcHHdWLFn6P6kxCnCXpjwKYMli44+Sq81lRInHdAGXoGWzELsGIQ0KukQAtdaLQwXkhDNMCKgNbg10+RzLK9HjIzdGHQGI/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FYEmr/E+; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FYEmr/E+"
Message-ID: <e0552940-9fbe-4375-a9a9-e26cd425591a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748225404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BfaAdI9zTMYbkWR9hpAtSFrILp9opsBXSmOMXnFJNzA=;
	b=FYEmr/E+GLbI9k1DJULJpVLB+Vkmmpn2kp2zpWL1xiEx/Zee+na0++FAge+A7Sqjn5E3b8
	xRd8x1rwcJuz7bbrZ42XKFEOpgoIT0c2RKhftzUIltvk57uLHsZrox6zt70c6sx49nlVl8
	s4hM5DkxEXnAewg+j0E/pOjofmFWSXw=
Date: Mon, 26 May 2025 10:09:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] net: stmmac: set multicast filter to zero if feature is
 unsupported
To: Nikunj Kela <nikunj.kela@sima.ai>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: rmk+kernel@armlinux.org.uk, 0x1207@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250523221938.2980773-1-nikunj.kela@sima.ai>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250523221938.2980773-1-nikunj.kela@sima.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/24/25 6:19 AM, Nikunj Kela 写道:
> Hash based multicast filtering is an optional feature. Currently,
> driver overrides the value of multicast_filter_bins based on the hash
> table size. If the feature is not supported, hash table size reads 0
> however the value of multicast_filter_bins remains set to default
> HASH_TABLE_SIZE which is incorrect. Let's override it to 0 if the
> feature is unsupported.
> 
> Signed-off-by: Nikunj Kela <nikunj.kela@sima.ai>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 085c09039af4..ccea9f811a05 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7241,6 +7241,9 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
>   					(BIT(priv->dma_cap.hash_tb_sz) << 5);
>   			priv->hw->mcast_bits_log2 =
>   					ilog2(priv->hw->multicast_filter_bins);
> +		} else {
> +			priv->hw->multicast_filter_bins = 0;
> +			priv->hw->mcast_bits_log2 = 0;
>   		}

I didn't read the code carefully, just did a simple search：

❯ grep -rn multicast_filter_bins drivers/net/
drivers/net/ethernet/stmicro/stmmac/common.h:611:	unsigned int 
multicast_filter_bins;
drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:26: 
plat_dat->multicast_filter_bins = 0;
***
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:512: 
plat->multicast_filter_bins = HASH_TABLE_SIZE;
***
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:536:				 
&plat->multicast_filter_bins);
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:541:	 
plat->multicast_filter_bins = dwmac1000_validate_mcast_bins(
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:542:			 
&pdev->dev, plat->multicast_filter_bins);
drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:523: 
mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:527:	if 
(mac->multicast_filter_bins)
drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:528:	 
mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:516:		 
(netdev_mc_count(dev) > hw->multicast_filter_bins)) {
drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1527: 
mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1531:	if 
(mac->multicast_filter_bins)
drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1532:	 
mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1568: 
mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1572:	if 
(mac->multicast_filter_bins)
drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1573:	 
mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:543:	if 
(netdev_mc_count(priv->dev) >= priv->hw->multicast_filter_bins)
drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:633:	if 
(netdev_mc_count(priv->dev) >= priv->hw->multicast_filter_bins)
drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:679:	if 
(netdev_mc_count(priv->dev) >= priv->hw->multicast_filter_bins)
drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c:31: 
plat->multicast_filter_bins = HASH_TABLE_SIZE;
drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c:84: 
plat->multicast_filter_bins = HASH_TABLE_SIZE;
drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:98: 
plat->multicast_filter_bins = 256;
drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:365: 
mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:369:	if 
(mac->multicast_filter_bins)
drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:370:	 
mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:7240:		 
priv->hw->multicast_filter_bins =
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:7243:				 
ilog2(priv->hw->multicast_filter_bins);
drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:570: 
plat->multicast_filter_bins = HASH_TABLE_SIZE;
drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:707: 
plat->multicast_filter_bins = HASH_TABLE_SIZE;
drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c:479: 
plat_dat->multicast_filter_bins = 0;
drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:456:	int numhashregs = 
(hw->multicast_filter_bins >> 5);
drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:485:		 
(netdev_mc_count(dev) > hw->multicast_filter_bins)) {
drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:1057: 
mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:1061:	if 
(mac->multicast_filter_bins)
drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:1062:	 
mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c:43:	 
plat_dat->multicast_filter_bins = HASH_TABLE_SIZE;

and

drivers/net/ethernet/stmicro/stmmac/common.h:265:#define HASH_TABLE_SIZE 64


 From the search results, the default value of multicast_filter_bins
may be meaningful. And I think that even if some hardware does not
support this feature, it should still be overridden in its own directory.


Thanks,
Yanteng

