Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB6024EF7B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778961; cv=none; b=uQAMbgdy0esWydOT47U0OUA8w1XaBlrtR1nQUfXy8E0DkIOIrPgq1xrt58aYWoJ17a3PTVv+du0prC1qSTJoOCjT22egHJ4fY4kEcTCumfveZHgQj4m6d2F52nmpS8CelHd3K6ZDixbzOlI938RNmFowq0PsHAehL/6DIBQDj24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778961; c=relaxed/simple;
	bh=ratdE9jXoB0SJ0Y0w3wsjguEzkshW/vmeLVeCaT31+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xrbqt3GSDGwyt+zDXIhqbeeLL4ngvAdW0MdAhCJpSncVO71k18KI8XVhWg7Q2yDshmSAae0wl6UDPoPCudpacd2fsa60DTTdtoft9lGxzSH8f7KaL16ofIhVpdKSUJOfit/t6k8XU+w+kbZ7L4WE5IrzAjqG2rjz2o69zVJYTTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kXxQds9W; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kXxQds9W"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-329157c9f79so14139771fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778957; x=1748383757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ratdE9jXoB0SJ0Y0w3wsjguEzkshW/vmeLVeCaT31+I=;
        b=kXxQds9WJE5ExFVqwoDfR2GDf6QmPSyRr2o5LlJd4431twbWsr86m523JEQAppzsA3
         HB3lHzmVD7oGKUXV17UntYDhSqYW+BBMr/Wx07HwH8fJLniKqtKeISFbtDlbRLqExHkj
         MzhkERe6mSLNmp33IbTI1W7Zgp8ItpmHPfe33U1wwSLHE6DCkGUIAPSPqLhAXtvwu48G
         2xnKNy269clSO3A3OzpFRiKLhrCEtFtr93WR3SiSnjKsNdPhTqg4y/Yzra1MEEeqtVuv
         9ZmF/LSIKsBJF73v6eBRXyR3T3LRCUfDiQzdL6x/T0WgUZagwUBAW/kcqKqO6OnF0Y70
         cgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778957; x=1748383757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ratdE9jXoB0SJ0Y0w3wsjguEzkshW/vmeLVeCaT31+I=;
        b=W9BM+GB+O6Z/L1flgo6855uqhcS5UB0cxv/FTL+pn8akZrG3pnviyyF6vvgnmYWmCl
         j9VVYdrvJazwJK3AeLuQ2jYkTQi/mc8NnvtjO/euLCtEd9uPhUvcb+igy03y+dwUmdqO
         Ipd70AELx6GBoEBP3zHAY6ABf+ygxUfVIxp8Cw5GwGmgvu4r4py6jnIHOySjySkF8JtS
         Uhlh3qPsNEfVyuG9/IhzM0mdgkODgEl5kB7nWbLVyc/v+bWQIBVdlGc4WJafAc3VVx51
         aQb2SJTSwmP5QXYcpfavg60UrMkt7r6q4VcAznhsLY7MTF1/yIicPSlGv91Bpe1wv5SK
         7Muw==
X-Forwarded-Encrypted: i=1; AJvYcCUviO5VrBVdgaDhnJeG10/PajIDx9G1W1l1nfWYFYNivF/yjBmieq2X0Z7NfrlokfCtFSt137vMDwt7unY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs9OR/Sp5RQOZuhTZEnmmjQZDCfO2Wd+VjojUYqzGbB9h9Tpt2
	5R3z1TPtcbtJCRTCDm1wI9Y9lMik/TrkZmWoiuwmgXICE1jj8lxQLeQ3GoCRRjabAYgQVxQrDVp
	ZoKVC/RRDJoSjFczQ0Xc+wOdT4IKnqLL8wYuGnU4QNA==
X-Gm-Gg: ASbGncseGQryA5ur22Rp/mavKWI5Ed28CP4UGVLGLvreZpZfDn6qnBxAAhvB34V3owZ
	i28r9ilDrIJKqwnHozNiLCAzhzOTO/ags1BDlloGNEyQ8BgyZzcxby4bFc5nh5ljVcfJp7IQp/c
	1BR7VGwxJKdqbTuqHHHmePDgLN/g8RIgJ9wqpC0AAiIfs=
X-Google-Smtp-Source: AGHT+IHDDQJhnWX2kmTO5v1Pk0nimoh123FoAZWbqbQl+FUgai9VCQfwTjo/Tn4PNUMetJyi+2gPAW5SomZT1SLUvWQ=
X-Received: by 2002:a2e:8a87:0:b0:30b:d05a:c103 with SMTP id
 38308e7fff4ca-328077a2e75mr64717311fa.29.1747778957098; Tue, 20 May 2025
 15:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
In-Reply-To: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:09:05 +0200
X-Gm-Features: AX0GCFuwZ5Uj2GFu8v9SUCd9XbxxK9oH9Hmv5mkp9JeCnQEfeHNWxb9r3Wl8bto
Message-ID: <CACRpkda6D_OayG2DDFG6+sQ5vyYCrTojHs2H1ZVUMw4rpbuC9g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add 'ngpios' and 'gpio-reserved-ranges' for
 vf610-gpio driver
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, peng.fan@nxp.com, wahrenst@gmx.net, 
	conor@kernel.org, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 5:44=E2=80=AFAM Haibo Chen <haibo.chen@nxp.com> wro=
te:

> Not all GPIO ports have 32 pads, so add 'ngpios' property to specify
> the number. This can save some memory when alloc bitmap for GPIO,
> besides GPIO tools like gpioinfo will show the correct information.
>
> Some GPIO ports even more special, e.g. GPIO7 on imx94, it only support
> IO0~IO9 and IO16~IO27, so add 'gpio-reserved-ranges' property.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
