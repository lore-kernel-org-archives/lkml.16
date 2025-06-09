Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17778219EB;
	Mon,  9 Jun 2025 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749474357; cv=none; b=Ue7IG2i6t9YE2z1HiZU6IbHvW1rGOZ11JAodWhZ/5rMs0difq5YHgElgdAmKdywBJm7CyN/WJUq9lZlaE3ikAFGJkWKiQOG2V/qfp57GBuTGpr+OTRGJ5kIvUB76V1RY88+Lk4pqbdiIq5rwvG25uYjrpbhHpYJ6hM/E3Pjq6fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749474357; c=relaxed/simple;
	bh=AB9q5JN/Bo1JWbTAE29sSvZ2m6R4X8l/9vVB5CgdFj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+sPI1JY/LddZBRxXDlILNsfXmEuEK5XC5riJe1/VU24R78R5WrWQcgirrCKw3OjqBPKN+fZxhmIDxXq8tIdSQB2HX0pWo32yY1UKzu6AWWfWc+5zm4crvzVj5FeckpDZaoWsS5wA1laHe7T87h0LBzGKaEPCSuaIEQydMj5DhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNWz/o7+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNWz/o7+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B213C4CEEB;
	Mon,  9 Jun 2025 13:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749474355;
	bh=AB9q5JN/Bo1JWbTAE29sSvZ2m6R4X8l/9vVB5CgdFj8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dNWz/o7+p3zc5+UeGMDS3ZXhotkLkx/idQ7+Kz69BzsN2hDEV/DPhgTqupy76QjAq
	 ncapH4vI9BbTHoARf8z/hwz6zkhS+eU7CIoU7PwNT7yBGJyeUrROIIFt2zV5fhvYVv
	 Yn6DdK+L28AMAtggs5M/MuB6zWJJgrldh6usn8L/Yx8PA8dU37JOJ0/eVqd2qV8m1Q
	 4/KLFpoY1yRsTDweLZAP3o2vJWlrBekzZwe2ve/yYnF3IUrhWvi6wniHW1jZ1FzR/d
	 WNqqal8ZBzI1CSLkZL0QF20G2OKkZGyul87Tm36cmW155278zKbZNGV5tl4sUgXg2j
	 GS4+Hjr+a9aUg==
Message-ID: <7b89e1b1-f258-4311-a276-c6a96101b1c6@kernel.org>
Date: Mon, 9 Jun 2025 15:05:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Use
 devm_pinctrl_register_mappings()
To: Thomas Richard <thomas.richard@bootlin.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250609-lenovo-yoga-tab2-pro-1380-fastcharger-devm-pinctrl-register-mappings-v1-1-fb601f2b80f6@bootlin.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250609-lenovo-yoga-tab2-pro-1380-fastcharger-devm-pinctrl-register-mappings-v1-1-fb601f2b80f6@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Jun-25 2:34 PM, Thomas Richard wrote:
> Use devm_pinctrl_register_mappings(), so the core automatically unregisters
> the pinctrl mappings. It makes the code easier to read.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans


> ---
> Compile tested only.
> ---
>  .../x86/lenovo-yoga-tab2-pro-1380-fastcharger.c    | 33 ++++++++--------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> index 25933cd018d1..d4e767822ac7 100644
> --- a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> +++ b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> @@ -240,30 +240,25 @@ static int yt2_1380_fc_pdev_probe(struct platform_device *pdev)
>  	int ret;
>  
>  	/* Register pinctrl mappings for setting the UART3 pins mode */
> -	ret = pinctrl_register_mappings(yt2_1380_fc_pinctrl_map,
> -					ARRAY_SIZE(yt2_1380_fc_pinctrl_map));
> +	ret = devm_pinctrl_register_mappings(&pdev->dev, yt2_1380_fc_pinctrl_map,
> +					     ARRAY_SIZE(yt2_1380_fc_pinctrl_map));
>  	if (ret)
>  		return ret;
>  
>  	/* And create the serdev to talk to the charger over the UART3 pins */
>  	ctrl_dev = get_serdev_controller("PNP0501", "1", 0, YT2_1380_FC_SERDEV_CTRL);
> -	if (IS_ERR(ctrl_dev)) {
> -		ret = PTR_ERR(ctrl_dev);
> -		goto out_pinctrl_unregister_mappings;
> -	}
> +	if (IS_ERR(ctrl_dev))
> +		return PTR_ERR(ctrl_dev);
>  
>  	serdev = serdev_device_alloc(to_serdev_controller(ctrl_dev));
>  	put_device(ctrl_dev);
> -	if (!serdev) {
> -		ret = -ENOMEM;
> -		goto out_pinctrl_unregister_mappings;
> -	}
> +	if (!serdev)
> +		return -ENOMEM;
>  
>  	ret = serdev_device_add(serdev);
>  	if (ret) {
> -		dev_err_probe(&pdev->dev, ret, "adding serdev\n");
>  		serdev_device_put(serdev);
> -		goto out_pinctrl_unregister_mappings;
> +		return dev_err_probe(&pdev->dev, ret, "adding serdev\n");
>  	}
>  
>  	/*
> @@ -273,20 +268,15 @@ static int yt2_1380_fc_pdev_probe(struct platform_device *pdev)
>  	ret = device_driver_attach(&yt2_1380_fc_serdev_driver.driver, &serdev->dev);
>  	if (ret) {
>  		/* device_driver_attach() maps EPROBE_DEFER to EAGAIN, map it back */
> -		ret = (ret == -EAGAIN) ? -EPROBE_DEFER : ret;
> -		dev_err_probe(&pdev->dev, ret, "attaching serdev driver\n");
> -		goto out_serdev_device_remove;
> +		serdev_device_remove(serdev);
> +		return dev_err_probe(&pdev->dev,
> +				     (ret == -EAGAIN) ? -EPROBE_DEFER : ret,
> +				     "attaching serdev driver\n");
>  	}
>  
>  	/* So that yt2_1380_fc_pdev_remove() can remove the serdev */
>  	platform_set_drvdata(pdev, serdev);
>  	return 0;
> -
> -out_serdev_device_remove:
> -	serdev_device_remove(serdev);
> -out_pinctrl_unregister_mappings:
> -	pinctrl_unregister_mappings(yt2_1380_fc_pinctrl_map);
> -	return ret;
>  }
>  
>  static void yt2_1380_fc_pdev_remove(struct platform_device *pdev)
> @@ -294,7 +284,6 @@ static void yt2_1380_fc_pdev_remove(struct platform_device *pdev)
>  	struct serdev_device *serdev = platform_get_drvdata(pdev);
>  
>  	serdev_device_remove(serdev);
> -	pinctrl_unregister_mappings(yt2_1380_fc_pinctrl_map);
>  }
>  
>  static struct platform_driver yt2_1380_fc_pdev_driver = {
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250609-lenovo-yoga-tab2-pro-1380-fastcharger-devm-pinctrl-register-mappings-26fa329badee
> 
> Best regards,

