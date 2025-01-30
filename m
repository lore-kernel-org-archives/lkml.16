Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0175C1E7C2B
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738246217; cv=none; b=hxn4Qc06nkiMqLFfGb51d+2Zkwa8NrlPwrvqkJfUZAuT3omFNHLKVg6R33Sda+AKogWA3idTry1EGxh5Vgm13z2BpI1/RB4tikPyK3xtKLMgUDFTYKzb0kxO/ktlDWiFmVlEMfZ6G5xWvIyVJmQR+/Eoooe9ryeTAGjZLXT8BF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738246217; c=relaxed/simple;
	bh=CbMMJF1uQMgPSz1soY9p3lNPl/Y6u9Wb56FJLQKyfSo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=t4Af3jB1G5GrKihq22e6ntCw2znWDWyhagjOmmXQLl+6eyVhx2dBo3iFxev8SGO71uQFHpGIxTJOWpXmwceTSI7BqD5M6GvOGp4KuLZqT+aV8Iox8M+q6e1UZHYxEYt3quyduRXF3FmiF70gfy1g1cFDnptGIRyxsZ5UE/XZGk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwVDph6H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwVDph6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83485C4CED2;
	Thu, 30 Jan 2025 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738246216;
	bh=CbMMJF1uQMgPSz1soY9p3lNPl/Y6u9Wb56FJLQKyfSo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QwVDph6HjKDRoF7VVkblK2s4GXMm7YUaZyR2O+5ZDZSY8UFdaws5nM6s4tKUlljOd
	 u0AVW43U64Rh+kxwkMZyjbpYbg6bPxkXHafV/3Bykl/i0Q/BGwJLPKiPhzVy3IbEtg
	 Y8MGnjeqmoUsFF9SRVM2lfRmUzcuqdLOpO6cuK+mihuVO/ihUc5XpeNFAzcIgn9/OR
	 fdgUt/LiNxN2dKLao4zEQj204vp0i4x4Oq2o3Z7zRZRLXgwmHksVkniCWX1biku70h
	 LWgNGPpggnY2vUrcJZNVPlF6uDJO5wkrX1QcjIT+K2jggCBNUYlmayzaDvQ8oEQv6G
	 8PES+PGMogm0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBB7A380AA66;
	Thu, 30 Jan 2025 14:10:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv/futex: Optimize atomic cmpxchg
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173824624249.971083.10928021960691626990.git-patchwork-notify@kernel.org>
Date: Thu, 30 Jan 2025 14:10:42 +0000
References: <20241113183321.491113-1-dave@stgolabs.net>
In-Reply-To: <20241113183321.491113-1-dave@stgolabs.net>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, jimw@sifive.com,
 guoren@kernel.org, dlustig@nvidia.com, parri.andrea@gmail.com,
 boqun.feng@gmail.com, peterz@infradead.org, will@kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 13 Nov 2024 10:33:21 -0800 you wrote:
> Remove redundant release/acquire barriers, optimizing the lr/sc sequence
> to provide conditional RCsc synchronization, per the RVWMO.
> 
> Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
> ---
>  arch/riscv/include/asm/futex.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - riscv/futex: Optimize atomic cmpxchg
    https://git.kernel.org/riscv/c/9d0593da9459

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


