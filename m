Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BE3175D53;
	Sun,  9 Feb 2025 11:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739100069; cv=none; b=dibh/aTworb2OEHa0J2dY44C+MZCaf1CNDKA4ngZPoOeo4dn8rvQ7yDGZe0BdjkoazpFfmrv9soOovSjs6va99mY80ja1fMV3MCxxztG4XUnT5losiKRuR860dRDBttlUiTAdEUto5aNF4qIBkZFWdFV7KhvcSvXFR/MExrPRIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739100069; c=relaxed/simple;
	bh=CAnnWyCze9cfss+SjVVJmUgbHgwmBOf/0t372kG3MqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pFlwMYI0+x5pQMIRje8WGUTd2VLe4FPhj52rGie1atMF9gFb69DHanmv/UJKu1fzwAlnq/o7YGtrDvoA54d6qvYrtDAIL19/Ym1nnyxQprE933neX/5I9uTenKTCutET/chDyDclG9VXti41pyTJKvtM7BjhZR2gW7iNW/s1UPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab7a4b40cc1so189331466b.0;
        Sun, 09 Feb 2025 03:21:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739100066; x=1739704866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3H7l2zQeJCQ6IJMd5f13r5y864trAdM17LlrOlM0f8=;
        b=nu8sLX0JW+JNLCtmhJTjc9fyYtYwjeOTaRQxmcYu3KJHTV79889B92D1/6vP+SJtj3
         AgZdX48FmFarYgjqmIV7zHIZfNwq0+lBnxrk27RXY45oVhmMrO/neUJRTmID9oJQMxWA
         4rQMMdnAahu0XbU7uN5YdQZxJDbKAGJfHbRnCwOEKvRv0bsR2brfrefqjMvehDfCmRsF
         +PW0DTM1Ky5r3/FGbpnb/1DvOsGFQb8isDs/aVX6x3zBSaC5vGZZ2v4GVi+7tNSGlrGZ
         j4XXAI66sn2lzY1loLzHBzRNyFIGNpiVT8doQkKn3GnSz4OUvso8Ta1iqz4Fy+4mIY4p
         ogcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVORzciJY11b5HApEl7Zn3wirxNbyfngzUgdFn/Lm/yXF/ZUGhs9dDnZEIVzpTzE+xqGrsK0ES7wQ6/zgTk@vger.kernel.org, AJvYcCWkqe0Hj/XZCXnSxhR3qHLqpq2iUPKu5hvSlzoIAKk/BOLtq7YUpYtMs/AnAuAYYcr2SEXVtkORA66g@vger.kernel.org
X-Gm-Message-State: AOJu0YzKD1m5cXPelal/bz36sjL1KQI1y9PdxumkA2ZWA+7T29YZgOYK
	LYhQB7IxRjx8aQ+vBJioCZkI5HZ0rEteaw2rk3nfvNinhZQ+fE0uny923UrY7d8=
X-Gm-Gg: ASbGncsYz/SvOUqwKCYHJ/p2WIYEADwag2+mXJS6M1WeiJ/CbjnRCt2LKw/CEw3sk46
	SbcxNBfQm62i7syBz0sfEoJmVWRyRqdruBBjx2UaolC7Vcn7oESv7O8XwHID3yPS1olVjV2mRvq
	AJ5SyYB4oeKLfQ2GlOjYR9fYtohGRQA6OAS9YYkl8U8I6kR60bLNUAMS2agLb+RafkqfblyX1it
	YvO7gR/u5e3nNlPMz3w8oS33jPlt3jKssyrwLT84oqNy3mNtaNqnRUPDHVemzO00mACisMLcAGR
	IJeYt51lsjg1cT1yOMS3/m/Z/Q9pgVeh9y2OxyJWzGnK7Q==
X-Google-Smtp-Source: AGHT+IHI9vbi2UYTE22yravu1skw/arBmX+qsEwA5s50tjb7ZOCS6oUv5zxohlE3nBYZNJICBhgbxQ==
X-Received: by 2002:a17:907:9628:b0:ab2:bd0b:acdf with SMTP id a640c23a62f3a-ab789c1d683mr1119631566b.36.1739100065913;
        Sun, 09 Feb 2025 03:21:05 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b4724c38sm118024066b.121.2025.02.09.03.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 03:21:05 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5de56ff9851so2898031a12.2;
        Sun, 09 Feb 2025 03:21:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLtlNzjIjnkkZjtN9a7a/u9oO34fzy2uoQnApa44FIWLqnJrLXrJpXwR9t9rMVNL9AfDH576xcZ2L2fOKS@vger.kernel.org, AJvYcCWW8SHrX8Wen6/2Kn/EhuBx6siVVN7wPhUmoEhKB+m1DhIhibNUYmZKq+asMf+ETp7hxQksjuqKTTuS@vger.kernel.org
X-Received: by 2002:a05:6402:4615:b0:5dc:cf9b:b033 with SMTP id
 4fb4d7f45d1cf-5de44fea8aemr10414132a12.5.1739100065489; Sun, 09 Feb 2025
 03:21:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203114417.16453-1-towinchenmi@gmail.com>
In-Reply-To: <20250203114417.16453-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 06:20:28 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-zEy3pxS06arXfpvkX5p1=C01M7ryt6ymGjMyVweaH1Q@mail.gmail.com>
X-Gm-Features: AWEUYZkUL7KIDLWrANT2GMLY2aCBOSjId3KzpFCyyGq6xdbnQ16cXMqe9iLjzl8
Message-ID: <CAEg-Je-zEy3pxS06arXfpvkX5p1=C01M7ryt6ymGjMyVweaH1Q@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 0/2] Device Tree for Apple T2 (T8012) SoC devices
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Aun-Ali Zaidi <admin@kodeit.net>, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 6:45=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> wr=
ote:
>
> This series adds device trees for the Apple T2 Security Chip found on
> some Intel Macs released after 2017. This SoC is based on Apple A10
> (T8010) SoC and, for many hardware blocks, can share the A10 compatibles.
>
> Changes since v2:
> - Drop PMGR nodes, moved to PMGR nodes for A7-A11, T2 SoC series.
>
> Link to v2: https://lore.kernel.org/asahi/20241203051147.110980-1-towinch=
enmi@gmail.com/T
>
> Changes since v1:
> - Use imperative mood in commit messages
>
> Link to v1: https://lore.kernel.org/asahi/20241201161942.36027-1-towinche=
nmi@gmail.com/T
>
> [1]: https://lore.kernel.org/asahi/20241203050640.109378-1-towinchenmi@gm=
ail.com/T
>
> Nick Chan
>
> Cc: Aun-Ali Zaidi <admin@kodeit.net>
>
> ---
> Nick Chan (2):
>   dt-bindings: arm: apple: Add T2 devices
>   arm64: dts: apple: Add T2 devices
>
>  .../devicetree/bindings/arm/apple.yaml        |  41 ++++
>  arch/arm64/boot/dts/apple/Makefile            |  16 ++
>  arch/arm64/boot/dts/apple/t8012-j132.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j137.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j140a.dts     |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j140k.dts     |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j152f.dts     |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j160.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j174.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j185.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j185f.dts     |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j213.dts      |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j214k.dts     |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j215.dts      |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j223.dts      |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j230k.dts     |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j680.dts      |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j780.dts      |  15 ++
>  arch/arm64/boot/dts/apple/t8012-jxxx.dtsi     |  44 +++++
>  arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |  19 ++
>  arch/arm64/boot/dts/apple/t8012.dtsi          | 176 ++++++++++++++++++
>  21 files changed, 527 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j132.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j137.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j140a.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j140k.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j152f.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j160.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j174.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j185.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j185f.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j213.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j214k.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j215.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j223.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j230k.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j680.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j780.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8012.dtsi
>
>
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> --
> 2.48.1
>
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
