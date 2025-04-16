Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8713B1A3178
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813831; cv=none; b=r0ppNFINWdgyHroChRXfpCvzlfHUDSLW9jP/GAJKlNsCcQzGj+mQYbdlTS0nTTYoaOwibQ9OXLqwZ5YIxXp4UPJjcFWnk5R+IrXzBMbepa8p6UrRMysxTL4JNx3XeATkLAhkFRnCpu0cR+IDwGBDRfiDZxzZ+LeR2SSddowOfjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813831; c=relaxed/simple;
	bh=HTXIiaPqxAY9Ro5nZpL9rj6diNfyeydNoh0/6NKpZw4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=o9fL6e+EqisrXQCWYVmkKelJ6r47Dk3vryG65lujbJtu5GnSEAf5Eb07M/Y6PWVp6dLr7Bb21BJvsd1MsqMgjqJXFNrHGhOFu/iP1ixoTguNQk1cdOaaxZWecGoxDaOKzLDbOoTgGBBHRqXpFCD9gY+A9rjfEvIZnRh02ehD9QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kp/kcPj7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kp/kcPj7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8CCC4CEE2;
	Wed, 16 Apr 2025 14:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744813831;
	bh=HTXIiaPqxAY9Ro5nZpL9rj6diNfyeydNoh0/6NKpZw4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Kp/kcPj7YeWKGXWQpbfQZGQ4vT80TJo9Sbx71wkSZ7cIlrVt/q48WZhQUCAJQCur/
	 2wZ/aXFhxfd4R41Odh4epb9b1p4OF2P2kc/S6iU8ttKbAYUK3VEOZOCqSqOSyZeLgz
	 f3gClI5NQAswNDZhUHWRXHoJk+Xq4P69lYVOLTM4mCIjgJhUQ1BTdG4KtZEp83oeYc
	 u2v2F5iA/f6KiZyh2V6qU3sd6NudWeupK8WRAc0302k9LWO4PfvNfA61Ex3cyj1fB6
	 zaxCyrsNiHW+4uuvQQHtoobshaxwq2MdVHr5J+9Z3g6vG96DCBwoULueCjolLms0zj
	 WsOB8MuGdVMNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D0E3822D27;
	Wed, 16 Apr 2025 14:31:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: Avoid fortify warning in syscall_get_arguments()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174481386901.3385191.15884470264391337876.git-patchwork-notify@kernel.org>
Date: Wed, 16 Apr 2025 14:31:09 +0000
References: <20250409-riscv-avoid-fortify-warning-syscall_get_arguments-v1-1-7853436d4755@kernel.org>
In-Reply-To: <20250409-riscv-avoid-fortify-warning-syscall_get_arguments-v1-1-7853436d4755@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 charlie@rivosinc.com, ldv@strace.io, kees@kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 09 Apr 2025 14:24:46 -0700 you wrote:
> When building with CONFIG_FORTIFY_SOURCE=y and W=1, there is a warning
> because of the memcpy() in syscall_get_arguments():
> 
>   In file included from include/linux/string.h:392,
>                    from include/linux/bitmap.h:13,
>                    from include/linux/cpumask.h:12,
>                    from arch/riscv/include/asm/processor.h:55,
>                    from include/linux/sched.h:13,
>                    from kernel/ptrace.c:13:
>   In function 'fortify_memcpy_chk',
>       inlined from 'syscall_get_arguments.isra' at arch/riscv/include/asm/syscall.h:66:2:
>   include/linux/fortify-string.h:580:25: error: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
>     580 |                         __read_overflow2_field(q_size_field, size);
>         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
> 
> [...]

Here is the summary with links:
  - riscv: Avoid fortify warning in syscall_get_arguments()
    https://git.kernel.org/riscv/c/adf53771a312

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


