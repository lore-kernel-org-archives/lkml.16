Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C4D1A239D
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839842; cv=none; b=sFmeJ2FYJrjY7GX1waK6IZw81NktXirpA8vxzrXUaOZkXSryJnjTFlIYUPZTfOGji/EAeplPfnxWdBW6jksslq5xQP+a4DbdltVFaaMk9PklwcJL1tnYSV1ZRDeXgyHuFLOiHsHzex6EZr78mHp/HRG7hRv+Rd9++91Uu/pxFDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839842; c=relaxed/simple;
	bh=NnaUo4mbXvzB8FHJAqWb6GmvUrkWOrwe9779aVdOjU8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d+LgRIm/2SueYAx5jpYzop4JuRLSzhVb26wE7Z9204moniw6x5U3Y5ba6WWhj74rEm0fyJ4iJNIDXGOrMAXWafLwo3r7osbU8e+mMjQuhwCUM0/ove4B1ar94teN+304+hY+7rHau1FKSSPvgEkbc7stjrxcS/mS2rgHYZzA3Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fu/+YH4V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fu/+YH4V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17929C4CEE4;
	Wed, 21 May 2025 15:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747839841;
	bh=NnaUo4mbXvzB8FHJAqWb6GmvUrkWOrwe9779aVdOjU8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fu/+YH4VlCM8dJK8e439HZfVL/bRkNDvCCAA9zd+91R1Ckqmj1ISpfaDOUMhYL+z3
	 SDbTYIKbDvJn0lhq4Ygahs9ELDTkjthQAkcN1mGVoNDct/qzN5Paocz+iSptUjxSJO
	 C+KQrBAs26nuYFqc6WiIFK23QEas6gaibypXcIleLNMCoaKL8HIjOsYfHEMavrLdW9
	 t5t3s0m1fbZeSE4RfWoP1X5aWtb50XlGn0bM9t7AwU4AK0h2gm+FvILAq9YwGx9uE/
	 GzpM/qTZtP0CJjX5FZqKKSFfmRaX+aHy4uueEotsIufyX3KDFF8dLwxOZbODixRMnV
	 Xbw/Pi6hWW+NQ==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Andrew Davis <afd@ti.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250516141722.13772-1-afd@ti.com>
References: <20250516141722.13772-1-afd@ti.com>
Subject: Re: [PATCH RFC] regmap: Move selecting for REGMAP_MDIO and
 REGMAP_IRQ
Message-Id: <174783984081.142672.7241684186760587263.b4-ty@kernel.org>
Date: Wed, 21 May 2025 16:04:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 16 May 2025 09:17:22 -0500, Andrew Davis wrote:
> If either REGMAP_IRQ or REGMAP_MDIO are set then REGMAP is also set.
> This then enables the selecting of IRQ_DOMAIN or MDIO_BUS from REGMAP
> based on the above two symbols respectively. This makes it very easy
> to end up with "circular dependencies".
> 
> Instead select the IRQ_DOMAIN or MDIO_BUS from the symbols that make
> use of them. This is almost equivalent to before but makes it less
> likely to end up with false circular dependency detections.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap: Move selecting for REGMAP_MDIO and REGMAP_IRQ
      commit: c5a219395b4e6312102a505bfe73aac8f8bada8c

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

