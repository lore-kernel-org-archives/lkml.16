Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34449170826;
	Tue, 24 Jun 2025 19:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792345; cv=none; b=F8poT7H7+k1/tVxxG3y/AT3Xr1Bn/Cp/TxekkKhGC0+2IzmJ/7Kxgzas3bmGcUsLigCBwof6+UP5KqAn5KexX7jf3hFGNJCI50niUXCA+dhmGuoYfku8VB5DeambJ0Y1NgyuA9NYwc5dQdJWIE4ChfjDrNhBnXgOy4Q2Q4GdG6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792345; c=relaxed/simple;
	bh=2aydhy8/TYUYSu7UbTfOAnvVmmk+OduayyCx4UJx7Xo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fSE/VCMHu8kmVI0iDHx5mSvyccNzOIbb2WIFdT4Od049ZMhfH0nxcmo7fJl2f1RxxqRbpVL9LT7CtCVQXh8F2XxYJ7QWcqCrXML0/37SvjJE+Yfzsyu233QTUOlcJQnK+fymHdlepx/5ma0nzJyxatdCLSsvLDEOkq1/zgwrgmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eo31JjoI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eo31JjoI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD5BC4CEEF;
	Tue, 24 Jun 2025 19:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750792345;
	bh=2aydhy8/TYUYSu7UbTfOAnvVmmk+OduayyCx4UJx7Xo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Eo31JjoI+IdZVNPciylTBZoO+FwvjiY+o25DOjLuFbQ1+DE3mcTJqQFzuD9uaJDcF
	 FAYpdziddQLuaNabIa63rD1/oYs83g3OiKaYhkaNZnl2ikp0WUoFEP4D5oRh7mFeD2
	 WfkWoAtyOHo20Hg1dyO27r5ZgVFIindza29qqF0XuCaut2VDwpCMHx0sHtDgsJgY4u
	 q7uifl+QvMUIJi1OKNythNRo4QFVLZm70Gm4NZT2yeFkekY9TclPHlV5HrEV6kj9YI
	 HZYxQLM0vpd/s2cc2AQamasw1tVHrYnrPyriYt4xUokNBEBkwbErCIx5oFx5FOMVf4
	 6nz2VgcAd874Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Tamura Dai <kirinode0@gmail.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250615235548.8591-1-kirinode0@gmail.com>
References: <20250615235548.8591-1-kirinode0@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: Use devm_kstrdup() to avoid
 memleak.
Message-Id: <175079234144.274448.17790781183539385240.b4-ty@kernel.org>
Date: Tue, 24 Jun 2025 20:12:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Mon, 16 Jun 2025 08:55:48 +0900, Tamura Dai wrote:
> sof_pdata->tplg_filename can have address allocated by kstrdup()
> and can be overwritten. Memory leak was detected with kmemleak:
> 
> unreferenced object 0xffff88812391ff60 (size 16):
>   comm "kworker/4:1", pid 161, jiffies 4294802931
>   hex dump (first 16 bytes):
>     73 6f 66 2d 68 64 61 2d 67 65 6e 65 72 69 63 00  sof-hda-generic.
>   backtrace (crc 4bf1675c):
>     __kmalloc_node_track_caller_noprof+0x49c/0x6b0
>     kstrdup+0x46/0xc0
>     hda_machine_select.cold+0x1de/0x12cf [snd_sof_intel_hda_generic]
>     sof_init_environment+0x16f/0xb50 [snd_sof]
>     sof_probe_continue+0x45/0x7c0 [snd_sof]
>     sof_probe_work+0x1e/0x40 [snd_sof]
>     process_one_work+0x894/0x14b0
>     worker_thread+0x5e5/0xfb0
>     kthread+0x39d/0x760
>     ret_from_fork+0x31/0x70
>     ret_from_fork_asm+0x1a/0x30
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: Use devm_kstrdup() to avoid memleak.
      commit: 6c038b58a2dc5a008c7e7a1297f5aaa4deaaaa7e

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

