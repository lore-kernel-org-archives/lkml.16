Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93036227EAB;
	Mon,  7 Apr 2025 23:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068958; cv=none; b=o9NGNyY9ScahIzFY6nI5bjGwljfgj4cP/HKzB38yCsNlpd0G/T8ixh6zTsRu85wwRRlzxt5gwBrg3EpSOjyjHeUql2NBWY074AoTz5eYiDal2JTUlzmcUqVNQx7qcqHsl6FeLKVVXNJBhVS36rP3Yg7T87C06H1vRhdxLDiAt4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068958; c=relaxed/simple;
	bh=/z7hTbC2Tb83HvocgGBMaDIyuX2dpreYSjdsnXw0EzM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ncMmfsJaO8s5zVNl2IxP5PoCBTIyT48G0inxvBgjCuEiO8VvEdVB/yfaTdqq+XHbpMibEn2zaKlqtSk5DhvdlvRF8x0MxVQSrc1v39vuYF1PL2vvb+kixl8LAFTQC1Xv4Gb/lzOq7bOpmgN9cV5/YYGm1fMc7w7dLsu8ARq50/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ciDyeGuj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ciDyeGuj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB30C4CEE8;
	Mon,  7 Apr 2025 23:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744068958;
	bh=/z7hTbC2Tb83HvocgGBMaDIyuX2dpreYSjdsnXw0EzM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ciDyeGujRny0XaxzKcsihCyCw5kEbBss8tMWV6F9tpBc7nCfKfPk6iRuEQBjsFzzX
	 RvqML2ZViHMYjL18WeeR6pa+Nsc5Eo0f0Sh+9ikUOr5eHzlLwXo7zBln0i5W6k6/JN
	 z+23TeoubYMJKqn18pgEXErO7cB1rCmFpOGYsq3b9+78MyCGopyZg4GakrBGI9kDKA
	 piFTaZubMo0sFjK5T0lPd1DiNlj8NJNuCFS1T0VlqdA7EVcyvOxdS+X0UuOSfNfq2z
	 5rYbCgmzw2/iRMESoLcFpA3aj2mPnMTB0LYSpQDHFAYhSIZgPH25gNV7RkJ/Cew0Zq
	 UF4V9Zgf8wrgQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Clemens Ladisch <clemens@ladisch.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Thorsten Blum <thorsten.blum@linux.dev>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Maxim Mikityanskiy <maxtram95@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 He Lugang <helugang@uniontech.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Tang Bin <tangbin@cmss.chinamobile.com>, 
 Philipp Stanner <phasta@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250404121911.85277-2-phasta@kernel.org>
References: <20250404121911.85277-2-phasta@kernel.org>
Subject: Re: (subset) [PATCH 00/11] sound: Replace deprecated PCI functions
Message-Id: <174406895437.1337819.1919250165088744285.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:35:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 04 Apr 2025 14:19:01 +0200, Philipp Stanner wrote:
> pcim_iomap_table() and pcim_iomap_regions() have been deprecated by the
> PCI subsystem. In sound/, they can easily be replaced with
> pcim_iomap_region().
> 
> This series was around some time in late summer last year as a single
> patch. I lost track of it for a while, but Takashi Iwai (AFAIR)
> requested that I split it by component.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[11/11] ASoC: loongson: Replace deprecated PCI functions
        commit: 7288aa73e5cfb3f37ae93b55d7b7d63eca5140a8

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

