Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6477422DF9F;
	Wed, 30 Apr 2025 22:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053519; cv=none; b=aK+LGziHl2Nwyyg0QQ33x9Z2vzISL+6Ruljk5O8BfefUEB1wj+1GeYZk2MYJb+m8gBhw03YYMLUCptoGhCy5ytx/O8cjGWsIu6N5KLRjheifeyiAVCS/p7LvCUi7tJdE4EX0q0BU3XB9noRo2kuSAEah8jzYmdQN6t6nF7f01BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053519; c=relaxed/simple;
	bh=8yZCHsEHcLADZIEBu91S+K4//esSQp8worNl1Zh7d9Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kf+CPaUrUuWMkDx2xUFe8b2K5veues+teaRq9TN8pz0brJtFsvTpD84JmzrA8F6Fx84Svrf13MQrPSlz2vWPgZqRog8cFuyHsssjeX7bOfQaAGboz4sNyJThiVbyQtyJfW5aPaufM5cNbt9GLrzs9IsFGOlPI4j0OO7DgDkACCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cf4itijt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cf4itijt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DEE0C4CEE7;
	Wed, 30 Apr 2025 22:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746053518;
	bh=8yZCHsEHcLADZIEBu91S+K4//esSQp8worNl1Zh7d9Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Cf4itijtCWhkw06rgntKKpr8HtTMHx9g2ysoemc6TSKKvqYBwj7n7neif03/LlhlS
	 ajlk3t3w1IiSnLOlicrgJWZ71FZhWag/txs1VZSsrMjJr7CeM8O9mf/UpRBFJOXpXc
	 62t9MonpjAS2WDKXAy5w5osrvup3mmZT6aHbaDHa8mPA4T+4MTQrhqeFZ3A7tWzvxa
	 xb0qh/mzjv68U79EfbDNFiLxOZeR8FNOJMY9tLO1iw8XmOJhWrpSNXNhQOWAhIbr4h
	 0KdX8gDe4PuTinQ4azN8o6GwUP1PycNGucwCc76wePNB/7pVJtmTiAr7D2cjcKKkgx
	 xiaaoSCzJ50sQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Weidong Wang <wangweidong.a@awinic.com>, 
 Colin Ian King <colin.i.king@gmail.com>, Eric Biggers <ebiggers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Zhu Jun <zhujun2@cmss.chinamobile.com>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250429071032.65391-2-thorsten.blum@linux.dev>
References: <20250429071032.65391-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] ASoC: codecs: Use min() to simplify
 aw_dev_dsp_update_container()
Message-Id: <174605351505.3987837.349860435821429679.b4-ty@kernel.org>
Date: Thu, 01 May 2025 07:51:55 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 29 Apr 2025 09:10:13 +0200, Thorsten Blum wrote:
> Use min() to simplify aw_dev_dsp_update_container() and improve its
> readability.
> 
> No functional changes intended.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Use min() to simplify aw_dev_dsp_update_container()
      commit: 84dea31d33e0f4651eff6ee2e1e02804ff2529d2

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

