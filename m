Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61E92F24
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750685582; cv=none; b=IMfFaPSLGoffehivlvz6vRaEkKpv8hyFhOktn4FSikc0ej0sC2LI1dFrIunlCVvAiwfYud/V/J7Hh4TAPcYf/szkdjQHIPtNyvR5wyBBlowRqTwRzW/GSzdFmwHMpJj24nA0VsP29C/zlWxUZfAC+qAatkqXFajOds7HZCoA9ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750685582; c=relaxed/simple;
	bh=XnDQyvsf65cmQSAtLv1zcelfA5SwFSMQkFj+f3CyjXo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eeDPbcA6Ou1bwS6ycMxId9bkrfkbu8C5Y9gfikx4HLmvw0wqgv9V6pFrr3nPJtY2kHnp60ol2jjSpeL6bZl3DoQvzGdS08HKSgBDy3GPU5FmrO7PXzXVmLO4YK9gefrmqR/JgJvwwdn0eOsixV9sxrlcevKb58aAhKpUOdFmx7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyJy9G/i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyJy9G/i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DD3C4CEF2;
	Mon, 23 Jun 2025 13:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750685581;
	bh=XnDQyvsf65cmQSAtLv1zcelfA5SwFSMQkFj+f3CyjXo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LyJy9G/i4fBVOIIf9I9yRb+SyiR6vlRICkEfaYyRdlJrAVfWHJyAGUP7yS/xUlQf/
	 lgPdmayOi3Mg4xk24ikxsmgH7P8Z+h7ktA47s77y58A+B3dr6kF44N8o7cPqafKhPK
	 yIWjSBaEiPdmuZ4orn5IgPbu/6DgnE9l8kkrBnwJnqOCFqz5z9hYb94bqKnAUsNz8W
	 6TLdtAnGBMeps9GHgc804vGu68GZkQi0O9MC1nEO4gQfz+wT35L1rptvZ3pEmv1mpX
	 YEpKZx/VUN9+MVfbbdlGiDhk5zAokFbhlcONt+6s85KNvLLmf6APgQmagvmI/dST2e
	 65Kzr2vUHQLXg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>, 
 Primoz Fiser <primoz.fiser@norik.com>
Cc: Joy Zou <joy.zou@nxp.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20250618063339.2508893-1-primoz.fiser@norik.com>
References: <20250618063339.2508893-1-primoz.fiser@norik.com>
Subject: Re: [PATCH] regulator: pca9450: Support PWM mode also for pca9451a
Message-Id: <175068558032.58081.3489129245775741886.b4-ty@kernel.org>
Date: Mon, 23 Jun 2025 14:33:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Wed, 18 Jun 2025 08:33:39 +0200, Primoz Fiser wrote:
> Previous commit 548d770c330c ("regulator: pca9450: Add support for mode
> operations") added support for setting forced PWM mode on the buck
> regulators for pca9450a and pca9450bc parts. However part pca9451a also
> supports this feature, thus add support for it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: pca9450: Support PWM mode also for pca9451a
      commit: 19cbc930c209d59a2c9828de4c7b767e9f14667e

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

