Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356C626A08B;
	Tue, 25 Feb 2025 13:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740490732; cv=none; b=psVIgTMZraarHq9EDq3/NeXfZHck3qFQUMN+SkGap9JGBePTQijnuWD2tUKu9tDdSNpfr0QRMGKG5k1E1cTlr+TJHzDvUBJJ3HoXhLZTcvZPn6v82dS+X+7PlxMomu1xwlZJX+Y2T4h23fOEYpyRWWvXz349NRsIyjwsXn/zy94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740490732; c=relaxed/simple;
	bh=mfVp+xpIE916X50N12X6HEihv4Q4eW4IWjDJk6jczfA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UhBtCkogQs+FmjPZmAb05Xcyq4ovvJxSCC7DuNSmwk+4hg0bAFivmsmV6v9vIIIxN9avE5+/CbJXfZlIrSVzo/7BKciTsIPjZq3x8y1uT4CnfH1yQyPGN/CZfIsPcDcw5ew0ows3THdrl6Kl4ybzPSB7yjLZu4ZG+UscUXUju2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVVTD0sE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVVTD0sE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4599AC4CEE6;
	Tue, 25 Feb 2025 13:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740490731;
	bh=mfVp+xpIE916X50N12X6HEihv4Q4eW4IWjDJk6jczfA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mVVTD0sEO3foXWmxsKZAaxFGUTg+07z2MzGr0hqQAxA6JJixLIqhIl7rxRiVc9fLG
	 tiN0WTKqDlYHRX32aoFZ5sVgcIEIZrsdUIi/tqjnwB/P0G+gIzc73pwNQCuLuReJkm
	 XhiO9Gus4YebtVc3SdnCrZzruyPTDiZh4EHqhQL3tCBWVRuZJt+mzhQXgaHCcn3eUQ
	 CroigkwVQckxxPLE6TYUfOXeg24oU4etyICKPwlwh2g5CEJkvca9zPVv6iS3apS1gY
	 AQBelJekY5NDpJoK0XmidIp3T7H1WPxRntS93P7DkfwCkqLZmzKYQt7Bjs8JOwvoJb
	 ejgj7kUucAiOQ==
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250223202741.1916-2-thorsten.blum@linux.dev>
References: <20250223202741.1916-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] ASoC: fsl: fsl_qmc_audio: Remove unnecessary bool
 conversions
Message-Id: <174049072899.42497.14898738709764389886.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 13:38:48 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Sun, 23 Feb 2025 21:27:41 +0100, Thorsten Blum wrote:
> Remove unnecessary bool conversions and simplify the code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: fsl_qmc_audio: Remove unnecessary bool conversions
      commit: 2fa56dae1a65e8124d417a31d7b02c37df013817

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

