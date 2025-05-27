Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4C51EA7DF;
	Tue, 27 May 2025 10:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748342665; cv=none; b=juySLtQdow07rSJ4aKrSEA7bS3+sBXqTYoEMilRrcnWadNV6UdGza2lFZ11GBIaqg4UOpORhlbEqRujZ5vsf4qrh5pckK2iWSihWPK5LtmlBALJp2xQ0m0kVUe2la5sYw/peleeFHwIov2tqeWZgN4t6NjcCfguf7gftbLrUOgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748342665; c=relaxed/simple;
	bh=BiKsIF7qyIqH+nKWRGgd3o6WJ/+I6qpX6dPcNBsoy1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMokv6ZnJa7Lzq+rWSfGXFL12LiogD3gW/tKg0mTyU5zR0ZQ8RHG3xX7T987Ac/27grMtHC+m7VR4R5sFA2wHp5QyseWIb/e1Z65qSsf3XCJ4W5hzxQe+7jASTEJx4SsAfNnWFdFtwBx/6PG//l0jaYpn9vMz2ljKo6cClkjmMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gu8oMO/9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gu8oMO/9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C007C4CEE9;
	Tue, 27 May 2025 10:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748342665;
	bh=BiKsIF7qyIqH+nKWRGgd3o6WJ/+I6qpX6dPcNBsoy1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gu8oMO/9C9fbq2G/yh6bUAXPKlOKqqJzIlXunY0by554ks38+92G9ZzzkcYRIiPMA
	 WEYmEt8OOGRUUzMR/Bsnu6mr08MyNsDA2x9mZc1P4TE9+JmO/SIn8mYYRGML9lh1+v
	 w1OlxyZ3X3CL/lu/sNeHYUG01+OAMTtXQscyRJJWDkep0/oGAEaQCEPnzFRRGuwhkq
	 O7nSoI0KzW9eRaIIwVzme5JdYDXztQZY0v3pIIRI8vXgDBN2pmrSl4Dn6WVPdLpkln
	 tFfS57Cu7GRLGGQdEchiS9xCWhQ4NNDDBB/h0ZR/E/ljRKiq1UAIBjvrCh623wJPSE
	 uShogrxj6tqEQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uJrnH-000000000bu-37fE;
	Tue, 27 May 2025 12:44:27 +0200
Date: Tue, 27 May 2025 12:44:27 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: alejandroe1@geotab.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: gnss: add u-blox,neo-9m compatible
Message-ID: <aDWXi7qBnkt3nTNW@hovoldconsulting.com>
References: <20250523-ubx-m9-v3-1-6fa4ef5b7d4a@geotab.com>
 <dfd63c64-184e-4e48-9344-a3db0612036b@kernel.org>
 <dd1540f7-f4f8-4cf4-a448-aa91b71dd42d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd1540f7-f4f8-4cf4-a448-aa91b71dd42d@kernel.org>

On Tue, May 27, 2025 at 10:35:14AM +0200, Krzysztof Kozlowski wrote:
> On 23/05/2025 13:52, Krzysztof Kozlowski wrote:
> > On 23/05/2025 13:19, Alejandro Enrique via B4 Relay wrote:
> >> From: Alejandro Enrique <alejandroe1@geotab.com>
> >>
> >> Add compatible for u-blox NEO-9M GPS module.
> >>
> >> Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> >> ---
> >> This series just add the compatible string for u-blox NEO-9M module,
> >> using neo-m8 as fallback. I have tested the driver with such a module
> >> and it is working fine.
> >> ---
> > 
> > I assume there is a user somewhere?
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Un-reviewed. Please drop the patch. It turns out there is no user for
> this binding. We don't take bindings for every possible device out there
> - you need users of that binding.

No, we don't require manufacturers to upstream their machine dts.

I'll try to take a closer look at these patches next week or so.

Johan
