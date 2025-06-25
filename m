Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DED2D5C61;
	Wed, 25 Jun 2025 17:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873192; cv=none; b=KT6M0/zRjN6upad9YKxJVSrysldR2dlLbqhThTgfIqRdtvlIiZoFANwMttAZ6zE8g83jYpxUML/g/WuAWUz6lqCivuzYZrB9hiCTz6QZCnJjMc1nAC4gFzGDOGJsQM+oi168tf8iuVOyIQ54EX0oXdI6+ooDjBDvb4B26iOWsnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873192; c=relaxed/simple;
	bh=sgy+eEdqBTswrmiw04uEhyyF2liVZpJAHgLHdaFZt8s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JslXijYwwelqcqaWMm7W9RRZSU9xwZYgcg4LWDkVgqMIPj+Oi6DnUqfBJqLGJxJFQ7CWWO/m6QeA6ZDn0ANcuInLRTLF2TQr48BaE+x6jCu0w7WAoFTAU4PsYyNUPfIrO5hSjEmv6F8OdB3Sk49+n/dA1KIA4Q3G41kaB26xoA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khUVif9O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khUVif9O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D5CC4CEEA;
	Wed, 25 Jun 2025 17:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750873191;
	bh=sgy+eEdqBTswrmiw04uEhyyF2liVZpJAHgLHdaFZt8s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=khUVif9OAr1tXZGo/dEidNSJVHaRdht2eCMbiQbUCvxyYPFrRg1Fn4f9MgxurrkgJ
	 sb12AJ3hr9R5uMWSL92mwXKJ6SSDNcHVv6S/OIfy1icoV40Lzys7rQ5WccrVXr3/N8
	 hSqBApQ1wG6qT5UUQC6PDdmKrI+JX+Rth6ueZiQ3VOS4dcLo+usdgB0CytmWJJbIm0
	 EdwkdxRuHJ/7r8BCItKiq3/wM/l9xZiYZAWkUYNMFry73OXTc/k5/FYx+pGMPsWLkl
	 WvdZAx7dOgRQxzHJyqiqcJIY0HM8AvrbmOmfbOfIuqUpcaJTl17jNiq+yHmV7E1aRu
	 ck0iUhl/3lsnw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250616-asoc-wcd93xx-enum-v1-0-a20a1b538509@linaro.org>
References: <20250616-asoc-wcd93xx-enum-v1-0-a20a1b538509@linaro.org>
Subject: Re: [PATCH 0/4] ASoC: codecs: wcd93xx: Drop enums for chipid
 values (minor cleanup)
Message-Id: <175087318970.198995.7502242059805940864.b4-ty@kernel.org>
Date: Wed, 25 Jun 2025 18:39:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Mon, 16 Jun 2025 13:54:07 +0200, Krzysztof Kozlowski wrote:
> Minor cleanup while preparing for adding WCD9378 support: do not use
> enum for values which are not an enumeration.
> 
> Best regards,
> Krzysztof
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: codecs: wcd937x: Use simple defines for chipid register value
      commit: 2f6ff1e615cd4f8a86c9d0e4e778db9ae44d5481
[2/4] ASoC: codecs: wcd938x: Use simple defines for chipid register value
      commit: 100877df34b00257c9ed6d279b06b3ed1da5e2c1
[3/4] ASoC: codecs: wcd939x: Use simple defines for chipid register value
      commit: 5d3ccd356e2ce510bdbd4b0c389f2fe3deb41a45
[4/4] ASoC: codecs: wcd939x: Add defines for major/minor version decoding
      commit: a48352921f0b15b1f7eff83f5b5613d6ae2350d3

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

