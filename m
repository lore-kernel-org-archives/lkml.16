Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D541E98EA;
	Fri,  2 May 2025 07:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169446; cv=none; b=DxNOm/XCmEXJjTDxO9MB7u6rPErDquKgBJgmuJMDi89WpdIB4ZIAr2yFNmp6FpegiiH0FIBnHWafhYB8pMu05QW3yMgM1tE/n1zgoTsHD0A8aqjKrJy1e8hooQcFtea2Cz6+cQelm0SQor5ilyqmUfmp19uMS3KPd8GYc5YMf/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169446; c=relaxed/simple;
	bh=fhY5m60UFnO53XEqmXSlnWFnGO6KQea5r4wM2AKUazk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5DtWZrzo5ul8Mud6oyqGnINDRmZ/EYOKhmQJAorItw52yreyPdtdCs4+wc5HqI19xmCYRNM7PHEZYtEHY2rcq3lgj6xYb35CX6jqnL5eoNES1rQ2QT1FsqWxu4rSDRMupXMrunbVIxSEZkj0LeE051nL1PWUXXjtuwPxAE6MQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5Kk0lw4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5Kk0lw4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91380C4CEE4;
	Fri,  2 May 2025 07:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746169446;
	bh=fhY5m60UFnO53XEqmXSlnWFnGO6KQea5r4wM2AKUazk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5Kk0lw4IZiQ7mTdp0LhMvMPyRb+kLmnJYjEa8tg04JVahiWxnPKDqqo8uSyGj364
	 lrBNDL/ew8LhmEgJvZB9t58hBR5eSjObJL4TS9F7hxOjkUqezSrXJQA63zPfkFem8J
	 u9jzSxYnyCWoWENSNzE/+9susZ5YnFBT5IeWjRlZr1DjDiTpal9WI5oDbCn063GD+Z
	 GM1MqW/xl07SyL+LB86j1a8uZEd8IOXvSYSO7txZIhEnNNqSKlpP7gTJ7mhyjlDrBU
	 AdXIg6f06B6o3X0iIZGbnNKWkc6Sjd58MCKtJd5CgBWcFzRHqMPLd9izHMrQwXAsw2
	 zoKxcWU+jln5g==
Date: Fri, 2 May 2025 09:04:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH 5/6] arm64: dts: ls1028a-qds: make the QIXIS CPLD use the
 simple-mfd-i2c.c driver
Message-ID: <20250502-savvy-eccentric-hog-b4fed5@kuoka>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
 <20250430153634.2971736-6-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250430153634.2971736-6-ioana.ciornei@nxp.com>

On Wed, Apr 30, 2025 at 06:36:33PM GMT, Ioana Ciornei wrote:
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> The MDIO mux on the LS1028A-QDS never worked in mainline. The device
> tree was submitted as-is, and there is a downstream driver for the QIXIS
> FPGA:
> 
> https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c
> 
> That driver is very similar to the already existing drivers/mfd/simple-mfd-i2c.c,
> and the hardware works with the simple-mfd-i2c driver, so there isn't
> any reason to upstream the other one.
> 
> Adapt the compatible string and child node format of the FPGA node, so
> that the simple-mfd-i2c driver accepts it.

Why do you break the users based on some driver differences? Fix the
drivers, not the DTS.

> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> index 0bb2f28a0441..58b54d521d75 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> @@ -338,17 +338,18 @@ sgtl5000: audio-codec@a {
>  	};
>  
>  	fpga@66 {
> -		compatible = "fsl,ls1028aqds-fpga", "fsl,fpga-qixis-i2c",
> -			     "simple-mfd";
> +		compatible = "fsl,ls1028a-qds-qixis-i2c";

This breaks all the existing users. NAK.

>  		reg = <0x66>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
>  
> -		mux: mux-controller {
> +		mux: mux-controller@54 {

This was never tested. Your binding says something else.

>  			compatible = "reg-mux";
> +			reg = <0x54>;
>  			#mux-control-cells = <1>;
>  			mux-reg-masks = <0x54 0xf0>; /* 0: reg 0x54, bits 7:4 */
>  		};
>  	};
> -
>  };
>  
>  &i2c1 {
> -- 
> 2.25.1
> 
