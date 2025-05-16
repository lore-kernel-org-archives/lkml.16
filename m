Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79050253326;
	Fri, 16 May 2025 17:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747415521; cv=none; b=U2aosPYcuTlQtckg2GcZtOzb1PHWvJ7GsAzivGOEnCssIVcGjovVQW/N1/rCgMsCtz/LuyZf+ea+X+VRFnDvbJPuThPK82ye938dyG2acYUj6BjYM0m18DsBkDHu/PBIhSQHyfeMEkx5PtDoPqDOi/KyYncBKGEkDfnpkTq4EsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747415521; c=relaxed/simple;
	bh=OmRKj2XGoYIJqcdUtZTOASiF24tdoRUpWqZw3F4eErU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X3RZczD6hCPTEEDiDFxQcqM3dloB5gH8yLOkA3PPRhcS8x+GpEbY6GwArM9DIEpZ+4CGBh6AXAX3eamk0lPH/qTVBsaw5MmYmgBIFFD8WH5ZWAle8At0evySwoTMfkgjX1efqdvh/UCOG03GURjdQak4FtEiww0zwhKA+Khez9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BopuGbPF; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BopuGbPF"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-525b44ec88aso738955e0c.3;
        Fri, 16 May 2025 10:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747415518; x=1748020318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhDH5x31OY0sDQlP+75NDdLaYCVS3MYscT17OHcsFQo=;
        b=BopuGbPFTLlqlIfVBz4M700OKK2/P/ufWpcABv4UqaCd9OTyZukuaK/6ksm2poMicD
         WoaIJRpdvqeDJnUo4In7EqPU1Ps8Cy9CCarWwot1Y0o1rlUvhG5/3qCzM8xKnPEwkVJ6
         8O2q6ztPbK9Ot85SeQIwjOtsaVutB2RXcbDgPDmJHtzPbB0kDObW/+aHndM1bU+w7Loq
         FocmcbDpgzWr3f++Un1deOjeO8MnAAdc3Ca43A6dBAI5dOBOohSTEiNXP9GJ2Rk++5Ca
         1lUJr7QDMqgkjttExD3ZGmbG3/swApKm9WcTN+4mzGqYC2YD1/eqp5TuW3pHWyqgA+7J
         yEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747415518; x=1748020318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhDH5x31OY0sDQlP+75NDdLaYCVS3MYscT17OHcsFQo=;
        b=exVW9gB765Zt6N2T8c/FNKjyY1CK+SylYgS/yW7GjOjetboGXRU9cJSJASSDe+xjMy
         EFjDIMxZYTt1L1OXsYGf5YXftuaAaiJQg0P1pg4/N4L+e47fUs9AWpCppTbvT1kiagVf
         VJPvGVV5DXRRruwUDhutjl/WpQFJ3sF/hpowt1RDwCMw6sMiQ85Pg3NAxMHEn8fQY7u5
         8yE8qxYcu5lGmdz0YFD0w9QhJQOriZrxOs+NGg0qFlz//oM38yG6sa7v3hAno91OtzDK
         nFpvXHHrSH8QZ5UXdskz3m3pmwODlsY3Iv7hF9TVXpfg4k5z2tOfsTw2jS4frjjU+dgO
         STSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQPWtYOUIEa6hlI3fvcnEh9QchjI6a3fYfgWWWRSMlo9tb304TqDl4IiOifY7Gc6VBBwS/o+gvTNnqDzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkMrRx4oQuwu3dM2BxYXcsZD5MJsxlD9ElpSZ8dX72adtGUR+Y
	KIoAX3zxlMqrT6Lj8zs8OS5toPerXmZ0NdXTm6ZsNyQvCX/AuKbetHL0zCNYW6exxanmRvpBRQ8
	KeDz57juWYGCxGVr1txfGUL64HeHtJtE=
X-Gm-Gg: ASbGncul6glSVmb/5/SBqAkRggUqIFQWxInoaJuVzE+qhDOde5cGDTt6aoYSTfLO1sP
	m/SIatOVpFQztPRAbkPzCsStiWM2vmUAb7JExrsl9lKJXbzmtEgg7zCfjmsC5qg24ncqaEpoSgK
	SaFlgwOWDvGQDKw6v+/LuTUOx8KZWL/XI=
X-Google-Smtp-Source: AGHT+IGCHH91w5aLLk2zhH1OD0M76Qr/hbRf+ItmTxpc3fxs9gNjUQOKE6DSW7gfQpTUGMqdAkdbaP7RWiKhTiRaV/Y=
X-Received: by 2002:a05:6122:221d:b0:520:61ee:c814 with SMTP id
 71dfb90a1353d-52dba7fe312mr4755074e0c.1.1747415517612; Fri, 16 May 2025
 10:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747231254.git.rabenda.cn@gmail.com> <b538e2b24eab8b740091d80ca76b20ef6014a4e5.1747231254.git.rabenda.cn@gmail.com>
 <20250514-showplace-yahoo-e3c306355288@spud>
In-Reply-To: <20250514-showplace-yahoo-e3c306355288@spud>
From: Han Gao <rabenda.cn@gmail.com>
Date: Sat, 17 May 2025 01:11:46 +0800
X-Gm-Features: AX0GCFvBGlC7lcpTFlf3PZ0KsWEj3nP-8_pPYriZOyvUH2LtrlBI49XleAD1C_M
Message-ID: <CAAT7Ki9Fw0+Ntv+oFqr2R=EHnFZrT6KmyTPN2MCDDGvSn-Wi8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X bindings
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 12:22=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Wed, May 14, 2025 at 10:08:59PM +0800, Han Gao wrote:
> > Add DT binding documentation for the Sophgo SG2042_EVB_V1.X board [1].
>
> 1.x? Is the v1.0 something people can get their hands on, or just the
> v1.1?
> What differences do the boards have that are minimal enough that
> specific compatibles would not be required?
>

First of all, v1.1 and v1.0 are compatible boards.
There is no difference between v1.1 and v1.0 from dts.

Both v1.1 and v1.0 have been discontinued.
About 80 pieces of v1.1 are in the hands of community developers.

> >
> > Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG20=
42-x8-EVB [1]
> >
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Docu=
mentation/devicetree/bindings/riscv/sophgo.yaml
> > index a14cb10ff3f0..6c82f89b56ca 100644
> > --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> > @@ -34,6 +34,7 @@ properties:
> >        - items:
> >            - enum:
> >                - milkv,pioneer
> > +              - sophgo,sg2042-evb-v1
> >            - const: sophgo,sg2042
> >
> >  additionalProperties: true
> > --
> > 2.47.2
> >
