Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D119C266F0A;
	Tue,  8 Apr 2025 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104272; cv=none; b=Njb6M6ACLnyXqgUP5xV9OLS29p6C76x+5gS5dlIKD+PmoHxfxJ5EcMR6B3NNtrCv0nCpWdNMROVW67fNfm4wyy84V2yY18a9nhddhi463dhAUmMGeji339jlOB5PzaUKouAWZcWFPYThyoUGXTuloJjZbq8kuvJNhx4xz4wBzqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104272; c=relaxed/simple;
	bh=FU7RkpRkiTNEi+B4sFrTxyxTGqeAITxf3yPSXH/A2ZA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vg/nxamoBezVknuTFGUZ7GfL8kywixImJ6ut6BT2O8pza5Fb7vnLVZ7Mqbqo87UPgzKFhtv8aNU8q7BrvSQ2NPFg5Q9rXmdlmyztM1G/bneZWmKVfXaGOQajdixO8YO8WAw8S0pHCvztR3aGfKNohouTYaMK/dj9/iAHwGLGXnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHMGnGdZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHMGnGdZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B3BC4CEEC;
	Tue,  8 Apr 2025 09:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744104272;
	bh=FU7RkpRkiTNEi+B4sFrTxyxTGqeAITxf3yPSXH/A2ZA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PHMGnGdZwt6YXJ5B3Uq3clj4tkLeUt6IhvTITKXySRC3ztZV/EMleWI0EFIXc48mM
	 ZcHBl+LpbMuL5EMUIBx1ARKvZi8YWpZopLu/nZuhKG9CB9RYusjdXqsEhzI/Ze2JDd
	 9Xugvsp20AR76mnNFPTSDrbXjQft8ocdxiKyuuhtnClGLiiiGzTaGYAz6OGWG/zOeg
	 bJ4BzKo7dF1520OlE0KSeytoMNrYuNS3PA/5BRo29EF1Hci355evM7R4kmb0l3JLB+
	 QRNYFBRm53/2m0ETAmAegFyirGufNHJ5D7OE2+LXjhF2T2G+Xxy0zzzVI9ahoI8b5y
	 619+xEiLbHn4Q==
From: Mark Brown <broonie@kernel.org>
To: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250407062725.2771916-1-nichen@iscas.ac.cn>
References: <20250407062725.2771916-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: tas2781-i2c: Remove unnecessary NULL check
 before release_firmware()
Message-Id: <174410427071.1933566.1900612750925333159.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 10:24:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 07 Apr 2025 14:27:25 +0800, Chen Ni wrote:
> release_firmware() checks for NULL pointers internally.
> Remove unneeded NULL check for fmw here.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781-i2c: Remove unnecessary NULL check before release_firmware()
      commit: 4c035fab9f42071c4024495afb2cec1409280eed

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

