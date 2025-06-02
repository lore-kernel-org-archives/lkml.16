Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE6C2561DD;
	Mon,  2 Jun 2025 22:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902336; cv=none; b=gf+RBw6Le4xZt3TlbI/C6VGFSjiF7LhTwOh23aTiMKoatmR7HfWNHkoYAB2ss0Ep8cB64+R0M93ISuQPKWFNb9TOGyfIu/5nVoJnPUarJ9qH44+2VlJespZGuhJMdZh09jgrf3irO3YC7vUvccw9GJ1I9oTYt2LUBpwyyWWO1mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902336; c=relaxed/simple;
	bh=oG/UiFUWA2CqvQOK2ARMpa4mEoWVthtgPVqsti1O0Oo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JugwP2B9R1mJHXz5Amt3JFc0RgOOZOt2DDUVGJjtvA0GSoifsUQTVN2u8GY3arwlzZJZye1HClHTCAiGwMipuqkYbRpZ1rKKyXXx3sqWExzb+KmAEdjCcVPx4Sc/tllKZAl50OZgNV+tVlHZbkTxDjk21us3RAsjb9MiqL7IfQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmB4xxZH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmB4xxZH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549B5C4CEF4;
	Mon,  2 Jun 2025 22:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902336;
	bh=oG/UiFUWA2CqvQOK2ARMpa4mEoWVthtgPVqsti1O0Oo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GmB4xxZHsyuvyb4+fqaveZTQq7xVpKklKBTrXgXzY+GKelBSCqlDERwOOPvt4KfdT
	 1I7yWMmh0ti63XdnuujHENbzJmw7QmphAk754Z3FKEQB3MH96cENqefC2GozoWKa5h
	 9QfKSNnLL93l7DNg4WTjuN5Ua5FZeI9w2zMOyuOV8EaE3iNDVOeDfrwUfkJAYZGJMa
	 RUhmlk0+5E3H6zbygVGElt8fEAyMbYHKGbi8RTu8yyUhwT/6NXLgPk+HSkfSSYZkBO
	 SN/XhjsjF6Z4SxtI/liToaslP7hNTgNeR5nvUrvh1ZhJzOhPIRI7ZPtjloC9M2Om+P
	 Ax0YP8ktV7I1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B58380AAD0;
	Mon,  2 Jun 2025 22:12:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: hwprobe: export Zabha extension
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174890236899.925497.8016809629793459248.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:48 +0000
References: <20250421141413.394444-1-alexghiti@rivosinc.com>
In-Reply-To: <20250421141413.394444-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Mon, 21 Apr 2025 16:14:13 +0200 you wrote:
> Export Zabha through the hwprobe syscall.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 4 ++++
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  3 files changed, 6 insertions(+)

Here is the summary with links:
  - riscv: hwprobe: export Zabha extension
    https://git.kernel.org/riscv/c/a479a75e82d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


