Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824CC29713F;
	Fri, 23 May 2025 16:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017302; cv=none; b=t0FIayG47PQy9PNF94iEuA+L4NxJJXkvduZTAYQqvBZ3i0eUyb60NPo/b2Ts4msRHh1hy2aqzAZBjlohrZRUl3cM2Heq4x+kwz464LjzAOQE2icHBIumLsUhBmAKP2ZXXCKWM9ZndHlUkeYos6rkCV7qKvgvlz4Kyqn2uhIOP+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017302; c=relaxed/simple;
	bh=nfVfDN3HgVuzw3t37wjLxC06xBmaqVN2owM9riXecqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n+kiPFBEPlPvHPM7X82Eg+H5vn2PecZmsVaFSkLrLOGfSeDcezx2P2VHfCE5hbjOu2YWP84NpaDycRUVhVXfXaS8lThWfkHW6Ftt4vowuNpfY3h+c5N0sEprcY475G86aktzeNOYAasF/icnSfBs7EBODDQDcIm80br4SOBtev8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvHaeTkV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvHaeTkV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9308AC4CEEB;
	Fri, 23 May 2025 16:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748017302;
	bh=nfVfDN3HgVuzw3t37wjLxC06xBmaqVN2owM9riXecqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NvHaeTkVioxFNO138/QpRiHGbE8ZCtyeEz9/FW9aeuFZ2nB3F0LoadaGtq6FFAVNX
	 cNRLvHAT3rIF0iMQXzeLHbMoflox99STpdFSclJoZe5T8R1FhB0T18lwk77NE/gQJB
	 OPbAaeh+Xpx/Sj9OajaeO7SxlovUqMUVjQQuOUaX6DmQ7gxubsyMFeMz7iMSRvRpPa
	 VKebsECWXjn482DwLm5RznFqvZPSlwz2y5kUWGgVgcRF2QqdJaFqcytMEJJkW75Yeo
	 JQqYudCrAfc6wezP0OorCOnKqku4FZSJxXYs7QDkJvxr879S010Ma1TxFsdC/3cYdr
	 rVsm4kc1rZcPg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>, 
 Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250523131214.955970-1-martijn.de.gouw@prodrive-technologies.com>
References: <20250523131214.955970-1-martijn.de.gouw@prodrive-technologies.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: add pca9450: Add
 regulator-allowed-modes
Message-Id: <174801730004.578098.7742808995079543725.b4-ty@kernel.org>
Date: Fri, 23 May 2025 17:21:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 23 May 2025 15:12:11 +0200, Martijn de Gouw wrote:
> Make the PWM mode on the buck controllers configurable from devicetree.
> Some boards require forced PWM mode to keep the supply ripple within
> acceptable limits under light load conditions.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] dt-bindings: regulator: add pca9450: Add regulator-allowed-modes
      commit: 0a4056a444c8d55beea470948c73befd6673aa6c
[2/2] regulator: pca9450: Add support for mode operations
      commit: 2616e5f4fe04eb25eb5cbabc0a3a2a374e14008e

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

