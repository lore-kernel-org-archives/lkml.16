Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC781DE2DE;
	Thu, 10 Apr 2025 00:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246797; cv=none; b=sXupiTIsIKmf11jTjW+pyN4BdUI75QGQpVGbeUZUBP4FpccYI0g+APrFO4YFejxS2dz2+vHiQCTijZWoR0BZwZZyKLHQ7cej00hOAy8GHG0BS8aagIcjbgzT6Og2FHIKljVpjxP39aIxDFTEdqA0HRCKmuaJBbYT5KvvlW6LBiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246797; c=relaxed/simple;
	bh=+yBmpUJB8UdPn4K49dxlxLfyOURxdDin3RNVgN91quY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hW9aBv9kcuhs21k1CvC5OKMi+3hZ2ID38rSokDdwZWTiIv7YN9ILXbwn9wzY3JzB1NPjKGsxTWTzASEzn1EOXLxgDHwrBmz3pDQO77KlRC8OsCDCK+Ca4IfQqs75ltjw0XAsvmOfaeUby5xrA+HV/Mww3yGL3m002bxhHj9DyDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkYJkTdq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkYJkTdq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D89C4CEE2;
	Thu, 10 Apr 2025 00:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744246796;
	bh=+yBmpUJB8UdPn4K49dxlxLfyOURxdDin3RNVgN91quY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AkYJkTdq2Z27g5R41FUUqA7wMYZsGNH6hwkf05P8Y8Z4hSykm/hSlqKKI2COtFGyo
	 wpG5+Ge0KrQcgkB0bJaum0bAh1JKsHSfiI2XE7N/foxUmq2mqWY2eR01i82QScD3jd
	 OLFYPChxcjQGk8KKrcJSv00q4QIDX9GoTDBsN77JgbfLx22v/y8mc6YEos3htp29rG
	 Mr3w4QTMEfjlrCRQjHTCWbqhN5WhkJb5MtUniinbmd5xjanBKauVYVh+kgg9FQE9C7
	 A/G1bbaPPP8ujJE9p9q2H+lI8M8xJBH9gqB9CPYZA/YiZt52jggp4H07XhikE5F+ii
	 YKhOVmmvUHvZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5CB4338111DC;
	Thu, 10 Apr 2025 01:00:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: remove __get_unaligned_cpu32 from macvlan driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174424683419.3096919.13087620220711396552.git-patchwork-notify@kernel.org>
Date: Thu, 10 Apr 2025 01:00:34 +0000
References: <20250408091548.2263911-1-julian@outer-limits.org>
In-Reply-To: <20250408091548.2263911-1-julian@outer-limits.org>
To: Julian Vetter <julian@outer-limits.org>
Cc: arnd@arndb.de, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  8 Apr 2025 11:15:48 +0200 you wrote:
> The __get_unaligned_cpu32 function is deprecated. So, replace it with
> the more generic get_unaligned and just cast the input parameter.
> 
> Signed-off-by: Julian Vetter <julian@outer-limits.org>
> ---
>  drivers/net/macvlan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - net: remove __get_unaligned_cpu32 from macvlan driver
    https://git.kernel.org/netdev/net-next/c/e4cb91178023

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


