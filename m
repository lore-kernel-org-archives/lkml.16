Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FA7265CAC;
	Tue, 20 May 2025 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732824; cv=none; b=f0QU/OLrPvnt83enJ4lblt/JEG67CZ5xy6TM5v6uTRUrqehkmGlSeRYxZT45h+bWjLelyqO+12SxF4gCbh0I1iS6V4hijExb2GXtY4D7IqnKM1zAO3gNBIE1X4r4ziAO50ZxGDzHIa6HFpOHveorOPf4ulQzX11N4GE8/Gjpxqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732824; c=relaxed/simple;
	bh=SNpZ0nD62F58LE46Cw++PygB8HxkClFtFSbYN05F36M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pZyRZTjwhwvA+EQXQYuF1tR2KUdjKPgAZSxVfsDHoPBi5Eqjmy/G4TMWt2oXg83hFGXbnLr0h4F6leJOqeDYeoplDb/nUDvTTnlHBTzjyNKbo8lMg3Z3BHb4UX2pANHt4lce7K5W/Ae/4JHnxSOH1eOebRSpoeBWiENupvzUeTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cIe8sXPu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cIe8sXPu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FE7C4CEE9;
	Tue, 20 May 2025 09:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747732823;
	bh=SNpZ0nD62F58LE46Cw++PygB8HxkClFtFSbYN05F36M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cIe8sXPuhZt4/+jYn7jU2VGTf10bWJr2rFfLPjvBDiBLkyOi9le2fXDznJCaNEo5D
	 cS5LofCSGy2qWaDA8BQAg9ZQCgmZpc+m5W6wYGVTJC4XxAttP4CewPa+xm5ZfTT8ZP
	 L7ZAWbjuJSe8a/TqWJBLvm8eThUhKrvn+W64/rPZ29CBn28HidtSzERN/eiFR6/EFw
	 PJpQ76gNyIzceKi0Nm//oy4oSjdbzm4khg47XK1nc9Gem4uZXEs9ALb/6fQOUHnSoH
	 tZj5vjIvjYsZXM4b96/5/OpIiR/Pw3xqr3M6zFUsMW59MzdKux2d5bmBopvsxMWRGg
	 p1dTyZEDPuf9g==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
In-Reply-To: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
Subject: Re: (subset) [PATCH 0/9] ASoC: apple: mca: support simultaneous
 I2S capture on the frontend
Message-Id: <174773282111.19497.1387647125513356824.b4-ty@kernel.org>
Date: Tue, 20 May 2025 10:20:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sun, 18 May 2025 20:50:45 +1000, James Calligeros wrote:
> This series introduces a number of changes to the ASoC driver
> for the Apple MCA peripheral to enable support for bidirectional
> I2S. This is achieved by allowing frontends to act as clock consumers
> and logically ORing data input lines when multiple backends are linked
> to a frontend.
> 
> This allows the Texas Instruments speaker amps used on Apple Silicon Macs
> (Apple-specific revisions of TAS2764 and TAS2770) to send their IVSENSE
> data back to the SoC. Since these amps do not have any sort of integrated
> speaker protection logic, we must use the IVSENSE data and the Thiele/Small
> Parameters of the attached speaker(s) to implement our own in software.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: apple: mca: Constrain channels according to TDM mask
      commit: e717c661e2d1a660e96c40b0fe9933e23a1d7747
[2/9] ASoC: apple: mca: use readx_poll_timeout to check for cluster reset
      (no commit info)
[4/9] ASoC: apple: mca: Separate data & clock port setup
      (no commit info)
[5/9] ASoC: apple: mca: Factor out mca_be_get_fe
      (no commit info)
[6/9] ASoC: apple: mca: Support FEs being clock consumers
      (no commit info)
[7/9] ASoC: apple: mca: Support capture on multiples BEs
      (no commit info)
[8/9] ASoC: apple: mca: Do not mark clocks in use for non-providers
      (no commit info)
[9/9] ASoC: apple: mca: Add delay after configuring clock
      (no commit info)

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

