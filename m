Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938A0152E02;
	Mon, 31 Mar 2025 17:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743443358; cv=none; b=aRiI26xL3JQBgB1PlzwmfN5ooZSo1nFlPUoBu8aRLbSJIikanlqp40XDMwjaH2PTWhw9cUS1t71OwasgYy1VgnQ6S2CXqEix+x1t8emYBiB/UmgYugKPV+BCg+22a82vC7v4fUMga3XUQI9T0pdRR2KdhZDtPhOukwA+RTTFb9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743443358; c=relaxed/simple;
	bh=r9T6LdVle4KC8nugrBNKg8wutcTzmSRH332+mnl/2Tw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g7ue93HP74lZBOKv4ImagsnF97yD2UJmIkZ/prNKQIqI/AC7NI0sbZnpNQJKBS52Cf5YxP90U8Wv1+nTcJuOK4iQIny6p1OJ24Zz8c0iB2h1v9mRTtj0o3W3K3Ok+ZLMWp6TjPvvHqvs2QHfIznShCZ9RwYAcQ73iCnfG0Ja6KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlGt2+lS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlGt2+lS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51168C4CEE3;
	Mon, 31 Mar 2025 17:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743443358;
	bh=r9T6LdVle4KC8nugrBNKg8wutcTzmSRH332+mnl/2Tw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hlGt2+lS0Rt8N+SRV44QqzCei0+jALgVdFbtzodpDk7/lBe6lHUKKp45sZD0OvnnV
	 hrWuISJnEgrmU51G04fOPKKKnsW5oytOaJg5OQ/qzVhGr4cNBaW9RMtI2Hu7O5+JzP
	 UWrhI3eIqQqElpBipsu5fGZGJt8B2Q3fsNgNSDcmwq+qkAMSxPb3w5hyZWNPywGuhD
	 /2seZLdyav0Bd7FLnEaMkF5R+wFzEJXSvsVvJXjxKnAer18jRbeQGILv0Reoo3oPzC
	 B1Hhv/yFnBj6I9a+SxXbE6hN+ERGoXyE1VdhCFeAMI9OBAMW18nBw2ODDMfz6yrcp8
	 y+xSvvv9CAviQ==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bard Liao <bardliao@realtek.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <e3c2aa1b2fdfa646752d94f4af968630c0d58248.1742629525.git.christophe.jaillet@wanadoo.fr>
References: <e3c2aa1b2fdfa646752d94f4af968630c0d58248.1742629525.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: codecs: rt5665: Fix some error handling paths in
 rt5665_probe()
Message-Id: <174344335604.156807.17437043302594599763.b4-ty@kernel.org>
Date: Mon, 31 Mar 2025 18:49:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sat, 22 Mar 2025 08:45:49 +0100, Christophe JAILLET wrote:
> Should an error occur after a successful regulator_bulk_enable() call,
> regulator_bulk_disable() should be called, as already done in the remove
> function.
> 
> Instead of adding an error handling path in the probe, switch from
> devm_regulator_bulk_get() to devm_regulator_bulk_get_enable() and
> simplify the remove function and some other places accordingly.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: rt5665: Fix some error handling paths in rt5665_probe()
      commit: 1ebd4944266e86a7ce274f197847f5a6399651e8

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

