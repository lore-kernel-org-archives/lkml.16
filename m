Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293BE1CAA94
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045849; cv=none; b=l8/U9MD3vBPQS1GA0BKFjZblXdcOsmIs3gZpt4tcR+mNr7TXCJ0yCeoOVoi2qamCKRaGgvpu4bXOv7v6cZCqNHzAD3mnJ0/2FiqLhMrUUPqK+wMp3VDjj3jIiJxD9PK6saoovWiS47OAxD41pNkiRGpjPHtvhpzmwa60KTWlDyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045849; c=relaxed/simple;
	bh=P+Q3zsfmXB80OoR9rHZt4cwuULIBvbesypAsNo2uZuQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DQs+3LJZFTGua1yvz1SP2k89+p4aIiFQfUvo672n+FPPWbCMR+tQDgIQtqM4mIjH2yNDzFTp9bEGSUr8X11scgGTx0CyHbG+utiWz8DfWtId97FOXgGP4F318EKhDihIS7U+AF0gis4N5GN6OveolvrsJGfgbhBmfbdUYipizqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s5HyGyp4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5HyGyp4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99087C4CEEA;
	Thu, 27 Mar 2025 03:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045848;
	bh=P+Q3zsfmXB80OoR9rHZt4cwuULIBvbesypAsNo2uZuQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s5HyGyp47OKbQcm8FBidJYBbgqyw2hHr0lExJ3RP6ltpgOK5fiZXw3sRCjV7HUzJc
	 V8rliQy+psaD2iKjRqdlbCZNlYjqy8ItvFxO1qDaR1jzZC15wAjLeRhhzjxfakPwW2
	 tOjtUQvzuIhTwliNmSgSJj2Te1iX6RSbFsI+vHoV9oVrAKD0mD0WxEFjgGs9TI1tX5
	 UXTznAznMdSJ0WmzSe67iSZ8HsdS1B8Jj77N3r3HDwvvo8Aoqa6hWMDClZzTebEc++
	 K5NAkUH7FKE2D8wgHl7v++lExKCWfyjQgVj3Jy24RCh2SISuaj7kBAnDXI6YcyzljC
	 a2Fwy/AKS17Dg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BAE380AAFD;
	Thu, 27 Mar 2025 03:24:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] riscv: Fix the __riscv_copy_vec_words_unaligned
 implementation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304588473.1549280.17956945666756829574.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:44 +0000
References: <20250228090801.8334-1-tingbo.liao@starfivetech.com>
In-Reply-To: <20250228090801.8334-1-tingbo.liao@starfivetech.com>
To: Tingbo Liao <tingbo.liao@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, alex@ghiti.fr, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Fri, 28 Feb 2025 01:08:01 -0800 you wrote:
> Correct the VEC_S macro definition to fix the implementation
> of vector words copy in the case of unalignment in RISC-V.
> 
> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Signed-off-by: Tingbo Liao <tingbo.liao@starfivetech.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: Fix the __riscv_copy_vec_words_unaligned implementation
    https://git.kernel.org/riscv/c/475afa39b123

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


