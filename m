Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A332AEED;
	Fri, 16 May 2025 18:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747418943; cv=none; b=ZT0t0LTlQG4iq4POxgZZR4bu6bOAY82Gl7ACzOUof6//cmA/PNTUYZqn/WmZ4HUfxs1kO3dTCGmfTNLxonMZJBrCYI0KrP3JT0LiGydC8szft/yawVFBNXpQSEZwGL/9ECdpoKU0MLYHq1uq1tVc9bLYhBtxM1qP5UOgYChhAaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747418943; c=relaxed/simple;
	bh=b1CY2mAKjx8/A8MQbS9mFdTqZfmhoUC+by+9X6ymOIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PcL3k7fJfKmKe5yPiEa3Czn3iA/bOLwddzpaGVVCyRg9HGghghftBYIXnWjKI419Oq3sH9kuuhUFWKgcPOVw47tl9YTdxVbRs4XQYliR12RFTPO4Zyd1RRvfhE/B63r/Y1O3tLp66jldSXzCAEfHSxsKgP4f6SCZNsDZ7H9qIPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HL7Das7a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HL7Das7a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE31AC4CEEF;
	Fri, 16 May 2025 18:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747418942;
	bh=b1CY2mAKjx8/A8MQbS9mFdTqZfmhoUC+by+9X6ymOIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HL7Das7aMLmX9xrouCm0SYxN5JCpTARIF5lg1N9zKcsD+tVWO1F6Y+bPSIS5NObRQ
	 sFRLxkrKIIUV6KFZmDwAmDvcPsGMLfgW29f1CtXCk3Vg2XDj1SCI3D450jjPgM50Cy
	 +KKVUzjggpW0YcSvXSOrTp9X04RMq5ZCp2pIkGoGR6klt/n0bJZV8mAWo7MaZf7udM
	 Qgy4dqzovhiKHdprBJ2LzVuMEg1bAwXi0TAqPDj1Jo4WpUbKela+8xCzgAoMh6JkdR
	 Qt4+reT9n5cSkgKOdL0tJ5dzTNC46OY46JPuRCWKVJs6DuAc0JCUUFseJXpaH/nHEM
	 7xRiRabtSpObg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <20250516050549.407133-1-wenst@chromium.org>
References: <20250516050549.407133-1-wenst@chromium.org>
Subject: Re: [PATCH] ASoC: soc-utils: Check string pointer validity in
 snd_soc_dlc_is_dummy()
Message-Id: <174741894022.384649.9583972742635774457.b4-ty@kernel.org>
Date: Fri, 16 May 2025 19:09:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 16 May 2025 13:05:48 +0800, Chen-Yu Tsai wrote:
> In the recently added snd_soc_dlc_is_dummy(), the helper uses the .name
> and .dai_name fields without checking their validity.
> 
> For .name, this field is NULL if the component is matched by .of_node
> instead. In fact, only one of these fields may be set. This caused a
> NULL pointer dereference on MediaTek MT8195 and MT8188 platforms with
> the subsequent conversion to snd_soc_dlc_is_dummy() in their machine
> drivers. The codecs are all matches through the device tree, so their
> .name fields are empty.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-utils: Check string pointer validity in snd_soc_dlc_is_dummy()
      commit: 628479afc7a157bca3430a75e759ed06c1a81c66

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

