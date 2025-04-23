Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CEB265628;
	Wed, 23 Apr 2025 02:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745374206; cv=none; b=EQsST9VT35aFpX26lP5E72UmLECuBkR+0PTOPxFqytd4xlLOaVZMD/KaHozBR51DbLMg+5+hj9rvgUXPuy+SmBJzM5iXhGqpIt34B2zyFipqYJMua7fwX8ekvl87CaLSLbTjHgDoz2565Gmb4/BCdEbUcIEumxborC1+Po/M1fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745374206; c=relaxed/simple;
	bh=z+4TKs6uo1S6mEeLkbo/c9ij0abw3LdIZFxtwgDWHyc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WA00CV3fPlD8NgGnmylbt9dyzhPt51Zdk3faVfb0BiiAd9ZQYBfRQg8QgVimIrFrvTNKOpV+qiLM4E61nvA10OvMC2cPxZlIAiaWcj7MxWMz+i3WW3YaKmXFXLEyJ7CB2dNZMDf+bOxyNlWdFapeBE2akBkkIq+3cchSx2tuMTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICYLG/GX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICYLG/GX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74117C4CEEC;
	Wed, 23 Apr 2025 02:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745374205;
	bh=z+4TKs6uo1S6mEeLkbo/c9ij0abw3LdIZFxtwgDWHyc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ICYLG/GXT5nNddzeSAL+lHvEneauWbk2Revli77eExpERT7Ee0lP+07j8RaYov69W
	 VZBA1ZT9q8zpkvKIO1MyXfwt7H1F+kGS565n5RzNmzKGArYsy6k+/rXFLQXhtSJWoj
	 1i3RmKOS9Smu28dF3OUOE8HzCwazIebc2N1r0cHiIywsxIYIZrkayCQ2NS639XDGus
	 aY86AjVvbQaNmyT4A0lb7OjRWPZQp3UoxB5YpPTfH0ONHGMPI38HYIiEgybf33mmIG
	 WGaUtulQC+4dvUOFdY0EL9u+kIM5xpyS4S3mtZ70b2BTpu4PVKIfy/14SfHdqqmSxA
	 pfxad5YIpnZeg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E3A380CEF4;
	Wed, 23 Apr 2025 02:10:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ptp: Do not enable by default during compile testing
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174537424399.2115098.6784675802163723669.git-patchwork-notify@kernel.org>
Date: Wed, 23 Apr 2025 02:10:43 +0000
References: <20250417074643.81448-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250417074643.81448-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: richardcochran@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 17 Apr 2025 09:46:42 +0200 you wrote:
> Enabling the compile test should not cause automatic enabling of all
> drivers, but only allow to choose to compile them.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> [...]

Here is the summary with links:
  - ptp: Do not enable by default during compile testing
    https://git.kernel.org/netdev/net-next/c/a7696fb251c6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


