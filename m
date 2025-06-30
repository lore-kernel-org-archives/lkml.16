Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C82528DEE5
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295963; cv=none; b=sFgjWqUV2ZW7JxtMdJjWzS1KLsXs4BXqtJI/cW6hi3VBmy72mhMgzfv0UkITgm3bfkx9Ww95xBA8FNVI7IVTUMYUw9PWCSVaVTeMEtN1RZjWrfJUaSniVR0wfPjj0JkdL+ln8vvma2eM1KKjx0tMrHzUTg6IXQ1Z5kaManbjpxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295963; c=relaxed/simple;
	bh=iBnew5c+a7Ro2bpZC4juuII3jZCeT2R29Poi444M5o8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gzRqosholGFVQfzaJwBE9EAY2SBE3ww7FVyK7X2EE54Ka86Da4cFUmQ9T8vCPLvrobxIXIQuxGSKAjapTwmxBCUCC8GNUx1a2uzGQUN1C70iMLqOoCERhPP6G134dJ8nQ7Zf478XCSjf1+PTnRPCnchQhPg8SEyXylhd2VYwhZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VO9nGu7a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VO9nGu7a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD47AC4CEF0;
	Mon, 30 Jun 2025 15:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751295962;
	bh=iBnew5c+a7Ro2bpZC4juuII3jZCeT2R29Poi444M5o8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VO9nGu7a+Rv9c03K/bnNu35DdDu7lvilzJnIV2ZRBGo3e7QM+87HZLjfebBdekNNZ
	 D1lBZUhrPeafeZjqHip2+31qOUqeiOWkNeLh5PtPXFQ6bglQmXJYXKqUviJDDnswko
	 +7WBNZyJEXydrKCgqm9WIbtyGXLMoxWp18NDqbBDTkxZGo20uuBwIuYEsIfsvJlddY
	 P0+TnIt3+j4rx1xR1ssv5QVpVSnfmse+ZD+4FAGedD4hq0p3zFxOtj2a+EfeZTsYFw
	 86yLx04PgDiIi65n6dk/1ZG0aSjmuDpL4hWgtYEPJmkUYhoh88ZdbDxjVYb6o9M0YQ
	 SYpyjkqb6oyMw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250629095107.804-1-jszhang@kernel.org>
References: <20250629095107.804-1-jszhang@kernel.org>
Subject: Re: [PATCH] regulator: tps6286x-regulator: Enable REGCACHE_MAPLE
Message-Id: <175129596165.1422008.2097697585958234896.b4-ty@kernel.org>
Date: Mon, 30 Jun 2025 16:06:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Sun, 29 Jun 2025 17:51:07 +0800, Jisheng Zhang wrote:
> Enable regmap cache to reduce i2c transactions and corresponding
> interrupts if regulator is accessed frequently.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: tps6286x-regulator: Enable REGCACHE_MAPLE
      commit: 427ceac823e58813b510e585011488f603f0d891

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

