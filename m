Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D332522540B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744828918; cv=none; b=cje4+IkEP7czNNZAv/ZGjN9Tz9LfHYohFM5dymfXdFuXgNdQLTs/vU2weFjYx0Cs2mH5bX9kwUnGbxI4CoqOnoXoIfMzzy5YlB271+O5VfRG0+bV5e5BjQt4E1XXBs+J+fBOvRPjs23GNbP7X2G2E4jSigtctDmzTFAqSdh/1jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744828918; c=relaxed/simple;
	bh=FxlsQdF/tRWe6WvKosJu3QY6wulI3m6lFJkvkMeuo1g=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=br+Gm+JPhi+1mCAEfSBPwbNf8Joiuxaa3hO5CH3SZAPc/nC83pta3ZM8YqkM8VG4EAc5mgfSA8ncawczvkpIv/KlkdQC6ldHuigK9Om1MwYgWAoJkMhDiOFaW5ieuaCPKFn369071osoxLLRNF80GIRY3x2vxpM90yET+4oTtGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EI/F5Tvp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EI/F5Tvp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D66C4CEE4;
	Wed, 16 Apr 2025 18:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744828918;
	bh=FxlsQdF/tRWe6WvKosJu3QY6wulI3m6lFJkvkMeuo1g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EI/F5TvpkwUo8nFCWGEi1iyM6SWUV8+4dzQSQCM8roO57ONkJnzkNSZkU3uT9oj4M
	 ofPPmwgxDsbpPmts+Ty+dV12kfBi3frHHv1gfUhEf1AE9z/hh2WoxuGtdhJe8wKl+0
	 v3FYeg2xFUdCe/ickF6LvRn+dFRlIoMLNo8BJ7KL8Idjc2aiRPSHJQIoya31pm2K+O
	 2qiXhXeSfVYIwjzQtK9FQr0odyH2KsfEegD8lZybHbnqvvN3mMi6zcT88cxaqwIguz
	 w5hTnkqnHzVok/EdXAEGlqrLheTXQCm9jxc8gwHi5IL46wbZWerq4/5+Wa+96WLluA
	 feJdqMjpTk66g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE153822D59;
	Wed, 16 Apr 2025 18:42:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: Fix unaligned access info messages
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174482895651.3460781.10451440487742168881.git-patchwork-notify@kernel.org>
Date: Wed, 16 Apr 2025 18:42:36 +0000
References: <20250409153650.84433-2-ajones@ventanamicro.com>
In-Reply-To: <20250409153650.84433-2-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, cleger@rivosinc.com,
 alexghiti@rivosinc.com, geert@linux-m68k.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed,  9 Apr 2025 17:36:51 +0200 you wrote:
> Ensure we only print messages about command line parameters when
> the parameters are actually in use. Also complain about the use
> of the vector parameter when vector support isn't available.
> 
> Fixes: aecb09e091dc ("riscv: Add parameter for skipping access speed tests")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com/
> Closes: https://lore.kernel.org/all/CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com/
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> 
> [...]

Here is the summary with links:
  - riscv: Fix unaligned access info messages
    https://git.kernel.org/riscv/c/441016056010

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


