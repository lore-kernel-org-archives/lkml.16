Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEBB1FBE8B;
	Thu, 19 Jun 2025 22:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750372628; cv=none; b=H4EhjrmM9Afs6Rn3GSH4R04z6BEv7jf9GoMBC0BUI6KynE5eQlDnuQwciOONFMUNLTz52Cvo5TAVefZ6wMm2GGaV8GqaK7cRSf78Ik4dmxLlpR6vLojKRXgBi4Fl4xpz11NyNFTxgchvPwwZuyXyskVtcUZux1hXzhsN7GTJkPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750372628; c=relaxed/simple;
	bh=39JAU3gIUJNw4/Obnh4uj/czS3LYI4EoxVitgjt6v44=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=epM+JNKFQPyg21RUPAewfK6xYL1GMe4/vFYNLOQuroGELL0DbryIHWDmm6w4xV3Td/hSm13DNIGXmqgo1Y1cW5Y+7cpdhnM+nTrvpLtuZpfnpDESQdmQgv1dVIkKlP8oR1HoWEW48WH3PoHLifRdCtneN3bu8Z+4T3XZ6zV8eiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ae+jEnV8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ae+jEnV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7089DC4CEEA;
	Thu, 19 Jun 2025 22:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750372628;
	bh=39JAU3gIUJNw4/Obnh4uj/czS3LYI4EoxVitgjt6v44=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ae+jEnV8JA4rtMN4v7/sr9DR3/lCtpRLZ5TNL4uuIoNdwkHqfJMCp6PX7hTWHPfb/
	 dXZe75UoKPdKjkgZba617W9de55LNBqNONzVTlc/A7alNatJh+rlHPEVWb5k/Z+y7N
	 MWZp2nKwf4v4C2wfckfcJ0aZMFLZUl6TD47T5IpgT8UG7eCzVl+Wy/A8/hJ8wwSLOa
	 ESfu9ct9Lx60KLKqoay6/6Cr8i7/5JIs7lycKWsxhuHe5GAoKsVvyRCQQkU1Wtn4S4
	 679GBe1HW10ceqRiV2AgtP2bVnchvrzw5/XoJew1muvpm+gCF8jVKs5F4XpXnMdrV7
	 bLsTfvSBHXtNA==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250617144619.1130857-1-laurentiumihalcea111@gmail.com>
References: <20250617144619.1130857-1-laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: cirrus,cs42xx8: add 'port' property
Message-Id: <175037262617.685177.1653253017123895737.b4-ty@kernel.org>
Date: Thu, 19 Jun 2025 23:37:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Tue, 17 Jun 2025 10:46:19 -0400, Laurentiu Mihalcea wrote:
> The cs42xx8 codecs may be used with audio graph card and thus may require
> an additional property: 'port'. Add it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: cirrus,cs42xx8: add 'port' property
      commit: 7f8924e8785b68c998bc1906e049bf5595865e60

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

