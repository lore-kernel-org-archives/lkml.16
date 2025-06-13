Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400E5372;
	Fri, 13 Jun 2025 16:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749833559; cv=none; b=hi9o9ZV0vHlH+iOot9odUz5Y942HssE1rfcsHkybJ5SnXyg+GwyVtumn4J+i/rdp4sOplnkqFk1ulJddxjpSO8JVuzB0fIiwooxm1WG60GywqX2kTdrkQrGENf1gBI7cf6gQooSRT7HULtZjwqNob2tVAaedXyRtKTg53DRi5zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749833559; c=relaxed/simple;
	bh=4TXdH2chBIzzclR6XBIb/wdafoWaQagzYoJB0R6IAwo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=betXqcXwvvfFGWMpEryY5KoH1pAztO7Gt7pNTLreXiK0noDw40gfTlxcTatxKpcc+mTEjlWuDZoJ8AR1Rl8tE1sDcf82yMxgiY9c/si9/kXHHl9RmFCTZIdpcOlahSGn+3QpMRdH5yhzP/8krx6p4qoQBRuw9ztyoHKbxyZpKoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOlPbD+n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOlPbD+n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C34EC4CEE3;
	Fri, 13 Jun 2025 16:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749833558;
	bh=4TXdH2chBIzzclR6XBIb/wdafoWaQagzYoJB0R6IAwo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GOlPbD+nYlPwcPuKpDzwv3fOjUPo7ZXF8vABXsEIaKGXNQ39gPdQGCQndaxpQZsoO
	 +snF8BqArTfNCk4agMwVpL3/PvTLD+krTpy92hdSaVD31exsL5LKuE40nTbvdMSdXS
	 3nch1oE76LKFNgFO7a+sI/ZCS17H9tIlMvTZEkCxLJPMPqBWSP1Tpqp+HFxW0SH14x
	 6qysAPtjK5UCp4vNBmz93Z86PsYdHehegSlJs8qi9VO7ob1ha6fMps/G2gLZ+pUNAx
	 1ynQmPNba9hLiPmZgQfbMyL8lBW1g8aQwRFGvzlxpGONMdg8mHlP62sS9Ym/8+bfOr
	 XnFx7gFRInJnw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Terry Cheong <htcheong@chromium.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bailideng@google.com, judyhsiao@google.com, yuhsuan@google.com
In-Reply-To: <20250613-hdmi-v1-1-665ba7ecd5e7@chromium.org>
References: <20250613-hdmi-v1-1-665ba7ecd5e7@chromium.org>
Subject: Re: [PATCH] ASoC: hdmi-codec: use SND_JACK_AVOUT as jack status
Message-Id: <174983355678.217351.11777150034827074781.b4-ty@kernel.org>
Date: Fri, 13 Jun 2025 17:52:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 13 Jun 2025 16:51:27 +0800, Terry Cheong wrote:
> Use SND_JACK_AVOUT as the mask to align with hdac_hdmi driver so that we
> can determine HDMI/DP devices from event type.
> 
> Most drivers that uses hdmi-codec driver will not be affected since they
> are creating jacks with SND_JACK_LINEOUT mask. They will still report
> SND_JACK_LINEOUT when the jack status is updated with
> snd_soc_jack_report.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: use SND_JACK_AVOUT as jack status
      commit: 5eb8a0d7733d4cd32a776acf1d1aa1c7c01c8a14

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

