Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C0029995F;
	Thu, 15 May 2025 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310930; cv=none; b=oMCtjUDwYfVToOppPStxnkQsXfD2UdLk8shRatJiPjH5Bh/2x3WpE3hkZBb/kt+mDnGyk9Ua7U+ekAhzKUC3kjEK1PUXdimSBgeSJ6J35hVNn9A1iLzstoWLkcVqstdz1jgoJWyqSFTvWTIXgmD02RZGEk1NVtj/SRtDa44CtwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310930; c=relaxed/simple;
	bh=86NXsxwr9vhZEYlXZBFK/v1h1nZ5Erj4W+GuIw278PM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kf5fSp2G9VGvsocVQHvuJj8qMM/KnfstGmsxGEPHhJHfDFyoc47/yrC1AU8wpCnZ3utbNOh7SIQe3SK4oRTm5m0LyGnC8PAgzu/iYr+jvtcA1cVOCUF8TSZP91zIowMg9IPbD7MJj9N8RiCm6Gc3AaHDSH5r2YX0MAD/AGSu9eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YN7ffb7y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YN7ffb7y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E17C4CEE7;
	Thu, 15 May 2025 12:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310929;
	bh=86NXsxwr9vhZEYlXZBFK/v1h1nZ5Erj4W+GuIw278PM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YN7ffb7yFwts5GmI1ng/AB94u1hmc4IJfOr//UwNihrDPbdf1RL66PDyfkEsTRend
	 uXZ0qjJFA8hKpIb4ePz3pd8aiK2euR3+gaWBmuoVIyyIWlNiw9JftL6B95wJ4zp02l
	 Uqi47/SBXfked9k/CYtfePmfXdxSUYKSaPKDVfGPm3ii3YqHIsQ8VIgid5eR7LqSJM
	 uFS0eLxvUF0AWZNfQwea6fBAwJa/qWvPFGlFY2OFox+X5O5zZBqnjapeRUSjRAJF9P
	 aD7tynfWiYUPYHCFNOvXsweHlE7RTJyescQwtdh3xvtCl3kz5tMB5WaFJm4E3t/7/2
	 J2WXFWO7ZhqxQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Tavian Barnes <tavianator@tavianator.com>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Peter Zijlstra <peterz@infradead.org>, sound-open-firmware@alsa-project.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <570b15570b274520a0d9052f4e0f064a29c950ef.1747229716.git.tavianator@tavianator.com>
References: <570b15570b274520a0d9052f4e0f064a29c950ef.1747229716.git.tavianator@tavianator.com>
Subject: Re: [PATCH v5] ASoC: SOF: Intel: hda: Fix UAF when reloading
 module
Message-Id: <174731092440.350483.15391857686536607897.b4-ty@kernel.org>
Date: Thu, 15 May 2025 14:08:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 14 May 2025 09:37:49 -0400, Tavian Barnes wrote:
> hda_generic_machine_select() appends -idisp to the tplg filename by
> allocating a new string with devm_kasprintf(), then stores the string
> right back into the global variable snd_soc_acpi_intel_hda_machines.
> When the module is unloaded, this memory is freed, resulting in a global
> variable pointing to freed memory.  Reloading the module then triggers
> a use-after-free:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: Fix UAF when reloading module
      commit: 7dd7f39fce0022b386ef1ea5ffef92ecc7dfc6af

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

