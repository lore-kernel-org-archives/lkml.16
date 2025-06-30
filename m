Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D6226158B;
	Mon, 30 Jun 2025 11:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283624; cv=none; b=A+MInq6DaKWIYr3TyP47gZL/x1LAowMuoLpmCMCb8lKr5PmpJBFg7LtYlCqhIYcX2e4pgl2Q0hUhSoLNKjBjDK/ZI9ylyz/leD0Qv0xT3Csycmi4nQV2aT+Fdg7qrnAhdO9pk66WhhQWq556eZKgu9SvlclPnNtfFtvloTf5m2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283624; c=relaxed/simple;
	bh=s17SDTQKRXJ7jzA2U3d45oSAp+1+EHBfx49CHVYe/nM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KoaKEW1rTNpAaQ+J2X0H6jUOhE2fqrAJs8sLeBGq6svkb6KU3ALYseOq2CgwgD9Yh/4APbRAtuTeUGG8R0DRYdrMQZwRRIdqYxzKSmIS/a2CHfd5APzt5NUuORgvojLdyBRhE2qZbiQZB0rv6W9kE9TR9g5ZsoJWS9F6vU1d/60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaTIlZNb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaTIlZNb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08819C4CEE3;
	Mon, 30 Jun 2025 11:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751283623;
	bh=s17SDTQKRXJ7jzA2U3d45oSAp+1+EHBfx49CHVYe/nM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TaTIlZNbBqUre1LsoHxBTrG+D/645wI4PM4WyHW4l0Zru8OoRMBlfRgKj/fWYh7jv
	 boerEYkeo4gqWQX7J+NC1sVUtEBTzELcdUvUsoe+VWtKiJksq9MSMmrRbNNDCkcVoN
	 RLDKDjJxVe9mZAGQvRZ0vfzqwY7Dh1GwMiX7SKgAeU5SGKZZLRj5yti+PQMC9yc226
	 P5QDSKf448J1TWtRQ2CZ75hUKbvbKEBjxzIA8DDWXrMkKcOIMjg/uJjL70lPzrzP7R
	 Tn6UtI6gfNvoebYUAasu2Z5bFFRgmj/yt9d/aaJ1vznmcXC6X/TwfnyGibaYGqejoT
	 oqfoKOrmX4Drg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 zhujun2@cmss.chinamobile.com, thorsten.blum@linux.dev, 
 colin.i.king@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wangweidong.a@awinic.com
Cc: yijiangtao@awinic.com
In-Reply-To: <20250627110306.23488-1-wangweidong.a@awinic.com>
References: <20250627110306.23488-1-wangweidong.a@awinic.com>
Subject: Re: [PATCH V3] ASoC: codecs: Add calibration function to aw88399
 chip
Message-Id: <175128362177.28563.15699568323913750801.b4-ty@kernel.org>
Date: Mon, 30 Jun 2025 12:40:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Fri, 27 Jun 2025 19:03:06 +0800, wangweidong.a@awinic.com wrote:
> Add calibration functionality to the aw88399 chip.
> When the chip is in calibration condition, calibration
> can be achieved by configuring the chip's internal DSP
> and save the calibration values in cali_re.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Add calibration function to aw88399 chip
      commit: 29ddce17e909779633f856ad1c2f111fbf71c0df

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

