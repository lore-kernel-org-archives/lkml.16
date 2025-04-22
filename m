Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E26D2BF3CA;
	Tue, 22 Apr 2025 20:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745353569; cv=none; b=DNyMiGChC0u6KX9w8BSRQwYF4lJOYHPUG94j982+s4gA+pNHvQHB+jYffTbkf1haiyPsZTAHu3zkNBX7/9triepCLoauhVVZBnh4sOGkRdlCUGrVeRG1auR+ixZc33u9esG1gOWA8pazaAMi2qhwnUKL2h9iEnizuvGapJAn0tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745353569; c=relaxed/simple;
	bh=R45w1oT+Q5lZ5f7s034dgLrxCLIIDmjYFKcGzlLahuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=XlsdVRyEl/rMUwco/GV8gfs4Y23Xt7Lc1eGfvyLtDn1UB204jteeQfkcBkz02qv/tQZBUixhOEK6mIRz7gv5wIgEgZi1GcCPhll8gJiw8oVatpdfKIFRd7D65JmIkVGclSKSViUzTX6VfUeM/wtByxolh1QP1kpnSptyk+scJ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGTgQWpF; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGTgQWpF"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2d071fcd89bso1382049fac.3;
        Tue, 22 Apr 2025 13:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745353567; x=1745958367; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoutxDXMBduqXkCuqWjStm0QPuDtQY2bdrFerkEpW68=;
        b=AGTgQWpFSXw0c72VcNKpZbUYaQqSO9nacb/mr3vSox7R3AYuxhxRkEWjwWS60Hjxg/
         i93fH8QMgeNZP0l2IFtfZGbPkiO+ZY0N0TaiGZSmdPaMTVb/CKz70a9wZsZghr+LJO46
         G/G4kqkpfCz/x5lUcLiwedeY6VV1Ihj/m4okOob4hsLMhVTfMdxLlpZVWzR49JMtxTSu
         cH9+fljyG+Y6J3fR9NbuuA2vzUlagct8FY64SWph7qWoeDpXse80gI79+laaE3aiSKx5
         fYjpGo5alGeLBeB4Jj6ofRFsne2rkevxxsMehvXp1SSGs3S/NtAs6iZPgRKMydPVlPee
         0QVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745353567; x=1745958367;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoutxDXMBduqXkCuqWjStm0QPuDtQY2bdrFerkEpW68=;
        b=Z+taB/HeS70TNKSxbX0DIUudlgtv5PBCQdyRfDDFMZIs0Ju6VOXRQ+gVqrlZYlSgTE
         l5l9fbaZSsaga1yuQ8DJHm5PJiji2tSv75e02qRjU64Jf4gyntBpxsNw6T9YcRPTeItW
         EcPT0NUvUqcDRhOS1JCAEO3A0DLL2YCrKqxREPBflEHA8XbtxVyVf9n1/ndX5r5bCEly
         eFvNaAX0Qgdb7LvfvDDJ+WTc4Dxkcpprix2G8Z9VC1egQXC4G+XMlFcpwTfvR78ONMLm
         o4klwOmGjPnZl1l4vZIdLy4vRN7bR32A/m1gtyGnY9fuEWUn9W2P3h2wzdwIrQ57+eNw
         LciQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzDsGfnd4ixsnl8TzFYXKPRJsEWLxCuA/54054VdBS7lxbDCPzOeSmYhngFelnGty6gGCrfc182pNf3ZPd@vger.kernel.org, AJvYcCWm+h8A4299iTzKr+PpUKEcXQgyNr8Eqy5hTkUrCOzHRwLsNuyDBnUxGLEjpPYDJ+Vb9uyWocqSFu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPlA6L0Ou/xfm/I16mbrxbZmhbpMOF8bsaufhLevrpF4tl2MeK
	fkPRLnPCP1kWVC8tkTkhaTC87Mw2+gxXAaT/zbRYi4Tl4QGxIpeQG4oYFlKSNKYh3hAkt04WSHQ
	vDKcA4W96kUjObcz0o09t1o8Tdc98qw==
X-Gm-Gg: ASbGnctU+OEEf9MFu0VXZFl0x4wS1vAbf62GBbayON++KX1vjxsZmK1FiRwm0l5Kf3k
	QkkBZYoXcwUvN4Skb53UikXGhvT5WRJI+DCR9k002fUN+9ipyv7M5QIms4supa4ymd67fjSvbgW
	GsW+2NQTBgzGQ5rS9TKF6nYnwH5vs6Nk1xVznKlGznNnwBshmJFMJXcRw=
X-Google-Smtp-Source: AGHT+IFkAZywjoSDdkL2hP/eBGjk1HB0egz5l60coUbGPSwKPLGDjvJRBE1HdJHOzv6S/R4K/hCFH5XEocQXUmUdn/I=
X-Received: by 2002:a05:6870:ac10:b0:29e:2bbd:51cb with SMTP id
 586e51a60fabf-2d526d6e952mr9594105fac.24.1745353567025; Tue, 22 Apr 2025
 13:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318181930.1178256-1-anarsoul@gmail.com>
In-Reply-To: <20250318181930.1178256-1-anarsoul@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 22 Apr 2025 13:25:40 -0700
X-Gm-Features: ATxdqUH6-tftE_bForjP8SC5aE6ZcyndqNGbLVHkh__U5cPkKzAMq9GnA7-6_1s
Message-ID: <CA+E=qVc7tG7LXA86c_Urp0B3a+Oo6+ssZ_vDp8hvDDW-n1M6cA@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: rk3568: Add PLL rate for 33.3MHz
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 11:19=E2=80=AFAM Vasily Khoruzhick <anarsoul@gmail.=
com> wrote:
>
> Add PLL rate for 33.3 MHz to allow BTT HDMI5 screen to run at its native
> mode of 800x480

Ping

> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  drivers/clk/rockchip/clk-rk3568.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk=
-rk3568.c
> index 53d10b1c627b..1c73e18a9862 100644
> --- a/drivers/clk/rockchip/clk-rk3568.c
> +++ b/drivers/clk/rockchip/clk-rk3568.c
> @@ -89,6 +89,7 @@ static struct rockchip_pll_rate_table rk3568_pll_rates[=
] =3D {
>         RK3036_PLL_RATE(96000000, 1, 96, 6, 4, 1, 0),
>         RK3036_PLL_RATE(78750000, 4, 315, 6, 4, 1, 0),
>         RK3036_PLL_RATE(74250000, 2, 99, 4, 4, 1, 0),
> +       RK3036_PLL_RATE(33300000, 4, 111, 5, 4, 1, 0),
>         { /* sentinel */ },
>  };
>
> --
> 2.49.0
>
