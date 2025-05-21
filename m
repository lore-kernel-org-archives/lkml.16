Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC4E22D78A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846201; cv=none; b=eiKYdcAVcqqZ+CieSckJvmKFenRdz3yDOiPQuKqe+x6dceRFP449WA/4SnFvaKKE0lKkHJCPiR385jIvecXZkNn2dMBsZVzb9RpGFTe6aJ8dAd97lr0IwMpiu7Bh0JtTX0Yk7DY7bxrN4sm3UfvFo8YdY8Tao9tGjIchQNjIG3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846201; c=relaxed/simple;
	bh=jfvcn/K4gQYN+ImpEF2Wv0awbFKXUU/+YFtQVMqyeCs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ObGbW/fmiaXemKPuR1bpsKaKqaWPjq/UdNOWktistiiC/z0EJADHq8Dp39m3j9++E8Y+Uv44jTWYs6V4MIdZEIDeqiPFBxSf8VvIXDkbRFqqhbpRn06HD+EsD1Y7uq98QOQ4wgDnqZa9Zb4uessMxzqwT3p7nnoi/lKbSsUZTug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkAc4878; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkAc4878"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63187C4CEE4;
	Wed, 21 May 2025 16:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747846199;
	bh=jfvcn/K4gQYN+ImpEF2Wv0awbFKXUU/+YFtQVMqyeCs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KkAc4878J8q9CPNokZbLdRcfsNOHCPJrS4+4wJQBsK+YRYy8GkAwwtd6lXEuofUTh
	 Rux/lSmytuQGBQSgiO6Q5vYCHxXpI/jNbAbxJ+z4+49DfvBAMYlqV8kndR0FwfV8P9
	 ihXrGVUZb457Swe2AGfjg5MI9dX9zRTR5LCIBAxMH1UODJEf/z6SM8xbfnvKvuCfD5
	 7loLVsNuSl7/DrHRXRRoKdSLit3WMALoxROIgtBeNH5HTPywcQ0FrsQLW7nGLruKHZ
	 d3k0nFDmTAtLUp1fgVJ/oC0DoYQlLQQ3wzhfNVX4LWT8YCQN8yO+P0HMaP892uDj0C
	 FNp8sKsBOF6vg==
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20250521135538.1086717-1-andriy.shevchenko@linux.intel.com>
References: <20250521135538.1086717-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] regmap-irq: Use dedicated interrupt wake
 setters
Message-Id: <174784619814.170842.570940341876533568.b4-ty@kernel.org>
Date: Wed, 21 May 2025 17:49:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 21 May 2025 16:55:37 +0300, Andy Shevchenko wrote:
> Use enable_irq_wake() and disable_irq_wake() instead of
> calling low-level irq_set_irq_wake() with a parameter.
> 
> No functional changes.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap-irq: Use dedicated interrupt wake setters
      commit: eb4e0298a05684f88fbd2106fc482f859f804aa6

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

