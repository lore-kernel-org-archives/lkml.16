Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9595B1B960;
	Thu, 15 May 2025 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294518; cv=none; b=oEZ0w2bAROGF3yf/IB5rPnr4UB3ALV2d0FnmEPcBjk/0s2E473nGwXyjMt2LXWMmf3sv9qTSiA2Iuu6umpAtIdvHL/Y/CMsTMuQatPvKmoxaGz4hz+vUIqY+3qy/KkS++N7Dc5JOQbW8a8vHE99yNiIyJMtgLaZKruE80gVu4jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294518; c=relaxed/simple;
	bh=dYrQXGQfr0GYaeOk+T9moBDD7fjUMd3RMthPoXbwT98=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EDZ9u1rIwfPScWegqUg/F8hpBPSpOvYk/GyusDKJWvPrsyGqTutvSM6Ycyqt+KWrqCg0myIVwiCSkj7Mzg9CtJk6zYj0rSH1nfFUDtOVeWNSpKy+JF41ZQEKzmyYh+QgPLECTVNlEjqV7B2Y+RGPXRIvYKnMh7kgXuj4vYtcDEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGPVTF5O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGPVTF5O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D41BC4CEF0;
	Thu, 15 May 2025 07:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747294517;
	bh=dYrQXGQfr0GYaeOk+T9moBDD7fjUMd3RMthPoXbwT98=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RGPVTF5OL9HncY61eB4V5iepnAKw7ZE5m48nI4Q4m9z14+sdbJiW53D0rhCGRsTrC
	 qm2GOjYVFA6MY1x/4SD6d/Mn7NEWQ/5kLMHTQX0KMKFPcpSyjixkac8gvzslwMhMaZ
	 uqUV/ZiYhJF10XaJdqifbxju4iDMXtI8aYiFepsu3G270e/aMEmRr5/SsCoSIXTS88
	 pqWI8rkVpslgrbBWXiPLbMCzx3J0zp+rxUK4E1k7njw42J/IQVP36kiHqYhgZjv8+p
	 1QOpjFsYmJQwWv9FXT36QKGR0tomA+RCx5Ehr/QjBw6FwU0s3vdwpas+QSmpRz6M5+
	 /rC7cVmUebzgg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, I Hsin Cheng <richard120310@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, Vijendar.Mukunda@amd.com, 
 peter.ujfalusi@linux.intel.com, christophe.jaillet@wanadoo.fr, 
 peterz@infradead.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
In-Reply-To: <20250505185423.680608-1-richard120310@gmail.com>
References: <20250505185423.680608-1-richard120310@gmail.com>
Subject: Re: [PATCH v2] ASoC: intel/sdw_utils: Assign initial value in
 asoc_sdw_rt_amp_spk_rtd_init()
Message-Id: <174729451152.272498.2680302769777134595.b4-ty@kernel.org>
Date: Thu, 15 May 2025 09:35:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 06 May 2025 02:54:23 +0800, I Hsin Cheng wrote:
> Initialize "ret" with "-EINVAL" to handle cases where "strstr()" for
> "codec_dai->component->name_prefix" doesn't find "-1" nor "-2". In that
> case "name_prefix" is invalid because for current implementation it's
> expected to have either "-1" or "-2" in it. (Maybe "-3", "-4" and so on
> in the future.)
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: intel/sdw_utils: Assign initial value in asoc_sdw_rt_amp_spk_rtd_init()
      commit: 5fb3878216aece471af030b33a9fbef3babd8617

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

