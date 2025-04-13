Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6CC1E7C2D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 17:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744564069; cv=none; b=Fr0bph4QmVbjhkM5lmQNHGzqUIy4e1JVtD+JEk91a5jva8pYxmqh0p/afMASnhBY/Ou3qLVfjdPqeYbeK9R4ckSgX5dk1x9zRSaNPw4kKShtXMdL9ZQPtwx+FT9KyAyqejJBHC/rfPQJxR9MQuXCY0kd80CadSDVx0vks4D6VvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744564069; c=relaxed/simple;
	bh=6VKODufV55CPHRL6gMi2vT4BTwQXo0hYnnyL4Ta01nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uC3mn5nYIWPTSD9zYeo77Kwep6Hm5w8jwrp71ekwUWfTxrfupZnU58/6TxBZdN1Yeur1ZwuJxDpWKp34R1W1JVppmzjAofTn0ytBRugKwmTTQQtqMhBTC9x2zGO1pKr7iASCyPPPgj8w3ZyEuZS4CCWtFhp+x9+WCaUiGMi6qRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DRIHCqWr; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DRIHCqWr"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-225df540edcso44727275ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 10:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564067; x=1745168867; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+nVktb2oUewrSNZef7Xp2RVx4/SYPTQmZKEvKujre58=;
        b=DRIHCqWrTTuyHsN1JYQgnSqwTtOur7HWh9I4oDzTd5NnkE3lBZZeOkxR1xHxakYE6V
         MIsqICN2Bz9KUhoa0zOmwVH3FDnT3kDwmaoiJU40ItPJuFv/DMfrl+q/+tNflwH7vroT
         8XtiINvYlT5TMM07H1t0doUtSCWG/x2rWFH1rV2mIH4GjflzBwI4JLfM/SjXRWYOIRiy
         3TTI+BwDOsAiFuyqQ4sX/YVY+Ce77EbaHGiewe3kdIhrTfDHetM1vE+GCF8UzJpU31yh
         ZHfQt7KTD01QEiGhnvql+9n5yJYWGhnfxJip1MaTJ9xXjhbBM/sDE8aYV6e8J4etNGEm
         R4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564067; x=1745168867;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nVktb2oUewrSNZef7Xp2RVx4/SYPTQmZKEvKujre58=;
        b=HhSNSsI8gqCI8Zrl72AIrxi2lsK1I24ucdqmOD/8tR5P66pxT86RBupxnJffj9Q/TS
         YfwajsaybE3XX7TmWPpgB4OzZE9OcOVA2yDpayEi1MkoGQwyPddXbHdgzR2KPupx+fvy
         SVzx/mYqB5SwjhCAKzarM+lVxQRKz9+rhZAnJHjL8QM1ZBXfvyRCJmbqn3fqdhQsOc+g
         vgFL9bnNdwSbDWiexYM8qErHlbIF24EbDHoHR6HSIqY0yRt4klLkNVJIinYMgZZ1aYsJ
         24ELNaowXzlj+e+oEtpCIhLrOpmTQPVj8u8RMlwh5/gvxfx8GYvlNev3DEq6mIhhtQYY
         IbYg==
X-Forwarded-Encrypted: i=1; AJvYcCV8s1lMaI26INjDfP2/Ioxi1gMj/MQ7USTUt/r8Mqlw8SAh00Lp0JtGIcBa2P7uvTzXbPjNG0WESH9PZrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyACuQ0WkvoYzKYiWkc9vQQhBOi1+o9gF0sbeuSW+zsXT3LhJN
	0JsynbzhhP5GzvEDgiXJthThxlkaQ1cgnJtHwuw+/oXEnrMbMr5vkZZ+DI6qXA==
X-Gm-Gg: ASbGncv4dFZHoLLnZWGTHOi0r7gXbwdrckbXSGSYltSjQgV4A3zwx/Ejqn30Z78HmBV
	O/SXpXeUgGm74prmXtJfjn8zJL/tVntG9jtaZkheecxRawQVgixIdjMQNlUQmOIfzsryr4dTRUa
	pC9LMvqpIg+6Dt/1+No/r3bxfJqKuJWtqxMt9dZ1krGWUgsEWtwwVx6HD+un6DRgGzsInvGq9Xb
	whT0h84o+TI+jtJJLJURqCCFEfD9hhrPvwW3d86hG3kPdmVkMIAFifVz7UpYnkde4iLg4Q8bKN/
	C7YWB9uWCo0+sSPFRFRpnRrfQxwKj0u3KzlIPShRzbik/lNdExyW
X-Google-Smtp-Source: AGHT+IE+gbJeUC8MORyPLq+yv1/hRBnQsVunUtWyIkSWfGWZQvtHnS9GTR0o+MdzAbYHUke6iYn5sA==
X-Received: by 2002:a17:903:1c9:b0:21f:5063:d3ca with SMTP id d9443c01a7336-22b7eaa3209mr205867575ad.16.1744564066784;
        Sun, 13 Apr 2025 10:07:46 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cbasm84608565ad.133.2025.04.13.10.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:07:46 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:37:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 06/13] PCI: apple: Dynamically allocate RID-to_SID
 bitmap
Message-ID: <vcoczq6foe3mikun3o5oqhawbu6ixfjfljnare32olmwxw63xj@zznl6iefhhxu>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-7-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-7-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:06AM +0100, Marc Zyngier wrote:
> As we move towards supporting SoCs with varying RID-to-SID mapping
> capabilities, turn the static SID tracking bitmap into a dynamically
> allocated one. The current allocation size is still the same, but
> that's about to change.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index d07e488051290..6d3aa186d9c5f 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -147,7 +147,7 @@ struct apple_pcie_port {
>  	void __iomem		*base;
>  	struct irq_domain	*domain;
>  	struct list_head	entry;
> -	DECLARE_BITMAP(sid_map, MAX_RID2SID);
> +	unsigned long		*sid_map;
>  	int			sid_map_sz;
>  	int			idx;
>  };
> @@ -524,6 +524,10 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  	if (!port)
>  		return -ENOMEM;
>  
> +	port->sid_map = devm_bitmap_zalloc(pcie->dev, MAX_RID2SID, GFP_KERNEL);
> +	if (!port->sid_map)
> +		return -ENOMEM;
> +
>  	ret = of_property_read_u32_index(np, "reg", 0, &idx);
>  	if (ret)
>  		return ret;
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
