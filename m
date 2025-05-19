Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96002116FB;
	Mon, 19 May 2025 19:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747682770; cv=none; b=N3pfPWC0GTendh/e1SeIKgEFKA6ueNl+kv20wEiDLJK3i68aYI6SeZpENlQTD6b7FaY5zraAaNZGAeTpEgfBeH0rJVl4jK4QzDcGDkPktudK8P+xnF4fmVtI7jR0/0nxMKBQTg4cWTSzAS29B6fhLYEmQun8btwP3r802hh2v0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747682770; c=relaxed/simple;
	bh=TuZDdferYgryE5eM52otDGLgnYe7LjTCqbt0IkPyBy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhFp1jI0AeG/uhnSSk30/mVszGbJrnhPa4VGLUWNwicPB1fqWimsg5Bx9WrcTCUUZZ85mlHBMMKnoS45SRS8S3ttr8vRKN3Av/YsDQ4sLMoIK08j8rWVnO1ffig+uibYwmd7mhG6lOu9WHYS8XKEXoCdQ/iwa8spfY2VRznjzfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=iuWJLgsF; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="iuWJLgsF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=V/ChxHNdxHGa7PCVkQKYWwIJ8o1DVV/3CQmBnmO0tpA=; b=iuWJLgsFIr7a0Dbf6xa4akBst0
	BCqtmhb5x1fVYRVfOWGLUAeWIJlJ5YQ3vValSwGCPoQ1XhwMvY8f7GqB/sqUVcJ6uxGryxGRRMEdx
	PJTcmjCdqSu0hjAlGsGe4/gY0Lwhm70YQaovrG4Yr/aPtr7g4m3Af1HRnjI8Qp+DjlGI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uH67b-00D38I-Gg; Mon, 19 May 2025 21:25:59 +0200
Date: Mon, 19 May 2025 21:25:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH] net: dwmac-sun8i: Use parsed internal PHY address
 instead of 1
Message-ID: <d89565fc-e338-4a58-b547-99f5ae87b559@lunn.ch>
References: <20250519164936.4172658-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519164936.4172658-1-paulk@sys-base.io>

On Mon, May 19, 2025 at 06:49:36PM +0200, Paul Kocialkowski wrote:
> While the MDIO address of the internal PHY on Allwinner sun8i chips is
> generally 1, of_mdio_parse_addr is used to cleanly parse the address
> from the device-tree instead of hardcoding it.
> 
> A commit reworking the code ditched the parsed value and hardcoded the
> value 1 instead, which didn't really break anything but is more fragile
> and not future-proof.
> 
> Restore the initial behavior using the parsed address returned from the
> helper.
> 
> Fixes: 634db83b8265 ("net: stmmac: dwmac-sun8i: Handle integrated/external MDIOs")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Have you validated all .dts files using this binding? Any using
anything other than 1? The problem with silly bugs like this is that
there might be DT blobs with the value 42 which currently work, but
will break as soon as this patch lands.

Just stating in the commit message you have checked will help get the
patch merged.

      Andrew
