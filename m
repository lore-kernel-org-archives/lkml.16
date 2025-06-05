Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977D920330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149417; cv=none; b=ozvZNySO+LIUlrIG1w61NGRkyA9GA7QzN95Sh6uDpbyPYO9nLbY/vltAglPoyFEmycAbVtEwYsY2bPFe3Jn7yplCADc5negb8Tyl2iEvvC+U+yLjJbiU4Hdm1jXhG21J7zZCrbn2MDvE7sDJltp66Ic1h6A87SfAI1S5eI6nm4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149417; c=relaxed/simple;
	bh=ul8uGIVqoA9GqmsCC7FvzunzA9M9vAIX7VNDjF8UFo4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QsM4D7GROBjd8LsmtTbRJEhL8O99wiFNydnQaGG8i5+I6TtcNrTq9SslyVMnmsloT5YxEhXEOpzHGuZ/75PuhH0zBPcm318/vSABsTBxoABHwy+3iXws0mXAt5hicRiOKJ33VA0zO+gCYUs48pm25HT+/ttNQw+P6bTEIOWzbZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6EWzSXX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6EWzSXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C9FC4CEE7;
	Thu,  5 Jun 2025 18:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749149415;
	bh=ul8uGIVqoA9GqmsCC7FvzunzA9M9vAIX7VNDjF8UFo4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=L6EWzSXXybjJIfZY9ElfC/9OBXU6KXi7/v6dw7BB6FESbBaWoiANooF8JeKgsCNmc
	 IO1X0KqdXLnSabBa0KwFSh7O8utnqcm7zXW/ZznbzZAKPV2h92vF0vhf/34Kzk+NYB
	 CNQ+TCwVchCAtKSSX8Gp59xE0awMzASHJEv5wfLd/kkZ4eAyjmd5ocSyiNKqGWVY8r
	 4MvWf6iiGMkLSqtQXZdQcUcaUemE1dfXNKgFfKEluyLbjboSA311eRlj3+pVrSqTHo
	 i/Fp3bhQ2Jm/uTi1Hyg/Blzx6J1gAe3b8YoTVWwNMrin0mNXVc0H5IkQPVEk+9Jy/Y
	 qnihme2NuL8zw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E7339D60B4;
	Thu,  5 Jun 2025 18:50:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/3] riscv: misaligned: fix misaligned accesses
 handling in
 put/get_user()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174914944698.3195461.8348597570528832946.git-patchwork-notify@kernel.org>
Date: Thu, 05 Jun 2025 18:50:46 +0000
References: <20250602193918.868962-1-cleger@rivosinc.com>
In-Reply-To: <20250602193918.868962-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, macro@orcam.me.uk, david.laight.linux@gmail.com

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Mon,  2 Jun 2025 21:39:13 +0200 you wrote:
> While debugging a few problems with the misaligned access kselftest,
> Alexandre discovered some crash with the current code. Indeed, some
> misaligned access was done by the kernel using put_user(). This
> was resulting in trap and a kernel crash since. The path was the
> following:
> user -> kernel -> access to user memory -> misaligned trap -> trap ->
> kernel -> misaligned handling -> memcpy -> crash due to failed page fault
> while in interrupt disabled section.
> 
> [...]

Here is the summary with links:
  - [v2,1/3] riscv: make unsafe user copy routines use existing assembly routines
    https://git.kernel.org/riscv/c/a4348546332c
  - [v2,2/3] riscv: process: use unsigned int instead of unsigned long for put_user()
    https://git.kernel.org/riscv/c/020667d661f9
  - [v2,3/3] riscv: uaccess: do not do misaligned accesses in get/put_user()
    https://git.kernel.org/riscv/c/ca1a66cdd685

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


