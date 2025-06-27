Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96DC1922DE;
	Fri, 27 Jun 2025 07:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007894; cv=none; b=sMGHr6ysXcoM+wCVO6EPL6mhQ2W5CQXkQYmTkzBkc/PGIFXuTsYchcrbHzr8cmdvdyfNKg1lC03zAJPzBXfzjnqKgN36Yt7BGOz+w+PsHevgNkHbMoJHMURxd8AjprKd6wHOFDE7yfKvIgBPKHZRDqRQUShhbGfe9zkKCwvVz+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007894; c=relaxed/simple;
	bh=wHRTKr2VmrGasuOExBXaGPc3GVwWpS6rGum/hpAQojw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQDxUBK/46Lj3wEMP77M+rDzwIfzc0PiUHqvBd/QuBPVwc6hjV3m7EMBy/wjWniVJUXtZ7sVaoRmR0tMMoEXPf4A6Fijf+vzxsWO8IuKzPmQcPQWjUy8+Kg7BrtQGV8dB8ZKAZ8xPE0ic9Rm87/X9T49cxDFDVDlVf8ziZT6KLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzkJatIh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzkJatIh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69656C4CEE3;
	Fri, 27 Jun 2025 07:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751007893;
	bh=wHRTKr2VmrGasuOExBXaGPc3GVwWpS6rGum/hpAQojw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FzkJatIhdldH9AkFNKlH9+ImdxqmeOgD9DmKrKe+eReaB3bALWNRpFnDovccBjGoy
	 6cx4vkDM2zkvPj5P2Q9IR5ssftuZK4RUzox0ZbIjH+ii0MGQGRxs71WG//WxFTtDQS
	 3VJ5E6S0tqJtTM5Cj7Fbrgz+G/cInFWUY/1apSFFags1zo3SFePxxeb+xgvBt3SBjc
	 X7Q8SDEV4j1E5PNdUqPu7hi9Quh4kxEpxeKIhVFpIM3Apsz2oxZGPDrFA370/uyl87
	 E8cSz0RRPJsqgSrRY2s6O1pTqFyOVT0LG7LVzLtKmWninSyUyFam1I7dp2gAHaQrWO
	 nkyPdxDiSlBDA==
Date: Fri, 27 Jun 2025 09:04:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: sboyd@kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, pierre-henry.moussay@microchip.com, 
	valentina.fernandezalanis@microchip.com, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/9] dt-bindings: soc: microchip: document the
 simple-mfd syscon on PolarFire SoC
Message-ID: <20250627-portable-acrid-caiman-4ae73a@krzk-bin>
References: <20250623-levitate-nugget-08c9a01f401d@spud>
 <20250623-underwear-refinery-9203f771bc39@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623-underwear-refinery-9203f771bc39@spud>

On Mon, Jun 23, 2025 at 01:56:16PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> "mss-top-sysreg" contains clocks, pinctrl, resets, an interrupt controller
> and more. At this point, only the reset controller child is described as
> that's all that is described by the existing bindings.
> The clock controller already has a dedicated node, and will retain it as
> there are other clock regions, so like the mailbox, a compatible-based
> lookup of the syscon is sufficient to keep the clock driver working as
> before, so no child is needed. There's also an interrupt multiplexing
> service provided by this syscon, for which there is work in progress at
> [1].
> 
> Link: https://lore.kernel.org/linux-gpio/20240723-uncouple-enforcer-7c48e4a4fefe@wendy/ [1]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

