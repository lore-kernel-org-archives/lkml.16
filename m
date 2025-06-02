Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAA0253F1D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902329; cv=none; b=LQpXu1DVxRRc1MtvVQsWbcRe2JKqDFU8ocGQP1usywox8tOeMCqN2RqtMkZG5pA8HvLvxtadbwaWKpesKN2NyEAMLJspHzf3qs/XbhvGZlcEm8oenqOKeXlzxAznVZUDlG05PiksfKfi86iC3wLWOaUnY80PQiyrmuj3xGK+WoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902329; c=relaxed/simple;
	bh=Yqcn4giQRzb9AQrWT1Ez4PS7LHxSwznVJasaR+yuL0M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FSknj+7ejG3xFSLyXxi+x0uVK7OKb+zXAjPA9tVqh2XeFleMZQAQLSAJ4bqKZJAq51EzBfOofL/bUpa3sd10QDo1wTzQWvZMtBJQF+/eyBXP/oWzdpX8ThXDtxkqYDyLx1mXDkig9lUK9LF7Pqm+EqG4mvVitgTreYPGGBox8Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwqjB+F3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwqjB+F3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E513C4CEEB;
	Mon,  2 Jun 2025 22:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902329;
	bh=Yqcn4giQRzb9AQrWT1Ez4PS7LHxSwznVJasaR+yuL0M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UwqjB+F3PqOV7iKXoJ5tx1uBjdvtybjceIA3+8bSoFfQBULCVMHWD75LEKXATdfUc
	 Kfjs4zZpyIMKc/V4gYa5+0/nvDbWJBo32NrCsOVIOrNVXiyW7riVyjQKGgmqhyBFag
	 gTN5e5vWUAwkeNgXmbFBHKoy5E6KPSwCYhUsn5XXnH5+XXeuzJF+L7VRqHAehQdMG8
	 EUA8eeCZTfmcR9HsUHknf+blaCXgg8Xq/NTaGoFeI1gZVL/mufWse4MeZ2Fooi0Xut
	 l6u1OfW37Kp6SGp1EEnc08U0d7PWm30iQi1g+4NCLoH7qvlyocyk+T33SP/IGL/gFt
	 w0LTz4aaxrQGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0F0380AAD0;
	Mon,  2 Jun 2025 22:12:42 +0000 (UTC)
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
 <174890236147.925497.13173014055651849610.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:41 +0000
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@dabbelt.com>:

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
    (no matching commit)
  - [v2,2/3] riscv: module: Allocate PLT entries for R_RISCV_PLT32
    (no matching commit)
  - [v2,3/3] riscv: module: Optimize PLT/GOT entry counting
    https://git.kernel.org/riscv/c/e9aa38ea39b2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


