Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F57217F5D;
	Tue,  8 Apr 2025 07:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095727; cv=none; b=DrGviFVutHbelOcZeHu4OZKu0CV5/GUq71he72sjvGu06UAddl3flsP5NyAVkHXUx+tnf9hpqYAMyXRFwok1AfpkLeoBPD3a5lLSmeXnakoBcxT/yCyrXcEQwdsodEX+m7+tN43G4TZpFYGD1yeCDFkcfgQ+Fh6JrKeOALHveMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095727; c=relaxed/simple;
	bh=n5s/LEoEQT9NSU6XeyqlvUReVnAp5oh6ZpPr1vmJWlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daH7c0vixexDxZpkgjqDUQ5ppImQq5E3U6kVJGraKfVZ5kboOmY2AgCx2FraVbwapjtYs/JoIdKyM9AOBxftqhVY/K2/eB82iWcrEif2OUCDZEdVYyK/FewocCitsSSJH1DeqRXNu6/37MnyARSLqRO6UK74acZK0hib0zhZL7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qWK6hpiK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qWK6hpiK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B82C4CEE5;
	Tue,  8 Apr 2025 07:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744095727;
	bh=n5s/LEoEQT9NSU6XeyqlvUReVnAp5oh6ZpPr1vmJWlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWK6hpiKl5YRKO1XST0DS4G1798u4QPzV/BYigAc7enKX9RvtfbHVZiIyWLipOFNq
	 R/TI9O0yCS5wZAOjM3gUxOGG8kzT8ZfEscsNFE+cdoEabPjcPBX+eqizMRGHd2XQhE
	 wMoFS5FBU9Q5I5jPyg01niVBXZsCkXhf5ZUGW7XIHNYkuu0yRx6BMVUkkkCFN9XtC4
	 JArmSuarCNVcbj+kNHG8QIz5FV9j+QXgqgAFJrE4C5/3HCklP4QdgsDJBip5WC0TUx
	 t/ZQJD52d9OnT3Kgmj9mtlKP7XfL0pXlXKEJp0kwo32dByen14GJSaQHzP24ksgM7H
	 //0NShTXgPthQ==
Date: Tue, 8 Apr 2025 09:02:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, christophe.kerello@foss.st.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/7] Add STM32MP25 SPI NOR support
Message-ID: <20250408-offbeat-esoteric-millipede-ed8a2a@shite>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
 <20250408-opal-pillbug-of-acumen-0fbb68@shite>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408-opal-pillbug-of-acumen-0fbb68@shite>

On Tue, Apr 08, 2025 at 08:38:08AM GMT, Krzysztof Kozlowski wrote:
> On Mon, Apr 07, 2025 at 03:27:31PM GMT, Patrice Chotard wrote:
> > Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > ---
> > Patrice Chotard (7):
> >       MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
> >       dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
> >       memory: Add STM32 Octo Memory Manager driver
> >       arm64: dts: st: Add OMM node on stm32mp251
> >       arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
> >       arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
> >       arm64: defconfig: Enable STM32 Octo Memory Manager and OcstoSPI driver
> > 
> >  .../memory-controllers/st,stm32mp25-omm.yaml       | 226 ++++++++++
> >  MAINTAINERS                                        |   6 +
> >  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |  51 +++
> >  arch/arm64/boot/dts/st/stm32mp251.dtsi             |  54 +++
> >  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  32 ++
> >  arch/arm64/configs/defconfig                       |   2 +
> >  drivers/memory/Kconfig                             |  17 +
> >  drivers/memory/Makefile                            |   1 +
> >  drivers/memory/stm32_omm.c                         | 474 +++++++++++++++++++++
> >  9 files changed, 863 insertions(+)
> > ---
> > base-commit: 88424abd55ab36c3565898a656589a0a25ecd92f
> 
> That's unknown commit.
> 
> b4 diff '20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com'
> Using cached copy of the lookup
> ---
> Analyzing 81 messages in the thread
> Preparing fake-am for v7: MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
> ERROR: Could not write fake-am tree
> ---
> Could not create fake-am range for lower series v7

Hm, both v7 and v8 apply cleanly on next, so not sure why fake-am
failed.

Best regards,
Krzysztof

