Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1249317C21B;
	Wed, 30 Apr 2025 15:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026709; cv=none; b=i3cyFKGy80ZIjlHP7B7DYXMBlYuicrwqHhB960NurGznQ6xG4lbdeFMlU+EYBf1Riol6A6otlbwNgP5asyXqHaCikSmC0VdUGidAvdZWVtu206S7YWO1utN0l9weOGlJeumjHGNqaPYhlNSktRb1s3Y++sTxbkvS12dbPYpr3L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026709; c=relaxed/simple;
	bh=JfAY8HFpUWj8MR/O1/7lz4Lk+Scgd4D+t3tpyWD4iVA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZlCBg95gUpvNjHsBxcVBkTuNvnQ4D3IjKL0rDIKSLp4PGLBInCAIl9CoKzHu6jqSi1iXuXD4D835KDYBeqi5beq/AfJIM4qxCyI7NNFunI/1px49pT299gdXjbSvBdN04CbS7pSe7D8uHr3G2T7PAtlWyPLeVtFHhSnp/YwKHjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UITVU5CT; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UITVU5CT"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so11680885a12.2;
        Wed, 30 Apr 2025 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746026706; x=1746631506; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sj0MRflIvEedys6JQ53UQlPgHXKKoxulPTXkRt9mne4=;
        b=UITVU5CTF6jqqVxp434LxR3ok669jqOJv5eoxDVMh1qKrcYiBOJsi2J7CVXHoyQrBU
         JBFdNxvYB03O6DfDnP9VXQ5bpb119SbC+WRyqWQeQDbz8VnA1JT9c+FJIUmD9hMXRMKh
         7yiAunnzyR3GxuKHp4TV+DWo8jVRATduqVo1boRbMCzd9PbicDM/eK7rJZhMXMvNziF0
         DR5VpL39//bH8aPLMPgfm/icnfktZ0I8VozONIxswPC2EVYkpv14mMLJsPrAQ/MJesjI
         K94jKqCz3hv6OKUROBTGjUl+VkzkdqhvOYKy1Ec2k8mfCGgPP3JUIW+4QjP8q04LNKgi
         59WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026706; x=1746631506;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sj0MRflIvEedys6JQ53UQlPgHXKKoxulPTXkRt9mne4=;
        b=FrLaI5wIGj+HlfZH+nzWExqJNaoOnrOga/vvmK2tTuwxKcO4bc9UCrlrhKP76mSk2t
         wUzeDXWB0g0kXyvIjHVsVIKvcbmk+IXbdv+hkKNhiUh3p1JiYplDEwJ8IFcazbqZ8TvB
         9LOrWXXnENrgxpl2RAvNtOsQgzY90xZ5MfaV74ituY1nsQMmmnGu9Xj7tyl/ZsRNBx/O
         bEkgf0zDTbv4IoLoTRMPtNbwoZIdVyqM0Dg7ocOshmWug+B+nGdR2+fFLRNIzJEXHDML
         RRzdHfHXZe+2kawvIh4Ggb8ARlYXTXfgq1KeALBaSJu6Ibz3raTBAzlkSR2Qyu7Q8JNu
         9fJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaSRZZvt/3VaQHm1NcRz3n1W2nj8hFmu8NIpsoe5iPiRAbjxmy6WWuOUfqCJZ/mWqMavlER3TlcSDnMfc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygv0Q0TRqQlntA+NThBAtPq+XMc6Y34r0m+iMWdmS9wNfpleYQ
	8IRir/JhcV60f9bWAtbEA5cX2dEHyv+dFQMMH5Bxd+au1uMhmcD3
X-Gm-Gg: ASbGncslt4Vlnw8jn4r977Kjyt+jOwBiptSHC6gJIkhGzhEJ3OvbLB0Wyl5hgz7Sq4N
	9Tm4kYBOY5sh85kh0FR1P27NwWPy1q3CltPOTmYoT4p0bku0hJDU+xuuGgya8BSLXn3NQ+GKtRK
	sew5F2LrHzNB08fzagMHKOXXLXAu8FCPEUA+MhgKf/ehlzZg63Ol6R9xYcZB1bE3bMs9Krpb+Gs
	8ftDeDiLFFQr6lWGmOFclN8Cx/VPki+yJT/X2403MUrN/SvLwYH1Kv56zs1o4D+gVqUpHhhDq/Q
	Um2vpuZojaOMBOcbCIy5HM64QGX7OsmmOvPG2JxqCyv/v98mujnnWxm9zSdk
X-Google-Smtp-Source: AGHT+IFzQBgBRSQ6GOeinovlut4MyV3fq4DbhhNOJPV0muIn4pxuSp88mG1LvZ+7QvhqG/Fa7ZM10w==
X-Received: by 2002:a17:907:3f21:b0:ac6:f6ea:cc21 with SMTP id a640c23a62f3a-acedc764e4cmr435843166b.55.1746026706150;
        Wed, 30 Apr 2025 08:25:06 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed704f7sm943027266b.146.2025.04.30.08.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:25:05 -0700 (PDT)
Message-ID: <a6164eadc96bea72cc21ddc4794401907fb11d97.camel@gmail.com>
Subject: Re: [PATCH 3/4] riscv: dts: sophgo: rename header file cv18xx.dtsi
 to cv180x.dtsi
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Wed, 30 Apr 2025 17:25:07 +0200
In-Reply-To: <20250430012654.235830-4-inochiama@gmail.com>
References: <20250430012654.235830-1-inochiama@gmail.com>
	 <20250430012654.235830-4-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Inochi!

On Wed, 2025-04-30 at 09:26 +0800, Inochi Amaoto wrote:
> As the cv18xx.dtsi serves as a common peripheral header for all
> riscv cv180x/cv181x/sg200x SoCs, it not cover the entire cv18xx
                                     ^
                                      does
> series as there is cv182x and cv183x. So rename the header file
> to make it precise.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv1800b.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A0arch/riscv/boot/dts/sophgo/{cv18xx.dtsi =3D> cv180x.dtsi} | 0
> =C2=A0arch/riscv/boot/dts/sophgo/cv1812h.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A0arch/riscv/boot/dts/sophgo/sg2002.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 2 +-
> =C2=A04 files changed, 3 insertions(+), 3 deletions(-)
> =C2=A0rename arch/riscv/boot/dts/sophgo/{cv18xx.dtsi =3D> cv180x.dtsi} (1=
00%)

--=20
Alexander Sverdlin.
