Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26088230981
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047554; cv=none; b=eo9ja6epAXxBBbKPVMIVAGa7tvaB/D5AlTSdAZ17MOW02NXzr+MgGGd9BCJ9hDruqLrVmCU2ISpuZ+P35jv4aCaLEhxz/eWemBZlb8LFfxC1TaIVn0MDf9xeFIFyoiQlcDaMmPP9LIj8Jf/0WYpB1DsiUlqXQtwW457ja4wlFuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047554; c=relaxed/simple;
	bh=+BmWJhOFbq1yXe1Nt/YU+m0g8RpyqPG0fIDFEzDZhBg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eKp8g8Fx4ornVFPiSYacI1m/3bQz9QeD7wBkHvk/zb4srm8jZ5Zkun35bSGgOQQAByiN57sJGmPcsu3EsU9ToTRufFpwvuwOAMBd8H6xt9Q9m/E3w6vW7diMBtHsx7XP284/NGAz8HZOw6GhUUyZqnUalUGjWQxBEzwUnYdDAyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWT3MXzV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWT3MXzV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879DFC4CEE4;
	Wed,  4 Jun 2025 14:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749047553;
	bh=+BmWJhOFbq1yXe1Nt/YU+m0g8RpyqPG0fIDFEzDZhBg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JWT3MXzVFlIS3uSrmzj5udbBT2PzmFj3TIl28DjMtnGbDMcJ9F8/0wNQWTJGjaB4U
	 ZShUOG7n8i8l/dlz8G2r500/IgDmpQ2KVCRV59rDXWECayp1drz0BYrCaHRZb8RCe1
	 Wo2bkeu5/9QQEEw/yNTIcrhVA69Yq+upeGRAjLBwUh1O+RWiHd1sAoyjGsr+pbKJlM
	 5qy27JTzXh31dtrjVbiNYs0f6U5w2hdeYedufW8rnut88Vf2TsRTy7Z8bdXjj1g5ab
	 CPiP9FJ8cCERBVQOq2MenLUtD1u0ZbDhIVXqnQcCUBDkucuQVFbM4y9gzbWTLmemWb
	 NTrIanRPH7Fhw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD6838111E5;
	Wed,  4 Jun 2025 14:33:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: enable mseal sysmap for RV64
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174904758575.2309006.1787281436678591425.git-patchwork-notify@kernel.org>
Date: Wed, 04 Jun 2025 14:33:05 +0000
References: <20250426135954.5614-1-jszhang@kernel.org>
In-Reply-To: <20250426135954.5614-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, jeffxu@chromium.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Sat, 26 Apr 2025 21:59:54 +0800 you wrote:
> Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS for RV64, covering the
> vdso, vvar.
> 
> Passed sysmap_is_sealed and mseal_test self tests.
> Passed booting a buildroot rootfs image and a cli debian rootfs image.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Cc: Jeff Xu <jeffxu@chromium.org>
> 
> [...]

Here is the summary with links:
  - riscv: enable mseal sysmap for RV64
    https://git.kernel.org/riscv/c/053ea0a6a070

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


