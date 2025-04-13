Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38C11F1931
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 17:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744565052; cv=none; b=EODlg9L572H0JdxgSnRtpEp20F/Gb5mnW5vot1KIMAu11ArN0HfjaRIUn+rPB3FvdaRwcxG1gIgRCdCD53XlApPstcWZvZal865VJqbjxwnePW463R9Wx8tUV2THLaKIeCmwpcxxIwB9ejiMPcB4B3WvX3GJ/HmtZYZpuPY3qAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744565052; c=relaxed/simple;
	bh=6mpwTBXDtKtOWzvRXUOm2Kslk7WOSmE7W5jFMnQJFso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHm2LipHc52fYzFQoNNAfDZnjsAUZuiW4u7mO3NqWVc4kxByCx8s3whFuJB9YDC96YN1U/CN5L11D/wpRPks4lDmedHulZLUbkOOf+C3csUrSN1VdWA3bo/USCrAAD77Vg/CXolC/Xa9jHCguIr70HpKHdEz1H/LfnhYcWgg11I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DWyeEVwh; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWyeEVwh"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736c3e7b390so2922948b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 10:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744565050; x=1745169850; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C1v1jpUQBgB0UDZI3nApqVs2lUM02dJl8JbpTG+9uNg=;
        b=DWyeEVwhXGixlZfohvXxpJH9YX5JBwKXatRdbiVfqM61PAruxpMqt5mZpS+t/ErMQe
         MHNv/74h5zxKe8A4IuWszt+N0NlqSAhxAtCNAmIA8bQ6yNC5hINts9ErDLeaKhZ/ztOl
         iIF/eoC76K0/9A0rGHDclUefaKrK4jrrvHPLuJdB9VWHtjEOja75LCQcQyXsRTSyQ5dn
         U0mpAl0rDajo254vc8IfcChJkDQ44ZrR6xW0lcl9RlwBh+0UW+0ptqJItzkOJBGz0etE
         v5vebRFknE+Hf1FE6iDOHTtXzvvjENywawo1hQM/91duFjlvsLjB8Dyyqde0GEaCDr4U
         Dccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744565050; x=1745169850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1v1jpUQBgB0UDZI3nApqVs2lUM02dJl8JbpTG+9uNg=;
        b=nJeO3csmm1AOyNVn1lyPM+sivsyUORAdXtEwdZbNpV8S78K5O85fLTMQqD9MonUUqr
         /Tf6o3QrkDz9tNiSqRx97Uk6rKUiGjmS8aIdHVxaDvZ5HUm4Sp4FTth6MrCTbhF0WAM1
         T/aGXNlMlFgfH3J9GkrH9bwa3ufGsEZjzFo9/NwSuEgQXPsLo4PZkittc5vPLpPjXecd
         lr5dwGhgaylvknJBv4jxPeYYS5fD6YxlwTnV40isNeMLtyATDvETPrN9fWfwqvKLE5EM
         Ew1kK/eDJb9UjoyCgDG6F2x42KWy46KBWm/WfhmqWobBQN4PLgXwje1g6unjk8FzS38R
         /CYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPd9Kq/Hzv+B7n16C0lJDLhplwsGTBKJjNPhZMLR2f3jU37KQVb98/Z03KywrTM809NJkyQM+eIL0V7RQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcAKIZWeIgqQ5cHlxJFHBBDIhUKgT3U0+4wmIgEmLxYZPnmPwZ
	2mbEZVw09U6PSpP8Cpv/IxHshoUzGAWQnrcWrwrt3AVrd/m8Xe2gJpICb5CHuw==
X-Gm-Gg: ASbGncvASSLH6vRJ9jTYFwHAzcgiLv5j9Je6SuYHAwlaIx9vzkfj9EF8fb28bJ7qVrU
	UUi9h7VdHgXnnlGxLsT8qKICoPqG79dgM7seFYnDgF0VNalnZNVZHm9BySpmzzRYGvSId7TVoQH
	pKiZ2ozEiF+Y6en6MUAvMWauK9mQFPYwgoAStIBC56nJlS1cyOU9FAXB8KEIJhAhmfyFxQT96fc
	qtV7XJad2zhFCf/ds0MZAHgyva3QrOUrC0mKYkrockPhji3WtJWZVlevJj4nrFJr7FJhuiZmrW0
	Q1J3kPMe3x5QaqcVpzyHu9wzo+6yPx/JsbNWnZQaH0OsNAE3cfE/
X-Google-Smtp-Source: AGHT+IFM+YdieMiL9r0SStfI5t0k0rConT5oK7CRUa4UafAiZdqdwpgSv57rF8TAB6+nr1CsWpsXWQ==
X-Received: by 2002:a05:6a00:2e27:b0:736:53c5:33ba with SMTP id d2e1a72fcca58-73bd12657e3mr11703409b3a.16.1744565049844;
        Sun, 13 Apr 2025 10:24:09 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2328435sm5153419b3a.157.2025.04.13.10.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:24:09 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:54:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 13/13] PCI: apple: Add T602x PCIe support
Message-ID: <3mwdadqtt7733nq2okj47a5rsztgxuip3ukfsy44l7hhh2z7o5@njrv5c5l5fh7>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-14-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-14-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:13AM +0100, Marc Zyngier wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> This version of the hardware moved around a bunch of registers, so we
> avoid the old compatible for these and introduce register offset
> structures to handle the differences.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 847cba753d28d..5b85d9497070c 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -124,6 +124,13 @@
>  #define   PORT_TUNSTAT_PERST_ACK_PEND	BIT(1)
>  #define PORT_PREFMEM_ENABLE		0x00994
>  
> +/* T602x (M2-pro and co) */
> +#define PORT_T602X_MSIADDR	0x016c
> +#define PORT_T602X_MSIADDR_HI	0x0170
> +#define PORT_T602X_PERST	0x082c
> +#define PORT_T602X_RID2SID	0x3000
> +#define PORT_T602X_MSIMAP	0x3800
> +
>  #define PORT_MSIMAP_ENABLE	BIT(31)
>  #define PORT_MSIMAP_TARGET	GENMASK(7, 0)
>  
> @@ -158,6 +165,18 @@ static const struct hw_info t8103_hw = {
>  	.max_rid2sid		= 64,
>  };
>  
> +static const struct hw_info t602x_hw = {
> +	.phy_lane_ctl		= 0,
> +	.port_msiaddr		= PORT_T602X_MSIADDR,
> +	.port_msiaddr_hi	= PORT_T602X_MSIADDR_HI,
> +	.port_refclk		= 0,
> +	.port_perst		= PORT_T602X_PERST,
> +	.port_rid2sid		= PORT_T602X_RID2SID,
> +	.port_msimap		= PORT_T602X_MSIMAP,
> +	/* 16 on t602x, guess for autodetect on future HW */
> +	.max_rid2sid		= 512,
> +};
> +
>  struct apple_pcie {
>  	struct mutex		lock;
>  	struct device		*dev;
> @@ -425,6 +444,7 @@ static int apple_pcie_port_setup_irq(struct apple_pcie_port *port)
>  	/* Disable all interrupts */
>  	writel_relaxed(~0, port->base + PORT_INTMSK);
>  	writel_relaxed(~0, port->base + PORT_INTSTAT);
> +	writel_relaxed(~0, port->base + PORT_LINKCMDSTS);
>  
>  	irq_set_chained_handler_and_data(irq, apple_port_irq_handler, port);
>  
> @@ -865,6 +885,7 @@ static int apple_pcie_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id apple_pcie_of_match[] = {
> +	{ .compatible = "apple,t6020-pcie",	.data = &t602x_hw },
>  	{ .compatible = "apple,pcie",		.data = &t8103_hw },
>  	{ }
>  };
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
