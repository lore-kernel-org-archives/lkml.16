Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAF92620CB;
	Wed, 25 Jun 2025 14:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862171; cv=none; b=lT4lzuEyVkyuLlKqPChjan2BF0M5lJMoahHE2pQRaSiaHs5apOr3ADoNhf2xhXzJqfPGIFmUF2rsc4h8yR4XNQawXSZh8jHFk1f6XxzsTfPjfeI2iFBPa7KY3GSSW4PxXPe+yxTLWN4IDejGNgBuQB1kjF3ZBLTZT0nLlKZ4Ibw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862171; c=relaxed/simple;
	bh=npr7ljrTyVoRoiWeAfu97UY4v00ATqhUkRJIlcT0wtI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PNZq8sMimGEzMt2uIsBJOP2WkCm0DhFWdsfjCCB/PLqO/vgHj0VpS5MuPEL89IuQdX4+AeZyRQkky4zwHucV6d9Vm3p2s+eo1fILTD2fWOttwwH5lSoDMkqUNK0Z7kS1YD6fMcjY/BA0r8nTINZZWKBTQpBboC8ezUAqUkUpKX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUs6Z62B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUs6Z62B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60F3C4CEEA;
	Wed, 25 Jun 2025 14:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750862170;
	bh=npr7ljrTyVoRoiWeAfu97UY4v00ATqhUkRJIlcT0wtI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=TUs6Z62BbL7y+hgRQR/MfusG7tfCjGkqCoWOgJOBb47ekPV+N9ou6IIVKp1RYQt5G
	 /JGmqoHD9yWwrwJ0yHy3WJFAewMqytdg/PCl2EVW/fsMLbaC/94Zzs/O3x/JRvVzWq
	 nsxYClX8nVipaRh8BUn0hBLZCduVR2cpW+bu/hCeVrolZgifHTos2iIKy17tGqfDG+
	 svqqpHrsefKnfSvEFQJj5GWgZOykkKuI9H8EWvHhBYiUKfzTUwfD/CuGOPKmfVnOIl
	 Y0pglt57LBgNCsMs7pZZXhLZKF+evj7gJHNG+QGW7d2fJo7LrqpsrzwsbT5RhURkdu
	 gcoeu4wMW13hg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250620021403.624303-1-shengjiu.wang@nxp.com>
References: <20250620021403.624303-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3] ASoC: wm8524: enable constraints when sysclk is
 configured.
Message-Id: <175086216755.125160.10337591577571856214.b4-ty@kernel.org>
Date: Wed, 25 Jun 2025 15:36:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Fri, 20 Jun 2025 10:14:03 +0800, Shengjiu Wang wrote:
> In some cases, the sysclk won't be configured on init, and sysclk can be
> changed in hw_params() according to different sample rate, for example,
> for 44kHz sample rate, the sysclk is 11.2896MHz, for 48kHz sample rate,
> the sysclk is 12.288MHz.
> 
> In order to support the above case, only enable constraints when sysclk
> is configured, and check the rate in hw_params.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8524: enable constraints when sysclk is configured.
      commit: 17cc308b183308bf5ada36e164284fff7eb064ba

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

