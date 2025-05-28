Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0311B6CE0;
	Wed, 28 May 2025 01:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748395211; cv=none; b=ewpMP7sF50lVLL2sR1QnyrVVHVwN9jGxYQ+VFU+ElN9tvWsP+L6ma3HraHIDQ83mU2sxJHFik8w0EU/JghdM+vEP/mMMtSp/vlvAYqVFg4sz8PhmUUo5iIjjp4HrihmbismXHcq/6+fekgS0YVX+rmmgIdqYhKhbb9p8HVD1zys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748395211; c=relaxed/simple;
	bh=8mVbZenupNrDBA9XffigwaaXeZ4U8BKegxBu26ud++M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Q8S0vVKpMjtuDTCXdiaDjL1OVjWqzNu7PyJO/4M8MVfmevaGNnpVy0AhZRJbAGPdolvtjWTkk297eQ+UH6nSO4up+mkjyP+lLrgulx1uNQhRSPK9yE8XryoMklfRgV0Mm/KSNRBHKcbc4fr1UIb7Tv6qJMqpxQLEuy9295SD4aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLzCkLTJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLzCkLTJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C95DC4CEED;
	Wed, 28 May 2025 01:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748395210;
	bh=8mVbZenupNrDBA9XffigwaaXeZ4U8BKegxBu26ud++M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SLzCkLTJRZsESMNKUwHxaDkHEkDoEaQ1SGVG1aVYAVZlvhA6Ppq1iqLga2exZQVwZ
	 1DGf4LnK3tSQVX82q3icMRC726K6MMvUUbDSSkBCfrFIGzjWQc0baLz8DM8MkIDiIc
	 wHEZcRUzluciafbnR90QOBVB0E2mJDNRIuax6HsRux0W+/bdKktRxDDKkfB28yYRE8
	 XiXzvp0IgEdwUDeiAXGpk8vHaHv12DEtI6CoDtLieMWjsQh/0TWFnMhuEhmRWFoER6
	 mPHK+y0L21TZPzKKK7JTL3Z/kCCMFCpMeY///X61PdTFEY7W2VgcwWZk7Z6NpLxBbQ
	 3fJl/GDR5JjZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADBCC380AAE2;
	Wed, 28 May 2025 01:20:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] tipc: use kfree_sensitive() for aead cleanup
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174839524449.1849945.15708694230880656811.git-patchwork-notify@kernel.org>
Date: Wed, 28 May 2025 01:20:44 +0000
References: <20250523114717.4021518-1-zilin@seu.edu.cn>
In-Reply-To: <20250523114717.4021518-1-zilin@seu.edu.cn>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: jmaloy@redhat.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 jianhao.xu@seu.edu.cn

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 23 May 2025 11:47:17 +0000 you wrote:
> The tipc_aead_free() function currently uses kfree() to release the aead
> structure. However, this structure contains sensitive information, such
> as key's SALT value, which should be securely erased from memory to
> prevent potential leakage.
> 
> To enhance security, replace kfree() with kfree_sensitive() when freeing
> the aead structure. This change ensures that sensitive data is explicitly
> cleared before memory deallocation, aligning with the approach used in
> tipc_aead_init() and adhering to best practices for handling confidential
> information.
> 
> [...]

Here is the summary with links:
  - tipc: use kfree_sensitive() for aead cleanup
    https://git.kernel.org/netdev/net-next/c/c8ef20fe7274

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


