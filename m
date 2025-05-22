Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20803148827
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944143; cv=none; b=ul1VPk7YWKkywz5g3CBoYIoa6qMaoxKm7AIG849lfeSSkFjOp9+Fug6hK+B6y+szO9YQnXChVqcjK/V3Ps1pWdsPf7unrKmtCfwBTzZ704OuvDJzkTnmBkrBdXwH0QCY8owKqeE4+18Vzwrcsd7irpxFn0Cut10oU8bDtZSECfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944143; c=relaxed/simple;
	bh=8IJvB9beb+r+MxI+EXR5zieblC1Zn7nGymkkexuE6yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=idOuAGRRe2VIPcYHCBQWQKnreezMSJsehEZgbUJbEwftaWoruenm0ag0Dtboq5splmIqGVFF3oxWhjWVUFXF6cpVkks+aSElJT+TpRGLBE5491EjhvR3evzA4p0M2NWa9dmq9NMBN0sCve474gjr+88GuMx/fxisBy5PDu3rhHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I7QyD/9u; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I7QyD/9u"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c55500d08cso922108785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747944141; x=1748548941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYtEiOvOJY+FaEu+fbVRhtpVNQYUEghdyi9GI75aP8I=;
        b=I7QyD/9usM/OVEMpt7JON5vF853qfb31imsyee8pyHqwVtw86LVTaIK5OpT0NSp3sC
         syHpBEgBWLCASvEsJ5IDkoB5MdE3cGnvpSQN6e7dgUMCqQwWnqgTMicFqOpgEr5pWDrz
         OJV0d58vmZSye33xwpuXGn9xol5S/Jh67cA7GTHvTf9E90w+WxWvv5VsslhBXj6Ruz/w
         sjCq/XAreh4q3Rdll5+0mDpk2sj1NCDx2voqdNUlTjgkqX7L4m/MukH0C8jaTDX5xRUl
         fkoadIEXw0u88l/D/ysviE4wGDuB+UGAV6Vq4lJgVlw9RYZtmJtX+XKhw8tFKfl9AofF
         PYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944141; x=1748548941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYtEiOvOJY+FaEu+fbVRhtpVNQYUEghdyi9GI75aP8I=;
        b=OLnyLvcD2yTe2kXsmao4dLctZXHDkbANDGogeSwslmyEyndQ0Dqad/4Y1z1rG7kOEi
         U/pXZEKUfnCDj3YDBnncRbRjRhKMO8K+pep/VIEFEsmiFAkzpbB+dQMb/qAT7ChO03EB
         N3W5OQSfeMeA6L2BBMZyV6gY3nIfyHiEQvVyDJyhOSG9YxzGwBEcc3orDHdJogS95NIl
         02XD6UbDtiodcDlWtqSszlPX/81Rv/OVeT4T9mFd7KNtkjCKz3T84Ac4IYXlEKcp3dE5
         O0iaaKkIZYij10veUcvqJF14rZo1nfl3yzvDB/2ctDECgVnyO5WxM9tt1bMuUMRPIZ+a
         Ry4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBihPN4d7tU0RKHz/ia9F7U+3ueZjiMwzqkrnhAa++1bIX7ELDlag/DMyebMc1YIAb4PVX/hYvIEIWvx4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt3odMOLDn/zGIuYoc61pokczM7MQlfGgtV0AIgZB5TUc9P8le
	bnKEUza9RCq8SbWPHoLCxEnSFo9rBZhW/tkybhzjN2X2L15B5yP/3jCs3nwrY1Cgoysu8eSRzpE
	/PqMmWAoad8HozndqRDVEigH3xhJnW8MmrJYieYkJJOdoTh3gDkdiDpnLxkcKfw==
X-Gm-Gg: ASbGnctLWoz/lZG4iiq7JB9E5AU3NY4L6IVdVrlB0mTNzh0ppOKH+JVHRRUo+XXKXnd
	kuB5vIx4Z5ed6kP/AowiUuT8u2fmoNEZyqR7O3LtafYap+DPQAJ1eDSP9vZ96vbdyniEBgRTo7R
	1b3LwrW5bPqNjEnJGvlnKBzw3R8Wi9J51t7EYnOnnHRwc=
X-Google-Smtp-Source: AGHT+IEucfGw+409TlEusjP+6OlYVzLfhDBZdAG6SCdZYc8C7RdAhMQVE8YivqBkAZo+MIZeaLcFh1on0ea/ipIcJmE=
X-Received: by 2002:a05:6102:3ca8:b0:4bb:623:e1f7 with SMTP id
 ada2fe7eead31-4dfa6c61bdemr24828235137.16.1747944129793; Thu, 22 May 2025
 13:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522184249.3137187-1-dylanbhatch@google.com> <20250522184249.3137187-3-dylanbhatch@google.com>
In-Reply-To: <20250522184249.3137187-3-dylanbhatch@google.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Thu, 22 May 2025 13:01:58 -0700
X-Gm-Features: AX0GCFvfkzpEu5JGWQRB8yIzUnMv-s4h5bh4PH9PmaEgpJEyTdBLcPIDEBaSofI
Message-ID: <CADBMgpxiQMGZpdqxc5ejeuhowUVNWiDqx=BVmRQEWxkn1+WXHA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64/module: Use text-poke API for late relocations.
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>
Cc: Song Liu <song@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 11:43=E2=80=AFAM Dylan Hatch <dylanbhatch@google.co=
m> wrote:
> -static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, in=
t len)
> +static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, in=
t len,
> +                     struct module *me)
>  {
>         s64 sval =3D do_reloc(op, place, val);
>
> @@ -66,7 +69,11 @@ static int reloc_data(enum aarch64_reloc_op op, void *=
place, u64 val, int len)
>
>         switch (len) {
>         case 16:
> -               *(s16 *)place =3D sval;
> +               if (me->state !=3D MODULE_STATE_UNFORMED)
> +                       aarch64_insn_set(place, sval, sizeof(s16));
> +               else
> +                       *(s16 *)place =3D sval;
> +
>                 switch (op) {
>                 case RELOC_OP_ABS:
>                         if (sval < 0 || sval > U16_MAX)
> @@ -82,7 +89,11 @@ static int reloc_data(enum aarch64_reloc_op op, void *=
place, u64 val, int len)
>                 }
>                 break;
>         case 32:
> -               *(s32 *)place =3D sval;
> +               if (me->state !=3D MODULE_STATE_UNFORMED)
> +                       aarch64_insn_set(place, sval, sizeof(s32));
> +               else
> +                       *(s32 *)place =3D sval;
> +
>                 switch (op) {
>                 case RELOC_OP_ABS:
>                         if (sval < 0 || sval > U32_MAX)
> @@ -98,8 +109,10 @@ static int reloc_data(enum aarch64_reloc_op op, void =
*place, u64 val, int len)
>                 }
>                 break;
>         case 64:
> -               *(s64 *)place =3D sval;
> -               break;
> +               if (me->state !=3D MODULE_STATE_UNFORMED)
> +                       aarch64_insn_set(place, sval, sizeof(s64));
> +               else
> +                       *(s64 *)place =3D sval;           break;
>         default:
>                 pr_err("Invalid length (%d) for data relocation\n", len);
>                 return 0;
> @@ -113,7 +126,8 @@ enum aarch64_insn_movw_imm_type {
>  };

Don't merge this. I spotted an issue -- for the data relocations this
looks like an incorrect usage of aarch64_insn_set(). An updated
version will follow soon.

Thanks,
Dylan
