Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2036023CB;
	Wed, 28 May 2025 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748438436; cv=none; b=isCzrwnUbiGWY1Jo5YZbhNH8/noy6oARxbSwLsSr4TI9E3tIaH/UCtQ9qE1lAYrQDzFcz1xtfp6QAH2n+5I9rHdkYMZqW9tFtLg6oyVDKOcAzXFcb3q0KRjkm8CJAxFKs3eEhjgSVVlXJvvRcZHvmeujPopXVt4P+i5jlyN39DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748438436; c=relaxed/simple;
	bh=bqh02R+RktuC2AJ2tt0yfPMqfFsQm9schP9JHE8WnDI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D2gkpuvBt0iHLcJwyHkemJovwTTPoaehYo+DBqFNlzvpRM+ukD/f4hWTdMIY8va2oz2a8CC+Pk9hnZoSwupeGxQBDl13nn33BKS+B7r+8IBCisN9Mli3Oepx2+zMJf8XpEZQZzaPvh7TJZpYToi51MEWmWNSvWT1NFWTol1F3to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCYq2K9h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCYq2K9h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F5BC4CEE7;
	Wed, 28 May 2025 13:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748438435;
	bh=bqh02R+RktuC2AJ2tt0yfPMqfFsQm9schP9JHE8WnDI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oCYq2K9hh6jJLtZockCyaC3kKwD2EPfD3X+pHxuN21Qz18vP9Ks+0oCP3aSV9PLEi
	 H4k5zDX1E72ULPi8XwG1LCEdy2VgNc5PEyBdr9uNVmFwUjVrpnVoKdjk39WNeKRNBA
	 frQIZtDYmK7sxgUE+ChQ03fmpO5XVWf07bDTzo/sDGsa5+ICSR28yj92U+I5uwcbSn
	 7fi2KGxww94+pnybT6QW28gBSPtq542WXeCgj+MyKNGB3o9cCBM+Zt6uW5Tk5845RB
	 Ihh/oQNvZKJiL4AhIPdGPGdTkYwa8WxjGYAc64tOJC8Zl5PcjwIKd3t7gLptZ9CbQL
	 PgS6fAaqZBJ7w==
From: Mark Brown <broonie@kernel.org>
To: Kevin Cernekee <cernekee@chromium.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Bram Vlerick <bram.vlerick@openpixelsystems.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 peter@korsgaard.com, kamel.bouhara@bootlin.com
In-Reply-To: <20250528-tas5733-fix-controls-size-v1-1-5c70595accaf@openpixelsystems.org>
References: <20250528-tas5733-fix-controls-size-v1-1-5c70595accaf@openpixelsystems.org>
Subject: Re: [PATCH] ASoC: tas571x: fix tas5733 num_controls
Message-Id: <174843843382.44834.14730284248939713769.b4-ty@kernel.org>
Date: Wed, 28 May 2025 14:20:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 28 May 2025 10:25:48 +0200, Bram Vlerick wrote:
> Commit e3de7984e451 ("ASoC: tas571x: add separate tas5733 controls")
> introduces a separate struct for the tas5733 controls but did not update
> the num_controls with the correct ARRAY_SIZE.
> 
> Fixes: e3de7984e451 ("ASoC: tas571x: add separate tas5733 controls")
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas571x: fix tas5733 num_controls
      commit: bc4005ef43104da589951dba69291360c6a11ae7

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

