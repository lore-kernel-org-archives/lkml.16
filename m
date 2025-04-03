Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9994E25290E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743697205; cv=none; b=Z327xpBQR7BYa/RYLbkYCTPBAj7UTpusLl58T1ESyrUX0DNM1zHTbdQ0mSWMvmmiQrLPgrzJk4/nRQUj+nECcGEqdTMD6gPV2J2WYfNsx11p54XzPM1hJcOBb73PlQ5HNVYVNMV0lo0kW1NeAE3tcrb8aQe8xqR4rbdw0kMTX3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743697205; c=relaxed/simple;
	bh=X5qNhLTsA4T9nteiRBiBeKwbYjMtn6kSffRtG36LJb4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gf38TMzaUwQe+Y5IQT7TsdA7GM9ojvRQczxYdbQdrRqZUgvkxxp0t+VnvliraEMuAV7YJM0yUV5b8B7zkZZ2Djio3HPfnXuxUJNvUqwLce9Ok8Um6OIllpafDdvEoxeHuWcsncZ7P1BCVMUAQqNc1EznDqw0jxBZQlRUy4VY0eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wjy0pxfK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wjy0pxfK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F62C4CEE8;
	Thu,  3 Apr 2025 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743697205;
	bh=X5qNhLTsA4T9nteiRBiBeKwbYjMtn6kSffRtG36LJb4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Wjy0pxfKBKMXqs2RbhiIcVi3a9Uisr+gB7uOvSbcs99DnZtdbLPJlLl2buiAVjDwO
	 UXC2vQ+Wgqc12Y7QA2kNZ1tSTrtVT1tachPPIXhwDlLzPLtRFbeZa9AAiRU4yI442A
	 We0JIJycDfkB9wO29B6iQHeGAVUKFRtdGJGZN2NLhEa1fsCEZwlghatDccqouBCo/p
	 rQjj+zYOv8lTeAu7dzN3K/TJv0Jru8u6aK0xNgBJLPS+kD8iCMGVrrupiGTK0hnllp
	 fNmYp1A9srQe5Fpi4PXUs0Bb3Tt16Dgphs0VPM1srx1nK3k7qEodEM1iczF/I4W2a0
	 1HoV2rXlC58Bw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DE3380664C;
	Thu,  3 Apr 2025 16:20:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] riscv: print hartid on bringup
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174369724199.2563936.8945479042100583382.git-patchwork-notify@kernel.org>
Date: Thu, 03 Apr 2025 16:20:41 +0000
References: <20250303083424.14309-1-cuiyunhui@bytedance.com>
In-Reply-To: <20250303083424.14309-1-cuiyunhui@bytedance.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: linux-riscv@lists.infradead.org, apatel@ventanamicro.com,
 atishp@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, samuel.holland@sifive.com, alexghiti@rivosinc.com,
 jassisinghbrar@gmail.com, takakura@valinux.co.jp,
 valentina.fernandezalanis@microchip.com, ruanjinjie@huawei.com,
 charlie@rivosinc.com, conor.dooley@microchip.com, haibo1.xu@intel.com,
 andybnac@gmail.com, ke.zhao@shingroup.cn, tglx@linutronix.de,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Mon,  3 Mar 2025 16:34:24 +0800 you wrote:
> Firmware randomly releases cores, so CPU numbers don't linearly map
> to hartids. When the system has an exception, we care more about hartids.
> Adding "dyndbg="file smpboot.c +p" loglevel=8" to the cmdline can output
> the hartid.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: print hartid on bringup
    https://git.kernel.org/riscv/c/a3313375e88e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


