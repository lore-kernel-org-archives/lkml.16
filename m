Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7937927F4F2;
	Tue,  8 Apr 2025 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116551; cv=none; b=iBI1J1uLBNSqS2/dUEli2fmQH0QtfOy4z1jwLeRCZAiMaRfMr68tPJPhbFA+r0yJN2pAujewGXhRPr5pucPkO87toW6pi3gCKh/EP1GOzXL3cBJvTGDc9RkbzLQ9StSYJLYRGZVLojr8iGwmsGcKx2Mp7KqXzbxFUFtFAs73goY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116551; c=relaxed/simple;
	bh=9/ilkshwi9arhxCtnjnCi2pNGbFMJtgNYJiKTM7JeUk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=prdSxCeTLtPsK9OE0gWFQ0X2zQTdTLuBgQbYdLOLu+5174yo141J01k01IvZAhZDGP7l95jGrS69rRUGmIelBGAlTRGAInRLmWLlKKpcu+jCW6DewER11YpZ4H1AJPSCUmwXKma8hLjB7yQsnXFQayDsHbKBFui8z/u0tIi8iS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kx054Gao; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kx054Gao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBA8C4CEE5;
	Tue,  8 Apr 2025 12:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744116550;
	bh=9/ilkshwi9arhxCtnjnCi2pNGbFMJtgNYJiKTM7JeUk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kx054GaoHIfYnqAsheBgR7ZSY0ocnjW5ku6NhG5QFemukZDYAJ49dsjUVkXDTabCO
	 Kj64iBO1zStrM4ZwK0Z9zDGYYFJ5UT9PiIkv2cCpZDDylzjvJuSWU55UreOtS1olFL
	 cIWPSaSLUf6ywbEeF1OlEdn2UsnDnA4RHj8JPbg9L+s22HflMOK0Jpk475ZZuuwPxz
	 IkmNOUArZ0CVHs4rRfZVrWD1HO0keP5m4BnUlKRdGW7Kj7o4sxG5QU6vzSGPLsAglm
	 gr2eqKsfd+EzAVhbwS1g193W8fsZPPp3pXcEd02lRFcPjIWfP01Lk0pYESvcNowp7f
	 xAON9/EGadFiA==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com
In-Reply-To: <20250403160209.21613-1-srinivas.kandagatla@linaro.org>
References: <20250403160209.21613-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 0/2] ASoC: codecs: lpass-wsa: fix VI capture setup.
Message-Id: <174411654906.2091760.2172521809103348942.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 13:49:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 03 Apr 2025 17:02:07 +0100, srinivas.kandagatla@linaro.org wrote:
> This two patches fixes below two issues with the VI setup.
> 
> 1. Only one channel gets enabled on VI feedback patch instead of two
> channels
> 2. recording rate is hardcoded to 8K instead dyamically setting it up.
> 
> Both of these issues are fixed in these patches.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
      commit: d7bff1415e85b889dc8908be6aedba8807ae5e37
[2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels
      commit: 7648beb65600220996ebb2da207610b1ff9b735e

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

