Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94276207DE2
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 12:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749299341; cv=none; b=E24n/te7Snae9Gq1F98Cb2Mpq3KDt0hnbZKNWguu+vKeVTx4LFz69Ro3kjHZVhaj1Z5CnD6dDzjlotBm/oqYD3mMS1ga02UhDtLhlsjOleJMimpKdf05tTk39IkezeawVvFaDB9v8jmgCVo+gmVn0B1VcCVyli0//ymj01n06bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749299341; c=relaxed/simple;
	bh=mOYIXQSgfPhZh9fXOpojbPonzPyR2relJWId2pZWqTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLezveyrIMiAjmsjolpWmRwfnxwjCovun3l5vyWPrkgwcd29OBoELqiyMWX0hDGvikJ1dukvq3jnas3drURCZlAlWfQQVHjfn9SwKnGkA9w+I7sDs1nYqEW1DKJs8xIo1jGotG1mh/cqXYqlA3dFbeIbCqe4Cb+2HFWAged1fSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qRNwsGkA; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qRNwsGkA"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so2239387a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749299338; x=1749904138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pFcvezHtTKFU/yLY9c/XHMI/P40/ElaQdRi+0Qte8ys=;
        b=qRNwsGkAAOjiLWji54gDHgxDd1zPZBy78zuuxdZ1lkGq7H0oRYkClGY8HPJjIwicl7
         EbhKuG2dZ++gUw6xP4n3B/nenvbFG+70UrNmJ+fsgN1i27ID21w3wEORwjl1T5pchhOm
         9scpiBRrUCGVGJpTrI4qFnhlCYxSHdWxDVUyyeMaXyRQO6Sz85gVIgAAoMRzt0QShIO/
         +uMmHhSxDEP4ngNQHH1tjL5tGq9Ma8YK1Vxh57GO+0DghrEharWtI7QSIikXMuiMR6qe
         50FiC4X13DS5l00V/SkGbCt829Bux15sF35WPkzCrPXb2gxVKLPa7rFkvZjWgQTsh2Ua
         5FGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749299338; x=1749904138;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pFcvezHtTKFU/yLY9c/XHMI/P40/ElaQdRi+0Qte8ys=;
        b=Vh/guTFQiv5JezquguZGzUBtUXF+Twnjnjj0WE32uKAYtpcjKI/IvwCng+Z2593wlw
         P0VivzV6iFkbWHLZYwTfgNHrisUcfxLleH092I3p30zG7CYuzD8k2W809UBl/MUNfumY
         4SZ+iBvGSUswr4/TgX4oYSHJz+4f/DULrMXJCsW+/Cyt7pRJX7/Siran7JSjlNbpyh27
         Dwtob4J+C1YiEHBDQKdTauuc7hSdBq7GpLApTRuw+c29Y0q95z02diJB1Q/PiINcf876
         IkH9CBpFJpgNPUIlPsmjpgCC9LtNf5KtmbmnYN5QLJUTds2fjIK2DipBFJCKDM0/rxzr
         +1aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYk/pz8gBBgdfmFfex6ozbh/N1ppQJMHVyuCc1P+TXfZbfwv6nhNbRt+U/RcBU4XffB05fnBupWqsjuxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyopz/9bOoWAKWWHq5woTQ8JJu+uTD4XoqSZMu5ft+N2HdbRdhD
	z9II0XY+FZPkhUuYFSR7DByDh6Ue7Ax0L2gsaDuR0LTGNdlpa67ksz4gmFbB7F1aDDg=
X-Gm-Gg: ASbGncsGOwlr/cv43UciZR5K1ziaK3hCLx2sGrQCm60yE46QugJUviyVjVbJJ6qNwRi
	VUS2Nr8hAh6+hfJkKY9OsPYSu0NKtHO/XmSVieVncCqmBEq5LqeJJQXo0a+Tgi/sA53WRIhD6/o
	D0Z26Zu7kMkQ71/rmhmPCJD5K2InFXt/tECzZq+9QqRaVvs2uvCHfA3dyW+m0yFT2PnI1CnuSC3
	CmR+IXCliji4GQmB6lNgDhKz1rQrz+v8UU6Gh1w17CrcT/UsxsweukrHxrITgMi6oAN/mhnLOAL
	/lja4euJfCI5RW4yl0VA3B+oMsEkZfHL0b59J17aKiKz2Dw4IDioRXVmT4gX
X-Google-Smtp-Source: AGHT+IFDAnUmiVsyjfygehYUr8ASHgYoLs98lcg7K2XPROZpb83wxSo3Nj+DR+TRSNXc7a0sWKTb0g==
X-Received: by 2002:a17:907:1c8e:b0:ad5:27b6:7fd1 with SMTP id a640c23a62f3a-ade1a9ed9a1mr624659966b.17.1749299337801;
        Sat, 07 Jun 2025 05:28:57 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38a06sm267601466b.119.2025.06.07.05.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 05:28:57 -0700 (PDT)
Message-ID: <07d527e5-32d9-4e8c-ad19-92f5a722bfd5@tuxon.dev>
Date: Sat, 7 Jun 2025 15:28:56 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: macb: Add shutdown operation support
To: Abin Joseph <abin.joseph@amd.com>, nicolas.ferre@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Cc: git@amd.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250607075713.1829282-1-abin.joseph@amd.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250607075713.1829282-1-abin.joseph@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Abin,

On 07.06.2025 10:57, Abin Joseph wrote:
> Implement the shutdown hook to ensure clean and complete deactivation of
> MACB controller. The shutdown sequence is protected with 'rtnl_lock()'
> to serialize access and prevent race conditions while detaching and
> closing the network device. This ensure a safe transition when the Kexec
> utility calls the shutdown hook, facilitating seamless loading and
> booting of a new kernel from the currently running one.
> 
> Signed-off-by: Abin Joseph <abin.joseph@amd.com>
> ---
> 
> Changes in v2:
> Update the commit description
> Update the code to call the close only when admin is up
> 
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index e1e8bd2ec155..5bb08f518d54 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -5650,6 +5650,19 @@ static int __maybe_unused macb_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +static void macb_shutdown(struct platform_device *pdev)
> +{
> +	struct net_device *netdev = platform_get_drvdata(pdev);
> +
> +	rtnl_lock();
> +	netif_device_detach(netdev);
> +
> +	if (netif_running(netdev))
> +		dev_close(netdev);

Apart from closing the interface should we also invoke the remove?

Consider the new loaded kernel will not use this interface and some
hardware resources may remain on while not used by the newly loaded kernel.

E.g., there is this code in macb_remove():

		if (!pm_runtime_suspended(&pdev->dev)) {
			macb_clks_disable(bp->pclk, bp->hclk, bp->tx_clk,
					  bp->rx_clk, bp->tsu_clk);
			pm_runtime_set_suspended(&pdev->dev);
		}


Thank you,
Claudiu

> +
> +	rtnl_unlock();
> +}
> +
>  static const struct dev_pm_ops macb_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(macb_suspend, macb_resume)
>  	SET_RUNTIME_PM_OPS(macb_runtime_suspend, macb_runtime_resume, NULL)
> @@ -5663,6 +5676,7 @@ static struct platform_driver macb_driver = {
>  		.of_match_table	= of_match_ptr(macb_dt_ids),
>  		.pm	= &macb_pm_ops,
>  	},
> +	.shutdown	= macb_shutdown,
>  };
>  
>  module_platform_driver(macb_driver);

