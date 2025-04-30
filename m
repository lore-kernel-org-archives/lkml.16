Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD09622E3E0;
	Wed, 30 Apr 2025 22:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053522; cv=none; b=fk9riBhX/s7wqgS0YtmfX3TqHimixYmtjA9FqTIPG2s/DrB+rvli59bunIpSnsYGBWMko+M+JL9KX3wH1x0KUBNrlyWTjqJPltHdMBV9je9ra5G7l9Lk/nBLwUTK/nJ/TE4QuQWkgbYBF4fyb0c0d5++OBK8/m0L0yTnOKOTrBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053522; c=relaxed/simple;
	bh=Vag4wImnrRdFuo0kB0X58yuRd3Wmja4Poa4vfojRmho=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EI6FBhKFSWZO3I8QekIZrCXx704bj/DHx4nu1PPLykT8vBMldZWOejcpaRYtj9ZlVheX7aL8iKoXOlYE/rib8lQsMzv1pp+E2itjtqugjn4u3jHBro6zc05xdX97VFj95N5VRERudt5pWs5nGT7015UFyraFbaW2WyP0zN38hd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThUC1b0d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThUC1b0d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B43C4CEE9;
	Wed, 30 Apr 2025 22:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746053521;
	bh=Vag4wImnrRdFuo0kB0X58yuRd3Wmja4Poa4vfojRmho=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ThUC1b0dfHSZYKr2427ap3+bKgUtB9SLOeqA0f1P769NZvJbiyrn1RidQlcidW7mB
	 bPaTQ6v4e5nwAaA6yVWS/HQSrO/2rWOIwPb0XWrr8Nu3wSCEx3g+mste13c61O9YOJ
	 PQwwgeBvcyeCJToqvWNJxeYi/rksts082KJC/1W1nnt5y8sCWwpcwwbWUYHRKG3rRq
	 2i+9XJjMaO28F7R6dLJccFdX/lUiuHkqe812yTWMno3bxS3vqGRlnwHiNsfXuNXYUK
	 Hy4Qgf5Eh61Gkput4BQlo3AcllLxdm4B1XFA0JC/SPIzSVrkUsqbq9NAa5+wEia0EM
	 /zeRIwHQkuzWA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250429073545.3558494-1-arnd@kernel.org>
References: <20250429073545.3558494-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: Intel: catpt: avoid type mismatch in dev_dbg()
 format
Message-Id: <174605351810.3987837.13398669922442608597.b4-ty@kernel.org>
Date: Thu, 01 May 2025 07:51:58 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 29 Apr 2025 09:35:19 +0200, Arnd Bergmann wrote:
> Depending on the architecture __ffs() returns either an 'unsigned long'
> or 'unsigned int' result. Compile-testing this driver on targets that
> use the latter produces a warning:
> 
> sound/soc/intel/catpt/dsp.c: In function 'catpt_dsp_set_srampge':
> sound/soc/intel/catpt/dsp.c:181:44: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'u32' {aka 'unsigned int'} [-Werror=format=]
>   181 |                         dev_dbg(cdev->dev, "sanitize block %ld: off 0x%08x\n",
>       |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: catpt: avoid type mismatch in dev_dbg() format
      commit: 95b2536137eeb66f20947e0fb0d0c100c8d6a140

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

