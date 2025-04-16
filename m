Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF2D21147C;
	Wed, 16 Apr 2025 18:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829678; cv=none; b=ZRasr1dRvlPQAKwXTJq+XhMSRLplKgnmK4c0bmaF/ynFm8YbxHXEgDZ9l2Y2gDBrEEn5bTVCqSR5VIV8Z+21Yjr7iqruPietNeF6epSaWeGaV9MTos0BvB0nUsTdZUDexBLsAtoGuFXUhfwK52+3Xg6kxs4t9f88dFYfsA7D+vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829678; c=relaxed/simple;
	bh=G2fP1NQyrEKCqjPffo7p61378KeApix2SGdw4O3QqAI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eGZ1b+pWzSjy9dMIwYGuJh1sEWBTA0AM0FdLXmuwPEFu+i/q8ey5YFx2GGcMwAslO8h28hZ+SwhUkXBFeHHQc2qka9xo5QSCGT1V+XNdBUXkS0kQcnD8J/Tddt8I/dPzruJMdeP1qiLHPLcliHGDgFXcHP8K/MmkFZmxBIQkxX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZYq6sRt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZYq6sRt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330FAC4CEE2;
	Wed, 16 Apr 2025 18:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744829678;
	bh=G2fP1NQyrEKCqjPffo7p61378KeApix2SGdw4O3QqAI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eZYq6sRtHaLUXIJ41kjAAKqOaiPFLPBCwmlXIgc1cTE15/x5V75/NtWLoAU8qTGjA
	 B1OLtFiVr6D8gGZRbHCo3vOPweB/9v7hH6AA4A1+68yb2jngJuKgs7SoPXn+lYVJyx
	 yUYv523e66qwoCa1AJdaloeILFrhsSFaH/c5gSi6AwRS5yR40mOrZOn9gkXpk4ydO0
	 PCgjaApLZXXrTZoUOABO+Kp7R6QBIxcpE8klJwPq42n9FNaCp67dR6q/Zi7SZsEokH
	 Se9Dk08T/1skMRe15NjmlmGExXc4c20Mm5dTo8Lq37CgSDF/eMsI+MIm2V4JtnBojX
	 uWUiIgqhzoVlA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250416121604.780220-1-rf@opensource.cirrus.com>
References: <20250416121604.780220-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs-amp-lib-test: Use faux bus instead of
 creating a dummy platform device
Message-Id: <174482967693.823707.10000203565483930453.b4-ty@kernel.org>
Date: Wed, 16 Apr 2025 19:54:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 16 Apr 2025 13:16:04 +0100, Richard Fitzgerald wrote:
> Change the code to use faux bus for the dummy codec driver device instead
> of creating a platform device. Also use KUnit automatic resource cleanup to
> destroy the device instead of doing it "manually" in a test case exit()
> function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs-amp-lib-test: Use faux bus instead of creating a dummy platform device
      commit: d1965f008f224a775eac2aa021a1fbbf4bca96cb

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

