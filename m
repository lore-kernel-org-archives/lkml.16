Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3F429B77E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022088; cv=none; b=P5eG7gyAA8ieVEYS2/ZS8+TrQ1GD4gheOA/7Zt7kh7nQpxVjz9OJfFHG+B7qLWcX92Z+vQsH+arF+Cewy2pFuz5c66vWoGbxLFy5rQrY033h7TswqZ2VYybJD7Oju2FODJpvETiBXdvnKRUiyGoMn+k0TcLEy7cRFQyJChEJmVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022088; c=relaxed/simple;
	bh=C6v1lQCSgidC4micTxlldqVtpuu54JWSmB/POJWt9gg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LJcpLLPIAaSdFxNLCQrGi0Pbt3nGgEDSfdZwSPJh1be9Na6/Wn01T2NMnCh5rUAd/xEAr/sJkyTqrNpGlDr2KGoI34IHoAoeWN3aB5RkLyj4X02zEulFDSW6QC9oqf5JAqqZ39IBiOXZzy+9AZobuLNajtP55oBg+YhkFXtr7fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rtnd9M4n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rtnd9M4n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C26DC4CEED;
	Fri, 27 Jun 2025 11:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751022087;
	bh=C6v1lQCSgidC4micTxlldqVtpuu54JWSmB/POJWt9gg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rtnd9M4niK5k1NJKoiy2bBryNIl752tAmO45xBga0AIunNwYKNEza7qbHqWFl7r2z
	 l2FnpJvje9Vs4vJslOnAoOfLNFFSwp/0mJWXI5E28ZJvOT0SL0y0R6X9+r4Ek+ZxJd
	 GuLuNxDS3bx1he8AzdT+5h1oojQf16bA4DZdRo4kVz98k8XVYTVxP0aOM5aUJ2xh3E
	 lYUEPLUDi8NNsvCrQ2lyu61Mm8/ZBD83RG0k0W1gR5OAmu3pnkd1saEXX2JV60AOXv
	 UUnUjeM5hFNo+5hmMyiYIoUMWVucbda1VW6RxGcykd+rg9/xrW3vZphoYClvSavxxf
	 JXN5i53F7qrhw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20250626152307.322627-1-andriy.shevchenko@linux.intel.com>
References: <20250626152307.322627-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] regulator: core: Don't use "proxy" headers
Message-Id: <175102208602.386920.5199710724064715688.b4-ty@kernel.org>
Date: Fri, 27 Jun 2025 12:01:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-07fe9

On Thu, 26 Jun 2025 18:23:07 +0300, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
> 
> Note that kernel.h is discouraged to be included as it's written
> at the top of that file.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: core: Don't use "proxy" headers
      commit: ce57bc9771411d6d27f2ca7b40396cbd7d684ba9

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

