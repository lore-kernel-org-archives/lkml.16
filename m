Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0EC2010FD;
	Mon,  3 Feb 2025 14:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591921; cv=none; b=vAVvPJst2XRUKhPc4mBHz3PXP4Fzmuw5pgDu0DN77k73KUXBpIW8OSP2KI1FlMNaQf5AYocrRm4Wo1AxFex+I19+0ShS4X/XoWqzB5BeCk/ESU/7tw1472eXyCzz6MIlP9Kuur2ykyJDvSLOBLQ3zZeLmfR31QBO0fsZiqIy62k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591921; c=relaxed/simple;
	bh=RuhoI0q9VIHDH8RloW1zzkTYapkneNVbj2oLHxYolm8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QdEYw1NNBiT1x/Q62KOa6BGxEZRc0VOhCFsAXo2FAINO8eysHq8/htA1PqF3CvVwo9xjLZF6cbr+Ba7b5Z29GSC9E0zVltKFDt6INHHk5BVleSCgf8iHphsxn9uFYn1L2bY1UuosFDDqHpXfE2Bry1OfZLNBPpqqkeQhvwcQKos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5VgupnK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5VgupnK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B19BC4CED2;
	Mon,  3 Feb 2025 14:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738591920;
	bh=RuhoI0q9VIHDH8RloW1zzkTYapkneNVbj2oLHxYolm8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=P5VgupnKomeI8wq7jc1nNcqPIyHRVFQQO1qQlsYYtZTCMFEtC/aOjIzmDDEGkVT+f
	 AAqGxd05COq6pMU6RtVbK/S+WV3J1a1caOpfERTd9y2HCjHDtjGeYzeLz7qbW0r+MV
	 7SbeWnVElJBxhLfAkhNJ1pJzeGj1HlvDJWmLSlo1VhHz/0ao9KJiXSCWujebELNlrz
	 7oIPh2lz0584visv0CkX01028WMTr36HXudMC/XRlik3iqVtKrBH2t9DibYS3SCnB6
	 Pz8hwNlwUN4PRWo4yZAxkzQk3qLeuoQOUd3v+RN6eK7UM/Dgo5Ncnqe4e7O8Z37+5q
	 l5ru33oX7p5xg==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
In-Reply-To: <20250116142436.22389-1-n.zhandarovich@fintech.ru>
References: <20250116142436.22389-1-n.zhandarovich@fintech.ru>
Subject: Re: [PATCH] ASoC: fsl_micfil: Enable default case in
 micfil_set_quality()
Message-Id: <173859191820.164425.17327834062368689870.b4-ty@kernel.org>
Date: Mon, 03 Feb 2025 14:11:58 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 16 Jan 2025 06:24:36 -0800, Nikita Zhandarovich wrote:
> If 'micfil->quality' received from micfil_quality_set() somehow ends
> up with an unpredictable value, switch() operator will fail to
> initialize local variable qsel before regmap_update_bits() tries
> to utilize it.
> 
> While it is unlikely, play it safe and enable a default case that
> returns -EINVAL error.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_micfil: Enable default case in micfil_set_quality()
      commit: a8c9a453387640dbe45761970f41301a6985e7fa

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

