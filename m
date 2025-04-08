Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED06119D882;
	Tue,  8 Apr 2025 06:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744094292; cv=none; b=p2ajMFNnc59A6+Y/aUNi9QEsIDFeDpYn+a0SRQPPVOXvIZJpy4pPMBcEZKVsuxOK9O1GlzH66zt7ZqLpS7YtFbtIxxRhaLVMV4yDjPdwNFFD8c2LIo/gAKzypQC0ZRgqXf+t4f3IyzPTcHAtJScqRTFaRbNi3RKFPhh5yG2lg/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744094292; c=relaxed/simple;
	bh=JJC94Lz0zUD4TEdlGfqwtlcTdbmhju2+3wATQkMNeAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGarBf4K+iqIhk6G7mRR4bu78rvk4oIaMF8BsSP472NExDdsTbYBlhtcfIZUsLnWbEgKlfHSfF/MntmGIswMsqJ4t15M7fj8ITd/+lpDlm9AlGO4OydjEVQxmpQrX0kf/jTfUUQ+p2QxEVL7K1sAQsFiD72P2g8+raNCBdEpKWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlG2w4d1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlG2w4d1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3D6C4CEE5;
	Tue,  8 Apr 2025 06:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744094291;
	bh=JJC94Lz0zUD4TEdlGfqwtlcTdbmhju2+3wATQkMNeAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PlG2w4d1ftsFi3+kIshkvaX7VWEwC6HwHzXnTSaF6evp0X1jTXGKIjCBd65eozkCg
	 M+CZo7XyGTpPZ+9tfEfAT3PTrz1dfUV07ukl6cDMa+8IGTpoFgy5IZRDZCOmMBDFyG
	 /NG7KxnFTI2dY354YY0FDkknGa8KFijMpBjsgfoHp79I73Qi2+D27EGapia0oymHL/
	 PNDok9S4lYahSgRKW/SROAc4L0BVe9zRhxu1o66cX7lxKF/USkmVQ5EIg8PRaqTlEA
	 /VO90PH1qAfyHzsOWwD5iedRHvvnYFYt9iuW4mLtrk17B8C/k0BjGYqpJOIkBYl3KY
	 Vdby+VLZWxnUA==
Date: Tue, 8 Apr 2025 08:38:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, christophe.kerello@foss.st.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/7] Add STM32MP25 SPI NOR support
Message-ID: <20250408-opal-pillbug-of-acumen-0fbb68@shite>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>

On Mon, Apr 07, 2025 at 03:27:31PM GMT, Patrice Chotard wrote:
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> Patrice Chotard (7):
>       MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
>       dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
>       memory: Add STM32 Octo Memory Manager driver
>       arm64: dts: st: Add OMM node on stm32mp251
>       arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
>       arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
>       arm64: defconfig: Enable STM32 Octo Memory Manager and OcstoSPI driver
> 
>  .../memory-controllers/st,stm32mp25-omm.yaml       | 226 ++++++++++
>  MAINTAINERS                                        |   6 +
>  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |  51 +++
>  arch/arm64/boot/dts/st/stm32mp251.dtsi             |  54 +++
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  32 ++
>  arch/arm64/configs/defconfig                       |   2 +
>  drivers/memory/Kconfig                             |  17 +
>  drivers/memory/Makefile                            |   1 +
>  drivers/memory/stm32_omm.c                         | 474 +++++++++++++++++++++
>  9 files changed, 863 insertions(+)
> ---
> base-commit: 88424abd55ab36c3565898a656589a0a25ecd92f

That's unknown commit.

b4 diff '20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com'
Using cached copy of the lookup
---
Analyzing 81 messages in the thread
Preparing fake-am for v7: MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
ERROR: Could not write fake-am tree
---
Could not create fake-am range for lower series v7

I tried on latest next, on some March next, on latest mainline. It seems
you use some weird base here, so anyway I won't be able to apply it.

Please split the patchset per subsystem and send something based on
maintainer tree (so for me my for-next branch), mainline (which is the
same as for-next currently) or linux-next.... which would be the same as
my for-next branch currently.

Best regards,
Krzysztof

