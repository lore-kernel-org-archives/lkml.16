Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1924D1F3FEC
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746449623; cv=none; b=t27+7baHMNxJ30gcqs1CCnXZP9JYRdOM9L8VEq4TtNWtwUXzcXy3ZhoetfN4lPQkqI7G0KXcIGuDCZ53HKx8zqf1Qh5NbDyP6VgSBmyMHsWQo9PWVkYQAJSN1y6Zzd2hlaNpbJtBq9cxJSYkrLowxy6kkeGSScMMYE58qMFkFdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746449623; c=relaxed/simple;
	bh=e6yzW/ZN46CFaNCfL7PIyJJsT7+CNCnO+9OsbZN6mbw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gZGQmZZD4RpbSV0tTvomT9J4XiS4l/muetKLGl+jPjSoxtncUAqXYczvJr+4sXzIoPGHori97R8pETt7vWfPFWWdhz/C77i+sd1ul6cLgxWv6iC0ASdqH0XB1AMvT4BukoAk3vOIxXcWCWsMf1sQhy5JWygi67dsIU8GVoZUIks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uBvKB-0001yX-6r; Mon, 05 May 2025 14:53:35 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uBvKA-001ESr-2Q;
	Mon, 05 May 2025 14:53:34 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uBvKA-000Jb9-27;
	Mon, 05 May 2025 14:53:34 +0200
Message-ID: <168c0dc2b1a9ebabbfd993e3a516dbf96d809f47.camel@pengutronix.de>
Subject: Re: [PATCH v6 1/3] dt-bindings: reset: Add compatible for Amlogic
 A4/A5 Reset Controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Zelong
 Dong <zelong.dong@amlogic.com>, Conor Dooley <conor.dooley@microchip.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 kelvin.zhang@amlogic.com
Date: Mon, 05 May 2025 14:53:34 +0200
In-Reply-To: <5bb02494-e974-4d2f-a00f-417312b73bc1@linaro.org>
References: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
	 <20250411-a4-a5-reset-v6-1-89963278c686@amlogic.com>
	 <5bb02494-e974-4d2f-a00f-417312b73bc1@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hi Neil,

On Mo, 2025-05-05 at 14:30 +0200, Neil Armstrong wrote:
> Hi Philipp,
>=20
> On 11/04/2025 13:38, Kelvin Zhang via B4 Relay wrote:
> > From: Zelong Dong <zelong.dong@amlogic.com>
> >=20
> > Add compatibles for Amlogic A4 and A5 reset controllers,
> > which fall back to 'amlogic,meson-s4-reset'.
> >=20
> > Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Link: https://lore.kernel.org/r/20240918074211.8067-2-zelong.dong@amlog=
ic.com
> > Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> > ---
> >   .../bindings/reset/amlogic,meson-reset.yaml        | 22 +++++++++++++=
+--------
> >   1 file changed, 14 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-rese=
t.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> > index 695ef38a7bb346c92b4cf428e7615d45682c940a..150e95c0d9bed74c7045942=
610a311114a257889 100644
> > --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> > +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> > @@ -12,14 +12,20 @@ maintainers:
> >  =20
> >   properties:
> >     compatible:
> > -    enum:
> > -      - amlogic,meson8b-reset # Reset Controller on Meson8b and compat=
ible SoCs
> > -      - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compat=
ible SoCs
> > -      - amlogic,meson-axg-reset # Reset Controller on AXG and compatib=
le SoCs
> > -      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible=
 SoCs
> > -      - amlogic,meson-s4-reset # Reset Controller on S4 and compatible=
 SoCs
> > -      - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
> > -      - amlogic,t7-reset
> > +    oneOf:
> > +      - enum:
> > +          - amlogic,meson8b-reset # Reset Controller on Meson8b and co=
mpatible SoCs
> > +          - amlogic,meson-gxbb-reset # Reset Controller on GXBB and co=
mpatible SoCs
> > +          - amlogic,meson-axg-reset # Reset Controller on AXG and comp=
atible SoCs
> > +          - amlogic,meson-a1-reset # Reset Controller on A1 and compat=
ible SoCs
> > +          - amlogic,meson-s4-reset # Reset Controller on S4 and compat=
ible SoCs
> > +          - amlogic,c3-reset # Reset Controller on C3 and compatible S=
oCs
> > +          - amlogic,t7-reset
> > +      - items:
> > +          - enum:
> > +              - amlogic,a4-reset
> > +              - amlogic,a5-reset
> > +          - const: amlogic,meson-s4-reset
> >  =20
> >     reg:
> >       maxItems: 1
> >=20
>=20
> Do you plan to take this change ?
>
> It has been laying around on the list for a while now, I plan
> to apply it in my amlogic/drivers tree at the end of the week.

I thought you'd pick it up together with the dts patches [1].

[1] https://lore.kernel.org/all/a5d9b775dd860d8f2bbf174300a2e3161b654035.ca=
mel@pengutronix.de/


regards
Philipp
