Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30CB374F1
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918843; cv=none; b=g77mFJ6e6792Vv/mnkhdmpHGXn2qCnzntclX1VbQawX13r3PwUEy0SokJatn9VJiGw5ydDxAbY9bPeUEcy6sGwDvhKcnwx5vCpEU5Mw52vANNgUgPB1tvsdEuDu2UUwMkkRB0MbIIttjUmejrvVu1cgmSxB0LnxdrBCqjGWXeEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918843; c=relaxed/simple;
	bh=cTlGKDsSn3rOvWlt8dNyBLRaRwHPYX20eFugVmBS59k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4c0de62OALYNX6+qbgvOttKKTNxIaQ+UPWON1CmVwSTA91hCiIh7s6p6e8npezAqpg6Ih7a87uaaihnIuWDFnm+vjEZDdxfWmAYS7iOdnlgZ667OyUwzFqfbbEbr3B11W2sA8E4U3UIc+1R1QiSWrt339AqulUlJJMp03SKfAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1+JHExr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1+JHExr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8799BC4CED1;
	Fri,  7 Feb 2025 09:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738918842;
	bh=cTlGKDsSn3rOvWlt8dNyBLRaRwHPYX20eFugVmBS59k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g1+JHExrHVxMiE9t3nR2JEEC+rKqoEBZvW8AN7YYisIT8IUop4loW3VbubZSMqzP4
	 mSh39RXgmVWhOySZ7JD5W3YrVoRFyHECsPi0xhF5a7eR1fk/MoJUXiGZbTdh7oi68C
	 p8+1hsmcpKyU2xkqbYrFukHC5EgLkvBDvbBneNj+X/i1wXAllVHY2KMVQDDqzAcHMR
	 V7YKCM72WTjphDSeHC7QOqQf/dJsBBbK3N50agMyKlikFcigJuqvAWFQiDIIj7gRrq
	 HwwX9eko0mvtDFLNHBnTL8pItSCp4LX8HJJjBxPGHbIgVrjedd4NV5NHmvGQCh+Jne
	 sdgvEl2fhvddA==
Date: Fri, 7 Feb 2025 09:00:37 +0000
From: Lee Jones <lee@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Will McVicker <willmcvicker@google.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Nishanth Menon <nm@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: syscon: Restore device_node_to_regmap() for
 non-syscon nodes
Message-ID: <20250207090037.GF7593@google.com>
References: <20250124191644.2309790-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124191644.2309790-1-robh@kernel.org>

On Fri, 24 Jan 2025, Rob Herring (Arm) wrote:

> Commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> "syscon" compatible") broke drivers which call device_node_to_regmap()
> on nodes without a "syscon" compatible. Restore the prior behavior for
> device_node_to_regmap().
> 
> This also makes using device_node_to_regmap() incompatible with
> of_syscon_register_regmap() again, so add kerneldoc for
> device_node_to_regmap() and syscon_node_to_regmap() to make it clear
> how and when each one should be used.
> 
> Fixes: ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a "syscon" compatible")
> Cc: Will McVicker <willmcvicker@google.com>
> Cc: John Madieu <john.madieu.xa@bp.renesas.com>
> Cc: Nishanth Menon <nm@ti.com>
> Reported-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/mfd/syscon.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)

NOTE TO SELF: -rcs

-- 
Lee Jones [李琼斯]
