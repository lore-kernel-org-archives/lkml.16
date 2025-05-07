Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8B11A29A;
	Wed,  7 May 2025 00:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746578946; cv=none; b=uJ6YcHHzRw+JFeStrlZPQyp9YhWA7IdvcwHMw+ihH7KwuRueCgLwaGnILFSeKBln9MganRzlITSUTr31+3wTzB86lIqtZ74/8oL2M1oMP2wMhelRRWF/13lp7aagxSkPUedq+MNNlP2eNM0zS0CGA0n+P7z9vnK8GvdqrvThv0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746578946; c=relaxed/simple;
	bh=XKxvYVU7eC+gRceCUM5Tn+8dTbfgkloh/AOA7YMVN04=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WT4xf/bDSRCgJz1DftlzAykrXbPJQbtWLmbe+sDzaxgSK1X51BrM2vkJLTkqz0x/RTmsteSyPA4ZIQaNjnJj+r8dKTBXAREOnc2Gc2fhsEWWTm/IQkGwaI5l8wwp5qUQiINENOTxNzJ42n6iHIfHXWZru6W+gXaqfpd6PGpFvpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WrAPPnz5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WrAPPnz5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E439C4CEF0;
	Wed,  7 May 2025 00:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746578945;
	bh=XKxvYVU7eC+gRceCUM5Tn+8dTbfgkloh/AOA7YMVN04=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WrAPPnz5GmzzxWrq8VEPQRa53RMjWDr/dBXmY3t4fMgXrtQgO2DLuj+9SCz8CP6hC
	 l4D/dS9nNjsMj/m68X0XtAndk+s5o2VZsYVVHiRo84neojMHTTJi8GjKx61Q4usiLG
	 pnLp4C2SCm+nxc3siFi6T2TJGoUGc7wByCAgVWUmtg8nBKqGvHe+XJ23NCdrQPv1NG
	 +Mk984BhGV4djm6hT2x1zffZ4fI/k5oj051xtvswa8mi/oal9FRcq/uSFBwbhWbI8D
	 OSp74FVZkPS+zMnvbaxtLRnA1cfeu/V49Yq74muI4BQw1jOwxjqHY0LJojQJShR4A5
	 EB4QzsZFnUPyw==
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Zoran Zhan <zoran.zhan@mediatek.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250505052106.1811802-1-arnd@kernel.org>
References: <20250505052106.1811802-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: select
 CONFIG_SND_SOC_MT6359_ACCDET
Message-Id: <174657894243.4155013.16755704226665079789.b4-ty@kernel.org>
Date: Wed, 07 May 2025 09:49:02 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 05 May 2025 07:20:52 +0200, Arnd Bergmann wrote:
> The driver support was added without selecting the codec, which leads to
> a link failure:
> 
> aarch64-linux-ld: sound/soc/mediatek/mt8188/mt8188-mt6359.o: in function `mt8188_mt6359_init':
> mt8188-mt6359.c:(.text+0x19f0): undefined reference to `mt6359_accdet_enable_jack_detect'
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188-mt6359: select CONFIG_SND_SOC_MT6359_ACCDET
      commit: b19fa45715ce9cfcc597ed140df31115e969b39d

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

