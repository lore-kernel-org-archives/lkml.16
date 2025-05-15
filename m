Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2E129ACE2;
	Thu, 15 May 2025 12:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310924; cv=none; b=FH6l+gbxgq6/HGYxt2KF1TEc5m06Gz2Ejil/zZuMWO3WgGZii9PfwzDKiLHeRzJKXnqpRqtNtZwTPv25uywisDJ0Od1RfbfL0e9RuAVwsldNpiw8s1LwGB54CCFYxKRrfY2faSY1bXDr3RPtcDTMb3Bhj345v/KIHnXKAh6GCQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310924; c=relaxed/simple;
	bh=o6Yo9ffZe8vls+XOaSwAXVdrRoKLr/juPqgg+0PvdX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=evdci05j6760JffhkhDwkgRFE8ZxHHMKesnSlMZjvcpS8B0UsLMThUd5EP0LQCQFMczOAaPiePRAD1MaYfIEFYE3C/vfoduPpGSmci3xY1mfcV+/eCj/W/9+fcDGP8waKo+ikxd+Wfei4O53PWj5BBBIwhk5I61MzDPF8o5P+70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqo+yoYW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqo+yoYW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E067C4CEE7;
	Thu, 15 May 2025 12:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310924;
	bh=o6Yo9ffZe8vls+XOaSwAXVdrRoKLr/juPqgg+0PvdX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bqo+yoYWmnQ8aLtTYE8fM6eJQrohVECcFco+1TAIKTPADWVm7oFXW7zn8j0wtJ+WD
	 KI1atVJtISFq07mf6TmtuG/ZWk0l+vZqPBbk8zscy4ibbcYUwjG9saT/yw2w1d2WHr
	 EkqdbIHxBiE8izHqW3LS3Sl96+a6hG8pfEvgogTePRON5I/lyAUGfJ7mW3hLFXTR8u
	 orBTs9NBnDw2FFNTmI72+CruqPHqiMVNQKlaaiW+UHIxzQike/OSQt8LTNBymipelv
	 alNTPEAV9315lEqipKJgMyY4DBOvLro2WlpV6ujP55cLuIzUhcbcZvev3y1f8/cr0z
	 VoRzLmhIyh3tA==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, tiwai@suse.com, devicetree@vger.kernel.org, 
 conor+dt@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, perex@perex.cz, krzk+dt@kernel.org, 
 Zhang Yi <zhangyi@everest-semi.com>
Cc: amadeuszx.slawinski@linux.intel.com, krzk@kernel.org
In-Reply-To: <20250514094546.35508-1-zhangyi@everest-semi.com>
References: <20250514094546.35508-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH v8 0/2] ASoC: codecs: add support for ES8389
Message-Id: <174731091956.350483.2947360703784632396.b4-ty@kernel.org>
Date: Thu, 15 May 2025 14:08:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 14 May 2025 17:45:44 +0800, Zhang Yi wrote:
> The driver is for codec ES8389 of everest-semi.
> 
> v8 -> v7: Modifying apply error issue
> 
> v7 -> v6:
>           - Modify the order in the Kconfig and Makefile
>           - Remove ES8390 in description of codec driver
>           - Romove unused variable in the codec driver
>           - Modify notation for declaring variables
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: add support for ES8389
      commit: dd4eb861d0521acca1b7e07683a7e90b2e01f66a
[2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
      commit: c8e7d528284a0bb1cd462b994c464bf31d24a0ce

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

