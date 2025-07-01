Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C9F4A0C;
	Tue,  1 Jul 2025 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358407; cv=none; b=a4GWAw+ttzx86IhKEh/E6npvbt54Ffc6bvJeDmDVekYrcrcytElf06FfAn04L2inY28nrKmP0ZPMct9rwMZnQm7WkkQSpGq747mj2uTH3qYOfuE1N6xs7sZC4/6E8HJUn2pYbHj1HZJ8MVli1guqxjjdtidhPiJFALu+BleIFD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358407; c=relaxed/simple;
	bh=BpTnvreAURoJuahxZzU8t6mXzFNDTA0qmPDYrQKie7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXFTNpV1R2sfufi2For985UmWsMKeX9Qrm7cHP4iVK8Dkaep46VjfZ2iNhfZ4Uq27eQFqps0jdGjDVn/BZmRIT2jkVNTL051kIZXPFcfhcMJWfxvYdOf41ZxSkiecZxbVAB39dT0I/T9dYwOOhfy+iE6KnRA759Qx/aaubUv5Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mo53mM/7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mo53mM/7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD5CC4CEEB;
	Tue,  1 Jul 2025 08:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751358407;
	bh=BpTnvreAURoJuahxZzU8t6mXzFNDTA0qmPDYrQKie7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mo53mM/7Hj3X5zZUPoExDOcH3jNRu/Ij6vTUNYaFw7HDnXytECqpx+yvysuI9+9EW
	 ZWaU+K7YyJhrQGIHRfy6xZI4KjIwBvyDnLR+JUemvcmVn4+ySKuQfAdYcN5uQ27tAz
	 Sm4C7NVI/iV/K0rGaQr4kSuSQLIU29ZuIDbDVlranb4kxfGz2evVhy82gae7euDJ9R
	 ujXq/Ec3/ZSZWNttVKj2XgZ+bjIEUKmOBvYXiap1RjNYOnc5QZb52YjODEuSzYN8ZR
	 YJui3Nt/aWh3O2oTtjfRe+MReapPNvyR4id7pngKXqGwUgzWy+KMTvGSEhpW9uDrh4
	 4WR/PwmmD0opQ==
Date: Tue, 1 Jul 2025 10:26:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, David Lechner <david@lechnology.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: Convert ti,da830-usb-phy to DT
 schema
Message-ID: <20250701-swinging-honored-harrier-6e972c@krzk-bin>
References: <20250627220107.214162-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627220107.214162-1-robh@kernel.org>

On Fri, Jun 27, 2025 at 05:01:06PM -0500, Rob Herring (Arm) wrote:
> +$id: http://devicetree.org/schemas/phy/ti,da830-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI DA8xx/OMAP-L1xx/AM18xx USB PHY
> +
> +maintainers:
> +  - David Lechner <david@lechnology.com>
> +
> +description: >
> +  This device controls the PHY for both the USB 1.1 OHCI and USB 2.0 OTG
> +  controllers on DA8xx SoCs.
> +  

Trailing white-space here.

Rest looks fine, so with above:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

