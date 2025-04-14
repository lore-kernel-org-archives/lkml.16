Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AAE29A3C8;
	Mon, 14 Apr 2025 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639004; cv=none; b=bRib7W0qc/EkDZ2P8olPlEqildBZrLNjpdnAD0j0BStMDAttfFwPAtA65qlNYcpLgF4CBJkaNY83jGBXaz1KBNQIxfbc8thAmq2vUvkHFAF0ZP4vWbfRFTogF5TdrwHaI/XH/Z90hGMa1XY7oxSKA+ncNqIaFS3T+WGNSmvAnWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639004; c=relaxed/simple;
	bh=59rcKrgh4DjYxCiTgqYJuu5lhr4VgPpBUnQFcFm2t2U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JJAmxR7/MKPTBZMX9abETq0HuFcPuPkaVrxz3d8qt2OvIL1BvZ0ARlWCE2yrcO1iwFm9sJPQ4W3CJBF8XPkbWUegMUGJ5MvglFOFgvJh5ItKw8+Xx7b+UNJmpFqE4lOqFAel0qpon3Qknx+xxBioZugiDXi1KnbBClAEio0z1X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eiYa85iZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eiYa85iZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0232C4CEE9;
	Mon, 14 Apr 2025 13:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744639003;
	bh=59rcKrgh4DjYxCiTgqYJuu5lhr4VgPpBUnQFcFm2t2U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eiYa85iZZFPW392G3CaiFcEse4fy04xz5/+v7rX3TDCVsb7UTa//QTHc/pfe7vqyS
	 2Ridi1+5+GicLjyDbhbugZigulIQCJXdTCiCcIw1TqZNa/7iWyhQPYp1Cq3Lg7ESdh
	 0GZ7taIJ8sB/bQx3mtteGa948VokvAg63BuQZNlYnychN0HI8/0rIR0DubRFo/zT7U
	 eGuILQLsrrBy4wOYQSu9RANGNzhDaqx152Kl8WXnEcqq0l4diTxQ/jscQ5XMzQ+UA2
	 EnQ5Shvk6P/8LaIbNCZskHYcF1ylRn7/yktGLP/PcfDWGhPbWX+lF9LjgRI6hPRjA/
	 Cu7bWy9nbCeIw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cy_huang@richtek.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Otto lin <otto_lin@richtek.com>, 
 Allen Lin <allen_lin@richtek.com>, devicetree@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <cover.1744245663.git.cy_huang@richtek.com>
References: <cover.1744245663.git.cy_huang@richtek.com>
Subject: Re: [PATCH v2 0/4] ASoC: Add Richtek rt9123 and rt9123p support
Message-Id: <174463900044.86688.6572642498182559313.b4-ty@kernel.org>
Date: Mon, 14 Apr 2025 14:56:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 10 Apr 2025 08:58:09 +0800, cy_huang@richtek.com wrote:
> This patch series adds Richtek rt9123 and rt9123p support.
> It's a 3.2W mono Class-D audio amplifier.
> 
> Since v2
> [PATCH 2/4]
> - include bitfield header file to fix kernel test robot issue
>   https://lore.kernel.org/oe-kbuild-all/202504052206.HFqFRXUk-lkp@intel.com/
> - Use #ifdef CONFIG_PM to only inlucde 'runtime_resume' and
>   'runtime_suspend', this will fix kernel test robot issue
>   https://lore.kernel.org/oe-kbuild-all/202504052244.bgS5yxev-lkp@intel.com/
> - Check vendor-id before triggering SW_RST
> - Fix 'SW_RST' write date non swap issue and add the wait delay for sw_reset
> - Rename control name from 'SPK Gain Volume' to 'Speaker Volume'
> - Change regmap cache type to _MAPLE
> - Since ID check run once, to speed up regmap cache init, modify
>   num_reg_defaults_raw from 0xf2 'COMBOID' to 0x36 'ANAFLAG'
> - Add comments to describe why use pm runtime for RG special handling
> [PATCH 3/4]
> - Modify the property name from 'enable-delay' to 'enable-delay-ms' to make the
>   time unit more specific
> [PATCH 4/4]
> - Update the property parsing from 'enable-delay' to 'enable-delay-ms'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: Add bindings for Richtek rt9123
      commit: 667ebcc13dd63f59e2a1132e0f54d2f3067597db
[2/4] ASoC: codecs: Add support for Richtek rt9123
      commit: 8bffd24e45618b6c3d6ce11947193c6d8ba846a7
[3/4] ASoC: dt-bindings: Add bindings for Richtek rt9123p
      commit: 4a046b67d2d267daf884798ee8509a502abe7a58
[4/4] ASoC: codecs: Add support for Richtek rt9123p
      commit: 38c2585c7439cc678ae105dd826f10321db29552

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

