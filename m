Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3468D13D539
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 05:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748754856; cv=none; b=f9BtBQLObL5s5qx5BXRt1A3dz84yhhBdceWyETd5N761Q/j4t+0Qi7kh6NvrvB9wTXIte7xxQ72xq1uncxwICz3fFdlDMkh0qy9T/tXfgAn3GoO+Q5iM/IKj061dx8nsCkyK0WnLxBivUbnP/XdIwlj0hcm413fDFpnZ6GTJgJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748754856; c=relaxed/simple;
	bh=dRgmJvopJbBd3GURbX7nf9+Ap3zhAqIMndBocYjajiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hL6TuMub92bKZFUnVtzQ4Cqh/YuYzs9aYvUofjL7Nf+Jg6gf+3ZoTn1pCCGdEUwCVlBfmNssBK+pYb1yKnNq1Ko+c6La7XYZrAyaAyG0wFhKK0y2xJozznF9/LpeuX2KQ5M68xwuH9/LNpROE9qn3bXNPrfqZbtz8BGk/5QtRXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W84WOE9k; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W84WOE9k"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7399838db7fso2958360b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 22:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748754853; x=1749359653; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F3iHR1+Hq48gmHp3Xsuk/NPR6eCILhzOir2aolffJTM=;
        b=W84WOE9k9r56UKVQUbZt6FKdfZqfboEmSIefue9E/1sxMV/GANlKWjOSn89NaspnwK
         EgCH25lbZMwzGyP7ckVIvhCNDVGw9ZKNxVdYVB6vxdoo9N3KcseTqAveK8rrTZtUpgwc
         3hGIR5U424fVK6/eopUyPV39hGCGYoXQ5SHFzWoSndPptl8h8KRGX1lphPcw1DW4m7e7
         ewBIi77Z136yKpZS5UyMFyuzVQFXzGTJ80oVQ4XhN7QIbeY2oFVQY8j8UvZ4mR03puTM
         QrauI1JqHdvcI99hw36bcYPRZR5woyV8Vwr5MedUcll8Xr8WTKWo+Z1DAPGCr0J+dgYk
         p5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748754853; x=1749359653;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F3iHR1+Hq48gmHp3Xsuk/NPR6eCILhzOir2aolffJTM=;
        b=N/N0sSXs7jFykf13BUuldSjCvlyxy1VZG7Ujck6wb9/Fhn1sPRzFR7jMgiLCD2QjlL
         ZGyPkfKmNPSS2ASiCRb9qj77zhb4Y40ZTHMiJaaXmm6mNBh6qaZXWRAoi381+kfvAz8s
         loSWnyOyaTXaeDQDz3CBM0fip31mWpahspQU24rWcZu99w9NczjxCbNx01ia/ReU6Kw4
         FkfXO2u+AzFwF5cQmZcMmj02bYFXnmaxReZpihZjLh0FDZ7vtKQ8uCyMXzlVFLR/Di25
         zj3W3rCHiAaNMCUO/9RXGht2FEr670bACorGJLSaKVTVtejpewsOGo533LsphByYaYMC
         3nPg==
X-Forwarded-Encrypted: i=1; AJvYcCU0FKslKHFgBtf2DyzJRBo0odzcWyPZu1/G350I/oP8fQF0mtah8yH4ffPhxOLTPz+vOoQTFB+K1LNTiYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM7PP3cgW2CenimUhlO75soE+uuCKnhH4PIBykM+wbjzD3Pgei
	gMLCkFoNOJ9n1uWmD3HsJhEh/JaqW73nO5n6lVCKQpAntijuItvILB3BaOZxiHsZUw==
X-Gm-Gg: ASbGncuOUr5XhRzqET77EKjCIKmrOflry339Sxauyg/arNT/Q0fYjlmW69OQTpCYaF/
	j6EAxEUBXs7+dQrw2ac2NxM6i6gepj5GKSHf4Ll87okVrPzfY+o5U8DK2MsNHBAj3PFZhmrx4bR
	vQwtdFmgTsHgcIVeFhWl9kZBnEwhS0tm8a8+Ouuh8gPLnP2R88mJo+80TdNTeFINWAIiBAOWWTb
	GWpxJBs/d3dEajh2LFhF+FSbsdlAbHCijU2CsIJSaIvKdxLRQxuxQvS5KkS2tUAX7jbEz2/GNiO
	iYTbZBod+jeEQKCCaKzeOW/I6z6KCVWj9HZLMX2xi7Ud9ccYcgLnmXHQYRTiMrw=
X-Google-Smtp-Source: AGHT+IF6r3vNa5E6r8x7FtbP8W3yKXdO1fzktH/mCY0g6TJuRN3aLD1QXNmF0vDauUcI5P4CHml2bQ==
X-Received: by 2002:a05:6a00:2301:b0:744:a240:fb1b with SMTP id d2e1a72fcca58-747bdd02e5fmr13050309b3a.5.1748754853400;
        Sat, 31 May 2025 22:14:13 -0700 (PDT)
Received: from thinkpad ([120.56.205.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe96852sm5424190b3a.9.2025.05.31.22.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 22:14:12 -0700 (PDT)
Date: Sun, 1 Jun 2025 10:44:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v3 1/3] dt-bindings: PCI: qcom: Move phy, wake & reset
 gpio's to root port
Message-ID: <dwxdtigcj7jwy4gyiwnwkzxoshvisrocxbz2sfywofcoia3tdf@tq45ajnuctyj>
References: <20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com>
 <20250419-perst-v3-1-1afec3c4ea62@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250419-perst-v3-1-1afec3c4ea62@oss.qualcomm.com>

On Sat, Apr 19, 2025 at 10:49:24AM +0530, Krishna Chaitanya Chundru wrote:
> Move the phy, phy-names, wake-gpio's to the pcie root port node instead of
> the bridge node, as agreed upon in multiple places one instance is[1].

s/instead of the bridge node/from host bridge node/g

> 
> Update the qcom,pcie-common.yaml to include the phy, phy-names, and
> wake-gpios properties in the root port node. There is already reset-gpios
> defined for PERST# in pci-bus-common.yaml, start using that property
> instead of perst-gpio.
> 
> For backward compatibility, do not remove any existing properties in the
> bridge node.

... Hence mark them as 'deprecated'.

> 
> [1] https://lore.kernel.org/linux-pci/20241211192014.GA3302752@bhelgaas/
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/pci/qcom,pcie-common.yaml  | 36 ++++++++++++++++++++--
>  .../devicetree/bindings/pci/qcom,pcie-sc7280.yaml  | 16 +++++++---
>  2 files changed, 46 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> index 0480c58f7d998adbac4c6de20cdaec945b3bab21..e5f60faa18ad68a29900a66fbfcba3d4f8e88e7b 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> @@ -51,10 +51,18 @@ properties:
>  
>    phys:
>      maxItems: 1
> +    deprecated: true
> +    description:
> +      This property is deprecated, instead of referencing this property from
> +      the controller node, use the property from the PCIe root port node.

s/controller/host bridge

Here and below.

>  
>    phy-names:
>      items:
>        - const: pciephy
> +    deprecated: true
> +    description:
> +      Phandle to the register map node. This property is deprecated, and not
> +      required to add in the root port also, as the root port has only one phy.
>  
>    power-domains:
>      maxItems: 1
> @@ -71,12 +79,18 @@ properties:
>      maxItems: 12
>  
>    perst-gpios:
> -    description: GPIO controlled connection to PERST# signal
> +    description: GPIO controlled connection to PERST# signal. This property is
> +      deprecated, instead of referencing this property from the controller node,
> +      use the reset-gpios property from the root port node.
>      maxItems: 1
> +    deprecated: true
>  
>    wake-gpios:
> -    description: GPIO controlled connection to WAKE# signal
> +    description: GPIO controlled connection to WAKE# signal. This property is
> +      deprecated, instead of referencing this property from the controller node,
> +      use the property from the PCIe root port node.
>      maxItems: 1
> +    deprecated: true
>  
>    vddpe-3v3-supply:
>      description: PCIe endpoint power supply
> @@ -85,6 +99,24 @@ properties:
>    opp-table:
>      type: object
>  
> +patternProperties:
> +  "^pcie@":
> +    type: object
> +    $ref: /schemas/pci/pci-pci-bridge.yaml#
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      phys:
> +        maxItems: 1
> +
> +      wake-gpios:
> +        description: GPIO controlled connection to WAKE# signal
> +        maxItems: 1

Shouldn't 'wake-gpios' be part of the pci-bus-common.yaml?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
