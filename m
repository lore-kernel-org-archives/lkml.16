Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A571A1537C8;
	Thu,  1 May 2025 05:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746078201; cv=none; b=C5i8S7gntyZ70dYeoNJjk2avLdnpnI3SmW+Whs/Q5PIJoZq+OpMhw0me8U3d5lp/ALwInrL3oR0x2qB6GLeI0uetpwUIJZi1YB9oJIjDvuWoqA0wvWt2Y9eGEkMJcAH+WxYGcJ5BS7q7kwB44dqD+i/i3a6md5Qex++s7OsZMX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746078201; c=relaxed/simple;
	bh=qu0Xmfor536qqIpQMxGHEiDaMpRk2KVbHYC5st5MJBk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R0XlyUaxlyNENH7zJXzz7xZp7B2BVSF1pzc4MHw/4qXfxTjbbbSxpwiUYkDOVv3LbnDZnosyjUx64EKu9oYDGYnIybWm3kZxzKf44MzI7pYNxKq049Mcj7TWfK+Chfz62Hh9F8avyZiB7IBxj/z7J/S/Sf/Bsx5VxV3lnMyHtLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CktucJZh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CktucJZh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4773C4CEE3;
	Thu,  1 May 2025 05:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746078201;
	bh=qu0Xmfor536qqIpQMxGHEiDaMpRk2KVbHYC5st5MJBk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CktucJZhFAJzob9150t0M7StzV50ttYgLnwXLQcj5NKSY8RrpBCI10ba3Ri7/4L5r
	 QVHJr4smW4qKdj3/3WrEaUDiWI5s0Oky4gJiagSvXKTCd13XecIGU3Fy0y+BPGawRZ
	 8sg/OKW5keHCpWGUhscnfpv+wXRi2OQG0aysKu636Hsnhpg2Zcdy7KFoNIKMo9adLj
	 3ZsGoJmapgbGnfTtN5FDX8iayQW6omZWDdl8F87B9jiodpJ1vF9rlszqR73xl02kbZ
	 M7bzG7Y9wjIjr9o3tw78eG8w8lc7YbslNwKyDo1s35TX/YKYCWPXV9vh4dIPZ9R6IN
	 bgjE7SMzfzbDA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250429094910.1150970-1-alexander.stein@ew.tq-group.com>
References: <20250429094910.1150970-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] ASoC: simple-card-utils: Fix pointer check in
 graph_util_parse_link_direction
Message-Id: <174607819946.4025361.17609297159298131450.b4-ty@kernel.org>
Date: Thu, 01 May 2025 14:43:19 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 29 Apr 2025 11:49:10 +0200, Alexander Stein wrote:
> Actually check if the passed pointers are valid, before writing to them.
> This also fixes a USBAN warning:
> UBSAN: invalid-load in ../sound/soc/fsl/imx-card.c:687:25
> load of value 255 is not a valid value for type '_Bool'
> 
> This is because playback_only is uninitialized and is not written to, as
> the playback-only property is absent.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: Fix pointer check in graph_util_parse_link_direction
      commit: 3cc393d2232ec770b5f79bf0673d67702a3536c3

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

