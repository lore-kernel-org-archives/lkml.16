Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214EA2E763D;
	Sat, 14 Jun 2025 18:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749925804; cv=none; b=LxNBDZoSg/lXNVu3GmkuKP9niGb2YB+9x3RI5RVGBtV66aKprtWQDJpjrURsab7wcxtneT+tYM+w7FgM9rRnhHKu6Si4j5d/A4bkRlL0R3ef3wiZtt6r76NzhIzcn5KgrQduSL5mCdt0pMSDFFmqV1sSNPavEjzs2yIRXy1kVJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749925804; c=relaxed/simple;
	bh=gu0e+p4eb+oX+aP2FAx21feQ2rKQw2GjfLJjZ/kU1EU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jl3W5WLe335ofJ1A6fq1gA6lxzDvUaCKIm1wdg5U/r0PYJUuWcVzBMhrBfdKjkDabrHg4P2349esvfHjkknmU8bocH7AMnzoW/TpLQLXauo4icyXQlmyRVVubev1wwjHnu1pqUxN3sryi0/4YZL2XJ39HPKfd3AsijXcKGMVHTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWPn6g7e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWPn6g7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900F9C4CEEF;
	Sat, 14 Jun 2025 18:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749925803;
	bh=gu0e+p4eb+oX+aP2FAx21feQ2rKQw2GjfLJjZ/kU1EU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KWPn6g7eBs5Sqxau7XJCPrrXmIF8AooWqPumMjRra17ckn7zIyG5quFnMcpm1wICS
	 UJwWT8bwGsnmYeyunX1jOTZmEsOKQZQmqZVM6tVNSsxtI4IfKMOoLBqtinqcOWpCP7
	 pB4RGWdOSIWX9GVnXVz/fxSZAdLdic3/+AVRK5qamgf8sbfEIZWSO2AdR0e7wzg3QL
	 zsrp8qNqY44DuY9fjKc2zOROuSt5N/fEMdES3E3f5VpVgYecmcdb5ze/fm/4/JXux9
	 QHLWumz43fXoCo+Qu0mGnSsxExik6Hl1B1t1oyYM+H44XTif4UBMiyFpucm4zogWs+
	 p63w9K9LFFqOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FC9380AAD0;
	Sat, 14 Jun 2025 18:30:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: ti: icssg-prueth: Read firmware-names
 from
 device tree
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174992583274.1145273.14132783904581639503.git-patchwork-notify@kernel.org>
Date: Sat, 14 Jun 2025 18:30:32 +0000
References: <20250613064547.44394-1-danishanwar@ti.com>
In-Reply-To: <20250613064547.44394-1-danishanwar@ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, m-malladi@ti.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, srk@ti.com, vigneshr@ti.com, rogerq@kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Jun 2025 12:15:47 +0530 you wrote:
> Refactor the way firmware names are handled for the ICSSG PRUETH driver.
> Instead of using hardcoded firmware name arrays for different modes (EMAC,
> SWITCH, HSR), the driver now reads the firmware names from the device tree
> property "firmware-name". Only the EMAC firmware names are specified in the
> device tree property. The firmware names for all other supported modes are
> generated dynamically based on the EMAC firmware names by replacing
> substrings (e.g., "eth" with "sw" or "hsr") as appropriate.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: ti: icssg-prueth: Read firmware-names from device tree
    https://git.kernel.org/netdev/net-next/c/ffe8a4909176

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


