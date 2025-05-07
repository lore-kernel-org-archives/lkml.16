Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4D41A29A;
	Wed,  7 May 2025 00:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746578942; cv=none; b=EeLHjR4G+4Viv0BkPp9ClzDKlzIH2yfgbZyTXhBiB33HSVyHn+1Vk/0jnMvM4hoFFld+jPi2YNxNeQtyb8GfoA4P8ZbHXpWqcihKFXLaKr3qNd/r7mzQEWUQy8//fMzD80faz5oSJu8GOFS7pQ4wgtsCh9DDQFOP4Dk3wBF06Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746578942; c=relaxed/simple;
	bh=MLKOT2gHTP1wwq8U3HaFeOUnLtiyxuTvpeerAJ7AQCQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mUu0pbdKKyjdHRnJOWE0fOFdQzdjqeV+1ECA80oFVQ1FnmcRrZGhgiR8slaNypViyM/sVJY8g7WBQJ0UsfQGj3dE8pZrfRswokgz2ne1hWDfXLeHU12jPYO9Co1/G1EKs+FXBI+3yL6ERccTcVXUVswt+xJ4jB2IkWZ1RK2GRZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZUwMnkt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZUwMnkt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A22DC4CEE4;
	Wed,  7 May 2025 00:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746578942;
	bh=MLKOT2gHTP1wwq8U3HaFeOUnLtiyxuTvpeerAJ7AQCQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NZUwMnkt6DzDXBpuJImOVVJwnRwSK8Z7Tl9VAwJEEzUDPq/PIV4Cp4BZA3Ot7oiXe
	 VeBaVAuI9sU6XHGtrhiJU/TBxsg9bcQlalrSDeWIro7zg04HaP6tWxPnoWnlkHSmAd
	 TLSuxaLQXu99gnsj09eU6YcvjedAT0K31Xg1XsZihgn8L3LuD+TLnKMX4clGknmzNb
	 NOeXVB39UHXnuvbLlrRydRPZJ4NiwS76gg1NonhjUeR1c+0vdtmIgI2Cv+tDyVQSml
	 kN7A9zV0QGxrio41vsPvvzgmGdkxHSnJPqqf6Gcy3WTraNjJyDOCH+kOXwNTum35CF
	 OffkB49G74qIg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>, 
 Damien Le Moal <dlemoal@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Philipp Stanner <phasta@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sound-open-firmware@alsa-project.org
In-Reply-To: <20250425081742.61623-2-phasta@kernel.org>
References: <20250425081742.61623-2-phasta@kernel.org>
Subject: Re: [PATCH v3 0/4] AsoC: Phase out hybrid PCI devres
Message-Id: <174657893832.4155013.12131767110464880040.b4-ty@kernel.org>
Date: Wed, 07 May 2025 09:48:58 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 25 Apr 2025 10:17:39 +0200, Philipp Stanner wrote:
> Changes in v3:
>   - Remove two forgotten calls to pci_release_regions(). (Amadeusz)
>   - Adjust commit titles to common format. (Amadeusz, Cezary)
>   - Apply RB by Czeray (not everywhere, two patches changed, see point
>     1 above)
> 
> Changes in v2:
>   - sof: simplify return. (Andy)
>   - intel/atom: simplify return. (Andy)
>   - Send a separate series for AsoC. (Andy)
>   - intel/atom: Add another patch that switches EINVAL to ENOMEM. (Andy)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: sof: Use pure devres PCI
      commit: 45054bb10fd8a545a1feeaab16af1a87ab7fcce3
[2/4] ASoC: intel: avs: Use pure devres PCI
      commit: 58fa9c629e29ae921d055c2b7a1e372ae991fb79
[3/4] AsoC: intel: atom: Use pure devres PCI
      commit: 938cabc603dc9b040fbfbf7c37b2b48dff8946d4
[4/4] AsoC: intel: atom: Return -ENOMEM if pcim_iomap() fails
      commit: 14a3fd030c033453d436233f4c422b4903786ed3

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

