Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CB729B8E2;
	Mon, 23 Jun 2025 16:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695159; cv=none; b=gMf6C7scZR9CJmU5hWUVXfcdYKivQmBJmArB3GG+GTRdwuKbH6lOvwlqqFikDLafb6AMjrJa8nc574ZFrwjgbZ1HEGNG5iaTXwHeGuO6N2D1eyi0k/z8M7MjZI5Pgj5E34R+abkpkjTVZkSmG2ukMR9B97GXj60gOtgPXYTLS9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695159; c=relaxed/simple;
	bh=ZAnwQDqTESYH6oy4uvfg/zruit4no4oBmPm9404Wxng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r84rBIvxcY3va8mj3F5CdzrfZ21qHVeJ0y/sANdDHbe80AngTmuuvoy4llcSZjA8SGDumithIQN4lru7+GRxB4Vg3xJQbty5Y6xiZF7MwbQS2cyGF6jxaqTKv1xg1tkhVG2XqskbtEs0NbfznLNNo8rjW4EK1OncjohCVJS5km0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbvzN3MM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbvzN3MM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2264AC4CEEA;
	Mon, 23 Jun 2025 16:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750695158;
	bh=ZAnwQDqTESYH6oy4uvfg/zruit4no4oBmPm9404Wxng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lbvzN3MMztshVTjkgSlF31R0UTLMPY271szcuu4G50fJdgJG5R4REwswZEpGO/45v
	 InNcpiAM37DYqzvlphdgG7swwHlRhz3LQUM/DV/ryfOhsZQtw4lHKzwYSOGIQd7BHn
	 ofue4ZxR8Q8vXL4iQ9vgD4vHDiCiISWi/XGrt5Ryhw1KFXp4FOWGwnb/plDDPBHuIb
	 sg/8+v3MBilMYQ2JS5UL6EzMYjRWwFEBw53QeGaQomkPnb35C0JkVPgymkRZV7OxxR
	 uP3QEcyTBur2fCGs+EgfjYtpUYXYMZqHbfxFO3x4j7AcpaHkPMiO1ICHBBAmVf2Flf
	 fCnwB3IOHKopQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250613-asoc-hdmi-eld-logging-v1-1-76d64154d969@kernel.org>
References: <20250613-asoc-hdmi-eld-logging-v1-1-76d64154d969@kernel.org>
Subject: Re: [PATCH] ASoC: hdac_hdmi: Rate limit logging on connection and
 disconnection
Message-Id: <175069515687.146175.12666282913525155773.b4-ty@kernel.org>
Date: Mon, 23 Jun 2025 17:12:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Fri, 13 Jun 2025 17:41:04 +0100, Mark Brown wrote:
> We currently log parse failures for ELD data and some disconnection events
> as errors without rate limiting. These log messages can be triggered very
> frequently in some situations, especially ELD parsing when there is nothing
> connected to a HDMI port which will generate:
> 
> hdmi-audio-codec hdmi-audio-codec.1.auto: HDMI: Unknown ELD version 0
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdac_hdmi: Rate limit logging on connection and disconnection
      commit: c4ca928a6db1593802cd945f075a7e21dd0430c1

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

