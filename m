Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B6122E3FA;
	Wed,  5 Feb 2025 12:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759471; cv=none; b=HahHw0L3/2JpkZhUHAADU7PadIi3Gf8KA4rcIWo1/VEPYBrRr/2V1G/2q8tXs7w8K6UCciSDAmpJgV3sAJRqGDwGagxGMy4EsWS+3tAxf0L6j2sxB09Q6Zru1kscT+/rHVLJfiHX7l4fKEVirEdPQETSUCNcE5e4xbBvKmbzOfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759471; c=relaxed/simple;
	bh=W+a+Yoja6r+NjMKoIeKEbzYjPLUdxxkyp8N0b43Me78=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qZsovO+Xe7ziEop2pOCgLynLOIJgR3tkGKjTOkGHRO23zg7+MEpINwZZ8uhVz+5H7+IiYrUcq8p9x6RwbBi9t/aNEYF/2LRAIO/x+UHFkrUYCk1ZCnxV/QG98PNNHR5pry9Re1KlLHLuD7l10dxJeIVceox1XPJzu2F3SIM+D8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHiPW2GR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHiPW2GR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA77C4CEE3;
	Wed,  5 Feb 2025 12:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738759470;
	bh=W+a+Yoja6r+NjMKoIeKEbzYjPLUdxxkyp8N0b43Me78=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cHiPW2GRXOB2XptJXk5LSz96Ia4+t1cp8W3f+DjXmFm1jc1a5SGi1e9G3Xs5XRr7k
	 Bp2O945I1s12eAmTAH39vCkV7ebN1Tj8vpfe5dRLipRUvnb4/neXwswzHoTL9XgRuB
	 Df8CF8KXW9e/JWSTFb7E81Cji+UqA6LZvJnv+M5TM0lCmudj5RcTvGtLEuc6E0Ie5p
	 XouIMYERSqzENyEgy0tEapD6RL1i6SK+yWXiZuRczgZvp/Ra7iTibRL8W7qQcHiJm6
	 DEJLlIPZ6M78Lj5s+6B7vkd1lVnqNI/H9Ykx7iL0O1erAMdpY4zJS9I4fc57vUMiZm
	 YHhyFOOlchP1A==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, linux@treblig.org
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250128005243.295977-1-linux@treblig.org>
References: <20250128005243.295977-1-linux@treblig.org>
Subject: Re: [PATCH] ASoC: mediatek: mt6358: Remove unused functions
Message-Id: <173875946845.32457.11968319889637039495.b4-ty@kernel.org>
Date: Wed, 05 Feb 2025 12:44:28 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 28 Jan 2025 00:52:43 +0000, linux@treblig.org wrote:
> The functions:
>   mt6358_mtkaif_calibration_disable()
>   mt6358_mtkaif_calibration_enable()
>   mt6358_set_mtkaif_calibration_phase()
> were added in the 2019
> commit 6a8d4198ca80 ("ASoC: mediatek: mt6358: add codec driver")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt6358: Remove unused functions
      commit: fb6ec1d27608c008bfe1ab0dfec3720990eb2451

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

