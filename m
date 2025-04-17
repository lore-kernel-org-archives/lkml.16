Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F1A254AE0;
	Thu, 17 Apr 2025 16:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906917; cv=none; b=jVdri45HdB6T4Zi+9eEQ+SF98GoZiRa4LwZxXMIGSq/IZYfVAePDpckkBVMOhEB0mbHBOrjnwD7UWnmz5nhrK5rqZ9NDdC86AO37vaqhq0BNVP635ZDldSg+SRT/Mtv1zttfaLH2keJ7y+WprvwQlOQk+8ED8JrK8AP2FwvAJKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906917; c=relaxed/simple;
	bh=2x+9YZNT7bxe9lhwnR1Ay+d7g2a7nS8Raa3g1b8LHR4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jYShd6RqFM3cVOQrJLH6eprgHm2EQ1DQ9ltdJo5vryuQ0l6w5/XR9rtGUvRctIhzPm9OEV2PO/+QqNKFBKeMoHWvGXVRjc2WcqI7qRaBE1B508ovJRTUAfO/jC9NCOopY0mRaHtLHC1D0yqUdbN5XDyYFY5g1iuUuudoMwiTd8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YuC1nQ5T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YuC1nQ5T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A666EC4CEE4;
	Thu, 17 Apr 2025 16:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744906916;
	bh=2x+9YZNT7bxe9lhwnR1Ay+d7g2a7nS8Raa3g1b8LHR4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YuC1nQ5T76pPqq8GWl13jmGTwr47Mj8+GpH3kmE6f4v3O5Yc+akjec0zYM/Ev2dqT
	 +oSXklOdzj0yzfjqwV1tgWDSdhj41uB2ztP1vLv/3jC6zujqSuzANknWto+onfFPo6
	 4IR1MvDJNDhwo/JKLEEfEfN5McvGsuzGnag9zll7Bh/+1ob5UZbljLKfPmPt5QzWHS
	 ve6GbOFdwmwM1Gi4/X82ZdL4BD7shouDCxSAcI2nTIchzDok+1z5YFDT13BdHD6ua8
	 8YVTT6gHFd+Nw3Njoo91BhpBadfWYdGd564PauQzRdqq91oDFbyUGKCMo0xEfTCF/Z
	 Iz0AH2gsw1Gmg==
From: Mark Brown <broonie@kernel.org>
To: kernel@collabora.com, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>, 
 Julien Massot <julien.massot@collabora.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
Subject: Re: (subset) [PATCH 0/6] ASoC: mt8195: Add support for MT8395
 Radxa NIO 12L with MT6359 codec
Message-Id: <174490691335.121189.17592023292811582537.b4-ty@kernel.org>
Date: Thu, 17 Apr 2025 17:21:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 17 Apr 2025 10:44:31 +0200, Julien Massot wrote:
> This patch series adds support for audio playback on the MT8395-based Radxa NIO 12L platform, which uses the integrated MT6359 codec via internal DAI links.
> 
> Key additions:
> - Support for a new `mediatek,mt8195_mt6359` card configuration that does not rely on external codecs like rt5682.
> - Proper memory region declarations and pinctrl setup for the audio front-end (AFE) and audio DSP (ADSP).
> - A device tree sound node for headphone audio routing using `DL_SRC_BE` and `AIF1`.
> - Enhancements to the DT bindings to document the new compatible string, missing link-name, and additional audio routes (Headphone L/R).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: mediatek: mt8195: Move rt5682 specific dapm routes
      commit: 0cb1975c717528b662f096b2874e4dae8a9a2d2e
[2/6] ASoC: mediatek: mt8195: Set ETDM1/2 IN/OUT to COMP_DUMMY()
      commit: 7af317f7faaab09d5a78f24605057d11f5955115
[3/6] ASoC: mediatek: mt8195: Add mt8195-mt6359 card
      commit: 3046e16d0605765ff0c5b99f1fa13fa35312eae9
[4/6] ASoC: dt-bindings: mt8195: add compatible mt8195_mt6359
      commit: 95f6208b20e4d0b427d32e5881be4257a3aab3c8
[5/6] ASoC: dt-bindings: mt8195: add missing audio routing and link-name
      commit: 5b974f53424d16165b606e2e2f9208d450a5723c

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

