Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64250224882
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902326; cv=none; b=Gi3sod57TPPVEyXJK5uHPcknfbszdE1JBbhR6+2h0eGXYyzrMo9/2RqiwQfN8gUiCROekZ4EuOrpLVbfLLE2rJybwcUzXB4Ov3G5oqCymzocJLqeEzno3D0bWYzMInRXjIUhtcDXclWzkQthevA7a9sI3M3sn+Lostx5BVY/tD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902326; c=relaxed/simple;
	bh=7ygqIY0hkxuONzbgzQUnvO6isdISsOfjdB10LcXkx2U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WHlsLBVPp/hJaKMlBBsy1Qb6JnyGDA5Agr8qagao3PDZm5Il3cETiahazJGBb1TS8LX+YN0/7kPXDs6LqVqDr7v5NfieFi/tL3E9JjmLKWOu+HJzOIVELiQitqTpdvCOll7SfevR6Se4ZMJlJkeBMDl+P6oMGXePZQ4MNR8UZYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6oJHWR2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6oJHWR2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85C9C4CEEB;
	Mon,  2 Jun 2025 22:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902324;
	bh=7ygqIY0hkxuONzbgzQUnvO6isdISsOfjdB10LcXkx2U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q6oJHWR2HZ9jbQXZh1SXuu8ud1e/g8On/Y0e3YTzF3iYh4P/gIenWRsNRbVHp5KVu
	 tdkPJ2qP7eEt4LTQbm6bL44ABi33nKENR5hFrLnSi0dmHxloK3W/DDSriX15Gm7up4
	 a8vBKICmNAYITyQNEIfQK3PLtHQ7wyXTTze8DS5UvNlFHf6roeBXvbOY+1PSsKgvXm
	 tmH2hjeRkag4lZUL1IMEGxJ1H7X4RIlg3Mvzj84jQ2NoyO0ypizG7FZLLibp2drw+X
	 vEaw/tv+AU9bDQGmobE7xT+Nrwt7XN55LvdB8YygnlaA+200dS+b9XGUi0lSz08h+b
	 mQh7C8I+85l+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADECA380AAD0;
	Mon,  2 Jun 2025 22:12:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: Make regs_irqs_disabled() more clear
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174890235755.925497.16281060573681784649.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:37 +0000
References: <20250422113156.25742-1-yangtiezhu@loongson.cn>
In-Reply-To: <20250422113156.25742-1-yangtiezhu@loongson.cn>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, chenhuacai@loongson.cn,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Tue, 22 Apr 2025 19:31:56 +0800 you wrote:
> The return value of regs_irqs_disabled() is true or false, so change
> its type to reflect that and also make it always inline.
> 
> Suggested-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/riscv/include/asm/ptrace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - riscv: Make regs_irqs_disabled() more clear
    https://git.kernel.org/riscv/c/91a072f84c2d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


