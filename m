Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B02125A334;
	Sat, 14 Jun 2025 11:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749899567; cv=none; b=krd27V2tz+wAdvg9OPpFdXYlmAmrKZDtk3NuGYTd5wfob352ggSbTgkDcDV4Vv+hwJUcf9nFEHVEjRAWqLpakDIG1LGdVslbJfSeJIHlPjJJI7AzlIIFYY6A+AHSEuJ/1AWlZQIQhsnOwvXRnw4PAhPyOYvon1JS95CZBtoBiwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749899567; c=relaxed/simple;
	bh=AmgU1/RSK+Zi6RBwV/iGT0TMUebztpeBirry095ca4Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DRSruxAtjQgQda7qcKw/Q2zYoQd6OJw8G9c1mxYHFYlOuO8hWvDzBDywQomJGYLqGzijiYolkMjfpGW1iC6OxvGn2rnIEguDKG89v25LSWv+pGVjI7xfKS2r9TD7QfWP8/zZPwPhS3qnxtAjUjkpfQM5zFvU7cfJNsZMFo+5Uow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgYZRUZc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgYZRUZc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C68AC4CEEF;
	Sat, 14 Jun 2025 11:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749899567;
	bh=AmgU1/RSK+Zi6RBwV/iGT0TMUebztpeBirry095ca4Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LgYZRUZcUkvrmJU1ye3p9TTBLqtaaQS6aTnGPt3Qi+H0GkZu6xrt2bpgdiEuP8vND
	 2IUKRkNo0WY2iG1ofW3cpA9SlGPOhScAiFW8msH1T2sfcQ1Y/9lzQyhViRjpP1tdCo
	 iFZlTPMcZX4v1nxY1nOVv/Zcs3UFUH+/7xP3zd72d6WrqYICq/IhHT+z4vkXS78E8W
	 jEjNpdtvgfnJPGl/CJi7G1BGbNXSarMhxGkwJVNcCwdS1ub6Eg7eO+/tRXUd9gnUmw
	 O2jGKPEmsFmhl9ejSAyLsAi76rqqAdJ9JiSiGXJDBHgUVkjaT/ZURC8Q8ky0gTsshd
	 Ikd3Ypt4YIy/g==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250612121428.1667-1-rf@opensource.cirrus.com>
References: <20250612121428.1667-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/3] ASoC: cs35l56: Change firmware filenames for
 SoundWire
Message-Id: <174989956637.19870.9433184540749742468.b4-ty@kernel.org>
Date: Sat, 14 Jun 2025 12:12:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 12 Jun 2025 13:14:25 +0100, Richard Fitzgerald wrote:
> Change the firmware filename format on SoundWire systems to
> directly tie it to the physical amp it applies to. This is mainly
> to decouple it from the ALSA prefix strings to avoid complications
> when the SoundWire machine driver starts creating dailinks based on
> SDCA Disco info instead of hardcoded match tables. It also avoids
> errors from having to rename firmware files from a hardware-address
> to a ALSA-prefix naming for Linux publication. There are already
> published firmware files for the L56 B0 silicon so that has a fallback
> scheme for backward compatibility which has been separated into its
> own patch on top of the main change.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: cs35l56: Use SoundWire address as firmware name suffix for new silicon
      commit: d1fc7687959b0fbf335815a8d808e6076b969309
[2/3] ASoC: cs35l56: Use SoundWire address as alternate firmware suffix on L56 B0
      commit: e5d5b3aebdc8acf9f52d1369a7744a2ab9ca591c
[3/3] ASoC: doc: cs35l56: Update to add new SoundWire firmware filename suffix
      commit: fa8fae5f82e48db1a06ba570a2a3fdc087fc93c0

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

