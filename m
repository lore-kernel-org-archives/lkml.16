Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DE9270574;
	Mon,  7 Jul 2025 05:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751867997; cv=none; b=PSlWwMTUxj/QHs48mYgYztZclK4sOmffc0q0s3eY3oXzOec/ICkqldo7WcTta4pk4y9AIu6TuSN+7U/xKA3/yy3AiNTq+B9tv+xM22GTh/SjwqYNZ/iFCZyCUzf6Z2i8z4rQ2ScM62g0/lt1rrS5KZzRSJkL/fCzv4WtIg7nUM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751867997; c=relaxed/simple;
	bh=rCSGVt5MG2J78FFUL2ZdYS66ktuOBCmymP5uqA+Bpw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pb6dgSv1cOGJ+LcRXj7/S+x0hfcwmU39Qxb+tvFRvvlDiGhKlbzXdCe8Lw1ZICjBId7+lO6yzrO41q4zkH0e+x2fObsztItWxperVKVQ3uzqO05GjfAWitr5UJUXpxL0zUR1+Z/d4gQFxi9Pa7n17CQ7cdGrJwZRPHnDxiUd8/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Pc+Prd8u; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Pc+Prd8u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=1Mo12jIp7JGdEvtjsw2OulO3/3LfrKIJdrPsh7bBfbU=; b=Pc
	+Prd8uRRGn3vPyj24SLIx2z/vxR16IRch5EJPI/NXNW9bNOWeLFTm1l68YI/NTY7xFLTYdSxDgrc3
	yynyqF3Kmtjcjw/TqyhrRhsnj9lF7L2jHEMEECKcQq3MEhxtiFE6grgkwXhaXM0l/61W8tKwDH4uK
	QEF71+OpQGxs4LM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uYetE-000gGj-GK; Mon, 07 Jul 2025 07:59:44 +0200
Date: Mon, 7 Jul 2025 07:59:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH RFT net-next 02/10] net: stmmac: Add support for
 Allwinner A523 GMAC200
Message-ID: <e04e30fe-6f7c-4e48-90bb-24bf3f2081ad@lunn.ch>
References: <20250701165756.258356-1-wens@kernel.org>
 <20250701165756.258356-3-wens@kernel.org>
 <c464d56b-dfd2-4e8c-a77a-4a0d05588768@lunn.ch>
 <CAGb2v65rDZ+V6EuZQ5NDrV7n0C-4CpHLXP_M9M2hA-oR4cMJUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v65rDZ+V6EuZQ5NDrV7n0C-4CpHLXP_M9M2hA-oR4cMJUQ@mail.gmail.com>

On Mon, Jul 07, 2025 at 11:06:55AM +0800, Chen-Yu Tsai wrote:
> On Thu, Jul 3, 2025 at 4:19 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > +     if (!of_property_read_u32(node, "allwinner,tx-delay-ps", &val)) {
> >
> > Please use the standard properties rx-internal-delay-ps and
> > tx-internal-delay-ps.
> 
> Since they share the same binding, I guess I either need to split the
> binding so that the new compatible uses the standard properties, or
> introduce them to the existing dwmac-sun8i driver as well?

You should get them for free from ethernet-controller.yaml. But you
might need to add a constraint that allwinner,tx-delay-ps etc is not
valid for this device.

	Andrew
