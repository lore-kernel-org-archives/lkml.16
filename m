Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D70272E48;
	Mon, 16 Jun 2025 15:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089062; cv=none; b=BbjRZnaMjwQSd6atcyHM2jIVGaerfY1HO74EpzcDLomsB+UvPzHFHnHcCjKUrE/avp/TA3HKcnRc/M9t4wCtQT2z7JMe4pOUDWk5rYihOLy0e775Wk2302W4k5spuhCpKF942304eExNTXe19mPcKN5JQMKqSqYmrLxLHCqJ48o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089062; c=relaxed/simple;
	bh=28vPoRV0MqpgDqKlSqbg3ckxTwcQdUvEgqn/B8VzSz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qnM3nTm39Y737UREHe7Ql3rLT+CM6MhDpXMWkEkys4RMPlwpFuzfXUG7npNy6vMRbmQFtNzYRzvBTZ/COxf2P4EUPF9QodvfCVHPgkYWC7C0k1AzruN1dFPjjrLU3Z6yL586+8e9ge0BkG3otdqQMLQxDEYU5/WqzwqJ44Y+LuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJObnkvj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJObnkvj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC17C4CEED;
	Mon, 16 Jun 2025 15:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750089061;
	bh=28vPoRV0MqpgDqKlSqbg3ckxTwcQdUvEgqn/B8VzSz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DJObnkvj3MXTHhVltXB7GjWTvTuNOuOm6QP+EEp3vDMtIu8rjSHqJ1Xc5/ySvozaQ
	 enZq/1g/UhrINfzMYZWTIO3PeRrUgW0CfTm70BEA3/QvYdisi4ek18n/leuuKGwmIh
	 Sh5i1vzDJQPEI67wBLn7c4UlZHdArJkz4C/N66xZTrZKfYyZ5jYPa9V4GUi1A9CeS4
	 pSW2giY2PcY1wbkVVtRDBsE2/S2xw6vCmLMHeU0CPetkPslS1Da/WqSS2qMZTY8KRv
	 NKEE38k/hjpOxJxM6Za0z5NT16NDyd1lk9ySPfyNhMzfe4yJD86ynDVZlWkoJ3EXWf
	 REyyb20C1TQhw==
From: Mark Brown <broonie@kernel.org>
To: rust-for-linux@vger.kernel.org, Eunsoo Eun <ewhk9887@gmail.com>
Cc: linux-kernel@vger.kernel.org, Eunsoo Eun <naturale@hufs.ac.kr>, 
 Benno Lossin <lossin@kernel.org>
In-Reply-To: <20250614081312.763606-1-ewhk9887@gmail.com>
References: <20250614081312.763606-1-ewhk9887@gmail.com>
Subject: Re: [PATCH 1/2] rust: macros: allow optional trailing comma in
 module!
Message-Id: <175008906033.262451.8015418058709433630.b4-ty@kernel.org>
Date: Mon, 16 Jun 2025 16:51:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-08c49

On Sat, 14 Jun 2025 17:13:09 +0900, Eunsoo Eun wrote:
> Make the `module!` macro syntax more flexible by allowing an optional
> trailing comma after the last field. This makes it consistent with
> Rust’s general syntax patterns where trailing commas are allowed in
> structs, arrays, and other comma-separated lists.
> 
> For example, these are now all valid:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] rust: macros: allow optional trailing comma in module!
      (no commit info)
[1/2] spi: spi-pci1xxxx: Drop MSI-X usage as unsupported by DMA engine
      commit: 9f0ad43b158d07bc7144d219ceabdea36e28e392

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

