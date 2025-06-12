Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A222D540E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749759001; cv=none; b=HAPN8ZiWDxu4yik77BFoj/6VXNVt1jSHtviNtwVUM97zIcd981OdC5JOST5Xkb9CtaxyesLQEIJyPGqPJn9cap4N7eORWfnaRv8ZFR5Ke/edl3X2Jb69Mpkv4EaDfUn7KtYFubsLto1j3OpMIoCTCswC8yRvmsahDMpSIyu7mBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749759001; c=relaxed/simple;
	bh=cEauEdHSRITY1mKHYGeJdO5iErmfMhAiBOYbwM3zuwQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Yqj4vKSMoUC0QQxXeQQFDB5z6KAueHH0XdVMw3LOG7cq15LqRPeQrckWm/hvjlin0wRlnFLeqAXwrHEZgRG6DaktWpKFZm8MBlh/8yinNvAAZ6sZmHF8UJ3yb52WSmOjDhX3JG6yPLXnjqTObqdsqp/+DW5IQNLNZmJ4fEWF0JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TmY0fj8d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TmY0fj8d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22C8C4CEED;
	Thu, 12 Jun 2025 20:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749759000;
	bh=cEauEdHSRITY1mKHYGeJdO5iErmfMhAiBOYbwM3zuwQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TmY0fj8d2Xz+8jSW0dJjlaRQK6Cm/F9NWb/XrfvUwSJmdoXiMklAhpNPlXb/2tiRs
	 XsJkfDwsqk1y6fzKKTx1llR1MfUdUvdn8rkU/y+4DWjASdb6Stuyp3Agk3/sd+Zvwi
	 dNs6J7ia8SnUKfwSgUGE+ZQ9fCSvT5LP1eGuRd4tJTK3PapmRkKW/eZKVKYc0c4+hi
	 MsIp5v46SoRArmDFEwIwtfV6csvTzP+raMKawyyVTQ8aHm/sIvizTobFHBBvUV/PsN
	 tVfgrS7dub6PLyZUTtPmO7KMfWMqVW6XpjFo1e3aZk86g1zbiIgNdhKdOkG/6W6h+4
	 G+d3gbPTRcMpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC573822D43;
	Thu, 12 Jun 2025 20:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] riscv: vector: Fix context save/restore with
 xtheadvector
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174975903074.88969.14775699303771599132.git-patchwork-notify@kernel.org>
Date: Thu, 12 Jun 2025 20:10:30 +0000
References: 
 <9b9eb2337f3d5336ce813721f8ebea51e0b2b553.1747994822.git.rabenda.cn@gmail.com>
In-Reply-To: 
 <9b9eb2337f3d5336ce813721f8ebea51e0b2b553.1747994822.git.rabenda.cn@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 charlie@rivosinc.com, andybnac@gmail.com, jesse@rivosinc.com,
 conor.dooley@microchip.com, tanxiongchuan@isrc.iscas.ac.cn,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Fri, 23 May 2025 18:25:56 +0800 you wrote:
> Previously only v0-v7 were correctly saved/restored,
> and the context of v8-v31 are damanged.
> Correctly save/restore v8-v31 to avoid breaking userspace.
> 
> Fixes: d863910eabaf ("riscv: vector: Support xtheadvector save/restore")
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> Tested-by: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: vector: Fix context save/restore with xtheadvector
    https://git.kernel.org/riscv/c/4262bd0d9cc7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


