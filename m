Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A381E8348
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749058012; cv=none; b=key2szGbPvGPEQvwxwz6KI5M8Sl9ANkBReK4C/Uet1AQrfcTvTdrKsY8RA9042hKwNLSEjku4xJsJsYOXRH+mBT75C6vvcjRRJgGXvhRupiNDFJG11DRs/ZDWO1fzo945n+HCTx6RNaN52RrL4amVP098fYWlhKJMde883Zsotg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749058012; c=relaxed/simple;
	bh=zfBX5Hd5AHFJx+b+JeKpO3p+lc17VsrFhnNhvgeTwMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4bXwFyqrSZm4XTfduiO55rnGFn5adey3y9TBDJj6o5BOoSgVNNZYUgEkup3vsB4j8Wb5ccOe+6OhYRGEhHd610u2QKBctCeJHQIiD5WDj+14T2LpBOEtDU0/MosJ2HUS5cw82zhBYz2B8+KZsDRLYEjRXVMvIijX/MY7UPHvq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZzz5DLP; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZzz5DLP"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b1fd59851baso35531a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 10:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749058010; x=1749662810; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tjOqoffUv6nOmVjkm22wWdvmrQyYX67LoFIA7eUIS4c=;
        b=uZzz5DLPyX4RtUQ3Kpa8TeH20F3wJmRz6h76ajTJW4JeebutC9ThATN1VT30JpcdW3
         mWHjgth/0oUKeVrYkcf+leNOjci0D/A30sa81Efb6QiNTy3Kk5YZ++cOIZl6XQ1h++MN
         TIngVqJELxypCZ3LO2zlojScz21FaaxCB4QI6iosD01qBlNHGKToGY6t0PQXwvFyvcOx
         PA0GynNXlNQKMmSxgkYZ15Zgk68zEwO1Rvkm70VVegKLASPdMdzr4MlOQ5qCybhW0UE2
         w4L2JteYZTWnrmyhF4NyXIDq0u3rEIadKV6NTkWgcndDnY/gZxkbC4+T9dx8CZGbM8of
         rkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749058010; x=1749662810;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjOqoffUv6nOmVjkm22wWdvmrQyYX67LoFIA7eUIS4c=;
        b=wPp1DLfqj4LT1cyWtJIURfRMYugB831kBn9YyoPlAN5Y/oI/ZTF5mF5krOmhZwA+Ot
         aGoRTegdn808ANfM1CS8pF0BXAfq2Xhnxt+yha44W/DAIji2AHCpyLTIYO5J1OfFC+x/
         xOFUBz6oWc1f2c1CVvu/9O99xiG77QdPbBuaUYUI6yaW+dCBqYXssSCU8gLYvDb3D5Af
         vYKTYmLjN9ikQOvdXavZFgQISqELlLoLUfD2n9Zh62KNuQgEaJdfSoxQfAWvGvP75fMr
         dpGN4XMDKLXMAorhkiKkw2tWM/n1z4P5gWWgsQIJRYeKraqUCNVnCGE1+vckSsw8b5tj
         qWDw==
X-Forwarded-Encrypted: i=1; AJvYcCVZTqraDk4o77W1pk1Sr+RFavLsNI53F1GYzH/fDV/GnrDFcw+aEuwyK3o/HWJOdQSZBxJslppQoWTPdGs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5931Yg7E6sG+jeSqzeyzqVO5LbNuLgfcQgvdK1ASA75QOKCz8
	Ib4+TxMILfze+INh0TV6c94Z1RT73VIXCebKLtecXsjvPCs+DfL026nChsM1C5T85g==
X-Gm-Gg: ASbGnctb9jc3mQjM2AhIwX54rTj+oqAmycO3ueQ4s4rQOvtRuAdymlk3rBIFREQTVzQ
	QPOQZhLiOPnAsWLrAVU8uaBHdKbEeUhpMiS7somSem7uJGbmC/1UqbFEeaUgWIC5Lm+jdSQyZ2L
	hip4WOqtdM+UTpSinUaHXUHZKXUGMAf6YcFdnamCS+/cw1iAnjIYpMioalVCFWCBZGP+OgRurIC
	seRB5a54gGztQqIYZ4sOJ46nNGfx/H3lcjOj19kD6Gf4hcCo0VQJDmCPYH/Vv5ahh2FNiWAEk2x
	3sg2OZlIKMAdMEt2h0ciZyDBUnjoktSFJF6OjwJrVyuD8swvjmrAm6a3rwYzvg==
X-Google-Smtp-Source: AGHT+IE7pUgMHsiK6fiB03xw5h0r4hqVnNjoiuF0h4s03T9Q5QTp4kFOwhIfaUC9GczffqkQkUVkZA==
X-Received: by 2002:a17:90b:4a41:b0:311:ea13:2e62 with SMTP id 98e67ed59e1d1-3130cd5dd59mr5987202a91.24.1749058010346;
        Wed, 04 Jun 2025 10:26:50 -0700 (PDT)
Received: from thinkpad ([120.60.60.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e322315sm9178577a91.43.2025.06.04.10.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:26:49 -0700 (PDT)
Date: Wed, 4 Jun 2025 22:56:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a779g0: Describe root port
 on R-Car V4H
Message-ID: <mu2zj3ph5px34iyclaeirhry4nknevwqkqhqyyecugio2gpkst@fsaxfqtnc6nn>
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
 <20250530225504.55042-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530225504.55042-2-marek.vasut+renesas@mailbox.org>

On Sat, May 31, 2025 at 12:53:20AM +0200, Marek Vasut wrote:
> Add node which describes the root port into PCIe controller DT node.
> This can be used together with pwrctrl driver to control clock and
> power supply to a PCIe slot. For example usage, refer to V4H Sparrow
> Hawk board.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: New patch
> ---
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> index 6dbf05a559357..8d9ca30c299c9 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -798,6 +798,16 @@ pciec0: pcie@e65d0000 {
>  					<0 0 0 4 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
>  			snps,enable-cdm-check;
>  			status = "disabled";
> +
> +			/* PCIe bridge, Root Port */
> +			pciec0_rp: pci@0,0 {
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				compatible = "pciclass,0604";
> +				device_type = "pci";
> +				ranges;
> +			};
>  		};
>  
>  		pciec1: pcie@e65d8000 {
> @@ -835,6 +845,16 @@ pciec1: pcie@e65d8000 {
>  					<0 0 0 4 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
>  			snps,enable-cdm-check;
>  			status = "disabled";
> +
> +			/* PCIe bridge, Root Port */
> +			pciec1_rp: pci@0,0 {
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				compatible = "pciclass,0604";
> +				device_type = "pci";
> +				ranges;
> +			};
>  		};
>  
>  		pciec0_ep: pcie-ep@e65d0000 {
> -- 
> 2.47.2
> 

-- 
மணிவண்ணன் சதாசிவம்
