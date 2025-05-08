Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DF842065;
	Thu,  8 May 2025 10:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746699053; cv=none; b=GboERZ5JcVv5KBLiaQQxd6CWi43pum50pTouI147QQ4YGFhHDi+eBavJigz+lGsCNpqTVlZ582vCurbkJl3wHNrBBscnFSjyediEDWADM5rEetwg8K8FDBgxXV1nlecBu1bJNrd/6wR+aQPeOmBPDwXWjd2iWsPhMnJ6r2oqk74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746699053; c=relaxed/simple;
	bh=al1FqgCmXx5VBt+1ZySNsT8ko0r+Xa1DTRkUn0hBPyk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=B6BgOrxrXM7TE6t4Px4USi/t/EGbRPIGYNeXbRs/dRyE/3L3FoIo0F0ofQjAXSMUmXbfjgVTkcWDsblO2QxSarJSvNeYgoa5UoZKVWak+OOh+btQnwsgbljeg2rfjZI60GD2fS18aDBi3MfKQruV37nwEeW05f2tsxEjzO8AUwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1JOiXu1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1JOiXu1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20669C4CEE7;
	Thu,  8 May 2025 10:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746699053;
	bh=al1FqgCmXx5VBt+1ZySNsT8ko0r+Xa1DTRkUn0hBPyk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=q1JOiXu16Id6bmC4kxGhe9ggBpPRqbPahqHkUlMfgo0p8an0i/GHnXDs4t2wiQP8b
	 0b0uD/z8QvtzY2RjZo6GJqmq98+WEaZuBUYWq0v5FgGBHQt9B5Zg04m2qVBFZBJDOY
	 kq4nKxezAKb4Gc7xDn9lId3CSsQ+wetxWoty2nQ3WZ0b2UU3vaEVf1ZyX1g2GhYCfa
	 HVWLvqkvxh9XGx6VIIhmVB4fB9PN2AkxJ9Bke2iY/HeK07QmyLGYnORxiMbHIRQYgD
	 ULAOYek3vcRgGQTU8RqQFjMvSSz4l0rotmoOUcOSaLfOXAxlvzFosiYSljeWDVQUDe
	 U7lQekgo0HFWw==
Date: Thu, 08 May 2025 05:10:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, afd@ti.com, devicetree@vger.kernel.org, 
 vigneshr@ti.com, v-singh1@ti.com, kristo@kernel.org, 
 linux-arm-kernel@lists.infradead.org, khasim@ti.com, nm@ti.com, 
 conor+dt@kernel.org, praneeth@ti.com, linux-kernel@vger.kernel.org
To: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20250508091422.288876-2-p-bhagat@ti.com>
References: <20250508091422.288876-1-p-bhagat@ti.com>
 <20250508091422.288876-2-p-bhagat@ti.com>
Message-Id: <174669905140.3798918.8007695230469922299.robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: ti: Add bindings for AM62D2
 SoC


On Thu, 08 May 2025 14:44:20 +0530, Paresh Bhagat wrote:
> The AM62D2 SoC belongs to the K3 Multicore SoC architecture with DSP core
> targeted for applications needing high-performance Digital Signal
> Processing. It is used in applications like automotive audio systems,
> professional sound equipment, radar and radio for aerospace, sonar in
> marine devices, and ultrasound in medical imaging. It also supports
> precise signal analysis in test and measurement tools.
> 
> Some highlights of AM62D2 SoC are:
> 
> * Quad-Cortex-A53s (running up to 1.4GHz) in a single cluster. Dual/Single
>   core variants are provided in the same package to allow HW compatible
>   designs.
> * One Device manager Cortex-R5F for system power and resource management,
>   and one Cortex-R5F for Functional Safety or general-purpose usage.
> * DSP with Matrix Multiplication Accelerator(MMA) (up to 2 TOPS) based on
>   single core C7x.
> * 3x Multichannel Audio Serial Ports (McASP) Up to 4/6/16 Serial Data Pins
>   which can Transmit and Receive Clocks up to 50MHz, with multi-channel I2S
>   and TDM Audio inputs and outputs.
> * Integrated Giga-bit Ethernet switch supporting up to a total of two
>   external ports with TSN capable to enable audio networking features such
>   as, Ethernet Audio Video Bridging (eAVB) and Dante.
> * 9xUARTs, 5xSPI, 6xI2C, 2xUSB2, 3xCAN-FD, 3x eMMC and SD, OSPI memory
>   controller, 1x CSI-RX-4L for Camera, eCAP/eQEP, ePWM, among other
>   peripherals.
> * Dedicated Centralized Hardware Security Module with support for secure
>   boot, debug security and crypto acceleration and trusted execution
>   environment.
> * One 32 bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
> * Low power mode support: Partial IO support for CAN/GPIO/UART wakeup.
> 
> This SoC is part K3 AM62x family, which includes the AM62A and AM62P
> variants. While the AM62A and AM62D are largely similar, the AM62D is
> specifically targeted for general-purpose DSP applications, whereas the
> AM62A focuses on edge AI workloads. A key distinction is that the AM62D
> does not include multimedia components such as the video encoder/decoder,
> MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
> processing, or the display subsystem. Additionally, the AM62D has a
> different pin configuration compared to the AM62A, which impacts embedded
> software development.
> 
> This adds dt bindings for TI's AM62D2 family of devices.
> 
> More details about the SoCs can be found in the Technical Reference Manual:
> https://www.ti.com/lit/pdf/sprujd4
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250508091422.288876-2-p-bhagat@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

