Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7090B1A4F12;
	Thu,  6 Feb 2025 20:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738874666; cv=none; b=cwfftGQEwJuNId2H49vQJ81JFvmFeNS23nMzfOxWLHNAdh25s4YQk08d5qQN77xKp4X+3mUv/TikLH0YXOpUS3AFsLJGQlrEZFPIhFfvn7fkNIK+tQxCQIlsci9nSF6TGVC5S/UK0e6LpvdflSELP8M2TwVF2NkQKFu6ntnYqcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738874666; c=relaxed/simple;
	bh=PunxRy4umKJD+Xu7khFl9tZPmLgSWeojiM9lIdqaoX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nhFkEC4+wVlrJ5GW9L+QvFMLCf8kdb1Pc9geDtAYMeui70KjOX7BFS0QA3lj784k2cNY/zrMOhwiamMoHOG9YzgHi37c7Hy3FZF0kVrOgyzhwXQkraAjCCTLLyXVtPjGTMu2AV2Xr3RNuubCVDj72MBQK2drGx5KxjXp71iaTdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhpdhSjY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhpdhSjY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA8BC4CEDD;
	Thu,  6 Feb 2025 20:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738874665;
	bh=PunxRy4umKJD+Xu7khFl9tZPmLgSWeojiM9lIdqaoX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DhpdhSjY+S6rOuS6Kgu9k9N8UR3Qf4tgaxLfuEoUbtBo9Hj6E6kwaw8bVvL8/U57r
	 jD+N3uNLM70ZZ0KjxV3NtzvGJvc3VmvN9zRZDefNkveMBe2rptxrPmzEMpzvhKO87V
	 aZ5ABq18zGn1NhKnEHCAqM3M1Mo6flV4hCQ4ayaZsQxd0gxz4DsrAopyomEWbXR2w5
	 5qgWsJeGzz+w4zF7xRvCbUE0AM/AFJkTu4yLEo+w9IrPtnaooWA8M3HFpJ6s4mDREG
	 heDCjoXyh/nvejrnhtWxS4T3iRqhQ9qaRRfKD3a+7Odr0kzE9eqBsJAIhdqcaEUSjP
	 dVE/3kwkiKlEw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20250205165226.3466137-1-masahiroy@kernel.org>
References: <20250205165226.3466137-1-masahiroy@kernel.org>
Subject: Re: [PATCH] ASoC: dapm: unexport snd_soc_dapm_init()
Message-Id: <173887466426.363675.10031813537365510055.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 20:44:24 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Feb 2025 01:52:16 +0900, Masahiro Yamada wrote:
> The symbol provider (sound/soc/soc-dapm.c) and the symbol consumer
> (sound/soc/soc-core.c) belong to the same module, snd-soc-core.ko.
> 
> There is no need to export it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dapm: unexport snd_soc_dapm_init()
      commit: ecfcee245cc99def0f6bf84ac75ac372f8ab65eb

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

