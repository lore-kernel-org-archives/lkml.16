Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D89D274677;
	Fri,  9 May 2025 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781128; cv=none; b=tc+520PrcVg8d54jDV9sWx4Q15RA4ghT3bPT9a+s2VC3Up2nW70sacZQb3q8dNRBjetqQROhCkEtUU415NTpN3Y9IdnEHrzt0/ZLD9yeCOZa8wVFqXWyylx8vraCJtuMuMKIuVIa2Qqmy1IPBBowVQao9OYtXG9r/0S69cntSo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781128; c=relaxed/simple;
	bh=NUJlMgnUlRyto5/zMHlqn7mzxNUcNXMEpllPFIPNjHE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DkxuMC1PySdAwFKfejbqJmhVC9fua6nHDmeKQh3353yyaU9qVrCNKzFjerHooYp9yVU1eIHIgMUr2TXp60aZLxR5OZv8sEifKnB+y57+GSGNjjvPnJapQUnNyRRtGRvUwjcsVkMAMOHfNH/La1OZuGR2FkqoysR2HECJBr9AIA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwyzcisD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwyzcisD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062BBC4CEE4;
	Fri,  9 May 2025 08:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746781128;
	bh=NUJlMgnUlRyto5/zMHlqn7mzxNUcNXMEpllPFIPNjHE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IwyzcisD6hzqPVhmFV/UySvLYxcE8JoriuZ19JQMlr54EzhhzyzjMaUxwqN0+gein
	 fIGJ1WizkLOGfTorbznQEOgeGpJL4ZIatfk7pxTM1ZWxWjqDhE37FaDQcUrDT0P+gG
	 6smT4sL2tqOkL4AOq28lI39sWILCKQjrR0WCH2gcaHAZq+IyS3fAaFqR86u6zeuZoJ
	 7gVL0nFNp8/+sdV+vVOAmn6l7jjgNiE4gOyh6e94cAMRs9da84usTdLdPe6ZT+nYoF
	 ieuhqHf1d7T6cdn+DLJ0wJ+kh3XDzXttrzM2dJAX5aMWEB6BtIn2KiFiFcYWfAWM2B
	 tPRxa/hechyVg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Zoran Zhan <zoran.zhan@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20250507-mt8188-mt6359-accdet-depend-v1-1-aad70ce62964@collabora.com>
References: <20250507-mt8188-mt6359-accdet-depend-v1-1-aad70ce62964@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Depend on MT6359_ACCDET
 set or disabled
Message-Id: <174678112414.29979.2917402833370390569.b4-ty@kernel.org>
Date: Fri, 09 May 2025 17:58:44 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 07 May 2025 16:14:14 -0400, Nícolas F. R. A. Prado wrote:
> Commit 0116a7d84b32 ("ASoC: mediatek: mt6359: Add stub for
> mt6359_accdet_enable_jack_detect") added a stub for
> mt6359_accdet_enable_jack_detect() in order to allow the mt8188-mt6359
> driver to be enabled without requiring the mt6359-accdet to also be
> enabled, since it is not always needed.
> 
> However, in the case that CONFIG_SND_SOC_MT8188_MT6359=y and
> CONFIG_SND_SOC_MT6359_ACCDET=m, a link error will happen, which commit
> b19fa45715ce ("ASoC: mediatek: mt8188-mt6359: select
> CONFIG_SND_SOC_MT6359_ACCDET") solved by selecting
> CONFIG_SND_SOC_MT6359_ACCDET.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188-mt6359: Depend on MT6359_ACCDET set or disabled
      commit: b7e3ec4e17e27420ebe976c7714881b64c28d63b

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

