Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD399139D1B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 01:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749087001; cv=none; b=RggeXMh7mkPcgGdJsFldWtUzGsxTblNPcMf4/lZIHqFZGKkRmnuTJmOB8K7i+8sDaxx/U0czywf4vq+AztLG9Q/QSsUdAscfGDxylSZ/VAzrbEslL9sPWR51YFKjESOuSz5BCLP/xrg33+ZqJ3dYk5weGJft7jQ7bXrymDcsCp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749087001; c=relaxed/simple;
	bh=oP7+a5O/kVT97O5DZUoumNvOy8kIxX+bjOp/yCRwUy0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=sWtf/9aEYtPdyr+bd0IRQ1ExR2gHlxXyfWHrBm0fIrpMfDHdTy7cahXuWJsDESTbuFifWGpH2BtCabnEyFnBKBUh/rMB5txPuVS3Dd6HnG4vq/O/Wl+Vhksk+yk2rLDhrpzHUv/npq/KDFIyv3iFZIyf8Obffihwl17JzTabGT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rzogpc78; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rzogpc78"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201F5C4CEE4;
	Thu,  5 Jun 2025 01:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749087001;
	bh=oP7+a5O/kVT97O5DZUoumNvOy8kIxX+bjOp/yCRwUy0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Rzogpc78vuV3bsQyKpsEyyVy9vFIAddvoD6VTrwWrKlLdN9YHCJMgmiJCxThlhUS9
	 v7hOSZ+knsvmaQmtrSC8LKT2lcp9oNQ8ZNz0j7VtPTPyHmnI0bljh2i16atVx3BPw4
	 hu7GNczN+Ukcqm+NnxdxA+absqwZKc5evXiCPIGtrCTu/xJ8q2Q5HdmjwR9drL+2DN
	 rxhMHcFrPL5apS69zJtN1MRO08YALpOVu6z7xaOGlpfkGoNR+DS3fA0OE/73PJYdQC
	 HDLpxKNWv4SIiCrm4xjbPfU6FFo9t0vBNryfhwanJM/BvWCYeHD8HicpDejX93YBjZ
	 da6xWnCY1IWnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D8A38111E5;
	Thu,  5 Jun 2025 01:30:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] riscv: uaccess: Only restore the CSR_STATUS SUM bit
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174908703299.2529829.8532733312132179877.git-patchwork-notify@kernel.org>
Date: Thu, 05 Jun 2025 01:30:32 +0000
References: <20250602121543.1544278-1-alexghiti@rivosinc.com>
In-Reply-To: <20250602121543.1544278-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 cyrilbur@tenstorrent.com, andybnac@gmail.com, debug@rivosinc.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Mon,  2 Jun 2025 12:15:43 +0000 you wrote:
> From: Cyril Bur <cyrilbur@tenstorrent.com>
> 
> During switch to csrs will OR the value of the register into the
> corresponding csr. In this case we're only interested in restoring the
> SUM bit not the entire register.
> 
> Fixes: 788aa64c0c01 ("riscv: save the SR_SUM status over switches")
> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> Link: https://lore.kernel.org/r/20250522160954.429333-1-cyrilbur@tenstorrent.com
> Co-developed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: uaccess: Only restore the CSR_STATUS SUM bit
    https://git.kernel.org/riscv/c/4e27ce58e7fa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


