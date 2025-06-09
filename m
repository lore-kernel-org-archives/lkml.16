Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70F322172F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 20:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502550; cv=none; b=CJ90pAK19mI0oaZrhF0UOR4v3JbO/8DO9nwKG4POdz9ISfxEJBUDcmWmNa7Cy7Tlj6OP3oKznpGoub1GdqjV0QoSA4QPFxKtFRdNk8D2StjGONHiuhdIF9Ni5UtUvTA+U51qVq2cJNcokhgO9jvvgYMTWW6E0pFSsguaGr89fgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502550; c=relaxed/simple;
	bh=cqTQa8rm+F++IDXEr692KrwmjAEZKagK+bHhQ+bzCU4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LVeb1XW2/SHr7nZsOBVbjIVZH8/NiwQVIRLYaq3YzhGml3Dbiudy31oBSTZDu2IoXOvROrmobc4t+feQDmkYLDj96md8B+nC3YvftTiEnq2dv+diJt+KMzU2pNpyTjs5SYiadjTtXTmMSwxwdBE+CjydagUGy1ZENhuBXbm/Sl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1EBetkk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1EBetkk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B32DC4CEF0;
	Mon,  9 Jun 2025 20:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502550;
	bh=cqTQa8rm+F++IDXEr692KrwmjAEZKagK+bHhQ+bzCU4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=u1EBetkk6hR9Qmt5jAU/OlotzWfZAXdel5V1WwcDhfWXEHt3KQrqjj8vgNXTxnVNP
	 wAa9BFAz7NskMhX7Q0uLI+hBmhEbZovh1maS1jFnKpFOHbID83GbbjB8jzS7k2z0S3
	 6707+6vAjgriU7A8nTfRBWTWIPTyDalIpd9Y8xjh0cLwVfB4dY6SyIOvQyzCsYIpJx
	 v2muC4yJfkEh0YxKCczO0ZAYLvin2GFNe3DinFbbrfuI58SRDGmSk2b4ZmS61rkF/k
	 XW0WsBg8hLAc0dBolf3EjpMkqG8WMuXVcGs4xMDfUJfsrAff0qf7FPsreqy72rI12f
	 th91gtHZ47qdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33AE83822D49;
	Mon,  9 Jun 2025 20:56:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v3 3/6] f2fs: drop usage of folio_index
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174950258074.1531626.9419516015634434009.git-patchwork-notify@kernel.org>
Date: Mon, 09 Jun 2025 20:56:20 +0000
References: <20250430181052.55698-4-ryncsn@gmail.com>
In-Reply-To: <20250430181052.55698-4-ryncsn@gmail.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org, kasong@tencent.com, nphamcs@gmail.com,
 david@redhat.com, chrisl@kernel.org, hughd@google.com,
 linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, yosryahmed@google.com,
 hannes@cmpxchg.org, jaegeuk@kernel.org, akpm@linux-foundation.org,
 ying.huang@linux.alibaba.com

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Andrew Morton <akpm@linux-foundation.org>:

On Thu,  1 May 2025 02:10:49 +0800 you wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> folio_index is only needed for mixed usage of page cache and swap
> cache, for pure page cache usage, the caller can just use
> folio->index instead.
> 
> It can't be a swap cache folio here.  Swap mapping may only call into fs
> through `swap_rw` but f2fs does not use that method for swap.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,3/6] f2fs: drop usage of folio_index
    https://git.kernel.org/jaegeuk/f2fs/c/fe15ec046431

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


