Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246AA2676D6;
	Tue,  8 Apr 2025 09:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104280; cv=none; b=TnH7o+CRLBhhuNywvFdm5WdT+SgElJpufiwo/AN+cduI3+7RxeeuXO0iSeQ7fZy0wouoE/XnWTKSgMWPAZR2MOfQbb+SfAugq7zxbuEFibtyOzuDKxtggiuUaDv4pWCawOu4g6pF+THjYy4qaUdayy7kjXDGdKJQNNyktmko/Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104280; c=relaxed/simple;
	bh=pgxn+Qr+59LGAcFshDjYGkRUmTGaXWwJROyY2EIpnQE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QC9yBiF0c5GvVPBnPoOQsvqiW/wfzN2XjSkGW1nmRCnOzj4kvONaoguiLzs9WRA1Y+w59KG0QQKIgU/jrAeO1uDD829r60Ni74tIZQxOcOcvHCg8wG0NNvi1jI6WQ5qMg1v88WKsppxh5ns1jT9mPTLk/MXRc+yZqAgQRFvZ30A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jr0ZdF6e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jr0ZdF6e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897F9C4CEEA;
	Tue,  8 Apr 2025 09:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744104279;
	bh=pgxn+Qr+59LGAcFshDjYGkRUmTGaXWwJROyY2EIpnQE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Jr0ZdF6eSq54S6kStCd9EwPzSSjgWdr/o91KNkT+eiZet8lhBXk2vaCX+m40blpPb
	 R7/5GmsASveaS7EQBnVR2SNEq8e9ukdSWl8uXQ7A54uWIoqPqW2D8VfgmiMslENQ5x
	 aHZKaKy8eBtB3Gr4rWkMDcuRe+kHg3IhpNOl7uLHoOk49+B9sXyOWKXCsk9HaK/1Wb
	 /pIpY6/sBEig7Jw+VwFvnuUIh2t7FTMg5Hxy/I1lHRpgqlAcROfzcHqS153z8Cqww+
	 rGcKrbYkwjSsCpNgSxe67LjZuOeLdU8UoN49gnMvghNGEvW7es6Inv/ESCmyGhkWIO
	 HROebWaK8i5aA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shenghao-ding@ti.com, colin.i.king@gmail.com, linus.walleij@linaro.org, 
 afd@ti.com, robh@kernel.org, viro@zeniv.linux.org.uk, gehao@kylinos.cn, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250407062352.2771861-1-nichen@iscas.ac.cn>
References: <20250407062352.2771861-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: pcm6240: Remove unnecessary NULL check before
 release_firmware()
Message-Id: <174410427730.1933566.10086456287045169084.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 10:24:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 07 Apr 2025 14:23:52 +0800, Chen Ni wrote:
> release_firmware() checks for NULL pointers internally.
> Remove unneeded NULL check for fmw here.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pcm6240: Remove unnecessary NULL check before release_firmware()
      commit: 4423753a0275c93e381b309b941b4e55a71154c4

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

