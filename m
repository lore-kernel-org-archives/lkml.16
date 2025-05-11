Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C00AEEA8;
	Sun, 11 May 2025 01:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746928497; cv=none; b=iO4K+ScDWYOBYzRm0lyHSGGGR97uyhcp6zfn7ij5jrr3+STTyoUObInANfTmclI2j7PzJwDvopVYdeptOsKURQZUB8RkcJYI0l2qS8xc5S5wDSvQhJkPfwdiCS15V5N/kUhZrSQbkqvKIuO1Ffqd8oKf2e2SjoBvCbUMEqFUy9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746928497; c=relaxed/simple;
	bh=8YytFU4uQiyuY7JM+uMHnHtT1fzQtqRL8205N8QruuA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OamW3gKbgY47x8G/A3upfvqYj1IdCfo4OMCqNWHmDTon+ENAaXoUU/5Xv4bOHK/KhEKJeggvqQua/huMWs12Kc1+6yK46UKfTaRhW/Csw6RmNduAN+3bub0RmJbxAv23qAU/HuoZEqFF9w7jTiflAbcC6r5iMq1tyQK6V7iYrtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZeN8YQxG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZeN8YQxG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29020C4CEE2;
	Sun, 11 May 2025 01:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746928496;
	bh=8YytFU4uQiyuY7JM+uMHnHtT1fzQtqRL8205N8QruuA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ZeN8YQxG3gxC5+AQDelL8F3QKALlFm32st5qp9we+RBTJfnIVW3f245aUQdzd3x89
	 VWo79ay8Def62RdmImND8uqEuufca4SwIKhB+3HSTkI1SLpZGPWJI7l12kF4YyN96e
	 cQMO5HxHAJHdnt/kMdi2NCL5Yhuxa5nLrZTJjSho++av+CMyrSN6lzjH9oyVJQiTOa
	 AibEpOf0zH/jmUzVRRz5VouduoNELXrKGNchpHyk+stEZPTnQTLS13UQQXj3lpltUm
	 HB5q+S/J7KvhevsPCXpk40cRpzc9U8F2KnWm2n7BqfMn86pdyZi5Y88JZ0o8I1Rd8D
	 EXAF8x2sQFi/Q==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250509142448.257199-2-krzysztof.kozlowski@linaro.org>
References: <20250509142448.257199-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] regulator: da9121: Fix Wvoid-pointer-to-enum-cast
 warning
Message-Id: <174692849329.61218.3724088610251570929.b4-ty@kernel.org>
Date: Sun, 11 May 2025 10:54:53 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 09 May 2025 16:24:49 +0200, Krzysztof Kozlowski wrote:
> 'subvariant_id' is an enum, thus cast of pointer on 64-bit compile test
> with clang and W=1 causes:
> 
>   da9121-regulator.c:1132:24: error: cast to smaller integer type 'enum da9121_subvariant' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: da9121: Fix Wvoid-pointer-to-enum-cast warning
      commit: d5cc09847fa0df4034076f884de5957ec816dc52

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

