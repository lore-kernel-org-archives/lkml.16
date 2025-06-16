Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD1326463A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089060; cv=none; b=UFi+IFonyooGQ1InexIGDcMHrfdhvckWXy8AqbrtAUJLs4V01Qe9fAAWgnpchKEadeHMoxlrSJVVdGXQkXga1A/pGW+rELF77oPFG5uBfQobZywNHa//Jo6pU1REb75V9ix+DLzmoJ3NhFEA+4FF5qCbWTKFcneMXmxLDAuWd5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089060; c=relaxed/simple;
	bh=puAp8vVie1YZJSKL4nqENUKM1UhshsrnW2fbHlvQVD4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=geZ1CMxEtozgiWG1eRgSbjj6pxZBCHtd5fqOjS+CxlAv6K+qcmlfj/2rOe3eWJGQDQ3byVRji+pdVeG2Ke0U4ebheDKFx6L2Pvy3wdGja70y5Qo5YC5Zfo7YaPcYFsOoXCQpPeWAblVHaq3VMhOmpMCsNR8K00N4rVTgjspj/f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwApcJfx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwApcJfx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D43C4CEEA;
	Mon, 16 Jun 2025 15:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750089060;
	bh=puAp8vVie1YZJSKL4nqENUKM1UhshsrnW2fbHlvQVD4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gwApcJfxXI5EecMPOvsLEHPdVVOG7C8bWtQgMkHX4nPQsMF6CA6rXkttMhYZB6dG7
	 bvpWVQvYni0/EIJ3aK8AwJtTvGmMXrMqYVVbOpVMMsiUNa3Im31e0/k3YTlElbD8Tx
	 9hM+23C7wHExMxkwATc2Cn+RB0RBS/4VLJKpvizBiHQOgt+LrFOsR6skj7GNBQWWzp
	 auISFRscYFITRcuTB+Uzf60R+Ysr7o05hYXNA1ChGZN0iLZANbIqIP1vjjcl09YAjW
	 ua+UWgZ45k6FZqPdpobK5OeMVmJWvGj4X4nnrgRjfIalXTzQ/k1lWnW2HvQqJCNezv
	 71F4HTc6TsCzw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, wens@kernel.org, quentin.schulz@cherry.de
In-Reply-To: <20250606190418.478633-1-heiko@sntech.de>
References: <20250606190418.478633-1-heiko@sntech.de>
Subject: Re: [PATCH] regulator: fan53555: add enable_time support and
 soft-start times
Message-Id: <175008905873.262451.9164441451650062773.b4-ty@kernel.org>
Date: Mon, 16 Jun 2025 16:50:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Fri, 06 Jun 2025 21:04:18 +0200, Heiko Stuebner wrote:
> The datasheets for all the fan53555 variants (and clones using the same
> interface) define so called soft start times, from enabling the regulator
> until at least some percentage of the output (i.e. 92% for the rk860x
> types) are available.
> 
> The regulator framework supports this with the enable_time property
> but currently the fan53555 driver does not define enable_times for any
> variant.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: fan53555: add enable_time support and soft-start times
      commit: 8acfb165a492251a08a22a4fa6497a131e8c2609

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

