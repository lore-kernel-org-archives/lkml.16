Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032D881728;
	Mon,  3 Feb 2025 06:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563668; cv=none; b=ODpQqWD025AzKz1Y9QRl4pXc45Fcems3wfq+uBheXnPNF1kgc+pk6Ao8AO/xM2EuBeSBavmrUbkJOsqwnBe6El9+8LiLQSFmkmxn99+ijKp6cUkCOHG5ZuJ9pc6uMkTYl65PJAK0rfMzugFAh9NqCBQIcNB8Zk2O5V5pGUA3olQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563668; c=relaxed/simple;
	bh=BeBtFlcGY3sQnZX6dZyO4QJGjOq0kx5Sy7U1U5vftjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mu/MCB+aa0bs0tQbLbMLeHsCUQOsTKinJLLhlCprjyvVDvsreKx1ZT8dNCCUdLkeL+pypz/12TwjT+8NQhs0tkB/NMAXyowmWNKKjSFLek+83nDmu2jsUprQIoQYB4rQrmyVvxJFEF2LjDpdB+/aLY30G76joFBAeNdM/j4JVZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=N4rSMGAn; arc=none smtp.client-ip=80.12.242.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="N4rSMGAn"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id epoBtmWefA83BepoEt3aNX; Mon, 03 Feb 2025 07:19:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738563593;
	bh=UsOhWfOpgc+uO6vqHSI1XSOwHG5IdNprxkyzTXcs2k4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=N4rSMGAnK5LbeaOLWEhO3/iVpJCArVQF1WC/bgG4mPyLovuDKAD7lcx5zypq0ZWmZ
	 qG9tRC2cA8ZXDGRgrZUS7Py+iqF4hPBVwk0Frjrd3+MB+OQuOJsRWCHON/WLB2kKBp
	 QLSTQPkttxtA29w2Kjbw5vev/XVvPYsgM+3YStZKzcM6gBnLih0F08KvhZiNs5HxRq
	 axtNrJFjqw/OU9TNayvY6II67Om5rkZiGJiOqufMRq2hZ/cA/UJsed/1X4WIyOLyns
	 GxjDTMxXJ6SD5jRZI719TOI0xz6ZIb1dsGASME8LIqxUjBQdEWzY0u7AKOa4fkn7pz
	 8ZJ8F6Fsb3t1A==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 03 Feb 2025 07:19:53 +0100
X-ME-IP: 90.11.132.44
Message-ID: <3a0f8cd9-fe3e-4f07-bf9e-e1b877ffda0a@wanadoo.fr>
Date: Mon, 3 Feb 2025 07:19:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: phy: mxs: silence EPROBE_DEFER error on boot
To: dominique.martinet@atmark-techno.com
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

, err=%ld", PTR_ERR(clk) should be removed now.

The error code will already be added in the message in a human readable way.

Alignment could also be adjusted so that "can't... is still under the (.

CJ

> -		return PTR_ERR(clk);
>   	}
>   
>   	mxs_phy = devm_kzalloc(&pdev->dev, sizeof(*mxs_phy), GFP_KERNEL);
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250203-defer_usb2-ee26f66a01ad
> 
> Best regards,

