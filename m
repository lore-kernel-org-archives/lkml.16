Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4999A2E36F1;
	Fri,  4 Jul 2025 21:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751665343; cv=none; b=IosySC5d1M/ho0ev+DEdjb84C7aUpc84mffirdAaaHb7GI9zy2r4Gy+eLiYculQ5lpafFUI+W9eDbMS29G3y1YWHI8bU8BsJLMuaX3n7FaoKcoubguPuGFTPRFpLH0dbw9JXSADiGgyPoaX3l8xLAfBBihmeLCxfyyBSjHKXvI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751665343; c=relaxed/simple;
	bh=6yn4rMYivw3/KIBDGpK476SEiUbXY5TLmhWSBFNrfuE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MoHS741vRbRW+NA4eKmhv0sI1G+O6DEOJ5PyL/meAGX7/S7FZ6820ZPK5z3hzUsk1qUaartfhTjoiAUX5FgVJJUtuClJC37WIIeGYpQq9HqY9mSrymsvQU27Q7SMnTVAr1WMnzkGqsUHj5deBkHkk2tMNnXdCiTHy7Q4fnFfNr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XM0YJq5c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XM0YJq5c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E48C4CEE3;
	Fri,  4 Jul 2025 21:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751665342;
	bh=6yn4rMYivw3/KIBDGpK476SEiUbXY5TLmhWSBFNrfuE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XM0YJq5cnTC5wgCVzcz7ybjl9cDO99a5Y/IaR/r+mzhuujwQ+auUqC9+YjdZxU52r
	 sQwj+fWy449ni/DgMFpqesdt7Ts8ksrcg8PaCXQ6X8T96UbZ/SHMWqxSTgvSYWPdTl
	 NO/LVxPA6PhBgoJuPVoIGnIoACVF+e9LvT5gvo1dzYqv9VWNZS8C7zN8bpRuyHJag6
	 RKVfNBYORdblAAiUq2iyhyaMZDcib2cUv1mpSpB/CwRaPuPlVaCKNX8Il86/k2l30b
	 fF8KtrkFQPiauAN+By2oECOr8BEfHwAy47CMfP+r1jnwWpNa9JTFxTqe/1HoS48m93
	 aCcJQRgDu8ZDw==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl
In-Reply-To: <20250704130906.1207134-1-peng.fan@nxp.com>
References: <20250704130906.1207134-1-peng.fan@nxp.com>
Subject: Re: [PATCH] ASoC: codec: rockchip_sai: Remove including of_gpio.h
Message-Id: <175166533831.206730.2590873270491527384.b4-ty@kernel.org>
Date: Fri, 04 Jul 2025 22:42:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Fri, 04 Jul 2025 21:09:06 +0800, Peng Fan wrote:
> of_gpio.h is deprecated. And there is no user in this driver
> using API in of_gpio.h, so remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codec: rockchip_sai: Remove including of_gpio.h
      commit: 571defe0dff3f1e4180bd0db79283d3d5bf74a71

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

