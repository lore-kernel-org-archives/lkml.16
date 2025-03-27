Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD231F417B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045873; cv=none; b=GCNrJvUDCF9iqVTBcbT+EwBCVkjxaQDgEbJoZ2UrZUAVN2nCKuXh8HXkdd4NBhFo2DDUQ2GNA2T2zjhZ1fxANxNRj1nbo6OPwJKVIvA/AZtVzg1IC+VlPyyUNJGOBhKM1QUv6XB1MCl+fI1+0Vod6b08prC+hjnqVDnZ/RyTafg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045873; c=relaxed/simple;
	bh=Zah0DPor/lTbT4fD9DmOugy4W028mG/0HwbpEZms31E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tG1jhiNHevy0j5rON6/RMYIjT49pTksJ9R8qmcMApxyo9udcgqk04ylc/f/igoBG+7VxOsACHUB1aBfgYVy6pHAcLjlBzdyC1Lj+Ld4SYiOe7to1vfCCgDqbDFs1pzVLftcw+FktJx+x9DB03KfaQK1H2SHFShAb9Mrx2Hk8fTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogUdIIZU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogUdIIZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9DAC4CEDD;
	Thu, 27 Mar 2025 03:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045873;
	bh=Zah0DPor/lTbT4fD9DmOugy4W028mG/0HwbpEZms31E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ogUdIIZU+dwA2y4NtWJsdlqF185ndDJeermdAeR/j+4718wF8KaCDC6+9zZiRsY3j
	 wb95J2N7Sgg63soY8TGByX6WL577wgjrM3JrHKeMOd3AzJMjCakbokfCGoZ7GaSndI
	 5MVGxQTEUcGxtKbyFSCKTQbwguuWsePQ9DoK7kXF/gf/yzeNu1Pj+ltaO9o6ObHFb9
	 OX71dbFuPm6dJdEFjcUML50+1X14YfM+aYaYeDgUHSLCkaRxGI7yQdZhbLCLdMkkDl
	 /Erd35gkwG5t9hTfKS7nXzq2Xpk1V07byxePBZkH9FN0+RYz5hqRPqmFJ6ww190Cb8
	 iW/VsqTpH5KLg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33A72380AAFD;
	Thu, 27 Mar 2025 03:25:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: Fix missing __free_pages() in
 check_vector_unaligned_access()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304590976.1549280.13819894845523945095.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:25:09 +0000
References: <20250228090613.345309-1-alexghiti@rivosinc.com>
In-Reply-To: <20250228090613.345309-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 charlie@rivosinc.com, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Fri, 28 Feb 2025 10:06:13 +0100 you wrote:
> The locally allocated pages are never freed up, so add the corresponding
> __free_pages().
> 
> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/unaligned_access_speed.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Here is the summary with links:
  - riscv: Fix missing __free_pages() in check_vector_unaligned_access()
    https://git.kernel.org/riscv/c/33981b1c4e49

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


