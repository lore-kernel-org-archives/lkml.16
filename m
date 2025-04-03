Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C3D2512D7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743697199; cv=none; b=D+JIzWJfANmFT2K2Xjm9yEYomgdoNdzz0sFmGu2fzeV9vEQw7QHHnMwT+UA2TumpikoRuQLKtC/oMP/GxTfHQFtsUX9gdonPj69+NMNopNzhBSu9pRkdCrRoQwpIb+xwwNMSUEU0n83gFPgRVbOscloT90gIKNAUkwyw+27C2ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743697199; c=relaxed/simple;
	bh=nrJTfauafpSv2Poq9hOWLVq4kSCuHURQcXZ0sblPSak=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HigrQyvD9hNfuUIbkiGPauTHXAyBTAHzwEv37fdMsB441nFfSvEgFa2RGR7Jq8/taA3XQKAbmhbpf9nap8+LJWVI+VPtiAoXVeNiiKcCcVocD6vT4tjAd30/ZCyA/37LYlzyoI6q6SUN5goU4irS8/ygpXsLLyYjY2IOUJhrf7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sl3rTlQV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sl3rTlQV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A1BC4CEE5;
	Thu,  3 Apr 2025 16:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743697199;
	bh=nrJTfauafpSv2Poq9hOWLVq4kSCuHURQcXZ0sblPSak=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sl3rTlQVoLCwgetPGN0AdxcEcbT7hQYCPtpDdNPBCQ/w8AC9dyckACZhZTvnyyaIN
	 CFyyGVQUbgBEYfbTmIfNd85FYmnJWy61WJSeGay6N3YGDz/G8UYsVt19PTYig8RH7A
	 Veo0cBlXmgXjkYw3lxMtp7jQb5yEV9eSZ39goBcLhJ6Ms5h8SVPBJ5eypJVv/n1VND
	 kTgBzmg8vQodF1ee9wXJ5fFn7J+UuwODrXi16slcKYJbd6Jnu0CemWlxdFG0KcU9Md
	 9Q1YEJLR28OW8ZZA37ZVeSevOM4P5k8X/LhRq9kN3GYWxzfEkH+iJ32PnEzrHYsuUa
	 BDQ2qEgQhJ1cA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C0F380664C;
	Thu,  3 Apr 2025 16:20:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv/kexec_file: Handle R_RISCV_64 in purgatory relocator
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174369723623.2563936.6647368095038423635.git-patchwork-notify@kernel.org>
Date: Thu, 03 Apr 2025 16:20:36 +0000
References: <20250326051445.55131-2-ziyao@disroot.org>
In-Reply-To: <20250326051445.55131-2-ziyao@disroot.org>
To: Yao Zi <ziyao@disroot.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 pasha.tatashin@soleen.com, kent.overstreet@linux.dev, petr@tesarici.cz,
 sunying@isrc.iscas.ac.cn, samuel.holland@sifive.com,
 linux-kernel@vger.kernel.org, rabenda.cn@gmail.com

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed, 26 Mar 2025 05:14:46 +0000 you wrote:
> Commit 58ff537109ac ("riscv: Omit optimized string routines when
> using KASAN") introduced calls to EXPORT_SYMBOL() in assembly string
> routines, which result in R_RISCV_64 relocations against
> .export_symbol section. As these rountines are reused by RISC-V
> purgatory and our relocator doesn't recognize these relocations, this
> fails kexec-file-load with dmesg like
> 
> [...]

Here is the summary with links:
  - riscv/kexec_file: Handle R_RISCV_64 in purgatory relocator
    https://git.kernel.org/riscv/c/28093cfef5dd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


