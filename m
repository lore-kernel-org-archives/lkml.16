Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68321E1DF0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045863; cv=none; b=KdqWWMd5Y77eN4A3CM3o+0Ey78qPK0gLCVl6da+heZ3Xrx5MTXsf0wd4KhWvj7i5O0c92TjcHIDR37sC4amt8S39jhtJvaM7+qOSBhAHADddSbRjw6KYmCEd3x8/ntxrfDcXas5zXjudl54Af6BDlHRPyAvl+FPxSMMQZZjrGjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045863; c=relaxed/simple;
	bh=/iy8FtxzbwhjSmkKM7uy8++9qDW5X6I4m1nuk61UM4c=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=e72gTs+00ujPM3iUQtxCrxqs44DvWlaxRSBM6TUVNWgvvZ54rMhuUiSmBu09kjkkoQ9923X50F7QKKqQMP2vRUK5JuDpEnz/+J2DgnAF75VXjfTeBkYPgS0DL1bJ5ZodvK/NXENg7kQ6WGj+wAjWDdr4m2hYRfl43PS8W97RUTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhtRDJkj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhtRDJkj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAF9C4CEE4;
	Thu, 27 Mar 2025 03:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045863;
	bh=/iy8FtxzbwhjSmkKM7uy8++9qDW5X6I4m1nuk61UM4c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FhtRDJkjqxNTQn2pUK6o6ZEpsHnx2XWmufhp7tzLh/PA9OslLxfB/Vl6Xch24xU6L
	 BlCCxLsNBMgmvggt4EvTcUnv3zAGKpTuNPD++cfWrsNU3evMlV0+p85VF3g2lsPtzP
	 1YhxJumOoYkVKJdh83Hl6VazisBf+0SM66Svt7QsUSO4L4Wjb9Be0HT6u+SPpHUF6z
	 Ryvq9eqpA5NK4szG/4dnhpuFpB1zSUtsHl/HRI/RtqpnNyWqYPOamYQQx1iWDeL1LS
	 pb/j1tzk9icfcUu1Yh5+nvi1KX5sAT4JrzVVt4TIn66LmGF/O0LIaGyBNVsKhqju8e
	 R3RzPHA+kb66w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB5C9380AAFD;
	Thu, 27 Mar 2025 03:25:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: fgraph: Fix stack layout to match __arch_ftrace_regs
 argument of ftrace_return_to_handler
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304589950.1549280.17065579246811314249.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:59 +0000
References: <20250311132243.2178271-1-pulehui@huaweicloud.com>
In-Reply-To: <20250311132243.2178271-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 palmer@dabbelt.com, alex@ghiti.fr, mhiramat@kernel.org, rostedt@goodmis.org,
 naresh.kamboju@linaro.org, pulehui@huawei.com

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Tue, 11 Mar 2025 13:22:43 +0000 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> Naresh Kamboju reported a "Bad frame pointer" kernel warning while
> running LTP trace ftrace_stress_test.sh in riscv. We can reproduce the
> same issue with the following command:
> 
> ```
> $ cd /sys/kernel/debug/tracing
> $ echo 'f:myprobe do_nanosleep%return args1=$retval' > dynamic_events
> $ echo 1 > events/fprobes/enable
> $ echo 1 > tracing_on
> $ sleep 1
> ```
> 
> [...]

Here is the summary with links:
  - riscv: fgraph: Fix stack layout to match __arch_ftrace_regs argument of ftrace_return_to_handler
    https://git.kernel.org/riscv/c/67a5ba8f742f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


