Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14B222A4F4;
	Mon,  7 Apr 2025 23:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068939; cv=none; b=pf+hI8mLZ50W6Sjv2wXyrkvtDquV3024CqQSmr2MYal+mkRMkOTSBq+xg8qg+0tNTg271DHtWjb3LBiAnFgxSpd8rubakstRz2bZln1+oVxAUkOME1qUzv7X0CDN4YJFppIOGGrj4cZScKg2W+fFQPAZSvB4TqBFyFs/OAooZ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068939; c=relaxed/simple;
	bh=ey3ZWWQUwBjFT6PlnWPEdOonvwkhLxWm2BvUZXqyVl4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZYc23gaNVTYA/pPNY++2QGIJsPgsC6hZGW2oT6N2HlWfY8J2s0UGGPkjkrpJK7BBurfHnPTg3Dj99Q8g7aJKnjmb7/lcM2tzOBS81TdsEkaFpnW/5rvMHjM7gm9jMGnG+zUnonJ2jrvFg5J1bGhrNvqa3iYEcxpAu0O5PfnmrOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nISzhuc5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nISzhuc5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8118C4CEE8;
	Mon,  7 Apr 2025 23:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744068939;
	bh=ey3ZWWQUwBjFT6PlnWPEdOonvwkhLxWm2BvUZXqyVl4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nISzhuc5wT0HPam/o+wlMO9LnXkuKbdpP7FGoZx33WUCKjMkaXLkeKRkoftECL57F
	 87z1Yn0t+nkjHUI0oRLuJDG8Sxw1L93S/zNgdhhDKy51M4ZMMxhl8QFMGAXqee0OeC
	 i5GPwyAEGfNEkQKw3wGaf4lN09GEYXeufEPe2ov8DdSNUrXK1EmpQRy5ztWB8gT3Oc
	 J9yLo73GCpnyHDHUwvj7zBWIbunlhrsqFOBJP7Yn5zgWfkAUCtIi/P22qUMgUerx57
	 kChpRf/VKrbdqrLI3XW7WsNDeqPZCij5xdjkuO7VoC58qxUMQTM4V9HhuFlg0Rn74s
	 ACPz5guilxqPA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, wens@csie.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, 
 ckeepax@opensource.cirrus.com, u.kleine-koenig@baylibre.com, megi@xff.cz, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250325092640.996802-1-nichen@iscas.ac.cn>
References: <20250325092640.996802-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH v2] ASoC: sun8i-codec: Remove unnecessary NULL check
 before clk_prepare_enable/clk_disable_unprepare
Message-Id: <174406893648.1337819.14955796765462981962.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:35:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 25 Mar 2025 17:26:40 +0800, Chen Ni wrote:
> clk_prepare_enable() and clk_disable_unprepare() already checked
> NULL clock parameter.Remove unneeded NULL check for clk here.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sun8i-codec: Remove unnecessary NULL check before clk_prepare_enable/clk_disable_unprepare
      commit: ad20e1f877b6e0c523154d2c6533b836d4d05260

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

