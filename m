Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A92186294;
	Mon, 10 Feb 2025 04:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739162698; cv=none; b=CgM3LrpVattJwa3Q66nqQ4fu8HzLKwM3rzzagWOVyuR7jWGwa2I2NAublXxHV7T4cxwUgNhaZDIi9zL3hNc2I40UjlnMdHq4U1vQReHA4kN0GoSVGc5FqdB+H0QPaEqvdGbDgFAMKni0EopjEcRisf3E5EMrWnaitBLR6xkhjLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739162698; c=relaxed/simple;
	bh=EVyKxPTGp912UOtXEAptwjbEmHs5NwTVh+skLfO2LpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IU1vCHv6lWmmQD5ianW3wStfma6gi56y1CSemGV1n2m9Qql94ehZNx4ycvRTn75ZbpRNcrfuNPTBh6XEaQDFpiyxyZ+mJCqSk4PY1lcrSD6PCmxK7bwCvq/pAP+nRNkOZac7qizHJOCp2BoND2d4cO6ovNaE7Zwng/HBDkab7PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPh2Bh/t; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPh2Bh/t"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e46269d2c2so5148836d6.3;
        Sun, 09 Feb 2025 20:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739162695; x=1739767495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q5ZTUagYrO3sDy0qpYfNbuzZULfZ8CctTVEY3N8wuKo=;
        b=ZPh2Bh/tmzt0S81HtDbkHj0/TGh02Y108WCA+u9FWLC/DcqyfogsX2DaVKsXIH58Xa
         7loh7hBVec1biN1dPCP/ezuwJjADUPfsol7Es6xHtRZTJ3vjfl9nTJSkesH28YkdJvjA
         HYUlBIGmBEYMi8foMHIc9d8Vjpc1klpoZNwkUVWbLwLpaMhWmPEMrOhAVYUDxqkz6k5z
         aW27kIHQL/0xjQVP0YfMzYgczbJfqCs7YIFrBDCHu79Zl497D5JxmDB93k8yWyy+XX7s
         ga6nFLoaRUantmd5FTqQnzfYLusuxgtU8Agh4CJKTvYh48LkH6BT/ju2oiWXMS7ySsRF
         RAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739162695; x=1739767495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5ZTUagYrO3sDy0qpYfNbuzZULfZ8CctTVEY3N8wuKo=;
        b=INlmyCn1wSJgLYTIRlE3Dvc/7VV9goiYtEyTr1MMsobq9hJn1xsP33aIFQ35xZ3rd0
         OzDtmnelTHxqhNfNf/ukR9AaSMNTn8SJL9hPmD9lwBix8Yg3cr7VYcZC0BQNf8EMyEJt
         mf4jXK5epFXwWJBgvb3Tu0ELh/ZM0yYj+f9XCr9xu/xHF9RYGE33HApJe3IHVn3sw67E
         xq3Ryl8pko1LzB9pRsc/viL2pgVyjyXZU1wwxnhtdFgstzVtswPsvGZ3h9Mu7DbvbwZf
         KGlEerhlhQlV64o5tAD5HLCDY3yH+7nX+gpYig73mrZ4zMOoFnRehsJQmsdY47WHhOmw
         s/yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKQUPWb4erTI/ShTrmPzv7WaMvxFMTgJYtdc5B16fx/M6e68bqrqWiabjhFanaSDvT5cMbUx4FlWM37b8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ6uyiSdjdUWVZbmOdj7TCO15BDZ2z8q2EJaId7PZR/guVNhq0
	bop2OmIYAo1iIkXnTHo2+NPl+pf/7FucnywaMr1J2hzoP7K64QAG
X-Gm-Gg: ASbGncvlClb/5jMCi9hWMbXQeYnZqduUi3uyPnthOPRs1ODIUOGVJ2tJyuUhoi8P+pF
	BZLFCKUj1uawEm4QDMCfhI4NsifLu4KHr4m0Xj6j2uu+tVX3DePY7tY2rdLQP0M40IiPBDeHTlS
	Z0oyJd7Qh8Y7wtw1Rzrn3f31yj112oWRhjJlfXlO+aXZGkWGdcT7i3uAf6qZrjfbNgxDKXIVrkF
	mh0h0YFv1loDbIl2MlD4pRHLS598Qkq0qxwnIad7mFkfdCpom+ACinRc14f1AGdZBA=
X-Google-Smtp-Source: AGHT+IGvl/2pg3f4dFoe2QvRsXnrGQoEzjiLdnTh14d/1+Fa2/85a2GnXXhrKqKQfyOOGOq/UIptuQ==
X-Received: by 2002:ad4:4eea:0:b0:6e2:4d70:1fbd with SMTP id 6a1803df08f44-6e4455c61d2mr144316396d6.6.1739162695239;
        Sun, 09 Feb 2025 20:44:55 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e43c84be05sm41693526d6.105.2025.02.09.20.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 20:44:54 -0800 (PST)
Date: Mon, 10 Feb 2025 12:44:48 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Jisheng Zhang <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Message-ID: <d7gfa5l6jhe5ehfm54hajknexbrhlqacjthpocqfoo7im6uus2@jndznqesxzhz>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-2-inochiama@gmail.com>
 <BMXPR01MB2440751AD7D99F33081DB330FEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BMXPR01MB2440751AD7D99F33081DB330FEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>

On Mon, Feb 10, 2025 at 09:00:24AM +0800, Chen Wang wrote:
> 
> On 2025/2/9 20:29, Inochi Amaoto wrote:
> > Add bindings for the reset generator on the SOPHGO CV1800B
> > RISC-V SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml        | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> > index 76e1931f0908..73f8009698f3 100644
> > --- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> > +++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> > @@ -11,7 +11,9 @@ maintainers:
> >   properties:
> >     compatible:
> > -    const: sophgo,sg2042-reset
> > +    enum:
> > +      - sophgo,cv1800b-reset
> 
> I have a question, if this patchset is for all cv18xx products? If so, can
> we use "cv18xx" instead of "cv1800b"?
> 

Negative, we can only use a real board compatiable for the device.
This is why I use cv1800b as a base.

Regards,
Inochi
