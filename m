Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EA129AB09;
	Thu, 12 Jun 2025 16:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749744736; cv=pass; b=EjiAoc/JaGyaxOfGiUqZOQ69H18PXghBD1J0O5wZlKxflaJ4/1ffXKQPNgzrQFwlImyBxi0ishQK36z5sQonDqV5FLEA6RpPilMdX+nqHSWN7ekHrhdFmUHkuHvQ3oIB2C/V6yOg+bGbtyaOaMW+V+rBjs83vIQVd5uFzJ/Fc6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749744736; c=relaxed/simple;
	bh=XPNH0zAjZMtcy8SGc/xpsdQgVSTCk0Ndsxo7h4JpeKM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m9UWkDBrsqoyTrrmaXxkM3JhNkaKobQN+AToJoQxNKwozbPMbXBRrfmmNi/NOUqTrmFDcaD7MWFtUT1+96/UbDq+GLrCDZcjL5yUVo47e0zhpMSLYcwZkJTQsU40OfllUWmCr1P6laYFvvZ8UGO8Yn7vzi0QHgiphVaHrAhi2+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=NJEQMW0m; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="NJEQMW0m"
ARC-Seal: i=1; a=rsa-sha256; t=1749744714; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jYPHD2l/zJ3su6lP130DojZirFBDkFLTji72xBSpawIGXXSV0wFpaMNKWRMDmmR8Wmo50DQ7Tk5Gq6RpqVOLlxat9lVr+zgjRSDHVxnvqCFGVhbMZQ9Ra4BEICpgJ5PG7EDxcnlXoZKo9xdGM7K3ziH+DN9papVdBjCRluyMJmA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749744714; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XPNH0zAjZMtcy8SGc/xpsdQgVSTCk0Ndsxo7h4JpeKM=; 
	b=OSh2Z/sDsqOZAp7xuCJ+573tzsP+7lPgY4NPwO8XnPar3qp/eBU2VsvUU8zxI/PoCSsC88hvL9dX4f3G7XmDw86eRhXCvqr1p2kXrxDVTX326+Jz+YJAV9+zghnB8zRd0dUasP7ioQnf8B19WjWZaxQpfGtRbzHOiwoxJynsmxg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749744714;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=XPNH0zAjZMtcy8SGc/xpsdQgVSTCk0Ndsxo7h4JpeKM=;
	b=NJEQMW0mjJ12hH2ZMehzEujJty2xY1lQrqfDkqNkHU2U8AefwxzhYV+k7eVTNNtj
	2isSFGEPiKmWmIIM7wCNir4iLLdCJDE4o4V3tD3prgRY0emHCaHB/TY1X693Q/hQ2Br
	R7I3nUCO462tINGcxM+GLG20jVI8057Wrm6eiwybw3OwQhtYCtApfLwB9q/LuDOx6or
	9oQj16gey48His7rPPPj0nT7JbIhFA0Wfb//uNyalcmmb1VwEf++h9Eshg17FDd9m/v
	YefU75tH9NqS4Ih71G5MAUmxxE24POffc8efJsKtdJieERz1EPF+y7qksMIYNbOupc5
	v1ea2+ouYg==
Received: by mx.zohomail.com with SMTPS id 1749744711397806.3789973608574;
	Thu, 12 Jun 2025 09:11:51 -0700 (PDT)
Message-ID: <8a1312fbafe65b3fbd2ed7a1fb9f618654fc5d59.camel@icenowy.me>
Subject: Re: [PATCH 1/2] dt-bindings: arm: mediatek: add mt8173-hana rev2
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, 
 =?gb2312?Q?Rafa=810=920_Mi=810=920ecki?= <rafal@milecki.pl>, Chen-Yu Tsai
 <wenst@chromium.org>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org
Date: Fri, 13 Jun 2025 00:11:44 +0800
In-Reply-To: <20250612-scholar-crown-517f28582edf@spud>
References: <20250612135559.2601139-1-uwu@icenowy.me>
	 <20250612-scholar-crown-517f28582edf@spud>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <8a1312fbafe65b3fbd2ed7a1fb9f618654fc5d59.camel@icenowy.me>+zmo_0_

=E5=9C=A8 2025-06-12=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 16:34 +0100=EF=BC=
=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, Jun 12, 2025 at 09:55:58PM +0800, Icenowy Zheng wrote:
> > My Lenovo Flex 11 Chromebook contains a board with revision ID 2.
> >=20
> > Add rev2 to the compatible list of base hana DTB to allow
> > depthcharge to
> > match the DTB.
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > ---
> > =C2=A0Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > index 108ae5e0185d9..7d13547ff57ba 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > @@ -132,6 +132,7 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: g=
oogle,hana-rev5
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: g=
oogle,hana-rev4
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: g=
oogle,hana-rev3
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: google=
,hana-rev2
>=20
> Ordinarily I would complain about inserting a compatible like this
> being a problem, but these chromebooks are all cocked up so w/e
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Yes, the DepthCharge bootloader seems to have some different
understanding of root node's compatible -- it just generates
"google,${device}{-rev${rev},}{-sku${sku},}" and match them in the DT's
to get the most compatible DT.

BTW I checked the Chromium OS hana DT, it lists down to rev0, but what
I get is just rev2, so I just added rev2.

>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: g=
oogle,hana
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: m=
ediatek,mt8173
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Google Hana rev7 (P=
oin2 Chromebook 11C)
> > --=20
> > 2.49.0
> >=20

