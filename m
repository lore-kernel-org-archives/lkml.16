Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C91F1EA7C6
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738850106; cv=none; b=DMvwgENxVUK6qInfu6QJdZq76z7VQokcqVwzhb+fufdOM0r6v9ALAZi6KrhPvh/i5pwiAX3NQOpt+aHVdZyim0vBuN3ikHEgia96pnjNTFTUf/k1yA3jomb7gC28aw8gGMZs1zk4xOeCmUw2N8r9lvB8J2u/5bfUnncLMTMw+6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738850106; c=relaxed/simple;
	bh=IawJxZvxW/xqYSPpSBYaqyExppH6AxE3zLeLOoMEvII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S5jlSNFAmtUP7ZXO62yY5X7PMLpRqtig7XfRAQToN1QDUHaEqrwmqMNOpGMrX9U4/GZ+asC/s52RIrm9ovSAkntkDz0pf21vIwynTJMIyZzyYF+nPwyv+6aa2k3YJg8svO7VdKT9ktEo6MkIZ3RkYyUfl7Ocv3yDhTa+kXg7cLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUt6RviR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUt6RviR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB2DC4CEDF;
	Thu,  6 Feb 2025 13:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738850106;
	bh=IawJxZvxW/xqYSPpSBYaqyExppH6AxE3zLeLOoMEvII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UUt6RviR2tdvjWi5fY1N0xL4RauCMA4cVb99TGFv6Dku8Mw0IKFkLqBgbMC1skSKA
	 GyAyMocLG0XP5Qt98wrrcAVyX/9GrGkrDG8n5NTbkxknvHTI3ajr7yvjr/yhC3Scea
	 Ctq4flkS+QnBUlgFKB0bR4QSE4jTNmMBWJnSy7zCCf9AQd5gWMhG2A43zey8WcPKNW
	 hNI8i7E/t0owOryL2V8zuMj1V1Q0janCQakYDZTCPUqcR5qWv7jBwvN8/M4v8fWHEL
	 d40bgLTr2BwvrmX0AhCEOqAd6iPVsYJE6jGauwHTR8Vv/8zz3FRMavzThE8VqRSGw5
	 FduUHzyYOBrKQ==
From: Mark Brown <broonie@kernel.org>
To: michael.hennerich@analog.com, 
 Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org
In-Reply-To: <20250206103153.59114-1-dheeraj.linuxdev@gmail.com>
References: <20250206103153.59114-1-dheeraj.linuxdev@gmail.com>
Subject: Re: [PATCH drivers-next] regulator: ad5398: Fix incorrect power
 down bit mask
Message-Id: <173885010497.175639.5929120087903015610.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 13:55:04 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Feb 2025 16:01:53 +0530, Dheeraj Reddy Jonnalagadda wrote:
> AD5398_SW_POWER_DOWN was defined with a bit position outside the valid
> range of the device's 16-bit register. The bitwise operation with an
> unsigned short would always evaluate to 0, making the power down check
> ineffective.
> 
> Update AD5398_SW_POWER_DOWN to use a valid bit position within the
> 16-bit range of the register.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: ad5398: Fix incorrect power down bit mask
      commit: 0a7c85b516830c0bb088b0bdb2f2c50c76fc531a

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

