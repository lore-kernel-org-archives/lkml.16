Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC22E4A08;
	Mon, 12 May 2025 12:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053633; cv=none; b=UItw5Sk807hTKsEp/w8UXtDFM0uBR6ZYFlB1ZE4CI1B/j5uNYtu0qaIzxcTkGJrUY8Jr/XchAgwpg+6cvIXxn7aC39+ohD4RiaYxejmKl1LxaISOa1oY7RwdSD5M/FPrkK72/OxZUwkrEzW2RY47M26MYaWFguAoZ26iP1BBRhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053633; c=relaxed/simple;
	bh=/ukxj9qdimOgS8VFqzk+LcwsLVlKjsFYky8cJDTvX58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyXKk/G5dSHeeNWfljZVvycP2nD8c1rNFrIxjegGBj8jGKqJX6i0Kr28AeLQTw2HmMwkiQEu6v9lyInSdjQglm8vkYvHkyuoZ59NQMn9Y0uLPgIOLjEqbVA4iItlRM+dS+3YLjy/klmYT6v3M7PhYirwfkgZvLuGQUBU3XA74KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=dMHF7P12; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dMHF7P12"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lo0m91Rehd6bgZG0QLkCun4bgSY/wiPJXWGmO2i2Vw0=; b=dMHF7P12CyWbyi6Lt2DBaFT42h
	UltO+mXfugcoI/aNx0B9AUqY/vj281F7eA0tuVbbxFob3Mxi1rAgv4eFf9QwBOVxAqZGQmn8Ebx+k
	eUpy8a5Lm55lvr5ENppTsMzEEhQz3pz9bMaep8BP/CSOWJojFgmdixn2M4Vh7GgaYRQg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uESS4-00CKp0-VS; Mon, 12 May 2025 14:40:12 +0200
Date: Mon, 12 May 2025 14:40:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: leo.jt.wang@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com, leo.jt.wang@fii-foxconn.com
Subject: Re: [ARM: dts: aspeed: clemente: add Meta Clemente BMC] ARM: dts:
 aspeed: clemente: add Meta Clemente BMC
Message-ID: <224aec6e-6dab-4634-a7a0-220616f455de@lunn.ch>
References: <6821dbe7.170a0220.3b15e.ab77@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6821dbe7.170a0220.3b15e.ab77@mx.google.com>

> +&mac0 {
> +	status = "disabled";
> +	/* phy-mode = "rgmii-rxid"; */

This is very likely to be wrong. Please see:

https://patchwork.kernel.org/project/netdevbpf/patch/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/

	Andrew
