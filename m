Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B3207E1D
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682422; cv=none; b=Q2yVuMVAYA7ch0/7kV1CGCaQPd5ym0Kg8iSa87A9Va1KegntX7IkKfSu4GgAaGCxVF/voFjfmU78+v5j+utv5s7ZwwOK332FsCkEL+qyR6yaLQ33z4ST9GE2j0wWb+AH1Nx5tTLuCv7dS2ooC8SuYs/hGA3zs/PFex6bUGNg2ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682422; c=relaxed/simple;
	bh=XN2zIQ/qSTlrLGMHasf9KFBP82CB5Qxd4jFmsQWkasM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oM58aW/UdkdZ96cY6drMAa9ijzEGQ5yQN7/dtKCRtdSGVEIVFPlT/rVRowgmwJ4IRwhglRAul39XepTDULyofQeMN1tiCC9E8QbUAdGCq3dynIK9+rlYoISI4LwqHUkc6fr1slSUeHqKABxgquYloRMFASGsIRCFl6CbbDbDFCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZL+vdiLp; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZL+vdiLp"
Message-ID: <0bf5e1db-8707-4039-81d7-2fe4530d705b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738682417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1eRSq+ezqI1pr3KEhVACx6xjJT9U2rvI4zSK1LxxtI0=;
	b=ZL+vdiLpXlpvURCzNoMMtSlAicSh38yluEhKVmPV9+qPj72JFUDpR5jWXyOOtn8HJWECUJ
	LYJRHuIdIY6bbS9nzMDM1rqgyE/XVj4MHxTfn/QSZldliQUpR7Hj8t7896xUMf0pwM1LhD
	AZWwOtFKOf9IO4fqmHFL/wvhrMSIR7s=
Date: Tue, 4 Feb 2025 15:20:13 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] net: e1000e: convert to ndo_hwtstamp_get() and
 ndo_hwtstamp_set()
To: Piotr Wejman <piotrwejman90@gmail.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250202170839.47375-1-piotrwejman90@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250202170839.47375-1-piotrwejman90@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 02/02/2025 17:08, Piotr Wejman wrote:
> Update the driver to the new hw timestamping API.
> 
> Signed-off-by: Piotr Wejman <piotrwejman90@gmail.com>
> ---
>   drivers/net/ethernet/intel/e1000e/e1000.h  |  2 +-
>   drivers/net/ethernet/intel/e1000e/netdev.c | 52 ++++++++--------------
>   2 files changed, 20 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/e1000e/e1000.h b/drivers/net/ethernet/intel/e1000e/e1000.h
> index ba9c19e6994c..952898151565 100644
> --- a/drivers/net/ethernet/intel/e1000e/e1000.h
> +++ b/drivers/net/ethernet/intel/e1000e/e1000.h
> @@ -319,7 +319,7 @@ struct e1000_adapter {
>   	u16 tx_ring_count;
>   	u16 rx_ring_count;
>   
> -	struct hwtstamp_config hwtstamp_config;
> +	struct kernel_hwtstamp_config hwtstamp_config;
>   	struct delayed_work systim_overflow_work;
>   	struct sk_buff *tx_hwtstamp_skb;
>   	unsigned long tx_hwtstamp_start;
> diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
> index 286155efcedf..15f0794afddd 100644
> --- a/drivers/net/ethernet/intel/e1000e/netdev.c
> +++ b/drivers/net/ethernet/intel/e1000e/netdev.c
> @@ -3587,7 +3587,7 @@ s32 e1000e_get_base_timinca(struct e1000_adapter *adapter, u32 *timinca)
>    * exception of "all V2 events regardless of level 2 or 4".
>    **/
>   static int e1000e_config_hwtstamp(struct e1000_adapter *adapter,
> -				  struct hwtstamp_config *config)
> +				  struct kernel_hwtstamp_config *config)
>   {
>   	struct e1000_hw *hw = &adapter->hw;
>   	u32 tsync_tx_ctl = E1000_TSYNCTXCTL_ENABLED;
> @@ -6140,7 +6140,8 @@ static int e1000_mii_ioctl(struct net_device *netdev, struct ifreq *ifr,
>   /**
>    * e1000e_hwtstamp_set - control hardware time stamping
>    * @netdev: network interface device structure
> - * @ifr: interface request
> + * @config: timestamp configuration
> + * @extack: netlink extended ACK report
>    *
>    * Outgoing time stamping can be enabled and disabled. Play nice and
>    * disable it when requested, although it shouldn't cause any overhead
> @@ -6153,20 +6154,18 @@ static int e1000_mii_ioctl(struct net_device *netdev, struct ifreq *ifr,
>    * specified. Matching the kind of event packet is not supported, with the
>    * exception of "all V2 events regardless of level 2 or 4".
>    **/
> -static int e1000e_hwtstamp_set(struct net_device *netdev, struct ifreq *ifr)
> +static int e1000e_hwtstamp_set(struct net_device *netdev,
> +			       struct kernel_hwtstamp_config *config,
> +			       struct netlink_ext_ack *extack)
>   {
>   	struct e1000_adapter *adapter = netdev_priv(netdev);
> -	struct hwtstamp_config config;
>   	int ret_val;
>   
> -	if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
> -		return -EFAULT;
> -
> -	ret_val = e1000e_config_hwtstamp(adapter, &config);
> +	ret_val = e1000e_config_hwtstamp(adapter, config);
>   	if (ret_val)
>   		return ret_val;

it would be great to extend e1000e_config_hwtstamp() to provide some
information regarding error to extack - that's one of the benefits of
these new ndo's.

>   
> -	switch (config.rx_filter) {
> +	switch (config->rx_filter) {
>   	case HWTSTAMP_FILTER_PTP_V2_L4_SYNC:
>   	case HWTSTAMP_FILTER_PTP_V2_L2_SYNC:
>   	case HWTSTAMP_FILTER_PTP_V2_SYNC:
> @@ -6178,38 +6177,23 @@ static int e1000e_hwtstamp_set(struct net_device *netdev, struct ifreq *ifr)
>   		 * by hardware so notify the caller the requested packets plus
>   		 * some others are time stamped.
>   		 */
> -		config.rx_filter = HWTSTAMP_FILTER_SOME;
> +		config->rx_filter = HWTSTAMP_FILTER_SOME;
>   		break;
>   	default:
>   		break;
>   	}
>   
> -	return copy_to_user(ifr->ifr_data, &config,
> -			    sizeof(config)) ? -EFAULT : 0;
> +	return 0;
>   }
>   
> -static int e1000e_hwtstamp_get(struct net_device *netdev, struct ifreq *ifr)
> +static int e1000e_hwtstamp_get(struct net_device *netdev,
> +			       struct kernel_hwtstamp_config *kernel_config)
>   {
>   	struct e1000_adapter *adapter = netdev_priv(netdev);
>   
> -	return copy_to_user(ifr->ifr_data, &adapter->hwtstamp_config,
> -			    sizeof(adapter->hwtstamp_config)) ? -EFAULT : 0;
> -}
> +	*kernel_config = adapter->hwtstamp_config;
>   
> -static int e1000_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
> -{
> -	switch (cmd) {
> -	case SIOCGMIIPHY:
> -	case SIOCGMIIREG:
> -	case SIOCSMIIREG:
> -		return e1000_mii_ioctl(netdev, ifr, cmd);
> -	case SIOCSHWTSTAMP:
> -		return e1000e_hwtstamp_set(netdev, ifr);
> -	case SIOCGHWTSTAMP:
> -		return e1000e_hwtstamp_get(netdev, ifr);
> -	default:
> -		return -EOPNOTSUPP;
> -	}
> +	return 0;
>   }
>   
>   static int e1000_init_phy_wakeup(struct e1000_adapter *adapter, u32 wufc)
> @@ -7337,7 +7321,7 @@ static const struct net_device_ops e1000e_netdev_ops = {
>   	.ndo_set_rx_mode	= e1000e_set_rx_mode,
>   	.ndo_set_mac_address	= e1000_set_mac,
>   	.ndo_change_mtu		= e1000_change_mtu,
> -	.ndo_eth_ioctl		= e1000_ioctl,
> +	.ndo_eth_ioctl		= e1000_mii_ioctl,
>   	.ndo_tx_timeout		= e1000_tx_timeout,
>   	.ndo_validate_addr	= eth_validate_addr,
>   
> @@ -7346,9 +7330,11 @@ static const struct net_device_ops e1000e_netdev_ops = {
>   #ifdef CONFIG_NET_POLL_CONTROLLER
>   	.ndo_poll_controller	= e1000_netpoll,
>   #endif
> -	.ndo_set_features = e1000_set_features,
> -	.ndo_fix_features = e1000_fix_features,
> +	.ndo_set_features	= e1000_set_features,
> +	.ndo_fix_features	= e1000_fix_features,

nit: If this alignment piece is intended then it worth mentioning in the
commit message.

>   	.ndo_features_check	= passthru_features_check,
> +	.ndo_hwtstamp_get	= e1000e_hwtstamp_get,
> +	.ndo_hwtstamp_set	= e1000e_hwtstamp_set,
>   };
>   
>   /**


