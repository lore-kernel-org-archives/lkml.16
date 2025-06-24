Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76E4172BB9
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750726180; cv=none; b=Vb/TqeVEQZWhL6UYMOKyk9TgkJnc2GpYB9kVZbz3L4ykZtSZ5rFTmWflOZ5XeY3k/KKM9uM9TEcXUeLuikyE2YlBsTV5EZuJ2syZ+TtWtINzVR4G05eLtrsxfLKGP5syU025TVHcDOL1dBdOlyx8o0I69cG6d7r83XEK4PcZyyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750726180; c=relaxed/simple;
	bh=X8UulWlYl9LmJn3LksLbSQHl4U0132JMnyWRQath+zI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=b5LWFx3wlxERUwdlx6P2oUHBLVEHhLSUi9PI/fcFWs1m7WUiI6tOMJDmSdzZhQtRn1bsrCD3pk/gnwpmrougFCdoNhBbzRJbMHuQsg3R+L6UhOf5VoZwUvQGgxgZrK0wH2XJ3Dxh6BrK5nJgpLE0jbJhcdXm84/FkAtDmImxPXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMANg9pb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMANg9pb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74806C4CEED;
	Tue, 24 Jun 2025 00:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750726180;
	bh=X8UulWlYl9LmJn3LksLbSQHl4U0132JMnyWRQath+zI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kMANg9pbkyiSlF9oitx9ECRRIjq9IurI7AwTATjQfEkO0qD407oX07uhZaJs3oNC7
	 bJ1BtGWJZ1cJEfV5ZTZ4EUw1s7k4pqMp1+ZBgFDKLPrvgUnga8TDlwoU1Mn6Y+pXcg
	 AXTdh4KL4fh/sUeQ4N6Q1kzcHhcnNxSY7uqITG3uoWJnqxhkUpkOiCMxPOZegr1BST
	 bswDQ7I69jIDmKdPGZzOO9A/UkTQZxfKcB/IEu1U9Y3bt/PU0vxPlDtfvaq6fkZIDa
	 JJ8ySnZlMDfRl+z6gqBKxTOoraDhRlWZE7wRqZXhC5r0NI+W9xf8idp6K6b51PoeyS
	 iY4SMoiXawtMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFC439FEB7D;
	Tue, 24 Jun 2025 00:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: Fix sparse warning in vendor_extensions/sifive.c
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <175072620724.3349808.11810729064319282385.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:50:07 +0000
References: 
 <20250620-dev-alex-fix_sparse_sifive_v1-v1-1-efa3a6f93846@rivosinc.com>
In-Reply-To: 
 <20250620-dev-alex-fix_sparse_sifive_v1-v1-1-efa3a6f93846@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 samuel.holland@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, cyan.yang@sifive.com, palmer@rivosinc.com,
 linux-kernel@vger.kernel.org, lkp@intel.com

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Fri, 20 Jun 2025 12:08:11 +0000 you wrote:
> sparse reports the following warning:
> 
> arch/riscv/kernel/vendor_extensions/sifive.c:11:33: sparse: sparse: symbol 'riscv_isa_vendor_ext_sifive' was not declared. Should it be static?
> 
> So as this struct is only used in this file, make it static.
> 
> Fixes: 2d147d77ae6e ("riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505072100.TZlEp8h1-lkp@intel.com/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - riscv: Fix sparse warning in vendor_extensions/sifive.c
    https://git.kernel.org/riscv/c/b0843f836126

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


