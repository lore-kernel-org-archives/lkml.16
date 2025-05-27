Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC7C2749CA
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748353013; cv=none; b=kdaYyiGE1QfImEPgUkSCicfwEfxp0dPAb5moZ0dtHDfoeYABQOptOK7y0X2Wd4s8mivpgyzNotDdPKX7k5Um6i4rOpfXpjRvkbSUE/j8jxba3aSHqlGaG5YjK/N1nFMLrdB/rnTqPdXfdmqI37bJvtZOV97v7i4LljwXUJDH9lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748353013; c=relaxed/simple;
	bh=AvTQfs3820KktS4EpY0ACK+ekFwY17It+Jl26bW88XA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TluzvW4R83i+0vNwCG59V6UUL/1TU/vyWUdk4tAhkuiFfaz/tMsOXx+e/Z2t+rzC3cpidedQ44JVN4Be2e20zHULJSClDPfUxCxoy6oPYoa59JLgjlzA5mf9cm60brfLw92pVZP2Whw9GGCCpjH5Yntbph2w6GhDkzyKLU2Mxf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=h1NH0MNe; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="h1NH0MNe"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-476af5479feso31809651cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1748353009; x=1748957809; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ish6o0Bhh995IK2wzs6updBAdJ3S2zxHBcJqrswtQm8=;
        b=h1NH0MNeS550ipTUdVLzbpSdk/a+xeQDkmN6SrZKv4NR/Xn2qT2Tt1CVztlvBH5VxU
         yVGioDCU7jz3gclD8eY9RHtc0w5cpyvi0Qk1+rho3QrFucOZOBLGi1GjonFLKb7gXhBL
         /JKo2mX1GC9QZQjA+b41bSn7dpofuDCxiiovN01+gUCkiR92uRS426MSB+rkASqLiiyv
         orfsxV7bXbOjdnLDZDSonaGBVVmod3cUX2UbzmYoziyrIrmHTV0TML+1DGQu8XN1pIU9
         i460Xg9FLMmBMUSRwFyFcZLxJMJHQ2QK7RtBcKAdF1WnE1nNKR0cTXyKeCJIw0uEdp6V
         pAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748353009; x=1748957809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ish6o0Bhh995IK2wzs6updBAdJ3S2zxHBcJqrswtQm8=;
        b=uhXYz72a1xxt9UPslYCmh/QNPRLCl9CdrneN2BNRGxjyF2gQtksm8Dv7jett1mfiCq
         6wGQPvhsI/Ff/+Qfo3OI5Yw1lgqGiJDl5Sb6ZUDP8sPUBeTx63XW6YKZElQvMcUUXfxp
         7TTMEdA7W2zFcL2c+pqkVECxcKtObOh/MOwcK1yt+8UJn3FF279eKfDzc50haVpptgVf
         CUkIt5Pq1DjZTiWiwee5OBDbfvtlpUf1nPdzi+8PxZfJK59E1bfxIXf283kjk3oQ3bKP
         Lu+J0bICT7MGyhQArtbxYV3awUALhnV5WKcWdqRpYeJ4Oy23bFaVH4l3SCo3ehiPe9Gt
         PV0g==
X-Forwarded-Encrypted: i=1; AJvYcCU3ml7L14dZF2FudrhV1OB7yDGnjDtXerucffjZFC9QyDOnACpZjUwEAj99xqpNoACjGzxOx8yh8GV28XI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb0vSXcPmdzeK2IRx4fc5TA+r1a1B5wbfqPYlKk+/vUQ6IQD15
	NEPkE8wRGuzL7ccaaSlNeei2XRiriyKFoNrN81Fxfr7S/SSebah9Xj44hnLXHbKuLKscDZMHkcm
	snrLHa6k8ZjQqC4zDcXnM2WvM+913b6SgNa5vjtcPig==
X-Gm-Gg: ASbGnctaLydPs1EaYIMp58lveN9A0NW0fe9j12YpA5+f3n/2CLL/TIWGDcGdYKB3NTT
	EsfLcYJt+7VLALsP08YLKzBIFVIoqLWTVW82DItXzAy8MRN0lXLJofbMu31dXuJqGZ7tSMsVpXD
	/6J5YbQCUFKbo8B7GXH1AkkIrSreFcZA==
X-Google-Smtp-Source: AGHT+IHr4jwrHqEJczRvGQzuN87CsS5C28zJXtY9UXRLqVMsScrfx0niqPKTlAIrCpVv2931fOLgMYPlwCUzMNEDANw=
X-Received: by 2002:a05:622a:1f8e:b0:476:8eb5:1669 with SMTP id
 d75a77b69052e-49f4781ed76mr216619901cf.32.1748353009174; Tue, 27 May 2025
 06:36:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
 <CAPj87rMjAv-UphvFuQjop60o=wHrkfs4-XOM=JqH7f8Kk5dyVg@mail.gmail.com> <e462cdc4-7243-4cef-bd1d-a0ef551b3a87@kernel.org>
In-Reply-To: <e462cdc4-7243-4cef-bd1d-a0ef551b3a87@kernel.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 27 May 2025 14:36:37 +0100
X-Gm-Features: AX0GCFvEuF0JQkg3QiWt8vTrQrmgkUnYilTb6_QdjwVCLuie3br5KvhEpdyYryI
Message-ID: <CAPj87rNZPub=hEs+86JNfR-iqiuRYGGGKGsYyXtE1aUt8dEyUA@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: mediatek: Constrain iommus
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sun, 25 May 2025 at 11:51, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 25/05/2025 12:48, Daniel Stone wrote:
> > On Sun, 25 May 2025 at 06:16, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> >> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> >> @@ -45,9 +45,8 @@ properties:
> >>        - description: OVL-2L Clock
> >>
> >>    iommus:
> >> -    description:
> >> -      This property should point to the respective IOMMU block with master port as argument,
> >> -      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> >> +    minItems: 1
> >> +    maxItems: 2
> >
> > The comment removals are not documented in the commit message, and
> > it's not clear why removing information and references would be a good
> > thing.
> It's obvious, isn't? The consumer shall not define which provider has to
> use or how many cells provider has.

If you feel the change is good, then document it in the commit
message, and ideally also use separate commits rather than throwing in
unrelated changes into a commit which does not explain anything.
Again, the kernel documentation explains how you can structure your
commits in a better way.

Cheers,
Daniel
