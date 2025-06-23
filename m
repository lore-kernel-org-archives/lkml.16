Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD8C1DB124;
	Mon, 23 Jun 2025 22:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750719579; cv=none; b=JbFYix4qnjKytbXcnf16H6nKrU6Pe9nJZXzlKfFHNcOTLh2fRlw3cuVlKkXhC+7HqyIeEOJCUufK96GUal9YAVrXYbQhj8R+jD5sRZDFWzndcj4Ua0VyAb+rWO4EEUtYHVZPfueqQSF/3RJIN6EcLnjDasDEDtleRNzVhX3Rcsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750719579; c=relaxed/simple;
	bh=V6O9jR94enokyQoZrQVB3eKEKSoxq0VhvDRGWXZ7JBc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PciQauCFtr6mxUWZ9IrZxFpAIOkQ4R4oWqgvuRxxhSiuTMMfmDgYwF0VHZtuZ4bCdYuP+gtUxKIayEbyOgLORC21Oewmgs0evOZ1N3dIn4/EL+hylxv1x37HTjwX8oiOBazCCL4fx/y5wDvQtJZOwHpPgJYi1pJJIK/UMqfXnms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=teScEJ9X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="teScEJ9X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AEFAC4CEEA;
	Mon, 23 Jun 2025 22:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750719579;
	bh=V6O9jR94enokyQoZrQVB3eKEKSoxq0VhvDRGWXZ7JBc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=teScEJ9XNgnmP+YdJzj+KLvKbZsYumKu+MQsKEcs9aWku6n4tTQ0G1oC3EZlDpdKT
	 6dm4cis2vEiM+FWttISYTtMazXZTaDoq0AsAw++6JrcCLNoaz+ja9/r3Zpa0UM+I1V
	 vr/oRM79uW1tYk85Uigj4JmC7MtK4qTb7EnJ64j21q5k8pI1bq/mg7XJpMGa0/0X6I
	 SfflSzQp+I2GZBID6apUyvcSrIUiiSZW7pgpaamXMHOrsTgx3iKFg2s1fggEgCYd7/
	 zg+mz9j0qixIM1+mZREWa9n0V4jGJvT5Vtod2CrgrSDEKGxXFYfVmWo1IvqHmllQk5
	 pPkaZUED/n4AQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD7F39FEB7D;
	Mon, 23 Jun 2025 23:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: netpoll: Initialize UDP checksum field before
 checksumming
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175071960626.3324858.13651157653887104882.git-patchwork-notify@kernel.org>
Date: Mon, 23 Jun 2025 23:00:06 +0000
References: <20250620-netpoll_fix-v1-1-f9f0b82bc059@debian.org>
In-Reply-To: <20250620-netpoll_fix-v1-1-f9f0b82bc059@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, jdamato@fastly.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 20 Jun 2025 11:48:55 -0700 you wrote:
> commit f1fce08e63fe ("netpoll: Eliminate redundant assignment") removed
> the initialization of the UDP checksum, which was wrong and broke
> netpoll IPv6 transmission due to bad checksumming.
> 
> udph->check needs to be set before calling csum_ipv6_magic().
> 
> Fixes: f1fce08e63fe ("netpoll: Eliminate redundant assignment")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> [...]

Here is the summary with links:
  - [net] net: netpoll: Initialize UDP checksum field before checksumming
    https://git.kernel.org/netdev/net/c/f59902070269

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


