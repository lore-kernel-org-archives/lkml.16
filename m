Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6111E9B03
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747129627; cv=none; b=Lub7WfBXb3EPJqaPz+5EhMIFd/usvEQcyhzIWkFs5/KKz4hyQ9XQjr3C5MLg6hqe78zkyx5b7hSEoKD6FZcSNsEwyD8znu711KerHt5JJLaiq0ICHJ1nZL/UXqaPYPjnP1F5D08nZGt+TQ8U4NpW0KKdOzg8PaLP+qfSZ0Sv91k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747129627; c=relaxed/simple;
	bh=b7siKQi24yevBo11SRzBrrvRK89vCTeLTpr1jo1HuBs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KoSq+VuiP7JJKfGj8JLZZzqERnR2p16M6jplgoF1SmL+3nWa0yFcea3AMotcD9YQylQTsPbnvijy8Fy5bvj8oKW8nhDoNUQTjKJOmAAuLyzklUl0X+sSIjxTW/8ruhMZGjZP5DH4GErDuW3GiuUhRF02eEY7CclYdTqik8W+KJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJvUol5d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJvUol5d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5626C4CEE4;
	Tue, 13 May 2025 09:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747129626;
	bh=b7siKQi24yevBo11SRzBrrvRK89vCTeLTpr1jo1HuBs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kJvUol5df8hj1/dTrJlGoIDLbE7H2VgKjjKv0wKxLp9n9IxF2eIVxGFzC1PyH3Kpq
	 nZ/AjmIi8OSAny/Y4xXMsbjSSogyjmSsxENhmKEgrRNgB99t4ITDkhxmKo+Jdy6yv1
	 cEGr5EsGUM1i2LZLfmeXqGjWlP9GrAp8vIDCJJsCBoi3tinR6kpmvlGwWHOQks5h/T
	 ClfFT1c0ZErz/8tkDffde9EjrjhA37RvfyXKRhMQgy6Xr5HiFAsDFnU5kiWyPcqtWb
	 sfK7qkGMR6tXG5nz9AE/OZoS9xnmYccjJWIxjR+I1NGvqJaSDJ4eT+KzyEIGMR0/Al
	 3K8BHg44+4RyA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250512185727.2907411-1-nm@ti.com>
References: <20250512185727.2907411-1-nm@ti.com>
Subject: Re: [PATCH] regulator: gpio: Use dev_err_probe
Message-Id: <174712962358.91325.1280177002395058293.b4-ty@kernel.org>
Date: Tue, 13 May 2025 11:47:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 12 May 2025 13:57:27 -0500, Nishanth Menon wrote:
> During probe the gpio driver may not yet be available. Use
> dev_err_probe to provide just the pertinent log.
> 
> Since dev_err_probe takes care of reporting the error value,
> drop the redundant ret variable while at it.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: gpio: Use dev_err_probe
      commit: cad915e4515790d2e66525a86a166e7ce81e3055

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

