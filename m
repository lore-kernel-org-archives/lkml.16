Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980DA2AE96;
	Sat, 14 Jun 2025 11:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749899566; cv=none; b=FWNa6XtIJWLTBp5euNWUTmMwxcIw8o4KeLGB0nN3JtwXAjYOql3TuWfnBj5sm5bUuJNxCU/Np+SeNzpOkbDFiLtdioSdU3b5hBczSM/v2la0cAzhWhvN+zlsG/qWnrVDTlJtgImEUuNVm7nZP7Ds6wpz13oA2GU1q3PfHsyaerk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749899566; c=relaxed/simple;
	bh=9wVEwKDRxCUUHYAtNHKLRbgqbNZpbzuce/1YR2Sz23o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jeJ6UKGboIikpmtzJ6IW85yPoTot62aNGQOUC6BiAWqYpGKk7+RFveTGHWfesYSoN2//q80B0Qf7wNz2yA5uV9B4h58t+booKk0EPxjnpVV4Z9nhCkNLlmnDQbiTw+HTh0M5XLTpJX0ezG2Tbktf9/pJM3MMLhqPlCs0bL+kpZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTmaV3tb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTmaV3tb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A581C4CEEB;
	Sat, 14 Jun 2025 11:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749899566;
	bh=9wVEwKDRxCUUHYAtNHKLRbgqbNZpbzuce/1YR2Sz23o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LTmaV3tb2hcMRRxMSe4a59qK2K9g3tJhPwicOqGofFQ2PrPD/j5BTD3GKTqR/LqCL
	 12Ihqpd6PVhpQOtJw4YW5OCH5LkNF4QBLNPPKx955+Du6fR+HG6829g1/wEEB7vSH2
	 HxLmnc4gXkJYGKHKlFly4oXB9RXpTUfKkPjN2ZE32Dmnqh0BCc0iXDrTCICrW4jhnw
	 Jr18OqsYrlwZQlSufeICaZaLnUjfv+MvS9MNqm7YaU9xrOXBlWr/afGJ0c1TXnYknR
	 Iec62PgQZLpsHqe5kjdPMgrvOAZ4ddEdRY1HRQkBnhV8GVHwFc2RxBSYR3wDWQMl/u
	 YYYEn5j7KA9gA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v2 00/13] ASoC: mediatek: use reserved memory
 or enable buffer pre-allocation
Message-Id: <174989956314.19870.6679132279735424997.b4-ty@kernel.org>
Date: Sat, 14 Jun 2025 12:12:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 24 Apr 2025 18:24:54 +0800, Chen-Yu Tsai wrote:
> This is v2 of what was just a single patch "ASoC: mediatek: re-enable
> buffer pre-allocation on some platforms". Link to v1:
> 
>     https://lore.kernel.org/all/20250401085659.1222008-1-wenst@chromium.org/
> 
> Angelo requested that these platforms use reserved memory regions if
> possible, and fall back to pre-allocated buffers only if that fails,
> to align with other MediaTek SoCs / platforms that already use reserved
> memory. The series covers MediaTek's MT8173, MT8183, MT8186, and MT8192
> SoCs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: dt-bindings: Convert MT8173 AFE binding to dt-schema
        commit: bb90e0c91d375ec5db8a4f8cd2555900aea0725f
[02/13] ASoC: dt-bindings: mt8173-afe-pcm: Add power domain
        commit: 2fd902152c15a8cacab91e4a660413d189411561
[03/13] ASoC: dt-bindings: mt8173-afe-pcm: Allow specifying reserved memory region
        commit: 473ee884263f2127ea4e46a74ba15d07446ceabb
[04/13] ASoC: dt-bindings: mt8186-afe-pcm: Allow specifying reserved memory region
        commit: 81c73294a4eb2df31e974db2fc4397f5e0ecae09
[05/13] ASoC: dt-bindings: mt8192-afe-pcm: Allow specifying reserved memory region
        commit: cd12d3a5ed10e3e3b323f2b2c652de1c8e17a750
[06/13] ASoC: mediatek: use reserved memory or enable buffer pre-allocation
        commit: ec4a10ca4a68ec97f12f4d17d7abb74db34987db
[07/13] ASoC: mediatek: mt8183-afe-pcm: Support >32 bit DMA addresses
        commit: 9e7bc5cb8d089d9799e17a9ac99c5da9b13b02e3
[08/13] ASoC: mediatek: mt8173-afe-pcm: use local `dev` pointer in driver callbacks
        commit: b2c090c9f6aa9d19f4c966233d7fcb872255f83b
[09/13] ASoC: mediatek: mt8183-afe-pcm: use local `dev` pointer in driver callbacks
        commit: bb8d8ba4715cb8f997d63d90ba935f6073595df5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

