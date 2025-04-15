Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A18B1A0BF1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732105; cv=none; b=JoEM0vySFybz8Bq1fLINQZCTGm+FnPTYsqLQ/+CpUlOsXAAKGqskjgZNikUZVBILJRPhjw3A66t7j/75IX2x7pS4wS5Imojntyt1uNJ+pjJGGFaAHUZnRexFZP9mguP07fsD2Mvg0FkYz+XHA5kFndK1716EmIV1QAte3dK06IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732105; c=relaxed/simple;
	bh=5W7pWoWLfonhFSWc7gAHNON6DGMHOUmvbZpPK68AvRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKSrIXwxfOOuzoDZSERFuVXISs/6autrQxf1u9wzKk+YdQYyh543wj6MnX/RECP/N6PJujzUJ9+CrNRLwBLwDvrU0PU6RLYWouYRnahobHmLIuHvkcut20EPiOfLIyN7+9mHJTuBj7aISMF6fQW4lAMxRsCyTqIQcPhvYgtmGaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNYCC25D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNYCC25D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5426C4CEEB;
	Tue, 15 Apr 2025 15:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744732104;
	bh=5W7pWoWLfonhFSWc7gAHNON6DGMHOUmvbZpPK68AvRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DNYCC25DA/L824m7BTmPCyBNa5sCehJ0OhhTCOrwWivutgeHYMgJa/7HOTBz9FGvJ
	 /s6CfVA8jERV3MDGNLAfHhjhsKiR95W97cvjqydu6utjykBRwH/ybskvetkGlrBQ14
	 pZjqAjQwsQKwh50po+SO3qeen/RhJ0eXaG3uNjN71sqdBaBUxUD0YriC4RZ4Q8mSOv
	 681lQS+bkd1QOs15ktWuuty/FB1YH4Z3xdZKPy46RdI3FFz4WhJeiws4C03QQYiRYS
	 aNlNXROs7E1153QbIgmAJfqiEDhFvfT+TT5Y65YfT+eGTP4qteHCyDudEqzlRVMBdS
	 HmeZ2JDSgC1Hw==
Date: Tue, 15 Apr 2025 16:48:20 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Karel Balej <balejk@matfyz.cz>, Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] mfd: max8925: Fix wakeup source leaks on device
 unbind
Message-ID: <20250415154820.GX372032@google.com>
References: <20250406-mfd-device-wakekup-leak-v1-0-318e14bdba0a@linaro.org>
 <20250406-mfd-device-wakekup-leak-v1-6-318e14bdba0a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250406-mfd-device-wakekup-leak-v1-6-318e14bdba0a@linaro.org>

On Sun, 06 Apr 2025, Krzysztof Kozlowski wrote:

> Device can be unbound, so driver must also release memory for the wakeup
> source.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/mfd/max8925-i2c.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/max8925-i2c.c b/drivers/mfd/max8925-i2c.c
> index 556aea7ec0a0473edc9291cae0c82fe9b4ecb346..ab19ff0c786732be53e58a0162d2658650d88f47 100644
> --- a/drivers/mfd/max8925-i2c.c
> +++ b/drivers/mfd/max8925-i2c.c
> @@ -201,6 +201,7 @@ static void max8925_remove(struct i2c_client *client)
>  	struct max8925_chip *chip = i2c_get_clientdata(client);
>  
>  	max8925_device_exit(chip);
> +	device_init_wakeup(&client->dev, false);

Why not devm_* instead?

>  	i2c_unregister_device(chip->adc);
>  	i2c_unregister_device(chip->rtc);
>  }
> 
> -- 
> 2.45.2
> 

-- 
Lee Jones [李琼斯]
