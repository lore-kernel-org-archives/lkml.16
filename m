Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86B528A3FB;
	Thu, 10 Apr 2025 13:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292824; cv=none; b=TlIYzxo5zL1aX4IUMvy1smU/XpZCixuywaMCIOOfqVXowQ0Y43s3+9CfScey50FJNXrX/WUqGfgvtuFbblfI3UMDKgGl4gfpQKe2rr1oCmp+ADfFFreYZ3RIav0f8DzaCeemMFUnvH4YZdWhYc3Gz0A+dGB/dvjzeVumq0+lLSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292824; c=relaxed/simple;
	bh=bl5IUQgJObOrUKEy2OIJfXeF4HSKpBmDsKV7Ih3rpQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LW4RlqCvi0I5xzERUYeOcYh0MDc6On6uZ9fl04c399oIrTaq87ndDxplyEXNtNnXuKz+YzYNK4W+b6jI9zFZnb+XT72T0cw3HLxo5y4KaXxv5rIjoF3QKi2d+sHMWwLlwP6YWqXFPZBf0IA9ekGb2MB/pt3O40iDmxhGGI+t5TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPTVGwYG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPTVGwYG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB4AC4CEE9;
	Thu, 10 Apr 2025 13:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744292823;
	bh=bl5IUQgJObOrUKEy2OIJfXeF4HSKpBmDsKV7Ih3rpQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZPTVGwYG3XvOQ8nkIrvVJsPmoAliY7pas/LyV6SFdvmPSeXLoG2xlmySlCdlryFNC
	 wx1CXVOUTMydJJV4eklx3eabEo3ngJ9ES+iBW4K/4uKMASzI29I85jK2KrmIccUt2W
	 AwsC6xBeOhzXaJY4E2kRmlR2k+NKX8exrbUwA9fnNFCxcNDBryxFt9iWQ/1suDvmgr
	 xaMvEyWxIvnRP2IVVunf7NRiXsClIqwAto+yPWMnyA6iTWNJYudrUT6YnF5m+sanxK
	 287Xr7KJd5CAI8a5t+V07oFTIwotf9dlI6Z7r67yU+MN4cs3X0nx8pwUomTx9Exz46
	 z91FkNGPhW9TA==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Herve Codina <herve.codina@bootlin.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
In-Reply-To: <20250410091643.535627-1-herve.codina@bootlin.com>
References: <20250410091643.535627-1-herve.codina@bootlin.com>
Subject: Re: [PATCH] ASoC: fsl: fsl_qmc_audio: Reset audio data pointers on
 TRIGGER_START event
Message-Id: <174429282080.80887.6648935549042489213.b4-ty@kernel.org>
Date: Thu, 10 Apr 2025 14:47:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 10 Apr 2025 11:16:43 +0200, Herve Codina wrote:
> On SNDRV_PCM_TRIGGER_START event, audio data pointers are not reset.
> 
> This leads to wrong data buffer usage when multiple TRIGGER_START are
> received and ends to incorrect buffer usage between the user-space and
> the driver. Indeed, the driver can read data that are not already set by
> the user-space or the user-space and the driver are writing and reading
> the same area.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: fsl_qmc_audio: Reset audio data pointers on TRIGGER_START event
      commit: 9aa33d5b4a53a1945dd2aee45c09282248d3c98b

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

