Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7821C2D877C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749759004; cv=none; b=Fgwruv+sWppeNB2u/jeGNsZWmlA1cncdr0Klv3JhHkX2InHUFUMctx8/b1jr/6ca5i7iD4pz/EbuAtLoG1jUjnZmxKkjqN4U6mrepiI4od/BW4vjadzJfzhptFd7ezwAaNOzhdv/fRKgeOjbmI4ORZpHktfpzlLnaOYMJ0m+6WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749759004; c=relaxed/simple;
	bh=gDmI1cm1UeJF7jH2D2QrNgyl09J8B2qKOnKgzQywqgQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gR/uzsLhGtrknQwOAr0jpR85eZAtKVNYK1KIHfB4m/1rSyuEQFvbF3Syfc2dMAfe8kc+uU8cKFzW++QjSJXXLtR1xttQhVjJkIly3Rrp0E5en/WkPqLupet01YtQoXlZ98fU74Sx2YbVGhsxWIgW9UKsh2Rb3bTkSaSZCJGzdjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RpJQkRtL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RpJQkRtL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDA3C4CEED;
	Thu, 12 Jun 2025 20:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749759003;
	bh=gDmI1cm1UeJF7jH2D2QrNgyl09J8B2qKOnKgzQywqgQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RpJQkRtLfhWA2uG1vtFgZxvQIUsw31iQlNq7nCuzYv3g/RTEimDCAChcndTb0/8Zu
	 IiAoGpRYFJzd6UM5KT6IGyz/YF6qrtdcgjzyBpZ43fpdc3B/Cm0C96nEg7KKOnD2GC
	 kb9vPf5Wt/DeYAWGlB4JT+meU0R5QGjgRBxOQLXC/cKEIsbW4keUoUL1XUHG9EJ03H
	 H7zegKl8lSwcEdbefokLSfBdvEsoCXnTZSNAR1f20t2I3asGfIQS4LgPzTG2U2+W4S
	 wNOag9vOOGE6x3bkaxcyBDNIfaDZkFnTaC9xiLTvFxLg6H6EnrkPhxuniOtftSPL9P
	 oORWEc0Bv77QQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EABBE3822D43;
	Thu, 12 Jun 2025 20:10:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] RISC-V: uaccess: Wrap the get_user_8 uaccess macro
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174975903349.88969.3262884542771574514.git-patchwork-notify@kernel.org>
Date: Thu, 12 Jun 2025 20:10:33 +0000
References: <20250610213058.24852-1-palmer@dabbelt.com>
In-Reply-To: <20250610213058.24852-1-palmer@dabbelt.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, cyrilbur@tenstorrent.com,
 jszhang@kernel.org, cleger@rivosinc.com, samuel.holland@sifive.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Tue, 10 Jun 2025 14:30:58 -0700 you wrote:
> From: Palmer Dabbelt <palmer@dabbelt.com>
> 
> I must have lost this rebasing things during the merge window, I know I
> got it at some point but it's not here now.  Without this I get warnings
> along the lines of
> 
>     include/linux/fs.h:3975:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
>      3975 |         if (unlikely(get_user(c, path)))
>           |                      ^
>     arch/riscv/include/asm/uaccess.h:274:3: note: expanded from macro 'get_user'
>       274 |                 __get_user((x), __p) :                          \
>           |                 ^
>     arch/riscv/include/asm/uaccess.h:244:2: note: expanded from macro '__get_user'
>       244 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
>           |         ^
>     arch/riscv/include/asm/uaccess.h:207:2: note: expanded from macro '__get_user_error'
>       207 |         __ge  LD [M]  net/802/psnap.ko
>     t_user_nocheck(x, ptr, __gu_failed);                        \
>           |         ^
>     arch/riscv/include/asm/uaccess.h:196:3: note: expanded from macro '__get_user_nocheck'
>       196 |                 __get_user_8((x), __gu_ptr, label);             \
>           |                 ^
>     arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
>       130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
>           |         ^
> 
> [...]

Here is the summary with links:
  - RISC-V: uaccess: Wrap the get_user_8 uaccess macro
    https://git.kernel.org/riscv/c/2aa5801ada29

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


