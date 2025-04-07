Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DA422CBEC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069736; cv=none; b=ux+ipa14CoyB+zA5PhJhsLQzcWAludJvaSB37P46dCN/F1+oRDTGMz9rikQwWYmaaUgEUO4M2nzXj1Qhlaz9BKwidYnwPeBhafDqf2WCNnuVAQDfcZWF3f4G8gSfazYQn/bEoQL9SAKumwWS6Cx//Vj+LI+6X7WhgodAaRDNDHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069736; c=relaxed/simple;
	bh=lk3294jy+i1Zyw8OTcudQdwcRZhXRnpOmKOB+6Wu+OQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PXMgYrennG+F5ca/1JpFdQGpemjaRgjSGymsXx0w8L/03nPJhvI78KxCOLUiWihYwRkKFTXmHvtzM9LOdsKP2nxPoqM4tH1x6qYfOHWLSZtt7tyL9O3lHEQGffOBpcHIvNLRSTQscHHQHneEGk3UGxJLr86HqezJ9FOB5A7iqbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jT3mEt1f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jT3mEt1f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 348F1C4CEE8;
	Mon,  7 Apr 2025 23:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744069735;
	bh=lk3294jy+i1Zyw8OTcudQdwcRZhXRnpOmKOB+6Wu+OQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jT3mEt1fowtbtLBkmQkjm0Ybtk21DKZOwUux2eVnQIU7WhcMEe2np/BS7e/CQb1Wo
	 dV/UYu8VeYj4UMIzGB3Kk86KRA7EeDbrKqjgfXvwGkRQDbj9CaLIQDNrptb0nxl64E
	 fQj5AXiWiZcGmE5xyERMQ8QGAjTH5TDb4OiTgSeuLMCk/f5STLfVuhUp5xfDANe/iM
	 /hPy32zMlTIuA+oq1KgmQOOSxp+DMUInUppb6gAy0YsJsAkbrdgsLPFN0ER/KBbWpj
	 KViDoWJtYFXaF7YAzkA1hPot3iAGFDTVy1c8HJq55O/BZhMZg/BJNnvJFduXhUa5ZM
	 UzFDOJCxV5xYA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
 Brady Norander <bradynorander@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 u.kleine-koenig@baylibre.com
In-Reply-To: <20250330130852.37881-3-bradynorander@gmail.com>
References: <20250330130852.37881-3-bradynorander@gmail.com>
Subject: Re: [PATCH v2] ASoC: dwc: always enable/disable i2s irqs
Message-Id: <174406973394.1344763.1510125660737652294.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:48:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sun, 30 Mar 2025 09:08:54 -0400, Brady Norander wrote:
> Commit a42e988 ("ASoC: dwc: add DMA handshake control") changed the
> behavior of the driver to not enable or disable i2s irqs if using DMA. This
> breaks platforms such as AMD ACP. Audio playback appears to work but no
> audio can be heard. Revert to the old behavior by always enabling and
> disabling i2s irqs while keeping DMA handshake control.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dwc: always enable/disable i2s irqs
      commit: 2b727b3f8a04fe52f55316ccb8792cfd9b2dd05d

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

