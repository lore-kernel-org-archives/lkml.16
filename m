Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D60186A;
	Mon,  9 Jun 2025 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749474019; cv=none; b=eWxWl7hk1JM5k1P2CrOfIn3qo2hADojkSP/0q25UaLhM9euVjvbtr/iKnvJEyfd+RYMV+yY87nZkJA5UzNAsLgO/wEUNv87SZhI+DlX4Znw9VM6QDD4pQhCKrovW30nPOgCfUoiZGMbZvcKGXznSeyJtKqqvrSL1TXrlb7oYLwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749474019; c=relaxed/simple;
	bh=8xqtjXs2JiUMDJaCgvivPvCqJ3nTNZUBs+MImsIrDcw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tv1jhTZba9VRbAbjJEFbGuuJi9GITkqftlTHalPyLNh9TyHPTF7iPDPE2gQzIBocFkDQRjczXBbYLxPpaMX4NxbyNGO0CO28zbcsExkxGwB/vQZHBFP+q2bEjFffB4nnJ6Of2CJxbyZinq5KoKNIxGsPi3T/TPBXRos2qIAp++M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/BCq2SV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/BCq2SV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42ADC4CEF2;
	Mon,  9 Jun 2025 13:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749474016;
	bh=8xqtjXs2JiUMDJaCgvivPvCqJ3nTNZUBs+MImsIrDcw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S/BCq2SV32vpt+T++dWPnCy3OvK2x5PIr9fg94vF0+hnAX92zVDQ5RbDHSEXiZG3/
	 s5CMWCKUxqQLePjmPOPZdsr47VMFX/73cGwM0cj2zEip1hzw9h6I9niKtj2Y+cKfkQ
	 jb+hxz9LW+WbDumbedxkOCpCXgHAE7vyhAstRHrtvu0sQwKXfk0gHgBVrwEFpweiEx
	 EnNNiuug54hZbEEKB5YF/gJyuQ0zMs9Gpy3g9qJrsHgKpMIMGTdWA0/6fyHFM3IbI6
	 jJ/2WudiXklyRr1VoCxciB4jRxzHtCaggzuAZDNlsDQd6JPwrB7emcynkgHixmx9OS
	 w6t/W442C8aGA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <1446fb1938f3f38115be3e53f5dda3c8bb0ba5a1.1748103005.git.christophe.jaillet@wanadoo.fr>
References: <1446fb1938f3f38115be3e53f5dda3c8bb0ba5a1.1748103005.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 1/2] regulator: tps6594-regulator: Constify struct
 tps6594_regulator_irq_type
Message-Id: <174947401467.104992.10674300768376483889.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 14:00:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sat, 24 May 2025 18:10:38 +0200, Christophe JAILLET wrote:
> 'struct tps6594_regulator_irq_type' are not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   25645	  14480	     64	  40189	   9cfd	drivers/regulator/tps6594-regulator.o
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: tps6594-regulator: Constify struct tps6594_regulator_irq_type
      commit: c266209eaef4fef863363557817f7d6a68314321
[2/2] regulator: tps6594-regulator: Remove a useless static qualifier
      commit: 9bb3c7df546aac38ea64c736a839ef2c75297631

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

