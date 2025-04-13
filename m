Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663A41DE4D3
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744563556; cv=none; b=JvoLG66O1Dvu32VXv/o0yS5U/HRl24BRsqkcL7+mBP6vCw72YeR2V21HhmYhtU4nG40LP9bmk4ydtAV/jqXJA33+9VpaTbnEVivv5LtEwzt8lz5IN3h+fCNH5tKmXAJphKJU+aCMdKJdDxYEuKDC0LHjYebX3ERCTYMrJp6dB48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744563556; c=relaxed/simple;
	bh=i17QWzXCS6ZCHtMbXDJ6n/FUUDwlQQ1PwIa3RJGSpqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sanjWGQHC2bM8+vzmXA+T1cwDW8F8AoAgk/PCfgcreZKmn3J7yZzRpUi+2tRIYBjsnRWRuijXIFLhX5DjAaWr1PaDtyzC8OkZIDQkxsbAwZlt8tV258e0Tw1aoKCoIEfOIKfM3xXFOzF7M4a1n9eF0ElyqaRy3eBMGqgSkrS3VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wEpMHURg; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wEpMHURg"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227b828de00so30675435ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 09:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744563553; x=1745168353; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=noK0IP3zHzbpqWrnS3yDqlfS/Gp7WWrDNNCpSJyHX2w=;
        b=wEpMHURg8jAWFtRtGsWPvA1S8ZMGwvnna4BQOC40Fq9b7lXDFuoyeQFLp4VIsxeiQ0
         eAdM6KtX1z1M8XT5KFHR/cw1Q6bZkUuLJ77oFIhZxQJwZsjrTJDfzWCLWtYZbl5OW22B
         HeextLyN1fED2/5hjmplApPOecRkZLCrTYoNuyXjYaL5YMF1bFoeVeDJXasGYmrTaNIO
         nWDYd14clOKoi9C+UYpe+/EMKhNuD56EyJ0N7NPWp2kvhvXJXnpIDHM/gv5zIfaLhC3w
         +lv8we9ONVou7nPzOtx0OxQX9oxD6hu9/qG7sB8VifKID0ccfaVGiOGWNbl2xgbtkwu7
         noEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744563553; x=1745168353;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=noK0IP3zHzbpqWrnS3yDqlfS/Gp7WWrDNNCpSJyHX2w=;
        b=gg6oNsisYma5vSXowYudnGVoANP2SnjKYjOn28PC+KbD3h2HSI4h2qExF1Bl2yAYyR
         9Pql3zuoBb9h6FR2CtR7m+/LgEHTe5Y1opbd0iC8+0+2hasHPD4Zsa1XthvFY8nmdbSO
         gSy4u6I1DFMcoS+G3SyT+/u3W6sPzVG5Pvtep+s6+ftr3p0bzjYiBQtFSc4NyS0p3EFe
         s65BG8J3s4haqunodL4coMMW0YTdReJ/Gcvm4rLaRSSJK3IG63spNGwt2pufM73N4eMX
         Oc6w6/cEDbUAVxGV78DH7E99LCk0xr9TGCvfIg5gN1flA/QJ5INF1SA04slohTMj1dR8
         bD9g==
X-Forwarded-Encrypted: i=1; AJvYcCW2gfIdtAm2Z0gxgMJs+4q4xzV/DLv/OIT5ta0uvCVlH31YwnFaJiRO8cfsO2WYx82Lo1evO6RNHtZ++us=@vger.kernel.org
X-Gm-Message-State: AOJu0YySxN2jxiJQQqPDwq2KoK4l7ClFwOK09k/TrSFRK5HEeIM4ssjN
	vjQPKIIU2I0VBI2bg66ZLK3I5/sUgtfXEXjxuSdPu2P3EvgGixgHNc/Gvqclvw==
X-Gm-Gg: ASbGncv1phMFE0VN5lOUzIFXpTtfRINY85pHQ0DmcQ8d2MeTI46wDFO8Sm6T8I6Zp/A
	ZYOKk8HzFYtJPuDW2V8z1YhmAC6U9KD5DvfgnInsBQV/FQN/nA2oy2JhdS022Vmtlyr9fmCVHLq
	ct5PelZpHADvNeRkxS0qYWXGkeb4QpQ7i9gPZrsehJ2/7xWQgVNAvaeikT3NBuLyl6SLma9Wq60
	ds73igRJm9dyqXTxNykLrEXJQjg2VBASQ+1rIzs1Z2XfTkADLBRVFw81FVYaGLPSqxfNLaI2KfB
	WbKk4YcNQfJqUL/cVCOSmPqh+xwS+XCQ+OB6TJXCjoTj+mVUllwY
X-Google-Smtp-Source: AGHT+IEuuztzcfI3tZMtG2ip7jalzWCYkQqUAle89wyt0wS3flTIjrnot513jepB3231SBdBpBbheQ==
X-Received: by 2002:a17:903:19ed:b0:224:1eaa:5de1 with SMTP id d9443c01a7336-22bea4ade1fmr126350445ad.18.1744563553536;
        Sun, 13 Apr 2025 09:59:13 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8aff9sm84440595ad.79.2025.04.13.09.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:59:13 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:29:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 02/13] dt-bindings: pci: apple,pcie: Add t6020
 compatible string
Message-ID: <754d74knq32vrefkukv4ec7id33d6rvhuf5boccynljfgmn6hz@bzxc7uiqdbos>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-3-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-3-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:02AM +0100, Marc Zyngier wrote:
> From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> 
> t6020 adds some register ranges compared to t8103, so requires
> a new compatible as well as the new PHY registers.
> 
> Thanks to Mark and Rob for their helpful suggestions in updating
> the binding.
> 
> Suggested-by: Mark Kettenis <mark.kettenis@xs4all.nl>
> Suggested-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> [maz: added PHY registers, constraints]
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  .../devicetree/bindings/pci/apple,pcie.yaml   | 33 +++++++++++++++----
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/apple,pcie.yaml b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> index c8775f9cb0713..c0852be04f6de 100644
> --- a/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> @@ -17,6 +17,10 @@ description: |
>    implements its root ports.  But the ATU found on most DesignWare
>    PCIe host bridges is absent.
>  
> +  On systems derived from T602x, the PHY registers are in a region
> +  separate from the port registers. In that case, there is one PHY
> +  register range per port register range.
> +
>    All root ports share a single ECAM space, but separate GPIOs are
>    used to take the PCI devices on those ports out of reset.  Therefore
>    the standard "reset-gpios" and "max-link-speed" properties appear on
> @@ -30,16 +34,18 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - apple,t8103-pcie
> -          - apple,t8112-pcie
> -          - apple,t6000-pcie
> -      - const: apple,pcie
> +    oneOf:
> +      - items:
> +          - enum:
> +              - apple,t8103-pcie
> +              - apple,t8112-pcie
> +              - apple,t6000-pcie
> +          - const: apple,pcie
> +      - const: apple,t6020-pcie
>  
>    reg:
>      minItems: 3
> -    maxItems: 6
> +    maxItems: 10
>  
>    reg-names:
>      minItems: 3
> @@ -50,6 +56,10 @@ properties:
>        - const: port1
>        - const: port2
>        - const: port3
> +      - const: phy0
> +      - const: phy1
> +      - const: phy2
> +      - const: phy3
>  
>    ranges:
>      minItems: 2
> @@ -98,6 +108,15 @@ allOf:
>            maxItems: 5
>          interrupts:
>            maxItems: 3
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: apple,t6020-pcie
> +    then:
> +      properties:
> +        reg-names:
> +          minItems: 10
>  
>  examples:
>    - |
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
