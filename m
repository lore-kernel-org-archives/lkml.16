Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1F81DE2C9;
	Mon,  9 Jun 2025 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749474015; cv=none; b=qfly5p7hCp9Tdmn8RCXlXKBOpeSAezKJgci8t0p8PnrN9jcM6MZnvdV3NK38nSB/Q3LheUqcdnNSNWCD0+YLANMK1jYwetZraMrYZwbJVKQLA/poGshu8JA9oFmcpy3pGJVrS3NusEEw4eoUvkIshHkZ3x5/0GJ/STZUP1g/7P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749474015; c=relaxed/simple;
	bh=uZu4MlTEk19j76jtASaux4LQyGoIlcgCq0Q/BRqX6DY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cgexTDEVyvzFkeljKFzDYTLo9gr2MJMCeMVFyR7Fmw5GCLdYsoDV4/a/yinYfL28yl8YoIvhR6+wc1DdGCDCc4rLBnYEL2KQnS0LTHtm2wnUv4VYebuTPtt49j/9hQJ8Y1Ls/FdoBT+/7DdsKxzbjvQlPCPCKu6j284P8wt0IYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DelpOASf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DelpOASf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E9AC4CEEB;
	Mon,  9 Jun 2025 13:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749474014;
	bh=uZu4MlTEk19j76jtASaux4LQyGoIlcgCq0Q/BRqX6DY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DelpOASfXsMdTZG3nAtazRd9UmC/qU+c+zqlcgWZeycLhk/Vo/KA49AdGcxLf4jjM
	 o6hIkWEQY92+w/Yr2kU1OIIXeMhLXaf7HRIZdt4r6JvzEm/ZWfpeTiQ4PJLdOBhZQf
	 XfiM9Sa95Y35W+k8MSTvYlwDw6MBg5By4/X/VISNV/ovjDFBR+LI+6vXPBRJ5XaQPB
	 ihkIaopWcyeZSnL1Z1VJktDV27WJLihVSs9F6EZsf4u+OuuiLI/M1ko/lqhsCmqUA1
	 D9YQ/OnAZO4X76YSpdPdgzSwoj17ITha9AMYp9THSQ4yDq5Loq3+7SCMeAbvAaXKye
	 fwwJiYnBxsa8A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>, 
 Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250525071823.819342-1-martijn.de.gouw@prodrive-technologies.com>
References: <20250525071823.819342-1-martijn.de.gouw@prodrive-technologies.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: add pca9450: Add
 regulator-allowed-modes
Message-Id: <174947401268.104992.17242457164735385104.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 14:00:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sun, 25 May 2025 09:18:20 +0200, Martijn de Gouw wrote:
> Make the PWM mode on the buck controllers configurable from devicetree.
> Some boards require forced PWM mode to keep the supply ripple within
> acceptable limits under light load conditions.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] dt-bindings: regulator: add pca9450: Add regulator-allowed-modes
      commit: d7181a2d43cffb19f1e5c19f6d2328f190c87d70
[2/2] regulator: pca9450: Add support for mode operations
      commit: 548d770c330cd1027549947a6ea899c56b5bc4e4

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

