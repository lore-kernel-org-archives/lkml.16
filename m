Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BBC2BF007;
	Mon, 16 Jun 2025 14:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083091; cv=none; b=n5OUhx2NuQKGHR2daAkDNQ5XFlcBfbo5SKhYirFO/EDgNAA0J+8/IBCOieG/AgNHPNgszoNZn+GbSOMRBSx4Jke9czBM/RJs2cwe5koxj4IavYuWlXIv3zb6W+jOhbMGE01XUYzLtJXaYm5nJKkPWdAdQC90muxmima2XGUwW+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083091; c=relaxed/simple;
	bh=IUP7heul8CdkK3GwLu1iEDAC2mYsBEpFuxgs8jQf/7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPKh6A+n4EFRg6K4kyAznk51kGLmDS6jiwyaaZjdqSsblysPV14tY+l6uVlg3xFKxoJ8G8FVmCIhs/4gcz8dyb/RA++XR/rohfh6mhXSt97yFO/8k0fDnukzvASGIw/kM5fXYH11N5VNnlEorqQmJzLsqTIG+ouXcLIg7jALdic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4go/7/6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K4go/7/6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EABDC4CEEA;
	Mon, 16 Jun 2025 14:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750083091;
	bh=IUP7heul8CdkK3GwLu1iEDAC2mYsBEpFuxgs8jQf/7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4go/7/62bOhPvaSrgfaMLFg/oTDqUXfRXcM4FmLSxr9R1utmnA34V006NQP/dvkn
	 lMoh4vhnkIXWGSFmd7novw3e7eKyWauYVOItgd+Tx3oXipBS+ENNlR5/k+oTKrpMLN
	 FOIT9MuxDJxXNYh/HWHLJKBIA5n70ai1WHH9rm9ob03ZKwDokRUT1nnLIpo5RisKC8
	 w5k9sCW6956mVdKZDJ+sLjmdl5ErRN+Ohot1cDJ5E2Mt+TfPNb1NPUXDKAEofSW4Xd
	 tBbDhPq5i5+SF1+1Sm0Q5ZKPFHUJZXW5UmsCH31bKJh77bPGBG8SI9Vbzdb2HBVvHT
	 n/bGYbccj1FiQ==
Date: Mon, 16 Jun 2025 15:11:27 +0100
From: Simon Horman <horms@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v2] net: bcmgenet: update PHY power down
Message-ID: <20250616141127.GB6918@horms.kernel.org>
References: <20250614025817.3808354-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614025817.3808354-1-florian.fainelli@broadcom.com>

On Fri, Jun 13, 2025 at 07:58:16PM -0700, Florian Fainelli wrote:
> From: Doug Berger <opendmb@gmail.com>
> 
> The disable sequence in bcmgenet_phy_power_set() is updated to
> match the inverse sequence and timing (and spacing) of the
> enable sequence. This ensures that LEDs driven by the GENET IP
> are disabled when the GPHY is powered down.
> 
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Thanks Doug and Florian,

I agree that the code does what it says on the wrapper.
Although I have no way to test it's effect on real hardware.

Reviewed-by: Simon Horman <horms@kernel.org>

