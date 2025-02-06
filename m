Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1FE1D90D9;
	Thu,  6 Feb 2025 20:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738874677; cv=none; b=HUIVK2YuAu+l+equEcOOySs3QB0Rmp2y3SP9vy507MVSgdFNN1zxRYBr+aknzUMqHxWpzuBRjy6ZbNLoQmNIMdtHy7yCpwQ2hnyb8VjjUcOh+fZB9z6tE/4Wp04+SIlGVEA21Ivixca0cDKCk3Ic3UgSbU1sxHfmEDcCQ6W8+lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738874677; c=relaxed/simple;
	bh=qyUFi/a/PAEf26vNDRfycjP9CzYrFMnd6NlOxfFcf5Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Rrm8dByAUZvDRs8PBTQOEyqrE84XZ6G7V/u56p70l+eTTBLVY7U/s4DUrRZQpiHpM+Wqdtx38VY9popwO0SsU8hhY35qOiZwoD+wxpzmm18gnC439+ClWF0lgNibmdTXhfu8q1/+Ry2s2jgiZCA18r8GAdnHpUqU0tEtzxsJvd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLN//yfL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLN//yfL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192F5C4CEDD;
	Thu,  6 Feb 2025 20:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738874676;
	bh=qyUFi/a/PAEf26vNDRfycjP9CzYrFMnd6NlOxfFcf5Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iLN//yfLRjTKEmMY7Q630butaCkl1R7QRg7Ey8X8OjM1fugY5DtdlCE2iFqnrQEQn
	 84T3gYsfLOFgPmHwFXxeo0CZg06SRDKNmOzQNiwhdYK4xoD83/pT3so1zvpfqbaUuw
	 cKeVzY8ldGsjdcD1yhhK1nKpiFDd9Q2d8tgDexSJQF+0AAIaLjUdaDOE5qtrxPFhqD
	 /lKNRw5F8wC14BA1QsSkiZwumeYhfRWRJBmOa6zK+vyWRrAP7PXZ5N/G+1V5n/2WN7
	 8yNNdQ5KF8EzHJ7Sq+XBRLOKxO82Qow5xT1uFX0Xk9DN3xjtkyvFDnaBVriJtGq4XR
	 yZt03Y2WfAVBg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux@treblig.org
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250206014028.237423-1-linux@treblig.org>
References: <20250206014028.237423-1-linux@treblig.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Remove unused
 mt8186_afe_(suspend|resume)_clock
Message-Id: <173887467380.363675.10029607802179953957.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 20:44:33 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Feb 2025 01:40:28 +0000, linux@treblig.org wrote:
> mt8186_afe_resume_clock() and mt8186_afe_suspend_clock() were
> added in 2022 by
> commit 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control
> in platform driver")
> 
> but have remained unused.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Remove unused mt8186_afe_(suspend|resume)_clock
      commit: 78e66dd5f32a1a8e5ee6decadd4e4dffa7d2c40d

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

