Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8057133F7
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173163; cv=none; b=hHwNUgf6TtdjCM5Vq8+t2DgJAjyKj44wp9ZUTUj8j8LYvFElxKpijRbGyBA7MjyT21KAr6LmR+Wv1WLbSeKMjShHwoiqWIyZX46qk9iz1Ik2uPaLOhW1mczqBB3sBu+BXOJVJpa328RrvgRmtOtipYnNPHXPvq3tyNgP2+TBbnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173163; c=relaxed/simple;
	bh=LK3lAuBjsNAIlEIkMYgMLyfpdUyaTRXeTgNgmUeBqIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n52owv8QerWLVC4bvvFFJyqtabzGhZI7snLxPzbMJmS5z24NaQ0AGotgkPE2fn0iX/Iv1NHLSp4Ke0biU9ESnYFu1cKMY1AnF/fumped2y2R9lzK/weQbi9KHhWW0Gzz5Q0MyniAiLzS/2eLA+eaYWe8+GJbxgj866dkvjdQQ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vy3vUjta; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vy3vUjta"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so58573911fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747173158; x=1747777958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMrFM87rAmuG/UnGteKviZfWZXINuxFQCsV17IJbRWA=;
        b=Vy3vUjtaBSYbHKvxHCWL6vZplv5HYHnlnxdyvpO4ey+/LoUsOjexPq8hNhjyK60PDo
         M2FKlDTNvgTEfO+2qik/yuA7Ay6GwM6JmpLKA6IKDNmifvVcJcEbUbhpbqmWicpepjrx
         Q6zgweWYx4UDco0uksumT12Nmf3mFtgVY3UOjVIdRjeJMDShKNSovyygEtEGirmo8B4N
         OXWHpUsi9JR0dWpzEOCm7MnowRKbajRlWfmInvcNCaQsn4wyhBpj0lFd/t6lkXcGpDIZ
         /830+f0rmljgkA585HkvsyoZokqdWVmQwQIs5fQhfxxdeSH/tem4A8J2db7I4mYk6keJ
         KIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173158; x=1747777958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMrFM87rAmuG/UnGteKviZfWZXINuxFQCsV17IJbRWA=;
        b=op7kbqk9fESKSKcIGbCHUrrznOL92JSmVROx9Sf2usWHau4pkmAqr4KN99MZonWEnZ
         YXA5caGeH2XltEP8a0KefdMUHHhpPW6qxbLNoAA2k5L5smKF3KEHblJ947hIF06qN4mD
         uE73c9nYdxnD8IHOwmV65SlWK0jHmOoKMq1WPygC2p+vSf+5mX1kvCZMzfjZf04bRhyf
         VNKElJPfZbcHyi89dPxBeKjcvDNSDnIP3yLTrapplh5p7rRccBzekPyJZOhOkUsDAwMe
         5oSLfg8rNlLrJqYTvsS537nqyRTLZcaB7VMubjlqdevAi/Vy0JchA1Z0Akf2/LFSp9fl
         W9KA==
X-Forwarded-Encrypted: i=1; AJvYcCWu034arr+jHhpzGFq/n9rCq8h0cpbwlP0va+Uh1eiHobQ/2gbGQ1r5qJnNgfwVb9dhXbpKhlrcwjeCrvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5NYgOTnCB4mfVORxkk7mKkmZyi3MjDpdC0B6R1JeYH/io98Bh
	eCG/vcZpDe3CteIDk0eIKe9oZ7d8NPYlqVBg/5iMcngDvuQOdCPY4z7A1d4gRVL9WGB09rOv2L7
	lrU/eJ2dyaUUEPeh1/b3qnZ4p49/EXkspAfpncA==
X-Gm-Gg: ASbGncsE3b4XOsJrCe0jQdjG+Rxj3vrgjfzNTyU5FhgG5uqxzL6azdj5I31Gy13ucFF
	SAW8r7QKxbUV7MGFLZFahMmuVwp6VPLwUOb00gDoeMmxQ04T38CtXfwJxxdYYli8eKwpdxwuqYX
	KoUmsf3iuLq6oQ5Jf2P/TSj0+V1QWCbHrE
X-Google-Smtp-Source: AGHT+IHdxGQUgnLEP34p77bnggpFFcybep3eX0SRsxItjT7bGVq1s7hLEPXvIi67p9M416/+sOFwds+OUhyOtC4jV3I=
X-Received: by 2002:a2e:a545:0:b0:30b:cceb:1e71 with SMTP id
 38308e7fff4ca-327ed0d64b0mr3515771fa.9.1747173158581; Tue, 13 May 2025
 14:52:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 23:52:27 +0200
X-Gm-Features: AX0GCFuybBjzXgbZgpkhrGy02_JvRvbutbRLwY2ZvnnqoSf9SNzjLph5-OzDFPA
Message-ID: <CACRpkdYwTcHh5LZ7j94LbGYv7BnTCtrJO33j17YbP6s_s3TeVg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: Drop unused aml_pctl_find_group_by_name()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 5:01=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> aml_pctl_find_group_by_name() is not used anywhere, as reported by W=3D1
> clang build:
>
>   pinctrl-amlogic-a4.c:600:2: error: unused function 'aml_pctl_find_group=
_by_name' [-Werror,-Wunused-function]
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij
