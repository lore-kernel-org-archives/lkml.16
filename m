Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B57C1AE875
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656607; cv=none; b=t3nWKAIdeApHgAIGjs57qZaUoiEuHTWRvcWZDQmnpddu+uj8aOCzita0CfnafH/YYfvkK6LaqRgJuzDxvrVBy5KazNXMozMCEUWA9Am60TP/vrJdV7T8xXpKkThE6GayerlZimkNRHbvLGundqpEvMK2chOTjGwn7QgWVb+gHjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656607; c=relaxed/simple;
	bh=emBOoEWKBN8htRregeLn2eSG23SOh7+dJ1vRBz4wJiM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wlrwp7WQFAbCrgsuy0G/1BNYRT1mzUWa/FsbdgD33XpPG9uwmvO0tOXxNcgdb0R2ofNQRBFe8WD4Ju1YXiCJ0W2pSMIKCpveoGsYlKvZnA+Jh0ZvNdPGKMoDBAJIsBl4LqIwGgJYKXcFSP8VXc5FY63PgzZrAvdx69XY5mn5jT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IeaXe0pZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IeaXe0pZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCC0C4CEE3;
	Wed, 11 Jun 2025 15:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749656606;
	bh=emBOoEWKBN8htRregeLn2eSG23SOh7+dJ1vRBz4wJiM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IeaXe0pZ8C4fNrQe+VNH0FF5VfZqyLQ+Jn2RPG+zFYvAvFHyzw1Y6iw4m2D96IEJA
	 90CicqITmKooIGCA4VUhaRPyQUg6g9t0Qx7GVLU5itOnb01N4yhKOWL5QC+3XbdizM
	 R8KD48APcF0s3hhJpRKYNGaAkq8Afl46izxtBVERBmUNf83LsTAExu9RtyTusCVaC9
	 1VnfuTF3BNh+KEGynUf6xlKRGRzPcFr30alo9uqi9yN6pi2Rh78aoKN8xwha8EGWcZ
	 mFVoo7WAeKaQh3il9E0kG0jI9hLm0PS9VSVN8OBOzPZUmw23YcbuEbXZ3yRxYGWOQS
	 QJ5d2HPYUBZ1Q==
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <a90cb77e66a253f4055bbb99672dc81c7457de66.1749533040.git.mazziesaccount@gmail.com>
References: <a90cb77e66a253f4055bbb99672dc81c7457de66.1749533040.git.mazziesaccount@gmail.com>
Subject: Re: [PATCH] regulator: bd718x7: Clarify comment by moving it
Message-Id: <174965660569.52384.4243364071140563212.b4-ty@kernel.org>
Date: Wed, 11 Jun 2025 16:43:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 10 Jun 2025 08:32:06 +0300, Matti Vaittinen wrote:
> The BD718x7 needs to disable voltage monitoring for a duration of
> certain voltage changes.
> 
> The comment explaining use of msleep(1) instead of a more accurate
> delay(), was placed to a function which disabled the protection. The
> actual sleeping is done in a different place of the code, after the
> voltage has been changed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: bd718x7: Clarify comment by moving it
      commit: 55d9fd9819de09e70401b3b5262ff46d5de951b7

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

