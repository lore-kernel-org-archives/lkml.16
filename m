Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBEF26F444;
	Wed, 23 Apr 2025 11:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745408656; cv=none; b=eisivIksde6UZS0/wvZJBDrmqfyfycu50jygFmEpGb4l6KGhaj2FrwkH2qm+ODgAq2WEuIyZ/i1ww2uyl2Mzb7BbsMQ47fotetMDdlpU/fNxAly1x9rYmfjYXhxTDNKIXSkfm/sYyqE24P7TEfuQHS1wb5jMCsEbArjSCmbjDug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745408656; c=relaxed/simple;
	bh=vQWAgT7Iwn7jEUiHJ8xk4aq3zrIok3LX/0vZNqA9i/k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DzS0JAEyhUwEEZHj5D1F+Xdv53JNPVmn6RtAtzKHv9Di40Arw9Ub8R0XfPEpnoWeSCIHO68xMxRSGZGl0pPf/Icwi1pvmGIg5oUllb4FtBss5K3J3z5BIho754pnE6nlgRjRafVZ2t8AyXHKM2XpXkEkAFQPi6tmKVz2k1En0D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBGn7XEN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBGn7XEN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E92EC4CEE2;
	Wed, 23 Apr 2025 11:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745408653;
	bh=vQWAgT7Iwn7jEUiHJ8xk4aq3zrIok3LX/0vZNqA9i/k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HBGn7XENZiAaisVArAG67qLMjFcAhxtgHR+wW/Pdo3XNXgHKTuqRVIvNIb1duSNZJ
	 pgzp4ddh5m9W/UQDMDpSLygMgVXa8BLzNeWe0Q6WVptE2+mDPqLl+8I/sixBtW6Az1
	 VCQqinfHlIY44GNWFwzSQ/a/OYXKev+w9KdSPrWv4fnWUKXhl43rkt8U95YXwuDKRQ
	 RVosM9dthVEQzDDG4ZmQ5o8Qi0wFrzqAeKf2bbJQmZLnztg+Fy3vUty2hsyMXjb8/z
	 Drkt5Yw+F/w3iVzbn5ygLzKP0mismsaNzD0Z56bjofief1fB4bZehDTJPF3m6qh3Vu
	 QYd17dJbC0Q/A==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Michael Sikora <michael.sikora@axis.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@axis.com
In-Reply-To: <20250411-adau7118-dsp-a-v1-1-be3fb487a6ac@axis.com>
References: <20250411-adau7118-dsp-a-v1-1-be3fb487a6ac@axis.com>
Subject: Re: [PATCH] ASoC: adau7118: Allow dsp_a mode
Message-Id: <174540865206.26570.15373342000293538987.b4-ty@kernel.org>
Date: Wed, 23 Apr 2025 12:44:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 11 Apr 2025 09:49:29 +0200, Michael Sikora wrote:
> TDM mode on the adau7118 is dsp_a compatible. Set SPT_SAI_MODE on the
> SPT_CTRL1 register to 1 for TDM mode when the DAI is operating in
> dsp_a mode.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: adau7118: Allow dsp_a mode
      commit: 6d7ee6de75010ed5d70f1c496070c4a7cd1968b5

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

