Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEA42522B0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744755068; cv=none; b=kTtJmH8neWxXFvkeD/mpdDC7zwqRFiOiqJhkYDX7y6wQHzovIzonEBbUnXPxoaDj6k1zS2lnwOff7DC4gswPyjKeUIsjyJPXOCXrvQCS+tF9o3KbSOK+kcQNgZAMM1Bi0iSeHiDhppoQqaS/0vk2uOMOcH0auiluYkdOLO4+BnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744755068; c=relaxed/simple;
	bh=31qWf8KQERvl8g/dbn9h2rj4EmG6eTFJ1VCVzlLhv5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OVCmZvmCk+meEWxPkz5HKBMJ9jaMshMbwWvz7yeTDJAtirG7CrgkL5jgIMgg7hnlG1LfUPXtNx9xaO9bvjA9+zgNjggk62BlkgV56DksrpqXopXGeUPT9fVzqGQTMuc7TwSgKSL/fDcyXifniAFtcC5q72RDHUcuRHaGIQAjUm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EJTVGZLJ; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EJTVGZLJ"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3104ddb8051so38848591fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744755055; x=1745359855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31qWf8KQERvl8g/dbn9h2rj4EmG6eTFJ1VCVzlLhv5w=;
        b=EJTVGZLJ8CTfHbwcvmzhtwULAtv1VDVkrAv9dm59ChB9/5Kr80ETqGBahVAHzEzC5X
         CtRBLvE5gx+xezCbjbQVTFn4tCFe/FhiB4uGeJTsbu6cnZuIUooFwTDGwCW5yTif5dJG
         YcSm6nOB8vidGKU9D8sTJXJ+VONPIS9CjpnZEY1ZSitrE27X8jP81Bt/ZL4qHNPDzk0d
         p2p+KhmGwcJEScEbtm9wr0IPRTbiVkfbUuRmCJABkBifgyb2anGolfOx2e73I6eaginh
         08USbbqTWDvDFKF1UmRoHhNNq/+dhPWZK2HYWrVN7ytjnmT9dEKKx1NnA/C5E4Tgxc+v
         fP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744755055; x=1745359855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31qWf8KQERvl8g/dbn9h2rj4EmG6eTFJ1VCVzlLhv5w=;
        b=d5ZZE5YfSMG5AA4Xih3K8RcIbfE2/3imY0BCB82fPqAm4mPjQHVwgDHrZnFGSpaxTu
         wrLxbFv9ohbAnHXH1ma6WUao1rn9a5DTnLZXwZPTS9Ih/KLhe002Rwq3h1Nf/YCh/qax
         GND/HDWO15zd80FSmDWFcdnNIZmowvG6Y454JIgKWWK2kAAFjC4U/JJd7oalLilgK47r
         zSkaQsAoDfnXQTgO+qwAtH3px0U3Nt/YkCKt2k7ThwDyItzvpjgGeTCwKBZ6PVxAZosE
         ize1ydH+JTRTdFkn4vb3XrptsN+dVVgkLiH1E29LDhlCb62nEsmF1euGvwyO6fvVn3mw
         8KyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN8VduHMoEwoBg8X1ZZ1D4vLGD3OfkNUoervvC6bNFAHFo2FRRUhfmbleeWHRI67wG04WzS2bzwfIc3IM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAr7CjSX/SKZeNz0gMNZcuBNgaK27zEL/5FQ2M5O53LiLUftvv
	j9WyZydOWC8XkqVzC8CRt7yudCoT+rm1uPXKoGE49AwqX2jew9l+nsS223HH++7sx8E6k8PSqLb
	+k4bPE9z7j/tG7I0S2jZ7pwM78dCVEGRNTigt3g==
X-Gm-Gg: ASbGncvzzQkf66ii3Y7m7CiJzNQNE016PlDJRmsS7rPC6HLTFg9TKza5cgdKdJF6xQp
	tkQ2kn53qzSEixSMngEzqmHAygsoNRdTkCCsoAcAcSZeiBD/LO6kbtkPxF0NeTAApYf2d16D4LR
	piBb6VlgfW53BBK+uf3iSA8Q==
X-Google-Smtp-Source: AGHT+IGZJzLOwnZ9qpiWHcIF+V8TMR3nGOqkOptHc/Gl4TE7Nw9LgOL4ju4wMFEnKHYqcQfWgSEgPkmfn705OlR6U1Q=
X-Received: by 2002:a2e:be2c:0:b0:30d:e104:cd55 with SMTP id
 38308e7fff4ca-3107c35dcf8mr1584751fa.38.1744755054882; Tue, 15 Apr 2025
 15:10:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 00:10:43 +0200
X-Gm-Features: ATxdqUEUFUOJ2tt2s7fnA8fXcqPXcCQqJSFMlzS_sbWB5FOT4EwR_LV0iDgZ9D8
Message-ID: <CACRpkdZC40M9p0VsygE4fWeybdHYD6OJ2b4BJufbCA4LVW1z5Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mediatek: Drop unrelated nodes
 from DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 1:51=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Binding example should not contain other nodes, e.g. consumers of
> pinctrl of, because this is completely redundant and adds unnecessary
> bloat.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Both patches applied, thanks!

Yours,
Linus Walleij
