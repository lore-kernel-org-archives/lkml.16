Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A381C5F10
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750999080; cv=none; b=s/hZxeR1pdizFhXBMdTzwFFOD8gRBUF8EAaiFO2OBOAwBNfTp6QtI7cB5mZw4/NFvxtRsrxSi/glBZ7gA7vQ7AiIkZNRlmJfQBM/t/ydV+F2kjwa/V/8h0YRcTemZYh9gHJ4wouIEnF9BGfdhTGFNHbtUwjfJ4cIWefhfU36qPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750999080; c=relaxed/simple;
	bh=lbDfR0M6F2JbnvzyAx2Qg3otQW0pIDhNNDg/RQfomBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCD4lYKHMr7O/AMihN4r65dQLVc4pQkmJQkAD/ar9ac2q8JUOPWx0WBwvg7HWeTBbKe603leScU8RJ7DVOiH60bFQgM5VtPn5Ol/Ee4CpDJsFlayxStazmNdMu51N/EF1sOHWVvfU6qhs1qGqe89yPyXCshwyJjOYQfCin4s3PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tpHtyE/4; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tpHtyE/4"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2e95ab2704fso1203996fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750999077; x=1751603877; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TyE67c3xK1K5sXtasghRqBYlwpIPHXfPSwBOJU15tFo=;
        b=tpHtyE/4ufaQ7GLgF8HZCb9UTCJp/OZIo882op8rDmxEmcxIt15L/vvPepq8a6MZh2
         JYrBet5tU2XCvH7f8x1X4aJRq2ra97ctXutFumWsi/OwwD56i+EkhC0oVdG4OfqaRPog
         iZI2yBdEPZZAYuDwM2rDBF5KEpQUIWxpGUc3m/3SmIj0klSsfOYqrbjc6aFpBFte4U8H
         L/NjT/5CFQ62gCx1xTHaLdKnolrxQ0B4iyZtQ62s5iSMiMXgRUFkoSKXblkbACGT7d3r
         DphKGkQ2cbrPqTYnL72oRxLu4anX+ryIb+b0Bs2PZaaqv406DDC98nhdUo1vzb43NlER
         fAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750999077; x=1751603877;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TyE67c3xK1K5sXtasghRqBYlwpIPHXfPSwBOJU15tFo=;
        b=ancfUJxriuneeuyjAdynrcrEQoeB1d7e0HRMAdPnp064pIuO56kpbR6OHgFpOt9roP
         pMOkq2S70+Ay5HHwRWKVOjlj/GpPTOmjZBmLkBGml8R5Q+LmgiOOBwrFcpZCiqdOx+PE
         zCPbtvzSVZXa4St7u7Ekz+h6X6/zQTfA6GqHk/psC8QlxdwlIUDW6vSdZrfNGTh/R2Sd
         5hvy6HGVrcie6zCllsxOK5sn+Ll25cnVJDanSXg7Ado/Dcf3yLiuyB9RqQ2g18UPy683
         DdfeCrPKAGfKbUsKy4wRU4Xvh3OBnEndktzr4oZRLvxCWl+xKkSH02WwyTU659AXUmz6
         r8Hw==
X-Forwarded-Encrypted: i=1; AJvYcCW0NgXx6EQdIiJhfcTEGXZtu7ZqZU5QUNEyYHamod4mShG8hRcAW/MgDy8N41Zik6P7KfgHapUtJRHn2FM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoKLLajBC/Ysl0z1OePW9bx2ywT2hs6QZUiTFnyR4m8e7KRy8K
	8pbHev34J/0eq1gqfXkz/Npj+JX06lZyXo5aTZ9WOvCgKn311rCTvkovx31o+OZ5iiE=
X-Gm-Gg: ASbGncuDBkcUJVedKvrJlipLzxvUES0fWRJl+J3YgOBc2URNwLTwvmpkqlmCKiKnWuN
	iyTorYDOFvkNMHMSergxxjzAzdZEJaY2CyX6mIZGHcKHHrLKeFxn7ZSId5grPOjRvw0hEIXYVOm
	5bgbAA1DyIgDv/yDEJNoSRf5goB7BSGHKxPJEPwglsujsRsUPC8Pd/9/jASOdseeVNi6NYiemoY
	Ebqh84+lbmK4JlzO4wnXicIg5tBJRA/hQzk7+JlBpVZhJ7HZ8Van66PHTnRyeBSJom7RxPPV65r
	GZcNSP1KF+lct6ZApXfr3PfaoYgGrLooTHfk364dPXH4ef2gm/2iKO/EZxgkNwW09joSRg==
X-Google-Smtp-Source: AGHT+IHo2Jt+2kbCf9W2+f8umYHBvpInEdU81oNGE0Zmzd1jhDArDCGS8XYCy9XsRrBNkXVAklM5cg==
X-Received: by 2002:a05:6870:d8cd:b0:29d:c764:f873 with SMTP id 586e51a60fabf-2efed877494mr1037657fac.31.1750999077563;
        Thu, 26 Jun 2025 21:37:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2146:7e21:238a:e0ed])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2efd512f0cdsm707303fac.46.2025.06.26.21.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 21:37:56 -0700 (PDT)
Date: Thu, 26 Jun 2025 23:37:53 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: khairul.anuar.romli@altera.com
Cc: Mark Brown <broonie@kernel.org>,
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Khairul Anuar Romli <khairulanuar.romli@altera.com>
Subject: Re: [PATCH v3 1/1] spi: spi-cadence-quadspi: Fix pm runtime unbalance
Message-ID: <ab51dfce-a7d1-4eb3-b469-af35529dfbbb@sabinyo.mountain>
References: <cover.1749601877.git.khairul.anuar.romli@altera.com>
 <4e7a4b8aba300e629b45a04f90bddf665fbdb335.1749601877.git.khairul.anuar.romli@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e7a4b8aba300e629b45a04f90bddf665fbdb335.1749601877.git.khairul.anuar.romli@altera.com>

On Mon, Jun 16, 2025 at 09:13:53AM +0800, khairul.anuar.romli@altera.com wrote:
> From: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> 
> Having PM put sync in remove function is causing PM underflow during
> remove operation. This is caused by the function, runtime_pm_get_sync,
> not being called anywhere during the op. Ensure that calls to
> pm_runtime_enable()/pm_runtime_disable() and
> pm_runtime_get_sync()/pm_runtime_put_sync() match.
> 
> echo 108d2000.spi > /sys/bus/platform/drivers/cadence-qspi/unbind
> [   49.644256] Deleting MTD partitions on "108d2000.spi.0":
> [   49.649575] Deleting u-boot MTD partition
> [   49.684087] Deleting root MTD partition
> [   49.724188] cadence-qspi 108d2000.spi: Runtime PM usage count underflow!
> 
> Continuous bind/unbind will result in an "Unbalanced pm_runtime_enable" error.
> Subsequent unbind attempts will return a "No such device" error, while bind
> attempts will return a "Resource temporarily unavailable" error.
> 
> [   47.592434] cadence-qspi 108d2000.spi: Runtime PM usage count underflow!
> [   49.592233] cadence-qspi 108d2000.spi: detected FIFO depth (1024) different from config (128)
> [   53.232309] cadence-qspi 108d2000.spi: Runtime PM usage count underflow!
> [   55.828550] cadence-qspi 108d2000.spi: detected FIFO depth (1024) different from config (128)
> [   57.940627] cadence-qspi 108d2000.spi: Runtime PM usage count underflow!
> [   59.912490] cadence-qspi 108d2000.spi: detected FIFO depth (1024) different from config (128)
> [   61.876243] cadence-qspi 108d2000.spi: Runtime PM usage count underflow!
> [   61.883000] platform 108d2000.spi: Unbalanced pm_runtime_enable!
> [  532.012270] cadence-qspi 108d2000.spi: probe with driver cadence-qspi failed1
> 
> Also, change clk_disable_unprepare() to clk_disable() since continuous
> bind and unbind operations will trigger a warning indicating that the clock is
> already unprepared.
> 
> Fixes: 4892b374c9b7 ("mtd: spi-nor: cadence-quadspi: Add runtime PM support")
> cc: stable@vger.kernel.org # 6.6+
> Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
> Changes in v3:
>     - v2 was sent without a "Changes in v2" section.
> 
> Changes in v2:
>     - Remove the runtime_pm variable from the struct, as it’s not needed for the fix.
> ---
>  drivers/spi/spi-cadence-quadspi.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
> index c90462783b3f..506a139fbd2c 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
> @@ -1958,10 +1958,10 @@ static int cqspi_probe(struct platform_device *pdev)
>  			goto probe_setup_failed;
>  	}
>  
> -	ret = devm_pm_runtime_enable(dev);
> -	if (ret) {
> -		if (cqspi->rx_chan)
> -			dma_release_channel(cqspi->rx_chan);
> +	pm_runtime_enable(dev);
> +
> +	if (cqspi->rx_chan) {
> +		dma_release_channel(cqspi->rx_chan);
>  		goto probe_setup_failed;
>  	}

This will totally break the driver.  It was supposed to be

	if (ret) {
		if (cqspi->rx_chan)
			dma_release_channel(cqspi->rx_chan);
		goto probe_setup_failed;
  	}

In other words, if we failed there was some slightly complicated
cleanup to do.  But now it will do the cleanup and free things on the
success path if we're in cqspi->use_direct_mode.

regards,
dan carpenter


>  
> @@ -1981,6 +1981,7 @@ static int cqspi_probe(struct platform_device *pdev)
>  	return 0;
>  probe_setup_failed:
>  	cqspi_controller_enable(cqspi, 0);
> +	pm_runtime_disable(dev);
>  probe_reset_failed:
>  	if (cqspi->is_jh7110)
>  		cqspi_jh7110_disable_clk(pdev, cqspi);
> @@ -1999,7 +2000,8 @@ static void cqspi_remove(struct platform_device *pdev)
>  	if (cqspi->rx_chan)
>  		dma_release_channel(cqspi->rx_chan);
>  
> -	clk_disable_unprepare(cqspi->clk);
> +	if (pm_runtime_get_sync(&pdev->dev) >= 0)
> +		clk_disable(cqspi->clk);
>  
>  	if (cqspi->is_jh7110)
>  		cqspi_jh7110_disable_clk(pdev, cqspi);
> -- 
> 2.35.3
> 
