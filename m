Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B11227BA1;
	Mon,  9 Jun 2025 21:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502856; cv=none; b=SPKasnt8hoiMhKt9CEJNPt4T4ZRIZERJ6292odi80jmzvK73jrGGRp775xJRR+zW4Qq2OdShlCr9GEa793YfPoxQ/tGo10Ly08cllK359tTBIBiAXD92P/isfCO9tiFLU9ToW0ePkxg5T+VQowVePNcjoOkZbXecq9sG4f3HLEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502856; c=relaxed/simple;
	bh=ieOEa6WuF3l6Ed2jnV0bnaUA1/amQpmtX3pZEZDGG5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tnrjtTQAqJ3ZXSI6pkRd0cxAqO2WQoXFj/QZDkq/mPwFVDsEeSLqYVACcXeiWOv/d0hcKL2uzz/u2svCUE9o6q5/SpY//uKvWK+LYZJwBZB6WqnY/KUopDuPHQNpgY35bjRmqjlMckLw+ldZLWcLD1KXcUKiTMEfIlHGepf08Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=troLZG4Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="troLZG4Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E5B7C4CEF0;
	Mon,  9 Jun 2025 21:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502856;
	bh=ieOEa6WuF3l6Ed2jnV0bnaUA1/amQpmtX3pZEZDGG5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=troLZG4YHItx4I8RpCauX4PUCbI+LA6HDaELEgXzOVTraEFedyrYD6O6ML/7BTY5Y
	 rM0rwDmveydn97QORdf2kcugiHfThnSINsEDLqHEDgEMcywTDLANJXySPUZwfph2zB
	 +wdQshpyxXeN+Rpwyg59BkQXrqn/2l/N0IdyJCIKJkz7vjAiZUHYml6Ar3G9gxnBnz
	 JEdTrrIo2XVfxCQGjd4f42xjA66vkUfx8ouSQ/JHVA5F7E7cJE/7v8CB5DKkXvTtEk
	 +RkYPq/ZtJlYiS8Au/3Z6Yn9mH/V27lNKGYHjrs8h3G177H/cwlc1kdvYTN1xRVtaA
	 7t2DJ8V/dngsw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 cy_huang@richtek.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Roy Chiu <roy_chiu@richtek.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <cover.1749454717.git.cy_huang@richtek.com>
References: <cover.1749454717.git.cy_huang@richtek.com>
Subject: Re: [PATCH v2 0/2] ASoC: Add Richtek RTQ9124 support
Message-Id: <174950285438.277844.8562649220481873561.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 22:00:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 09 Jun 2025 15:47:26 +0800, cy_huang@richtek.com wrote:
> This patch series adds Richtek RTQ9124 1x30W audio amplifier support.
> 
> v2:
> - Instead to add a dedicated rtq9124 document file, append the
>   description to the existed rt9123 yaml
> 
> ChiYuan Huang (2):
>   ASoC: dt-bindings: rt9123: Append RTQ9124 description
>   ASoC: codecs: Add support for Richtek RTQ9124
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: rt9123: Append RTQ9124 description
      commit: 5c694e3a83d089df6b00747cf4627735ea14014e
[2/2] ASoC: codecs: Add support for Richtek RTQ9124
      commit: 1f5cdb6ab45e1c06ae0953609acbb52f8946b3e8

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

