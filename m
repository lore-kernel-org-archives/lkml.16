Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255D1267F66;
	Thu,  1 May 2025 05:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746078204; cv=none; b=YSBkfeYA6MMcR38wzFyEOPukzjI90t9fplzvcNiNORj4gLJBriiXJaH1uN2bdFBXl3+q+jp1wAyQmnrw4puV60jjprs9KOlucpgZnFiCE4ySm67jyPhKP0J7/ulGgE3SfRqmriXrxeDgOKFhiOqqppOwiBEYpQ0zbeaR/7fLWe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746078204; c=relaxed/simple;
	bh=Nrgc0gY5E9nAftnrKuPVn5v0Qy3w1OKMTs5osTSQqzk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YIq1wCKotaxATUrQBXdQiGxdhVDfS4D/OczP0rWgB+DW+QKU3c49HKyBUIgGnWMKB+aDJpGUP+iWouJMhkMcd43NtW+CHxO4TyU+uPqMA+XgqVUg+yC73lBsrTMF12xCtcL8cxC2ECWCajrKQG7B9/Nh7r2M39qyFAm4gUoK+EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvOQZ1Ms; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvOQZ1Ms"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA3DC4CEEE;
	Thu,  1 May 2025 05:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746078203;
	bh=Nrgc0gY5E9nAftnrKuPVn5v0Qy3w1OKMTs5osTSQqzk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bvOQZ1Ms8N6sIVo5oU3uTeNI63Co2WEGyanUERSjjb3K/2qN7/jpZHb0C1V0X+e8w
	 UE9THyk5gtPD9xnhqnTdt9CHmrSJ3bigKlEp/I4Ma7VDQ5uxaD2hp0yj2vVx6FgQoK
	 TL5fUwc8s4kg1reDlGImWcKNL6uLp5zQjCdpPL6XP6Oh1/gLg84vEy/n7ccE3Svk02
	 dXQ4cGn3mjTuIjT4m9XdqNIrbOqOy3crl2k09aClmXZM5obkiw59pJr9wOyxgQIRU3
	 p6HOB8SpO+6PexbPV4PBREmhb1WycKH+yA4Gj5hSlmBP4xF7wQ+eY7fSSZRVMukgAL
	 qeAIXbnu+l0VQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, 
 Basavaraj.Hiregoudar@amd.com, venkataprasad.potturu@amd.com, 
 Mario.Limonciello@amd.com, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20250430195517.3065308-1-Vijendar.Mukunda@amd.com>
References: <20250430195517.3065308-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: ps: fix for irq handler return status
Message-Id: <174607820124.4025361.17364354865281577854.b4-ty@kernel.org>
Date: Thu, 01 May 2025 14:43:21 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 01 May 2025 01:24:43 +0530, Vijendar Mukunda wrote:
> If any Soundwire manager interrupt is reported, and wake interrupt
> is not reported, in this scenario irq_flag will be set to zero,
> which results in interrupt handler return status as IRQ_NONE.
> 
> Add new irq flag 'wake_irq_flag' check for SoundWire wake interrupt
> handling to fix incorrect irq handling return status.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: ps: fix for irq handler return status
      commit: 7f91f012c1df07af6b915d1f8cece202774bb50e

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

