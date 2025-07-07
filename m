Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C55262FCC;
	Mon,  7 Jul 2025 07:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751872193; cv=none; b=noqVEkYPfJe47XCZ5pJ+UvCA+/bPJ6g4HUp3+idYPmK7zaxSR1vceGSiRgBGned6Hc9E8JLpEp4OUXwk9MpsdjNgoa0TdG8hG9LGk5oY1Vn1bz2S8lv7CSczD6lqnwQLE1uSebilEjFnr29dqoJLtrP7O4DtktK4GdcLd09oE7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751872193; c=relaxed/simple;
	bh=AFV+TeABv8Zk5XboOQaVyDGMa4C8DLIZ32be/SwRorc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXzM9i2PUAbkxCp/YX4d2UTIdYf4C/kkeC0zrTKqrjHDA4a4zk0AFGYafnwTpmNlfUMglvg/t79c0D7MWD2iWF9Qpd0BI0KIb7Cc0FZy7Njtb8lzGUujUdl/G23+CO/K8edf/k2tumsEINa6+MgSmuBbc6eYeFtDx1oP3g6i3s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URk79ekV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URk79ekV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F0DC4CEE3;
	Mon,  7 Jul 2025 07:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751872192;
	bh=AFV+TeABv8Zk5XboOQaVyDGMa4C8DLIZ32be/SwRorc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=URk79ekVOVynmozM4nJAdmxw+sXeyVljNAqmn12VBB7z3qV30kBwHYnlTvasx7zXs
	 oGe/SaYzqePdVFBZGEsGH7Zviy+qrvKiOMiMNYQWmSKcDsMl7ANFmYa2b01ZBv9lQI
	 WSyPfoZ2Kl1dEGs1J61hQ/OMm9qdL9izv/2phoxSIdDMbu45ouWIW/HlSCN9dw5H+s
	 pWAOccOx0kqbLEg6ATcC0MMZnrFN2f8mC6GKKo5hDWqu07iBkzfaNnZ7+5JKM/KYlE
	 nrMorvOeYSowD3+s3ZgzBaE/JrUHaH+DvCxmy0tZ49LX23Q7yNxPHEylixzOVUjRML
	 PLr28mGM6+AQg==
Date: Mon, 7 Jul 2025 09:09:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: sunxi: Add NetCube Systems
 Nagami SoM and carrier board bindings
Message-ID: <20250707-vehement-daffy-worm-0cc8ee@krzk-bin>
References: <20250706183601.157523-1-lukas.schmid@netcube.li>
 <20250706183601.157523-2-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250706183601.157523-2-lukas.schmid@netcube.li>

On Sun, Jul 06, 2025 at 08:35:54PM +0200, Lukas Schmid wrote:
> The NetCube Systems Nagami is an System on Module base on the Allwinner
> T113s SoC. It is intended to be used in low cost devices which require
> simple layouts and low BOM cost.
> 
> The NetCube Systems Nagami Basic Carrier Board is a simple carrier for the
> Nagami SoM. It is intended to serve as a simple reference design for a
> custom implementation or just evaluating the module with other peripherals
> 
> The NetCube Systems Nagami Keypad Carrier is a custom board intended to
> fit a standard Ritto Intercom enclosure and provides a Keypad, NFC-Reader
> and Status-LED all controllable over Ethernet with PoE support.
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

