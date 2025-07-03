Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122E5134CB;
	Thu,  3 Jul 2025 17:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751562631; cv=none; b=hCSbQOIlcBZ5yTRJwnQ2YZrjoGespQ1fnVmLJsgUUVpzbQvdEwEEfuKQaEaET+s2toEnni4Cm31e/ag5n84M//SHNGeRQqolRvqOZQwRrxRyxpXXB7AtkYBNlpxChPjg1LSQdGtMZl2ED5vrK49IxWFyFePSnwUFROP6GXeEF7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751562631; c=relaxed/simple;
	bh=VBNBTHMTAZlDZfjt9bZrrU4QHStDFo99Vh/bJIt/n/s=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bNREYcxXecK+qZ6ADvZpdglAkfe51rRkwFwFV/qnqt74jC18oWO0yEhEkEDSM9QF7z4w27jEPqPsjEX9ceX6O3pA54Umq/seTVDOqosu2JSPY9CokIu4BvQv3K/IfsvQv8tG7rshgkmxR4hryYuNHWg/gY85eFhFszsivsupAwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkVZJJm1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkVZJJm1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDDBC4CEED;
	Thu,  3 Jul 2025 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751562630;
	bh=VBNBTHMTAZlDZfjt9bZrrU4QHStDFo99Vh/bJIt/n/s=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fkVZJJm1iGyGdp1Ja5Tu7Hch65JO16hxP0lASxwcxLGUwtJQu5KhA+/rbghPX8WOd
	 n7HF7bEC35BDP86O+2jDjpro7I1wSGc0l8/kzK2wy2Wp8jyIWDFDNTZHSw9b5iLNcW
	 Yyir5cL8JKJnM6WonM33j4aBQh/yJEW2ZiQV2ybl8LxoLn4vYm2mXZQYHT6Z0vMhsZ
	 BxiIZSdLAnLWt1XC8t/lQzg1aQOHbpv0mR8aP0/jNKauYtj3QPVvTzy1p2CGCjqp74
	 PRciY3DOiw0Lw2YQ0dr8aEsMBosEPslC8LW/bMSi26BkNmP4UeWl3j7o/KyDf+Wffj
	 NsheR+fjLrhCw==
From: Mark Brown <broonie@kernel.org>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 cristian.marussi@arm.com, peng.fan@nxp.com, sudeep.holla@arm.com, 
 arnd@arndb.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250620055229.965942-1-shengjiu.wang@nxp.com>
References: <20250620055229.965942-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl_mqs: support MQS2 on i.MX94 platform
Message-Id: <175156262671.651944.3516186569995786227.b4-ty@kernel.org>
Date: Thu, 03 Jul 2025 18:10:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Fri, 20 Jun 2025 13:52:27 +0800, Shengjiu Wang wrote:
> ASoC: fsl_mqs: support MQS2 on i.MX94 platform
> 
> Shengjiu Wang (2):
>   ASoC: fsl_mqs: Distinguish different modules by system manager indices
>   ASoC: fsl_mqs: rename system manager indices for i.MX95
> 
> include/linux/firmware/imx/sm.h | 20 ++++++++++++++------
>  sound/soc/fsl/fsl_mqs.c         | 11 ++++++++---
>  2 files changed, 22 insertions(+), 9 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_mqs: Distinguish different modules by system manager indices
      commit: 9931d2899eec3737f4e4fa9fc900be7329816e94
[2/2] ASoC: fsl_mqs: rename system manager indices for i.MX95
      commit: baee26a9d6cd3d3c6c3c03c56270aa647a67e4bd

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

