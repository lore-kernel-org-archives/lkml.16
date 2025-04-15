Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB51E24BBF5;
	Tue, 15 Apr 2025 20:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744748625; cv=none; b=dVUT7Igia0h4/AJKUxLGJ1nY0k5XZeheGoAt/cUk4z35thzYhvC34V1hsqHWi3WAuYloReZDrZKmb9AcXh1VLFtJbMyM5WRFTZbBYmP9H6ZkzVMOsNqVptTal7pooBR9vv8Q/K81/8T+rl8x42DJn4aQP763Y2lSy0oYiOa/JqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744748625; c=relaxed/simple;
	bh=Gu2/8zpky+e9abFY9Nc6ES9qYPsrHHR3MsHLCN+CrT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QjxF8/hFX0j5MZCm52jOqO5UfplAQSjv0fw2KShsngTLr43XAR+V3eVKkQIbONGa2x5yqZgtXRbRwbHtjskStrAOgpR82yTRDxxV6tH/o1vpErdrMTAWfKdu5Qp5KTLVA9H9bvTPFXFuQvAexWKo6SlVHguNv5re8UzuxwRe3YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vCyTnmKQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vCyTnmKQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F26C4CEE7;
	Tue, 15 Apr 2025 20:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744748625;
	bh=Gu2/8zpky+e9abFY9Nc6ES9qYPsrHHR3MsHLCN+CrT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vCyTnmKQw9m901GD5duZtbVwYSYULCvMt9z+YMtlm4UbzEfK1Bi9ABpJ8pL26lOXz
	 Ng+6rYQ/ZEUpFh9u6PYarsusl0Stlx0VZ4gEvMzLPcx/B18/g63HfMQRmwYQ25o2Zq
	 z0J2qdpdsPeV389fxVgJNiVTgRwCmDe2bsqe4oS/Q2xzofdwaTs9+femBsGdxvFOVP
	 zfmSZw6gMhWqKvp1ePaxLhtYNJ+nt1KPPxgEh0NI8wFlYmICM21x35KPaUhaA8PAxI
	 vdvG3oiKn4xwGk+b0R0YcojsXzZJOG+TTJQHJC/ETweZnPWBbSOOyhvph4pAHmXI1B
	 nnqDHl6NRHrYg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250415131837.568750-1-rf@opensource.cirrus.com>
References: <20250415131837.568750-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs-amp-lib-test: Use flex_array_size()
Message-Id: <174474862416.1097382.16439588843326419651.b4-ty@kernel.org>
Date: Tue, 15 Apr 2025 21:23:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 15 Apr 2025 14:18:37 +0100, Richard Fitzgerald wrote:
> Use flex_array_size() when calculating the number of bytes argument to
> get_random_bytes(). This replaces a calculation based on passing sizeof()
> the expected type of the destination.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs-amp-lib-test: Use flex_array_size()
      commit: 51f04358d8c887c5d117440335c7f94285a403f2

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

