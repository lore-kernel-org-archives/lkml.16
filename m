Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F89525A352;
	Mon,  9 Jun 2025 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476416; cv=none; b=l4tgi90gWy6f0X7akoEH3779olHHwhGd8cAg+fFL8XSeAKuyfCJpGiEfL52NoYoxUeNksVCY4noo96+K5OnczeFyuvFpqeCB8LmWZn5IGv/TBa7M7hEp8+57vyGwGJ5Whbm2orr8xHU8f78s0x0e6u88K5syFQJm1gcM7moFL3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476416; c=relaxed/simple;
	bh=X9XD4EFOdykRcFhrxrtSRa7vv6d3l9lZP9aiuTUFF+M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oH39N1S/B3FCgaLzVXV1ahHfnYybuoHHtd3lOmQWpZFriBfFioQkQPVtKXwmkskB/D/OqwHo8mMjZPbCbJsLxmPLl9cOP++PbGow0PpxAPfM/LuR51NOtwKqO014YH/9KO2l9uh9omf9LjiWT8jjCiwv3uaz1sr1EDKtBPbM810=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBm62lse; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBm62lse"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F713C4CEEB;
	Mon,  9 Jun 2025 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749476414;
	bh=X9XD4EFOdykRcFhrxrtSRa7vv6d3l9lZP9aiuTUFF+M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IBm62lseXrAlWxrhAiW5V4GsDw9OWbep6hi0qSwy7hMU8L0y9sFm2mNVPJSqfNIu2
	 FmRSnRVZ2JKvG+eYRI9yB6GgxbjEY/Jiq4dhVpkgC/JskwlexcfDS8Lt+2uT36Rjgl
	 3nLHq7xZQWdwK1Cj6cttY1TF2xXjbdsmHOikKKrycR2VogzQZXI7D246l9ulu073VT
	 tM5hnn//H22CIl/VuPYpoMpQMI2u2hww13RV8z1KRqIuzkaYTP/TGnCayiQea9eKeX
	 Zu3Fr51dmUIafNMl4/YOLMd4/n0tDikElp5el1fB3qqSV5roL6LV+qFVSIdq9RieAN
	 hXDK6kKbaApgA==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Stuart Henderson <stuarth@opensource.cirrus.com>, 
 Piotr Stankiewicz <piotrs@opensource.cirrus.com>, 
 Qi Zhou <qi.zhou@cirrus.com>, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, 
 error27@gmail.com
In-Reply-To: <20250603214813.197346-1-harshit.m.mogalapalli@oracle.com>
References: <20250603214813.197346-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH] ASoC: cs48l32: Fix a signedness bug in
 cs48l32_hw_params()
Message-Id: <174947641193.126747.915802797193162530.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 14:40:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 03 Jun 2025 14:48:13 -0700, Harshit Mogalapalli wrote:
> There is a type promotion that can happen when freq(u32) variable is
> comapared with sclk_target(integer), when sclk_target is a negative
> value it promotes to a large postive integer which might not be a
> problem in this particular case as the condition evaluates to false
> when that happens, but bail out early when sclk_target has negative
> error codes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs48l32: Fix a signedness bug in cs48l32_hw_params()
      commit: 22188b9df60dde48eaba276da22062aaf8e12dfe

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

