Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A208A28682
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708130; cv=none; b=iBxilBCbfUx71OsB33k/UejLTgKX3OpaOU7pgN4z+7f4CNrI0D0iTvIi2t6bHS7WEnfvgHmm/cPuHfHIvJ+dxOtzkGagmgoa1MWIX0U/kRQpVdxo/Afshaqmm4EOyWFpqZ8mqEhD5ecacz/IGpWP4F7Xm5sVWerHNdinjFgDu4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708130; c=relaxed/simple;
	bh=EyI7Fjbv9vasMfECrqQ2zJvUpIbkeXpQeunAnfVQFfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VP3VvonNGjaYUkhrMzHVm8O4fYfVvU6Hlgy/ZhYFmW0ePdZYdwlBHWioBwip4QB9/BuR+ogtjUBJrrqUv1lQJhLKE8u2cgVTj1tWN73iLTa2ouHZqvhOUd5h2oHRNjB3gfNYvAH9wFhpS78B61lVAxAlbojJnKBxCoJxnIV32K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gURJ46rv; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gURJ46rv"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-310447fe59aso9595861fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746708127; x=1747312927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyI7Fjbv9vasMfECrqQ2zJvUpIbkeXpQeunAnfVQFfU=;
        b=gURJ46rv70b/zG1WiCu3cBy35RiLNxeKbl6MGAjJsxwqsi1Pjvg5fU8IO67GANE7bI
         vSceiFZNkj8t/0jlFinntKqmIYnmJ8TR1qMNDRlTigZojtevIUI5eiezgi0F1DmxqRI2
         DJ42kHDIT1aAPHw2klxxDC0vLTdrNPmqA9XVqMvLB0a1EZOPdLCDByy1OOnoeFj4g+SY
         yJ+WU55nWff1hgKcFe9OR8XZSqtVhmRiOw0MWr98uSnHxtgxED7T47sdfpb5lb4Bspsk
         OSlVswOxPlW/HkFAs2KOP3huyo4FGO8WZvYhPnm0AoaQ+I231i5Bk1RfLqdGDreBkBPa
         vctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708127; x=1747312927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyI7Fjbv9vasMfECrqQ2zJvUpIbkeXpQeunAnfVQFfU=;
        b=B2mjN3XBt1wVM0sH7nCB/a3GDV8gvZee2Q5zJjGURMGnk1LXJK98LeBGtyZSn6v5up
         f3VxWtyVF0I8aIDiEv30glQA7daWugd8qPEa/qaDSarWLZJ+2yPMAcQTvP8IOF3Z4ebI
         QG1srUXkZlOLwdHiNdWPLR8Kx3P/d7c+bBzAKNXFgvFQ1hjcdAqfqnW4sDsLyPZeh/F/
         VCpoijhWmghdiy81U+6HygebRg3s7lVpBvOM+wOH+6qqQio4sRRwbB/GKsPPLLgLhc8Z
         2KRrxowUX40MWHha9D3qb6LsiXKCb0F2ppsQeU7KAAEjrGwOmcejjz8/sghFdbI30tbV
         O08A==
X-Forwarded-Encrypted: i=1; AJvYcCWNC8jpA0VwLU1Flz/4XSQ7+wGW5A3WUPeIJOH0BXDpEjba8IRdTdU3StNgwNiOvLGnT5wtbht4OyfJmwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFJ51XMFHqVTHZwWKLmsR6qO3ckdI+hhd2jwUfqlO22W+6v0E9
	cYlTwLifzwlit7O2bIt1OqH5EyR2MgSUBU6GKI+xnU2sh7wxC/cwYnh/ht0L3GoXcqWU3SEEVC4
	bT805aV0YDWiIB3lBzRt0dTdDUOBr7T6138CzbA==
X-Gm-Gg: ASbGncvvPQ77pNczNU1GuKPhcI8x9rB16JTd2c1XFQbFrGPrKvtGBmJYoYbHAsYi6aa
	BxlAi/e/meCTX4PM4f1bbBy9I75Q9Wy/4pJhj/Jr7pcQ8lZLKY4KSxQUVc13hbKQq8jGnkpj78U
	27fUeUuqEHUO3ZS6NBXzC9bQ==
X-Google-Smtp-Source: AGHT+IHqekdqaLIzGmIdqheNh4dgp9pFASMhDYidMguSp4rJY0A06hOjVIznt1/54pbPSKaSgiUo7aRxsMOaETIuJk0=
X-Received: by 2002:a2e:be28:0:b0:30d:7c12:5725 with SMTP id
 38308e7fff4ca-326b88dc5acmr12392841fa.33.1746708126820; Thu, 08 May 2025
 05:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org> <20250505-sm8750-display-panel-v1-1-e5b5398482cc@linaro.org>
In-Reply-To: <20250505-sm8750-display-panel-v1-1-e5b5398482cc@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 May 2025 14:41:55 +0200
X-Gm-Features: ATxdqUE9wVz2T5hOOhWQL_hbykigK69E5fJNykseRpfwtW-6smHNUPu2Ku2iiPE
Message-ID: <CACRpkdbvsr3kSu3=+NcY5LHNNzwwCW0WdLRt8BydgiNhQ-b7+w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Novatek NT37801
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 11:16=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Add bindings for the Novatek NT37801 or NT37810 AMOLED DSI panel.
> Sources, like downstream DTS, schematics and hardware manuals, use two
> model names (NT37801 and NT37810), so choose one and hope it is correct.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
