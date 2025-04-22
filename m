Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4119281506;
	Tue, 22 Apr 2025 13:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745327577; cv=none; b=iBEzzHhtgr7YYsSZtuAip6PkxTXJrotr3GSRu0Fbqk9oNEdCqyMjiYZ4qzdaLki9jHjR9lQNWC3ZteucTg2fajmz6v7T1YJhs1NLpEMutqxthlkl0v08L464HyzibGWwulJRUx9rbrpFC6K28Mmy/J9rbtEdoHzQsPtpDZI0bzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745327577; c=relaxed/simple;
	bh=U8E+P10nJTcnfH3OLNLVLoy0J9XTHaH5NMRkNUM5qkg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RHAbAy1Fj2KbNlyPhzBMaxLN5sTVYqO7FdGNUEUCOVFm2R2tVLaRc0ZrkBtZwK0LJLSyNgfR6Up7oO5QAzm8zheRW1hNPla10oXowrcCxYu+uZjnR6cpV4X7CBaSBB42lLlg8SJ/Bqevv1E3AHaqIdwRuPTunbPlPvlJjvclaXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxdX3oTw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxdX3oTw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D77DC4CEEA;
	Tue, 22 Apr 2025 13:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745327576;
	bh=U8E+P10nJTcnfH3OLNLVLoy0J9XTHaH5NMRkNUM5qkg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DxdX3oTwyvyrHUUfqBlfPA+puLalfUiYsonDM3G2N8PiyHTae47JjpysafTv+G89H
	 qe+ua013i6aTi4+yy7uTxqCOwGT15h43P7NcIT6tC9Jym55HXlMgRFvrrs5nL7KR6P
	 exj+TH9t4bw4trcz11525xsrUZXToKB5F7SoaTwNGNap6MsFe6PFIH2N+tRKO1hGWM
	 qeJrMYgktxAqIvPPCmnKMmf2lc1HQnAMR7LOTtarPPOXHITgbHz/QVqksTgQctO5CY
	 FYbchH9Nf1/U0leu79SZ5IYXhTVQfVeDyBfESugCz94ac8RYVK5yuKUXB0kwjLyBxg
	 42uEQQoF5DQZA==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Nathan Chancellor <nathan@kernel.org>
Cc: Stuart Henderson <stuarth@opensource.cirrus.com>, 
 Qi Zhou <qi.zhou@cirrus.com>, 
 Piotr Stankiewicz <piotrs@opensource.cirrus.com>, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250418-cs48l32-modern-pm_ops-v1-1-640559407619@kernel.org>
References: <20250418-cs48l32-modern-pm_ops-v1-1-640559407619@kernel.org>
Subject: Re: [PATCH] ASoC: cs48l32: Use modern PM_OPS
Message-Id: <174532757424.44137.16474989394967675567.b4-ty@kernel.org>
Date: Tue, 22 Apr 2025 14:12:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 18 Apr 2025 16:36:01 -0400, Nathan Chancellor wrote:
> When building for a platform that does not support CONFIG_PM, such as
> s390, cs48l32_runtime_{suspend,resume}() are unused because
> SET_RUNTIME_PM_OPS does not reference its argument when CONFIG_PM is not
> set:
> 
>   sound/soc/codecs/cs48l32.c:3822:12: error: 'cs48l32_runtime_suspend' defined but not used [-Werror=unused-function]
>    3822 | static int cs48l32_runtime_suspend(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~~~~~~~~
>   sound/soc/codecs/cs48l32.c:3779:12: error: 'cs48l32_runtime_resume' defined but not used [-Werror=unused-function]
>    3779 | static int cs48l32_runtime_resume(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs48l32: Use modern PM_OPS
      commit: 6070ef6e4202dae61027c146d797319b9e5c07b3

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

