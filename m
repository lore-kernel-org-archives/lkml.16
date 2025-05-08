Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D662284667
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746723090; cv=none; b=bsV0IcsVoFhaNNxEj5H7v5gn78Zl5Du+quwiTro5m737/b80EqFKzx2HW40J5fLMB+64QPpsCaQocpwFIZ53lIvfxy1rhJ1ERbq/bSGPhdfpKzoJyPnVw479wfO36oJytjkFpE3TCgwFGJI23ctIxm2z3225ktGocm6cvs1oW7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746723090; c=relaxed/simple;
	bh=YiJPxFVH9MriN3MHinddIsL3bUEwnFXdV+9UivOrkRg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=l6YmXjxlW+1MFs2o57bOfx3JmQfe8kEQNBmSqGCgeh4fq6+FPc6YB0VbhWwU3jLrz5XKE8Sy1VyZ7Jv32oiWGB9WOB8zE+ZLdGqAZVGtKcHAnDsoFTVt9ZadtdPEpw93IlUISw/PaSLiVsDisD86IydObEiNSXC5Gfj7pBB8cds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLsycetw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLsycetw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F36C4CEEB;
	Thu,  8 May 2025 16:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746723089;
	bh=YiJPxFVH9MriN3MHinddIsL3bUEwnFXdV+9UivOrkRg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DLsycetwDmsyPJB4WHamckxwZkopiBLA00sfuxrLv7euXG1RDBDHK1RMKWkaG39FN
	 jhu0vU6fNkMfd7Gly8UW7gZzR27UMZ4SbqemCsJpxqwcMqZ+pteX5w13TGS6v1AIP4
	 wgjCOcXropBQMZOcMyPr9LuVBF9kBqle1+KSmrfx0qAROATlKnopIx+BvkAgUeOB5S
	 2ssea/yyezjU2DLH+RCLa+lyR/QyMC1OYXkFw5FTaOq1wYT4MMFMd6B9Nq4eRccyVf
	 iUgMIRtrLX4mDHRoa8iLGQ3ucQVlAmw51FU9vIM+OzGl2CSSy3BwYcTjvdob1WYGf5
	 9KD7Oh9bkhhjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF08380AA70;
	Thu,  8 May 2025 16:52:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: Disallow PR_GET_TAGGED_ADDR_CTRL without Supm
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174672312824.2976395.79446860575493569.git-patchwork-notify@kernel.org>
Date: Thu, 08 May 2025 16:52:08 +0000
References: <20250507145230.2272871-1-samuel.holland@sifive.com>
In-Reply-To: <20250507145230.2272871-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, alex@ghiti.fr, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, bodonnel@redhat.com, charlie@rivosinc.com,
 conor.dooley@microchip.com, joel.granados@kernel.org,
 paul.walmsley@sifive.com, cuiyunhui@bytedance.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed,  7 May 2025 07:52:18 -0700 you wrote:
> When the prctl() interface for pointer masking was added, it did not
> check that the pointer masking ISA extension was supported, only the
> individual submodes. Userspace could still attempt to disable pointer
> masking and query the pointer masking state. commit 81de1afb2dd1
> ("riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL") disallowed
> the former, as the senvcfg write could crash on older systems.
> PR_GET_TAGGED_ADDR_CTRL state does not crash, because it reads only
> kernel-internal state and not senvcfg, but it should still be disallowed
> for consistency.
> 
> [...]

Here is the summary with links:
  - riscv: Disallow PR_GET_TAGGED_ADDR_CTRL without Supm
    https://git.kernel.org/riscv/c/7f1c3de1370b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


