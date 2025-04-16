Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD08F2253EE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744828917; cv=none; b=cENqI3sA3oWtm4Z1AJrW8ZZiCqOurQH1xdNvC10A5ZgdGlEr7X9nORN7DXKaZkW2CsRhBP13iOD+PxazpnZDzkqEh7cCLrJ1+R6Qzjy81UgKTGLwp8IdYp90vPHpkSPmzLpHcnmSQPjvSFjoEANoStYB1iyEVtg0k9nvryRgMys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744828917; c=relaxed/simple;
	bh=Mp/wib5BAqlkaggzGbmMacYQ0EBI4nk2SmqoXlgnLC0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=n36/kpaSHqYXE8QeMYQPFuqWiQjZKewv8WAtsycdmWGH5a2Sl4Ob5p+bpIBcPa/tO2czKFoK105Unc5veZsOt4eLTkK5DQHXM5OrJXpSfPCOG7qTV8lvEldQZx3MT+dQ6q1IsaYh7ouBZrTKd0+78UQxZteBiJkxfHnwZIYjcCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKOvucS1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKOvucS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393EAC4CEE4;
	Wed, 16 Apr 2025 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744828917;
	bh=Mp/wib5BAqlkaggzGbmMacYQ0EBI4nk2SmqoXlgnLC0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NKOvucS14HyNLr0slfQgUIdYKqudutud5bBP3d9g8HQNMP0c53FGwsSSSQlK7gaVa
	 ngBT6TLy60kHPC2bJ28g5E7ogkcPEx5bee2vPLFsWxwZYRMEBjhlF4k5fcsbHY4JoO
	 BYia8k9ZsPYb9QVdCHkT8ve2qHV6nWaIYhUurK7SkXMQitm8l+GkYxvsGfyVMZmFvZ
	 tPmGeNe1ny1coAgC7QJwKoz6WH1k/V7iuN8zGao1j01t77OFH1hOenmYgiMfWlIpQq
	 yEIzCrkSbLE9CZVCRQw9i1QndJwUxgYcQ4AiYI0r/ZNNhZgr39UbsXZopw8twuCasY
	 XVYzj7HtppLjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C1F3822D59;
	Wed, 16 Apr 2025 18:42:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/3] riscv: module: Fix out-of-bounds relocation access
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174482895499.3460781.7794582579733916217.git-patchwork-notify@kernel.org>
Date: Wed, 16 Apr 2025 18:42:34 +0000
References: <20250409171526.862481-1-samuel.holland@sifive.com>
In-Reply-To: <20250409171526.862481-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, alex@ghiti.fr,
 ajones@ventanamicro.com, pinkesh.vaghela@einfochips.com,
 pritesh.patel@einfochips.com, darshan.prajapati@einfochips.com,
 aou@eecs.berkeley.edu, lixiaoyun@binary-semi.com, charlie@rivosinc.com,
 cleger@rivosinc.com, ruanjinjie@huawei.com, mcgrof@kernel.org,
 fido_max@inbox.ru, rppt@kernel.org, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed,  9 Apr 2025 10:14:49 -0700 you wrote:
> The current code allows rel[j] to access one element past the end of the
> relocation section. Simplify to num_relocations which is equivalent to
> the existing size expression.
> 
> Fixes: 080c4324fa5e ("riscv: optimize ELF relocation function in riscv")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> 
> [...]

Here is the summary with links:
  - [v2,1/3] riscv: module: Fix out-of-bounds relocation access
    https://git.kernel.org/riscv/c/0b4cce68efb9
  - [v2,2/3] riscv: module: Allocate PLT entries for R_RISCV_PLT32
    https://git.kernel.org/riscv/c/1ee1313f4722
  - [v2,3/3] riscv: module: Optimize PLT/GOT entry counting
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


