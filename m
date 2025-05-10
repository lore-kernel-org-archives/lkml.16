Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436001754B;
	Sat, 10 May 2025 01:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746841781; cv=none; b=mSsxeYnj6txNeULG9mYmJJRGLy/LXEp5+9XII7+75uBI0uEEmtSWlu/1IbPCiqYICxR/vlQRzBESCNkucY3Pn+3ZuXAyp/ASaZPQc/LM6Yv9ht+LYO+GlnJj7LKLX2kXnNZAYhwxWkTH6saIM/IJ/brYSt/H3+46zNRlSVaX97c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746841781; c=relaxed/simple;
	bh=Aov1SJkhdkQKlDCLDo428Jyt4hs8og5eGT1+m5Ecjf0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nsOBiySug3JnzuE1qKl65jWTKH5fpUMJOeNOWh8hvLhzZHmw2l4262Oq7DrLaroWP13+Wyu7/Pj7F0OaFSDtIfJ/RVv9DGnGEKjI4+5DphukSPt6T8iUcHBdRLGrPO5++WDnSrIxfQMh+MbpY1bVM/Lu61SfJII00AwN94LCaQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbcvcntU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbcvcntU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DF7C4CEE4;
	Sat, 10 May 2025 01:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746841780;
	bh=Aov1SJkhdkQKlDCLDo428Jyt4hs8og5eGT1+m5Ecjf0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JbcvcntUOmGA+YQOkeGNE2hLhRYaKeEHXoX258ipZ1CJUhcbom2v0wxLUlaRofriQ
	 qPpb6TKKo0O+pXwJoLtdk5rmIiIEX41rsRKMQSs4PSEbyCFJD5vUWnMw9ArL8YAG0P
	 7dOu9GuETlRsAklsLOzspmYc1RlexsX72sb7FYDF2RbLvqihWEf3aR+Y0typjtzCQK
	 hDPnOedEIQYdf1DpovfF/zCTBFzdz2MQ+10Pan8OUEjdXv+j2c91kU6DAYJOLs+JsB
	 VAdaGRRDNn4elctTGkYlwoT+g+briT9TV32b07qErYjqXhJ9UZUJya9Ji/OvFNCFHQ
	 bOrxa8gmD01YA==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux@treblig.org
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250509003716.278416-1-linux@treblig.org>
References: <20250509003716.278416-1-linux@treblig.org>
Subject: Re: [PATCH] ASoC: Intel: atom: Remove unused functions
Message-Id: <174684177763.47320.2027004600109136122.b4-ty@kernel.org>
Date: Sat, 10 May 2025 10:49:37 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 09 May 2025 01:37:16 +0100, linux@treblig.org wrote:
> sst_cdev_fragment_elapsed() was added in 2014 by
> commit 7adab122a57c ("ASoC: Intel: sst - add compressed ops handling")
> but has remained unused.
> 
> sst_get_stream_allocated() was added in 2014 by
> commit cc547054d312 ("ASoC: Intel: sst - add pcm ops handling")
> but has remained unused.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: atom: Remove unused functions
      commit: 248b75f89e99e59e5362d02d4df3f5e698137c29

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

