Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F39B1B0437
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045836; cv=none; b=ZhhT3vqt5maqJUPCT3+JMQ84Pb3QvbqtIN7l3r6gJgjNboeWrt6F4o1baP4eSYf+xtwfsKylkNRUwtanQN1hQEHEO9PcQSZEiieJyu31VQOEffqDKtb6gKYEeCgF24igac0CMuGduQcdgLsOy5cAZF8d3n+owlfqJHhvggHycls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045836; c=relaxed/simple;
	bh=0Z+krIl+/zQYEwjG0OKDq23wYFASD/qtkJxmur+n0hk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=oVd2yxpooAWT9/SDqpyvNamLTqUDbNqI+LtfNIP5D/NWsguYpOWhSzcbo8Q5oHRpZLxv710TdW/mjgG8oys3bRmnPd51XM2xsH09OXob3GfUw49iONZtDrPPWvhq3wN3n3OOsX8+urrIAzq7LJ9dAPT3NQ0MziYB8XxdAAGlm9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKIVlDks; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKIVlDks"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BBB6C4CEDD;
	Thu, 27 Mar 2025 03:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045835;
	bh=0Z+krIl+/zQYEwjG0OKDq23wYFASD/qtkJxmur+n0hk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OKIVlDksSvYxBczefAjURc8P10kXnp2ZJbkVZgE7HDzRSkujUtWAGwVBF233EQI+O
	 jcvaWK/tDrJ85gMIGcgr4kCT+0NqN7/+g+iXSX3VB9yjgpdUOC1lK6JNg86cH0t/S8
	 JqNbMd34ymWgSkWulmDOapT5YVjq/p0hWV1lG6AVoW+iQQStKLUW4Wdbucb692zk6N
	 fkFyjYBuqZGAm+sa48Xja9onPuw6finTR64EcVuCXZIG420aFm4e8wKVwByRe3C0Nc
	 qwCYTz6u4KQiXvQCLA8WVAszXXKCVv+PhAbkIS29F6gJzFf4ZnOHKLBD/8t0/bkRGW
	 /jJ7isU0h3IjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34226380AAFD;
	Thu, 27 Mar 2025 03:24:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] riscv: Call secondary mmu notifier when flushing the tlb
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304587200.1549280.10533939486464142848.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:32 +0000
References: <20250113142424.30487-1-alexghiti@rivosinc.com>
In-Reply-To: <20250113142424.30487-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, samuel.holland@sifive.com, ajones@ventanamicro.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, cleger@rivosinc.com

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Mon, 13 Jan 2025 15:24:24 +0100 you wrote:
> This is required to allow the IOMMU driver to correctly flush its own
> TLB.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Clément Léger <cleger@rivosinc.com>
> ---
> 
> [...]

Here is the summary with links:
  - [v4] riscv: Call secondary mmu notifier when flushing the tlb
    https://git.kernel.org/riscv/c/d9be2b9b6049

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


