Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE3B2512E1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743697199; cv=none; b=t9M2B8F0EjxWbzOW2fUAXPNwZK8Bl/zSJk8mv9ewt/tL3J6n3bc3zqZxGZSuETRCElnMOqaI5NhZ4UiLppErPFsr3LLQQSszeXwj7B0o3EEqzgMz9gJFTZzDLyykJ2SU3d1+zaxG5nyvc9ci+8OCfojgpG8THcTeO0XnUzfSM9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743697199; c=relaxed/simple;
	bh=CSJ5SE6jBnvnws9fZbbOZ4HpZ7P/EkbcQ+DcqR42YFo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rLuBY/m+hgeWtLH53QRrQnpvjS+y+GTJcAX92H/0H+BxeY/bt6LO7miq+FDH/skbcWdUsDcEDTXeFQZzqD5fZ43vfDmhXccLDPcH85yzgY/vg6M9ecvzCAwh8aaNESy5KMMbeC2Whc2iDVZtGlJzCvHM5P6sLL1NNYJEGJvQdJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUBbar0T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUBbar0T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087A1C4CEE7;
	Thu,  3 Apr 2025 16:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743697198;
	bh=CSJ5SE6jBnvnws9fZbbOZ4HpZ7P/EkbcQ+DcqR42YFo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dUBbar0Tiww/F+4dR+fMOaEyfKug7ijG7BPgDL0/LMHeKsh9oWcNwpJqVpu3Bo1ot
	 AAQih9NYaVyraxZ8fny1nqWZfkZAlspXpAK7EkX5o9g/eJbxFbDVelE9WV7F8iZzKg
	 L48ButIMqc/yTZdge4nR9irwlz8Wn8wehZIKBiu1T5V23JiMgmvGfgHzHsm28LyXPn
	 WSzX61mNRHMb1apsV9Ke/rGirUeQay15agHAVg5FhSoWh4AKjZi9P3EID5lFPr3s6b
	 1bfMgd2s90ey3ZSneRDjyDt00aDbcfP24IyEqEuLhX9LvpZZd+1qqKgRj/C1Hg2Oln
	 T5kIBYTcurylg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C71380664C;
	Thu,  3 Apr 2025 16:20:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH fixes] riscv/purgatory: 4B align purgatory_start
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174369723499.2563936.2453990084533442499.git-patchwork-notify@kernel.org>
Date: Thu, 03 Apr 2025 16:20:34 +0000
References: <20250328085313.1193815-1-bjorn@kernel.org>
In-Reply-To: <20250328085313.1193815-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, bjorn@rivosinc.com,
 cyrevolt@googlemail.com, lizhengyu3@huawei.com, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Fri, 28 Mar 2025 09:53:11 +0100 you wrote:
> From: Björn Töpel <bjorn@rivosinc.com>
> 
> When a crashkernel is launched on RISC-V, the entry to purgatory is
> done by trapping via the stvec CSR. From riscv_kexec_norelocate():
> 
>   |  ...
>   |  /*
>   |   * Switch to physical addressing
>   |   * This will also trigger a jump to CSR_STVEC
>   |   * which in this case is the address of the new
>   |   * kernel.
>   |   */
>   |  csrw    CSR_STVEC, a2
>   |  csrw    CSR_SATP, zero
> 
> [...]

Here is the summary with links:
  - [fixes] riscv/purgatory: 4B align purgatory_start
    https://git.kernel.org/riscv/c/3f7023171df4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


