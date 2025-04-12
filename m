Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734C680B;
	Sat, 12 Apr 2025 00:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744417030; cv=none; b=YKsCwcC2E1etHqhkFP2/CU7fbn0LJcZDiksj2PWrotzmNaAOjQa26lcSVRX8jMg/gyYpD8QCBR7iLTcKk/lgaiPJyefmxSkGwtCUtZBygU2NN/geR61vodnpk9wZ8zWCt4PfvSFdQB7MhTdIT9QcRcgZLDwgMoivrzCq++LW/mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744417030; c=relaxed/simple;
	bh=jyT4W7rhtNpjG3bxCD5/xk6RVQoxphkLIHYD1JnavHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttUi4zVgLeDj6iBtlJ3gkOYdulnv1GcIV9ycqzldjsNOXoqTwWCDUyMS1LLF9CMq7yTAtEv2J0OzUmr5yGB0TgzzoHWjv+IDq7uvym37D0Cu8TWqho0Ua6ifcOUhpuq9THNY3YPQ5nLcYl45cUZ+P4/goNv7x1pa7zuiKZtqfSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5khsImS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5khsImS"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so2560075e9.0;
        Fri, 11 Apr 2025 17:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744417027; x=1745021827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fn8WiLTGM4hv5wednDE0sx/2wVCfhxDKPT1BSvqhfGk=;
        b=N5khsImS8nxZ/g4fPsEdfra9f2e+OkeTcxE9NAJvHEEsIfmiGBSY8Gyps/U1d3HLVm
         L4RBWOjXffOAeVblokjhlx0zD1C6WtrUw561SBxnN1gfORFLSkrXOFFj70/PEsoTVtpE
         w70YVkk3gDqIif8g58teAlJl6udho8g6YNV5n1miuYQ+bwmvJRgkW9VgdF16iFWArJm/
         tX55n39w5zjd9T4Z9x8PmsBV65KCi7rJz+b1NJp19MussgVbb9J0PI1gJ5M+u+3anfS/
         FmGzreWXKjN/JeNHLHWHAkzuRVXBipzwDg1CpP6/milKxjMDx3md+6jrfrMU2VClFVto
         Q5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744417027; x=1745021827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fn8WiLTGM4hv5wednDE0sx/2wVCfhxDKPT1BSvqhfGk=;
        b=UD+Paiajw546qeqQOBRHvQOWU4Yei7hMbwD3GfszLYKwXYpyVBg8GgArdNcp4NcZ5l
         HfiN2uPK3fhvziGKVh1rxEXLiKLw6vKC20CYTyRi3i3QWtQ9t+IIK3tB3pAvWnQj6jEA
         qp0sx29ICqY1J2F9fonxgdf64kGFd+V4Z21MCTS2r4IPqqls5d2VA9a6+Xjk3on6Msp9
         w9YsKTs7CF1v9UXmq2rFr1IBxYfCx9duxVLuNZt79cOGAU1BfSiMgLX+4UXkjSEy63aZ
         etj7pZjtDiTwKkPDZ/mOGmI4bOxP66zYfrSXrDRgG/DpxMLinISH05qPCIDA4+U/aQ0l
         JWxg==
X-Forwarded-Encrypted: i=1; AJvYcCUjJIgjd3OyzR+096y7J9ZUmoEMjbT4yuKzJm4BdGgfqgr0Lk7VLVhnZ2wElTr1ZLn5k5a+Dy5s0BcS@vger.kernel.org, AJvYcCWqeOvjsanpEZmIHDfdcGdsfVFQ0QHOsfo7OooFkKl3avspYYbzr5ExUoOsHXScErC49G9irnf1nlJpXhMW@vger.kernel.org
X-Gm-Message-State: AOJu0YzWIazv4NejeRtwYjX+VpeiXLD2Bjlho1y07N6RmsKnXBelKuQU
	ljZ8sNzg8CSAGSO+R07UizneCQl+5XrGifsLpf4PO0jl7fZlNUB+
X-Gm-Gg: ASbGncvUWfPGArQHNLTKv+XT08buYTPYiC/wcBIevlcYtAeK88ySqRDIwJKkdchUJBu
	ZJg8MnCGcMUOaUjqWCT7Bps89TglBGGAVxLQQe+fvX/EQsdcf7l8fQa74anOY4QcUDagGT8yKDT
	35Ib4T5Cy9Q7FAPz3TA3SUC5I+IZrnPaMoyhcNMYpgL/39ePoELaVRs7kSX4FqvtaLI2uYTyobZ
	erh4TTAlcVYALAoarpr5P4WYbPXg5SCZm5mlwdNl8P+QKCBLeRFObfPqcsYTnftOl/QfOnYtMlE
	JoPh/poCBUE7CIfh+m/OTR2sqsNt
X-Google-Smtp-Source: AGHT+IFP5/uE1wxprdlHP/U5fFij1m37vhPv0nTX4r0GYg7cFdYJWHZCIpl23H+UvVaoTzpcrqlDDQ==
X-Received: by 2002:a05:600c:1e09:b0:43d:2318:ed7f with SMTP id 5b1f17b1804b1-43f3a7d35a0mr17143235e9.0.1744417026275;
        Fri, 11 Apr 2025 17:17:06 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572c43sm102425355e9.25.2025.04.11.17.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 17:17:05 -0700 (PDT)
Date: Sat, 12 Apr 2025 03:17:03 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: marvell: Use preferred node names for
 "simple-bus"
Message-ID: <20250412001703.qbbfhtb6koofvner@skbuf>
References: <20250226214751.3751865-1-robh@kernel.org>
 <20250226214751.3751865-3-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226214751.3751865-3-robh@kernel.org>

Hello,

On Wed, Feb 26, 2025 at 03:47:49PM -0600, Rob Herring (Arm) wrote:
> The "simple-bus" binding has preferred node names such as "bus",
> ".*-bus", or "soc". Rename the Marvell platforms to use these names.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi     | 2 +-
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi      | 2 +-
>  arch/arm64/boot/dts/marvell/armada-ap806.dtsi     | 1 -
>  arch/arm64/boot/dts/marvell/armada-ap807.dtsi     | 1 -
>  arch/arm64/boot/dts/marvell/armada-ap80x.dtsi     | 4 ++--
>  arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi | 4 ++--
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi     | 4 ++--
>  7 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> index 9603223dd761..6ec22eaaf816 100644
> --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> @@ -78,7 +78,7 @@ soc {
>  		#size-cells = <2>;
>  		ranges;
>  
> -		internal-regs@d0000000 {
> +		bus@d0000000 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			compatible = "simple-bus";

Thank you for your patch, which is now commit
ed9c2b28ebef3333f25cefdc2ef37ee1f05cad95.

I have an off-the-shelf Turris MOX board, which was shipped with a
U-Boot older than the commit linked below (does not contain it):
https://github.com/u-boot/u-boot/commit/bcf6971d536793eb99e12ff857cc018963d7cd46

and as such, is incapable of loading current mainline device trees,
which contain your change, because it is hardcoded to perform FDT fixups
based on paths such as:
#define ETH1_PATH	"/soc/internal-regs@d0000000/ethernet@40000"
#define MDIO_PATH	"/soc/internal-regs@d0000000/mdio@32004"
#define SFP_GPIO_PATH	"/soc/internal-regs@d0000000/spi@10600/moxtet@1/gpio@0"

which no longer exist.

Relevant portion of boot log:

## Flattened Device Tree blob at 04f00000
   Booting using the fdt blob at 0x4f00000
   Loading Device Tree to 000000003bf16000, end 000000003bf1e11e ... OK
ERROR: board-specific fdt fixup failed: FDT_ERR_NOTFOUND
 - must RESET the board to recover.

FDT creation failed! hanging...### ERROR ### Please RESET the board ###

Note that the hint about what is wrong is only visible with a serial
console which I happen to have. The board does not rely on it for normal
operation, which could pose a problem to typical users.

Just bringing this to everyone's attention. In the meantime, I'm going
off to figure out how to build and flash a new U-Boot using the steps at
https://github.com/turris-cz/mox-boot-builder.
