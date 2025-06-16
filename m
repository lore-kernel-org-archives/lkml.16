Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E46D270ED9;
	Mon, 16 Jun 2025 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089050; cv=none; b=TR/3teeBAdODfeABsNNbrI31hcYwo1cpFlOC5rAo4FzchCt6jEXYsDw+Ic+qlvQgUIxeqWiuB2B3iLrCw1jMCeeSCbd5G2PX5Dpt5+evOi4M/a3W6cY1kc033eywKwJE5J47aOcCAphAdut1/CciRxYf3MXRsjE4XgfNV2PXiIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089050; c=relaxed/simple;
	bh=p0CsQj+JFgFHyyG8R5T1UyGdGPB6JdHYfKB71eu7m7w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H4wjxAdI2m9JTTiQNvyTKyIqnTNDNTXuEUW4v/eTfe52jeOaqOj8u/ao6Nyo2dk2ShGlmRBCSauh6OQxjlbYQMYZFRj/HorKqvoE4/wd+5sOXRRbjr6Y1guqkpayRKHtLqbI+8MF6eRffeGI7d/UVJtfQ0EDEfHwUCwTzykt15E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BnHhMc85; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BnHhMc85"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D81C4CEEA;
	Mon, 16 Jun 2025 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750089050;
	bh=p0CsQj+JFgFHyyG8R5T1UyGdGPB6JdHYfKB71eu7m7w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BnHhMc85D/L5aWnMZAg7Bh3FvFDxaNEIUoQbGnFf6jWZC6YXcg2r2iWd8Q5ZNck5J
	 cVfVaF29IYQBcfPQyKGOyY37bdtladaLiUMjJXtyWXANea6gIRiaKzI5JeXWC9kFnt
	 Kmj5bORpzwcTTvLUJu0QS993dH/H/w6n+EvI5Jln/SAGHHt9iw0Fa+iQm+yr/F9A9L
	 zjWIyh0t2HHkeZCd4/dWulzWwjDa4ao91/MdYOB9a6LBEwt5TjF80Pd2lXO5qfH+0I
	 aPUrDJBXHrCqYpAVw4htjpbToT2ccgorGBsrTBii3diqmglNqFoGwN8NtIsSnceBlS
	 IA64uxIqLIRMA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250616103052.66537-1-rf@opensource.cirrus.com>
References: <20250616103052.66537-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH RESEND] firmware: cs_dsp: Remove unused struct
 list_head from cs_dsp_coeff_ctl
Message-Id: <175008904904.262284.5050695266640590092.b4-ty@kernel.org>
Date: Mon, 16 Jun 2025 16:50:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Mon, 16 Jun 2025 11:30:52 +0100, Richard Fitzgerald wrote:
> Remove two unused pointers from struct cs_dsp_coeff_ctl by taking the
> struct list_head out of struct cs_dsp_alg_region. On a x86_64 build
> this saves 16 bytes per control.
> 
> Each cs_dsp_coeff_ctl instance needs to keep information about the
> algorithm region it refers to. This is done by embedding an instance
> of struct cs_dsp_alg_region. But cs_dsp_alg_region was also used to
> store entries in a list of algorithm regions, and so had a struct
> list_head object for that purpose. This list_head object is not used
> with the embedded object in struct cs_dsp_alg_region so was just
> wasted bytes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Remove unused struct list_head from cs_dsp_coeff_ctl
      commit: e7af416aebb36e6681b9c6950d0f6352aee7c084

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

