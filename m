Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D59E17B4EC;
	Thu, 15 May 2025 14:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747319075; cv=none; b=PqJaPabmI5Ug22S2SsODl54gEq6MR2KaT4GKdcMN1QuTBmf+EnxRzqXif0v1S4jWLMsbDhcGut+EezboK4gXX6QVf13zQAEEk3dZ2pzfEfFf67TIH0hCxAnmmJf6QiOgSBoP8cLxgUis9a1DWFvi/ZzWh5DLJ1RPrQwDWC7l5j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747319075; c=relaxed/simple;
	bh=YeiOfXX6SYoNVeYhSe2fFoez/4867S6g/UJ2uYpEv/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BnMGm4ExkqTq4Y19Fl1EIYW9Fscrp++S8QDWYCUQdCVfli+ZNB5zFK4EnXSjKrabXp3w0lpaafZLXH6wrWj0ZhIEXg9bmy3hNQT9xYEpwOj+MERVAhzz6giw3h1sSGkUJYg/4Mq6c1bloUzmHDUKxS9rHTJlpd6H05id4qif7ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpNcyrit; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpNcyrit"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25393C4CEE7;
	Thu, 15 May 2025 14:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747319073;
	bh=YeiOfXX6SYoNVeYhSe2fFoez/4867S6g/UJ2uYpEv/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LpNcyritQ3NECd/Y0i1QR9KDvuYmyvvnPUA7Lmz2EgbZluW+PhjMT5W3Ki8rczIFy
	 cdrd6x8mD/RawpEx14RMUeFNzk9qCVVoQJ9TgxZ2kh8W3/G0ExoF3w3xIXIFQvzi/d
	 zl+MG2r4pPeqda3Dct4uC2lLtlCmY8FmmpIenStv83ni+QsboazyX8eJduM0xWtQnl
	 DqSPtH0C5CDh7kP5x/Eczm+lAadWTyDlicP5Qh+hUSFDaXxgWkRmi8SIOYjix89dRJ
	 1liZriIs5LVh6hYvSkiOpwWEnlXqsw/Gr8EmqWFKa3MJ7nWSqvaW0puk6hm5QLWCDr
	 E8p72wwBKz5Kw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Darren Ye <darren.ye@mediatek.com>
In-Reply-To: <20250425082551.1467042-1-wenst@chromium.org>
References: <20250425082551.1467042-1-wenst@chromium.org>
Subject: Re: [PATCH 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source
 code
Message-Id: <174731906955.355366.5967151829535099714.b4-ty@kernel.org>
Date: Thu, 15 May 2025 16:24:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 25 Apr 2025 16:25:47 +0800, Chen-Yu Tsai wrote:
> This series is meant as an example on how to use macros and range cases
> to shorten the MediaTek audio frontend drivers. The drivers have large
> tables describing the registers and register fields for every supported
> audio DMA interface. (Some are actually skipped!) There's a lot of
> duplication which can be eliminated using macros. This should serve as
> a reference for the MT8196 AFE driver that I had commented on.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: mediatek: mt8183-afe-pcm: Shorten memif_data table using macros
      commit: 91c2685430f217ae8f2866e4372948eaf123b5c4
[2/3] ASoC: mediatek: mt8183-afe-pcm: Shorten irq_data table using macros
      commit: 0be889823f93429dab396cb7ac061d02046bd962
[3/3] ASoC: mediatek: mt8183-afe-pcm: shorten mt8183_is_volatile_reg()
      commit: 29552dcc044a233be84ab9b64539fdc7d8f4314e

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

