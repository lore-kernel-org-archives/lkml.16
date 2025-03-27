Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B953C1F582C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045876; cv=none; b=IY+GSyVf2/6tb6kITXWBFO5F2+zrjpP2if7IwHY+jkkZbwo2REriBmhpwecm/prin9w2R2ipO3eUIIe6nZKPoBip/+iBXfJIqBr3M3pB3nmfwGhkLYIumdKK80tLkEaMH26sLlSBa1miZfd354lTNe1I7Wv78sEzgnXwTg7BCFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045876; c=relaxed/simple;
	bh=Bn/Uw0tcOtu+ptdfREC8J1+mUrr776utjD3xLOZbgEY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GltcC15BRTPCK67jO5KIF73ExyxFLgSKxbkGvlFmJqOeYvH+K+0SD8TWagEHFwj6Qv/Afie/BhIQieQ1jHA+NflXXaS+XY0sgHRb16Jc6m3Egg9W1cKQLcYtTxnZPImHXCMlk4DVXbuoDypsBMevdys84QZ+U8Ij48pKtSLHuPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rs6vK0Mc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rs6vK0Mc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9811EC4CEDD;
	Thu, 27 Mar 2025 03:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045876;
	bh=Bn/Uw0tcOtu+ptdfREC8J1+mUrr776utjD3xLOZbgEY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Rs6vK0Mc05loEiunJGgz7boRG9ds5YasZMOJzdSzQk320i6w+OqwsozSan9FA5j2L
	 HtgH9/J/F6tUCohLlKoZWpGeNYvX7RKXbPweexeJ8567SD840tbPyBBZM4j0UFKX16
	 gcG7tgpQwWbgUE0keg7aZyuVk9074/8cch0CTHJikwnfaEtWxu/he48HrYeFBiVkNO
	 SlpHjp3/5BBMeUdRJbNHeLatctOyR/i5mPJBIvSPgbs0Vb0a3A05V84TK2l8wTb+Xg
	 cr6lzQ72rndBVEyYj5Y6v5mwH3Rse92qBiXbL46syDeYlOKwrli1DQi/mtt9AwyWRx
	 ej7/3MYoeC9Og==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33ADF380AAFD;
	Thu, 27 Mar 2025 03:25:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: Fix a comment typo in set_mm_asid()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304591275.1549280.4529135035725430300.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:25:12 +0000
References: <20241114212725.4172401-1-yikming2222@gmail.com>
In-Reply-To: <20241114212725.4172401-1-yikming2222@gmail.com>
To: Chin Yik Ming <yikming2222@gmail.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 samuel.holland@sifive.com, parri.andrea@gmail.com, atishp@rivosinc.com,
 charlie@rivosinc.com, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Fri, 15 Nov 2024 05:27:25 +0800 you wrote:
> s/verion/version
> 
> Signed-off-by: Chin Yik Ming <yikming2222@gmail.com>
> ---
>  arch/riscv/mm/context.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - riscv: Fix a comment typo in set_mm_asid()
    https://git.kernel.org/riscv/c/418af0eafb48

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


