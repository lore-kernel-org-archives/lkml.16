Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA5A219A95;
	Fri,  4 Apr 2025 20:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743799264; cv=none; b=NvNqpjy5u+aUhqOW4z3js9oVnO1oOhjo5AIQUiBeTNckV0+owB5KRHJep21RwJZh+K0Xr8sEEfjqGzLzlttX6j/qntyimkMlXivls0b689UYZjfrdx9Kvq9lmUg7swU6VqV4VFXexowv/AMVgiLXLXL5vGjp3ZijkEtlpTMFgtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743799264; c=relaxed/simple;
	bh=oO6a+PolbHhF2/l4EP9dubRLRdHmOJmKuAsA59yXaxQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=B37M0eCIAT3MLb7g4BySz+hkQezl49NQik1onrv3+g3g+A1EwHA+sPHVd99/tUcO6R4If1Q8OIXPyeIat+63DCsM1V1W/Dn6sAAFI4ZiIxNPc/LLFtoVGA21h1xBX+lzZEORUFkRPDt/oMvC1oCVSQLEt9RYHkb7W6uQCvR37p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0oQKxjS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0oQKxjS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D789C4CEDD;
	Fri,  4 Apr 2025 20:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743799264;
	bh=oO6a+PolbHhF2/l4EP9dubRLRdHmOJmKuAsA59yXaxQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s0oQKxjSmtwzkS4GB/pAoYnPG+bAg6woFWZg1S8lgKT+zKn+2kOxGYFv5C7/LBWhy
	 5uLuKJ9PjR04L66Vhg0hdRXQKQ2es6j3avXOuFIX9UROhErAD7TkRIVdZLubN4xd9u
	 LIlqPvu9T5l9q4tD9nXrXw3k5Iy6RR3JRCrY0UNm0W1Yv2MKfEnxY/j2o8Cwulek2u
	 Nkjxwbsmw6vFJ05uFul5MLxXzk9FlDDw2R+dmknFPnz8I37RgCfRcBNeX/1dCtdW0o
	 Ex+079bjStQoPAb6lVclsU+hJ/osaGJ+CZmwjYuay6SfvXvVjX1+NbC5i6OCFCJaje
	 qLaVS7Z3VhGEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C633822D19;
	Fri,  4 Apr 2025 20:41:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/3] irqchip: Add Sophgo SG2042 MSI controller
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174379930126.3383526.7240371635899898248.git-patchwork-notify@kernel.org>
Date: Fri, 04 Apr 2025 20:41:41 +0000
References: <cover.1740535748.git.unicorn_wang@outlook.com>
In-Reply-To: <cover.1740535748.git.unicorn_wang@outlook.com>
To: Chen Wang <unicornxw@gmail.com>
Cc: linux-riscv@lists.infradead.org, u.kleine-koenig@baylibre.com,
 aou@eecs.berkeley.edu, arnd@arndb.de, unicorn_wang@outlook.com,
 conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
 krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh@kernel.org, tglx@linutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
 fengchun.li@sophgo.com

Hello:

This series was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@linutronix.de>:

On Wed, 26 Feb 2025 10:14:26 +0800 you wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> This controller is on the Sophgo SG2042 SoC to transform interrupts from
> PCIe MSI to PLIC interrupts.
> 
> Thanks,
> Chen
> 
> [...]

Here is the summary with links:
  - [v5,1/3] dt-bindings: interrupt-controller: Add Sophgo SG2042 MSI
    https://git.kernel.org/riscv/c/a41d042757fb
  - [v5,2/3] irqchip: Add the Sophgo SG2042 MSI interrupt controller
    https://git.kernel.org/riscv/c/c66741549424
  - [v5,3/3] riscv: sophgo: dts: add msi controller for SG2042
    https://git.kernel.org/riscv/c/0edaa4593efe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


