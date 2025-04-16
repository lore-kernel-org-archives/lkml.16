Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358F3224AE3;
	Wed, 16 Apr 2025 18:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829685; cv=none; b=uH/yrj5dR5nAVksz5xne+HWGTN+/joxMIEGgOj7jZswtdXSs44tZl+c8h2Y1lJ4zitPGY4PizSdZZRWplH8W+9mM9eToL/+JZrjoEGtW/z+ZpWvNl2BJOn71FNRwaSOWn436KeUUX5kKJTygLS4B8CJJjco7Rpsj6aeUQuCS0ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829685; c=relaxed/simple;
	bh=d+pzbqFI70uNctwUefK5DbeSTUReKOKmGsluFpLn3hc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Bh3BUAecAKDZ7u/qte85dglU1+N5df51OZ6v8QrxRgCveFORrY+aKtzvH1hePtlKsnfkxK1MiOnYLIqBQkrTl+UJt+kGzm6qlswUykE7Jac4HrGlVXS5y4XHUQKCyerfWk93kTocw9AMKQSSlb0Sgzq171x/O8rOgfq6vptUiHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bd9IAI3l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bd9IAI3l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13969C4CEE4;
	Wed, 16 Apr 2025 18:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744829684;
	bh=d+pzbqFI70uNctwUefK5DbeSTUReKOKmGsluFpLn3hc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bd9IAI3lWfIdFpjUP9shQkuTn3h/SjtOOTEXovelsT4Y+rJAyUR+5bbPzmxr3GCta
	 3fVCb8dIZLyK6RKw6nZyXtydMY+L4bzXvBrImoe9GKmNw1Vwe5IHMKf5aeA8k5GFmB
	 GIcgs7dY8Eb9FF83WnRCWQjrmYA0huOJnoaWGWC4sRbMUzIOKO3mcRQ8BssRldZ8lT
	 f9stJ94i5mo9NUr9VkpLeHHZVE78Lz7683i2NXUc+7FSvDUntqUUOTOtv1N5bP/o9p
	 Is92sMwyGdtoJXWq0n81b+RgXVc4ULR8nXvhNcuPTmMQKPyWeztGn9iclOtgm/+WiD
	 1u1vi4R0ydYqg==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250416081204.36851-1-colin.i.king@gmail.com>
References: <20250416081204.36851-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: cs48l32: Fix spelling mistake "exceeeds"
 -> "exceeds"
Message-Id: <174482968283.823707.1904803455286479988.b4-ty@kernel.org>
Date: Wed, 16 Apr 2025 19:54:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 16 Apr 2025 09:12:04 +0100, Colin Ian King wrote:
> There is a spelling mistake in a cs48l32_fll_err message. Fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs48l32: Fix spelling mistake "exceeeds" -> "exceeds"
      commit: 7ed50dc550b0a3bad82f675aaefd8cd00362672d

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

