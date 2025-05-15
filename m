Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC76A299944;
	Thu, 15 May 2025 12:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310917; cv=none; b=C68mi6yw+WHmFP/kGubkxZf9HB6g5ORh5iGMBATiAP6CS4KYAT0vC+wI9v5mgK/nF+mTDXyOwI1wXMiXrOrDhx3kjC3Lt0/Sbla6L/nMFezRsvY5pnIAdg4u3A4ipk3aAmxsoxr9Cj2Iz2QxHPkgKA3XmAL1cPzAfuzg3mzws70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310917; c=relaxed/simple;
	bh=PIYHx6tgc2AqldiAsYmqybFCMZ0RxWnj6Ah6FftuVmI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=igF/xZtv+CqqA1DKDRMsVuXyYWLEipcg1puMxkQYtRQDEVjZuUKL0hmTOjDYPTWYCQSBHpP700lRZ7q9zWWa3TXNNQJhTredgQHw9Q075X4YtBx6DqZAwLV6eJaVdt9AOc4h8Wh8ae/1NYuMjEwEeZoNa2zi++RGXTlGB+hluIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZPeyM7U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZPeyM7U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21243C4CEE7;
	Thu, 15 May 2025 12:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310917;
	bh=PIYHx6tgc2AqldiAsYmqybFCMZ0RxWnj6Ah6FftuVmI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PZPeyM7U4SZXGSMIBKxExSFu7cErfHfl8jcvxfK26ThswAkhQv+54W7NhGsL1yMpA
	 c25PFbIv4HSDWedWqD0Eqos1GdtOaXcTYPZI2rih9BUE3oVNUmxFu9K0D4G6bJ26xU
	 197+zqxdjqLQEh7d1vSuqC7J43nml1mCT1xaXF10eIsLWAe/YU8gtDIFbROQKa1kcT
	 0CS7xM29G28VbH7oj/0yXIO1aimkPiso8619+xdHS5xPZgCnFZ7i44FNUrjhd2h3SC
	 tMsR5EPMcYa+sb+h58LHBERkS85etX42WcR6ZJG6xn5LYxKI6QWWBBNNvlGFV0XI2P
	 7/hTphyQgxH6w==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, tiwai@suse.com, devicetree@vger.kernel.org, 
 conor+dt@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, perex@perex.cz, krzk+dt@kernel.org, 
 Zhang Yi <zhangyi@everest-semi.com>
Cc: amadeuszx.slawinski@linux.intel.com, krzk@kernel.org
In-Reply-To: <20250514033327.32641-1-zhangyi@everest-semi.com>
References: <20250514033327.32641-1-zhangyi@everest-semi.com>
Subject: Re: [RESEND v7 0/2] ASoC: codecs: add support for ES8389
Message-Id: <174731091258.350483.11584969721868310645.b4-ty@kernel.org>
Date: Thu, 15 May 2025 14:08:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 14 May 2025 11:33:25 +0800, Zhang Yi wrote:
> The driver is for codec ES8389 of everest-semi.
> 
> v7 -> v6:
>           - Modify the order in the Kconfig and Makefile
>           - Remove ES8390 in description of codec driver
>           - Romove unused variable in the codec driver
>           - Modify notation for declaring variables
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: add support for ES8389
      commit: dd4eb861d0521acca1b7e07683a7e90b2e01f66a
[2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
      commit: c8e7d528284a0bb1cd462b994c464bf31d24a0ce

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

