Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FA92AE66
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208871; cv=none; b=i9szfSXkhJKhpwznPQ0JJblQWJJcGUFhMEm86hRaq7Ft87HoFNB2ESE3ZrNrNCXLWc3Fg6OFv0R7hOSifTv8vX1YKGNJngXb/fXtKIv1u5FlZQVNNezOxdswj8N9SzN2RKm+35OB2NQGPwJ6ZctMOSWudl3PWRnjJ7tSy8J1E9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208871; c=relaxed/simple;
	bh=l9tHexwvz31Lw4jhr7OsllrHqICq0FQTtmKSRYkqDj4=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=A+Zim36hMpAtIeLrCR3Uo3XPGAxAO6ypWwDbu6mOBSPvNg+Db24l56cbCfIaUxeT/IGzJjMxzq7LSH2rSzyYgvA/lPJRyYc3rg+uhvszG/IOLLiq48KQDyeN5oodb8NEsWU5J3G0e7K+kSuxJFBUTahTKv6Kk+igeutPuZ6eThc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bg7hi60p; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bg7hi60p"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751208864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kDcARP6CMmcJuYEL59wH4tdcs7qBxPVhWeD7yb9xdM4=;
	b=bg7hi60p2EvQw+jlWo+D3xjgX3zrQRNhTbhDlO2wcFmGjZP6cjHZZte79RK5shv08wZFFW
	Io3C9z+9mSq5aFk4vnqW/l3baxaua94shRPOGy5pkw/B7FtOK25wuGiLe/m+p2BISHHFYV
	GstmwT4CHBvok5WTwh3dVZQDgQooqi8=
Date: Sun, 29 Jun 2025 14:54:19 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <15a39258ece1eee5f42ef6d244befd88f9671a08@linux.dev>
TLS-Required: No
Subject: Re: [PATCH net/next 3/3] net: ethernet: mtk_eth_soc: use genpool
 allocator for SRAM
To: "Andrew Lunn" <andrew@lunn.ch>, "Daniel Golle" <daniel@makrotopia.org>
Cc: "Sky Huang" <skylake.huang@mediatek.com>, netdev@vger.kernel.org, "Sean
 Wang" <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "Eric Dumazet" <edumazet@google.com>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, "Bo-Cun
 Chen" <bc-bocun.chen@mediatek.com>, "Eric Woudstra"
 <ericwouds@gmail.com>, "Elad Yifee" <eladwf@gmail.com>, "Jakub Kicinski"
 <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Lorenzo Bianconi"
 <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Felix Fietkau" <nbd@nbd.name>
In-Reply-To: <f9bec387-1858-4c79-bb4b-60e744457c9f@lunn.ch>
References: <cover.1751072868.git.daniel@makrotopia.org>
 <566ca90fc59ad0d3aff8bc8dc22ebaf0544bce47.1751072868.git.daniel@makrotopia.org>
 <f9bec387-1858-4c79-bb4b-60e744457c9f@lunn.ch>
X-Migadu-Flow: FLOW_OUT

Hi Andrew,

> Gesendet: Samstag, 28. Juni 2025 um 10:13
> Von: "Andrew Lunn" <andrew@lunn.ch>
> Betreff: Re: [PATCH net/next 3/3] net: ethernet: mtk_eth_soc: use genpo=
ol allocator for SRAM
>
> > +static void *mtk_dma_ring_alloc(struct mtk_eth *eth, size_t size,
> > +				dma_addr_t *dma_handle)
> > +{
> > +	void *dma_ring;
> > +
> > +	if (WARN_ON(mtk_use_legacy_sram(eth)))
> > +		return -ENOMEM;
> > +
> > +	if (eth->sram_pool) {
> > +		dma_ring =3D (void *)gen_pool_alloc(eth->sram_pool, size);
> > +		if (!dma_ring)
> > +			return dma_ring;
> > +		*dma_handle =3D gen_pool_virt_to_phys(eth->sram_pool, (unsigned lo=
ng)dma_ring);
>=20
>=20I don't particularly like all the casting backwards and forwards
> between unsigned long and void *. These two APIs are not really
> compatible with each other. So any sort of wrapping is going to be
> messy.
>=20
>=20Maybe define a cookie union:
>=20
>=20struct mtk_dma_cookie {
> 	union {
> 		unsigned long gen_pool;
> 		void *coherent;
> 	}
> }
>=20
>=20Only dma_handle appears to be used by the rest of the code, so only
> the _alloc and _free need to know about the union.

do you mean use the union only for the casts or using it globally for all=
 the access
to the dma struct (and so changing the return type of the alloc function)=
?

first i made here [1]

second was tried by daniel and is much more change.

OT: btw. have you took a look in the PCS decision case [1]?

regards Frank

[1] https://github.com/frank-w/BPI-Router-Linux/commit/ea963012375e4ac989=
47a703b5eaf21fdf221ee1
[2] https://lore.kernel.org/netdev/24c4dfe9-ae3a-4126-b4ec-baac7754a669@l=
inux.dev/
