Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3AC19F101
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 07:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739001598; cv=none; b=LStXgmtSFuw6lJe0lOwff/0jQ5LsXYVGzuqN8VtKEFVs0OiWhuTNQD5OK7PLu/mNJHTa/KrUOte5Yq0JMKXZQreI1Fpa4oRUQcdfEf/T7PEMZNnru7vwgG6R6jj5I1Sp3nQLd4JOamRNtNn80+G/SQ7pIXlq0Xz0J7+/hU57Koo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739001598; c=relaxed/simple;
	bh=d7ojekL/BiCyYAVzA3C2SArdrbbraYuLRGFQNfKkvfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wls/xUdMs/N31TAihlixkBxOh/8GI+xOc4TL5VNM3ICBQ5VXtkHNMIj6+dGm2R75Xch4N6vd8yrGTk5dgMbQiotOGnyywRu5BdbjbJks6yrRLqa8u8E7QI/gmEmWZ0OeeRHtgaBzcXO7JRpzUx3MjbO7xwu45bzczqELzAOODMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=AJP2jsCw; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="AJP2jsCw"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5439e331cceso3243966e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 23:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739001594; x=1739606394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTUTp09J3TkHO04+OyZOFWnP6EILcwwOXh/jpiP4ZkI=;
        b=AJP2jsCwZLOev3Dg8eO4UJt45hqQXm3bmoAFCxr6infkyFTw6eFDGKswpVh+NY/Zus
         RgS7mCB7+Vd5UdPLb0cRW/gmUkC9Iag+haStEv0LnVTU6jRj2fjRSlSOgxc0N3CDLCTE
         zFfHEvZV70mu6XD1Ln4Ii1exlEzAzlv/glBg7DPoHtWEWKloSjGpPRtvAFqAuad/Yn7O
         mobo2Bm5jnh7h+xQ2/II2CFcITvHbdy45H/Ib62u8uwS8pVGJuUGQhL5H1Z3bF1Qvm3c
         kewID7Q+WIAG13G8DWfl1oh4pkg5skejqHsilH90nR47JuIay4yN4EC50uATqgIIX/Ei
         NR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739001594; x=1739606394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTUTp09J3TkHO04+OyZOFWnP6EILcwwOXh/jpiP4ZkI=;
        b=TdJWJWvYnJbziI4ZyEwkuNkVnyM6GEV99vBB3hrWHfgv27Xhe0A0RrLpW3H2IdFm2V
         HEnhvA2gh8urvWJnTavkdIBspTocjAvvsDgJ5ZCp3sfcASp45+v7H8eWDh0lNjnj7lcc
         yDhghnohe4fgcHKNbegB7Ri/BFcmj0VEByssGHCb3slqmO0tMk9JFGdK+ExEwOrLBCnc
         uqkH9MRRTTGzZD8DL8kiAo9AUgzbNoaBO4Mr8t6sZPdiwG9Lnh/CWxH9/Lpqut1/YJVh
         cuA4ieBr0kYW8ByfZZx8hzaZc1Ph1nQutoRB2C7XwKIBh/UPeiiScy48Ls/bkwiCH4FU
         lW5w==
X-Forwarded-Encrypted: i=1; AJvYcCUP/ANY2GWb85fJsahPqsMUL0QDjYK4+ppngprWYo5QEhEGZZwyWxmFss6BuQeeYQ+H6JWQgm/DUKDafhg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+bwiEiDgBJ5ziv+Xdwl4TA3YjUDCnIFx/HFHBGvPAmM3e0aHs
	8aX5HY2vaV57T5Q5ci3uV97w2AiMj8XBRiDo4ZiY7BrGIH55Xw1/15cBHz+IIqxSYdypibJ854O
	zK8IjYPVRrRmpO3Yu+zlEDBsKZhgiYQCtm3K2hw==
X-Gm-Gg: ASbGncvPkrtRjPbAEaoYBXi7BEKXlA4tiLh/z17R9Rm4h5ZLBIzHDuXvbn8Q6036kta
	3StDLIgfChOk37//gmC58vFVU0qRo/bv+k4v0TDCWPHatdBP/wMidlT4tAB2ODcAaSPmd33tbHA
	==
X-Google-Smtp-Source: AGHT+IHNBKUgdG3mmVsHbFdl3uVr3Q+JzefEbNXajL5yy04QQ9tefqJ/8k1ddeV63n4noi5xHd5M27eZroWTkogbhas=
X-Received: by 2002:a05:6512:1195:b0:542:6d01:f55c with SMTP id
 2adb3069b0e04-54414a962c4mr2450193e87.3.1739001594018; Fri, 07 Feb 2025
 23:59:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207161939.46139-11-ajones@ventanamicro.com>
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 8 Feb 2025 13:29:42 +0530
X-Gm-Features: AWEUYZl3rnfE8vIlzOiLWPcC_pZ4X13tmZnTiRHW3C1wZw-naFaGo4PPV4QFVxE
Message-ID: <CAK9=C2XmFtLHAxuWJVdvkUHFQTM+mE-D8E4sLvKxxUj_CqcbAQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] riscv: Unaligned access speed probing fixes and skipping
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com, 
	jesse@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 9:49=E2=80=AFPM Andrew Jones <ajones@ventanamicro.co=
m> wrote:
>
> The first six patches of this series are fixes and cleanups of the
> unaligned access speed probing code. The next two patches introduce
> support to skip probing by matching vendor/arch/imp ids and checking a
> table for the access speed type. The last patch applies the new skip
> support to Ventana harts.

Alternatively, we can also skip probing misaligned access when Zicclsm
extension is present in the ISA string. The Zicclsm extension is defined
as part of the ratified RVA23 profile.

Regards,
Anup

>
> (I'd be happy to split the fixes from the new skip support if we want to
> discuss the skip support independently, but I want to base on the fixes
> and I'm not sure if patchwork supports Based-on: $MESSAGE_ID/$LORE_URL
> or not at the moment, so I'm just posting together for now in order to
> be able to check for my patchwork green lights!)
>
> Thanks,
> drew
>
> Andrew Jones (9):
>   riscv: Annotate unaligned access init functions
>   riscv: Fix riscv_online_cpu_vec
>   riscv: Fix check_unaligned_access_all_cpus
>   riscv: Change check_unaligned_access_speed_all_cpus to void
>   riscv: Fix set up of cpu hotplug callbacks
>   riscv: Fix set up of vector cpu hotplug callback
>   riscv: Prepare for unaligned access type table lookups
>   riscv: Implement check_unaligned_access_table
>   riscv: Add Ventana unaligned access table entries
>
>  arch/riscv/include/asm/cpufeature.h        |   4 +-
>  arch/riscv/include/asm/vendorid_list.h     |   1 +
>  arch/riscv/kernel/traps_misaligned.c       |  14 +-
>  arch/riscv/kernel/unaligned_access_speed.c | 278 ++++++++++++++-------
>  4 files changed, 200 insertions(+), 97 deletions(-)
>
> --
> 2.48.1
>
