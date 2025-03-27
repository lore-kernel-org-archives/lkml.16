Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9991C5F01;
	Thu, 27 Mar 2025 03:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045842; cv=none; b=XOEh155cDOqo0ePLqWe4MnM+klQDFkHmDZAvfAOAhX5aDfYeXTvAB4FbQXFjG0N0GUppyoJ79SVWOuajNLrsHoE/H2GrGYdT9opkAwGXtGRp4Rd/r0JN+KkICA0VjbQS611kA90NV0lZtF1sE9XL0WPQyCAIMnk4egsFG3bCNKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045842; c=relaxed/simple;
	bh=Ws44F1JoDlIWWfehsx7arSbzUCnOt7suxWRpcnXTOTM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=CUxG5832tnJfaeCKE/R72r0YZpL37a2W6WIxLlLW6IUS+uRaxb7jUNWhiWE/yQiRtzXEhdC6y2c2xVoA4DIRWjgYrKwIlfP8u9bmemSSUr0OvrzrClOEwo8L1Ru5//aTohh4L6P86efZOAzpR3kcWFFYODyRBoYsV4vZw7729qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d47S7G2M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d47S7G2M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7346C4AF09;
	Thu, 27 Mar 2025 03:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045841;
	bh=Ws44F1JoDlIWWfehsx7arSbzUCnOt7suxWRpcnXTOTM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=d47S7G2MgUB3TUwgjQGogiSCSvhHSEG3pOlUqIAnlVYfMVrIMmoLfn6CmPInU66i2
	 vJ+uPY8H/FGx+T43GDkyrVb/HXOTMG/+XlbDhXETDtTNVVHnl355TXzpKdZczDyhhJ
	 aHR6IKgvgddwpjEL0Q0Gr9Cl/n7/SNgnd8GEHkPrC31PWoznO41x5IuOoOv/wlJwgA
	 Cm07gCrWKPj4RgWK1O13ecjS8kmFxzrZBlOfvOGP89aThKZ0I2dS0jRmEQ1zTyZhQA
	 7c7RQBkoLCeDtOdXXg75mF0XKdbTm/blnS24qsJI7llhKromsSiItpX5iGf2lIyL/v
	 F5JjP4kIO1OcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FF1380AAFD;
	Thu, 27 Mar 2025 03:24:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/3] riscv: Add bfloat16 instruction support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304587781.1549280.17277808152876197417.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:37 +0000
References: <20250213003849.147358-1-inochiama@gmail.com>
In-Reply-To: <20250213003849.147358-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, cleger@rivosinc.com,
 charlie@rivosinc.com, evan@rivosinc.com, ajones@ventanamicro.com,
 jesse@rivosinc.com, andybnac@gmail.com, alexghiti@rivosinc.com,
 yongxuan.wang@sifive.com, peterlin@andestech.com, samuel.holland@sifive.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dlan@gentoo.org, looong.bin@gmail.com

Hello:

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Thu, 13 Feb 2025 08:38:44 +0800 you wrote:
> Add description for the BFloat16 precision Floating-Point ISA extension,
> (Zfbfmin, Zvfbfmin, Zvfbfwma). which was ratified in commit 4dc23d62
> ("Added Chapter title to BF16") of the riscv-isa-manual.
> 
> Changed from v3:
> 1. rebase for v6.14-rc1
> 2. patch2: add validate for zfbfmin, zvfbfmin, zvfbfwma
> 3. patch2: apply Clément's tag
> 
> [...]

Here is the summary with links:
  - [v4,1/3] dt-bindings: riscv: add bfloat16 ISA extension description
    https://git.kernel.org/riscv/c/35bc1883733c
  - [v4,2/3] riscv: add ISA extension parsing for bfloat16 ISA extension
    https://git.kernel.org/riscv/c/e186c28dda11
  - [v4,3/3] riscv: hwprobe: export bfloat16 ISA extension
    https://git.kernel.org/riscv/c/a4863e002cf0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


