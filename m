Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02552156F20;
	Wed, 16 Apr 2025 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813425; cv=none; b=evycWGFPjb20kUi+sogGa/6iZm9SKAhRWryd3xwYTPXMb4IIN167BkG2zgs+ZLuy6fyankxpsJk1x+lUhnuQmUkmnHSLyN7q4SVkP26Q8JmXoxaQPnLvGtON/tmOXH9pqY/Tzp/fotYKun/HaYm9iFa4cwxoTDRqr7vCZcVXQQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813425; c=relaxed/simple;
	bh=lPfRXaDBjyOUAdWEOvH4n8J6zU16376uJs4mOfS7qTQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TLBKDjwJ8AHdovEM4Es5rjkWq233DOEV7C7QFQBGd/mjTrv06K0BZBuA7xemsowyuOFxh82EEFFJ2SbKPcl7pQ72uLR7spISBLwo72sJgpDSpm4icwhRRbdOHFsHH1OZUg9Kia1LeinI2t3jbA6XRQl5+eI8fpq/OMfAfa4zEG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FeiU5dpp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FeiU5dpp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32269C4CEE2;
	Wed, 16 Apr 2025 14:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744813422;
	bh=lPfRXaDBjyOUAdWEOvH4n8J6zU16376uJs4mOfS7qTQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FeiU5dppb3Ae1aIjW6ti9iDLnh4FdcviLcUFbhP1OPhFKdczAWxJ2ZBDiPOhXUH6B
	 fA2Bw5JD41g7xpRivVi6suVeDxgy/AjNcB7nrP3fMqz01bzMQeFLrENy8+d99XkKea
	 LC/BuEDJ5EXa5/DrtaLWVvvpXQakLzTrbMe1iSta2zG0E4cmsGDvUWwV7Up5r8xKCd
	 Kss27aAZ6F3DfBIxuJ5A2LNGYWBHaP6gYPbYzsF+Twz0O70zJz9nlxgv6OSIdqTm1Q
	 HjPkxNYwtyVoTS+xR2Nnj/u/jRHFvXGku/4ozHc1o3CXtIM09jHMQbBjUzTNw/Ak+o
	 l+hTYUkXbRGPw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 Vijendar.Mukunda@amd.com, peter.ujfalusi@linux.intel.com, 
 peterz@infradead.org, chao.song@linux.intel.com, 
 Chenyuan Yang <chenyuan0y@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250415194134.292830-1-chenyuan0y@gmail.com>
References: <20250415194134.292830-1-chenyuan0y@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Add NULL check in
 asoc_sdw_rt_dmic_rtd_init()
Message-Id: <174481341991.257514.3784884460701270028.b4-ty@kernel.org>
Date: Wed, 16 Apr 2025 15:23:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 15 Apr 2025 14:41:34 -0500, Chenyuan Yang wrote:
> mic_name returned by devm_kasprintf() could be NULL.
> Add a check for it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw: Add NULL check in asoc_sdw_rt_dmic_rtd_init()
      commit: 68715cb5c0e00284d93f976c6368809f64131b0b

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

