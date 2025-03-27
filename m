Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE861A8F68;
	Thu, 27 Mar 2025 03:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045833; cv=none; b=T4uorVp86KYqzSdC4bpF9bHexT7HItKyDYu6MuEOcPFYQhY9fGaWh8hYFGOsEeHTDD6cNi8DKKpuRyldGtoguTR4ybAWPKiukSIwyFrI75vCxp5U5OR3wiziwAYWYO/qS9U55azRYp47TPaLyHPSbkUBP0LoyKV2l7SjhhIuy9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045833; c=relaxed/simple;
	bh=pCC2sGFvcufaRdmAg8yCIetKAMH3a3vUnBCLsel+L6Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jAnL2p1EfhHOAX6hEsH+gKLbizhsIbu9QORf23h59s2WCqmLei8F1YUOyApJKnP2tIKyPY4M0A/aiX8dK2qcWUHeBxbvAksq4IxxXXrSS4y66FmnCl+TRlEN0udxn9cbBx2qF9sGV77JJrt+ol93p8ew2kYE0DGt2I+OD4kbO2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKD745VX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKD745VX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60A8C4CEDD;
	Thu, 27 Mar 2025 03:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045832;
	bh=pCC2sGFvcufaRdmAg8yCIetKAMH3a3vUnBCLsel+L6Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fKD745VX76VwxxStc0QSSD/7Xyl4djR6b5/7IvZmHkFqBv3tQXcjeflW+qAUminIz
	 RI0hOE5sy9F5CN97/jBF3mBTHWbkB4fdZAyQ2zTpcECLQ2sZFlAwwut3wwFu9xmHg6
	 byUodYbvoKVH8bg8DEkcTcw+VSHvcv3lqK7zT6IsrKd2PWZrq9sFgJ31shS1+JwPmo
	 hInRWDZMRQ+Ow78NBiRtNg6Uc9gtLpcWKNEjde1rmyMmNosnL+5MZgjatgxP4dbe07
	 UzjewMzsLjk7Z/9UyzvMudlWUyizihXHx9sy1cNENRVBRep8ldGsB2BLKQc4ndKWPT
	 YZiwenpyMMoiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B3D380AAFD;
	Thu, 27 Mar 2025 03:24:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/8] riscv: Unaligned access speed probing fixes and
 skipping
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304586925.1549280.17943998836701933910.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:29 +0000
References: <20250304120014.143628-10-ajones@ventanamicro.com>
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 charlie@rivosinc.com, cleger@rivosinc.com, alex@ghiti.fr,
 apatel@ventanamicro.com, corbet@lwn.net

Hello:

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Tue,  4 Mar 2025 13:00:15 +0100 you wrote:
> The first six patches of this series are fixes and cleanups of the
> unaligned access speed probing code. The next patch introduces a
> kernel command line option that allows the probing to be skipped.
> This command line option is a different approach than Jesse's [1].
> [1] takes a cpu-list for a particular speed, supporting heterogeneous
> platforms. With this approach, the kernel command line should only
> be used for homogeneous platforms. [1] also only allowed 'fast' and
> 'slow' to be selected. This parameter also supports 'unsupported',
> which could be useful for testing code paths gated on that. The final
> patch adds the documentation.
> 
> [...]

Here is the summary with links:
  - [v3,1/8] riscv: Annotate unaligned access init functions
    https://git.kernel.org/riscv/c/a00e022be531
  - [v3,2/8] riscv: Fix riscv_online_cpu_vec
    https://git.kernel.org/riscv/c/5af72a818612
  - [v3,3/8] riscv: Fix check_unaligned_access_all_cpus
    https://git.kernel.org/riscv/c/e6d0adf2eb5b
  - [v3,4/8] riscv: Change check_unaligned_access_speed_all_cpus to void
    https://git.kernel.org/riscv/c/813d39baee32
  - [v3,5/8] riscv: Fix set up of cpu hotplug callbacks
    https://git.kernel.org/riscv/c/05ee21f0fcb8
  - [v3,6/8] riscv: Fix set up of vector cpu hotplug callback
    https://git.kernel.org/riscv/c/2744ec472de3
  - [v3,7/8] riscv: Add parameter for skipping access speed tests
    https://git.kernel.org/riscv/c/aecb09e091dc
  - [v3,8/8] Documentation/kernel-parameters: Add riscv unaligned speed parameters
    https://git.kernel.org/riscv/c/9fe58530a8cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


