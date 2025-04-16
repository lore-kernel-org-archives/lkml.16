Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9D31AD41F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788417; cv=none; b=l2NpkzcjsPwQ/bbWN2A+6kw2U4RVNGoxecMe7TyNniNMbe4SW9+SkSQ76cZQmnmgbF1EXgZMcUhYTw0e/pxKmbfcG/lnXsbv38iVG8vNFgNW+LPQsfuqUb4vrU3P2lja02fDhZraMptXgA6pf/QA5ysivgZLfWT4SKzmnewBN1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788417; c=relaxed/simple;
	bh=1vaofwfGevdxm4fxBlcFaPcuDKOl1lL/bjN1PokEW5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5WBBUzdEOjKxIEONLKMn7KWKLCeFL/1NpWuMrwLWCN+n0yfLmZ2gcMXFpXHGY+nJNzoSdE7IlhyRILtHPZ3jT/XMc8rOOd+/PUZVcVoVL2WlymC5o3cK6yhM9rRaGzdu8HKcRtQy++cdwpV5LN2aQ5BIk3IJAtpKN75BWDrZS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yTB6YFcA; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yTB6YFcA"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bfed67e08so63906101fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744788413; x=1745393213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vaofwfGevdxm4fxBlcFaPcuDKOl1lL/bjN1PokEW5s=;
        b=yTB6YFcApHyvgS2IzwZM+D1G5zoy8hA+7xM7DZOEQHZPyqOJwH8Qzhz863tVBITzzE
         xjrxfEh0CkNsfD/F3nhZb+Vs1Nw9Kr9NVksQQgkidYMzJGzzHkyH0HPvIcoXwNm3hqod
         ZzekxACWvlnaoDN0hLVz6OWe4jsSof19WWsqKIKwkKP0laRP76yGcnah9F/cU4mlW5Hy
         8i5W6/J0ZXMh1DcvkPtxZhmMiC70J0n3W99hdzjgpFZvYoJWFqqHyfA1Fp6wZF/JJUxw
         mmfcsmRuBvsqQo7jV3TDDWdJhy/pHe7D1cqy7RNqmInCvm8oTf0+neUBT8S+clcP129u
         mtjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788413; x=1745393213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vaofwfGevdxm4fxBlcFaPcuDKOl1lL/bjN1PokEW5s=;
        b=tlECVWppDBiipp8/JuJVellVZpuqKMLU5UJLk4ttEJHoNqZfxFe4QTgcWPd2fa8W+w
         16dirIyeDoVsV48QFfpMH1EjpfTlf+SwpC9uYbAv/GHRywhcXDcp0xDO1C1A9P4OfPcG
         aI/ANeHsyyAuooizMBn+yTuavNPQu9EYKvs4r/+hW49qqgqF//Nma4uAfol4TsXy8air
         D67xN1C+1TYdt+sVqJox69c8CZD3pDqPGS5q5h1I6EGOd8pr4+4ulpHhUBL7rBT6tK1T
         OoKYptqk50NSHWyjwyxBFywWN7F0HRYx06oyfJiLZ3siE0vCQO9c9VQHBGwFO/btCAtr
         RSZw==
X-Forwarded-Encrypted: i=1; AJvYcCXVARGit7vE3KAm3T+ZEbLVSCSvfsZ3mqm12JyC//H8CGPrTGpY0ZrqgBSOo6L81jLuehA8p5NnWgfF0Cg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCbprS/+hX43LlYnYLP67sTSXBKrZpfWsHYCU/ZqtlD/im/3ih
	58c6DeS4osYqBfsVMHNJ7aEnSjbUMwxBAjirx/K/+h3W/tuFCoXTtvxfrc4PcYx4OxhyX675yCS
	rXhU1bZGAarSl1lF24FBXAH4D438IAFVqZf0LqbFnEs5HSsX6
X-Gm-Gg: ASbGnct4b+FLQtVlws7NogVu00GvzqsHd/SlYuIsWnDg4sgVlY4Lmvx/mzc69yUGOi3
	UaYlxDhK7b+0xrN1tUXIWgdSI5AqKOqja6CeujYZJ2sSh0vW7LNeDanZBPE//JCFJFasgEWPJFE
	Iq1wEwMi7aeboGK3bCK8KGyg==
X-Google-Smtp-Source: AGHT+IGFJYXFDDo/c9HFNj0hqEBV+yqtCpFXburGgG3GtJzyM/i0Julc0Ne5mNBFD3uMq2MVFDEsN5XeZET5w+5UV6E=
X-Received: by 2002:a05:651c:220d:b0:30b:b184:a8ef with SMTP id
 38308e7fff4ca-3107f6bdddamr2202021fa.14.1744788413502; Wed, 16 Apr 2025
 00:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:26:42 +0200
X-Gm-Features: ATxdqUEqi0bEqmx8YQckOZ12kcmNHaSqcTf6fCpAz3VpdY46Sk3RpC-b3QUf-pw
Message-ID: <CACRpkdZ63dWzMg0t96zPFL4+4Ewg1nA=utPJ2QUg2DvmFe0_FQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: pinctrl: mediatek: add mt8196 eint pin
To: Hao Chang <ot_chhao.chang@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 10:42=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek=
.com> wrote:

> Add eint pin support for MediaTek mt8196 SoC.
>
> ---
> This patch depends on
> [v3,2/2] pinctrl: mediatek: add mt8196 driver
> [v3,1/2] dt-bindings: pinctrl: mediatek: add support for mt8196

I just merged Cathys patches, can I have a review from Cathy on this
patch so we are all aligned?

> Please also accept this patch together with [1]
> to avoid build and dt binding check error.
> [1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D&su=
bmitter=3D215008&state=3D&q=3Dv3&archive=3D&delegate=3D

I don't see how this patch (which is just code) could cause DT binding
check errors?

> ---
>
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>

This use of --- comments will make stuff disappear when applying the patch
but I can fix it up I guess.

Yours,
Linus Walleij
