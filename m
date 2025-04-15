Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5497259498;
	Tue, 15 Apr 2025 21:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753805; cv=none; b=haGZG/YvePcvTWMXdyB/uxoRxY3xAjDtgfGvlBlDeugjbjs7qA8GqvM8U/yPfboHNT4Lseqgg8xp6th2canKUk52fbWHm+et1YGldM9WRO72Z+VvpkJCW8NOguAXOqImYY8BT8ucyIercBd6RSA8JK8YmLXP11huwvykdB9jV9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753805; c=relaxed/simple;
	bh=gY/hWloYXa96vzdpYEQqIz7dAppFk7+oi89bVF3qIJE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D9QJ96l8FI2BLLibMryXwVT2FfuHfKgbpFwyE8f+pthG4ZwwA5uygEdYpfE9FYZss7+TdJbSfLePayJBdnZyrSfFDH6XVOjMKI78fAQ4oaV3CM9jy0HOX+M7ht4ieodvKQtzmGXiU+mHUUnaWrKmnY9t65LAo6MK+c9uPMiNmo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eaXk5RSB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eaXk5RSB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2E6C4CEE9;
	Tue, 15 Apr 2025 21:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744753805;
	bh=gY/hWloYXa96vzdpYEQqIz7dAppFk7+oi89bVF3qIJE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eaXk5RSBRrys0XL64vBRFh97tkEzrgjybHkrvxlKuD4dkuVBqk3FzZFit4AxW06Q6
	 YOw7Rk2H5zbYeaUYXqTUR4luAECq6u2CJJZcOZiQag57Kw+g5JhSa+g4nUhk/5k2IW
	 89ejD5y7z0VwrYzzluesRT7JTewDPZsqu1ylhrXyX6bzLbagxQdu4aABTPwI9nG3B4
	 HiVvOV8YmloOubW7b9A97NRXJdVRNTzwKh0ISSRxTq9N0ivscGXkJQ7OmNOmcf74ie
	 A46wAiop5nZXYK8rzZn78Ukck9Rm213I8aPfMyKx4p3CBrCVFlioKh08Z+dhpPqSlx
	 Q5ZlovIzqwq+Q==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20250414085035.12469-1-rf@opensource.cirrus.com>
References: <20250414085035.12469-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v3 0/2] ASoC: Add codec driver for Cirrus Logic CS48L32
 DSP
Message-Id: <174475380349.1274591.14538855919544166037.b4-ty@kernel.org>
Date: Tue, 15 Apr 2025 22:50:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 14 Apr 2025 09:50:33 +0100, Richard Fitzgerald wrote:
> The CS48L32 is a high-performance low-power audio DSP with analog and
> PDM digital inputs and support for low-power always-on voice-trigger
> functionality.
> 
> This series adds the devicetree bindings and the ASoC codec driver.
> 
> Changes in V2:
> - Remove reference in yaml to obsolete gpio.txt.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: Add Cirrus Logic CS48L32 audio DSP
      commit: ac03495d7359285a007ec4fdc08d3843bb5d6b7e
[2/2] ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP
      commit: e2bcbf99d045f6ae3826e39d1ed25978de17cbfe

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

