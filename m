Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3F723644D;
	Thu,  6 Feb 2025 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738853496; cv=none; b=XZyLNSMOGBjGtHtRbLRAEE7E52Zx20d9iT+3joBXZo2I0eHRC63DHi/ComRrZmbV23Ck6uy1qNG+sAL/XA8mtoqg5vww+fkV54fWFWYJpa9/9gEwrls3bp0dG7rSNvXs3GV9s7JyrVqt5r86vyvBh7LOO2DQIFy7dE7Q1vJm4M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738853496; c=relaxed/simple;
	bh=aI9BSmTGJlT9/TflPUmgUZa4xAdEOmrHdDGF+lWQWXA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HajXUWxZTSpfWBOoZyeNoKxMKq5MFgC4zhR7XQeC2XnYW2EnFD6QYPERh4da/joK2woVd14D8yJg6AAv8SdOfaLyMDtm2/4Ir/VJPZqVbXqY1A1wRCSG1P4sBRn2A/xXaJrM1WjqJ7I4w0stMjHx8g0jyyaBH9DEucQ4HYUcrDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fOQRDEYe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOQRDEYe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81203C4CEDF;
	Thu,  6 Feb 2025 14:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738853496;
	bh=aI9BSmTGJlT9/TflPUmgUZa4xAdEOmrHdDGF+lWQWXA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fOQRDEYeyhLRx+deVN87ZHm4X1FVPidiUkY621wnuIqng7ixLfQd5kZr/57LfxdEN
	 tEGa4oZjnSdeVuQMH2q6NSmDxjUlcJfVBXE47WNMqB30jLWelPq1qb4/wlDy+hLr/u
	 /2SAA33pJ7B8yJ6kBpyUbZQ8FIJFqY8p6BWDiZAax+xya1mct9iICxgFAiukcWSGhO
	 j9eetwAvLN78bADjUwukDZIS3KefDTnXLINDZzdfFF43mS4NW1opIPEZFFyxf2mypl
	 XRV9aUK4YoYTMAoE9pI74PpgygT73QHETCAT+lSsXiTs2UOoVCYUf55NeV2Quh2bFR
	 bfChT4k1zx9/Q==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, 
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250205160849.500306-1-vitalyr@opensource.cirrus.com>
References: <20250205160849.500306-1-vitalyr@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: arizona/madera: use fsleep() in up/down DAPM
 event delays.
Message-Id: <173885349425.198179.4718145896745119973.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 14:51:34 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 05 Feb 2025 16:08:46 +0000, Vitaly Rodionov wrote:
> Using `fsleep` instead of `msleep` resolves some customer complaints
> regarding the precision of up/down DAPM event timing. `fsleep()`
> automatically selects the appropriate sleep function, making the delay
> time more predictable.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: arizona/madera: use fsleep() in up/down DAPM event delays.
      commit: 679074942c2502a95842a80471d8fb718165ac77

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

