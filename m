Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF062DFA5C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703233; cv=none; b=pIqg/ESU7Dn9ivMmV6n2R7+/f3HfNb1aNhVm6WM3QsR1S1kVrXA2ZCvaPKC419cS91ZKemMWIIPdhhzoqEpyw4Q9nN4Wgwu14lvWVIq4oHVFB2rlym/CJYs0anJpWoODZvDzAsRyzipIp221zJpEZoVUUE7LgCuIRczKjE3YiQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703233; c=relaxed/simple;
	bh=4yPoe62szhk9VR7VjlQTwciHhDwhOMyk2ugho1Qd7ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ie92WWdfVUHOIIkAjO8zF/l6P1SOJeDnGl1SMyAC/wikfL42cEMmqI6CpHV8BwpP1M8/0zhkbCCfdkost8ULU3KLTIS15U4X/E8gmX5dvi1ZDmFk2zu4dL1qSHSnzfvZ/T3TWH/mdxMjCRiJJx6cWeVxuybJQ57cHCym2ulLF2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sH4M2fRv; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sH4M2fRv"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bfed67e08so51251951fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703230; x=1745308030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yPoe62szhk9VR7VjlQTwciHhDwhOMyk2ugho1Qd7ys=;
        b=sH4M2fRvg8u17sDlhxuvShic6S8/MK5+Q2ABT86a+TpcvxC5KSvSKGHL7vQZuw9SUX
         NEnXpkb0JKQHsNOqWK0bTT2LcGeqi8PkK7rSRU/goTMkTv27YqDt1IwoJdNFKickP59H
         2exX4cBWyhC+Cx2d2b7qzUoy9JTAJNt5XH+J8QCzxcqMHjQvENJGdGY17BbuX+4keZ34
         3C7COqZ10VuuogB1SiwviVlGahlnJXP7xfxoPQDk5122iBtB6OBG7dWMR4T3NJKIXwsP
         AyFyKG3KMF88UM8Xvjq2ZYoCkJblK1ynE6OC/XDE3hQjiM6cu0iUH9cBBwAha/7jRbPa
         ETjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703230; x=1745308030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yPoe62szhk9VR7VjlQTwciHhDwhOMyk2ugho1Qd7ys=;
        b=o7v3mDN6nfO/TOCsRUXBlt2yTrPaXLsb1xTs3RLz08aBCEQKQLm65E3IkC+u/yoi3c
         kq9Cw6sTb+rKUiidErmqOya9+8XU7G0M/hl9FWYwCY9auSrL0ofBYdI7h2iffOUkhodX
         pa6W+gq50EA6qvOzYHrJXquj0F1bziPpA1f9l10bP1swjX1bHufsr6IQN/k+yuv0OzFy
         qwbp8BPV1ndt9SpuTVK1mx7ZRUmRMEAenE22Az06U5yABJKNsgnHD6Wu7VOfi1KVPjyu
         jAL5x0UEmcgp4aAcj/CqF97eO5W15mGS15cnQxDBX5P94B+uxrRtsO7XpNv932jCIS3e
         XZFg==
X-Forwarded-Encrypted: i=1; AJvYcCWxEog5wNSv3/OuTpm/e7Sb/7dnOHTiHrBJ722aA9eqelqCuVbyAZiFZ+sH6v/ufXV8WRQsht1wZRHW//I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw550xBbrKGPwukSEAn1N90OSaidweiFOWToV+x9vh0z6TiBl4v
	IINte7O5acPrfNXlpvcM6L8INJpCXqXQT6LxXs1Y3/kJiyrUUbiwSeo7bt7gVNKhjwMltZdlsPJ
	tapFPnFinVxFnh+JPRt2QPpV9KhcYMrlj7MCHFg==
X-Gm-Gg: ASbGncu4Kh9pOC6fzmaTGj3Ss5o6sPJyT79kuZKdSjr92HAx4FPeevAhGOcmu27DBr+
	groEGbVa/AmYYLWkEDgmTfMm6hjfPlULEikXGxWzOc286nMe27zIh3n8D8fTCoYRtDSj4uT9QNW
	ebpLzqeTrPZne1T35iSbz01lw20isVZc8o
X-Google-Smtp-Source: AGHT+IFXq663dVyU8zMw2WCvomgufBQU39frF7BHP8IkhexHxE7q25QYQkfpa6jUI5F57/EgxHrlEfhdYTnxjnPcuUA=
X-Received: by 2002:a2e:b8c1:0:b0:30b:ec4d:e5df with SMTP id
 38308e7fff4ca-31049a80d31mr55920011fa.34.1744703230263; Tue, 15 Apr 2025
 00:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250329181506.890043-1-john.madieu@labcsmart.com>
In-Reply-To: <20250329181506.890043-1-john.madieu@labcsmart.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:46:58 +0200
X-Gm-Features: ATxdqUFkCKTY5402WfMD7L4Dn66nYTF8rexDIKyTSCReHIobCScCzKD7ElX6-PM
Message-ID: <CACRpkdY30jnwByCpsAR0Hvmq-WWMRcX5-2PtVtOy-_TD4GrHGw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: apple: Make regmap_config static const and fix indentation
To: John Madieu <john.madieu@labcsmart.com>
Cc: sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2025 at 7:15=E2=80=AFPM John Madieu <john.madieu@labcsmart.=
com> wrote:

> Mark the regmap_config as static const since it is only used in this file
> and never modified, allowing the compiler to optimize it and enforce
> const-correctness.
>
> Also fix minor indentation inconsistencies in function parameter alignmen=
t
> to conform with kernel coding style.
>
> Signed-off-by: John Madieu <john.madieu@labcsmart.com>

Patch applied!

Yours,
Linus Walleij
