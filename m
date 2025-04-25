Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7C128B51F;
	Fri, 25 Apr 2025 17:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602827; cv=none; b=PPIhq3PLIR5+LIyJ1OQZ1s/FAymS9mg+iqGl/muSIvZgYmntGL6r5YfnuSXa7Z76h9gNG3t/ZgcqkbQ/Go+ZVU9wFwWy7003keWpGJLt27qvZmKazbzF7jvggR2sox32SFuOfYKEmLWjtUpbZ9icqlINrItx2IwGueT5zdbqmaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602827; c=relaxed/simple;
	bh=6ocjWhYSI8qotqytj7xpemjZ9TvHkYufmHU9wQ6o7PQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rD0orqJifCiJG1ZNHDWFeVkYUhuAjVyy9gJ1XDfZ9/haeOov0jSbc83t22R07WDcxjmqOkJaqU7bdGjoh9bt9T0GvUFtj2N/3N4mklxzK/uGNwHVr8Vist0N+Q5O+6M6i+vmP0w8T0YYgHaOxOnHT92TLV9wic/EwzOzE9pk/5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A4GTHISz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A4GTHISz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6E7C4CEE9;
	Fri, 25 Apr 2025 17:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745602827;
	bh=6ocjWhYSI8qotqytj7xpemjZ9TvHkYufmHU9wQ6o7PQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A4GTHISzejxDwVKOH6fbq91E3XqWLQyoA/9kHeuIDqP51fHYLTEErd2TWcN4ObL8z
	 t7N++svDsnUYfhFJazaG6x6e2IXo5go8b+7ki9HoV98yxAm0aNFGZydeOPDJpY/hcd
	 ewRXEsoPMtuv6hFAZyfGODi8tbB3eB4KBKcXTLqcDa90jVgwJSr9l9h176by+nKfxh
	 +MT3mE9DVGMM2taTLIZEfv7pUFhzZOSicNttNykMXCN6YzdkF9tZcFbWCA6V19gAiJ
	 QOTFJ5hUfA7E/zVHnfQkd3UVz4C1JfkeyrAhSD6Zvx96PXrtqDqqRSaIyxMniYoOCM
	 rlseESokSw6Cw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com, 
 mario.limonciello@amd.com, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Greg KH <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, 
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20250425060144.1773265-1-venkataprasad.potturu@amd.com>
References: <20250425060144.1773265-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 1/3] ASoC: amd: acp: Fix NULL pointer deref on acp
 resume path
Message-Id: <174560282390.225473.13689303737740038724.b4-ty@kernel.org>
Date: Fri, 25 Apr 2025 18:40:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 25 Apr 2025 11:31:39 +0530, Venkata Prasad Potturu wrote:
> update chip data using dev_get_drvdata(dev->parent) instead of
> dev_get_platdata(dev).
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000010
> Call Trace:
>  <TASK>
>  ? __pfx_platform_pm_resume+0x10/0x10
>  platform_pm_resume+0x28/0x60
>  dpm_run_callback+0x51/0x1a0
>  device_resume+0x1a6/0x2b0
>  dpm_resume+0x168/0x230
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: amd: acp: Fix NULL pointer deref on acp resume path
      commit: ba85883d160515129b58873f74376a89faf21c7c
[2/3] ASoC: amd: acp: Fix NULL pointer deref in acp_i2s_set_tdm_slot
      commit: 6d9b64156d849e358cb49b6b899fb0b7d262bda8
[3/3] ASoC: amd: acp: Fix devm_snd_soc_register_card(acp-pdm-mach) failure
      commit: 138e6da0392ed067d0db7b5b5b4582c3668cfcf9

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

