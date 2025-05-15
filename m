Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BBC17B4EC;
	Thu, 15 May 2025 14:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747319080; cv=none; b=L3aJiwrWyJS9rxS8JmoN9b5gc6xFdWzrcxFcmb64PCwfe7AyTl/LwYscd9dT7X16mYvApp/rja/V7erioQCUW73RXCLVyaTtPBLt5aYLHN/qBG2PXpoCv/Ck/K8r77auu/FGjRNxdISmhtk5fkaHyblAzczbxwxcZVlQ4lphcng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747319080; c=relaxed/simple;
	bh=XDgcBvyX6F4CWv31xvsx2QdDXOR+w8P/sVKcor0Ztk4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Fyhw3/AMDHPHMxKsBvnMiRF8vmmgeL7n2INrSpcsgkURG9KQDocLi5WRDFIkw4fzeFXZlWa8aJpbBI+NJRaqUZVcrVGcY0FP8txpJaneAyyIiSGKJmM5ETzsl8jo9VATlDMJQCFfzY4e9uKCgK01itVTj5htO50N97uDwa3KjsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QnCteV9d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnCteV9d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58401C4CEEF;
	Thu, 15 May 2025 14:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747319080;
	bh=XDgcBvyX6F4CWv31xvsx2QdDXOR+w8P/sVKcor0Ztk4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QnCteV9d0SEhl0Q7CGh0aDAZEzobi4ilmyEM4Ab/VLX9S0vK5MHjJgPQcDrsx9TvI
	 otWduQUhcbnTWygsjiXbPmGVmBETKA5iaJQP4K9kjlWSqJnqOj3Wp8Tu6SjYSsl9UE
	 nIbgoZZrrQ9CR3oYmTtIO+JoGvbFSqqR74V5nfGdupEVJXW60vrVYplUu1Xrm06ksq
	 cTzLsd5VXzhwU8A9z922Ow4UNNajgdvb/RDOPX+7Kj+h7uci3TLjIdTo9J9gai1W26
	 nYzrfhSeGy+RStrjcufhh2aB19PagLW0ySLzPEhkTlX7RKiqnOkBNQakpxduq7s94s
	 PtsP+PXTdzGGA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Darren Ye <darren.ye@mediatek.com>
In-Reply-To: <20250515073825.4155297-1-wenst@chromium.org>
References: <20250515073825.4155297-1-wenst@chromium.org>
Subject: Re: [PATCH v2 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source
 code
Message-Id: <174731907367.355366.17373014449076976140.b4-ty@kernel.org>
Date: Thu, 15 May 2025 16:24:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 15 May 2025 15:38:20 +0800, Chen-Yu Tsai wrote:
> Changes since v1:
> - Rebased on top of -next, dropping changes that cover the DMA address
>   MSB registers
> 
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

