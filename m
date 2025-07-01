Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F63265CC8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361374; cv=none; b=hxjaFJNNtWYb7+Is4/6qKohDFwDydfnXvkcydlSXexJUSJZ9gQwDUdV2WAHBBgbL0NhWwwcJ+nz9V/qBlVjAkNJGiQJ11TrJhT39sNaaHMErzy8RBn4sX4O0NGQhvg2/myIA8AR1o6JLRdmKSsMId6cNNlZ1DjPbUZyD6x00cfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361374; c=relaxed/simple;
	bh=5zpX16ZkWjt4vIS0JAKaVDKpl6liuG1nPvdqCAlyYY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UD0iHhbri3eO4YfSuAXGdKUX9reVqkuwjarwaoWcQq3JTY+qnDhK87I5YDbEfTqVJG6fopL7Z+mbcOzHlOsPwY3sw3fqN16qkZl5txRJwTH25XLzl/9PU0g755wgohsygwm6zwV50iAp75+RVVdx3CXjwNW/DRI9OPWW7sDlb3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L2zoDFAu; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L2zoDFAu"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32b3b250621so50894111fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 02:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751361368; x=1751966168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii2WJSGxuN91zGRL+o1Elt7P0y9IW0tcr9T0FJSPak4=;
        b=L2zoDFAuOpssMG+zEbBEg9VxEyXVNGFggvdP0fDQg4sC6WKbb8CnI5gMBf3hXwyZan
         RQ/6NLBOxcoaN6Xt2oZBcN3VagdPao6YPzaXswGLT7VSgSLxsUJtXVJ2OY0QFQwjf2sO
         +Pbhk+YvN3Td1tvqp9rB0pamwmbBYlH8LXQIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361368; x=1751966168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ii2WJSGxuN91zGRL+o1Elt7P0y9IW0tcr9T0FJSPak4=;
        b=ZfcGQ84Q3OhVphznETipElqVW7YNtmMGLf+fggrmeZmjHQ3E7vW0OMsJyCTFDlLHld
         I15318xUFMo6Jo2WxgkhSIyxTLJszc+97HkxGzsCcRvJfl31q091+v3xx3CpqJdNiz8J
         ufJtLDvezuomguw1lYt/0NLFji6OtEHYnCdCzyL8BYQ7PX5AMbleijIKOwvoCL7bzCMv
         C4MMQ+NAStKC9wnXRAvCelYyqu0xTDFmDbtP3qCmlVuE0/FEhDEJjRJgDsb4wKgagGBF
         gRpTkdx3l/l4Nj8TzD0US/k1sysDv+xkmXFkLVidn4yamIXNP/e8rSPVNqJPbI37oWn3
         ahQw==
X-Forwarded-Encrypted: i=1; AJvYcCVQPvb8ect1O0h89YsVzmOc6U00eMdQmyUj199b5kqkrI4AncXW2gOpi53Gs8rjrb7275cngkfoJKVq2bM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw2XhQpGt5lEAdwGEBldbsH6wzAzdNrg6jAkn/s50cGE6zTaLA
	rZLzgA8Uk+HPyyKQDurme68swLeX22gl4Nn+Cr501rRodMk+3BEKTUQGvdcjel7F60WYNxpfjew
	4opGRDjvut3itFtAyoUL9/2g8NFtPxwyzasfR+aeNQ+h0SsbZdkU=
X-Gm-Gg: ASbGncvlGAScdmObDK3Y9r0YS+D6S9Lp4gNkvyVyRIx/+WanhDL0yqtY6rqkQOjaf6z
	4YxnB5vDDczqRlPo0+5Ge5NV2zxAYOBJaavOpIswt/5jUvv0GVQ/7mpAU8sCOjNchNebNaZqAB6
	tx0zHMe2zNBGz3TztLG/ONZPKNBo+9XG5aNYOoIIqkBjo+PzGbDwCvwl5a7WI9amXfPV1Hob0=
X-Google-Smtp-Source: AGHT+IHBrDnDLJq/wJvKGLgxQgDrKBxEEuyZmoLKMExSbzXgm4RYBgKbsnJ/qHE5B5f1OiZ34CTPYU5ibJdkRjsWKOo=
X-Received: by 2002:a05:6512:3f1d:b0:553:aadd:1987 with SMTP id
 2adb3069b0e04-5550b9ee8a2mr5372873e87.30.1751361368119; Tue, 01 Jul 2025
 02:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610063431.2955757-1-wenst@chromium.org>
In-Reply-To: <20250610063431.2955757-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 1 Jul 2025 17:15:57 +0800
X-Gm-Features: Ac12FXxeyUHnDez8Q8D4O-LF6jWdCG451UjT4Bbb2Ps3qaRoBzaVTLBPU9xxrc4
Message-ID: <CAGXv+5HDAZ-MBBMk00O+cdcq55KnsKdEAMD7E2uaAf=2LY=1cg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: mediatek: Enable efuse GPU speed bin post-processing
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lala Lin <lala.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Angelo,

On Tue, Jun 10, 2025 at 2:34=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi everyone,
>
> This is v2 of the MT8188 efuse GPU speed bin post-processing enablement
> patches. In v1 [1] the change was made to the driver. Angelo, the platfor=
m
> maintainer believes the change should be made to the DT binding instead
> [2]. v2 adopts Angelo's argument.
>
> Patch 1 updates the efuse DT binding so that MT8186 is a base compatible
> with no fallback, and MT8188 falls back to MT8186.
>
> Patch 2 updates the MT8188 DT to follow the new binding.
>
> If possible I would like to see both patches merged through the soc
> tree once the DT binding maintainers give an ack. This avoids prolonged
> waiting for the binding changes to land and uncertainty about whether
> things have fully landed or not.
>
>
> Thanks
> ChenYu
>
> [1] https://lore.kernel.org/all/20241223100648.2166754-1-wenst@chromium.o=
rg/
> [2] https://lore.kernel.org/all/11028242-afe4-474a-9d76-cd1bd9208987@coll=
abora.com/
>
> Chen-Yu Tsai (2):
>   dt-bindings: nvmem: mediatek: efuse: split MT8186/MT8188 from base
>     version
>   arm64: dts: mediatek: mt8188: Change efuse fallback compatible to
>     mt8186

Friendly ping. Please take a look and see if this scheme is to your liking.


Thanks
ChenYu

>  .../bindings/nvmem/mediatek,efuse.yaml          | 17 +++++++++++++++--
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi        |  2 +-
>  2 files changed, 16 insertions(+), 3 deletions(-)
>
> --
> 2.50.0.rc0.604.gd4ff7b7c86-goog
>
