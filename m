Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF07C3C3C;
	Mon, 28 Apr 2025 08:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745828868; cv=none; b=a5GvLoIXw79SGnkV+Knnbhc3k5+545ia2KclupSE0Aw6l3J17cTnKB+A4RheShem0zTlX5BdmHv3x4Nf/1T7xvFjwNSnOGjvNm9Zkh+RfeAVkA5byea8t4zE8i1n0Sidtxj0ERSXeAAaw63xne/nmBBfW0Q3h4B/2ykYhN5qghw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745828868; c=relaxed/simple;
	bh=PaxPOCYFT8+NCylOjC6IJshk9UYKhqX//oBRg178PHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vf9gijiFqgRvRGGDMCygSgJkZ6wZJdsTVSFPY2yFz+qUbmzno2r4brBNczQLluTlBcrm5NU/E18U7yKRmbeVVjd6vw62yF//LJwaaxdHGo7Z+/+8ro3hRXoFMmIQqcsaPCRCoUnzDYSWl7Wt1U8GaKOPCj4Ar58pVLevjlA0YwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OG97fjak; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OG97fjak"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08C3C4CEE4;
	Mon, 28 Apr 2025 08:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745828868;
	bh=PaxPOCYFT8+NCylOjC6IJshk9UYKhqX//oBRg178PHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OG97fjakxoGDsnz/D4sp4HYS5KHkqUEJCUahDsa/ojYM12sg90C25fgkpBgGI9uQc
	 udPjqMRE7zfM99YSpbGXVAsmsHzWT4GPkPXGVnvyT46ku6dtL+sxO/MsQm5Q+nW6+u
	 XhUlzUMO3V9+wAY31LsmsEqkAcm9Lg5iAPdL3svZaIIbKCnKpVvwgGBIqTF9nXohpc
	 2sBKrmuBhkAxk12HyF4W31P1X2uq+ag/NHm1z88JhHII6QklHLvlU1UOQOztga7lgy
	 XnUgmbbwF+rRYkk/teaSZA9g/PdH2Nv4KeEUSQfyKxBeuAUkcCJLLo3ivKLuonu0Ns
	 dI0S0stzOXTVg==
Date: Mon, 28 Apr 2025 10:27:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: nvmem: convert vf610-ocotp.txt to yaml
 format
Message-ID: <20250428-cuddly-dodo-of-greatness-c1cf01@kuoka>
References: <20250424045448.3876201-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424045448.3876201-1-Frank.Li@nxp.com>

On Thu, Apr 24, 2025 at 12:54:47AM GMT, Frank Li wrote:
> +allOf:
> +  - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,vf610-ocotp
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':

Drop both cells, nvmem defines them.

> +    const: 1
> +
> +  clocks:
> +    items:
> +      - description: ipg clock we associate with the OCOTP peripheral
> +
> +required:
> +  - compatible
> +  - reg

clocks should be required.


> +
> +unevaluatedProperties: false

Best regards,
Krzysztof

