Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40F01F0E39;
	Thu, 10 Apr 2025 12:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744286726; cv=none; b=N59MMpwBwn9yxEO/C69UJs10fQy3rd0teRCYVhlfdCNCf3ztAodzrBLcJruHjUdLZzejuE+0PV1dnt8G2WX/ZPgR2+739cwa1hHEbn653X6xtNNdGB7eVBqoudQ0fnbB78vM4DWHD1k78sIvctJs9fwHMS+clu5ejN4HqaeK1P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744286726; c=relaxed/simple;
	bh=oguydQqh/i9zo//Wwmv3tgLeJsKX94cIvC8JLfiN8wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVROOaZJMEd/zdPzM9WNsvv+rC1ptJwICWUqO0S5oTM1FHfpW4iFcjYVwBWFDd/cU318eh6fNAcHXyK4xrHJZCbS6mekSwYDtezOXjmxdsrx4Jlw/fJ+GMlEUjQO5v+VtzDHENOYr6ScAmKmYGoultkTLFiXMaXbP3H68LwGmJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=4PHxi+mx; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="4PHxi+mx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=f8M2BZ6xWTPUrPE3k+Q7QJWWCG/1qH6NB4Nh6wNhTjo=; b=4PHxi+mxxKgnmRyr2mruYk2HhR
	GIOS9Ec7jjcHxaG8ZHG+vNr77uOzmwWbBmX62xD6swA4Hg1VffcrA7SR76ZPaJpuYtHZeCDjEbDYh
	giH9m7aoNW1W3PNi8iY3dDUyjWgkl2hi4tdcl/ASjtRSXu6gHCk7LwQPdIaTk6VFM7yw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2qed-008fvG-R5; Thu, 10 Apr 2025 14:05:11 +0200
Date: Thu, 10 Apr 2025 14:05:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jeff Layton <jlayton@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ref_tracker: add a top level debugfs directory
 for ref_tracker
Message-ID: <732485c6-b4ec-44cc-8627-c00ce2143b89@lunn.ch>
References: <20250408-netns-debugfs-v2-0-ca267f51461e@kernel.org>
 <20250408-netns-debugfs-v2-1-ca267f51461e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-netns-debugfs-v2-1-ca267f51461e@kernel.org>

> +static int __init ref_tracker_debug_init(void)
> +{
> +	ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);
> +	if (IS_ERR(ref_tracker_debug_dir))
> +		return PTR_ERR(ref_tracker_debug_dir);
> +	return 0;

With debugfs you are not supposed to check the return codes. It is
debug, it does not matter if it fails, same way it does not matter if
it is not even part of the kernel. If it does fail, operations which
add to the directory as safe, they will not opps because of a previous
failure.

	Andrew
