Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8662F32
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744564387; cv=none; b=fps+XOo2G3TZ1osVBzgwc+d21onexvlTJLdzYfA53v0RKbZ/+BS/BKOooyCbB/SQtF27gKZquZxpCHiFGLc7J/GOuNtOYdVR6ndBGAsAPU4aSxBmIJQkW4PMJz5vfHf7rOpX3WlYw//Us0p5+UZJfViE0KWgaqNxyvWlZmb3gPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744564387; c=relaxed/simple;
	bh=aEQzF99LQ0NNvpBhqm+RkEYHYTmZEcGMdv8X4Shek58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=in80eVvyYcn1bRYqUWCXHwTnOGw0/i7mNmV40DF3uVeXI98shmZKRMIM0tSxVlJDtbQu746Ftg8+I1QfimggpwnUBQVO7o1vYGjDMuMsacs0q4/yrscnpKQObOi1OceAcjE5t5GKuh9qy9Sq4itShbPcMNYONfbyfjlaqKhJEW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WJ1o6Ppo; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WJ1o6Ppo"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af93cd64ef3so2447349a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 10:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564385; x=1745169185; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/+QNJQggYnXDj8WNcyWPPzk0l3SA6QGoTwofzMyuGw=;
        b=WJ1o6PpoGCrYnpqZAmVei44ACeQTVXdmF2fssALerxWoHgkgBdmnZanC5JcXS9vOsn
         eFzM4PY75zftdWu3iSTyeYfKLBjh49YV01W28egCYs7xZd76840J8Yj+uApGPI68J1Xi
         fe+4e4msRQv9q8K1JP2c69mBXiw/2SiItsW60AGyFZCONc7nzZ7ya6hF7EgxOtIcRCkR
         pVvRHquhCVTHGtcUwOYqP9DArA7VbklHXkcdvhQBbKwbvE1Bp4b8+Y3sbYevXoeB1AeZ
         fA7Zz32BZ6Vz0JcNm+DvVILyTBqzjlTQT0FfPwdRTmIavqwj/VGEpT6KKVNfLtyGYFuS
         aydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564385; x=1745169185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/+QNJQggYnXDj8WNcyWPPzk0l3SA6QGoTwofzMyuGw=;
        b=dSOOkp3XnhRB5LoE0IENTvLg/VCG9IV4497QaeRxaLRmZloL88RkcgFuyBc3UH0jrz
         0AuUwN889aKUykVipKxfSorFTthEiihk9kyVszp5xbRmJ/pkaphUtxrUY0FZM6s9bTdo
         epCDzfjjbNpZADcXOKdQJ5cWOlxw9p2lFY+buJLPFCZOGC4OYskU2zLe74ymr9LhikZp
         yvbcR+fiN6wLVRZtMaoMbJI1wHvw3bhVKgqZ6LBO6ZL/qD1I4ThNJGmTGhDvO8ug0oYy
         8snlINgumrheBSqqe8301K6uZruolTQqrF4Ro232Z1RwbfUvkc8PXo9h68n5DhUiGGgP
         twPA==
X-Forwarded-Encrypted: i=1; AJvYcCUzvjVci2Yr04Tfjdl7418mEAvM5fMPFts85jTYT3hdqkvo7d4+GBHXuupVJkddFVBQ9E/OzevhxB3Q4aY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP1Wd0E+DSwyTlAe7mr615F9SfpImiGBqaYNYAB7j4bcoEvGSE
	u0/4byAcnrri9DFIowtBh7jHIl/Z4yN6sdDGrcx54HWFPZgJV2tQEdTqbMZOIg==
X-Gm-Gg: ASbGncvs28OTbljSPgrnArwXa5F9qJb8Rwgq7yIk0U+RfokuT79Xg5DWx3j7WV1r6Wi
	05WybSw7zbJAmCaukhXvBSK2q4iUcA1RoxUFl0hBbSz4cvLeF/FfPFj16VcSNCG4w4k5ZzDlemW
	J4HLzlKWi/SDhqoFSbo/EkZuiA/PqFGSDQu4htZW1+aAIc3PbUejdzSBjoNVEip+wUTcnAUEqYc
	pP4WQyDO4jP9W4SVn4gI+8BkG5NfQc+9LHXizoE7xLKOirOiPVZ7HGUgZArc1QnewcW/JFTmVpM
	mEndC3LaHP0mVGfJ3yfYlS4X6eyMybK9r5HHUPM9M0z8LfvYqFV3
X-Google-Smtp-Source: AGHT+IFgvRixxj4CWBFzEA4Rqd/cLujQYErvo4nd7qcvFFaJWGEF/g+XbRNPiPM5DyBrqssz2FfknA==
X-Received: by 2002:a17:90b:274e:b0:2f4:434d:c7f0 with SMTP id 98e67ed59e1d1-30823664092mr18167375a91.12.1744564385379;
        Sun, 13 Apr 2025 10:13:05 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd10c41fsm10783830a91.8.2025.04.13.10.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:13:04 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:42:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 08/13] PCI: apple: Fix missing OF node reference in
 apple_pcie_setup_port
Message-ID: <bw5hh2mlgaxxxy6rcjksrqfkpencjx36iywy7kp4s65ah5qe6c@ye6dmhzhdlck>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-9-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-9-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:08AM +0100, Marc Zyngier wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> In the success path, we hang onto a reference to the node, so make sure
> to grab one. The caller iterator puts our borrowed reference when we
> return.
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
>  drivers/pci/controller/pcie-apple.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 6b04bf0b41dcc..23d9f62bd2ad4 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -593,6 +593,9 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  	list_add_tail(&port->entry, &pcie->ports);
>  	init_completion(&pcie->event);
>  
> +	/* In the success path, we keep a reference to np around */
> +	of_node_get(np);
> +
>  	ret = apple_pcie_port_register_irqs(port);
>  	WARN_ON(ret);
>  
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
