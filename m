Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D852213241
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610138; cv=none; b=Cj6IQPQn+C4jTuevXWcycrC6S29/QbmBmNAjmsvV6IX/FQWUFqq+W2fPVsOEwuKsI6TXXg58E7HTtzQ9AFwoYCptWaH738yjOFI3j+ArXuFtiRMZt8xZHGejj6rjX6xhvtEZuS/9MGs3BgvAz3fqBG9DP7Mxvv17xQX8SaCM93c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610138; c=relaxed/simple;
	bh=pvSRZHIEnWzlylvGKez7eh4ZaAQSXHHezzcyOVx53k8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=r8rJPhx9Bx8wHuhrZ+wra6vAuBbL5xejO1FeNa9yPtUV1yj66omZ+Y2OGfmKCJxDgSfeBiyJP9Z+ovPsDmJIgqvwLI1al133697IiDsi7F9ZgdATEjDHzSUFoYsXlmf3N0Dbft26bkb5Pgh2ThdiIfztZTY7XkjV/Kw/spxIOg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLnNaoet; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LLnNaoet"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6A8C4CEE2;
	Mon,  3 Feb 2025 19:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610138;
	bh=pvSRZHIEnWzlylvGKez7eh4ZaAQSXHHezzcyOVx53k8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LLnNaoetflYy1QzF7yAch66K4VyIGY9uBq2xA1Sk08Mk2PJNG3ioGe9ptvYOKNN6W
	 gjzQlIdtYcEGr4mAcRL1+/J/aPBA02ZIKN66dAwW0K0036mun/6lo/o5haL8Gzkr/U
	 jEWrXF1pxqY3kvQDhPzVM8rj5xshx0e3/+8J3DvOVdyNW+uJoeH8cbuz6TcIUvMuwd
	 suFqIHJOxyqWGOuU81Sxz5/QAsA4XkwJuHYBdpJhER6+8+0Y+gDOdLbUEpEXDf2LT7
	 3UE8rfn2Mdr2jBvtVzBXPK1DXd2D9Y6MFwQi2ScEEgZL1n5cLW8m4rN9RHuF2EuS8A
	 r99vDcNXcnz0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 713C3380AA67;
	Mon,  3 Feb 2025 19:16:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [Patch] PCI/MSI: Handle lack of irqdomain gracefully
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173861016523.3409359.17144106857280906043.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:16:05 +0000
References: <87ed2a8ow5.ffs@tglx>
In-Reply-To: <87ed2a8ow5.ffs@tglx>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org, alexghiti@rivosinc.com,
 anup@brainfault.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, helgaas@kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@linutronix.de>:

On Sat, 14 Dec 2024 12:50:18 +0100 you wrote:
> Alexandre observed a warning emitted from pci_msi_setup_msi_irqs() on a
> RISCV platform which does not provide PCI/MSI support:
> 
>  WARNING: CPU: 1 PID: 1 at drivers/pci/msi/msi.h:121 pci_msi_setup_msi_irqs+0x2c/0x32
>  __pci_enable_msix_range+0x30c/0x596
>  pci_msi_setup_msi_irqs+0x2c/0x32
>  pci_alloc_irq_vectors_affinity+0xb8/0xe2
> 
> [...]

Here is the summary with links:
  - PCI/MSI: Handle lack of irqdomain gracefully
    https://git.kernel.org/riscv/c/a60b990798eb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


