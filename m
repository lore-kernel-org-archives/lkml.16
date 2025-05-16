Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6209253B42;
	Fri, 16 May 2025 18:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747418940; cv=none; b=NcvuibjmyOSHhcq2eCmGcyhVcGerUBKGDXNTYoLzkqup69ZVODBN1ANE3VUBuhVZmZydey+3vTurhIwPcmVE05ZZ6gkHHYmQgS/uhnPmxZzJE74t3qdt8jk4VzMx0PSOQpWZupcA1Hag/hoUYvHJj148uAZESwzr5lq9TBGFq3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747418940; c=relaxed/simple;
	bh=nIzQCir6ILa7ha3r8U4meO+bdj9K3CMQGPn7EESq2Ek=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=caqj8XVvBSPtu4Lb37w3JwG8vuhzlwiyySl9VGmRnPpNu3gR+yiY2bebJfjMwhfYR6P2Mi0xnvh49pDkgKl43wsg+XCmSolx3jO7fw1YKA/bDMxs5tZmvqTm4roNS9NlKAjHUHYMoyUKwXIOvdbJqMZX8tEtvX4/AzI6Mjbt77Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CU4i+upl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CU4i+upl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1890C4CEE4;
	Fri, 16 May 2025 18:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747418940;
	bh=nIzQCir6ILa7ha3r8U4meO+bdj9K3CMQGPn7EESq2Ek=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=CU4i+upleR6/sspOqSCiXt3HTvOsaQySBAlmLE+RoZuoxxOtqtF2+jZnT10uE1CVU
	 P9hYsoeAgJSNFLWoP7xt4gChAxSy1m77Y4/lsnDda7ldgS4kHU2YE09SOa+UHaB+Uy
	 9BrLSUZfvgosbmGB51lx6/hglQun+UF8haRZikG8/OWoZjHYQVmceAWKGYH+SuB7Y+
	 PMZKrRXqsU9UjSyzhWasAfdKpeIxnTBU7WhTM4TxsyC6oUV/aQYyxnw9wPyxETrQlW
	 f+Jpqe4CL0p3zijMhRB1ACNrHKry1Svhub+uviL0RpsknogRILnxuJpApqQkulkAwA
	 j/UsxpO+foLMg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 mario.limonciello@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Talhah Peerbhai <talhah.peerbhai@gmail.com>
In-Reply-To: <20250515222741.144616-1-talhah.peerbhai@gmail.com>
References: <20250515222741.144616-1-talhah.peerbhai@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add quirk for Lenovo Yoga Pro 7 14ASP9
Message-Id: <174741893817.384649.2381968008958380317.b4-ty@kernel.org>
Date: Fri, 16 May 2025 19:08:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 16 May 2025 01:27:41 +0300, Talhah Peerbhai wrote:
> Similar to many other Lenovo models with AMD chips, the Lenovo
> Yoga Pro 7 14ASP9 (product name 83HN) requires a specific quirk
> to ensure internal mic detection. This patch adds a quirk fixing this.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add quirk for Lenovo Yoga Pro 7 14ASP9
      commit: a28206060dc5848a1a2a15b7f6ac6223d869084d

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

