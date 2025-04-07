Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CEC22A81D;
	Mon,  7 Apr 2025 23:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068942; cv=none; b=mtypMinS6DEeclPtq4vqzGQTWrLBT/iRmvPxpC8rBV1T8kPM1TAUfVbDRIZQP+LY/iumUBz8ZWEw1n7vLDOBYCkt+PKqB6LvXPwHl8xFk/P6lOebFfOhjzc2CZVykr8hpWuW3O+UGmiOZNrJ5QgMDbDLERJmgmdNtbsQlUTmuX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068942; c=relaxed/simple;
	bh=e+HM94IPBQYv6u5suPGlO/2Wg6Zb7Nt7anXkVDV3E2A=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l9IiS8fQczuyj3oWlvK78XiuKjmmO1Zg8WLttnxZRdTFikmoV/bHRlwXZm5gQHfIOeDrKRzwpghXbtDlbuVQf/bwbjMAWxy33Wa1V6GJFXenym0rlo5bW+7FKOGnWjf2X7vqjTXCZh2SF1G0cMVJcbbI7DHxr0YFR6GTVcEOxag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZdh8IX6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZdh8IX6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDBE4C4CEEA;
	Mon,  7 Apr 2025 23:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744068941;
	bh=e+HM94IPBQYv6u5suPGlO/2Wg6Zb7Nt7anXkVDV3E2A=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=hZdh8IX6D1mZh1KOSyRjP+Af0ODmT3E3MkW2zPgWzUqpsF6/PjUhvX7OTnJCG0AWB
	 MUv8XukzzApmvAl+rI1iWofhJJTh2cxb8PRr4/cFdFT4HhV2BeCmY10IsysF8/9z+n
	 YGwFQZa8m2bCoypd5wXEX+Yxn8Hfjgb847LFS+Lf+MwWEkxGaXcyOnV28bAQ/Lk7W9
	 f2sOvzhQN6atRSomYQcw4AIGTDPfYXAuTNFE881Gr3nikwecM8EFPxAhGZLqkJ+FDJ
	 6HnEjgXT7dLOEKOPhULGa8AI5wPvf4BxH1xXSInvS370mZ/yIi8HJp9gyXTs5CCFxY
	 +o+RP+KfnO51A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ryan Lee <ryans.lee@maximintegrated.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250324125131.81867-1-krzysztof.kozlowski@linaro.org>
References: <20250324125131.81867-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: maxim,max98925: Fix include
 placement in DTS example
Message-Id: <174406893953.1337819.16457348923455497926.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:35:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 24 Mar 2025 13:51:31 +0100, Krzysztof Kozlowski wrote:
> Coding style and common logic dictates that headers should not be
> included in device nodes.  No functional impact.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: maxim,max98925: Fix include placement in DTS example
      commit: d1ecbcc3d82d65655685d3a05b3faf79e836d94a

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

