Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680D31D63EE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 22:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751408135; cv=none; b=Jcmc0XayAGWixGsRHzktv1PaWr9fVpoKjDHL5kRvpTzqOlVphCmQoynCxParH5CjmOnxDojvrGUVTormYw23pKRtrnUDXdLichp1NN3zDACtJwWm0tj8pc0qJ2F4Krfy+K3mGbAHaKyjAVB8Y04UDmhwANsg9Mq9DTYm83aIVVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751408135; c=relaxed/simple;
	bh=NLLU4kJJVjosN1KeoaPawYGf+SVoMvbPCb9j8xAJ5nw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CE2ejtJ/pC2/GLYz8ZGswG/0q4h8H+dqTFXq3BVPiPOs5OW15YfhjMJALkxe271Rv3fwaeHPrjg/9eIFUkBVKXm/3ErmsdCRzqDvod0USBqQZ8XHLlCBLFoo+MGQ6TWAiEOuc67hybdZr2Pn8cnqCDxXv9TGOD6rLQ8KZ15EUVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPPc34us; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPPc34us"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A05C4CEEB;
	Tue,  1 Jul 2025 22:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751408135;
	bh=NLLU4kJJVjosN1KeoaPawYGf+SVoMvbPCb9j8xAJ5nw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uPPc34usiEmqDWENXOTLlTNfpObfw4ciF5wrRssWkCkAn5eNpcRMCAKDPwslCRDP1
	 i23iDTjSBBf44qLw5A6MEx6uV3afiqwmQmXioqJzYd8tI5zrXMoHOlQRLaH8IE7tZp
	 SVN6a39MJZXl9pGe7T2ZbLVhvlsVs0LldqErfBa+uHVUSRwwdJs+6z7uNJDOay6QF1
	 X8UY6LZFY8vKY16quZlWv1eE/2JodczP1RiD6sew64P8e9P5vaDh5uHjybEYs72KLE
	 80ESYNOj3vRyrRT+0wHHpw9xtTZNUlmXauqNN0G4nFISVzz0X65yx2x4cWC92nzdVv
	 BlMaFwrFkxYtw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250629095905.898-1-jszhang@kernel.org>
References: <20250629095905.898-1-jszhang@kernel.org>
Subject: Re: [PATCH] regulator: sy8824x: Fix ID table driver_data
Message-Id: <175140813407.710029.17246554557237585813.b4-ty@kernel.org>
Date: Tue, 01 Jul 2025 23:15:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Sun, 29 Jun 2025 17:59:05 +0800, Jisheng Zhang wrote:
> Currently, the driver_data of the i2c ID table is wrong, so it won't
> work if any sy8824x user makes use of the ID table. Fortunately, there's
> no such user in upstream source code, we can fix the issue by using
> different ID table entry for sy8824c, sy8824e, sy20276 and sy20278.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: sy8824x: Fix ID table driver_data
      commit: f172ffde18997aa401a74153cea4ae3bfdcb5124

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

