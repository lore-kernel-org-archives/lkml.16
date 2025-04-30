Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA0B34545
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746055721; cv=none; b=GiYVfH7PjD1VfKSKr3Fj0HrKUy85GFM0ESTt39T16CflhQYTx4hV3sKDACS5E9ZtLIiWlQSkhmDbXw/RIyuDL6bXi6cJRSF8f0J/njOiw6kjqsgRKUrnGgjOYU2J+pKFGLw2yfPfVhmiElLvjapq0QeX4ZjCI+rmFNvSI6s7Ye0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746055721; c=relaxed/simple;
	bh=PxoIx7zQxtuKz6xfZTo1ZCYstat0+Z3f4etf5T2QRxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TgofS8nZrhRIp0pRJ4kbt/OFwRzPs7sH9Hl6r2wx739kCgYXAplFM7f2ggpV0UvldRB7vwEt9nrDdz5xKDGjfg8TrTRIOMouMadLRuwTLlqAWcQgoJN2DYRd1rguJCoPydsYUx3pFQ+yuFK43bX65t0fS0rkiMQRX83LoeCqkQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YqFvapUz; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YqFvapUz"
Message-ID: <88d7863d-bf2f-4e32-b480-ae8d62df4818@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746055716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TRggesvNp3d9TVOPaeFrl4a11T3PiSAiLy1a2gUNhlk=;
	b=YqFvapUzsdqozV9S/pHHi8dmrKHVqIy8veMFQ1mo/Ci1MtXmIsRw3hBSjSnJ9Ctjl6Onuo
	dKCstYOADgCAUXVL5F/pE4wvTpERB66h3HBqxE8taeeSw8dKf269Im97qT/n57xlb3Vnvf
	c7Og95xDqM3mO0qXaCGBDzNZD7AwZRQ=
Date: Thu, 1 May 2025 00:28:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net 4/4] net: hns3: defer calling ptp_clock_register()
To: Jijie Shao <shaojijie@huawei.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org
Cc: shenjian15@huawei.com, wangpeiyang1@huawei.com, liuyonglong@huawei.com,
 chenhao418@huawei.com, jonathan.cameron@huawei.com,
 shameerali.kolothum.thodi@huawei.com, salil.mehta@huawei.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250430093052.2400464-1-shaojijie@huawei.com>
 <20250430093052.2400464-5-shaojijie@huawei.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250430093052.2400464-5-shaojijie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 30/04/2025 10:30, Jijie Shao wrote:
> From: Jian Shen <shenjian15@huawei.com>
> 
> Currently the ptp_clock_register() is called before relative
> ptp resource ready. It may cause unexpected result when upper
> layer called the ptp API during the timewindow. Fix it by
> moving the ptp_clock_register() to the function end.
> 
> Fixes: 0bf5eb788512 ("net: hns3: add support for PTP")
> Signed-off-by: Jian Shen <shenjian15@huawei.com>
> Signed-off-by: Jijie Shao <shaojijie@huawei.com>
> ---
>   .../net/ethernet/hisilicon/hns3/hns3pf/hclge_ptp.c  | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ptp.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ptp.c
> index 59cc9221185f..ec581d4b696f 100644
> --- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ptp.c
> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ptp.c
> @@ -440,6 +440,13 @@ static int hclge_ptp_create_clock(struct hclge_dev *hdev)
>   	ptp->info.settime64 = hclge_ptp_settime;
>   
>   	ptp->info.n_alarm = 0;
> +
> +	spin_lock_init(&ptp->lock);
> +	ptp->io_base = hdev->hw.hw.io_base + HCLGE_PTP_REG_OFFSET;
> +	ptp->ts_cfg.rx_filter = HWTSTAMP_FILTER_NONE;
> +	ptp->ts_cfg.tx_type = HWTSTAMP_TX_OFF;
> +	hdev->ptp = ptp;
> +
>   	ptp->clock = ptp_clock_register(&ptp->info, &hdev->pdev->dev);
>   	if (IS_ERR(ptp->clock)) {
>   		dev_err(&hdev->pdev->dev,
> @@ -451,12 +458,6 @@ static int hclge_ptp_create_clock(struct hclge_dev *hdev)
>   		return -ENODEV;
>   	}
>   
> -	spin_lock_init(&ptp->lock);
> -	ptp->io_base = hdev->hw.hw.io_base + HCLGE_PTP_REG_OFFSET;
> -	ptp->ts_cfg.rx_filter = HWTSTAMP_FILTER_NONE;
> -	ptp->ts_cfg.tx_type = HWTSTAMP_TX_OFF;
> -	hdev->ptp = ptp;
> -
>   	return 0;
>   }
>   

LGTM,
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
