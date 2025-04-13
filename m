Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C6D2F32
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 17:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744564200; cv=none; b=miu2pRjkNf68BwhSjN4f21uGjZDld7nvx97A0UWaskLCN+4sDLlXBUTxUA7lCkOitY8VZLHY+VhLPXVpXa1AVxi5mazc2Gi0DADcHWT+ObIu/yd15DglM/OT+RN+D6bDryLzngu0ukCxSXO/zYsSzzqm2Tk68yiakoX1UpgbgZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744564200; c=relaxed/simple;
	bh=VIDzddv+o5O40oGIPzcK+uFOnPDJBuCGtbfeOsXTDts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loCRQQjdMOxqpGpBFsrjJcectV7HkYQVN8uAFHMywoC+QsxnYfDk66tr+NQoX7qNszkoo5IDVVCCtCBQy+Bo8SQ7+bU7qGOJ/g+wSN9Kl0dVDKbTJU/6eoSophToBGJqLhnUZG4a4aJhE3OD9kiqEQ2Cu59x2uY+qy6i6dFG+y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qDVEIEz3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qDVEIEz3"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227aaa82fafso27049705ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 10:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564198; x=1745168998; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VbsBH030YmmrPLiGCvxSobJgevOjlBmu917XLPcMgfY=;
        b=qDVEIEz39rVHcUP5dyFbjjDTXAoy/f6Uegv8aAe4EUOwY/ZL8JyOk+GlV7VBgIfKmZ
         oucIy/M7tZxYYNoA1lwOvIKA9RKXB/E6Cjjwgc+T9xN/yonbVxd0/Mq8f3sFNQLWYqIw
         IGS+nLJyC2Wih1VSteYXxQaofdq3D3ANHZtcZ8+JrnKFWTXnHdO9b3OkV/lsmOO4VxOE
         TVQJ8DWzWYcETFGMdkGYZrb6mP6Yq5yDbA1ZDk3VP4kCSSxIoDbSN0doWoiFmW6SZYdg
         YPeFaQsmVj+/F0QzGBhX8/Y+No6YpLnXLjhVEk6v9q+skUyvoz5Fd0N+fBLFkCZ5nUdF
         AWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564198; x=1745168998;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VbsBH030YmmrPLiGCvxSobJgevOjlBmu917XLPcMgfY=;
        b=gxhbH6dCJXmGGHbGz+SQnrFqjNLiF9jnsotIsvhUNfPesJxUQa57ub+gwQ1G1A8iwB
         LVvSf2ZMRDviY2dkD3nGHGRtTO3pPITkZjg6QNBHFiZCYP5JQQx/6TnKCzdV1aXgs+dp
         HE49Kfoat+NSCB+aPN3hWHVuYRKTYBtlWyj5b49uEcfB9oDhB10Rad4Tlqkh9b1OanDq
         tfhgcTvLNd0WryDIdr29iicEXVAimkkszCxmGcCf2WF9e+QYthguOAIkSMQzfyz8sFPx
         S9iwBMOnTK9Ocp9wB8H8BtPVmGBO4Pc3xrJX1VNnjOR8a9JgV/enPX0CUsJCyAjWJcXh
         R1Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUWWqkuGY5Cg82GSyO5p4F6UoDzc2zVWt/Ea1SN7EI72i0keWBU+1nYjEb/G66iBnBnfRoFVmy6J/Zpszs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwrEG5vwgsV48IngrKzb3AtGSn2QAd4E3BFi0xewfIhC50SIAo
	7tmb1fvdpyHA/07uVnoY6LW/sSNPRKl5WAe52BLGxJy6+DUhs7mKLulKMNXEvw==
X-Gm-Gg: ASbGncvP9bPNQDYCVAu7z1DOgEoNi1MSLdevZs0rq9Wi+k2eXTJS6hq14+oH6kJ0KaL
	EQkuQldpE76vYeRj6ia1OgjyECzNaLnLop39rRkfXPc+SaVaJgiUdumCuhphCMOuefGq63tLy8J
	0RuhKZXm6qlJEe4BEfrvok5t0/2216z0aZq9DHYTbS9aC3gxxRUd/Mln1uDbExuSM24fwWi2Ocp
	cFgoizAFdut30/sWmcOGem545cE3GZiE/j6xS7/kHSmY/WsGWu5H/RLo49o+0XZmIw3CX4FkqoY
	3hInk5h1xn9qRXz1IeaFib2cDrCZQRJofTudT6DMWNazpiQFiP1p
X-Google-Smtp-Source: AGHT+IEM5JXPlHa/46KPcgwjfAGRbntfwPEeRwa0pOWka95ljamo2KjNfPBab6Whg2HZjCAf5af8bg==
X-Received: by 2002:a17:902:f650:b0:223:37ec:63d3 with SMTP id d9443c01a7336-22bea4adeecmr130822495ad.18.1744564198505;
        Sun, 13 Apr 2025 10:09:58 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95c40sm84845325ad.127.2025.04.13.10.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:09:58 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:39:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 07/13] PCI: apple: Move away from INTMSK{SET,CLR} for
 INTx and private interrupts
Message-ID: <sbudn32sbw6d3z7n2yomlzdsbtumckw4o576zfe5nlvwpt22j4@hf2zpld7tvcb>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-8-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-8-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:07AM +0100, Marc Zyngier wrote:
> T602x seems to have dropped the rather useful SET/CLR accessors
> to the masking register.
> 
> Instead, let's use the mask register directly, and wrap it with
> a brand new spinlock. No, this isn't moving in the right direction.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 6d3aa186d9c5f..6b04bf0b41dcc 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -142,6 +142,7 @@ struct apple_pcie {
>  };
>  
>  struct apple_pcie_port {
> +	raw_spinlock_t		lock;
>  	struct apple_pcie	*pcie;
>  	struct device_node	*np;
>  	void __iomem		*base;
> @@ -261,14 +262,16 @@ static void apple_port_irq_mask(struct irq_data *data)
>  {
>  	struct apple_pcie_port *port = irq_data_get_irq_chip_data(data);
>  
> -	writel_relaxed(BIT(data->hwirq), port->base + PORT_INTMSKSET);
> +	guard(raw_spinlock_irqsave)(&port->lock);
> +	rmw_set(BIT(data->hwirq), port->base + PORT_INTMSK);
>  }
>  
>  static void apple_port_irq_unmask(struct irq_data *data)
>  {
>  	struct apple_pcie_port *port = irq_data_get_irq_chip_data(data);
>  
> -	writel_relaxed(BIT(data->hwirq), port->base + PORT_INTMSKCLR);
> +	guard(raw_spinlock_irqsave)(&port->lock);
> +	rmw_clear(BIT(data->hwirq), port->base + PORT_INTMSK);
>  }
>  
>  static bool hwirq_is_intx(unsigned int hwirq)
> @@ -387,7 +390,7 @@ static int apple_pcie_port_setup_irq(struct apple_pcie_port *port)
>  		return -ENOMEM;
>  
>  	/* Disable all interrupts */
> -	writel_relaxed(~0, port->base + PORT_INTMSKSET);
> +	writel_relaxed(~0, port->base + PORT_INTMSK);
>  	writel_relaxed(~0, port->base + PORT_INTSTAT);
>  
>  	irq_set_chained_handler_and_data(irq, apple_port_irq_handler, port);
> @@ -537,6 +540,8 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  	port->pcie = pcie;
>  	port->np = np;
>  
> +	raw_spin_lock_init(&port->lock);
> +
>  	port->base = devm_platform_ioremap_resource(platform, port->idx + 2);
>  	if (IS_ERR(port->base))
>  		return PTR_ERR(port->base);
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
