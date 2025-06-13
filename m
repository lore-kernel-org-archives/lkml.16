Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7851420DD;
	Fri, 13 Jun 2025 01:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749777599; cv=none; b=QMdGBB0FHk3QH5H15yaB2YzTtylkAuHniF7gkQQy/1DyW7bvcHoF1tdWOAPOEA29wM4qzPnZCHjsC/BNwd0mYWWkASod2Jr9HWLbLT6fZt89Z246NeiukOE8Fo7ManyzNBPwiYePVxCbuagWf83WzS5IekKR9EuV7NfFUd5yeDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749777599; c=relaxed/simple;
	bh=r4mE97ua+bkOvUmTWRgQCtRNdee4YOd1InjvmIXuWH8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lG4FuI4nRB+WBEIz6e8URLQoChELrPqNkAlpJXg8JKtUiJgMjl61a83fSi0jhszYhoWAuAb0LKgIPgEPPJx9ITT94kWd2SMT9OZoqfTeVZIwFJuvWqyTgB6xPdmr0gzTncaFbh4KebW2YJugwS7R3DuPgf1R8nv2bq9MU8YvOu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b35X8M09; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b35X8M09"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA456C4CEEA;
	Fri, 13 Jun 2025 01:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749777599;
	bh=r4mE97ua+bkOvUmTWRgQCtRNdee4YOd1InjvmIXuWH8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=b35X8M09pnfbvYnyfomGmGYFUvR+aONRM1j6E+yph+2Vfzmx59MI/sQ+LI1wLo2je
	 6goO+zuuLO5wA+7LFWOrd6W5Cv5NRoxaDJF3pquW4GnU8fMhqT/mx1XWjh/0TH26lD
	 Ek0txaKJtybY3cPaqI4eKJQ3SNW7ymmM+eaV4CWC7aNwiany00JDyGmOst4AQ0AXkZ
	 wSWsrLPanDLDqViCgQAPKTmatbzAogjzV+j4gWjxKiEgIaNDqlF0oIT5RJ97Ftrvc8
	 aOjdLLwMrNNH9o0OwtEUP5C8mr+SbAyEzL+J8nQDLfaSDVy6xZp/AVf+4XiXjKNUAl
	 xRdUxMwZxTIzw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACBA39EFFCF;
	Fri, 13 Jun 2025 01:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] ionic: Prevent driver/fw getting out of sync on
 devcmd(s)
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174977762875.176894.10298712830260716394.git-patchwork-notify@kernel.org>
Date: Fri, 13 Jun 2025 01:20:28 +0000
References: <20250609212827.53842-1-shannon.nelson@amd.com>
In-Reply-To: <20250609212827.53842-1-shannon.nelson@amd.com>
To: Shannon Nelson <shannon.nelson@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, brett.creeley@amd.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 9 Jun 2025 14:28:27 -0700 you wrote:
> From: Brett Creeley <brett.creeley@amd.com>
> 
> Some stress/negative firmware testing around devcmd(s) returning
> EAGAIN found that the done bit could get out of sync in the
> firmware when it wasn't cleared in a retry case.
> 
> While here, change the type of the local done variable to a bool
> to match the return type from ionic_dev_cmd_done().
> 
> [...]

Here is the summary with links:
  - [net] ionic: Prevent driver/fw getting out of sync on devcmd(s)
    https://git.kernel.org/netdev/net/c/5466491c9e33

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


