Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F096278F34
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746791433; cv=none; b=uhdKesm+3ChhKwLCcjBJYhg3e7J+9jeayIsQS1YfOwgPr6R97cLAGfbsRdWpPRoVLm2LVc2mBkUbBZFqdVzkzKZ6u5h+igPpcjnt6TPid0NEEnA9NKfj37p97OgZZs6zU8dPb0UEUkq4JJhN5WvLQt9z/dU7k7Vk/P+BxKGsexw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746791433; c=relaxed/simple;
	bh=6bSX9UNo+ut9uhyeztVWH22aZ+WPLHdTGC7kWwCUCXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dWhcnopxQ7hUbTCUwYAftTepTwC8kzqLm00FDD/XrIqVRfBE2mvEjK+Vfv3fMBZvYSOcv0a/uDrHDcKigl5MCQUY7Pu96ySGH+vtzBbuzZU9nrTpE9wiaqLAHSffB/G0ZK1fOI/o+bRAjmDHktr/BeXRTT8hDgO9Gwm0eMQpIp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rDMP5Xzr; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rDMP5Xzr"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54298ec925bso3078422e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746791430; x=1747396230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bSX9UNo+ut9uhyeztVWH22aZ+WPLHdTGC7kWwCUCXg=;
        b=rDMP5XzrQ88umTP+9l67/zJpEOw9Tf5QRqmG8aid0Jm776jOYiSyw2ws4geCLljooS
         JCnksf09yvbYgNnZrOpyZ4cmJktwmGqdGkqo2vEo5Io5P24KiCjl3aKESEHxnLLWs1NH
         2lUA37eKUFR5c5QlKodJORWKFRN6wN+LCC8S3RKJcsImFCoknUUjmZiIZOSlyaFI/ftQ
         iz02M+0jkawlqKfEL0vbGX54kzdzRkX5lP4Sge71epwG0v5DENaKpj/P1FEBxYwk9PeI
         eRdTUV4XUD5FraSmI5vLEuJ+K5PdCjHH3uAAxFV/2TVnQpF1qz7ZGwUW01bx2ByhIc/c
         LIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746791430; x=1747396230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bSX9UNo+ut9uhyeztVWH22aZ+WPLHdTGC7kWwCUCXg=;
        b=VIbfMaH4ZJaWwszcHqonE4UKazVwx/hpE4UY/0/BlZex8TjnTHeXAzrEMYOn25qA+c
         yQFmzFHhN9tApDcc3KDlvTyZ125FPHbgumIqB9cYMjv8n4G2Iks7hObErhT/3q6OCi/w
         Ycd6GEF+tAigKsac13jdoaKvqEDYECkZYRsZnN9D+a7iFlok7E0BqjYzdpaqBsPw9OIM
         K328qzQSueH4A7djcKxg+tX26fJeEExfZlisJDb6RcyjOi/asZLy9mZJLzZ1+griwRvQ
         FCcQen6Sv050czWdDf/w08APs1UXAOwyt2RIS/5fHyS+ESE3Inw73GLssk70PJqsg7GE
         sAXg==
X-Forwarded-Encrypted: i=1; AJvYcCVBGakDcaxJbffXLvmc/UFYzmjKveDkbvsgWagUIHSBEzTY8ymTnfo2DWw9+psXWj0r93ulc68P+96JBpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcPQmOHvX5fLsmLG47hhMSe8yFFUuPLl9soOBGcYrI3n2eVlIZ
	OI0jSFTvGMwwuYogwwxC1A1TlPteiX9ouqRDIqj7NujUT/vrDjIZNaDwp3xhqAV5Byldz5nRCpz
	Wnj4oSvN1vIwL2698aYGZI7ZfDwoaBjUXdEL6uw==
X-Gm-Gg: ASbGnctzxXrXadThFRSAU3ua7QNSkhKSJKE2hlkvFrZmY0NGNKZWSepICmw/jGuIKXG
	SyWPEpixX/rzFaigl6FLCr6knbGKKNNUPAbXWnsek/qDBZDi0WlJtM6hUOO0d/DQUD+UuByaoGQ
	wh5kjwk2XEvRWrZ2uncD67WsiQ8dv+0zk1
X-Google-Smtp-Source: AGHT+IE9OA/TgX88UK8wnm39DMsSy6I7xruaMSROXFg88YbOwzBbcaNlmJPRpQ8Ckx3l33XEBcNwePAgT7TtPdM2+0E=
X-Received: by 2002:a2e:a991:0:b0:300:26bc:4311 with SMTP id
 38308e7fff4ca-326c4575642mr10757241fa.18.1746791429976; Fri, 09 May 2025
 04:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
 <20250424-01-sun55i-emac0-v2-3-833f04d23e1d@gentoo.org> <CAGb2v66a4ERAf_YhPkMWJjm26SsfjO3ze_Zp=QqkXNDLaLnBRg@mail.gmail.com>
 <20250425104128.14f953f3@donnerap.manchester.arm.com> <CAGb2v65QUrCjgHXWAb72Sdppqg1AUxXyD_ZcXShtkRSHCQBbOg@mail.gmail.com>
 <20250425160535.5a18adbb@donnerap.manchester.arm.com>
In-Reply-To: <20250425160535.5a18adbb@donnerap.manchester.arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 May 2025 13:50:18 +0200
X-Gm-Features: ATxdqUG6U2bPxTcfQiBy-oW1Lju29rGeV9-TYLkpQrHjbRn14HSqGi03f0yvO10
Message-ID: <CACRpkdZH+NnP0-GkLe+nHK-Oi_Z=FzPaM=k1U-gZddp+P2+DTw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Corentin Labbe <clabbe.montjoie@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 5:05=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
> On Fri, 25 Apr 2025 22:35:59 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>
> adding LinusW for a more generic pinctrl question ...

OK!

> > There isn't any assumption, as in we were fine with either the reset
> > default or whatever the bootloader left it in. However in projects at
> > work I learned that it's better to have explicit settings despite
> > working defaults.
>
> I totally agree, but my point was that this applies basically to every
> pinctrl user. I usually think of the bias settings as "do we need
> pull-ups or pull-downs", and if nothing is specified, I somewhat assume
> bias-disable.
>
> So I am fine with this being added here, but was wondering if we should
> look at a more generic solution.
>
> Linus: is bias-disable assumed to be the default, that pinctrl drivers
> should set in absence of explicit properties? Or is this "whatever is in
> the registers at boot" the default we have to live with?

We have never hammered down the semantics of that, so it's a bit
up to the specific driver how they implement it (yeah a grey area...)

There are many drivers that are carful to not touch register boot
values but others who set them to some default, and people
have different opinions on that.

Yours,
Linus Walleij
