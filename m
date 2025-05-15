Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5E62798EC
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294522; cv=none; b=OqSMZGSLtqKbimR0+XaiDLmOX53ASi0sin4PBCpomFiqoUXEYIllerqPJ2gONu/JKVM/q/aOP0+scH5a98TrBkzOf4T5Ih45hpZx7pjdnJG+aAzJRMM2pzI/COiHaQn28am3QOV8WDvXzvDM5byEJowggGmiSzOBG5WY6NFPVBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294522; c=relaxed/simple;
	bh=FWkVhd1e+rN1MkOzu4aHGcRnovRlUpyoL9e1RjZDZbg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=buDrWdpFrQJ1RSDRd3wUExB+gBPocDQZ0LCF0bha086FH/Zn6Ky5Rb2zSw8Dl7LlSsABLvDiCFgEnrp/HLB3GPYR/Jouwjw68rorkWyPKFxdYWDInTsXcvSwkLmKiRUSx5b+vcFSteyrdfFG6zXOnbdjnU7lIxDeXjoJ3cS4qWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8qWiIPT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8qWiIPT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD8AC4CEE7;
	Thu, 15 May 2025 07:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747294521;
	bh=FWkVhd1e+rN1MkOzu4aHGcRnovRlUpyoL9e1RjZDZbg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J8qWiIPT+mHZPT7AQqadSn3+1bTsSwvYK+GOq65vtvFxh+8MH1YJi0Fg9oNJsCEKe
	 qLdtYtdBaREPQGp0jt/Bl8a7fx9Q5HamMw806/KxqOIDZwUeUTyM99WcRWNef/AL/7
	 XRTnFF4FOrQ+lwKpjxsUsD4uA1yJXST0UL1C5gbszowYVoNORFejwoAhWu36lrNukp
	 lu4ybryflzhexW2nBsWpleLr4gHHR30q0racZnMoEiyn826YPSAw6U3Ru9PYRROhCe
	 8nf4ujYfmUGpWs7Vqcn/+llkiGuG4x5cYDLqEnZqEr4sSFV0AMNhurm+sZBnSkEknY
	 ZWVxtD6W3/VoQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 Brady Norander <bradynorander@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Aleksandr Mishin <amishin@t-argos.ru>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20250330130844.37870-2-bradynorander@gmail.com>
References: <20250330130844.37870-2-bradynorander@gmail.com>
Subject: Re: [PATCH v2] ASoC: amd: use new ACP dev names for DAI links
Message-Id: <174729451754.272498.3315820407847091647.b4-ty@kernel.org>
Date: Thu, 15 May 2025 09:35:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sun, 30 Mar 2025 09:08:45 -0400, Brady Norander wrote:
> On AMD SoC platforms with an ACP2x gpu ip block (such as stoneyridge),
> the amdgpu driver will create several platform devices for the ACP ASoC
> driver to communicate with the ACP hardware block on the gpu. These
> platform devices include dma for audio and one or multiple i2s
> interfaces. The amdgpu driver has always created these platform devices
> with automatic ids. The ASoC machine drives hardcode the platform device
> name. This creates an issue where if the ACP platform devices are not
> the first to be created, the ids can be different to what the machine
> drivers expect, causing them to not find the ACP platform devices and
> failing to load. Switch to using static ids for these ACP platform
> devices so that the names never change.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: use new ACP dev names for DAI links
      commit: 51590571433e32cacce10b11051c6ff056bf0aa8

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

