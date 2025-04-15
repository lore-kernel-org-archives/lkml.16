Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61850236A6D;
	Tue, 15 Apr 2025 19:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744743688; cv=none; b=Js3xg2m8SH2bo9IpllI6mAPOA37W/W6wWeA0OKxByZy+87+gRzfhj7EWsyXE/x0HZ9FkBtDaBKWcw/khgp+CG56xbkL7+/Qqfq4XTjaUw6o9YZsR56vQciKcDRC71eNU9Nii0QFKm1p4VOAnp3Ibirj18uYT13uzzV0fmmNEsOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744743688; c=relaxed/simple;
	bh=/V+8gWJv5GQZRAGVN1IBdV5uulQCNrm6pXc/yJx92ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nO0X30JzNrIvgzN+oq7WHLWYoDMyl5RbJFWcCx99Rao24H8CymA95/8ib1qO9tD9mdg8PnnzsHnZrTdiccGiiGdBiGXQQ6XaiIffGuJoo32AERbZLh125/DSVt7qx68QcdvO92uKEIqgflBRx6S4dZ8u+Jed48HeebIOLmG3yFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Elty70a/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Elty70a/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E23C4CEE7;
	Tue, 15 Apr 2025 19:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744743687;
	bh=/V+8gWJv5GQZRAGVN1IBdV5uulQCNrm6pXc/yJx92ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Elty70a/JsVT7DdriGGcVwTTUbsojQaZOi3NXd7h/CKhOTS6C382ge/TTd3PMyEl0
	 SJlop+GdpEebw5wdpEjecChvkKC1Wb5HfaWVcRz8RiW55NwcWY2rhOG+HyET9zDgfD
	 sofpnxiX2yQsg7hckpPTfPVnTD4UV5jkp8qQEO/5zlxPFQgQe7GnmAXM1qvvcVkTn0
	 VBhuXiqMlWVoe6u0ZbOKuHa0LFg/uQZzy8XPW7MbB/YeD5JVLv+6ibKiuwAuw7E1kq
	 LdZlnHQwnt/+8FKqHsC3h2PqNMUPby0OZ0Wehj2qEw5GKYCR0oP6gmvF/qQwZxZs52
	 TWSl8jULZFjIQ==
Date: Tue, 15 Apr 2025 14:01:25 -0500
From: Rob Herring <robh@kernel.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?Q?=C5=81ukasz?= Czechowski <lukasz.czechowski@thaumatec.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] dt-bindings: usb: usb-device: allow multiple compatibles
Message-ID: <20250415190125.GA795139-robh@kernel.org>
References: <20250415-dt-binding-usb-device-compatibles-v1-1-90f3cff32aa0@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-dt-binding-usb-device-compatibles-v1-1-90f3cff32aa0@cherry.de>

On Tue, Apr 15, 2025 at 04:34:27PM +0200, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The dt-core typically allows multiple compatibles[1] but usb-device
> currently forces a single compatible.
> 
> This is an issue when multiple devices with slightly different productID
> all behave the same. This would require the driver to keep updating its
> compatible matching table and the bindings to include this new productID
> instead of doing what is usually done: have two compatibles, the
> leftmost which matches exactly the HW device definition, and the
> rightmost one as a fallback which is assumed to be 100% compatible with
> the device at hand. If this assumption turns out to be wrong, it is easy
> to work around this without having to modify the device tree by handling
> the leftmost compatible in the driver.
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
>  Documentation/devicetree/bindings/usb/usb-device.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
> index c676956810331b81f11f3624340fc3e612c98315..9d55be4fb5981164cca969dbda5ba70ab3a87773 100644
> --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> @@ -28,7 +28,8 @@ description: |
>  
>  properties:
>    compatible:
> -    pattern: "^usb[0-9a-f]{1,4},[0-9a-f]{1,4}$"
> +    items:
> +      pattern: "^usb[0-9a-f]{1,4},[0-9a-f]{1,4}$"

I would use 'contains' here rather than 'items'. That's even more 
relaxed in allowing "normal" compatible strings, but is aligned with 
what we have for PCI device.

Rob
