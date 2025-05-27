Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CB81F582A;
	Tue, 27 May 2025 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748338512; cv=none; b=Y2o3JxYUQMCIoGLMvSPmfldO/hesUlOg+r2X0QN4+bGkKqLstKetFjrDyK4JFWxr6tZ6/6B6C+SI0IyalTRgHEUpccWAIB56pJO1jo9sYs2C2qct1lPmw7zxKIuN90Bgi7eUifFPVeCH6J+mbPczPUtvzlBs1b0l9sedsmiULk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748338512; c=relaxed/simple;
	bh=N7pY83q9rnQubxrwnmdg+dqYTvCEERie86WZ4cfC5FQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dmj9L+A/A354ZSxB2TCuXPxNqG4KoyA9fy8L0WnM0NkodOqG6UOzJhVajU7Oj4ZNHAqwWt3Vq9jmnBqGuXY81/HUZYf1q34ZJ4lhJ+Z9olT3jV3wXcxTV7uLjphns7W11Xi6kyaCQ/fhpEuXdu0iT1GgTUSVjdV3tZrsa7J5BTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VA7j1yv+; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VA7j1yv+"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87de47585acso2133129241.3;
        Tue, 27 May 2025 02:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748338509; x=1748943309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leAckNCxDWGVozR/lIbBLi4Bf2/AACubbREaaD4gLT4=;
        b=VA7j1yv+USjFGglBLgamg/N0f6WmTpKTC4lgLOk4gfv1A/pLp33l9PaPPlEYhySD5o
         s9CU4myQCqtjPmfiFD1U/mmXSuP98nVkM3Y0G6mzdBpMAH7sr+YSiGUrcWFkOlixtXcq
         KW+n9K0jHsSPgm3MV0a/sqQgKzEOtmn68fGPk1O3+Llz7fV6EkoJ8ktS6h08fIEX7DWk
         m39uxuQ5XX/lBRXBkoQNW30Awmh3g6kAtZtxE/RByiu5dPZvrAgSPnuUbeu4mz9EyJQi
         bgZdICY1ZUWRjb5BBOnyuJ54QRESb/W4SQrgXYVRyPLgrBYb1eNzfJ36k8MEHygfqQ39
         xQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748338509; x=1748943309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leAckNCxDWGVozR/lIbBLi4Bf2/AACubbREaaD4gLT4=;
        b=psznSJv4BQp4zm/rcOSPjZMgt0VaeBmDEmf+JdKrstaWgS9CTq75CHXSngQLN8xilN
         T20iNuFmL65bNxUwTUeUzZGN85tlQ+XA4kfVnZq8F5gzTBNIKIW/5i+YpsnepsMW4Qi1
         PnuM59ApESiZKEIbNZFW64uf7ILKaCGNekwdpNiz9dMd55cQvKhKkSfE9RP3GfQjJPq4
         k0m5Tkl6nabXhxPCDWckyau+nsK4v4LPPzWNlAifr+Nr9YZbp3ZU1G33Tns53jHmMUq0
         dijeSo5p7hnVFCjXsmePQPIUva5kdkoclevAhlEty+ezB871Yvo5arMSgW05bcvzB4qk
         Qhsg==
X-Forwarded-Encrypted: i=1; AJvYcCV1m9/qO3LmeLpa/8B9OQq33FAn6eMtSXq8Mndctx0NMfI7rdtF6xft+kLJAZ5X8Z2dfIK9K09ZPESiONQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2CmLdmZbu5RcdL65CnVasuUlPSkNnTrEOFmpJ0qfVOrce2Uhh
	PA6K2dbADO3VSl1paOJt07Hx/UEyHYNm8YMHi0a31QriXcN2yhozILzCMfg5tYR1ff/cbGav1rS
	WxMR7Yf32qoW6j1URo0c9ASjVH53J0F4=
X-Gm-Gg: ASbGncv7WnBcJmtADgvJ0bUjQFoO8UZ4bkRuvz8RHC09KyHTYWypsZmm0b6M9SF/0Nt
	hZfK1INtDKwNP8NmYLoUqAlM83gfmx6kY0hNLt/UgwKbpN399r+7lF8Ebec28sFvkOI/oexYavs
	HdyimaqM+7dnXq6gjlyEEEiCUeOReP9rwdWBFdOZM4dg==
X-Google-Smtp-Source: AGHT+IGD5Xbz1ju/qh/VMCqNuyS7RBYzYJPMJta7S6j8X/31mMheqx7zkcCi8kBQ9OeTOUYi871F3Rl/kFlMErgeZ5o=
X-Received: by 2002:a05:6102:6c5:b0:4dd:b86a:dac1 with SMTP id
 ada2fe7eead31-4e424063ea5mr10088524137.3.1748338508408; Tue, 27 May 2025
 02:35:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747235487.git.rabenda.cn@gmail.com> <104dde6002c268a39fab6fcf469adc26d49ba364.1747235487.git.rabenda.cn@gmail.com>
 <MA0P287MB226290B908D3209E5C890BFAFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB226290B908D3209E5C890BFAFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
From: Han Gao <rabenda.cn@gmail.com>
Date: Tue, 27 May 2025 17:34:56 +0800
X-Gm-Features: AX0GCFuowRLKLbDTYK4Z7Pi5wA1H2Ky2TfavFanA4B7GN3nAlA0UXSRSiBZpEYY
Message-ID: <CAAT7Ki-33DcA7xeBzzv1hm0wR_ebcVdux5fQxGVrLs45RbGM9A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
To: Chen Wang <unicorn_wang@outlook.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 9:33=E2=80=AFAM Chen Wang <unicorn_wang@outlook.com=
> wrote:
>
>
> On 2025/5/14 23:15, Han Gao wrote:
> > sg2042 support Zfh ISA extension [1].
> >
> > Link: https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//17377=
21869472/%E7%8E%84%E9%93%81C910%E4%B8%8EC920R1S6%E7%94%A8%E6%88%B7%E6%89%8B=
%E5%86%8C%28xrvm%29_20250124.pdf [1]
> >
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 256 ++++++++++---------=
-
> >   1 file changed, 128 insertions(+), 128 deletions(-)
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/b=
oot/dts/sophgo/sg2042-cpus.dtsi
> > index f483f62ab0c4..8dd1a3c60bc4 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > @@ -256,11 +256,11 @@ core3 {
> >               cpu0: cpu@0 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
>
> Need not touch this. "riscv,isa" is deprecated and replaced by
> "riscv,isa-base" & "riscv,isa-extensions".
>
> And only adding zfh for this looks a bit werid.
>
> Actually, I plan to remove "riscv,isa" later, so please don't touch this
> from now on.

I think that since the linux kernel is the upstream for devicetree, it
cannot yet remove riscv, isa needs to maintain compatibility.

>
> Thanks,
>
> Chen
>
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <0>;
> > @@ -283,11 +283,11 @@ cpu0_intc: interrupt-controller {
> >               cpu1: cpu@1 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <1>;
> > @@ -310,11 +310,11 @@ cpu1_intc: interrupt-controller {
> >               cpu2: cpu@2 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <2>;
> > @@ -337,11 +337,11 @@ cpu2_intc: interrupt-controller {
> >               cpu3: cpu@3 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <3>;
> > @@ -364,11 +364,11 @@ cpu3_intc: interrupt-controller {
> >               cpu4: cpu@4 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <4>;
> > @@ -391,11 +391,11 @@ cpu4_intc: interrupt-controller {
> >               cpu5: cpu@5 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <5>;
> > @@ -418,11 +418,11 @@ cpu5_intc: interrupt-controller {
> >               cpu6: cpu@6 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <6>;
> > @@ -445,11 +445,11 @@ cpu6_intc: interrupt-controller {
> >               cpu7: cpu@7 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <7>;
> > @@ -472,11 +472,11 @@ cpu7_intc: interrupt-controller {
> >               cpu8: cpu@8 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <8>;
> > @@ -499,11 +499,11 @@ cpu8_intc: interrupt-controller {
> >               cpu9: cpu@9 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <9>;
> > @@ -526,11 +526,11 @@ cpu9_intc: interrupt-controller {
> >               cpu10: cpu@10 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <10>;
> > @@ -553,11 +553,11 @@ cpu10_intc: interrupt-controller {
> >               cpu11: cpu@11 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <11>;
> > @@ -580,11 +580,11 @@ cpu11_intc: interrupt-controller {
> >               cpu12: cpu@12 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <12>;
> > @@ -607,11 +607,11 @@ cpu12_intc: interrupt-controller {
> >               cpu13: cpu@13 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <13>;
> > @@ -634,11 +634,11 @@ cpu13_intc: interrupt-controller {
> >               cpu14: cpu@14 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <14>;
> > @@ -661,11 +661,11 @@ cpu14_intc: interrupt-controller {
> >               cpu15: cpu@15 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <15>;
> > @@ -688,11 +688,11 @@ cpu15_intc: interrupt-controller {
> >               cpu16: cpu@16 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <16>;
> > @@ -715,11 +715,11 @@ cpu16_intc: interrupt-controller {
> >               cpu17: cpu@17 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <17>;
> > @@ -742,11 +742,11 @@ cpu17_intc: interrupt-controller {
> >               cpu18: cpu@18 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <18>;
> > @@ -769,11 +769,11 @@ cpu18_intc: interrupt-controller {
> >               cpu19: cpu@19 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <19>;
> > @@ -796,11 +796,11 @@ cpu19_intc: interrupt-controller {
> >               cpu20: cpu@20 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <20>;
> > @@ -823,11 +823,11 @@ cpu20_intc: interrupt-controller {
> >               cpu21: cpu@21 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <21>;
> > @@ -850,11 +850,11 @@ cpu21_intc: interrupt-controller {
> >               cpu22: cpu@22 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <22>;
> > @@ -877,11 +877,11 @@ cpu22_intc: interrupt-controller {
> >               cpu23: cpu@23 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <23>;
> > @@ -904,11 +904,11 @@ cpu23_intc: interrupt-controller {
> >               cpu24: cpu@24 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <24>;
> > @@ -931,11 +931,11 @@ cpu24_intc: interrupt-controller {
> >               cpu25: cpu@25 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <25>;
> > @@ -958,11 +958,11 @@ cpu25_intc: interrupt-controller {
> >               cpu26: cpu@26 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <26>;
> > @@ -985,11 +985,11 @@ cpu26_intc: interrupt-controller {
> >               cpu27: cpu@27 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <27>;
> > @@ -1012,11 +1012,11 @@ cpu27_intc: interrupt-controller {
> >               cpu28: cpu@28 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <28>;
> > @@ -1039,11 +1039,11 @@ cpu28_intc: interrupt-controller {
> >               cpu29: cpu@29 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <29>;
> > @@ -1066,11 +1066,11 @@ cpu29_intc: interrupt-controller {
> >               cpu30: cpu@30 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <30>;
> > @@ -1093,11 +1093,11 @@ cpu30_intc: interrupt-controller {
> >               cpu31: cpu@31 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <31>;
> > @@ -1120,11 +1120,11 @@ cpu31_intc: interrupt-controller {
> >               cpu32: cpu@32 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <32>;
> > @@ -1147,11 +1147,11 @@ cpu32_intc: interrupt-controller {
> >               cpu33: cpu@33 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <33>;
> > @@ -1174,11 +1174,11 @@ cpu33_intc: interrupt-controller {
> >               cpu34: cpu@34 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <34>;
> > @@ -1201,11 +1201,11 @@ cpu34_intc: interrupt-controller {
> >               cpu35: cpu@35 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <35>;
> > @@ -1228,11 +1228,11 @@ cpu35_intc: interrupt-controller {
> >               cpu36: cpu@36 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <36>;
> > @@ -1255,11 +1255,11 @@ cpu36_intc: interrupt-controller {
> >               cpu37: cpu@37 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <37>;
> > @@ -1282,11 +1282,11 @@ cpu37_intc: interrupt-controller {
> >               cpu38: cpu@38 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <38>;
> > @@ -1309,11 +1309,11 @@ cpu38_intc: interrupt-controller {
> >               cpu39: cpu@39 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <39>;
> > @@ -1336,11 +1336,11 @@ cpu39_intc: interrupt-controller {
> >               cpu40: cpu@40 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <40>;
> > @@ -1363,11 +1363,11 @@ cpu40_intc: interrupt-controller {
> >               cpu41: cpu@41 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <41>;
> > @@ -1390,11 +1390,11 @@ cpu41_intc: interrupt-controller {
> >               cpu42: cpu@42 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <42>;
> > @@ -1417,11 +1417,11 @@ cpu42_intc: interrupt-controller {
> >               cpu43: cpu@43 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <43>;
> > @@ -1444,11 +1444,11 @@ cpu43_intc: interrupt-controller {
> >               cpu44: cpu@44 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <44>;
> > @@ -1471,11 +1471,11 @@ cpu44_intc: interrupt-controller {
> >               cpu45: cpu@45 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <45>;
> > @@ -1498,11 +1498,11 @@ cpu45_intc: interrupt-controller {
> >               cpu46: cpu@46 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <46>;
> > @@ -1525,11 +1525,11 @@ cpu46_intc: interrupt-controller {
> >               cpu47: cpu@47 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <47>;
> > @@ -1552,11 +1552,11 @@ cpu47_intc: interrupt-controller {
> >               cpu48: cpu@48 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <48>;
> > @@ -1579,11 +1579,11 @@ cpu48_intc: interrupt-controller {
> >               cpu49: cpu@49 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <49>;
> > @@ -1606,11 +1606,11 @@ cpu49_intc: interrupt-controller {
> >               cpu50: cpu@50 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <50>;
> > @@ -1633,11 +1633,11 @@ cpu50_intc: interrupt-controller {
> >               cpu51: cpu@51 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <51>;
> > @@ -1660,11 +1660,11 @@ cpu51_intc: interrupt-controller {
> >               cpu52: cpu@52 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <52>;
> > @@ -1687,11 +1687,11 @@ cpu52_intc: interrupt-controller {
> >               cpu53: cpu@53 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <53>;
> > @@ -1714,11 +1714,11 @@ cpu53_intc: interrupt-controller {
> >               cpu54: cpu@54 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <54>;
> > @@ -1741,11 +1741,11 @@ cpu54_intc: interrupt-controller {
> >               cpu55: cpu@55 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <55>;
> > @@ -1768,11 +1768,11 @@ cpu55_intc: interrupt-controller {
> >               cpu56: cpu@56 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <56>;
> > @@ -1795,11 +1795,11 @@ cpu56_intc: interrupt-controller {
> >               cpu57: cpu@57 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <57>;
> > @@ -1822,11 +1822,11 @@ cpu57_intc: interrupt-controller {
> >               cpu58: cpu@58 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <58>;
> > @@ -1849,11 +1849,11 @@ cpu58_intc: interrupt-controller {
> >               cpu59: cpu@59 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <59>;
> > @@ -1876,11 +1876,11 @@ cpu59_intc: interrupt-controller {
> >               cpu60: cpu@60 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <60>;
> > @@ -1903,11 +1903,11 @@ cpu60_intc: interrupt-controller {
> >               cpu61: cpu@61 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <61>;
> > @@ -1930,11 +1930,11 @@ cpu61_intc: interrupt-controller {
> >               cpu62: cpu@62 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <62>;
> > @@ -1957,11 +1957,11 @@ cpu62_intc: interrupt-controller {
> >               cpu63: cpu@63 {
> >                       compatible =3D "thead,c920", "riscv";
> >                       device_type =3D "cpu";
> > -                     riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa =3D "rv64imafdc_zfh";
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "ziccrse", "zicntr", "zics=
r",
> > -                                            "zifencei", "zihpm",
> > +                                            "zifencei", "zihpm", "zfh"=
,
> >                                              "xtheadvector";
> >                       thead,vlenb =3D <16>;
> >                       reg =3D <63>;
