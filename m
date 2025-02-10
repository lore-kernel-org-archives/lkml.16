Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B41F460A;
	Mon, 10 Feb 2025 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205001; cv=none; b=uO4EoLjTbakH8pr+IWmBUnU+44uw/bj2AgKC3l6UvOEKAs1ojVrsfgukpK5f01q7CHfL3ekk/w+B2t1WElX/OUFcWBDqBNloWPLXqYDb9TZAbyvzKdXgTFmZWEfmqiQI4sp+gAEKt97MbQMYwHpf5VTfRtSFq9y9WzMtVwGrL1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205001; c=relaxed/simple;
	bh=SnAIGyFpSth2g3LxsKnoq7TeR8aC9lOiVHFRi1o/ejI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DPokGAsiLpFQNjM1qDtFj/Bw9S/eIKhH4gKGriBuhh8MZkh2+S3/Tn9ZloKi8AK0nhOsgjSCBdD/Mtr6qwgUdOs5wlFmelbtk54Uy1RrIdwKAdE2snDrz8IvDYgWAj20d2qpS6WmWv7tvONl7rc9Px44QVQE6O2b3Q0pEBtRb3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TepEXDMR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TepEXDMR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B27C4CEDF;
	Mon, 10 Feb 2025 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205001;
	bh=SnAIGyFpSth2g3LxsKnoq7TeR8aC9lOiVHFRi1o/ejI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TepEXDMRy98Rxzh7LyWtp/ADJbv7kE5Slqz4AqPOIcohrImCJGmTiKyywyr963lGT
	 TsbpKFKmT55L7HddOWm0W/pGXe6jshRAaqC2dgrcM0dGBeutaS17WQQK1qOLgADDL0
	 VxAZmZjQ/zKHmjWgT/OSj4YC4UoFQm3v2q4icnpYfox2DErvQ2OrX6TLD15CsPU9i6
	 NmdHHiQhVcr6L0+bM11R4rZJu5XjeRSgTQZ3X/kdeYNnGCQRn10g8ml8CYInkfUyc/
	 uR1SoFhseT9mLWPWYh0qtYePXNSNi7Me96t4ONpqiE9auAh2TCD0Rwv4zrvm6+w316
	 ssuhkcNSWJ29A==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 imx@lists.linux.dev
In-Reply-To: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
References: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH 0/9] Refactor imx drivers and introduce support for
 imx95
Message-Id: <173920499941.65690.12050706337593664456.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 16:29:59 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 03 Feb 2025 12:17:59 -0500, Laurentiu Mihalcea wrote:
> A rather aggressive but arguably much needed refactorization of the SOF
> imx drivers. The refactorization is meant to address the code duplication
> in the imx drivers and decrease the coding effort required for introducing
> a new imx platform.
> 
> After refactorization and imx95 introduction, only two drivers remain:
> imx8 (meant for the imx8 series: imx8 (imx8qm), imx8x (imx8x), imx8m, and
> imx8ulp) and imx9 (meant for the imx9 series: imx95 (for now)).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: SOF: imx: introduce more common structures and functions
      commit: 651e0ed391b148f83afba0bfbd8a56e38e58c34d
[2/9] ASoC: SOF: imx8: use common imx chip interface
      commit: 645753d01356ff1a756812f1c69c53eb5c9081cd
[3/9] ASoC: SOF: imx8: use IMX_SOF_* macros
      commit: 563e40153a56cbfae8721f9591022df5d930f939
[4/9] ASoC: SOF: imx8: shuffle structure and function definitions
      (no commit info)
[5/9] ASoC: SOF: imx8: drop unneeded/unused macros/header includes
      commit: 45e02edd8422b6c4a511f38403dbd805cd139733
[6/9] ASoC: SOF: imx8: make imx8_ops_init() an util function
      (no commit info)
[7/9] ASoC: SOF: imx: merge imx8 and imx8m drivers
      commit: 896530b7b0c08ee8b3296d5f012bfe1b0a979b86
[8/9] ASoC: SOF: imx: merge imx8 and imx8ulp drivers
      commit: 07e3e514dd385300bd08da4a8df09240d272821e
[9/9] ASoC: SOF: imx: add driver for the imx95 chip
      commit: 6cf5df1040ba0694aea6a5edc6f31811a442ea36

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

