Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4507D229B18;
	Wed, 30 Apr 2025 22:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053526; cv=none; b=eI0wmXwSErOBnXEiNja0v94WhsairB8NI5/JhaYRo2E/RAHPLL+Uevi7raDm37zl/BC8vSov9L47sSvkFv+4k38wPPn68/oLabH1pKqk3optLBfPJkH/iBUgzjf+u6NMsItXk1IAEprq9LrKEl6DeUIrg330ywy8u6AwZpNEyLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053526; c=relaxed/simple;
	bh=TRf5nNxoG1OLT8kDErnJIhib+961nKj12iCjKjJ51rU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iVI4WgT23affg/q0hk8YVHeB6c6ctEcML+FvWJ1SxztI3/8Wk27DP4vgkzMeSCU+q/YKl7VZoT6I7KvzIJvXt8WGdxBlSqaq1ufbzoDPYKR1nJfAazWsl/j44nNsskYpCYf6e117bqQVYGN9Q/WQp9dxj4k3glh3RYwB+YRVCtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYj4eN3g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYj4eN3g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C696EC4CEE7;
	Wed, 30 Apr 2025 22:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746053524;
	bh=TRf5nNxoG1OLT8kDErnJIhib+961nKj12iCjKjJ51rU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FYj4eN3gNW/VW5ZmPevRCefDvodXNrYtQOC82Ce1xh3SMehwH8aMWLq2mCusOuS6H
	 vlBZQv432yT0M0Pk0lh4oblwRAUGAkflZBM9A5Pu7nf1HT6yo2ZeQxB9yKuKJk08un
	 HNLJfrtzQktn470y6AS5yV+FiBOzUdLJ6jNkUwjdDC9AEcxmmQ36fZG1qNRFaq3ZOv
	 /jIFSSgKSyXMA35sk7n9bCUQNb2+D8SU4iMsJR6gFUwDtLz+iH7iZW1Jf8IjH5FKDo
	 d/1WVcF65I4epttFRLMCdcYVw2vRwMcTaaaREtLlMsofQ20BQACf/icER9aCBWISa8
	 ItZqYjQJbpgOA==
From: Mark Brown <broonie@kernel.org>
To: kernel@collabora.com, Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Julien Massot <julien.massot@collabora.com>
Cc: Liam Girdwood <liam.r.girdwood@intel.com>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250429-fixup-of-sof-topology-v4-1-ff692244d64c@collabora.com>
References: <20250429-fixup-of-sof-topology-v4-1-ff692244d64c@collabora.com>
Subject: Re: [PATCH v4] ASoC: SOF: topology: Fix null pointer dereference
Message-Id: <174605352065.3987837.14664479563513199593.b4-ty@kernel.org>
Date: Thu, 01 May 2025 07:52:00 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 29 Apr 2025 11:19:22 +0200, Julien Massot wrote:
> The "get_function_tplg_files" function is only applicable to
> ACPI-based devices (sof_pdata->machine and not sof_pdata->of_machine).
> Skip this check for OF-based devices to avoid a NULL pointer
> dereference in snd_sof_load_topology().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: Fix null pointer dereference
      commit: 114a6e63d9cc11311587773d5db4cf4105cf658f

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

