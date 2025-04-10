Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1202228A3FA;
	Thu, 10 Apr 2025 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292821; cv=none; b=pRs0pTOBLFlgkLwqFn713rC/3DRKvuo/S6iEwLzj9T00Cs+VQGPnZfW4yNFlA5I6NSh9RmCLETROSMXdZoOzHy4LiEI5DQ+t6+mBTIDgdiOcwIstbUZPme5pI827XI/APXQM+pErFaqJicvIgogfUJL5T/gYy+lX+DiY+Pr2uRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292821; c=relaxed/simple;
	bh=ZaBDTF+iRh/90T1kltHyogYykF+sNGQx0AlcBcGZgYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LnqJkcbpnnAmVIGRpoh2o5hmPVPrJ0CB8ECWFjiS5xCkMdvBWa9VzMIItXulbxSXPhnuvYLn8XN7j87CuUMsWy6CXxLqlM6PbFuAHxZ5creDSz41+/4uH28WtVKtVzgtQdbUSQg7YfBm4fCLNIUFOkNjlHoi/wH8eYdyT24I7JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C78XOFZQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C78XOFZQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B0BC4CEE8;
	Thu, 10 Apr 2025 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744292820;
	bh=ZaBDTF+iRh/90T1kltHyogYykF+sNGQx0AlcBcGZgYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=C78XOFZQm7P+OqJSbxbD7Qqr6cDKO/1W7yqHKq9btlAFf7Dxjj3AV4+3yPscm3EDQ
	 x2kn1XngRBK4Huf6o1iS4cx+HoxOvgNxgvDBc/7LaZ5mfXjewnZiVq6HPCHfVGJ+7i
	 F8sg8nCwqjwJ1iRG/gJylCp5C5491Jgoslwic68I4AoB/3RWTBiq5wlag4TZS3kvyU
	 YbfxYRsArnKuSaWXEOIsIBvKt/H1wMzdJValU5xcT37Mhh6/wbhEXY3BvnbiKW4ftU
	 pkBIiIsx3XtRgo09R5fOPCU5UIg55hFcwFAzl2txiN4Bh9sgZo1wJZ0+kfoNXAZ/cl
	 WrF0OJf5Y9xqQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 yesanishhere@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wangweidong.a@awinic.com
Cc: yijiangtao@awinic.com
In-Reply-To: <20250410024953.26565-1-wangweidong.a@awinic.com>
References: <20250410024953.26565-1-wangweidong.a@awinic.com>
Subject: Re: [PATCH V1] ASoC: codecs: Add of_match_table for aw888081
 driver
Message-Id: <174429281889.80887.5322722403791899144.b4-ty@kernel.org>
Date: Thu, 10 Apr 2025 14:46:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 10 Apr 2025 10:49:53 +0800, wangweidong.a@awinic.com wrote:
> Add of_match_table for aw88081 driver to make matching
> between dts and driver more flexible
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Add of_match_table for aw888081 driver
      commit: 6bbb2b1286f437b45ccf4828a537429153cd1096

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

