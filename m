Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A656518B495;
	Thu,  6 Feb 2025 17:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863021; cv=none; b=tFIluKvgbA/RT+qzBSAnnDME+OxrI9PxB5Zh6Fa5XSBqE+2NewpDjrzU8NQtxiPKWc6K+4oZxrzXlanAhzeaETl5AsnRZdLmapk+TNtr3at0yBkXmhn58lCIYddIAmHE/2BH9aa152azADiqy0tKKHvsW0K4ilR050mgpmkBhLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863021; c=relaxed/simple;
	bh=+PAq1d83UlU8oLR/YEeDk9SvrGKk3RNvw6lhYjscWBI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DCDKIaC9vrpTONH6rCzqgFfauOCFNRw/EDwYYsHPE6NrN9yE6fmF14DqV1thLyAsI9tT2DE6LkWLUjCKFAHu/2BB5mmyWBGVIK0k+vgPPxzB7RDY4FWgnHoILHXqKbBtmOR3WE+2VBppK7FgJtHfxeX4Tvv6YOZZUOOTj7xiiNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PitP9Zed; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PitP9Zed"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1FBC4CEDF;
	Thu,  6 Feb 2025 17:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738863020;
	bh=+PAq1d83UlU8oLR/YEeDk9SvrGKk3RNvw6lhYjscWBI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PitP9Zed77UsBd3nKEkR0UAclDy4vwOIAmfNR+jk+dqPCSZF6vw1xnzwr/TxzRZJ9
	 qDXQM3Sy2uS21IDxmqF/hvAex5tsMs3AlKNkDf72xX+1Nj+qMyfBg0ucmNMvgI2vPC
	 cPbwHAPEfdnBXDoTo6gWSHEn2nLpXpg0bJs+D1HCLxq0LfvvHSM5b4emdn//2EgUbb
	 O4MNsVagzyWudHQLRIo890+MDEQWXrKN92n2tQ6GmSRuIF9evVgWh6GvD0NMIL+926
	 NUU2d3Gh9+5jkHxSHtKcko6x50/H354RwJHSL4KdM0c/LYjt9roG5m8VkJDfD8uD9K
	 zj+0Q8Kx9f4sA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250204153806.3587-2-thorsten.blum@linux.dev>
References: <20250204153806.3587-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] ASoC: SOF: mediatek: Use str_on_off() helper function
Message-Id: <173886301607.325569.16667965221124695083.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 17:30:16 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 04 Feb 2025 16:38:04 +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_on_off() helper function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: Use str_on_off() helper function
      commit: 3f75771987f32a9f512c8944e70e343f8c6d71c1

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

