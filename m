Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FA938DD1;
	Fri, 25 Apr 2025 12:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583443; cv=none; b=tQLXQTQI1w0pfPbnOoF+o7uYwP+8cqIbQTPqo60riLqk0ovHxLW24Yfr1fEa7a5TWj+qaz7aWSaxbqyToNc5GJ0cpjEgnc2IaITLYw9i96/2gO57PHR4G3AFneIpuDFTOcajvzn5QhVhbWx+tqCg07T9/GxzY3kqtZ9txceT2uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583443; c=relaxed/simple;
	bh=UFT7CStYb87c3Y9UGfHbLV1DPiFbWpt3YQljKbvqDbM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EyLZ6UQ5XcFlrUXP1XSWi9yG20xkC249b/RrY6TRDCFJweOZYUWPRRUMcEqmd1VvhS7HM1y1SwGekv8LuQLOc/yj4vJz81iFcaSEfPKf8a7y3/uNyzIVQX5G44t/Nx4R8r/P3I1miaaqrECw85QRqNG+2GvyZs1njWUSWKTPhlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pc1AcPCV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pc1AcPCV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43257C4CEE4;
	Fri, 25 Apr 2025 12:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745583443;
	bh=UFT7CStYb87c3Y9UGfHbLV1DPiFbWpt3YQljKbvqDbM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pc1AcPCVpt5M+sVJVruVIC2DJFvltVMlk+nY944VRO4GuIlPGIgCHgvFDLtC8IurA
	 6le8xweHOOUwmt0NEB3YuSKz6hiqFXWed9EnD3GsBJg2VGIOic9oQOy1HrNgOTRrla
	 WBOspr3GxTVum0DBi+838D6g9GCMKdpIPb83UVBj8jYoHDPmaWyDLyGDUesrT9tHaE
	 tosC4wAsyXkEJIwupfio7jsBSCYlJiy3VJDI+e/gqLv+tI850GK+12Ai+KUEwujz9E
	 riKOIhM3WxDB/H7/Its7dOA/3DZppydlysvI+t8M4cV9YeDV6daV+sPl6BmiLJirIj
	 1jKtUVjou8xDg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250423192714.22158-1-rf@opensource.cirrus.com>
References: <20250423192714.22158-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] MAINTAINERS: ASoC: Simplify references to Cirrus Logic
 include files
Message-Id: <174558344197.35587.3245868105076441036.b4-ty@kernel.org>
Date: Fri, 25 Apr 2025 13:17:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 23 Apr 2025 20:27:13 +0100, Richard Fitzgerald wrote:
> Change the references to Cirrus Logic files under include/sound to be a
> wildcard of all cs* and use X: to exclude the three cs* files that are not
> related to ASoC.
> 
> This means that new Cirrus Logic files added to include/sound will be
> picked up automatically as an ASoC file without any changes to MAINTAINERS.
> New files are most likely to be for ASoC drivers now.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: ASoC: Simplify references to Cirrus Logic include files
      commit: cce73cf7cc56a04cf0dd1e1f93b4002c00751ebe

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

