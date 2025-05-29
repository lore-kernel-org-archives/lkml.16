Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C5628DEE5;
	Thu, 29 May 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748513397; cv=none; b=u10Obdlej5vSQIjFDTjuB6Ax/Czxb6bRPUPkfkCl+XwixbmMDRnFn3Jmz8rCtiaQa3vEHjWyBqhrbk0wnVgFudZIwXc4y5WKcCwddTs01gS+A2nU7u5jDpoOCylK+m83Fk8z1ARUGUZ43wbBi4O2c1bVgBej1zSszNb9PEDPLrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748513397; c=relaxed/simple;
	bh=tDDF14MUq91tGPd3QEjRGe6rfJ9pvL7KTNIk3v2tUmc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qd1PjlEhEGNfJBrdEmT/bhm0lCm9IzamuYlAVL4kRSzpstT5NSAeex7v0SzIS2lS0MKj3ipelnCgr7Ngi5fi4pXqGW6NaHBZrwAa0ELMM78IkSkovqiusnB/H8mmPGh4PdCtJEf8GfYdlHo6ZfToamPtqHm6jkNP/p9eXEPu/C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTqoxso4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTqoxso4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74749C4CEED;
	Thu, 29 May 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748513396;
	bh=tDDF14MUq91tGPd3QEjRGe6rfJ9pvL7KTNIk3v2tUmc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WTqoxso4CTKBegMHxZdxpUhIEORX2gnMGe/DvfocfRGm9lhjh1wktihYM6YhcBePa
	 KxKPMkU4HPOOUP7MGu2G8RkFIJ3dkx1tYB9TfGw+c+DBaGChd30oKeKSKhyXiW0KcU
	 jWVXHjNbbmk92p/hk8IP83FKzvapVUWJLpQFggpOamRYMCyk64aECgAvrALdgVddTE
	 0pwTQNj525am3wvtiGKHMd5BN1C8rCR5xpj4f16p6xLXO3bXcVfNm/4zXLPP+fiYs2
	 NgbtBcBJUTQAIINGWFWd8Z1/M6Z5rUqCs6KR8DNE8cKw67hBkPkdGEEOWeSsp41z43
	 lTKqsDMikMb5w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D0439F1DEE;
	Thu, 29 May 2025 10:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] rxrpc: Fix return from none_validate_challenge()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174851343024.3214659.15855442080815222301.git-patchwork-notify@kernel.org>
Date: Thu, 29 May 2025 10:10:30 +0000
References: <10720.1748358103@warthog.procyon.org.uk>
In-Reply-To: <10720.1748358103@warthog.procyon.org.uk>
To: David Howells <dhowells@redhat.com>
Cc: netdev@vger.kernel.org, dan.carpenter@linaro.org,
 marc.dionne@auristor.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 27 May 2025 16:01:43 +0100 you wrote:
> Fix the return value of none_validate_challenge() to be explicitly true
> (which indicates the source packet should simply be discarded) rather than
> implicitly true (because rxrpc_abort_conn() always returns -EPROTO which
> gets converted to true).
> 
> Note that this change doesn't change the behaviour of the code (which is
> correct by accident) and, in any case, we *shouldn't* get a CHALLENGE
> packet to an rxnull connection (ie. no security).
> 
> [...]

Here is the summary with links:
  - [net-next] rxrpc: Fix return from none_validate_challenge()
    https://git.kernel.org/netdev/net/c/fd579a2ebbe4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


