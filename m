Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A344638FA3
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687757; cv=none; b=XAzE390/6Q7CR2s9p4161ghGkzCMWVwBz+/PArrdW3b5ms7uv7YO+0ge88S42zupQt5vvG0GKrzEKgLJRuah1SxgbP401x215omrAyjox/FE2wZtiD9+UEIl0vbeiCate3MpCaM/Oe2uJ+jZfdShDGPEnYmhB1TwlakarxrWeQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687757; c=relaxed/simple;
	bh=C2tmbrwmI2DAu6nIk1nri7yiuu1MNBsSZUKZ+x6+5jI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JILa1ryxjAoY2NSrF3dq47JlKuJ5qp54wLQtPOGBOaGeL3EQMTQ7Y/L5Spa9CVdKSrTB4LAYsRq7ORNsIhv4L6ncFkdTxKfU6+0XD8FAwCe08A6+1rXP1WyLArllQZyhMKHbLQlybC8OOhnwqkLQkef1oR0AaCm0Y8PmtYggTrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=l3s9/f5Q; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="l3s9/f5Q"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso3338035a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750687754; x=1751292554; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cYOpmr7ejhSQ4NGHbHR+I2d9wPM35nKHPVPsDXvgEw=;
        b=l3s9/f5QI0rc3xAnoMX36U8qFEZzxjZSPw2uhHv0vcK+WLGKh4gyJUv/H3p3mOUxjS
         1U1cPNECtIg8cOLhzSesUNzhYrPYZNxeIhVulilD6Z2I5lZsJx3DqudPppYcVaTzSZZB
         CZF7pGKDig63COKveSEngbaMmDmX0WodOiMlOZTwYT6NB4abEZNP9d329mqAnZo6Jb/A
         pJol6CDwfUHqDUT0eJTERQTQO3dkUfJx62q1ssCeb4SZ/6GgedAPLeKOtey3k7g8oOg9
         lmmgy2RFC3HLKw6Lojyhn3RzarGJdo3XB+51QqMNKSNZF9zeK4nHume8Bmd3PBDGhQ9T
         eaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687754; x=1751292554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cYOpmr7ejhSQ4NGHbHR+I2d9wPM35nKHPVPsDXvgEw=;
        b=ABbFpvq9a6gcqNulkL/3kpgy0XLPYcEXGBTci61WnknxxvVrD7WdRrWWrMeaXy6i7R
         vrdXmBebzYc2MaahkYprdRZxsSJQZgPc7Oz1ZOSiClNdwI381Nm5eh37qjmK9iIjez8D
         Z/KHtwV2hV1uW8b7qfUBBwwl91V4xTPJ9r0nIvAkv78hw25kYaTWJUTVTAX16C4AVb8U
         dBBPYQ/8LsU/5jAZO7Hd8HG7l+pNAiTCtA43XijYhsEs8+5uSNuZpGSYtLWkFVSzSf3w
         dzgG1R6Exwur3cJCWKSOOTcnYYwdk4iaYT4RmVPVZgjhzbSrsIDamrvMEgC3+sht0PZn
         3tCA==
X-Forwarded-Encrypted: i=1; AJvYcCX+wJCNcyh0OHCt6YURzi51T6vRwcYVhvmI8NtlzVrJFIouFiQPSry/jZ8TciK+xnaI8nQy+nAnLIOv2Y4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+0cmijwloMKWqaMvciDizTYoC/q3ohSjl2O04M/0I8J0xKCcU
	i7w4MuFj33nGWTVYOnndAhD/vKtY4PVlf8dTAlHTnsbA5+G6mo4FjBTzSAJqo9A+2GUWx9a8KNR
	4ZrsH6uEMpyjcSQAfEgWd6ZzWKzToEqH0vyoJwN6jUw==
X-Gm-Gg: ASbGncvkKxKdqgGSYyPHRKh2lka0+Z1WucdQxlwQoEWI/aTsemxI4Ppdigqscz6yNeD
	QKUmhcBBkZjEsbxXzVgu/WozbNUIIXx/KBmuddKc3uhSmJZ0IJtTnYj+AoJvmMcuHxIrOTu/bE0
	Wz8uoxHyBhkzLu/alxOjdMEC3UiyKIjBDhgYxuyBqDnzb++S5l4AI8Lxi9
X-Google-Smtp-Source: AGHT+IEl1T3TohTpq5KxIngvVUlDJR7SLQRNvOOpNO1X72zLaXdZXqVz9cSwOMBrztsM8fp8gM2scP6AocjulndvZzo=
X-Received: by 2002:a17:90b:55c3:b0:312:f2ee:a895 with SMTP id
 98e67ed59e1d1-3159d8ff73bmr14894086a91.31.1750687753793; Mon, 23 Jun 2025
 07:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com> <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
 <CAPYmKFs7tmMg4VQX=5YFhSzDGxodiBxv+v1SoqwTHvE1Khsr_A@mail.gmail.com>
 <4f47fae6-f516-4b6f-931e-92ee7c406314@rivosinc.com> <CAPYmKFvT6HcFByEq+zkh8UBUCyQS_Rv4drnCUU0o-HQ4eScVdA@mail.gmail.com>
 <b9203c8d-4c34-4eb3-a94f-5455cfc2eb53@rivosinc.com>
In-Reply-To: <b9203c8d-4c34-4eb3-a94f-5455cfc2eb53@rivosinc.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 23 Jun 2025 22:09:02 +0800
X-Gm-Features: AX0GCFuZxXab4k58liWIS-sy5UXZPZcmAeAg0GwIw73oyms0WAn0rXaWlAM8SU0
Message-ID: <CAPYmKFtCx0qg4fEOVAhthXYvhu-X0MR5zXZLVfSmbCmNMN=ZYg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	anup@brainfault.org, atish.patra@linux.dev, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 9:42=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
>
>
> On 23/06/2025 15:30, Xu Lu wrote:
> > Hi Cl=C3=A9ment,
> >
> > On Mon, Jun 23, 2025 at 8:35=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger=
@rivosinc.com> wrote:
> >>
> >>
> >>
> >> On 23/06/2025 14:12, Xu Lu wrote:
> >>> Hi Cl=C3=A9ment,
> >>>
> >>> On Mon, Jun 23, 2025 at 4:05=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleg=
er@rivosinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 20/06/2025 14:04, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
> >>>>> 2025-06-20T17:17:20+08:00, Xu Lu <luxu.kernel@bytedance.com>:
> >>>>>> Delegate illegal instruction fault to VS mode in default to avoid =
such
> >>>>>> exceptions being trapped to HS and redirected back to VS.
> >>>>>>
> >>>>>> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> >>>>>> ---
> >>>>>> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/includ=
e/asm/kvm_host.h
> >>>>>> @@ -48,6 +48,7 @@
> >>>>>> +                                     BIT(EXC_INST_ILLEGAL)    | \
> >>>>>
> >>>>> You should also remove the dead code in kvm_riscv_vcpu_exit.
> >>>>>
> >>>>> And why not delegate the others as well?
> >>>>> (EXC_LOAD_MISALIGNED, EXC_STORE_MISALIGNED, EXC_LOAD_ACCESS,
> >>>>>  EXC_STORE_ACCESS, and EXC_INST_ACCESS.)
> >>>>
> >>>> Currently, OpenSBI does not delegate misaligned exception by default=
 and
> >>>> handles misaligned access by itself, this is (partially) why we adde=
d
> >>>> the FWFT SBI extension to request such delegation. Since some superv=
isor
> >>>> software expect that default, they do not have code to handle misali=
gned
> >>>> accesses emulation. So they should not be delegated by default.
> >>>
> >>> It doesn't matter whether these exceptions are delegated in medeleg.
> >>
> >> Not sure to totally understand, but if the exceptions are not delegate=
d
> >> in medeleg, they won't be delegated to VS-mode even though hedeleg bit
> >> is set right ? The spec says:
> >>
> >> A synchronous trap that has been delegated to HS-mode (using medeleg)
> >> is further delegated to VS-mode if V=3D1 before the trap and the
> >> corresponding hedeleg bit is set.
> >
> > Yes, you are right. The illegal insn exception is still trapped in M
> > mode if it is not delegated in medeleg. But delegating it in hedeleg
> > is still useful. The opensbi will check CSR_HEDELEG in the function
> > sbi_trap_redirect. If the exception has been delegated to VS-mode in
> > CSR_HEDLEG, opensbi can directly return back to VS-mode, without the
> > overhead of going back to HS-mode and then going back to VS-mode.
> >
> >>
> >>
> >>
> >>> KVM in HS-mode does not handle illegal instruction or misaligned
> >>> access and only redirects them back to VS-mode. Delegating such
> >>> exceptions in hedeleg helps save CPU usage even when they are not
> >>> delegated in medeleg: opensbi will check whether these exceptions are
> >>> delegated to VS-mode and redirect them to VS-mode if possible. There
> >>> seems to be no conflicts with SSE implementation. Please correct me i=
f
> >>> I missed anything.
> >>
> >> AFAIU, this means that since medeleg bit for misaligned accesses were
> >> not delegated up to the introduction of the FWFT extension, VS-mode
> >> generated misaligned accesses were handled by OpenSBI right ? Now that
> >> we are requesting openSBI to delegate misaligned accesses, HS-mode
> >> handles it's own misaligned accesses through the trap handler. With th=
at
> >> configuration, if VS-mode generate a misaligned access, it will end up
> >> being redirected to VS-mode and won't be handle by HS-mode.
> >>
> >> To summarize, prior to FWFT, medeleg wasn't delegating misaligned
> >> accesses to S-mode:
> >>
> >> - VS-mode misaligned access -> trap to M-mode -> OpenSBI handle it ->
> >> Back to VS-mode, misaligned access fixed up by OpenSBI
> >
> > Yes, this is what I want the procedure of handling illegal insn
> > exceptions to be. Actually it now behaves as:
> >
> > VS-mode illegal insn exception -> trap to M-mode -> OpenSBI handles it
> > -> Back to HS-mode, does nothing -> Back to VS-mode.
> >
> > I want to avoid going through HS-mode.
>
> Hi Xu,
>
> Yeah, that make sense as well but that should only happen if the VS-mode
> requested misaligned access delegation via KVM SBI FWFT interface. I
> know that currently KVM does do anything useful from the misaligned
> exception except redirecting it to VS-mode but IMHO, that's a regression
> I introduced with FWFT misaligned requested delegation...
>
> >
> >>
> >> Now that Linux uses SBI FWFT to delegates misaligned accesses (without
> >> hedeleg being set for misaligned delegation, but that doesn't really
> >> matter, the outcome is the same):
> >>
> >> - VS-mode misaligned access -> trap to HS-mode -> redirection to
> >> VS-mode, needs to handle the misaligned access by itself
> >>
> >>
> >> This means that previously, misaligned access were silently fixed up b=
y
> >> OpenSBI for VS-mode and now that FWFT is used for delegation, this isn=
't
> >> true anymore. So, old kernel or sueprvisor software that  included cod=
e
> >> to handle misaligned accesses will crash. Did I missed something ?
> >
> > Great! You make it very clear! Thanks for your explanation. But even
> > when misalign exceptions are delegated to HS-mode, KVM seems to do
> > nothing but redirect to VS-mode when VM get trapped due to misalign
> > exceptions.
>
> Exactly, which is why I said that either setting hedeleg by default or
> not will lead to the same outcome, ie: VS-mode needs to handle access by
> itself (which is a regression introduced by FWFT usage).
>
>
> > So maybe we can directly delegate the misaligned
> > exceptions in hedeleg too before running VCPU and retrieve them after
> > VCPU exists. And then the handling procedure will be:
> >
> > VS-mode misaligned exception -> trap to VS-mode -> VS handles it ->
> > Back to VU-mode.
>
> I'd better want to let the HS-mode handle the misaligned accesses if not
> requested via the KVM SBI FWFT interface by VS-mode to keep HS-mode
> expected behavior. As you pointed out, this is not currently the case
> and the misaligned exceptions are directly redirected to VS-mode, this
> differs from what was actually done previously without FWFT (ie OpenSBI
> handles the misaligned access).
>
> To summarize, I think HS-mode should fixup VS-mode misaligned accesses
> unless requested via KVM SBI FWFT interface, in which case it will
> delegates them (which is done by the FWFT series). This would match the
> HS-mode <-> OpenSBI behavior.

Great! Roger that. Hope it can be fixed in the future.

>
> Thanks,
>
> Cl=C3=A9ment
>
> >
> > Please correct me if I missed anything.
> >
> > Best Regards,
> >
> > Xu Lu
> >
> >>
> >> Note: this is not directly related to your series but my introduction =
of
> >> FWFT !
> >>
> >> Thanks,
> >>
> >> Cl=C3=A9ment
> >>
> >>>
> >>> Best Regards,
> >>> Xu Lu
> >>>
> >>>>
> >>>> Thanks,
> >>>>
> >>>> Cl=C3=A9ment
> >>>>
> >>>>>
> >>>>> Thanks.
> >>>>>
> >>>>> _______________________________________________
> >>>>> linux-riscv mailing list
> >>>>> linux-riscv@lists.infradead.org
> >>>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> >>>>
> >>
>
