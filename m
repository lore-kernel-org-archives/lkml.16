Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A522D1F2C56;
	Fri, 21 Feb 2025 18:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740164148; cv=none; b=IICeWXJi6IBuQosoSQpyk+hRvaL2USeBmUTax+Qtpj4UVRTXnyXUsHb37sxYhhITr0+lF9tbVhTWMpSZ3fTWmhfqIDtpldJ1zWbkYmk2FsqgUwB7UyxUTD9fVk1GKg6LaxvKllAv7pH2qB26aeaR1TBOjqYI+gi+H135AUFViQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740164148; c=relaxed/simple;
	bh=FqmtfoVZO6HU72MZ/2CduMNToLV/zogw6RnUqQd1ng4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9NQrxsptaXu/Nsebn7uMwVuXbk6UKYsHjV1TxTuq4A+C1zDkXNFDVs2J7U86Jigtzch1o45w8XnJJQchYTWuOoE9AepID0uuhdGcTZdAgpAfEz7ICnu22nV95Tk5y8FHovTwXoEmE9++PO61OzXeP5IFxUtFpzJRcTSRQVsBlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F53C1C2B;
	Fri, 21 Feb 2025 10:56:02 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1BEE3F59E;
	Fri, 21 Feb 2025 10:55:42 -0800 (PST)
Date: Fri, 21 Feb 2025 18:55:40 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v7 04/10] dt-bindings: arm: Add Rainier compatibility
Message-ID: <Z7jMLCd4i_jtpAA5@J2N7QTR9R3.cambridge.arm.com>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
 <20250221180349.1413089-5-vincenzo.frascino@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221180349.1413089-5-vincenzo.frascino@arm.com>

On Fri, Feb 21, 2025 at 06:03:43PM +0000, Vincenzo Frascino wrote:
> The Arm Morello System Development Platform uses Rainier CPUs.
> 
> Add compatibility to Rainier.

Where's the TRM? Are there any known errata such that we might need to
know the MIDR, etc?

Mark.

> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 73dd73d2d4fa..2e666b2a4dcd 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -177,6 +177,7 @@ properties:
>        - arm,neoverse-v2
>        - arm,neoverse-v3
>        - arm,neoverse-v3ae
> +      - arm,rainier
>        - brcm,brahma-b15
>        - brcm,brahma-b53
>        - brcm,vulcan
> -- 
> 2.43.0
> 
