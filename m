Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C1735942;
	Fri,  9 May 2025 01:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746754612; cv=none; b=ktYRl3w716NSoe9s3A1sVzOsgrE5HtAmSLlSlf3LSqrTn/dtU+x8Gv+O30dRPLATghn5N4ynAO2J19AwYM9NZgYN+RbxEfW6hsIStju3nlTO/i7fkASxK/tyYWdgm8hntYE7OOe9OwdtAWT9dK99kKe/1kJNNZn3D3ZkvFK3ulI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746754612; c=relaxed/simple;
	bh=2KsR5zZUkInKTKzsgLr5Mc/2LKGwlV6a+Xrw3ysGm2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hOaMfjsjnnDgA4eLb/sur8J0cD0jCoQDryns4EfSM7HvHLoSLtJz2/Mw1uWGyD1ycLaxIm4qjHU50NSiSkOlDDnJdtwN/B6rCwY/gEpDOX9YBUXl8ursUEWutNaITwTwj/m5WW01jWNYjjE9mJZBkD+rn8MV3EDZJQrM70JoHUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIa/8U5F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIa/8U5F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009E6C4CEE7;
	Fri,  9 May 2025 01:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746754612;
	bh=2KsR5zZUkInKTKzsgLr5Mc/2LKGwlV6a+Xrw3ysGm2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oIa/8U5Fu3ZpAG4m2jxejfKLG0yVHd6e8nd88ogWVibuZhQXtxqioUjSYqgF8w7oj
	 76yANyR667yK7m4iBPvPAUUGKEdzjdE/YIvR1Xf2dj97T+n+CeADTuXKGaV5nqaxZj
	 RXgD8aJyT4ZSgFwJxpOV+pijJHWlB4dzFB5D894jaYHnEwZ6gTWXTkPdfy4h9lTIDv
	 NIE3bye0KF6qFxMw2VlCO4sDg4OQ/58KSBoVOXevYdtCI+U+KxEVxDBpvaSZB6uj+3
	 rdY3D/4LNoBRfKLvd0uNCkbbkUHLuS7obpqAg3XZ5g/TgGG/wEN4VMbrDQUsJqY63R
	 WgIcB/45V2L5g==
From: Mark Brown <broonie@kernel.org>
To: cy_huang@richtek.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <185a5ffea22ebd20725fdc7739db6b6addfae3ad.1746672687.git.cy_huang@richtek.com>
References: <185a5ffea22ebd20725fdc7739db6b6addfae3ad.1746672687.git.cy_huang@richtek.com>
Subject: Re: [PATCH] ASoC: codecs: rt9123: Fix sparse cast warning
Message-Id: <174675461070.17552.2178746164099776132.b4-ty@kernel.org>
Date: Fri, 09 May 2025 10:36:50 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 08 May 2025 11:01:23 +0800, cy_huang@richtek.com wrote:
> Use i2c block read/write API to fix casting warning.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: rt9123: Fix sparse cast warning
      commit: 07cb9b51076f452c286fb69f3af4c65e54affaa3

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

