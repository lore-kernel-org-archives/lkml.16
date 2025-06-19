Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2885028DF06;
	Thu, 19 Jun 2025 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356036; cv=none; b=urmQxIN/sAtDAI9qmyNeRISHAcK3fvp/GwSHs80a8I0o/ri5QEhI6/Xqusl4J8BphQKcrs5qql/MgMRc7ups0A5mHMXFGXck+IzZefEMM3A2Ece9OsLKZUVwWys6KCSZeA3TCkCl1RDnNAfSSvg5SSxSB6Ilth0FE5Hc+Hh7QFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356036; c=relaxed/simple;
	bh=O/sgJ5DMqw0a9oBOr7HHivTt3cG4pRfBAotrHBVimfc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m0V1qPmVIhSg01tXzJSouJiQk8fppQPaL++ENQOwz6ONBELITD5zM5PqyBhx6rOg0v5N/QRLedt3t7Uz5TDYKrfBrh1qEodAgjmPYi0XMWPix+PKuOr9V3J6k24AQupgWfR98adg5WPYYdYQKRc9/VfnFewGJ8NPQSdI1p/JR74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ttx32cRP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ttx32cRP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF09EC4CEEA;
	Thu, 19 Jun 2025 18:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750356035;
	bh=O/sgJ5DMqw0a9oBOr7HHivTt3cG4pRfBAotrHBVimfc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ttx32cRP3w7osl7k/CwbICP+rJ6OxedwmzrXHrMVPQNXKGagAIDiGvlolCKt49ETF
	 ZI5OeCU1lN+1H+yvdP0RjirSdK6UituS28Ij4L/Pg+DC5iZI/ihNelpcDkB2bGzH10
	 g/vQS65u7vgTYZWQKPq0y9l/ewd8nKNbQQHAuKRJZEI7jIPnqajLCGzmY4w74KqF35
	 P8rcteyOg8DCJ7fF955X7rXzl/UnKrQuDzloOvVj4hYmuLXwRY9KsxNywviwtYtUgx
	 +k8VRxnkrI3pTyrLDkik0wtt9J36NIQXddVPkYHxt3dVHhrnShMKxDRgQH3UdHxEiq
	 bSKBIhEwM7OoQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250618145547.152814-1-rf@opensource.cirrus.com>
References: <20250618145547.152814-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: doc: cs35l56: Add CS35L63 to the list of
 supported devices
Message-Id: <175035603459.283252.6198544705795058801.b4-ty@kernel.org>
Date: Thu, 19 Jun 2025 19:00:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Wed, 18 Jun 2025 15:55:47 +0100, Richard Fitzgerald wrote:
> Add CS35L63 to the list of parts supported by the cs35l56 driver and
> mention the CS35L63 where the text refers to the supported part numbers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: doc: cs35l56: Add CS35L63 to the list of supported devices
      commit: 6c5b8895c8cab4fdb496b38513ec417588b58596

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

