Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8472255E29;
	Mon, 10 Feb 2025 17:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208192; cv=none; b=RE1Q85fxwsukQCrPikmagobmw2x4IY7hhuujr+CYE3dGitBn7CE6AaIW0TQ/Jj5tV0i8T0X8CjZGEXgFyUw7TmQowKsK7kw8egwhUKJDtd2PX1NIE+wdVQPYCR53HC8qqXO8//dUg2cOtiAfzM3S/HFgwITnDZ2yT1BTjnhP2x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208192; c=relaxed/simple;
	bh=Fp/GvLOIEh7W+kfps4T6VXAGBZGptQGu47xgJiHj1FY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iDhHQLD3cPCgEqbhbi7ODoTHwoIwfLKL7dSr8yW4z4Is9ut83T/qiISvqsdVPDcnuFTcy8E9aa2BS6ByqucXo5ETPRKbwp3O135ejSl54V8G6HVUoc03De21zH6lbEEVR6ybGsSwANehoriQv5QWMdNH/YzZsqEuowCGsT9fNK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gj3HTFZh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gj3HTFZh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54924C4CED1;
	Mon, 10 Feb 2025 17:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208192;
	bh=Fp/GvLOIEh7W+kfps4T6VXAGBZGptQGu47xgJiHj1FY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gj3HTFZhbixjp3aYSM74GYTu9nxAnc3yd0pzUGX+IrZjW/nKQstIB/WRi0qVW99p2
	 pHSl/OY4do03VY+Xu7T+jZGtjjIj+6cBbpRtceB7WvN5GbsgYiHE3NxG7f/+mYzQYH
	 bAdMSx+CZ/sqKp5+Be/CUkS7egNqfWHM8fG0qryOmHPm4RAYitB49ZWQHf9yl8Csbo
	 dyw5+3SkDgIyXI6e1cgrKPAiLqkM+q/HsA+If09SSDdJ9YRhr07TJ65EKf6DllVI0w
	 tl0CDEVrDpCK3jaPgc/jA6UYwx+c+L86uRKY86iYk8NcekprPFg1ZPug1tTTP8PjSe
	 QDx2k82lBjyLw==
From: Mark Brown <broonie@kernel.org>
To: Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250210115937.53654-1-thorsten.blum@linux.dev>
References: <20250210115937.53654-1-thorsten.blum@linux.dev>
Subject: Re: [PATCH] ASoC: tscs454: Use str_enable_disable() in
 pll_power_event()
Message-Id: <173920819109.83245.7957527721534200073.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 17:23:11 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 10 Feb 2025 12:59:37 +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enable_disable() helper
> function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tscs454: Use str_enable_disable() in pll_power_event()
      commit: e97d06cb4386af4e069a2dc713de70500538d0bd

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

