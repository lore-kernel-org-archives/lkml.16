Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C28B33F7;
	Tue, 13 May 2025 06:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747118728; cv=none; b=OXBbPkoC50PQ90rCAtWkss6GL9UOynRAxmZcGuwZGPGXbmm23FMW2hlR6yKOcHRovjxxxfgnsvzbMAn1NlZR2wl7kwgz6FRB6hoEPIbMK+n73QDvzAHmZ1ZMWjZ/P2zjJ92ziKzLEC0exnvJFvheN3YgvvULQ3sds965oc6Ouy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747118728; c=relaxed/simple;
	bh=v2G50f7xtyvhMM1LcCTcJCyD0Y7yNjc0pvjDB/dOoTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=htvEF1TsJj9K2U1SNgT7xpS8pVWv3ueV+P0q4VjkfbR2Qtm9C9We46DO8ZxCRCEBCeGW4+j61QmvsQBMn9fqsEBgbuhGt3ilm9M8Zv7Bu5GzOMoRy+s/ZEHx1pcf8zoINAcIxvZHR9ZyGAyRifQg4E6irxvRJicOKZWj5z5Iou0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTk6pgjE; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTk6pgjE"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4766cb762b6so60626951cf.0;
        Mon, 12 May 2025 23:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747118725; x=1747723525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNdyxNMYSlmKMssM4jqt3e5J2mh6haQZoTHr9nFNF+8=;
        b=MTk6pgjEu853AuQNKVkQbMoUtVmMP2lvLMMVZI7mHm9t86tSTq84bEXxHeyKDGbqul
         VmoSWgwcLJ+ur//aIO5Nj5P9f7Lj/UkApFKdRZXsBR1f1vDwCSOtnz6797JVerhup4cz
         2O/KM2S9gEZTMehJyLNtLm+LX2mjdqcBYrg7B7kehOPswQ3tOyh18RMgbZJ33hcgq2Pp
         Wq1HHyjCviWOWigKNokn9CFvTCRsqH+Srt4UuSrzxjmlxzM6tdZM7iyK2KLdKwDHV2Bv
         uUUd3DtTmtLa/BZCBwhrU3MJD5lr6WyH5IPrFTKKFTpE6i94upu3ypfTuxOAsIuQtTcw
         CVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747118725; x=1747723525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNdyxNMYSlmKMssM4jqt3e5J2mh6haQZoTHr9nFNF+8=;
        b=LtDzOn8f6hjXoLbKLs3xDPRClrt22I0LBG3SnFd9v3KzN6QMHcnvYXxeOf4OoYNVf/
         3330tq504e6Kn+dmhK3Oe54kHXcwiTxCfNS+COUk5tscnmPWjHOd0V3a2et+6UZLfOYf
         iEL2CFvlEaKQgr32GIQvqzaI058cQ3PhgU68r0Yo54I7m4Zp+asmRwhnQ2obaGOgfF+n
         P9Cdf4HVMZlbf2hQKUdWIbyufBEtwdtOEbGs1A34rSvPIvE/nU7F7aTrtcqvjbxTkZTt
         cQ7ZpVAgDNzOJQe9wFKMJbUHk9JVeBmH5A+/ymeSykqiZT0cnDvu10fsZ19phaq0uSh7
         07Cw==
X-Forwarded-Encrypted: i=1; AJvYcCULQUJlvUPxwnE3CaIkKhO4hXLu/D/PjccrdvWZJa4vf8/a4lI4u3YoKZYS4dilPjXA7hIMt7M+dSjk@vger.kernel.org, AJvYcCXaopEWgsF6XUc/GWUbx6o2ao1hfJkb7KUpFa2Mmpgx6wkDsZllcMtyEzlIIGl71Cxo3dW+yYMO9I4v2/Ux@vger.kernel.org
X-Gm-Message-State: AOJu0YzDWdNHJMgKJTViCg7NiHU5p8NP34maUl65vQJU5yLTemFOxcYp
	GJ17gLU2oFSSuRyWi5tcRai/NsIaMFC1tHBs1Uva21+HS1ubTgJkgshqD19VoL37BSwd3MoREvq
	BDzs7HYEUbwcAyhpH2baD8aFaDzwTzUQ4cpeZeGwB
X-Gm-Gg: ASbGnct4ZoQwDiIB/14cqfxI9cttdCe5E7VexzJ56KEzAESi0/a00VJ2LwKaxhzWV/D
	gmuPR7XI4pGDhA10AP4CP3AxDtos5qWB2dpuB1OQ7FI8zN/Y8zJC56xEgvRoYaWPByYvoizfzlV
	eQM7nA9LhOunoud+858m5LI/lUlYPoU74=
X-Google-Smtp-Source: AGHT+IGbg699fZ2jqehD9ZG8rCHM636dFwR3Xs9d3JXip6jt+ukeWt0wQcNgoect+RELrux6XMmVqMVt2LwBMM42S+c=
X-Received: by 2002:a67:f5c9:0:b0:4df:48a4:776b with SMTP id
 ada2fe7eead31-4df6e07e807mr1333004137.0.1747118713965; Mon, 12 May 2025
 23:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1746828006.git.rabenda.cn@gmail.com> <af839bc200637e4eae1cb327c95ac98c82bccd52.1746828006.git.rabenda.cn@gmail.com>
 <MA0P287MB22624E52A6647B43D53DCD2CFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB22624E52A6647B43D53DCD2CFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
From: Han Gao <rabenda.cn@gmail.com>
Date: Tue, 13 May 2025 14:45:02 +0800
X-Gm-Features: AX0GCFsWJMGfhhDBW-kGA9VVgnHjewV6y4ykpY0HStDk7KvvNIjQtWD36F-Tnj0
Message-ID: <CAAT7Ki9zCYZ7u+nmQgSkgWgv+QSVb=miLRtcNQRfJFcd8JgcJg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
To: Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You can use xxd to convert it.

cat /sys/devices/system/cpu/cpu63/of_node/thead,vlenb | xxd
00000000: 0000 0080                                ....

Regards,
Han

On Tue, May 13, 2025 at 9:19=E2=80=AFAM Chen Wang <unicorn_wang@outlook.com=
> wrote:
>
> Hi=EF=BC=8CHan,
>
> I tested with this patch and the machine can bootup. But I find when I
> run "cat /sys/devices/system/cpu/cpu63/of_node/thead,vlenb", it print
> nothing, though I expect to see 128.
>
> Do you know why?
>
> Regards,
>
> Chen
>
> On 2025/5/10 6:11, Han Gao wrote:
> > The sg2042 SoCs support xtheadvector so it can be included in the
> > devicetree. Also include vlenb for the cpu.
> >
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 192 +++++++++++++------=
-
> >   1 file changed, 128 insertions(+), 64 deletions(-)
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/b=
oot/dts/sophgo/sg2042-cpus.dtsi
> > index b136b6c4128c..927e0260acbd 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > @@ -260,7 +260,8 @@ cpu0: cpu@0 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <0>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -285,7 +286,8 @@ cpu1: cpu@1 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <1>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -310,7 +312,8 @@ cpu2: cpu@2 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <2>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -335,7 +338,8 @@ cpu3: cpu@3 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <3>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -360,7 +364,8 @@ cpu4: cpu@4 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <4>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -385,7 +390,8 @@ cpu5: cpu@5 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <5>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -410,7 +416,8 @@ cpu6: cpu@6 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <6>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -435,7 +442,8 @@ cpu7: cpu@7 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <7>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -460,7 +468,8 @@ cpu8: cpu@8 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <8>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -485,7 +494,8 @@ cpu9: cpu@9 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <9>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -510,7 +520,8 @@ cpu10: cpu@10 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <10>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -535,7 +546,8 @@ cpu11: cpu@11 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <11>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -560,7 +572,8 @@ cpu12: cpu@12 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <12>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -585,7 +598,8 @@ cpu13: cpu@13 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <13>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -610,7 +624,8 @@ cpu14: cpu@14 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <14>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -635,7 +650,8 @@ cpu15: cpu@15 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <15>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -660,7 +676,8 @@ cpu16: cpu@16 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <16>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -685,7 +702,8 @@ cpu17: cpu@17 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <17>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -710,7 +728,8 @@ cpu18: cpu@18 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <18>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -735,7 +754,8 @@ cpu19: cpu@19 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <19>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -760,7 +780,8 @@ cpu20: cpu@20 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <20>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -785,7 +806,8 @@ cpu21: cpu@21 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <21>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -810,7 +832,8 @@ cpu22: cpu@22 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <22>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -835,7 +858,8 @@ cpu23: cpu@23 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <23>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -860,7 +884,8 @@ cpu24: cpu@24 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <24>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -885,7 +910,8 @@ cpu25: cpu@25 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <25>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -910,7 +936,8 @@ cpu26: cpu@26 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <26>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -935,7 +962,8 @@ cpu27: cpu@27 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <27>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -960,7 +988,8 @@ cpu28: cpu@28 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <28>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -985,7 +1014,8 @@ cpu29: cpu@29 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <29>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1010,7 +1040,8 @@ cpu30: cpu@30 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <30>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1035,7 +1066,8 @@ cpu31: cpu@31 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <31>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1060,7 +1092,8 @@ cpu32: cpu@32 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <32>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1085,7 +1118,8 @@ cpu33: cpu@33 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <33>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1110,7 +1144,8 @@ cpu34: cpu@34 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <34>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1135,7 +1170,8 @@ cpu35: cpu@35 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <35>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1160,7 +1196,8 @@ cpu36: cpu@36 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <36>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1185,7 +1222,8 @@ cpu37: cpu@37 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <37>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1210,7 +1248,8 @@ cpu38: cpu@38 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <38>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1235,7 +1274,8 @@ cpu39: cpu@39 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <39>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1260,7 +1300,8 @@ cpu40: cpu@40 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <40>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1285,7 +1326,8 @@ cpu41: cpu@41 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <41>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1310,7 +1352,8 @@ cpu42: cpu@42 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <42>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1335,7 +1378,8 @@ cpu43: cpu@43 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <43>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1360,7 +1404,8 @@ cpu44: cpu@44 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <44>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1385,7 +1430,8 @@ cpu45: cpu@45 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <45>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1410,7 +1456,8 @@ cpu46: cpu@46 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <46>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1435,7 +1482,8 @@ cpu47: cpu@47 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <47>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1460,7 +1508,8 @@ cpu48: cpu@48 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <48>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1485,7 +1534,8 @@ cpu49: cpu@49 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <49>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1510,7 +1560,8 @@ cpu50: cpu@50 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <50>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1535,7 +1586,8 @@ cpu51: cpu@51 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <51>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1560,7 +1612,8 @@ cpu52: cpu@52 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <52>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1585,7 +1638,8 @@ cpu53: cpu@53 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <53>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1610,7 +1664,8 @@ cpu54: cpu@54 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <54>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1635,7 +1690,8 @@ cpu55: cpu@55 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <55>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1660,7 +1716,8 @@ cpu56: cpu@56 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <56>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1685,7 +1742,8 @@ cpu57: cpu@57 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <57>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1710,7 +1768,8 @@ cpu58: cpu@58 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <58>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1735,7 +1794,8 @@ cpu59: cpu@59 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <59>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1760,7 +1820,8 @@ cpu60: cpu@60 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <60>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1785,7 +1846,8 @@ cpu61: cpu@61 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <61>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1810,7 +1872,8 @@ cpu62: cpu@62 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <62>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
> > @@ -1835,7 +1898,8 @@ cpu63: cpu@63 {
> >                       riscv,isa-base =3D "rv64i";
> >                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c",
> >                                              "zicntr", "zicsr", "zifenc=
ei",
> > -                                            "zihpm";
> > +                                            "zihpm", "xtheadvector";
> > +                     thead,vlenb =3D <128>;
> >                       reg =3D <63>;
> >                       i-cache-block-size =3D <64>;
> >                       i-cache-size =3D <65536>;
