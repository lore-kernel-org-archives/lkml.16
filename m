Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D85021E08D;
	Tue,  4 Feb 2025 22:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738709386; cv=none; b=PhI217b4iQYFjZL/PMk+bmXmZdHzrOk2Vs7oPkLjaEugaCVWkCMa6rwuVnO8cijZgr4uOMYrXZ6c6I+uw1i1QHdHEKGzTGi4vMB+NAMEfZwBAabRuU1psnW9/SbxCjg+Py5bW46BxN5Ow+fj6qXw7/f+abgVQxBzHXMYLPl3Ar8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738709386; c=relaxed/simple;
	bh=c21nkojC0/zmcsGKUYdOKW+3n0fPYKpSry/wSjAsMZE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=npAEo5xfYYaF3aBkIjCzwEUlF8S8tcsvMTpLkmm1IyceGYN3S7AkYg3lQDLDx8EBukWZN8OJhtQDKJvAa6ESjfaqZ5GafJCXRl5ZcI1bBBBQQvhLn4xNxE6V33FilcAr366RlhagKGLNgbgt8yqaSM+ySntRUuKV9KpeaVknH4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ewbEwJ+J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ewbEwJ+J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B756C4CEDF;
	Tue,  4 Feb 2025 22:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738709385;
	bh=c21nkojC0/zmcsGKUYdOKW+3n0fPYKpSry/wSjAsMZE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ewbEwJ+Jt2ylXUhNkdoMVd0/AKjvEkuEOBNo1ouFznOXb43uzl9PqUk/Iixr14s47
	 8kU3aEE/4o2sEGslFNpIUUkeFJe5sFAwE9QNSQQGHTuA5zzpC8PQeZDPtesGOQLRP2
	 mxpvCKRM68Yl6cf2JvPiQVER1f1C5UT2kCaKPDGoc4g2/vOuzPx1YVtZDkbPP0uNfS
	 LfPrc0VdpQnhv/4K1AkY2FuBrDMKJqyFpLSHdWwOdELTD99rWUKfO4237POzb2kgNl
	 8I7e5sycGQFzlNrexdnxzHcgIys4Mp30d1CLSdxrTbUU/f1Vo/c7yxyW7kWb5FcTQP
	 GS3f++FrkUcGA==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 John Keeping <jkeeping@inmusicbrands.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250204161311.2117240-1-jkeeping@inmusicbrands.com>
References: <20250204161311.2117240-1-jkeeping@inmusicbrands.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s-tdm: fix shift config for
 SND_SOC_DAIFMT_DSP_[AB]
Message-Id: <173870938377.148411.14544200141839813009.b4-ty@kernel.org>
Date: Tue, 04 Feb 2025 22:49:43 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 04 Feb 2025 16:13:10 +0000, John Keeping wrote:
> Commit 2f45a4e289779 ("ASoC: rockchip: i2s_tdm: Fixup config for
> SND_SOC_DAIFMT_DSP_A/B") applied a partial change to fix the
> configuration for DSP A and DSP B formats.
> 
> The shift control also needs updating to set the correct offset for
> frame data compared to LRCK.  Set the correct values.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: i2s-tdm: fix shift config for SND_SOC_DAIFMT_DSP_[AB]
      commit: 6b24e67b4056ba83b1e95e005b7e50fdb1cc6cf4

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

