Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32B11D95B3;
	Fri, 11 Apr 2025 13:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378801; cv=none; b=NahpS3mMK+foFGYGgcPm2ivhyeJlqEa+cNT9BcCpiZds6fjMU9xyM1bEb8WmDjw6O+vKzFJx4TCscabdviv1rmzcb0Ip3WUeu9wxkGs6Pb//P20SNnZ3hMlu63JXoffTdd3tpHow+u1gADy54FIs+NjmaNjSc35A8a5mGfmhETI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378801; c=relaxed/simple;
	bh=5jz1qkE/Q8XQMrUn0GNQ78dWw3mtN7ZWkDw+3cClcNw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TxBXs7PdHX3Fiz5Pw3JezVmtRGBhtLS9RbnWYDluHApCOG1G+aTbvRz+i6IRHl93U5JC7d/gt3e8+AnVTPefBEZu6Q2anT91by3f1Sn31skgb/SNys1I++hDIOet4vfSWckRK/IMO97NOsJZ/az303tWAHaHNcaTh/qPoY71Byg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kc1u2MTN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kc1u2MTN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E74C4CEE2;
	Fri, 11 Apr 2025 13:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744378801;
	bh=5jz1qkE/Q8XQMrUn0GNQ78dWw3mtN7ZWkDw+3cClcNw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kc1u2MTNnqVwdU7xx75NS/icTmamaZ5iDsKfeTouFwbnqSNbi6mp7TEgefztuDNNN
	 LJBRafVvZMvE4mvZRgV2m4nsCuDwKdLqWqOoZ9mPiAHFBKpJEPmkzhwosdP9J8yI6S
	 hTQI+ePPn/z3cI7yvcGmsBrciWQ854wHC9pJQyU+COt34pV6AOO/csbFOxuth3oG6c
	 keYG37dudgyZZm2DfNk/jBaBq+TRH6fwOpMSwhaaTFILzTblEFE0hUpPiwQsg/TDm/
	 ZU9NkSmKa6RRDsWEpqjJFSlM3Ynw+J54wXeqxM2m69br5gw1j8KAYSSQWIqXtNsi3r
	 qHFRF5NlDQe+A==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Daniel Baluta <daniel.baluta@gmail.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com
In-Reply-To: <20250410-test-component-tdm-slot-v1-1-9c3a7162fa7a@collabora.com>
References: <20250410-test-component-tdm-slot-v1-1-9c3a7162fa7a@collabora.com>
Subject: Re: [PATCH] ASoC: test-component: add set_tdm_slot stub
 implementation
Message-Id: <174437879941.1666456.2351901600646571889.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 14:39:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 10 Apr 2025 21:25:32 +0200, Nicolas Frattaroli wrote:
> The test-component driver implements various stub callbacks. One
> of the ones it doesn't implement is set_tdm_slot. This has no
> functional impact on whether ASoC core believes test-component to
> do TDM or not, it just means that any TDM configuration can't
> readily be dumped for debugging purposes like it can with the other
> callbacks.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: test-component: add set_tdm_slot stub implementation
      commit: e78e7856d233010e6afef62f15567a8e7777c8bc

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

