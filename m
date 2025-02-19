Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A20257ACE
	for <linux-kernel@vger.kernel.org>; Wed, 19 Feb 2025 23:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740006496; cv=none; b=KFlHiuP7g/B29Zl/sKa23meO926V5mIyzUh5PguMipxT/WeSZKkAV3dqpz4vXTBzSi6pQWFmWRHGrnzrs5EynZaomFbCFAXNnmxcKYKdGJqzXrhT0ZaYanSaIMwTWvDdY54Pf32p1ha+N+HrFBBwyjG3qcVJgk9YROINtVoyNMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740006496; c=relaxed/simple;
	bh=GKZJK7WiIJ2QEvEmtIG14TY2D1FypXvtO6KV8zDv+WU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rc8sBEt/IIu/zmIO6J3DEZ0HAueZRO43SGBJsvayJnUaqMCzugLYh95ClTAvK4RYlhnqOpv6U9zAtVHZ+RHE+UPpKOKSE7WMurY/hqaVzW6A1vklRZtrQq6tK5jt29SDhAwj6kLt1nF+zuZJIODxXxjn9zAiB8Du/NMcUsvLoQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFYbPFMi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFYbPFMi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD660C4CEE8;
	Wed, 19 Feb 2025 23:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740006496;
	bh=GKZJK7WiIJ2QEvEmtIG14TY2D1FypXvtO6KV8zDv+WU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UFYbPFMiFOqSE/8naPeW55DhBbk3IbChLs/MFqInWDVNFwHXnTYgjxHICVUQbfKWq
	 7en7qZo4SBk70N2dWLI2cRdc7rWoZdAUZmC8q/nO9fL37YMPIirUQ3M/k3tr9ignWL
	 1TtIz1CUsfiddCJgVudWIygbg1VOa17j6z0+RsQt1cAKReaCD+av3gA3vb+BxBMrKN
	 CbYMBs/pcpbDvtSFcd6MSpBu1sfHGpkgvnUoOnYRMFMwKxhbHZ93kAOVLD8kBu9Q72
	 cqBmQ2jIPYjz7mXVKuqZLkkkfHjy2+T9SpQkLPMvh0CD07IWbbZZDKEkKDPQ1mxDUb
	 YFjRt1lLqZupA==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder@fris.de>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Bo Liu <liubo03@inspur.com>, Frank Li <Frank.Li@nxp.com>, 
 Joy Zou <joy.zou@nxp.com>, Marek Vasut <marex@denx.de>, 
 Robin Gong <yibin.gong@nxp.com>
In-Reply-To: <20250219080152.11883-1-frieder@fris.de>
References: <20250219080152.11883-1-frieder@fris.de>
Subject: Re: [PATCH] regulator: pca9450: Remove duplicate code in probe
Message-Id: <174000649345.2064287.5329691521010417254.b4-ty@kernel.org>
Date: Wed, 19 Feb 2025 23:08:13 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-42535

On Wed, 19 Feb 2025 09:01:48 +0100, Frieder Schrempf wrote:
> The SD_VSEL GPIO is fetched twice for no reason. Remove the
> duplicate code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: pca9450: Remove duplicate code in probe
      commit: 66d8e76e8e85a30fbf9809837e07e15a8c5ccb8b

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

