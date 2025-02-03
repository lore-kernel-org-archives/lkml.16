Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB3220DD5C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610111; cv=none; b=O61PuGEgOm+mLSnvDgOk9idBgpip95i0fs3jA70kCc32JV1Kue31ZbkViPPe4YG8r9G1b/JiOaQYiM8L06DEBHqozsE1QoTD4D+cMfHqap960Kt3X+P+hVN72emMZUWvIKPCwL1TNZ18cbeZjRJHJYdrph3VGRX1QRgyHLDs/Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610111; c=relaxed/simple;
	bh=wYJsv6Ip8xBUuijIyu9SEbYTkFPxUHuia0rzAhiQbTY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gTA8bVVMMxLyjYDOJPrdef+LrfdZApagPxjZ3DLFyVF9y8siFKtgxt2hVowXLUJA6IeQHmSM5IFL8qLeyzN8KCPp6vYzmSWsI1/PxtRCr5W8i+AB76oRuWw6/57cN5GXW52DfQyZX9x1vOGknRyVDhtzDE7bIQLsoKWQBdzNSI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nT1V9ZuB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nT1V9ZuB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDCBC4CED2;
	Mon,  3 Feb 2025 19:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610110;
	bh=wYJsv6Ip8xBUuijIyu9SEbYTkFPxUHuia0rzAhiQbTY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nT1V9ZuBZz/M7OG34ICcaQlVBd2ecDEkC8PqR69ZQNryLFl35xKAJWIO2ArC9euaW
	 CY+XTGfAH3mIw3Pk/hf6u7etNb2IFyJ8i7qpxOINcV+FN2fY74nfhI647+ytKEYqN5
	 rv9NzVl6hy/uRylwN0CS2fkMA3tbL70TKOoOl6wtC4YdLzknbvrRCdYOdulzNjlZad
	 nxxJiEnwddUIqmbBcL29UiO39cii9KH4h7+Kql6MdicCoSaF696fpYS1WJyxiuwmMu
	 zwCVPZUvVBraATcDi5rbm/swneDjGZLA/yEfclo4+HrqQbFsmIItF0ncmZGSz6/0U1
	 P8eNfk+BBSbxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0C5380AA67;
	Mon,  3 Feb 2025 19:15:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 0/2] Improve interrupt handling during machine kexec
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173861013755.3409359.8865555054206741851.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:37 +0000
References: <20241204142003.32859-1-farbere@amazon.com>
In-Reply-To: <20241204142003.32859-1-farbere@amazon.com>
To: Eliav Farber <farbere@amazon.com>
Cc: linux-riscv@lists.infradead.org, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, tglx@linutronix.de, akpm@linux-foundation.org,
 bhe@redhat.com, hbathini@linux.ibm.com, sourabhjain@linux.ibm.com,
 adityag@linux.ibm.com, songshuaishuai@tinylab.org, takakura@valinux.co.jp,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, jonnyc@amazon.com

Hello:

This series was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@linutronix.de>:

On Wed, 4 Dec 2024 14:20:01 +0000 you wrote:
> This patch series focuses on improving the machine_kexec_mask_interrupts()
> function by consolidating its implementation and optimizing its behavior to
> avoid redundant interrupt masking.
> 
> Patch Summary:
> [PATCH v6 1/2] Move machine_kexec_mask_interrupts() to kernel/irq/kexec.c,
>                removing duplicate architecture-specific implementations.
> [PATCH v6 2/2] Refine machine_kexec_mask_interrupts() to avoid re-masking
>                already-masked interrupts, resolving specific warnings
>                triggered in GPIO IRQ flows.
> 
> [...]

Here is the summary with links:
  - [v6,1/2] kexec: Consolidate machine_kexec_mask_interrupts() implementation
    https://git.kernel.org/riscv/c/bad6722e478f
  - [v6,2/2] kexec: Prevent redundant IRQ masking by checking state before shutdown
    https://git.kernel.org/riscv/c/b4706d814921

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


