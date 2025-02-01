Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBCE17BA5
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738406252; cv=none; b=OoZll4iAos7uwDzO3ItjNAjwmJTAV5C/qnkkpYm7mLP4ymbpAcVpjZK0jFgiHAGKohq0IzuyrAG7nH+utUMEPjlYevFfQ9wHliMiNr89mbIpezQ/w0mfWkjy8V2wF5w4Tgyq4J+CrGDnQR+4AK73KHiB5WW8t5/SeXaVOsEUEVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738406252; c=relaxed/simple;
	bh=PWVtKBZ4CwP0cP93Glv305Rndjv3ubM6exFB2e1HTbc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:Cc:To:
	 References:In-Reply-To; b=GFDkK1AwaxdBIDcjaHd/ZkhqYPES8Rr1R9zBwXGSEELJI4A6aq9/ankMc92ppZbx3p8z16UdcxMRLgIZowvh1A6thB/V7hYTUcXAW9Df3ALxjywy4/jP8c+vw/RIB99K9iZlh6zXIXfpRJPgffUg756meHrDxptLsdgjl0lYqQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=pTBB+O0K; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="pTBB+O0K"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738406243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PATAQ/9BwIrWJ3JG6zuTUGePxEvjmurrP+nZnbHjNSM=;
	b=pTBB+O0KTKCP9wTrBMgiLMyxMhEgbSIKEe7gFkbkqj+M9bU6lh7kxg5MEHk2wfS0+PVSRu
	hnf78jkW3RAFs6CGJAgLCkgHVwr440+Td5zj12/HeuPGp5EEkaGlTLFH2ghxaTuFXzsFiF
	+5VZjumqIIEwxgpbw9DzYrLP2o7CSAOMAAHbvSjn1aSApAINi8jFMyQt4VnHsTETrG9SPK
	KhbdR1yqNSfu9PPVEAisb3nuR14Ys06aNZZGV4d87nc8P0X8T1b7wv5jz/ydGSMzrBkENQ
	l8vl05ah/dbQuQeF4sRveDRHsPI6Hfjv/PImveicpK0OGSxFSA1tci0mvlkA1Q==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Feb 2025 10:36:37 +0000
Message-Id: <D7H1KE36MWE6.1G0PMUXEGX4XG@postmarketos.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Kevin Hilman"
 <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>
To: "Christian Hewitt" <christianshewitt@gmail.com>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
 <20250131200319.19996-2-funderscore@postmarketos.org>
 <5D2DE475-BD47-4AAB-9638-3F1BF6C57811@gmail.com>
In-Reply-To: <5D2DE475-BD47-4AAB-9638-3F1BF6C57811@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sat Feb 1, 2025 at 5:45 AM UTC, Christian Hewitt wrote:
> > On 1 Feb 2025, at 12:03=E2=80=AFam, Ferass El Hafidi <funderscore@postm=
arketos.org> wrote:
> >=20
> > From: Ferass El Hafidi <funderscore@postmarketos.org>
> >=20
> > Add support for xiaomi-aquaman.
> >=20
> > Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
> > ---
> > Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
> > 1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Docum=
entation/devicetree/bindings/arm/amlogic.yaml
> > index 0647851ae..0db7038b9 100644
> > --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> > +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> > @@ -70,6 +70,7 @@ properties:
> >           - enum:
> >               - amlogic,p241
> >               - libretech,aml-s805x-ac
> > +              - xiaomi,aquaman
>
> If this is S805Y not S805X, you should add a new binding section for
> S805Y devices, and add the board there.

Will do.  Thanks.

>
> e.g. I did this for S905L (GXLX) devices:
> https://patchwork.kernel.org/project/linux-amlogic/patch/20240604084134.3=
315841-1-christianshewitt@gmail.com/
>
> Christian
>
> >           - const: amlogic,s805x
> >           - const: amlogic,meson-gxl
> >=20
> > --=20
> > 2.47.1
> >=20
> >=20
> > _______________________________________________
> > linux-amlogic mailing list
> > linux-amlogic@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-amlogic

