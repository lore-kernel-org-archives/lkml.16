Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B891FF60A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745827157; cv=none; b=oS8RsARbxWSo70t73j1Bfso2SFIUstC3DJQXOHSAfA00C/vtTcwxX7xQSGkn1Wiqn5jfcsV6iK+7ebHOAHivxJErFtJ0LnVZ1qKmP64Yj4rsPpTVjwgWpcD6VUT6Fc39HpszCiHTkiSL3gGWXrjXU0K8hyvE2VVF8RYQ27iqdkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745827157; c=relaxed/simple;
	bh=wA6ahPk4szqKzyC+sa01TjwXULKmxRg4WeknGa7qdoc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oj9S+aTSWU9mlhULs+fuubKi4Wq3NNidhJ5Po+BVvPV3LpSE6jin1WJX2w9dkwXY1JXkqPFemRPNVYbsrRUxuirxvxJqL1QtVVYtwpC3pfJk4HujG8a3aAkrS2qlzxxbslJon7tavn5KznyGvukZmcAvzqkl73lNVqa92GwwENA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=byZsJvGo; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="byZsJvGo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1745827139; x=1746086339;
	bh=wA6ahPk4szqKzyC+sa01TjwXULKmxRg4WeknGa7qdoc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=byZsJvGooee6n7sh549WjjFkjB0dR1YoTRFo3AMKg9fBxv6c4FuQiemzSPLwPfXeC
	 Tz7WLgbAantBi9SikXFyutRMZ8rf7mR7HEXGH04bRXJrxO6n0zZBJfNCTPPWkikx+f
	 UvXZ4f45yUa+0ZHsa90/CHKFUjzNcmms3tUr0Wv35TFue7+zdudSqMzNhiStMi2nOQ
	 wrzKibk/9fJTiIxqRS5hnyErrLnWGq5Ar3+oJsCKSll6zvwEDpPInpql7J3mYJSAzV
	 AEIN1Igd3TxuqrsCxySGt5prg6whKeuY5KYDnbnuwcHMZldO0gBNzk1MizSRDdIQI7
	 BxYKnFoGZ7MeA==
Date: Mon, 28 Apr 2025 07:58:55 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Esben Haabendal <esben@geanix.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: goodix: Add no-reset-pull-up property
Message-ID: <zkDFUv9azjyXaS--ufxgROyruM2mpckWkDNeHtAO160rM2DuaJthpjgN0c_L8QgTk8bNA7Km0UewYmp1rWENwg2x4ngP-8C1rYhHMgAz0OA=@geanix.com>
In-Reply-To: <20250428-logical-successful-spoonbill-cd1c6b@kuoka>
References: <20250422-goodix-no-reset-pull-up-v1-0-3983bb65a1bf@geanix.com> <20250422-goodix-no-reset-pull-up-v1-1-3983bb65a1bf@geanix.com> <20250428-logical-successful-spoonbill-cd1c6b@kuoka>
Feedback-ID: 133791852:user:proton
X-Pm-Message-ID: fee9c2fe55124a7c5e2924d54c65cb54462b24fe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, April 28th, 2025 at 09:48, Krzysztof Kozlowski <krzk@kernel.org>=
 wrote:
> On Tue, Apr 22, 2025 at 05:15:02PM GMT, Esben Haabendal wrote:
>=20
> > This should be added for boards where there is no pull-up on the reset =
pin,
> > as the driver will otherwise switch the reset signal to high-impedance =
to
> > save power, which obviously not safe without pull-up.
> >=20
> > Signed-off-by: Esben Haabendal esben@geanix.com
> > ---
> > Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 4 +++=
+
> > 1 file changed, 4 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix=
.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> > index eb4992f708b70fef93bd4b59b9565123f7c6ad5d..7e5c4b98f2cb1ef61798252=
ea5c573068a46d4aa 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> > @@ -45,6 +45,10 @@ properties:
> > reset-gpios:
> > maxItems: 1
> >=20
> > + no-reset-pull-up:
>=20
> Is this common property? Where is it defined? Otherwise missing vendor
> prefix.

Good question. When is something a common property?

The idea of marking something as not having a pull-up on the reset pin coul=
d be considered a common thing I guess.
But for now, I am defining it for the goodix driver only, as I am only awar=
e of these devices needing to handle it in a special way.

Should I rename it to goodix,no-reset-pull-up?

/Esben
