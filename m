Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A3126FD9F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745902649; cv=none; b=ZriDvUxjvTzDKfD9/twnJ8QjgBlBQD7raaxbfnfCEzp0B8CJdUITPoj3UGLUNmXZLbuHiT4bfx3chOa5ZDZRJ8SP1iOGg4NBKrVv3QfH5R5lCcWtkTmzSdO8HPpNTBTt/CKvgdXNOGsNeACBVy3GtLy4u92H6VRirXg7EUBiU98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745902649; c=relaxed/simple;
	bh=m6FGyiZkHMC+2yp8IbiBo7CjuQ9bcjs1Mm4nlu4EBhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QCPbb41Fc3vQEAFUOMJJ5mPDGDhDrGkly2ZrIs5lxesUpCje+VqKfbmx8ruc1fVaD1Dyga8x9dOnKkkZjvMZWKEGUc8BAeOB2A2Y/MYksp5M29Ut0nO9FAHc9Bnke8PKye4aqJsgcXdb6avQVzNbsmVgBM0O51wf7/wcb1/QlGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b5Myyv2b; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b5Myyv2b"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-72bceb93f2fso3960623a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745902647; x=1746507447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxJjPKSvLNuwm8T8yyYWoXIiPFioN2J33NfgaoCKRgA=;
        b=b5Myyv2bVlHfQWpWI2rdYfx4K0qmOn/acjSe2C15k2s0+XT55KaN+c9aeebrJIFhe7
         2gxaxfslfagTFK8b7trQS7JngAF9R5r1/oDQeM4pyu/KOitPKh10GVFO5o4pivw4m7gO
         KIHAbusO6EObS+CAhbE3J7RKzPAOmAcbzZ/aU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902647; x=1746507447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxJjPKSvLNuwm8T8yyYWoXIiPFioN2J33NfgaoCKRgA=;
        b=TKGdIZazjNUrvDjE5k1iGxJsGdiJpS42R3tNXJfrzpi2+aJE11p6LTknYhY3Yc55jd
         t2fU8b9IwIhsSUjaBn7gY9fng9SGxXl7VYyrqqcmdE9Xv+lazDR2HK7enrbjIGCrUoBj
         1DGwbpLQ0dcaGV9+bwQFJqnv/8qp4CM/Sw9moAjgCMtLPibBmNuT4IRhVKmTb3D0iSuC
         SIYkQgIDX0Ga+kirPuSbLEvR9omDZwa3NgHc3O4UyoEVnKyF28TfXnzkCr7WJR/gl7Yj
         0+YUgfRNl3Rv8OtG09TnTJ/HXqFAZujgAvULcmNM4/FMa/oUwQN19wRiMb1yVcs+HNnX
         8HHA==
X-Forwarded-Encrypted: i=1; AJvYcCX3Oo4hFWz0I5223i3VdgPW9uWGY5QZrYvwkqc2Vzr4VhGYskZrdlH0cshMM5QbQ21yhgpkEWZdTWq3fas=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRqIFb6qkgU8CQ/1SeokhGxKYCX5AV69qLkSPAmLp9qdfFiqZ6
	mZ4CKqND8jApoaoIVq3wbuyEyzOc0ZbDH4AYHcRHtI+jSlN+xn+GcKdikHPiSr5eAb/4Iv6lse0
	XZYVfvZrLOexPt+yurWXv+3WmTttK5sPQU2qv
X-Gm-Gg: ASbGncvdAJgoX7Yj1ozlb6EaQZOOWeUc0Ag0Z7TtkQ/3RfoIfFDp362DxdfZdl0kN5w
	YjVfF2FJYZlmTx+8OzAKUW4AaZhVDmhX1FEmSk1ZFiroE6JbBDinOFk1RdA6erhdNEvKh6ll2nW
	5M+mhebPqXLIjlond6ewDZSfwbynGs8L13O7eKvfwfcrmWLsMPBpqKBvwb/k2d
X-Google-Smtp-Source: AGHT+IFUnSYiQTmvsck+KUotDYKkwXPoTLcg5O5KAVTySG21gdvW1WNGApyRqouuC1eL9JpZ/kRdvGBU+Ln7X1cOHQg=
X-Received: by 2002:a05:6830:40c6:b0:72b:77c0:7d7c with SMTP id
 46e09a7af769-730898e1330mr850088a34.6.1745902646915; Mon, 28 Apr 2025
 21:57:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422082957.2058229-1-treapking@chromium.org>
 <20250422082957.2058229-4-treapking@chromium.org> <CAE-0n52cwBxJ3gYzSi1+nNcRRSgbMToYBFLJwdVWSMOxBmUN1A@mail.gmail.com>
In-Reply-To: <CAE-0n52cwBxJ3gYzSi1+nNcRRSgbMToYBFLJwdVWSMOxBmUN1A@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 29 Apr 2025 12:57:16 +0800
X-Gm-Features: ATxdqUGMZR39bp0SrXhteoiQw82MbBr2R1yiXPTsRp7MUnVxU0r-Nptpe6H-Yy0
Message-ID: <CAEXTbpfb6KOqrU0oAvbzV76Wj_YORsjcukBVZx-d2evYtmwshg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: usb: realtek,rts5411: Adapt usb-hub.yaml
To: Stephen Boyd <swboyd@chromium.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Apr 29, 2025 at 7:46=E2=80=AFAM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> Quoting Pin-yen Lin (2025-04-22 01:28:29)
> > diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml=
 b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> > index 6577a61cc07531..a020afaf2d6e7a 100644
> > --- a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> > +++ b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> > @@ -10,7 +10,7 @@ maintainers:
> >    - Matthias Kaehlcke <mka@chromium.org>
> >
> >  allOf:
> > -  - $ref: usb-device.yaml#
> > +  - $ref: usb-hub.yaml#
> >
> >  properties:
> >    compatible:
> > @@ -19,61 +19,35 @@ properties:
> [...]
> >
> > -      port@4:
> > -        $ref: /schemas/graph.yaml#/properties/port
> > -        description:
> > -          4th downstream facing USB port
> > -
> > -patternProperties:
> > -  '^.*@[1-4]$':
> > -    description: The hard wired USB devices
> > -    type: object
> > -    $ref: /schemas/usb/usb-device.yaml
> > -    additionalProperties: true
> > +additionalProperties:
> > +  properties:
> > +    reg:
> > +      minimum: 1
> > +      maximum: 4
>
> Is this limiting the 'reg' property of the hub node and not the child
> usb-device nodes?

Yes, but the regex pattern of patternProperties restricts the
downstream device nodes to '^.*@[1-4]$'. So the 'reg's of the child
usb-device nodes are also checked.
>
> >
> >  required:
> >    - peer-hub
> >    - compatible
> >    - reg
>
> Can 'reg' be dropped because usb-hub.yaml requires it?

I can drop 'reg' and 'compatible' in the next version, but I see other
schemas referencing usb-device.yaml still set 'reg' as required. Is
this some kind of convention, or people just didn't notice this?

Or maybe I shouldn't mark 'compatible' as requried in usb-hub.yaml to
make it more generic.

Regards,
Pin-yen
