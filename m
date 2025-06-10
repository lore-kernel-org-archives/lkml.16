Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB21A2248BD;
	Tue, 10 Jun 2025 14:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564998; cv=none; b=Bk4oHeAMoH7EG+LKwdE7S3k+IjAXjwXcoijIOyclXUYe3TrPK5GoOAhNAEULN7rTBIfe0BqYWF7OoWjZiY3eiExG0sqp1sAqPCBfJ8Si/FNoN23MVP8OUGzBsquchf0+hv6Ek9v7yw5dq1RDDu2+zQmTlRNH7+jndKAcnB9c+Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564998; c=relaxed/simple;
	bh=7mGVnBrDOT08Nq5IroCPSq34eFZ/6sYyG6SvpJ18f6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qHzgAhTXEM/xqFXXYegYb6FiVs2mGAj1oe3rWlCMRCeGEOJ2mo+CHylc6GdjEI0PtV73z+L3Ap38J8lr/KlUxfPlJOcW1Lspd76gDHtp8vwflvUkQXXB7WqpKjsf7G5W3TcrjZI5JLZhonZusCwQz3ybBRfISt1IGQ8H1lTNWdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/5xyELM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/5xyELM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C36C4CEED;
	Tue, 10 Jun 2025 14:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749564997;
	bh=7mGVnBrDOT08Nq5IroCPSq34eFZ/6sYyG6SvpJ18f6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l/5xyELM8eESbIfWL+s4jIQecmJI9aNJh0AeoBwO6bivdDRhqb1ce6UaScDQCdGfX
	 YRiecXwQ+trUCBqHzrr/WYn4ka5YQjhjG9SAUu14WI6lHf6Ix2r6+q95r2v4bcSV8D
	 1VX8QCg4Rmef62EM5753PCnW9zbFTDqJpwc6Prx90K7hSEeiP3Owcosv/SM3PMS6PU
	 fEJL7mGMeojUpGb363OLDHLzB+bGWJvGRvg89TzOWCQsIdMH4y6uS9TPOFkJtfJ7y3
	 oz/v/CJ271deYzTniO0vLVPPtDjwKaulRVyFXl5I+RrVCf5cLWBr47aeBD+xJTC5oZ
	 P3E5TCis086Mw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250610093057.2643233-1-arnd@kernel.org>
References: <20250610093057.2643233-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: ops: dynamically allocate struct
 snd_ctl_elem_value
Message-Id: <174956499535.45975.12838399607440197526.b4-ty@kernel.org>
Date: Tue, 10 Jun 2025 15:16:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 10 Jun 2025 11:30:53 +0200, Arnd Bergmann wrote:
> This structure is really too larget to be allocated on the stack:
> 
> sound/soc/soc-ops.c:435:5: error: stack frame size (1296) exceeds limit (1280) in 'snd_soc_limit_volume' [-Werror,-Wframe-larger-than]
> 
> Change the function to dynamically allocate it instead.
> 
> There is probably a better way to do it since only two integer fields
> inside of that structure are actually used, but this is the simplest
> rework for the moment.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ops: dynamically allocate struct snd_ctl_elem_value
      commit: 7e10d7242ea8a5947878880b912ffa5806520705

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

