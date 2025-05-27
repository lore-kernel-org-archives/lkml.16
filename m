Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F450248886;
	Tue, 27 May 2025 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748363568; cv=none; b=HkepIb2bBitZ4jomAm1lDGtV1pXHjdXB603TNm4lFJK7Ci3MVQG02VZxbCwqlC3ArTE5RtJgUR9DKiL6Ka77kV8NJm0WBV6porLz250ncq/xXpPN2ijNa2euEZTsXPmlBZkJzCzReLAsF9EAPpjyyh9UElLjx3Iual+JxGQ56yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748363568; c=relaxed/simple;
	bh=ZVXm/cQRgPmvtNwv7BIjBbyhxwseApmwFg3oUawaEz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tV2rY5wjxqDwlXHc4CakMkE6qusCad68PwfFPfuxZqpeUfwhM/giD0N2kcdsvcmzXN1mKUWya5Ofy58Ka+K1zBejtOvQgqjhPvshY8M8xPSKcQM0mIsAjmdjkifL05zKSr5nNqXtnptf7wNO9VuLdHlmECwJqBJXvUCMzMWl3Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jg90TGWr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jg90TGWr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1209AC4CEE9;
	Tue, 27 May 2025 16:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748363567;
	bh=ZVXm/cQRgPmvtNwv7BIjBbyhxwseApmwFg3oUawaEz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Jg90TGWrPXQA8joQ1m4c7eR3VScy3tirvEQY2rWELL9r8hamJ7h2fJfuFFwfl+fgX
	 zP15pVpwjtM9YyskMPQReQ4k/0YcflXAOylnXnZNjtFi+vF1prhL0F55HOcWetHy7b
	 OsXxRDgEDpx2DMlNwF1S/7lpczzZ6ATi/ypm9rne0Oh3oLmcSrwEajftl0P3q0IJ3s
	 uxgMA+TT3IuKjJK4AyGHcO+M9j8Sxq5A42GKfWIz4lALjdNlq3snybKu97+40L9xNw
	 9NVe2eezBqHA4AisZu5GntVyHQOb5juDFSvHE5Z+LjSktNwNaWEnG3zt6+1a7U7eVG
	 qYom8HKfDZBoA==
From: Mark Brown <broonie@kernel.org>
To: Kevin Cernekee <cernekee@chromium.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Bram Vlerick <bram.vlerick@openpixelsystems.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 peter@korsgaard.com
In-Reply-To: <20250527-tas5733-biquad-fix-v1-1-0d3d941700bb@openpixelsystems.org>
References: <20250527-tas5733-biquad-fix-v1-1-0d3d941700bb@openpixelsystems.org>
Subject: Re: [PATCH] ASoC: tas571x: add separate tas5733 controls
Message-Id: <174836356579.104699.8312897041646074055.b4-ty@kernel.org>
Date: Tue, 27 May 2025 17:32:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 27 May 2025 13:08:49 +0200, Bram Vlerick wrote:
> The controls between the tas5717 and tas5733 should not be shared since
> the biquad and register setup is not identical. For example, writing to
> 0x5c on the tas5717 modifies ch2_bq[10] while on the tas5733 this is
> ch1_cross_bq[3].
> 
> see https://www.ti.com/lit/ds/symlink/tas5733l.pdf and
> https://www.ti.com/lit/ds/symlink/tas5717.pdf for more details on the
> register maps.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas571x: add separate tas5733 controls
      commit: e3de7984e45155888eebbca5a32c1cc5f29fa859

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

