Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EEF27BF9B;
	Fri, 11 Apr 2025 05:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744348009; cv=none; b=Lf+i+t2dG7gyh7fO3aTw0OdWBO4hPawjRAHWiWUAon88SFwKMD2yjbgfVyeP4PmfCkv/lxLKcbSk4CErquUqZ+Hp6kU1p7YInHVrYKXqZgHLHGivT1Yfn/czlYmk9a0TBrYVVVrEgiiJm8YiQnDThZFJ+7MvQ0MgaD4KWMSmRUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744348009; c=relaxed/simple;
	bh=JN+0oLpNZwh8pYt/gMxB6bOiwor/JbjH+Git7qIT4ds=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I/ON3lRUMVnSMlqo6/v3r4cY4E5ogxhOseeZaHXh4DhtEhW6f1meA5EejCWBiCzn/bwyzVeGkG3/aQD7S2AqjeeRbvSFia0cEhDXzLhJ56WzrNFqxfHddJnqesWywgBRrVN7eT1citrlgpigQk9I8BIkZ6CvHb0+vuwXA/2E8yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sKtzwDT1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sKtzwDT1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBBFC4CEE2;
	Fri, 11 Apr 2025 05:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744348009;
	bh=JN+0oLpNZwh8pYt/gMxB6bOiwor/JbjH+Git7qIT4ds=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sKtzwDT1F5mJV823npkyRutuya0rd+ZkY/y1G2+bXUNYNm/W5JohHjXkJZINZ5BQi
	 OG8a0yNE1nYuzKYsYLXqisjynwJEsHbp/xi9Z2OUIGH6xR818mhhZD0fwTZmbLN7sV
	 Sk2cUJb/fRd+1PPG0wuKldwj90UBgM5vCleL/ZS+RE5hwgf5iZkS8Q7PKxSWKQOY3b
	 xaobiQ0dePZokLwnv9KWDIJiS4e0INiZxFO31TSk6Ki8rJ59kvK7cjx+1guy6ak3zZ
	 kKkMSN9E6k5i0fBN+S4cfO05A9N7IbEvMkhZBVUGDln6qNmGb5cG3JkPJ757J22tfW
	 EvDztvJQLSxBQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250410101812.1180539-1-rf@opensource.cirrus.com>
References: <20250410101812.1180539-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Use vmemdup_user() instead of
 open-coding
Message-Id: <174434800810.1298095.3518873899579787248.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 06:06:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 10 Apr 2025 11:18:12 +0100, Richard Fitzgerald wrote:
> Use vmemdup_user() to get a copy of the user buffer in wm_coeff_tlv_put().
> 
> Apart from simplifying the code and avoiding open-coding, it means we
> also automatically benefit from any security enhancements in the code
> behind vmemdup_user().
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Use vmemdup_user() instead of open-coding
      commit: b5d057a86e2086af0b1e6d0ca8b306be1c73a627

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

