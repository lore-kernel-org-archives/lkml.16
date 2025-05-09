Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DA526563B;
	Fri,  9 May 2025 23:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746834603; cv=none; b=QEQ6mIvXo22Ci7Bikte0RK3eijdt7oqQwfSHNDIbp2EuF2TQtcJhiu/+fEJOamhbvGgdy2Fy+uWNV4NLiw8ljuf0Phzc4xo7rwieX2kiLIUMCmbaSQPg3HMqNN7EXsv7tei2mUxN6W4C9X3Mnbegm7YlStXI4oe2mtsxEQG82U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746834603; c=relaxed/simple;
	bh=YUK/8lertmZS8O8LDqa8gucEQ9D2Gaa3JG0YD/8HGD8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=b49mkRVQOSzABOGnT82wx/ay6/LcK5McHq1EytiKTTJEJZvud9aOWZnCiEeqTaXR+W5KknChib6O8FcwNwBsQ5Npo2pYpPcBNnP/u7Od6FIkJGX6B9RVanhefp3b/AFV8TBkBRhdilvYhKKt/kJhYiZnHXtGTT83VELzshvLa2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3cGrImJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3cGrImJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEF0C4CEE4;
	Fri,  9 May 2025 23:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746834603;
	bh=YUK/8lertmZS8O8LDqa8gucEQ9D2Gaa3JG0YD/8HGD8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E3cGrImJ5XWRPbvM6qEhT4R+SnodIX6BpuNwAQP7WP3wTiNh1rBa/Ea11hnebMbhM
	 jKefvcePw8Y0x2AQrtDMDxUARUXlh54HH1edITyiaY57Ph+lzH7MxNOiNxYd7lL/ON
	 9ACS1B5z7+3Lvov400xqfNiQ69dC7z5qiyy1XToRdeRFJSsdcJAMlaL/smnINMIjQ4
	 42kgRaAYnfbSTmjUHp4XTtM+qmytl0xhERO1+Ouk7MCzsAaw3fM2lKDjGNCHc/B7Au
	 o1ICjdz6u9iAxbprNlvL0qGlzZiSZKuJ3O+n/8mKu4wFkH/VP1A0LFeBC3uKKhq65o
	 WSfIH2VRxIk9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADBD5381091A;
	Fri,  9 May 2025 23:50:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] dpaa_eth conversion to ndo_hwtstamp_get() and
 ndo_hwtstamp_set()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174683464150.3845363.10731862480731202646.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 23:50:41 +0000
References: <20250508124753.1492742-1-vladimir.oltean@nxp.com>
In-Reply-To: <20250508124753.1492742-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, kory.maincent@bootlin.com, madalin.bucur@nxp.com,
 andrew@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, richardcochran@gmail.com,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  8 May 2025 15:47:50 +0300 you wrote:
> This is part of the effort to finalize the conversion of drivers to the
> dedicated hardware timestamping API.
> 
> In the case of the DPAA1 Ethernet driver, a bit more care is needed,
> because dpaa_ioctl() looks a bit strange. It handles the "set" IOCTL but
> not the "get", and even the phylink_mii_ioctl() portion could do with
> some cleanup.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: dpaa_eth: convert to ndo_hwtstamp_set()
    https://git.kernel.org/netdev/net-next/c/b45bf3f84ec4
  - [net-next,2/3] net: dpaa_eth: add ndo_hwtstamp_get() implementation
    https://git.kernel.org/netdev/net-next/c/7bf230556bfa
  - [net-next,3/3] net: dpaa_eth: simplify dpaa_ioctl()
    https://git.kernel.org/netdev/net-next/c/c2d0b7da611a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


