Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87B81B415F;
	Thu, 27 Mar 2025 03:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045859; cv=none; b=sVhWoN5DlmUOVZRSKz2TBQANrAPAwLDwKS+z7lN3VzZYndbHArs4BYJ2Oe78Me3+0osJ4v9Gzm+5V1hckr15K4Ji+CR6BCsJLKwMMyWG6o/tE77kVLwT5HIQUNvnh237r5p1/1ZUpbXIINTTEwuqV+QpA9WLUm5urZ4iDPV/v58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045859; c=relaxed/simple;
	bh=q3uWifr4a1+xayQ552RxBKHFkKXY6qRWxXi9pE7LfJU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YBmgtx/kUvfrSwm8pLwWcStEeDmuxOPF3BozyaEjLrWb0kD05zvX/12f2/nd1NJKRG002BNvd4wlpWa6lFx724Yd/XvXhGlYempRZA7B2qDd+0+NwgqSjbQiw76etQoDM/bl0bfolg2hZByuB68RndTIgaCrCV5snDscNQ2WJpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDsXEgSJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDsXEgSJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246B7C4CEEE;
	Thu, 27 Mar 2025 03:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045859;
	bh=q3uWifr4a1+xayQ552RxBKHFkKXY6qRWxXi9pE7LfJU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PDsXEgSJtwj2Mjih1sDwHOgHBXgkOYVF5IktBUYPID/1O5spP9khhBIse1WWrNRYX
	 ACd4JKcnyVJzlJcfxeSvGiaJkg7qg8OZm23pgLgMPZ2cMacrA2uvjRzUJ5T9IAfMMX
	 L1x10rDBc5YD6M1cW79yqRmqEVYp/DBGPHLkCiWnHeKEcTFyUOzRheqK40Gp0EoZtZ
	 4+/glFMR87VfU2Yvj85UesipsHEkd/Pf/WKTSXfinMwweomFXYfuq7XDIOQFHudwoa
	 IN7/fqY8tS3c5Vck4bm3p+XPCUZwxk57BSFz3BHr5vHkr4XSdkLqVk9T5jj05CK2A2
	 Cjy5KLfcGX6cw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD60380AAFD;
	Thu, 27 Mar 2025 03:24:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/3] riscv: Add bfloat16 instruction support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304589524.1549280.4582301504340621621.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:55 +0000
References: <20241206055829.1059293-1-inochiama@gmail.com>
In-Reply-To: <20241206055829.1059293-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org, unicorn_wang@outlook.com, corbet@lwn.net,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 cleger@rivosinc.com, evan@rivosinc.com, charlie@rivosinc.com,
 ajones@ventanamicro.com, jesse@rivosinc.com, andybnac@gmail.com,
 alexghiti@rivosinc.com, samuel.holland@sifive.com, yongxuan.wang@sifive.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dlan@gentoo.org, looong.bin@gmail.com

Hello:

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Fri,  6 Dec 2024 13:58:26 +0800 you wrote:
> Add description for the BFloat16 precision Floating-Point ISA extension,
> (Zfbfmin, Zvfbfmin, Zvfbfwma). which was ratified in commit 4dc23d62
> ("Added Chapter title to BF16") of the riscv-isa-manual.
> 
> Changed from v2:
> 1. rebase for v6.13-rc1
> 
> [...]

Here is the summary with links:
  - [v3,1/3] dt-bindings: riscv: add bfloat16 ISA extension description
    https://git.kernel.org/riscv/c/35bc1883733c
  - [v3,2/3] riscv: add ISA extension parsing for bfloat16 ISA extension
    (no matching commit)
  - [v3,3/3] riscv: hwprobe: export bfloat16 ISA extension
    https://git.kernel.org/riscv/c/a4863e002cf0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


