Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093C1299944;
	Thu, 15 May 2025 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310913; cv=none; b=j1XczbkEW9osus7vFWXcxWMpj8fzXTUPSnqjmdeJCVwc4LA2fjqqDOJLeIgyJvIIa7/B0dMD3vNF2iMtf4Ccb9U4wI0NbosYRg7ZWFf9xdpZZkTQn9X/PrkdTeOxNaLzOUUMn05iXz7mEku3cCD8GQRfE4+biMnO2DUf6p1hpvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310913; c=relaxed/simple;
	bh=PVXmFS9xocJhFw8tMe/ApKjvpnBjGHQjSvNu5PMoN/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AzkSLze4OG9IPZPdkAl12Rmra4YbKCxNAusO50pYnfIwMI8E2xegvIWIBqigU+zUxA/46ppxbVXyZBPVfmBcm5ZFPQbY6ehMN7AMrBoroSq5CYJtvQ5c6sAJ9Gd3QQsvl7zBp6qxsFEVHwno92oP2CE5jsIpATc4JISnqv0sl7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTaucKZk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTaucKZk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4949BC4CEED;
	Thu, 15 May 2025 12:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310912;
	bh=PVXmFS9xocJhFw8tMe/ApKjvpnBjGHQjSvNu5PMoN/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XTaucKZkVkcQ+1EKe1DuB96s4Nb5n8FwTK09wRyNBwH+kLcftkmY0pN09ts7MUU4Z
	 NpxS/0h2BhclAvTDTikztPPKQ73j0Aio4RmP1VQ0kJQhy526cUrU9gplRULzqSg8l9
	 +iNIkYdvTOacijWmUGVqrX2rw9bvGzE8dmOeo2VT9M4OGCUpezfHfByuY33j3vjJoX
	 IznFqFwXz74P2tDvRWoTM4CMv3oCyHLCAxAluGHULQOrNb6gONBHHB7FbtV9ZKAk1n
	 OVBHg0fPhQJfs6wv1pbB0TFoC697VJj94g9btctIFgw/FnQhRs3O0OtQxRHNNTB2Tq
	 czB4MBzD6loHw==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, tiwai@suse.com, devicetree@vger.kernel.org, 
 conor+dt@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, perex@perex.cz, krzk+dt@kernel.org, 
 Zhang Yi <zhangyi@everest-semi.com>
Cc: amadeuszx.slawinski@linux.intel.com, krzk@kernel.org
In-Reply-To: <20250328080319.53734-1-zhangyi@everest-semi.com>
References: <20250328080319.53734-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH v7 0/2] ASoC: codecs: add support for ES8389
Message-Id: <174731090771.350483.11721841609200880780.b4-ty@kernel.org>
Date: Thu, 15 May 2025 14:08:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 28 Mar 2025 16:03:17 +0800, Zhang Yi wrote:
> The driver is for codec ES8389 of everest-semi.
> 
> v7 -> v6:
>           - Modify the order in the Kconfig and Makefile
>           - Remove ES8390 in description of codec driver
>           - Romove unused variable in the codec driver
>           - Modify notation for declaring variables
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: add support for ES8389
      commit: dd4eb861d0521acca1b7e07683a7e90b2e01f66a
[2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
      commit: c8e7d528284a0bb1cd462b994c464bf31d24a0ce

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

