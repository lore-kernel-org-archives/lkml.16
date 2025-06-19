Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246042459E1;
	Thu, 19 Jun 2025 22:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750373395; cv=none; b=p5Q5G82CML/bwSexJ9/NKabYFWyGV3IBM/LVwDg/sBFDlwLZHeHvLgPnXzDbnX77hF4czKGn7iaQq+0t6GzYRWtIR16Scoep4JGdcNNKPo2yI0mZjeY5zrS2OGbuiT5xbKpGoXXOky96QG5cHLeEBsuftmCCFoRnPvi4uCQwE/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750373395; c=relaxed/simple;
	bh=WIuuLBHy/pbN1MCAR8m2LUNQMMi1LBcjXHFZTwaBXoE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pXKqOUIWitibU1pNYQACMDA23Wv8u2/YeOln+ixYSaEnxAcKnsTTi+WnC1j3PObAGFKl6oVf/3ujDs4juKVbKWbqwxgWsrypU0O9eE5jdKA0sZxSwc1vUc1iF0HVy7uuRZB8tt7fiXjd23sut1EVQPrR90dUzGyDimNybPwBxXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cs4gk1yF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cs4gk1yF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2191C4CEEA;
	Thu, 19 Jun 2025 22:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750373394;
	bh=WIuuLBHy/pbN1MCAR8m2LUNQMMi1LBcjXHFZTwaBXoE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cs4gk1yFFeh+gg58nj6qhP/wyFLSO+3MFAHMr+tGBs24yhS9XfB481eWbwbik7OLg
	 1D3HLQeKMBm50aaMzEhaciW26u/1PAH3lFHfLiPOPreXiiayj7ezlo1uSMsCh71ImW
	 d+i8NVIDPgrTGXsMDvH4HMJApZFW9uOAQtyjBym+PbEXXWxSr5OFFztTyl4t6g0nWf
	 LtXIu4MUM652zYquy5haoW6IqooxJwsvgPYQkXjsJdYQDD7IYwzel4cVvv9RlJCFxP
	 R284MS2qqA4DgUUWIknyZU8UT/dS8UmSeVuGHVEO6J3kldUbyqy0o4bicJiyLGt2TB
	 gXvkerBBH5iCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADB038111DD;
	Thu, 19 Jun 2025 22:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: gianfar: Use
 device_get_named_child_node_count()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175037342249.1010622.11077748034889780108.git-patchwork-notify@kernel.org>
Date: Thu, 19 Jun 2025 22:50:22 +0000
References: 
 <3a33988fc042588cb00a0bfc5ad64e749cb0eb1f.1750248902.git.mazziesaccount@gmail.com>
In-Reply-To: 
 <3a33988fc042588cb00a0bfc5ad64e749cb0eb1f.1750248902.git.mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: matti.vaittinen@fi.rohmeurope.com, claudiu.manoil@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Jun 2025 15:22:02 +0300 you wrote:
> We can avoid open-coding the loop construct which counts firmware child
> nodes with a specific name by using the newly added
> device_get_named_child_node_count().
> 
> The gianfar driver has such open-coded loop. Replace it with the
> device_get_child_node_count_named().
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: gianfar: Use device_get_named_child_node_count()
    https://git.kernel.org/netdev/net-next/c/64f37cd57d7a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


