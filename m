Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2A41D7E42;
	Mon,  3 Feb 2025 06:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563883; cv=none; b=llrO+bKtx1bK3hRHjzQBYdLsOBpx4Yitw3GsZcHD3h4Z5WaD8UQTh6qBCXtcO2BimSSs6dOFhtX5Sx5My1iaHS7tDTDCEnxdaGuoc31IlAFCxCpfKC41EA+G9Gl35VKyBpB4PhoB4oOVyQ7oHiETCJcxzC1MeAI3DkOH1HE9hLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563883; c=relaxed/simple;
	bh=Lkg1l3v4kR9ktLqPTDKuXB6V13rhEjLutqoXDAQk1p4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TV020TarJv+BVivjXUtCtNSmHCcZmuYxngb0HTvKpjWpnER+CiMyJ6w4xx5gKOgwyejTHHIO1xhOS3ahtUcA1hj7TAHCBORMN/335+vxUWOTLc7C86hi08g4yLBfMYeSHZcLzWBJiq90YFw+ibDWrxmKn7zrVPGlNePrOi7rFIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=dNmYDMfn; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dNmYDMfn"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id eprhtUetmeIWleprlt7iQ8; Mon, 03 Feb 2025 07:23:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738563810;
	bh=sOdCzSN2/f05dA92HAVY6g+EQoOjt0cmreIvV2RaoMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=dNmYDMfnf8tZJagS0X3VZxyCxLgFqi7JvsDqSUFFRQGfW7sQHbwA+PnjRuDb8SZ7W
	 w6mkCF/i0ofE17RJBh2pnOiHVzL2C2Jsei+LFTiQuff575QWFrzxAgOno0N5oLGHAq
	 bvL5KckhWEOLVKqLUfYoBHE2IJL6Wce9APdHHzkxNTqcQbBB0+xjj5NhKHBjWeBsbj
	 rVCumjLL7bn44gH1L4JM6PXvvk3zdpaC+0OZ2gJRuNHrhH7nBsPgONyZ1M4+EVc5hW
	 BYe3H+RUcWj0tFzeoMM/fnFxvkgLUuLSfuTGWmAMLt766gu6YrudfIUs6l6W6WhwXv
	 i9E45wqKmlzZA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 03 Feb 2025 07:23:30 +0100
X-ME-IP: 90.11.132.44
Message-ID: <150812a1-31f7-43b1-8d85-fd097fc26c43@wanadoo.fr>
Date: Mon, 3 Feb 2025 07:23:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: phy: mxs: silence EPROBE_DEFER error on boot
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: festevam@gmail.com, gregkh@linuxfoundation.org, imx@lists.linux.dev,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org
References: <20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 03/02/2025 à 07:09, Dominique Martinet a écrit :
> Use dev_err_probe to silence EPROBE_DEFER error on boot on i.MX8ULP:
> [    0.127301] mxs_phy 29910000.usb-phy: can't get the clock, err=-517
> 
> Signed-off-by: Dominique Martinet <dominique.martinet-9u97MdVgWv6RbxiC3EKwHAC/G2K4zDHf@public.gmane.org>
> ---
>   drivers/usb/phy/phy-mxs-usb.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 7490f1798b461c39c29bb74e1e57e0a4adce2bd7..dd2b4a5633934e257e792bbd61d6748304b5e679 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -770,9 +770,8 @@ static int mxs_phy_probe(struct platform_device *pdev)
>   
>   	clk = devm_clk_get(&pdev->dev, NULL);
>   	if (IS_ERR(clk)) {
> -		dev_err(&pdev->dev,
> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
>   			"can't get the clock, err=%ld", PTR_ERR(clk));
> -		return PTR_ERR(clk);
>   	}

extra { } can also be removed now that there is only 1 line left.

CJ

>   
>   	mxs_phy = devm_kzalloc(&pdev->dev, sizeof(*mxs_phy), GFP_KERNEL);
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250203-defer_usb2-ee26f66a01ad
> 
> Best regards,

