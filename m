Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EC42741C4;
	Tue, 15 Apr 2025 21:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753808; cv=none; b=JzS1c9XGilcQnxcGslp36WPuxvWnXTxTMxjYptpUP+XRIO0zXu4rWcco5lGwsWubEfZSIEfjJZ7AuCP4Zra26FfhA2DRltrTwx7tIyCFxndnLXyj7GvIo9gVorwyqpFLw26g/SmnVlGsCXx2XDl6xRrs/nt+VhFQjUWzQgJYrwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753808; c=relaxed/simple;
	bh=xZ5n/igD5CiLklu5uPC8Nm48TluDKIY+adBhYjg+FhY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VJCJ1//8N3sjpzStFcsYvjbO9p0WLsY2+vzcd9iioMQmRD7v3gTSO5zZfpoNDVU6f5nzygGA/jaw55Iwp4RywniA6kTyKf48gEyxmBdLzwViYltdEa7bOpL4/hLoHCKtZpJ4bbyksUarrLow8mfDUIP9lkNmafoEo4Kw7TWC2Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+AeG/R9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+AeG/R9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B94C4CEE9;
	Tue, 15 Apr 2025 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744753808;
	bh=xZ5n/igD5CiLklu5uPC8Nm48TluDKIY+adBhYjg+FhY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r+AeG/R9tTOu1rayfdsx7w+wzkOc+ed4Utxb2D/VrCmgfE+/EIYUARuB2RBmkco8S
	 GfOJANTAzQ7Hr/PCChSWy1dNklWOLoY20zbDLXOl8YPQVFGnBVKL/ee2r2zBdx3gbG
	 twOBg9g2pZ/4M9JzEbonFl8oigD5cCoSwx4BkHFo8NKmRhMgpJdcjfugR5uQ4e2/hY
	 AhpRPr1fJF7hZiOFafyU850EoUYs0UFV08nHGxBYdE3/3gJs+xGIGi7OAeVIuy9Mgx
	 EjAjMYAO2TB++flGnT0wrSLpCL+TDiO1xSGmPdvvY60SMYQbKNzW8mtPyeCdW4uude
	 YFqoMfRpioLCQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250415122927.512200-1-rf@opensource.cirrus.com>
References: <20250415122927.512200-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: Add Cirrus and Wolfson headers to ASoC section
 of MAINTAINERS
Message-Id: <174475380680.1274591.1263818391223217277.b4-ty@kernel.org>
Date: Tue, 15 Apr 2025 22:50:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 15 Apr 2025 13:29:27 +0100, Richard Fitzgerald wrote:
> Specifically list various Cirrus Logic and Wolfson Micro codec header files
> under include/sound/ within the ASoC section of MAINTAINERS. Note that not
> all the include/sound/cs* files are part of ASoC, so more-specific patterns
> are needed.
> 
> These files are all part of ASoC codec drivers, and are owned by specific
> Cirrus Logic and Wolfson Micro sections of MAINTAINERS. But the overall
> include/sound/* maintainership is only Takashi Iwai and Jaroslav Kysela.
> So by default get_maintainer.pl would only show Takashi and Jaroslav as
> maintainers for any patch that changes these files without changing any
> code under sound/soc.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Add Cirrus and Wolfson headers to ASoC section of MAINTAINERS
      commit: 63ec4baf725cbde506f0a9640ae6751622b81b0a

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

