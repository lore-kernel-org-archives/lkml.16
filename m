Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A722322FF22;
	Wed, 30 Apr 2025 22:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053527; cv=none; b=ZD4pmc8f7UfDWEjmhcfg9undCjwEXmbfjrulUYcsPbp6/ljNYOze1/Isdij2rdjhLeE2shn8W6tRSyGGnR7kBX/kGY7G5pwMWpxcjyTbcoKpkc7TdFMsFnKWqMYU8BUgal6jm6pnTqQT6id5SMxYyyEDPZbYOmA7+xlt98N3jco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053527; c=relaxed/simple;
	bh=4h2BCOssuYf0kQML71qfvD/CQB1Auz2TykxH3S6TwWQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X+CXJ6QD++njxTZtpzzq1suEHCoApMqlxq1Za/EKgajrJMzaow/sUZHHTlluMfPtahDiTWNpBupbL9EqT+2QlxrzUh59m2m3ELr2mbZUm+cNmdmLbSSIkF34VATP/PGhisKL/EDzm+PdE6DRuUwxZihcDCxw2mKzHzclydtKqjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUI9E/Dy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUI9E/Dy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15439C4CEE9;
	Wed, 30 Apr 2025 22:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746053526;
	bh=4h2BCOssuYf0kQML71qfvD/CQB1Auz2TykxH3S6TwWQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lUI9E/DyyV3AMnFbABnANub2+e5IY52EG0Kpm3JyL4E94t7na+/W+xvRLPVzibz0F
	 uii88OTk9gHQCGX3AlSw6+gh8NaBETHUbG+rIkIDnYO3P1Ax7SPs5ZOOknQsyDIft+
	 lPVr2ovY4d6bxgkDhCUcRMXPeEIsaRPX8uKEsskXmpEUWmtBfXjfdxO7weMO2xICEl
	 HDepWI4u4sQP3n0ckvfeVwJs2sb5baVy5dwAAKMD4oVXpeQhGf7jOf2X7doVmhvX3K
	 tXD+HhwWV5getHL1jPDr+9rdahEIb5JAMe9j+seTLa99vA8SHScZHC6EGDP8HVTY/r
	 C2HHqrZXthdZQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250429-acp-sof-probe-assign-v1-1-9784f6eb7660@collabora.com>
References: <20250429-acp-sof-probe-assign-v1-1-9784f6eb7660@collabora.com>
Subject: Re: [PATCH] ASoC: amd: acp: Drop superfluous assignment in
 acp_sof_probe()
Message-Id: <174605352392.3987837.5322034989048569569.b4-ty@kernel.org>
Date: Thu, 01 May 2025 07:52:03 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 29 Apr 2025 13:29:43 +0300, Cristian Ciocaltea wrote:
> The 'card' pointer is not required to be NULL initialized as it is never
> accessed before the related memory allocation takes place.
> 
> Drop the redundant assignment.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Drop superfluous assignment in acp_sof_probe()
      commit: 85f380f2b9ab6e9a8753626fa3d8a3f4a323043a

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

