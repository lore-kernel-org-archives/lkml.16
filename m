Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719843B1AB;
	Thu, 24 Apr 2025 02:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745460817; cv=none; b=lQ2WuusL6l2wou83ar2zeGeC82SI9L4DEzqqklh4M/C0gpaM/VuYlvjW2Ll+pw+TorFgyx2DL3gCZyELm/nHZcwReqoFk3XWPv9bOPGA9+96iCWsDPNpV5FOgAGiVRYONDnE13Z/S76exKJu6qThpsEN8y5lP/iJSzT7+bXOWW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745460817; c=relaxed/simple;
	bh=ubU7OUBvyo7wi7WpdYTyiErLz39JsBxbMdo44Y4Gj78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbitqB5GhEtSlyiBfEUBTeSMsHXDCJCMmNqeJDvLLfuLBi33iNmUW9j5y6YQTZgdvZnqUyacpOmIFMRK5ccLgrKZOy8K+bJIaFIR7u8D72B5OpjD/I/5zCLJ0J11hsZuLrwKrgLYgsEF339DZ/TLbwi1VnuhHTWmqiIlo8TLa44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso2927511a12.1;
        Wed, 23 Apr 2025 19:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745460813; x=1746065613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaiYIHovh3hj7JhREmKYSulniFNMpmE5/FQxCD5M2gA=;
        b=mMPtXQM7SjCbC/Yt4pnQgQXkxcoxKuzSl+h/nN4CKwSQcdxybpS7iO9cRY1jFvWhCR
         oYOGnUEsPONmNMHyQvLf+SeI8kxzpdveTADyIM7Kr0NX05uwf6iwdWE0tBRSgs2z0Abw
         8Vfm2SKrs1XhqS9DtMiZWL8FTtd2m4MQJotQun3EO0x4RO8OQWoqg3UMhonQHL0Qbvr0
         waxDOYBHg1O2qKrM+mu+GMCqG8Y6lmHvZPRNg+x3n/kRif+0ytUb66vJkrl0AFhqJb2k
         SRl28rl/AMlN4iEyMMat6pKH3P62J4OiwPj2YQi3IrtEur6Ja1qUG47mahlv37rL5Xp+
         laUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqa9Hp6jqhMjJ2+X6uvMSFsw+u6qqrPzaaSZlDwUUG84SSJVvGCOM+W1j3M/99f2lUDzr6guTNDiok@vger.kernel.org, AJvYcCWKRh7w/BYdb6+W+OIw2rurPjtet9fg7udjgkeLOlpRVv3Ol7iGtjMvivjdDnVIzPNNOPZX6B/La9oILXSP@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc/lFRzFU+JkFEeEG/DV4APXRsnDBKUlh1y8N9FC7zFttBWA9C
	9vSdHzxUpQqZddd2loJIyRVKsvXoydq0t2qXeJVMAz6b3i+IK0mY2A4iA7UKMQ8=
X-Gm-Gg: ASbGncswDhy9assWbccP26qgiQTqukJWPf5Zhfs/LTG1ja2JtQLs9Wsxdbh6E5XxDbM
	r3BxWMkVfwsGAqXyoDFBvEfAo78Crr1wA274rn+1LcGJJclO3MJu7+AYZJY4gLy58ReXUk+pE00
	WBQNs0S/2ECKZmmXKr83o8riHW4g22c/dvGIcJZoaQkmnr50cLTI1qeWH/geB2zI4RQ11pEFaQU
	4Ul1f2dlYxOJ1yW6VlkTNpofTgxf5GTWx/DBxPpBfdQ4bYKECgZOPiaZ+JcY9PSfHx/RfNaIJNN
	5IXf4bnUbo2K+UUZO4t2ARhWopFI79JZwEi2QJev0mMBfh6XnoBHNeDKWjA4R5biP1em2e8=
X-Google-Smtp-Source: AGHT+IEUt+dA4lIKNGTNlbu1Si9cdKV3iSsHFbrmpYlcDkUjtQ/4sqjm8X9a2P9zxyAr2Fo4dNnp2A==
X-Received: by 2002:a17:906:ef09:b0:aca:c67d:eac0 with SMTP id a640c23a62f3a-ace59dfdf18mr54420466b.0.1745460813054;
        Wed, 23 Apr 2025 19:13:33 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c257d5sm26704066b.127.2025.04.23.19.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 19:13:31 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac7bd86f637so326031366b.1;
        Wed, 23 Apr 2025 19:13:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1KGkoGpr6MrvFfRDbwEgzUvc1cBdKljqj929AaNG+9hp1WEqFrDKcaG94kTYEgrqiMkgHUkOvaGiL@vger.kernel.org, AJvYcCXYO5VhF9chLg7b+/wuRK4xa/VHBPQ3merB2XHowD5Kp85sNLBAG8BnW4yUl1aq/21I+b6tzDVhmV8QJt2p@vger.kernel.org
X-Received: by 2002:a17:907:2d8d:b0:ac7:3441:79aa with SMTP id
 a640c23a62f3a-ace5a2a9b58mr54104966b.13.1745460811360; Wed, 23 Apr 2025
 19:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
In-Reply-To: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 23 Apr 2025 22:12:54 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-n+=dHzt3b5oDCk3uYm6vBpsFzy-47sDeJB_=rs7OR3A@mail.gmail.com>
X-Gm-Features: ATxdqUHYt94bW4xL2oNxmmXaCgYQX3z4Kme1wD4CvmsQsfVBIo41Uk4tiX7FjQM
Message-ID: <CAEg-Je-n+=dHzt3b5oDCk3uYm6vBpsFzy-47sDeJB_=rs7OR3A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Apple PMIC NVMEM cell driver (Formerly: Generic
 SPMI NVMEM cell driver)
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 1:55=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> Hi.
>
> This patch series adds a driver for exposing a set of registers
> as NVMEM cells on a SPMI-attached PMIC on Apple ARM platforms.
> Those are used to store the RTC offset and to communicate platform
> power state between the OS and boot firmware.
>
> The NVMEM cell consumer drivers will be sent in a further series.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v3:
> - No longer try to make it generic, use for the 3 relevant PMICs only
> - Link to v2: https://lore.kernel.org/r/20250417-spmi-nvmem-v2-0-b88851e3=
4afb@gmail.com
>
> Changes in v2:
> - s/pmu/pmic/
> - Sort dts in unit-order, instead of t600x-unit-order
> - Link to v1: https://lore.kernel.org/r/20250415-spmi-nvmem-v1-0-22067be2=
53cf@gmail.com
>
> ---
> Hector Martin (2):
>       nvmem: Add apple-spmi-nvmem driver
>       arm64: dts: apple: Add PMIC NVMEM
>
> Sasha Finkelstein (1):
>       dt-bindings: spmi: Add Apple SPMI NVMEM
>
>  .../bindings/nvmem/apple,spmi-nvmem.yaml           | 54 ++++++++++++++++=
+++
>  MAINTAINERS                                        |  2 +
>  arch/arm64/boot/dts/apple/t6001.dtsi               |  1 +
>  arch/arm64/boot/dts/apple/t6002.dtsi               |  1 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi          | 50 ++++++++++++++++=
+
>  arch/arm64/boot/dts/apple/t8103.dtsi               | 50 ++++++++++++++++=
+
>  arch/arm64/boot/dts/apple/t8112.dtsi               | 50 ++++++++++++++++=
+
>  drivers/nvmem/Kconfig                              | 13 +++++
>  drivers/nvmem/Makefile                             |  2 +
>  drivers/nvmem/apple-spmi-nvmem.c                   | 62 ++++++++++++++++=
++++++
>  10 files changed, 285 insertions(+)
> ---
> base-commit: 2e0e70c95077172b29a5b13716c4b159d578e82c
> change-id: 20250415-spmi-nvmem-e08635316175
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
