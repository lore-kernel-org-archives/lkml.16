Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F298225419;
	Mon,  7 Apr 2025 23:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068953; cv=none; b=t2soUpbv7/3oqwyGtao8e1lf/RKAUh3X+0QnWQKwoo/sQFVnn2NKUbNCvibx8cfg80/3+rfEtFVIFVRWlZ3284mbY42rnoJ0V/G1As8d7XPMavM2dPLYxQDUoxtOqzDer1Hds8/FGjlEYqFu88Kg37g1bUjVyLgN18jfS9A+Xlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068953; c=relaxed/simple;
	bh=yozm9cxGIl6PFv9CscvIteucNBMjmxoNFv8pwsGuMvw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EasIFXBG+AZ/pSJAu6rK2MHNr9XjrJqjZGWqZxazIYGvhTsPw1wP9zTB23KvuUB8pMfe2fFzEwyWxnb8NMF6fwpESB0mk38uq2ZOUzVZ5GCSiBeTeBH1kWoTQlpwIpi2SEU93YUyYydMXRQSP5kGAxrq5ejT3yhHUTZarZPjGZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTeUbRM5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTeUbRM5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05A1C4CEE8;
	Mon,  7 Apr 2025 23:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744068952;
	bh=yozm9cxGIl6PFv9CscvIteucNBMjmxoNFv8pwsGuMvw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XTeUbRM54qVLseBXh4mi3eaqlmrG55xBAoTNDJLlU4m0WKiZC/saQ1no0TyNwiDRV
	 FtrTgW8mKpxrc6oC9fdthkLPpuhBZhIMSwuoJslRqYfEInVUVXe0sG9mdy7rpI0IF2
	 nsRaVdNDNiaZC8tCcKFOIYXzeRPJS3rF+3JYcleKfTktXbB8G69hzWbG1sN8Iawaau
	 waPPsmlYci3wmBG6sKMhUOPAg1ZKIMKLEfYXKVnPOh4pjoU5xYq63R7yrS9jEqmwRi
	 KUDwdOXxgsQfJyxAoQ4NGd7hgnn2Ula+vthncJlkHlpRwTBxubs4ZaSVphFvLTeZPw
	 dYDaJKyzEUAbg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Helen Koike <koike@igalia.com>
Cc: linux-kernel@vger.kernel.org, cezary.rojewski@intel.com, 
 andriy.shevchenko@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 brent.lu@intel.com, kernel-dev@igalia.com, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250403130242.1227770-1-koike@igalia.com>
References: <20250403130242.1227770-1-koike@igalia.com>
Subject: Re: [PATCH] ASoC: Intel: Remove unused
 SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
Message-Id: <174406895051.1337819.12509784076901628972.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:35:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 03 Apr 2025 10:02:42 -0300, Helen Koike wrote:
> This config was used by bxt_da7219_max98357a and kbl_da7219_max98357a,
> both were removed.
> 
> Now it is not used anymore, so remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Remove unused SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
      commit: e0cd450a2d207ce44aa88137a045f2d2a31810c2

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

