Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D0D264A90;
	Tue,  8 Apr 2025 09:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104271; cv=none; b=a5nFwvYhOe8MtRxeezR5Ky2rsj5QxuG3rJJ+It5Au/VsOvZb2vvEQqEnIZCjh2/AZeaceTUxRNa0B1xbjtYXgxrzF/oDIwGGSzFOHFrsbogtv+c2eXepfjVNNqtGvxQwLk+7qZicjdeaebiFpDdASHCMGXDQqg3vVirHDxox0yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104271; c=relaxed/simple;
	bh=sTZ3sRfDGoI6XtMysS010MJjEpEUx7UaO9Ipfzyeb1A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gooiKZA+C0dGhw+j8ptxAd4TVUFhEfzeFgPydEiq8jGQ1a5y3VPX6UQSJLeqGUYZ+195DbGpT387HoEf0ct+/CuRoFJPdKAoBtztJCFxT+J2i7+0A0u6GUJijtcxwe57GLdNWTeQdNHGo385IoqcxMVkbLzog4LtKvxb3gXZBt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jOhsTve7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jOhsTve7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8914DC4CEEB;
	Tue,  8 Apr 2025 09:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744104270;
	bh=sTZ3sRfDGoI6XtMysS010MJjEpEUx7UaO9Ipfzyeb1A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jOhsTve7pMXFPBeQnwUfVIlLRm3WyocCYRALMQ+dGLX/AYWfKhZf+khHzBO2JQh0U
	 eLjpjafzLhNcAgVEgqkc2xqsJb8oI5pxEM4AZ8q/r0fRCVDbKUnq56GcZX5ZJWOLDb
	 ClgTt6blr0stNpkqOdsLRYNjMOliCh+UE5PUb3Qj2w5O3fblYjdeKwCuCGP5qB8cen
	 gVLeFWIi1TWksQycCturVpS2dV17iGerfh4yUXSRFxaFrDD4+L/+Vjm0Lb4yafQ9L9
	 EXl4GxnKYJRxQlPd6nuyIGimf6xnC+flrJDsDEsEJjaXTifQo26mQVxk5gkPA99KfU
	 XhC/5TDtKniiA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com, 
 simont@opensource.cirrus.com, peterz@infradead.org, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250407063403.2772040-1-nichen@iscas.ac.cn>
References: <20250407063403.2772040-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: wm_adsp: Remove unnecessary NULL check before
 release_firmware()
Message-Id: <174410426830.1933566.15747552850224738396.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 10:24:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 07 Apr 2025 14:34:03 +0800, Chen Ni wrote:
> release_firmware() checks for NULL pointers internally.
> Remove unneeded NULL check for fmw here.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Remove unnecessary NULL check before release_firmware()
      commit: 03affa51cc995ac0d961990c2ca916fc87340723

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

