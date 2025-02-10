Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF1E1BBBF1
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739178792; cv=none; b=hISLsjHqJktfmyV3ORu4vgk5MH/FVnWzskGc8I6vo+t0A/AjaWjnGpYoWaq8MCSzYT/obuf3u/dM/Bh8VGzNuy4i8UW+o32tGGVzEc++wnUYU5XxXcpPAvgFteihe9lsm8VVYnzxcYUwJzMVE1Ojr/gqSNiyvoxEbDHtjzKjud0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739178792; c=relaxed/simple;
	bh=X0/PXNOgWGzr20OYVC+mAkplv1xOmw1KN7bZLZtDOzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TebUtVraIhvauYNJ3JEBZZjjHFLKYXf8fD7JyEDYl2v4AdDK1gEztN4ZAV2eQCA8BWQ+IfQOwlyfdgmPWVFKIxCxLh76Nq2XmJkErRi3exKjBB9QNeYYKwDMxImAYjLz1oH85mwS5lDI1660+diuv6C99ZGecxtKjyCcOxlzcUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fAbRhpl5; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fAbRhpl5"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6f9e78593b8so7115207b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739178788; x=1739783588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0/PXNOgWGzr20OYVC+mAkplv1xOmw1KN7bZLZtDOzE=;
        b=fAbRhpl5xH6/mhPqhCH1TJ63F+KmyaPrUaXvninCjnE1PQS2j+4xEtFK3dFY3VQi9y
         94qhnwL/eLKsJYbhIwA1vivoVu9fbRyX53wHRu1yIm14nlWwBviPepVN3XXDLYanYsmq
         bh9zrlrQZ5ngVyNTwdsE2pTty9HVHBDODq2kVs+vu2joxeB9+9l828/kKSpK0HeNhuE/
         DCCtUUOsExu7dfSBfOgIc/Y/EYf9Fuk/V0E6Im0eO59Cp/09BaOB0O+fcHDHC5O5ddQZ
         M9LfvZGEuZm1RePNbAozdGWyw8KdGd7DS0XLB607lO+Yr2u2Cw6q1Es3QjnEPc5lmQTL
         wJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739178788; x=1739783588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0/PXNOgWGzr20OYVC+mAkplv1xOmw1KN7bZLZtDOzE=;
        b=TIhD1+mXnegfEZ2lIJ5y0cMwv8vubLDKPuLDW/7sAYwOKdD+/yGMAZbYBGPcr3XB0G
         yskTBofcMf/frPrERFOPtlTiJabcgFnh7Sm7JC/b54S/AriwsRkaa2bz9M/GpRJTYIKa
         SkPhFmcpdakDy+QDepScCYcCGQc4SCKg3kJ2SOBxy8kkI889MhTZdZFnvASy06NEZRJG
         GrysFr/ubyUu+RQVkReV9bHLaLEtY0xhvPkPizl6uoOk59RdgqXbjUUoYuO/kjfmKpMG
         nxTkKkK9WdV9QpI9RzZGj7EgOLuApBRpjyM+4hKbdHZp41/R6lJoRZysjUJhD1m7nnI/
         i1Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXb02V+zZWhj4i1n0jFT/gBK0GtQoVWFDPSW/UMDMXZFwc6JE2VTN/lJ6LtwJI/vhOaEFqHj3eJA/Qn5oU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6n3La9Y64YKxajnRE8hP8yhEtIHwpGmYT4+2hhyKcmIH9XJNx
	2WgTVl+xFuLWQ8JGnmBDQoMF0QrU58RaLoFwT4EsFC2edVE2fZeeyaB7XH2PEvM8YLund8eJmOL
	v+z5gq38qx5FXTf9NO0h2iSLqfWTWuyFDio7j6A==
X-Gm-Gg: ASbGncv8smFRZM7a2bqVd2oQ1BvCz3tt2IXNxbWPbk2I41/4nvQPjGnsN45BdZ67C/e
	y/YSOPpIkS11qiz8h0u0SOcljLG21MZII3OtF3TBIIOSUoBN521sR+3HdZ751z/XJhk4s1FkO
X-Google-Smtp-Source: AGHT+IH4sdhIuLACrBWvBB25/H/W2wr5Xete97rMTNDwftuaz71XXeB0d2e+IethOrADM/o4py/UCwCnCABGKhL3Ors=
X-Received: by 2002:a05:690c:45c2:b0:6f7:52ba:ecc0 with SMTP id
 00721157ae682-6f99a64afffmr138750697b3.11.1739178788584; Mon, 10 Feb 2025
 01:13:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203121843.3183991-1-andriy.shevchenko@linux.intel.com> <20250203121843.3183991-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250203121843.3183991-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Feb 2025 10:12:52 +0100
X-Gm-Features: AWEUYZnWdpmJ8wm_BCN0nhuakUPiK-G08A79OENgbUCHTeTHJ5SP5B35rKiAX_A
Message-ID: <CACRpkdb7f6YH3PvZiK=GXx=Jbr-xGUdeZnCOEDsozVociS3F-w@mail.gmail.com>
Subject: Re: [PATCH v1 4/7] gpio: 74x164: Make use of the macros from bits.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 1:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Make use of BIT() and GENMASK() where it makes sense.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
