Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894452D6635
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749759002; cv=none; b=R++boek+xG+g+f7di5DAOQWBzDSodVqcmq2iOt8xfqzJwhHw8sgRP8c5LQ6dSS19mRpgV7fTiqbd1LWgD6lU+OD94Fk95QGu2XKjzuNck7SzTZAcuyv6TlAj51Fae2RJVKAKezAw+Xe5ZYPZGqVbDUuousDjejv2JNyQcZxdvo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749759002; c=relaxed/simple;
	bh=YOCVmeKBRysiWnBvav6fq3qoxg1Q2XSozX9bayl8u4I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=A9J7dRz8GGTHuJJM0yCZAZekVnsJucS0vVEyWEtvRy/zD5bZBqwv1701s6JAdVdqevsgoVNCrsjXOVvvkWNmSMTy5MBt6os/7EF2WCNZVSxsChpnJkIPDJM+wU5spVZwxgXJrUe+PJx6utG39Bcphs0ZQqdv0kPruRxARiWRlIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PaRAapfY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PaRAapfY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F207C4CEF0;
	Thu, 12 Jun 2025 20:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749759002;
	bh=YOCVmeKBRysiWnBvav6fq3qoxg1Q2XSozX9bayl8u4I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PaRAapfYLHFg16tHym4n460n8XopEwfgvrIklxbgk/lMOS0VILEXPmWFkeTmoHi8s
	 UMTyj53iGtpPhusZb4FA/eRPE2GYCglT0unNOWTU9fQd5JOCk28cmlv+kM4S4T75PB
	 lYud8qLIBFlzuJIhtNNtvFloNc865IgYfLTH/7omqGehxk/QoqRQiYgb/VARdOCeYQ
	 sU8MYDKWxklIGle1FEkcwt5vJb+wA7GhxH1cmsLd/OGLsqg9R00oAoAmqHpjteg8XL
	 OlQhC7Wt0f0LBi8GIa9Ai3kJga2a4TFHR8vjMOQJ7KJj0xexuTZ5ss5TiYdHO3eTlh
	 jp8QQrTq+XNog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B853822D43;
	Thu, 12 Jun 2025 20:10:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] RISC-V: vDSO: Correct inline assembly constraints in
 the
 getrandom syscall wrapper
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174975903199.88969.16808687093175866673.git-patchwork-notify@kernel.org>
Date: Thu, 12 Jun 2025 20:10:31 +0000
References: <20250606092443.73650-2-xry111@xry111.site>
In-Reply-To: <20250606092443.73650-2-xry111@xry111.site>
To: Xi Ruoyao <xry111@xry111.site>
Cc: linux-riscv@lists.infradead.org, alex@ghiti.fr,
 thomas.weissschuh@linutronix.de, nathan@kernel.org, Jason@zx2c4.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, guoren@kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Fri,  6 Jun 2025 17:24:44 +0800 you wrote:
> As recently pointed out by Thomas, if a register is forced for two
> different register variables, among them one is used as "+" (both input
> and output) and another is only used as input, Clang would treat the
> conflicting input parameters as undefined behaviour and optimize away
> the argument assignment.
> 
> Per an example in the GCC documentation, for this purpose we can use "="
> (only output) for the output, and "0" for the input for that we must
> reuse the same register as the output.  And GCC developers have
> confirmed using a simple "r" (that we use for most vDSO implementations)
> instead of "0" is also fine.
> 
> [...]

Here is the summary with links:
  - [v2] RISC-V: vDSO: Correct inline assembly constraints in the getrandom syscall wrapper
    https://git.kernel.org/riscv/c/2b9518684f85

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


