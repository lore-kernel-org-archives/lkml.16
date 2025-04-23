Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8C328CF76;
	Wed, 23 Apr 2025 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421885; cv=none; b=pR1Gk2HEnyFSyFsQHvd+jteMpFFGgR22l77QRNSdMlsYG7QiTtBMYsFjv3/i2iD6TPARHuSPs02xEXgx6TpXF6CRWceyKW1qqCBHwQM9MXH4WCMTTBLcQHE9kZh0uoudsrQBGLaipUQ/C1RClFp08tpA6kIRojWTO91G2kWsxMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421885; c=relaxed/simple;
	bh=3GqdD9EsYekxTXVnDEaqYUNg6+oGL8a/ncx/IINGhz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGmWjqnr2JXXJXwHsL6CrPJLmXl3qzlra4yQs8WogEpaJ1ubCVp8HVK0tFbdmZAFu3JSjpCgoBUMLJSvL0ssDfhZK/uZt4F1Z2VXIuvN4BqTp5AtKyXzim09CBz+28A1TCTHFjiWmO11ZBn+3mNBwpauugJiUoSixn1m9da/XUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTHh/ZVh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTHh/ZVh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA26C4CEE2;
	Wed, 23 Apr 2025 15:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421885;
	bh=3GqdD9EsYekxTXVnDEaqYUNg6+oGL8a/ncx/IINGhz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTHh/ZVhwKtm3WTFvXhFHAc4u2dMYSa9kc/5UANUuEMhBzI1z5q9twt0ELKCRgK+z
	 HePHwlB3IOsO9Y/Qshg/Q8NVvkUNrzWSPLlXGvHVPJIjCIygM/3YnZo0Tb154ddD6R
	 fucKRN4vDR+ZCdFI9SwPNssuj2WRlpuCQcguTESu2mbxW2pJmkdR+NyUdHHBwixpMM
	 s9UiyBtLLy2pLhJ9o2eFfXHWFyGm4eo50VtfNiBEdhQzgCA6sjbc2olmg37x6dAiKh
	 ZNsvfB/eWMe+iFkDLmjWkktTrmRPDHs+rcjSQMKt79GNQ2NftO1bap9z5X0GeXjhH+
	 N6/0F+xHlMp7A==
Date: Wed, 23 Apr 2025 10:24:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?Q?=C5=81ukasz?= Czechowski <lukasz.czechowski@thaumatec.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2] dt-bindings: usb: usb-device: relax compatible
 pattern to a contains
Message-ID: <174542188274.551504.11808715673086067536.robh@kernel.org>
References: <20250418-dt-binding-usb-device-compatibles-v2-1-b3029f14e800@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-dt-binding-usb-device-compatibles-v2-1-b3029f14e800@cherry.de>


On Fri, 18 Apr 2025 16:08:20 +0200, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The dt-core typically allows multiple compatibles[1] but usb-device
> currently forces a single compatible.
> 
> This is an issue when multiple devices with slightly different productID
> all behave the same. This would require the driver to keep updating its
> compatible matching table to include this new productID instead of doing
> what is usually done: have two compatibles, the leftmost which matches
> exactly the HW device definition, and the rightmost one as a fallback
> which is assumed to be 100% compatible with the device at hand. If this
> assumption turns out to be wrong, it is easy to work around this without
> having to modify the device tree by handling the leftmost compatible in the driver.
> 
> [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/dt-core.yaml#L21-L25
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> This came up while working on fixing USB on an RK3399 Puma which has an
> onboard USB hub whose productID isn't in any driver compatible list
> but which can be supported by a driver with a slightly different
> productID matching another variant of the same IC, from the same
> datasheet.
> 
> See https://lore.kernel.org/linux-rockchip/20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com/
> ---
> Changes in v2:
> - use contains: instead of pattern: to relax the check, similarly to
>   what's done for PCI (suggested by Rob),
> - Link to v1: https://lore.kernel.org/r/20250415-dt-binding-usb-device-compatibles-v1-1-90f3cff32aa0@cherry.de
> ---
>  Documentation/devicetree/bindings/usb/usb-device.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

