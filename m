Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8062750FA;
	Mon, 14 Apr 2025 13:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638996; cv=none; b=JMiooa6/i2LAhKJZSIekbvG9H/XwlE8d2fzksYSW62HyEgJn9QyaTQ7bbXv9HzFoZSnYttoidb6u4xAnhN/MpFivsa1qEmMwqIgpzH5iSpnFAKu3CKbrmCV9toIga5DK5vewgQa0e8N18utBt5s0sM59xrpq19ADkurkbuad9T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638996; c=relaxed/simple;
	bh=29CBNrmVgcleWs/1i5/OqniYiRJUuyIR6MeG209LKl4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ffbFfneVVlPEQplebMlHdByfP2Pi0TIDTH2a/VBZocfnNHxgbXGq6DOQ3N3ISci5PwTnz8+QqLipQ4fCdBorTAwi3DpOH+p7RzXvALqAVu+76SvWGOR3TfNsy06YVPem2UbsY3G0yBIpzMHUMStfVhEfHtL3ryys7vNwJ06yaW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dB9UyK6S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dB9UyK6S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C9CC4CEE9;
	Mon, 14 Apr 2025 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744638996;
	bh=29CBNrmVgcleWs/1i5/OqniYiRJUuyIR6MeG209LKl4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dB9UyK6SQsNlLJcabiwyJemljW95vqKAZb2O+9EN0pHJJD4rbL9lQ4Ohw/AfdmmgN
	 CMnJDLQwZpaoY8YuzyQKS2rY6NCLm3dkEyxdKkL87/xntcZLoFiUZ42XgjxPDc/pya
	 q4GaI+GpiTLItc6p744cWrh3e8g939GMhB9+0wPAd4vDR0/qsNfiBbMJczwiwO0E5X
	 9pu5CPEBYpATSg+mXYSodFS8TppSG98JDRpO9gGuKwERLnaRm3L/Mn0l7hkCTlaxDP
	 gIz21jKkd5wmWERLAuw/Q6muYYbq8k7vM/otixiVJRe7nJObgG5h/oiC7oEMdhvqdl
	 /8ofSeiRwUdMA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 Chenyuan Yang <chenyuan0y@gmail.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250406210854.149316-1-chenyuan0y@gmail.com>
References: <20250406210854.149316-1-chenyuan0y@gmail.com>
Subject: Re: [PATCH] ASoC: imx-card: Adjust over allocation of memory in
 imx_card_parse_of()
Message-Id: <174463899312.86688.17897930299767743328.b4-ty@kernel.org>
Date: Mon, 14 Apr 2025 14:56:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sun, 06 Apr 2025 16:08:54 -0500, Chenyuan Yang wrote:
> Incorrect types are used as sizeof() arguments in devm_kcalloc().
> It should be sizeof(dai_link_data) for link_data instead of
> sizeof(snd_soc_dai_link).
> 
> This is found by our static analysis tool.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
      commit: a9a69c3b38c89d7992fb53db4abb19104b531d32

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

