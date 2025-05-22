Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF093010C;
	Thu, 22 May 2025 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747921069; cv=none; b=KUft6oxESodkucclcLqqTjR8OE7CobniaY8ylMGqtlM+D4Rl17lF4n5cSTf4OMSYSFgyOY+vqTsWHz/MgX2bXHzC8zsECgV09xbu+3xO0pLg2RyeT/eu4iBG9Mj0VAOGwyFa4wKFUf62Hg4RNKOhYZrP/G62l7gagEQMqsJrVnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747921069; c=relaxed/simple;
	bh=O5IayrBokl5BHsWRWLoEYER4M1qM4RaD1n/YXy1JPlo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZbbWQH+UP/YPtWlz/RtwFWR5PnQsaTMcSNTGGlPWTQiHEKM/m4Dwn+fPs6R3UU+3BlP5qHod9gY/V54hjA8szHVwcT/fFU5IPeywfHj6wUWnIVL1wSJBbKSrXMK6G9ZoVSSkuJdgtcKeHoeuYudXVeeSo0AuTkjASuLb/1J666M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufnRlrlI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufnRlrlI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6207CC4CEEB;
	Thu, 22 May 2025 13:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747921069;
	bh=O5IayrBokl5BHsWRWLoEYER4M1qM4RaD1n/YXy1JPlo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ufnRlrlI+WGrlVfJmnUwZzSh4CuegJqXHfUT1UxCSOsPW+KHuf5vk6JL3yWMym/OL
	 VGpTF+amRwiDq+bsXz1lyHhX4UdM4WJX3ZfR4M2z8gOjBxgZQ2k1K1jvorfqor/AHJ
	 Z+1DoXqifVSGmIlQSfzi7KrFLQngM+dSIfklVlopBWL09lfOtQHNp36dLeGDqu6ouO
	 jmd1vbaf+QANWxcSDApMRevDEPL7+LJYWCsUyqQIVee/FFtQbfiANL3jENEmqfD2OK
	 /5pE2ocFwN0A28hYnVnLFeR+RYpkmtunomRGL3oIqKNCIajuGx0nRPVf0haAj5YFsj
	 IYFzflJpzEW4Q==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250522103816.543919-1-rf@opensource.cirrus.com>
References: <20250522103816.543919-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Make cirrus_dir const
Message-Id: <174792106813.84332.11770588156901299671.b4-ty@kernel.org>
Date: Thu, 22 May 2025 14:37:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 22 May 2025 11:38:16 +0100, Richard Fitzgerald wrote:
> The cirrus_dir pointer should be const data but was missing the second
> const needed to achieve this.
> 
> I haven't marked this as a 'Fixes' because it isn't causing any bugs,
> it's only a code improvement.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Make cirrus_dir const
      commit: fd4b6c0fdf71d71f2bbc2f9aceb6f0814b4d93e2

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

