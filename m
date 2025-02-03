Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716CA20E70B;
	Mon,  3 Feb 2025 19:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610116; cv=none; b=Lcp+lAd4IDnM7sTpudYiTgMZz6DqUoc5aUxdkaa2Srqn9rTqxR/KNoxsSgDMth2hFpzF5xn0AdN1QouNdzdsuPxMxH9mTf6JGQz/jqx3btDZN1zaelpq75SyZYTmmue9bBHPfoInsaIEoEObxdRB0FtMClibF32NRKUjZYmIS44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610116; c=relaxed/simple;
	bh=+uu4oSJO2ZCvHq73dGxynnH17yLEevvcX7bneLr5yvg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=a5h0QAbj/yvwc9vI4MzKS1Jt6YDXWOPXjrWMDC8A6qewKmbknhutFGuIsRM5IouAZjsTOiqmuMu1Kh3Sf/11fdw/DIICtJOU5g34/d6j8FkBZq8EAKEG7f5S4wMAlhOiHpPgeEgUTarlQ9HH+9i6G8u5KLIUmOUpB0KGWbqbWmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pKtmyTx0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pKtmyTx0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D528FC4CEE3;
	Mon,  3 Feb 2025 19:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610114;
	bh=+uu4oSJO2ZCvHq73dGxynnH17yLEevvcX7bneLr5yvg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pKtmyTx0wAWLEmSye8joLiwGcA9qLsk168MdKLsjhLoa6nDE87cHUSGYMvY+qjGV4
	 0tz93/E7U0pn9TvHmawhmBsoKT9xlP3gZ3NPrKrNShc9YP+0PZRcsIFg+4F5tK8+6G
	 K4PWqDSw0ta4z/PcWq20hk5x5t5c1ys5sq6ZPvSjZsQMOCCpxY6r/WyTtyMCTj95ob
	 jx4UWnlNFXmHmQrly0V8nNn6aeEABc/1QyYa9/PxyHzt/n8pRDycPk0qdNGX3iFVnM
	 VcFpwI7mAldm4YvIYVepgxX7kg2Ob+EGx/E94wah8p5nOgwhcUdJbAqsfz3K4gZnOa
	 OiTxfM5nn1E/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 340FE380AA67;
	Mon,  3 Feb 2025 19:15:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: Always inline bitops
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173861014176.3409359.5658705755515724727.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:41 +0000
References: <20241123-riscv-always-inline-bitops-v1-1-00e8262ab1cf@kernel.org>
In-Reply-To: <20241123-riscv-always-inline-bitops-v1-1-00e8262ab1cf@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, yury.norov@gmail.com,
 linux@rasmusvillemoes.dk, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 conor@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to riscv/linux.git (fixes)
by Yury Norov <yury.norov@gmail.com>:

On Sat, 23 Nov 2024 19:30:19 -0700 you wrote:
> When building allmodconfig + ThinLTO with certain versions of clang,
> arch_set_bit() may not be inlined, resulting in a modpost warning:
> 
>   WARNING: modpost: vmlinux: section mismatch in reference: arch_set_bit+0x58 (section: .text.arch_set_bit) -> numa_nodes_parsed (section: .init.data)
> 
> acpi_numa_rintc_affinity_init() calls arch_set_bit() via __node_set()
> with numa_nodes_parsed, which is marked as __initdata. If arch_set_bit()
> is not inlined, modpost will flag that it is being called with data that
> will be freed after init.
> 
> [...]

Here is the summary with links:
  - riscv: Always inline bitops
    https://git.kernel.org/riscv/c/f9d2ee3f51d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


