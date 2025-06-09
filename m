Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FDE25A331;
	Mon,  9 Jun 2025 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476435; cv=none; b=BZEqxC6dY2WT+MyB8D+oe5jW7Adp926dMnCQHq1PhrV/WedkEcmBew5YX2fcVTNpfiE4Lz7hwyqDdOwxc8zMGr7WNXvkzhz3SqAjRIfQ9oFFRky5feXLCfO0V/OtZL2zfh+3xDy97z9GyQf/wFXWUCBjZgUAqg+lHkzu0D1RGUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476435; c=relaxed/simple;
	bh=WEN6hSLNtEcsEoxQXaPJs4pu6JKGH9Xuw69C9y57tfE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y8hLb1oVZ1zd1EFzIVPZosh/lsY4nEvIxKjZfRzTgr00xucOGbzPaQTgWld7336X1FQS/+5/ku3wAlrW0p6DVO+QtsgpEnOgLHfsptEeFbSxyamN2cELb42rZ5pV/JcFMSr/oJanF9LrvqNX7vSryk0AG8ZHtyRw8U895DMNxYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqPvUWB2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqPvUWB2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3219FC4CEEB;
	Mon,  9 Jun 2025 13:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749476435;
	bh=WEN6hSLNtEcsEoxQXaPJs4pu6JKGH9Xuw69C9y57tfE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cqPvUWB2dELjqH+wR6XFkMF39GPy6Eilf3jyGzzAgTBVndHrmqfZBGbnWu/O+2nBP
	 MDxDJwOUaklQXwyo335M1zqMEjEQ1Md3WklUrVaNWvvyVDtTQQGHWoNjISUh7YG7cO
	 P79rfqkNJqZkzAUqNiyRHaUm0nSalrhrfbwkSHNWebwsge67T0FouINh6/OCXTFcGd
	 RK+4ux1LUF/xblNb615QZyA95MTu+WGb/nVRADEwqTWmbtZiafw7SSWKV56Grs3bDi
	 6e19DheUl4SMUtNgn7M4XghDKGtGc+glxYzBPH9UOLp4X/rZ2TV9kRsUKRXedzAIOJ
	 FYPCjr0uBeR1w==
From: Mark Brown <broonie@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <aDVRLqgJWMxYU03G@stanley.mountain>
References: <aDVRLqgJWMxYU03G@stanley.mountain>
Subject: Re: [PATCH] regulator: max20086: Fix refcount leak in
 max20086_parse_regulators_dt()
Message-Id: <174947643393.126945.18182713164781359832.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 14:40:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 27 May 2025 08:44:14 +0300, Dan Carpenter wrote:
> There is a missing call to of_node_put() if devm_kcalloc() fails.
> Fix this by changing the code to use cleanup.h magic to drop the
> refcount.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: max20086: Fix refcount leak in max20086_parse_regulators_dt()
      commit: 06118ae36855b7d3d22688298e74a766ccf0cb7a

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

