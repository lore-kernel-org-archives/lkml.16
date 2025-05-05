Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3305192D70
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 06:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746425734; cv=none; b=XqE5LrjTf8BRToUxktY43ZjM//iatfkumwEfNVlwSGmCSNKy6G1LnaM9Ebe8SviSc84cHqngB3Hm6XUO9s40Bl5SRt7ou1tnWHHX2apeNQlf5xBJS1ygwurOLoPBdkf50huIRHPZXpuqDdDFZ/udYDUtgLGCFmxD4HZG2HgsA/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746425734; c=relaxed/simple;
	bh=eiHe9oraoX5TCTf1MYAxpXpdkHK11mwECcS8wk8a0CQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXQDUvcKdccCox20ucI0KdXoyPl6Ja3TboSmRzLSVgWPzKAj1+CZ98JNjkNOOmR23qg3w66DwGUYnAgZ5oMq2k3t1XWMrws0szZuVmKtUBRpxmtWgSjlUt6zulanWQ1V9pe1ULuz1whZPuF8+HVXgNo1+Kn7CTzTyjxtkJyKBfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZrzka1z; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZrzka1z"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bfca745c7so36874381fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 23:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746425731; x=1747030531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dE87bm7VR0djEFbdDZzdJwumS9hZE40+FJBY9/S/w4c=;
        b=eZrzka1zz8G+qaLR94qeXNTe+CVIRApsyL50tOf9DNHd1c+lpkarfD4o8gE6lUIPQB
         BNfppl+ty01xsvRPlHlrk2QAnMOnXr1krfX6ndQfJ1bRsgAcrLPl4abpoYzgOcvir0fI
         MlxDVRxQVybCPJT5UT4nRzofSfgtpsdeF8JWkmHPlFe4lo3QDq66Q+0y88aAlGvrfyew
         sP/rfzEd+0/wrpdtUs1sgHjQoBmIaj0Eq9HPW/68tKFMyF+d+FBplQsLd79tLJx8QeKe
         NKGEqSio+18V6bu4VobsN+XvIGP+EUHgY0hE/NCnQLIs8HtsZwpdHdzo2NOjVH1JX6H9
         VlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746425731; x=1747030531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dE87bm7VR0djEFbdDZzdJwumS9hZE40+FJBY9/S/w4c=;
        b=WvuilehebJw9AHG0FM7bMa6X5kqmsHVHaZXvX4PpdyW0Vd1YIxkjOvEmOeapxDeAMh
         BenMgi+htxg/4z6HXLT9HxgF2VKGxMbQkHBDh3U7Sefn1hxrb36r0Qi7BrB0jCH/q/sk
         C8a1Khy7j465Cd/Kd91sCNZATkRUVVfpENwaT4/w3ctKGoLwNU+tyzSnMogw6DeL8wzC
         A1RggUCNPJPwMESFWMPYsUAdnf0MQrb+MF75CDWrmyil6bjvbtEfGLszv93OZ6rSN/8a
         habcJ9zRNMfoVIO1PjYCdqsbqbOytOMGu3f2wG0HgQ131YfZKzBfghcXx2qYBednbvD6
         gueg==
X-Forwarded-Encrypted: i=1; AJvYcCWOa2G7U9bAy14wZKiIc5A2OwXHDGSycmEJ0xOuHx7wTwOraL7L8S9rP2/wy6Wwq08jooVCy5tyS8MFfCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfmwSHrpvqakSCAGbTTRnVjbG6KhlyOAZTDYsQmbiwhU922oNg
	lnphF5AFgRO6ppP4+N3u+dDNNnZTIWV8jRgwm70VNjCAjw776lDg2KmHPKYpMBzkB0ZGmU74GWW
	fYz2JZQ4s6fo5wi4y9osJ03fTjCA=
X-Gm-Gg: ASbGncsQu+eLOsr+0KEjoUXmg4YWJfH99irfB0lDZOWWUIN2741JP5x6vITjg3rG1qR
	dNqhEh7YM029AJvYluzUZ/XWxuAvrfSWzJ337TyldsFF9Y1SuLxE8nJBdgZcnz2mRiAh5WGy/Ms
	HEfSV5Bn+xhFGwnJEcRgHjYA==
X-Google-Smtp-Source: AGHT+IGmPl7Hv19fy5nmMnKenCm897xDDE3JNvmZC8+BpdO6iCHyz5qtAQSSsdr1EbuYlQ1gN0OpaKLJyzCxtDQ8YKY=
X-Received: by 2002:a05:651c:1607:b0:30c:2da3:1493 with SMTP id
 38308e7fff4ca-321db5a07a6mr22828801fa.19.1746425730807; Sun, 04 May 2025
 23:15:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250504184342.125253-1-ubizjak@gmail.com> <dd4c1795-ee0f-4589-9430-d759e59d5b96@zytor.com>
 <CAMj1kXHLfa2OzT+mo8qFxp5NtLHxaxnO3+skt_we=QOTtPFUqw@mail.gmail.com>
In-Reply-To: <CAMj1kXHLfa2OzT+mo8qFxp5NtLHxaxnO3+skt_we=QOTtPFUqw@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 5 May 2025 08:15:19 +0200
X-Gm-Features: ATxdqUFAgdkUkWHLXGIYkZWXHWzDBkgqxc6vE76WQG-URgVk2_IJmivxE0q7FC8
Message-ID: <CAFULd4ZeEE=zrood5F6ugO9pk1_G0C626orcE_AtaF8AorwyCg@mail.gmail.com>
Subject: Re: [PATCH -tip] x86/asm: Use %a instead of %c(%%rip) in rip_rel_ptr()
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 7:48=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
> On Mon, 5 May 2025 at 04:59, H. Peter Anvin <hpa@zytor.com> wrote:
> >
> > On 5/4/25 11:43, Uros Bizjak wrote:
> > > The "a" asm operand modifier substitutes a memory reference, with the
> > > actual operand treated as address.  For x86_64, when a symbol is
> > > provided, the "a" modifier emits "sym(%rip)" instead of "sym".
> > >
>
> Clang does not
>
> https://godbolt.org/z/5Y58T45f5
>
> > > No functional changes intended.
> > >
>
> NAK. There is a functional change with Clang, which does not emit
> %(rip), and this is the whole point of this thing.

Hm... I tested clang with "int foo" and only -O2, where it produced
the desired assembly. GCC works in all cases.

Let's keep the function as is then.

Thanks,
Uros.
