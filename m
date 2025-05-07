Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DD72165E9;
	Wed,  7 May 2025 07:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601666; cv=none; b=oP54GXvPbxY9B96xyLiRHXaHb5vMPGjsXsTT8P+27FQ2X0eaj3k1bdSyJOcMjyq0vfPkqJff1dgetkKpAHWe0TXzKkyhOtjImE73GxsmRjc6hgfUNmVRS9EtfQeYHDFxKOVmotDN74w3q+hNJTf//VIplpczTrd9EKcmTSv1VZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601666; c=relaxed/simple;
	bh=cRIStsaa0AZh2Bu8bbYl44E6frjm/72zgUBqPYFB9/0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pX9mYgbmamUxS0OTt4+NTk4ZKJZ2FvcbhgfOiVNW0qVx83dDTnx3bVkn1D2630pF+79ARyBwwerBz6mYWH62FYSS8ObUw+cE6e2DRrBR36kAfcFy9HN1pXEYCt8WFYg7cEDAZnNleGh8xdpVCRgfGSilqrqDfAzffDtMnNGIq8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=EYUatmxy; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="EYUatmxy"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 04D7225F40;
	Wed,  7 May 2025 09:07:35 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NK8Ks1rz7fSl; Wed,  7 May 2025 09:07:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746601652; bh=cRIStsaa0AZh2Bu8bbYl44E6frjm/72zgUBqPYFB9/0=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=EYUatmxy4Ns11dDZA5E/dquOhEu3sUWpXXHIIMyj7V8Wm3jnPshfH10TA1iQjF9qy
	 0pQGNZHY2zOsSyQvE+6nAlX2mkV6J9ys1QYyXPVZWTwRrfcGplflYel9kGgdjYzfwq
	 tzQE/K/4pSTATPD7WvwlLCgO8pXlNCj0E7FMTXsn3UGr4GDDvyOburIr+Mq3kKyXPk
	 w5wY6OdzvG8D2uvE+n60CtvmGY3FX7sQnH//pC4DYQSSQ2voea99EuwJHD5nLz9LWz
	 W2qJOVElt+XR2gFv6EzM2pwG6+Ff8WQ55Ybvt5UWwBrzFbgW04TwwxB88mJQT9chfY
	 8l5MfviK6OTTw==
Date: Wed, 7 May 2025 07:07:15 +0000
From: Yao Zi <ziyao@disroot.org>
To: Yanteng Si <si.yanteng@linux.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH 2/4] dt-bindings: LoongArch: Add CTCISZ Ninenine Pi
Message-ID: <aBsGozWwg_WQfe4R@pie>
References: <20250501044239.9404-2-ziyao@disroot.org>
 <20250501044239.9404-4-ziyao@disroot.org>
 <7e56091d-0e91-44ef-b314-facb102ee468@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e56091d-0e91-44ef-b314-facb102ee468@linux.dev>

On Tue, May 06, 2025 at 04:58:50PM +0800, Yanteng Si wrote:
> 在 5/1/25 12:42 PM, Yao Zi 写道:
> > Ninenine Pi is an Loongson 2K0300-based development board produced by
> I think "Ninenine Pi" doesn't make sense. I browsed
> <https://bbs.ctcisz.com/forum.php?mod=forumdisplay&fid=2> and found that the
> Chinese name of this development board is "久久派". Interestingly, its
> selling price is 99 yuan. In Chinese, the Roman numeral "9" has the same
> pronunciation as the Chinese character "久".

> It seems that you intended to name the development board after its
> selling price.

I've confirmed with the vendor that they call the board "99pi" in
English which is rewritten as "Ninenine Pi" to avoid possibly unexpected
problems with a name starting with digits. This has nothing to do with
the price.

> But shouldn't it be
> "Ninety-nine Pi" in English? Or "99 Pi"? Perhaps "Jiujiu Pi" is a better
> option?

"Ninety-nine Pi" sounds too complicated for a board name and I don't
think "99" in "99pi" is meant to represent a number. Thus I'd like to
stick with "ninenine pi".

> 
> 
> Thanks,
> Yanteng

Best regards,
Yao Zi

> 
> > CTCISZ. Features include,
> > 
> > - 512MiB DDR4 RAM
> > - On-board eMMC storage
> > - Optional SD Card support
> > - 2 USB 2.0 Ports (OTG and HOST)
> > - 1 GbE Ethernet port
> > - Optional WiFi/BT support
> > - Audio output through 3.5mm phone connector
> > - Optional display output through RAW RGB interface
> > 
> > Add compatible string for the board.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >   Documentation/devicetree/bindings/loongarch/loongson.yaml | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/loongarch/loongson.yaml b/Documentation/devicetree/bindings/loongarch/loongson.yaml
> > index e1a4a97b7576..aac4af9ee97a 100644
> > --- a/Documentation/devicetree/bindings/loongarch/loongson.yaml
> > +++ b/Documentation/devicetree/bindings/loongarch/loongson.yaml
> > @@ -14,6 +14,11 @@ properties:
> >       const: '/'
> >     compatible:
> >       oneOf:
> > +      - description: CTCISZ Ninenine Pi
> > +        items:
> > +          - const: ctcisz,ninenine-pi
> > +          - const: loongson,ls2k0300
> > +
> >         - description: Loongson-2K0500 processor based boards
> >           items:
> >             - const: loongson,ls2k0500-ref
> 
> 
