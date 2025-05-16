Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3E0214A66;
	Fri, 16 May 2025 01:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747357973; cv=none; b=AoZUgKMYsF0+bJbPP6Zsz0i4rz4Ogy5gkPOc+V7T31QR4cl5DU+SgMSKjXfZpIXd/aSH33utSNtafnPq0Xzou3/2GbHDWcVrWzGrzRXgMviNtcXH4IOL3u1XBgFLCxtTv5uer/6JsdvcQ3TWOVXil3MS0+BnLwuwGZb67Qz1Qzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747357973; c=relaxed/simple;
	bh=vrJoauoC42W0q/MreXpaPkmNFQWMJpZKrOGNbIRxEJs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kazGVdCWp90+Wg6FRQxWXrCwp0Ap35T+1wwZd+Zkq0NTJZtaTnMfNcCFk1J3AWO08fFQ0YFKdhYKQSr48U+c2/b5u4AglVTblv00GJ1HJ/v2mpFs8mTPvPnMyZghXI58NYHTSnV8rM1Mj0wlT/H1kEXGJ87vgq0hAChNSSEl/lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmsNTB9+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmsNTB9+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C11BC4CEE7;
	Fri, 16 May 2025 01:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747357970;
	bh=vrJoauoC42W0q/MreXpaPkmNFQWMJpZKrOGNbIRxEJs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pmsNTB9+QdfI3Ew5sTOKxxsXlwJPs0rErUpL9T+Z6H/IUXxQhhfgew+9EotLh1t4+
	 s7HaRTPgxdHTWHdCxS1gnpekJq2Z5Ne0y9GgvqOpwCXiWABDaafmKBADiN3J4mO6K2
	 Xaqvx8Uz4cIa1NUjmgAa+OWSGJTch6kKpwIZ9h8YOhkShdJ7VCrxypgCTPpm/hXnHJ
	 7Q9YO8n0Fa8+oTUzn7Lae7sHsEPl3acBf1l8L00cymp/qAtp3pilOdSKBLVJJe4MAr
	 aaZp4GLIU1ifGWmGTI/yihvnRRf4HW4eYeO06l9CXqyv8O3j3rzhgw722MwIOJUoql
	 ZRpjFHiuKSJJQ==
Date: Thu, 15 May 2025 18:12:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: <Tristram.Ha@microchip.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Woojung Huh <woojung.huh@microchip.com>,
 Russell King <linux@armlinux.org.uk>, Vladimir Oltean <olteanv@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, "Paolo Abeni" <pabeni@redhat.com>,
 <UNGLinuxDriver@microchip.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v3] net: dsa: microchip: Add SGMII port support
 to KSZ9477 switch
Message-ID: <20250515181249.22e0a054@kernel.org>
In-Reply-To: <20250513222224.4123-1-Tristram.Ha@microchip.com>
References: <20250513222224.4123-1-Tristram.Ha@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 May 2025 15:22:24 -0700 Tristram.Ha@microchip.com wrote:
> v3
>  - rebase with latest commit

Looks like net->net-next made this not apply again?
-- 
pw-bot: cr
