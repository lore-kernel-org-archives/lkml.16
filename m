Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411B22DC770;
	Thu,  1 May 2025 08:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746088076; cv=none; b=rowdQGgQ68g6N5i+K7QENLPKnjYWcupM8aPl8gNBxKrN3yH2UgLUEs4LwFxsQy+ecCCrJoSbB30wHg0AceSXgN6L5HpW8GiHZD1DMn1bqixP3YfoEbjyAERegofD7RhdIdtVypAkkVGRWHezs8XspwTVmbU67dS9QtbxQLCbiyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746088076; c=relaxed/simple;
	bh=DIRp7PCO2q81pcfAhNFooEuVcja7gndPQjMS3ZpawtY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=edkbCxZ2FaOptwXrBp2uYWuCuSQntrCGEtqKJg3GSDeZzeqk6/wikdIGzyvkhkVk9/3HJCtG10XFkfydYvpEGxCUO6SsBHamTi+lNwRinIjYJhixmmqj0BJD2kXPiL+cc7xHHtw8LYKof/VuUmCCfZdoPTmA1r9r0sbfif2Wktg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdlRCrUM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdlRCrUM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800E4C4CEE3;
	Thu,  1 May 2025 08:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746088075;
	bh=DIRp7PCO2q81pcfAhNFooEuVcja7gndPQjMS3ZpawtY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kdlRCrUMmhE/tpd3yMnCUQ8nqFZey2KO2cjBF/eRRiX7S7tIBNUvPpONHiNjtp0Jw
	 B3y0ddPIIL5h9wwXGQ9ORHG+J9rQeGilBbUOKKoX4iu/59rIZEAnup83l3Mdlrog0j
	 haFWGO7+2NbfFDawZSIKTGd95wYawI4fdGk8jBEyL0uV4WZGwJ+AaI6gVLp51uq6Ce
	 bswu/fX8jr/Uo+9LBf9DJs9mFhVah3+xuv5ho2wZzUDv9Ub1zudwGIgRfRV2p6sD3K
	 IlzdE+73rrDDkwgXh3h0uxSA8vWF1/9iUXCzsxTfpmc+Rxhy7rUC2IHUKg0unU/7Gx
	 KbLQJCgkOn/sg==
Date: Thu, 01 May 2025 03:27:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org, v-singh1@ti.com, 
 vigneshr@ti.com, linux-arm-kernel@lists.infradead.org, afd@ti.com, 
 conor+dt@kernel.org, nm@ti.com, praneeth@ti.com, devicetree@vger.kernel.org, 
 khasim@ti.com, kristo@kernel.org
To: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20250501072923.1262414-2-p-bhagat@ti.com>
References: <20250501072923.1262414-1-p-bhagat@ti.com>
 <20250501072923.1262414-2-p-bhagat@ti.com>
Message-Id: <174608807383.1458182.1498162135150593654.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm: ti: Add bindings for AM62D2 SoC


On Thu, 01 May 2025 12:59:21 +0530, Paresh Bhagat wrote:
> The AM62D2 SoC belongs to the K3 Multicore SoC architecture with DSP core
> targeted for applications needing high-performance Digital Signal
> Processing. It is used in applications like automotive audio systems,
> professional sound equipment, radar and radio for aerospace, sonar in
> marine devices, and ultrasound in medical imaging. It also supports
> precise signal analysis in test and measurement tools.
> 
> Some highlights of AM62D2 SoC are:
> 
> * Quad-Cortex-A53s (running up to 1.4GHz) in a single cluster.
>   Dual/Single core variants are provided in the same package to allow
>   HW compatible designs.
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
./Documentation/devicetree/bindings/arm/ti/k3.yaml:37:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250501072923.1262414-2-p-bhagat@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

