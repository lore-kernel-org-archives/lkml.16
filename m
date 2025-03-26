Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1453118801A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 22:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743029975; cv=none; b=rmi/3uKT+YaHTUuM/xBOCOCgzgx821ZaUEjzckrhW8LvibQrUPlFQQ7a9CpZEoZg5bzl2myXO8qadou3ytzk/H5gk7Umr2gGz3QSx6S/SA1Q+IIi4PeYtSwaKnnXxbmjNt8pocJcU2GNgnI96QCEImxSvTnU+A3fKffgjRulrMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743029975; c=relaxed/simple;
	bh=oCotB3CWAPGmjKmB++YF7MqksREh4dPh7UcJENfqLms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZeRK2XMnhnyVjO9FE4GQNdWhYFKLmiMF1yAcjoo5HfU3GOKyRHbHKu5OhBaatUgRbgkK6wIIgpFaeCyhJzAbjLz1tPNJtn+K0Jm7cQvYLwrF+oHGj+m3wh1J7dmA+214KCtpois8i3SklA5yCPDejS3mV6gTIDShIROMq0xZdKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6uVBfpQ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6uVBfpQ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so45725066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 15:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743029971; x=1743634771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnjOdMuPrPbHVlkVhqKsZEV9qXeX5kNKsXmHtI6is1U=;
        b=H6uVBfpQNsMJQHRGrFTyN7YRu0bYDmdIdXaY4MQqd/XiW9RIre6wsjvvxU2Wqe8ak0
         QXNM8yek5kbQGq5Pzj5JS1hIbk5o4Ux2PB9oYH5JxzbMhz878EjXBVgPWANxzDuYqOwt
         LBtSznHs3qdiR1VnytwETSuLTy3qjI5EwAQcgsD1u39u/8jBgqVk8+SY61vQAn+DQKJU
         crlCw0L9jJK+TucJW8Q+uRWiuYUrSxfcK/WJ46PnqxplZiSYk6H9igtCBXzQUEmrMRvN
         +OnNv3qrUWPMTDGELIaDKo7hdtO1+KAphoO58wC5F8A42b4wVoV1oMa8Zxiy7lJPbd+q
         jAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743029971; x=1743634771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GnjOdMuPrPbHVlkVhqKsZEV9qXeX5kNKsXmHtI6is1U=;
        b=p6cJAQDeJNHvEuQhi9LBnlwy+h5kEtWY7jml0WgYMXem17ePgS/Llld5uy771fP6IA
         WRsBqKTaAj4wFkxaZ0B+mbxip8kkPSNmjIco1LHrwwgbg38dcf4ENhdy0jQJ6Iuq1NAC
         Fo/SeDaeN3zEHV3SEr2VAavB0dGBFslSHvxpqMzWM6u7PLNhMqpkq1Bec/dP1m2rVIor
         nvWhe8mBMAez0K9Q+DUTiBsH+4UGRknunHB3wwIUnV2KQiwwcYdcVCYMRurptB3nqBfv
         HQh8FmSy3Zx8b7CyTg0/1g0WRlEaInwlEzdjvUiB2pB8BnwDOOW0wvcOWzCP3FYgaNNg
         mobQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB0wtFuZ75Onf07DXjDTYfGO1W3Jns8Qd+N2i+QHFLebQDEpF1V03Uas0WQf2/DPVOO9MH7Axme8BxhdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYN16z4N+6RJwaOJmiNpkkE7b+SdyKgDZEraVR4hUwI3FN5ZIB
	QuQ8piIwwPSwkCyAiCRP0txu/taRHF99lUlhgVyWW9jOeqGT3L0t0woa7CWap4YNW0cvepYGV8a
	W+d7BHav2+FhZCwPY+0sJRiwtZGo=
X-Gm-Gg: ASbGncte+ujjLL15NaMdpqKojNsCBbSFuRlzn/0XLPuHWDGGhjMl+E+NyqoErXjRbpH
	otAK2BtxNQZE7iVVFbvs8SvBmOy4e/XOqHT/cIMgyY50uYdgq3aWgS7ogztfzLXf1aNQ2cGF99q
	Q0DQ0W6z2bkSoOGB/qayDzvQmGbA==
X-Google-Smtp-Source: AGHT+IGWm1rNjhJvsn8LRxQTnsDFuS2J3bsbbY/WHA2fi935tpWZa17AzXtRR2kHL6YNyt9qSQhqxWtSvHqmu405s9w=
X-Received: by 2002:a17:907:9809:b0:ac3:8a3a:e924 with SMTP id
 a640c23a62f3a-ac6fb148dbcmr119646466b.39.1743029970954; Wed, 26 Mar 2025
 15:59:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320190514.1961144-1-mjguzik@gmail.com> <CAHk-=whd82fzhEbFRw9d_EMtR1SeefOJabjCHcm4-6jzeqqd3g@mail.gmail.com>
 <CAGudoHGNFT+LC24842ZKLWBxD3vvvddBqDKa6gkixN4Esor+RQ@mail.gmail.com>
 <CAHk-=wjo__Bj3JNw_7E8HhTDUF65LVOApvN0D2cofgotJoqpmg@mail.gmail.com>
 <CAHk-=wjxi0poUzCd666Kx5wCjgOwN5v=-zG8xSAL7Wj_ax8Zvw@mail.gmail.com>
 <20250321204723.1e21cb23@pumpkin> <CAJmZWFHTG8cR77zrUpKF81tphcTQ1fyDO6vqnY57ptcs2yM=-A@mail.gmail.com>
In-Reply-To: <CAJmZWFHTG8cR77zrUpKF81tphcTQ1fyDO6vqnY57ptcs2yM=-A@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 26 Mar 2025 23:59:18 +0100
X-Gm-Features: AQ5f1JrUy6iOgu5g1D0trOH7jmUUnIxbCEqLtspFTcJfDtREZWm1Hl98SZcZSa4
Message-ID: <CAGudoHHUxnx_kVcaNgb0oVUF4xQtkiD_cQGMAAf5jF_e-+9m=w@mail.gmail.com>
Subject: Re: [PATCH] x86: handle the tail in rep_movs_alternative() with an
 overlapping store
To: Herton Krzesinski <hkrzesin@redhat.com>
Cc: David Laight <david.laight.linux@gmail.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	olichtne@redhat.com, atomasov@redhat.com, aokuliar@redhat.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 11:42=E2=80=AFPM Herton Krzesinski <hkrzesin@redhat=
.com> wrote:
>
> On Fri, Mar 21, 2025 at 5:47=E2=80=AFPM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Thu, 20 Mar 2025 16:53:32 -0700
> > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >
> > > On Thu, 20 Mar 2025 at 14:17, Linus Torvalds
> > > <torvalds@linux-foundation.org> wrote:
> > > >
> > > > On Thu, 20 Mar 2025 at 12:33, Mateusz Guzik <mjguzik@gmail.com> wro=
te:
> > > > >
> > > > > I have a recollection that handling the tail after rep movsq with=
 an
> > > > > overlapping store was suffering a penalty big enough to warrant a
> > > > > "normal" copy instead, avoiding the just written to area.
> > > >
> > > > Ahh. Good point. The rep movsq might indeed end up having odd effec=
ts
> > > > with subsequent aliasing memory operations.
> > > >
> > > > Consider myself convinced.
> > >
> > > Actually, I think there's a solution for this.
> > >
> > > Do not do the last 0-7 bytes as a word that overlaps with the tail of
> > > the 'rep movs'
> > >
> > > Do the last 8-15 bytes *non-overlapping* (well, they overlap each
> > > other, but not the 'rep movs')
> > >
> > > Something UNTESTED like the appended, in other words. The large case
> > > then ends up without any conditionals, looking something like this:
> > >
> > >         mov    %rcx,%rax
> > >         shr    $0x3,%rcx
> > >         dec    %rcx
> > >         and    $0x7,%eax
> > >         rep movsq %ds:(%rsi),%es:(%rdi)
> > >         mov    (%rsi),%rcx
> > >         mov    %rcx,(%rdi)
> > >         mov    (%rsi,%rax,1),%rcx
> > >         mov    %rcx,(%rdi,%rax,1)
> > >         xor    %ecx,%ecx
> > >         ret
> >
> > I think you can save the 'tail end' copying the same 8 bytes twice by d=
oing:
> >         sub     $9,%rcx
> >         mov     %rcx,%rax
> >         shr     $3,%rcx
> >         and     $7,%rax
> >         inc     %rax
> > before the 'rep movsq'.
>
> Not sure how above will work handling the remaining in %rax?
>
> Anyway, another version may be like this to avoid
> the rep movs penalty? Not sure if doing it before would be ok?
>
> index fc9fb5d06174..a0f9655e364c 100644
> --- a/arch/x86/lib/copy_user_64.S
> +++ b/arch/x86/lib/copy_user_64.S
> @@ -62,10 +62,15 @@ SYM_FUNC_START(rep_movs_alternative)
>         je .Lexit
>         cmp $8,%ecx
>         jae .Lword
> -       jmp .Lcopy_user_tail
> +4:     movq -8(%rsi,%rcx),%rax
> +5:     movq %rax,-8(%rdi,%rcx)
> +       xorl %ecx,%ecx
> +       RET
>
>         _ASM_EXTABLE_UA( 2b, .Lcopy_user_tail)
>         _ASM_EXTABLE_UA( 3b, .Lcopy_user_tail)
> +       _ASM_EXTABLE_UA( 4b, .Lcopy_user_tail)
> +       _ASM_EXTABLE_UA( 5b, .Lcopy_user_tail)
>
>  .Llarge:
>  0:     ALTERNATIVE "jmp .Llarge_movsq", "rep movsb", X86_FEATURE_ERMS
> @@ -74,18 +79,20 @@ SYM_FUNC_START(rep_movs_alternative)
>         _ASM_EXTABLE_UA( 0b, 1b)
>
>  .Llarge_movsq:
> +       /* copy tail byte first, to avoid overlapping
> +          penalty with rep movsq */
> +0:     movq -8(%rsi,%rcx),%rax
> +1:     movq %rax,-8(%rdi,%rcx)
>         movq %rcx,%rax
>         shrq $3,%rcx
> -       andl $7,%eax
> -0:     rep movsq
> -       movl %eax,%ecx
> -       testl %ecx,%ecx
> -       jne .Lcopy_user_tail
> +2:     rep movsq
> +       xorl %ecx,%ecx
>         RET
> -
> -1:     leaq (%rax,%rcx,8),%rcx
> +3:     movq %rax,%rcx
>         jmp .Lcopy_user_tail
>
> -       _ASM_EXTABLE_UA( 0b, 1b)
> +       _ASM_EXTABLE_UA( 0b, .Lcopy_user_tail)
> +       _ASM_EXTABLE_UA( 1b, .Lcopy_user_tail)
> +       _ASM_EXTABLE_UA( 2b, 3b)
>  SYM_FUNC_END(rep_movs_alternative)
>  EXPORT_SYMBOL(rep_movs_alternative)
>
>
>
> I have been trying to also measure the impact of changes like above, howe=
ver,
> it seems I don't get improvement or it's limited due impact of
> profiling, I tried
> to uninline/move copy_user_generic() like this:
>
> diff --git a/arch/x86/include/asm/uaccess_64.h
> b/arch/x86/include/asm/uaccess_64.h
> index c52f0133425b..2ae442c8a4b5 100644
> --- a/arch/x86/include/asm/uaccess_64.h
> +++ b/arch/x86/include/asm/uaccess_64.h
> @@ -115,25 +115,8 @@ static inline bool __access_ok(const void __user
> *ptr, unsigned long size)
>  __must_check unsigned long
>  rep_movs_alternative(void *to, const void *from, unsigned len);
>
> -static __always_inline __must_check unsigned long
> -copy_user_generic(void *to, const void *from, unsigned long len)
> -{
> -       stac();
> -       /*
> -        * If CPU has FSRM feature, use 'rep movs'.
> -        * Otherwise, use rep_movs_alternative.
> -        */
> -       asm volatile(
> -               "1:\n\t"
> -               ALTERNATIVE("rep movsb",
> -                           "call rep_movs_alternative",
> ALT_NOT(X86_FEATURE_FSRM))
> -               "2:\n"
> -               _ASM_EXTABLE_UA(1b, 2b)
> -               :"+c" (len), "+D" (to), "+S" (from), ASM_CALL_CONSTRAINT
> -               : : "memory", "rax");
> -       clac();
> -       return len;
> -}
> +__must_check unsigned long
> +copy_user_generic(void *to, const void *from, unsigned long len);
>
>  static __always_inline __must_check unsigned long
>  raw_copy_from_user(void *dst, const void __user *src, unsigned long size=
)
> diff --git a/arch/x86/lib/usercopy_64.c b/arch/x86/lib/usercopy_64.c
> index e9251b89a9e9..4585349f8f33 100644
> --- a/arch/x86/lib/usercopy_64.c
> +++ b/arch/x86/lib/usercopy_64.c
> @@ -142,3 +142,24 @@ void __memcpy_flushcache(void *_dst, const void
> *_src, size_t size)
>  }
>  EXPORT_SYMBOL_GPL(__memcpy_flushcache);
>  #endif
> +
> +__must_check unsigned long
> +copy_user_generic(void *to, const void *from, unsigned long len)
> +{
> +       stac();
> +       /*
> +        * If CPU has FSRM feature, use 'rep movs'.
> +        * Otherwise, use rep_movs_alternative.
> +        */
> +       asm volatile(
> +               "1:\n\t"
> +               ALTERNATIVE("rep movsb",
> +                           "call rep_movs_alternative",
> ALT_NOT(X86_FEATURE_FSRM))
> +               "2:\n"
> +               _ASM_EXTABLE_UA(1b, 2b)
> +               :"+c" (len), "+D" (to), "+S" (from), ASM_CALL_CONSTRAINT
> +               : : "memory", "rax");
> +       clac();
> +       return len;
> +}
> +EXPORT_SYMBOL_GPL(copy_user_generic);
>
>
> And then, using bpftrace with this script to try to measure execution tim=
es:
>
> #############################
> fentry:copy_user_generic
> /strcontains(comm,"iperf3")/
> {
>         /*printf("start %ul %p\n", args.len, kptr(args.to));*/
>         @start[kptr(args.to),args.len] =3D nsecs;
> }
>
> fexit:copy_user_generic
> /strcontains(comm,"iperf3") && @start[kptr(args.to)-args.len,args.len]/
> {
>         /*printf("end %ul %p\n", args.len, kptr(args.to)-args.len);*/
>
>         $len =3D args.len;
>         $len >>=3D 1;
>         $log_len =3D 0;
>         while ($len) {
>                 $len >>=3D 1;
>                 $log_len++;
>         }
>         $log1 =3D 1;
>         $log1 <<=3D $log_len;
>         $log2 =3D $log1;
>         $log2 <<=3D 1;
>         $dalign =3D (uint64)(kptr(args.to) - args.len);
>         $dalign &=3D 0x7;
>
>         @us[$dalign,$log1,$log2] =3D hist((nsecs -
> @start[kptr(args.to)-args.len,args.len]));
>         delete(@start, (kptr(args.to)-args.len,args.len))
> }
>
> END
> {
>         clear(@start);
> }
> #############################
>
> But the result is mixed at least in case of this change, I can't prove
> an improvement
> with it.
>

I suspect going to ebpf here has enough probe effect to overshadow any impa=
ct.

You may get a better shot issuing rdtscp before and after and then
calling a dummy probe with the difference -- that way all ebpf
overhead is incurred outside of the measured area. But this does not
account for migrating between cpus.

However, all of this convinced me to dig up an (unfinished, but close)
test jig I had for these routines.

While it neglects cache effects (as in lets things remain cache-hot),
it issues ops based on a random seed, making sure to screw with the
branch predictor. This is not perfect by any means, but should be good
enough to justify some  of the changes (namely sorting out memset and
this guy not using overlapping stores). I can't promise any specific
timeline for the sucker though, apart from this being a matter of
weeks. (best case this weekend)

--=20
Mateusz Guzik <mjguzik gmail.com>
