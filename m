Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E168D19E971;
	Thu,  5 Jun 2025 11:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749122606; cv=none; b=tP2R005OOlgzfhuMCXTKCudMpR6HwptfN9l0qvpUkAuPYOmNIJJCOwDuZxNFrPdSSmLn0sSyDjxEpSSDmvQdRPb/U0uVN5qO7qdU6kvz7NjrDuinJ8DDX8NGBgQtG4JJubzw4oeRVP0pPxnBRdZ8bm8kDsXDsjuI1189jLr0iO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749122606; c=relaxed/simple;
	bh=w7P8M/GOhiQDpkOpSltDYiC99AIvKxxRniJhDvABbU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dE+ZUekg7pWismFpk5zc+lqnFbg3bledCiVLxJscqGiUUWKoDvfhz+ZygYy0HdMtJOI/XyD8s7sEbtTXKdT/JYSbA9MWZUJOkKNJJcPrcnqG8Y/nrK/rV7niNvK9qkRPrZfOhdW5n9thODL7IGRvzIxaoiPX5hGrwCyWRcGdqQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqOC1vKv; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqOC1vKv"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a42cb03673so9611051cf.3;
        Thu, 05 Jun 2025 04:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749122604; x=1749727404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDizFze/hyxfmmFH+Z9n7Pgzu80dINVRGBjV8qhWnzA=;
        b=YqOC1vKvkhv9qUVMB+/fpCArr692HTZ+qysM4YEjvNLh7t2zAww2HBfqZieVr+wTtN
         KhTr2lprYzTokP4mQzWyWOfd0A1ldj/8jdb5wWUoIQC0yJd+0VKZc4NykZ8YF99OewHW
         pZCRWTRkEFe/QXZPCk21PoVJL4eZ9koCLC05v9nCusLRpjUt7Mlp76n/cAVKsK0DYPIC
         bCUDUVezAfJKY3E+Nogz8lZM9wYo+xLXC3uO5pRNM6h17hwyD0YV/qFQbWateArp50IO
         c84wuFjY2HjYY8KCEdklVCJOOYm4KJ0jpIjZY80kZffTdbbB4a2AG5hW97K8N8No1lyU
         w4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749122604; x=1749727404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDizFze/hyxfmmFH+Z9n7Pgzu80dINVRGBjV8qhWnzA=;
        b=SZ9g5JeOzd6cMmq2XIOFAToOY4TZWNipphvCc7OD17kqoumbjfPTckKNOtQBeFBEtU
         IKiGjEio0NZhQ9ZtcNS+tQNGznljwDnlLPMK3GHOeuQQkEchbZI39kbVMhH9iLGWhBi9
         XoxFEhqoOy+b1xfZ/5CwA3IY4nhiQGQ26eNr4jBXf2g+QyBQbf9PBQ8spxeBmC+qy0bc
         +LrKZ0xjb3f/QYXpSnIc6NCK1q5VQ5dQ/n50hVVW4kjd7S4RUMkIEya82O7cXbXyqRJU
         QbmWchX/7XTXidAEZJjQJlbJmmD+gUJvGFTYfpTe0NU0Zx13KJ2tMcjl2Z4orQH5cdwT
         K0uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBctzSSsHUHLSvghJ64thk+uE2ocywt2O6oQNXrU0pT0jfvSUZNmKgt8GwuCh0LHDuSd80mEAW6MP7wL+2@vger.kernel.org, AJvYcCVkscoSnfLd1krzj4QP9YybCCLyrr+xqTY2ROpHyi6Ef2wYqo4m8lBfc1iWOehowMToVVaW071IG2bg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+NveMOz1xvJ996bzZF0OZ8Fb5GwsNCqUsAK/idMR0GZQxQjNJ
	2O8xVZR0l09lLZ5dm1iH4eJSI5atHoLcCoAxSnNBX7SGEYRLrMASoVngLRNIctEUw5rmzDPQ1MC
	hrM/EMjMDH8EYuljo+0ef61f1snfq3YE=
X-Gm-Gg: ASbGncvyTpI2434uKSGPoMXfUo6dZrLFU5yAa0VnUbzcMiQSWUB+pyTdl4k4kYL7s+N
	r+NOEfDeSDPx0oK7O822wfGC4vW2x+/gaeCqCUJ+65656OvS69BmiH/8HU1DA8dD60LOmAtnTmR
	OnudXV8/joO7D7F23TVanRuNAj0qeqRb4xeOE018EtAA==
X-Google-Smtp-Source: AGHT+IFxaSe8SmfOVrKj5PzC+PDhsrX1HEfaz65+xtZxnKyLtWkEJUtGUuyZJdJWYe7NQXeqgh0Qo15kLkJ4vnPGagY=
X-Received: by 2002:ac8:5cd5:0:b0:48c:c121:7e27 with SMTP id
 d75a77b69052e-4a5a584733cmr119373931cf.50.1749122603602; Thu, 05 Jun 2025
 04:23:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com> <DAEK3EQVNWQX.24DOM2VICSGCP@cknow.org>
In-Reply-To: <DAEK3EQVNWQX.24DOM2VICSGCP@cknow.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 5 Jun 2025 15:23:16 +0400
X-Gm-Features: AX0GCFsY4gmlZjHIBycyRoHQVN5KjE-g17VnqUGnair-V8LWvXbVvGhXOwb0_dY
Message-ID: <CABjd4YzyGx60AeyxL049UrEFkhN_03+wHo64DLL778FimDvGeg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 3:18=E2=80=AFPM Diederik de Haas <didi.debian@cknow.=
org> wrote:
>
> On Tue Jun 3, 2025 at 7:01 PM CEST, Alexey Charkov wrote:
> > List both CPU supply regulators which drive the little and big CPU
> > clusters, respectively, so that cpufreq can pick them up.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 28 ++++++++++++++=
++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arc=
h/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > index b09e789c75c47fec7cf7e9810ab0dcca32d9404a..d9c129be55a0d997e04e6d6=
77cdc98fb50353418 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > @@ -207,6 +207,22 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
> >       };
> >  };
> >
> > +&cpu_b0 {
> > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > +};
> > +
> > +&cpu_b1 {
> > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > +};
> > +
> > +&cpu_b2 {
> > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > +};
> > +
> > +&cpu_b3 {
> > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > +};
> > +
> >  &combphy0_ps {
> >       status =3D "okay";
> >  };
>
> The &cpu_bN nodes should come after the &combphy0_ps node.

True, thanks for spotting it. Don't know why they ended up separated
from &cpu_l*

Best regards,
Alexey
