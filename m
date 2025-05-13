Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE241E5B62
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115457; cv=none; b=jlRrW80GOG+X4qhGDgskD6oT59uFUjx0Ml1te2zg6sdDr5rV1Oee/++Dph/vSXhJ7kbZ7Yf0TKGHvu0EVLtfqIA8u0swaeBTA0YpBPKNtSwZLUZh6svSu04viLWf4TEvsgNr3ggBZjLkeigJa3N72sgoV+3Mo4aj6eRz3VEuu7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115457; c=relaxed/simple;
	bh=yeGbJU1K+FT3kX11/cRSD/eUSzRu7CmND9lpSRZG1ls=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PcnGEZp4j9fuaYYEB/wm280XB/7fcJyT5d0TG8kDLqkG8lbmhy0bV/mgplIUuE0YbFLRJlfTPAwX4xhIH6aoFkaI8p/lwfB6L+ZQj8d+Y65apUKKjE/8zqoL0pqZvoe8/+WkPf+JfvbrIlQYoziR5Iz9yHI5Tsww9TktfmtS3Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnOUDugC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnOUDugC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BE3C4CEE4;
	Tue, 13 May 2025 05:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747115457;
	bh=yeGbJU1K+FT3kX11/cRSD/eUSzRu7CmND9lpSRZG1ls=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hnOUDugC/IzvLHUCMDyiSwGPAhIPyPKMIySYKdYAhUt2Mk/0qpo25WmFfEbJZMMGT
	 eFJXMCO1uP9t0Uz2+Fr7m3+oIcWarCV7rG9/ATninUn/osFqKG6098OvTes11It7F1
	 +pHNw356SBQhXTqXC283L5XCYhbecz86j6OvUiNqsVGWPex8CxjCc4jcDmpTBsqpTM
	 zqfsIVZR2pc4RRyuuBaN5TpvS/zjKMim/Nfgxqh7SIJgTK+8OtTbod5mO9r4eToZAK
	 39w1cmt5OgnnHUihtHk4FlE734pAArsgpGZKgsuEuMA9l07GLP0KvWB294z/begiu6
	 N3F3a/O0QT4nA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, frieder.schrempf@kontron.de, Frank.Li@nxp.com, 
 marex@denx.de, yibin.gong@nxp.com, joy.zou@nxp.com, 
 linux-kernel@vger.kernel.org, 
 Paul Geurts <paul.geurts@prodrive-technologies.com>
Cc: martijn.de.gouw@prodrive-technologies.com
In-Reply-To: <20250505115936.1946891-1-paul.geurts@prodrive-technologies.com>
References: <20250505115936.1946891-1-paul.geurts@prodrive-technologies.com>
Subject: Re: [PATCH] regulator: pca9450: Add restart handler
Message-Id: <174711545303.85774.16753228157201924455.b4-ty@kernel.org>
Date: Tue, 13 May 2025 07:50:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 05 May 2025 13:59:36 +0200, Paul Geurts wrote:
> When restarting a CPU powered by the PCA9450 power management IC, it
> is beneficial to use the PCA9450 to power cycle the CPU and all its
> connected peripherals to start up in a known state. The PCA9450 features
> a cold start procedure initiated by an I2C command.
> 
> Add a restart handler so that the PCA9450 is used to restart the CPU.
> The restart handler sends command 0x14 to the SW_RST register,
> initiating a cold reset (Power recycle all regulators except LDO1, LDO2
> and CLK_32K_OUT)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: pca9450: Add restart handler
      commit: 6157e62b07d9331cc1d4d9d525dab33d45b0e83c

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

