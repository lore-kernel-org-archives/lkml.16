Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613821B4227;
	Mon, 14 Apr 2025 22:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744671417; cv=none; b=RppYvu9p9Mq5e5VMEuXBwP4bur5eGqPHvpQ4yYU658mzh0vlXoO+K0J1QAnUqXfTsUoJz+o0d4q7+dowgL+nmwatjZXozbbqzXKfzjuM6WYn1icPN9qi9XQ0MPYQBZAmojvXWQvjKNMdApsAYpmy/eEf8rW4LDGoTlFY8Q515mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744671417; c=relaxed/simple;
	bh=SkKZFM7nlwMawFGvdPiTDYYerrSRQlIXzuWAlpp1oJI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=f0AfaXAkb1TJzoLzxQCmJEMak1y5Y0PMpD6q+7FB444j/lb5Jf/k3JetTRdcbz8gsSebTXNpA3bvR5Y1bl9XTexQmdyuM8qNh4igYn6ElpbviGAeItlOb9vLjjhbuAILDTxkrbOuK89TJ+sDV/SaqtMkdus6cJUF2k663Kv5RKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AI5gdb6J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AI5gdb6J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77A5C4CEE2;
	Mon, 14 Apr 2025 22:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744671415;
	bh=SkKZFM7nlwMawFGvdPiTDYYerrSRQlIXzuWAlpp1oJI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AI5gdb6JT2a2yBcU7KvTGOs5fpaJvEeWr2IzuOlMjLr5S7Hu6IgwE9EBvJLL0rCyG
	 qKSDmxOLs8uwZ7jTURO1in8PiUZAzT1LUIKajscnfKxWXXgUC+ZCuC92cJGRspc5Lu
	 zDOnXZDY4EBhLxxMDjR+zsIm57FXW8I3Q5rH9Nygmy6cWbH6/3p+XG6KAE1/b91fK+
	 nigbjPC8foI6KurtN91WFreM6IG3+vPu0rnWQ28ZJRoWP9FexU09CLLydXuNsTimdv
	 /Zf+HFVSLkeaQZd8LzoF9ZaXygQ8ZnSKC301HZLQDHd2eMNLr5WYDjwutOIL/CZ7td
	 EW44jNncQon3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB16F3822D1A;
	Mon, 14 Apr 2025 22:57:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] bna: bnad_dim_timeout: Rename del_timer_sync in comment
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174467145374.2060374.17090389080964951465.git-patchwork-notify@kernel.org>
Date: Mon, 14 Apr 2025 22:57:33 +0000
References: <61DDCE7AB5B6CE82+20250411101736.160981-1-wangyuli@uniontech.com>
In-Reply-To: <61DDCE7AB5B6CE82+20250411101736.160981-1-wangyuli@uniontech.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: rmody@marvell.com, skalluru@marvell.com, GR-Linux-NIC-Dev@marvell.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@kernel.org,
 zhanjun@uniontech.com, niecheng1@uniontech.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 11 Apr 2025 18:17:36 +0800 you wrote:
> Commit 8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")
> switched del_timer_sync to timer_delete_sync, but did not modify the
> comment for bnad_dim_timeout(). Now fix it.
> 
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  drivers/net/ethernet/brocade/bna/bnad.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net] bna: bnad_dim_timeout: Rename del_timer_sync in comment
    https://git.kernel.org/netdev/net-next/c/1450e4525f9a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


