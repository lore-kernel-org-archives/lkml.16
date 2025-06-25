Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A517C2D1914;
	Wed, 25 Jun 2025 16:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750868717; cv=none; b=h/6JD59lc/ZTHQb0rKNbGBlvofErZpIIBRgVMJ56dWS3WjV3H+gRCK6XEWDx4t3iU/VMDb8kXofCBFf4VKX4Ho6/2U+OpUdQ/hHROSq2xh3KEM/63l9dNGlhinsnZnQey7ooKvSIPQkp2JoXPNXgZyTgn7hRLg/j/sZxmIWkO74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750868717; c=relaxed/simple;
	bh=DcUpia80dD22FIU+Vsxq9niSsPX5akSq5bFvOIWCgls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLsQsbwhUQKKth2HXBA1xS2Y606/ieslkH8YPfPxVUTHb97j4IcYK6BVsbvF/6hg9YolRHUvvFXvLGzH6YcHk2XkpDt9vu7kphkclmo8Bg413w2I4S9rUL0b8icgd6Jks3Hw0sA4ozGXAG2xHLHYl5ptDHy+7N99dUBXYBSqRlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJEnvfCW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJEnvfCW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DA0C4CEEA;
	Wed, 25 Jun 2025 16:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750868717;
	bh=DcUpia80dD22FIU+Vsxq9niSsPX5akSq5bFvOIWCgls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJEnvfCW2R0VNnM6ixVGrvqW4wMmo9QUbcnmYHVNpBPEsf4d1PR8ru8gqsI5ZN6uN
	 qGCLH4xTv/GeZj9+t1+cPjc3L7Ui6ltbiW+oeTljJ6biHCz2C8SybGLlkZN2ZedT9b
	 95vx6dkso9iEdRvJx3B27cXxQbtdZ+0ExMH8tSB5GWjKGol5j8AnssoivRScreSFsT
	 FOAKP2+WUuXjToicqMQwwkhdAGZo3Y5k3ZECzYOSC4F2C4qhPHY6MmQ3AYr19bX1CO
	 qUEuFZWdsmc/8rKjm4CZ4326AnDPorOkcHqx81572PWJiy59jQYritsSxJAaze9UtA
	 ny+VutT862tjA==
Date: Wed, 25 Jun 2025 17:25:12 +0100
From: Simon Horman <horms@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 net-next 3/3] net: enetc: read 64-bit statistics from
 port MAC counters
Message-ID: <20250625162512.GC152961@horms.kernel.org>
References: <20250624101548.2669522-1-wei.fang@nxp.com>
 <20250624101548.2669522-4-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624101548.2669522-4-wei.fang@nxp.com>

On Tue, Jun 24, 2025 at 06:15:48PM +0800, Wei Fang wrote:
> The counters of port MAC are all 64-bit registers, and the statistics of
> ethtool are u64 type, so replace enetc_port_rd() with enetc_port_rd64()
> to read 64-bit statistics.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> Reviewed-by: Claudiu Manoil <claudiu.manoil@nxp.com>

Reviewed-by: Simon Horman <horms@kernel.org>
