Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68E91C548C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182621; cv=none; b=RX74hJcKPPn7I6TrbuugkP1PVvz9qPTVs6DX9ZcW0rqs7yEuRa+ypnE+CU9Ojre8Z7D9qCpdB38USF8pJOV+OKpv601AQ7kw84Iil+h48WcIaj0cC35TF+NHCVGz1oMpur8VZOnA/8E4iRnCmZnS9kfWN8f8q15DIDNW0FSzwL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182621; c=relaxed/simple;
	bh=gFMz+9VKuJuGZcGbXnQ6WKPgF0I7Qo9bwYmFLPQ8IUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euOlUX8pSAiOOkOSaCuVQyb8SJ17F3CHe9SRmrcOLvQiFpTTOtm8LDFAQJecRpdemItSCOgkME95DT0IQq//GUFHCjXYJPsV53f/dT1Xn/0Ge1OFmIk7RYKxFWDxh6Adc8L7Xx/IgaOOI2MrOnXCXfcccZ1wg6oDXRhtyREagek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=0dLNERUb; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="0dLNERUb"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3cfc79a8a95so14136965ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1739182619; x=1739787419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFMz+9VKuJuGZcGbXnQ6WKPgF0I7Qo9bwYmFLPQ8IUs=;
        b=0dLNERUbr7gzCQVSNZFL0caIfbLHx5DZXEO6A8XA/Vjh6Ql78tb9h9iWKS2ai9S0z3
         jPSgvp7RHc1FQ73waQ2bVY9owjrnvp4EozYa1FElxtCPvsS1ceIRL4KCrfl9Dl4k1n2D
         eD9NiDVXj/xPj1y8S737XKKND8HJqxqOza6y0mRlS8ZAlrZy2Wnhm6PEmqmfp24oEXkG
         RlmYTBvDcJwYg6Wj+WMlp0+C+wN8UnMoTT5HnFKnPdjh1kAOoByk1xPhjkNfjN3Dq3X8
         98AqT94BwKh1POQLJkB5R4y58ToGcwVKtBo7eixw18frzN5ZcDOpsPFMGHV8DCfKIwNx
         lQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739182619; x=1739787419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFMz+9VKuJuGZcGbXnQ6WKPgF0I7Qo9bwYmFLPQ8IUs=;
        b=SeewaGHYp0RZJWJmCGmmuJUm5veQpSFQcTMipdqifSYddM8AXWlARRUWvVljkPLmW1
         3WpJrCmDhduQJ9ecf2MiTN+N/z6dxrN5pRxkPIymf5fIoCA+Q8G2PVO8K4UO/LFtePs5
         gFeEIz+Jl9qnk0HcgK7Bo0fT5eJGKNd3Tjig+L6jD4tCMU6LYgjsGFnUK9lTWSW5awS3
         qYDUhLNL2UjYcIV6n94dQUwq8a3dPzFBRCeKEPKTtJ1pgQfKyCN5r8mTuXeO0ZXg0b/s
         QLtL82/GhSmoZw0fYza5HKqvyhPmNY75JjTDS2MCOWJWtHENvSzSiFJmCy1cPOam0T24
         U46A==
X-Forwarded-Encrypted: i=1; AJvYcCXJmMOMLWc2l+Zsg9Eo7FpeChrxsfzmt5tBPQouL66QoF+VZIAYzJJ1UP1VaeoyK+raC725Y3yfI1uAYXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXUabsBd6wulZaTnMQ0rSSMA+jjDk8aWy/Km0y27dsOUIPDQiR
	mB3aNnbcNSQrSSE4plTh4ynbYl7vK0zUCKVoCvbcFWxe67LKpN/h1rFEzqTDkwUO56Ajje+Ft91
	mpsgKkqUQjoXwMTIEwjXRNuVxMK+T0G9CYiUwLQ==
X-Gm-Gg: ASbGncs4pvmCFxR43x/nyshmSa1waW1tw8Zlg32omaIVpztjvuHjXr0rcGFW7hA/UV0
	HwAArGLpfygfOOHb9YlgqebM2k/FG0ZUMW0yIi+e3oPCh+o8J7EEqTGZp5VZSt5tA9CV0nHME7A
	==
X-Google-Smtp-Source: AGHT+IFxYxBGv2hc6E/05sAPGOPtP7XZJl8fJ+FlUzG2ytj0GYtSGPTcL+8sNxd5gXx2/ibqUfGkmDqHQCJxB762kY0=
X-Received: by 2002:a05:6e02:20c8:b0:3d0:21aa:a752 with SMTP id
 e9e14a558f8ab-3d13dd2c035mr97333115ab.2.1739182618823; Mon, 10 Feb 2025
 02:16:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com> <Z6ax7B45OsGerjfA@ghost>
In-Reply-To: <Z6ax7B45OsGerjfA@ghost>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 10 Feb 2025 15:46:46 +0530
X-Gm-Features: AWEUYZmcXbHoRjnlS1mRz_OY6nbz0LaCvsVhqJHN8CjPX3-8IfaSya5IaXEP0zU
Message-ID: <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table lookups
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 8, 2025 at 6:53=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.co=
m> wrote:
>
> On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
> > Probing unaligned accesses on boot is time consuming. Provide a
> > function which will be used to look up the access type in a table
> > by id registers. Vendors which provide table entries can then skip
> > the probing.
>
> The access checker in my experience is only time consuming on slow
> hardware. Hardware that supports fast unaligned accesses isn't really
> impacted by this? Avoiding a list of hardware that has slow/fast
> unaligned accesses in the kernel was the main reason for dynamically
> checking. We did introduce the config option to compile the kernel with
> assumed slow/fast accesses, which of course has the downside of
> recompiling the kernel and I assume that you already considered that.

The kconfig option does not align with the vision of running the same
kernel image across platforms.

>
> Instead of having a table in the kernel, something that would be more
> platform agnostic would be to have an extension that signals this
> information. That seems like it would accomplish the same goal and
> leverage the existing infrastructure in the kernel, albeit with the need
> to make a new extension.
>

IMO, expecting an ISA extension to be defined for all possible
microarchitectural choices is not going to scale so it is better
to have infrastructure in kernel itself to infer microarchitectural
choices based on RISC-V implementation ID.

Regards,
Anup
