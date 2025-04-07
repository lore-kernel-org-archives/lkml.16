Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0519801;
	Mon,  7 Apr 2025 23:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068936; cv=none; b=SeaUy2+w4cQgHTE/uwNXG6A2ypmM/Je3PNILsUqb26VbABjhmEvmKaQ1tf4wev0f1+LY0BSV2xOcZsswwrRmomUqhWBfYZqLa/hkDRuLYiTLY0y5HCqNvEw9vb18IoHfLOyQkEBl6wjQ+sy21pnqdBA0SZnFfuk0IbvKPRmkxtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068936; c=relaxed/simple;
	bh=7H2QLiiwamtqP+xqCNs8SVpZggnWEBIBrv6ew/pvmi0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K8J+HOEOODhv9wcXrwpIxZSQ622pkNEMvOVFbCz5zdBZJOqW7co9XTHXknjuJCYnpDh37UzM7Pc8U0SGSuYAt3DmHmrWDuvtedl5VFY3h2ojw4cz3s8V4xHX02AQQZtabDubBoqIj70SbHqyCiDm+iOXnmtNvubetOSDEc1b7Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pqgOXCiX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pqgOXCiX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07F1C4CEDD;
	Mon,  7 Apr 2025 23:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744068936;
	bh=7H2QLiiwamtqP+xqCNs8SVpZggnWEBIBrv6ew/pvmi0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pqgOXCiXWy7gfLhhQmVTjby8PJHngfPdr17IKlXdM+HwNuOwAxTHJK5DV8OIyQtbE
	 l+2OT8XuaEEO/PmlUpmM6NiXBZuB4bWwBKTlal+n16A2ecjAvYARxCriGEAuV6FXWV
	 U8oBBERR7XicvaqCnm7EgK8AkNx+SUULvwH/FxQQJUvN3dBXjVEh4gj+tGoc7YYTgs
	 Byli84yo/ev0SK1bVKdiljzxlp5Z/tqI4qWIp8HFphggOX/8StZcxXjM4bgRvZEJpk
	 zlGnUikRvSAy10yD9w4xpa05rreq+YlyHTXEdfxhRc+i970LJTB2rufn7Xbb2gJiYL
	 FfJg+wtlYkqjw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 u.kleine-koenig@pengutronix.de, andy.shevchenko@gmail.com, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250325032226.603963-1-nichen@iscas.ac.cn>
References: <20250325032226.603963-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: sta32x: Remove unnecessary NULL check before
 clk_disable_unprepare()
Message-Id: <174406893443.1337819.17540928973108570629.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:35:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 25 Mar 2025 11:22:26 +0800, Chen Ni wrote:
> clk_disable_unprepare() already checks NULL by using IS_ERR_OR_NULL.
> Remove unneeded NULL check for clk here.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sta32x: Remove unnecessary NULL check before clk_disable_unprepare()
      commit: ea61f39b38bdbb7c77ba2c70e130acdb808c8d68

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

