Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2A71E3761
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744563464; cv=none; b=Dy+C9b6Zr8O7sxwsZ9ayZgqBxWoQdNYLDzcvuXQWi5568WPzop33SKtq0zZzSzxCyHQI+m3rjHpoLLAPc1QtH7zWmqpvwy+QndemTSzWYR5vt0J8hDRXNvwuMz1JLU7H4wGoMhSXNQ2KbChskNf58yxjD1Imc0unJ/F4eJ4xi+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744563464; c=relaxed/simple;
	bh=/7OMVG3YDsHT7VSBN3w3/iys+Aoi2WqcdkbwOgqe87g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=poNfIX+MMoPBiBs7tBqG8nzs1BJ5yPqjEEDc0DCTR80oO/fio0zEZWG9XQIpCFW84Rc5JfUxv0RAubPhoqkHLZxLysdwn9PIC4HgesEoRM5+yfap8ZR+TV4lISlwUheycwfoOrOB2Xn7N+bUBaZy7GF/dtn76CUbXZ7Nw+JMPX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=orN1vKHU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="orN1vKHU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22435603572so32538415ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 09:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744563462; x=1745168262; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RBY58SxSSqyPJrcv2B/68pnLeAE4+ZGyiwdPmLMof5o=;
        b=orN1vKHUehvbX+Sl48MTqJNjfQx2wbaEgxrjfI1ez3+OGPmeLa5Hd5M9PT5641M9cK
         ogAYJSx70WgjUrCzj0cBDyYPOLp7FoUUWc09ReOUSxNtqVHQ8aWq4Sg+6NWOF0ZtvUwj
         ZFpab+uJalDpmoi80dOPK/TIqqZM2R4DXdKEKuW0q1E+NTC3sH0R8+c839COUM27DTBn
         jtN64A4rv36MaKJVaqn6m7/a0D7YrM5zmPT2X4jlxfNHcKBPpxH067M/4htJb/i4Sd1/
         LtxQYGk5AzEFuW3w9Nl0BZAu9OE+XLg/TP4uf8ESOzUAKGgzn8mEZjZZuXBm6b3R6lJ/
         UacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744563462; x=1745168262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBY58SxSSqyPJrcv2B/68pnLeAE4+ZGyiwdPmLMof5o=;
        b=ndPOl61RR7n/7jL1plzoWwv4OuK9Gtz+Scd3bow6tVxSjxcu4BDjlRtqWJIl3mRDI2
         pVyCoY7QfMNhb8XbzM2JDTh8AWE6P7FDQiji7Nmj/PQXiVZOW2AxO8KyShO1UIzfnYb3
         B2cZBt2qObtjIioNk2/0Y5m5bZ/TE9lYJiCzF4nEX7Niod/GxsUG9/DVok5tOBDdwA8X
         4k6H0frjXqhnX98moCB/fshGQ40wxt9ofK/2DdAm9iUv1c0A61T8rIfOGQ7Txq/aO/Hk
         PjMi6LnRB0METqNVBbK9/nLQGA2uWQY7zB6gYEGhvmrayOP7xGxL/DayRArR7wo/q1kj
         kdew==
X-Forwarded-Encrypted: i=1; AJvYcCVYMaOJJWE20tJZUW+leMZq0FnCPNmJZovFFjuM2NYL0y8fnnZ+G3nhG32b2/5WRSb1RZLPCrdhLddBCek=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWqz0HdZoDHHJEEBCtQKLrHp/RUQiWItBktLs+83cud8dGvaS4
	6sDy/PjN6xQj3BMNcahCkLFvkyA3MeetIRxuVwZvHDyqdcwa9CFmzBF02a/p3A==
X-Gm-Gg: ASbGncsWYf98zoRw3RmTgZ3gy0YP5KdKfUt8BOlPmg3QOKsLvb9WIMAxIXpKfUgK+Xa
	+JdF7yg2EnrB3C39Ze5DcevgNE7cjszT3IP0J3PQK5NS+7TsjuS0NHudRJvWB3GBnaSrf6pcNLm
	WasYkFFRp/PtRTOWZj1q4zYAiDl+B8NGlIIba7r9ZFmIoH5k68gt/n+Sb6X7OH7RjqWjqyuujhq
	wDP94JwlEzCGRUD0qVPVwJy1/5x3sdBuNxk6ZijnNJisXP3HKvo0pJ30fc/3GQxafD0COZeq0J7
	mgHCcbrM+Le19YJfSJtAQzalgiM8E8kpWhAIBJc/kIo3ndzx9ClZ
X-Google-Smtp-Source: AGHT+IGJt4v7frYs5ZTIrelHv7KmYlMcRfj04mYpK3QHDu8yhzesA2ae/Fc6/h0nwJZRdeyltFrEww==
X-Received: by 2002:a17:902:ebc2:b0:220:e63c:5b13 with SMTP id d9443c01a7336-22bea4fd043mr132747235ad.46.1744563462265;
        Sun, 13 Apr 2025 09:57:42 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb84bsm84013885ad.236.2025.04.13.09.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:57:41 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:27:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 01/13] PCI: apple: Set only available ports up
Message-ID: <k3wj3wkk3cymyacboalkhe2fa7jvkpuehq4knpsouoyhvoavpl@bafg4oakp4lr>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-2-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-2-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:01AM +0100, Marc Zyngier wrote:
> From: Janne Grunau <j@jannau.net>
> 
> Iterating over disabled ports results in of_irq_parse_raw() parsing
> the wrong "interrupt-map" entries, as it takes the status of the node

'as it doesn't take account'?

> into account.
> 
> This became apparent after disabling unused PCIe ports in the Apple
> Silicon device trees instead of deleting them.
> 
> Switching from for_each_child_of_node() to for_each_available_child_of_node()
> solves this issue.
> 
> Link: https://lore.kernel.org/asahi/20230214-apple_dts_pcie_disable_unused-v1-0-5ea0d3ddcde3@jannau.net/
> Link: https://lore.kernel.org/asahi/1ea2107a-bb86-8c22-0bbc-82c453ab08ce@linaro.org/
> Fixes: 1e33888fbe44 ("PCI: apple: Add initial hardware bring-up")
> Fixes: a0189fdfb73d ("arm64: dts: apple: t8103: Disable unused PCIe ports")
> Cc: stable@vger.kernel.org
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index a7e51bc1c2fe8..842f8cee7c868 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -755,7 +755,7 @@ static int apple_pcie_init(struct pci_config_window *cfg)
>  	if (ret)
>  		return ret;
>  
> -	for_each_child_of_node(dev->of_node, of_port) {
> +	for_each_available_child_of_node(dev->of_node, of_port) {
>  		ret = apple_pcie_setup_port(pcie, of_port);
>  		if (ret) {
>  			dev_err(pcie->dev, "Port %pOF setup fail: %d\n", of_port, ret);
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
