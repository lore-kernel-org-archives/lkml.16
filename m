Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E7B26C391;
	Thu,  1 May 2025 05:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746078209; cv=none; b=btVY+S4GMrMcQeV6g+b9H7780rDUPHE5ghLfN83fDaxQdAcHeJJy6tIXewcShEAdYZ2mxXP3Jr/Xmsnu41jwWZ3Pxb+5/rHeQeKNUrp+BfQOhYfufJVJwHviF3mY6Bzvl16bv4pNks2LHccgbYEFyrOzeV3RR7hr5se329G/3Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746078209; c=relaxed/simple;
	bh=hDgNGJSFqTL0rdyfyaSxZHiKr3ah+PFvn4eS9vcQAl8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FAyGHAITvoQDjeggy9fj+z0Jix38FEFGRmegAVGMmbYmxMAvEH8n4tLX5D8yohrzE8AkK4lvXZXbZwwJPmOLSmkMb6RE3dWSLYkbPwIuICM9oPCUuNW3Rq2QAD1Kj6FKTj6ygNnfZBUnAWaN3Dc9uvXoHMK3DsJjGywae5JkHFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qxcsWm1J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qxcsWm1J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3877C4CEED;
	Thu,  1 May 2025 05:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746078208;
	bh=hDgNGJSFqTL0rdyfyaSxZHiKr3ah+PFvn4eS9vcQAl8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qxcsWm1JqnwPidgyKW77HmOcKDiCv0Hv6ZhxJdFx3x3iUBvd0LMJ67TCgDEtpWKDf
	 fVPZ54U0lfdp2tonFMyI22/umM59Lejv5UE0SdId9HgSt4pQojmWshrBNGXHDPUUkY
	 d5pSu0tSK5nIdFpzW4V2RRtce11WhHrOqx/JfVN5a7vzmwhMyFf6vKiRznki9ECCDN
	 rW1mjQLF2WLXGSBQJ0Rz8tXvKh2ut+M6OvvsBzkuxNluBWpgeGWs0TLbN/IUZNp0Bn
	 +sjxRGvNd8s1BuwnF57bqFtEBABaUCUBFiXAzyT2rLG0EQLYGcomWnYX5EBaQ0G24v
	 2BCTof3Q7FoMw==
From: Mark Brown <broonie@kernel.org>
To: kiseok.jo@irondevice.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linus.walleij@linaro.org, brgl@bgdev.pl, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20250427055020.176099-1-peng.fan@oss.nxp.com>
References: <20250427055020.176099-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH RESEND] ASoC: codec: sma1307: Remove including
 of_gpio.h
Message-Id: <174607820670.4025361.5315574938270076787.b4-ty@kernel.org>
Date: Thu, 01 May 2025 14:43:26 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sun, 27 Apr 2025 13:50:20 +0800, Peng Fan (OSS) wrote:
> of_gpio.h is deprecated. And there is no user in this driver
> using API in of_gpio.h, so remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codec: sma1307: Remove including of_gpio.h
      commit: a9ec9212f6d3b5fac6c2bcaaa9fcbcb469f045cb

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

