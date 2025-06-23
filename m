Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5431E16419
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750685422; cv=none; b=vGTGo1iqt8X2SKneSXwz45Wzb4bYICQTN/otfp9tRzBS2oReD3KObXUAqeSqDOp/L97EOgJnG/e8J7nuSpHckWNzfFBSTiEhQnGtOYkETQhcUVXBwNCtaUEKhAFDNh0yWuGgghNky/6eeIa428flzaOQRPRHupjp/FgeH/ydJpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750685422; c=relaxed/simple;
	bh=yXENaxznHI2XmmlyfveMuaijNIpAY+BCUlQPaEn5SX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMZvbxSUsz5hJM1tmnzWkoEVRq6EpmIMQsTpaLI2zJecU1RtCduIvjkff8c6fXGXqMk7qj2Lrcr6NjW/DQABJfqH1+/uuKHtoK13m1y8rpa6SiC6vf9lVX+izS9f1GeHQZFBa+wtwbTjLPMGtvNvR05BWcvnTM8tT2xTeWHPMJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=lzwbfBNl; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="lzwbfBNl"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so3064462a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750685419; x=1751290219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKn166nhd2vRAB+vjvAn9tp9brfNmr3hAAU8p4nKNcM=;
        b=lzwbfBNlaYbeDLvI9UqhHP0hSvyijK+sJkKJpfY+B1jfPxlPJdMFBCLcjcqB8u4zNQ
         EDUkcXtUo594q4zM2o1xM/89HAqT9abcNiy724PsdDdngwBX99Q6wa+uHYSqXC1sFJvX
         ntI8PqxsHxVzbpunudNjj9pGAKCN6N7VNMfiVjMm8JAtF0SA/mg9W4/mxOISqfELg/2M
         Ey8xUtwSODHeMQ/XLMZiihyXOzGBrarpez6ET8PBHdKSSjbhoxfA9X2muPdNTZSqdNmw
         DvlQTolrDQ7YsdnqlT0teqxRkre2YZIOSEpMe+QDi7HeuJeRmiOkcZSGnJWhW0v3oXwF
         8XLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750685419; x=1751290219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKn166nhd2vRAB+vjvAn9tp9brfNmr3hAAU8p4nKNcM=;
        b=Z2COcP81wrO2dK4wM74msqAYv3g33zL0ni6NBdutVTv3/UDjUakHDl+amE1UrN819S
         r++lOdihbUNcI3x3oC9sGnM7CPr1Y9gJa0Euex23C2oSqsK3ii2yJBXa6qjOKuweOK+4
         Dg87rzvnTRXBb5GK0Hazze3sfv1cJ8+VthxZwY1KrgK0nFRfTs147Ah4wkpllHimL/3n
         H/WEpBNz6PzXpGnS9seeIeswSrTpyiPBV0d1f1redT+xmP+SKtByczXUj34Kn5Z/JCif
         72epbQ/02x2IM3t6F73ysOqGem89vX/KV6K8xDTRUOUZ5hxA92qas9C2t2mbYLHdLATZ
         wGGg==
X-Forwarded-Encrypted: i=1; AJvYcCWq4TD+KKr1ALqchEOxMG24eWAwk4QshTvrLLbyOyaWR09FBgToWXOPeaF7pbsw9ninlgzE8CXP0XNuvUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwENuvYLW3JbT9qM3xbLawS25K4MVCiQKnPued1waCe9k77GLVI
	805cUdXMIN2did2iQvqxuJ4lcoLAJwGAOJZJ5YQLROPxK1skxZvc4ug9NgUQNTV/T818IkWLuCT
	k6Dc+th/bDlu9EC3K4lN6ScX/V2iQDCqZNGKntO6Dig==
X-Gm-Gg: ASbGncs1UYv6I8uoDv/FPx0/2IAz28L4LQWdTC3hmViowqiU7ZxoURrU0BHkfWohsQU
	7btGBaAq9Awn270ViOh/J/So3wpws+5GFHApeg5mnZFljVtwYO855TxOjPf74zWsQa+A0bJ1fXM
	FFDU0sO9LVULu5vvSuzeK5J95hmS/UO+Vpu9R/4EtFfFG7r64Ea6pmSCA6
X-Google-Smtp-Source: AGHT+IHF1Hcuk/RAkT+EseXWRNvrv+2qmNTXnsVVg6nxOR87Q4OB77LUweEQu2VwDvVZDZZRDNtkS3pR8bqS8cw2TjI=
X-Received: by 2002:a17:90b:1f8b:b0:311:e8cc:424e with SMTP id
 98e67ed59e1d1-3159d8d685dmr23055733a91.24.1750685418484; Mon, 23 Jun 2025
 06:30:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com> <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
 <CAPYmKFs7tmMg4VQX=5YFhSzDGxodiBxv+v1SoqwTHvE1Khsr_A@mail.gmail.com> <4f47fae6-f516-4b6f-931e-92ee7c406314@rivosinc.com>
In-Reply-To: <4f47fae6-f516-4b6f-931e-92ee7c406314@rivosinc.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 23 Jun 2025 21:30:07 +0800
X-Gm-Features: AX0GCFuZrApuLifWgQXPn_CdwuukUUywAVgWxIPzad1ai5Q1hxJEOckJdpBbxn8
Message-ID: <CAPYmKFvT6HcFByEq+zkh8UBUCyQS_Rv4drnCUU0o-HQ4eScVdA@mail.gmail.com>
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

Hi Cl=C3=A9ment,

On Mon, Jun 23, 2025 at 8:35=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
>
>
> On 23/06/2025 14:12, Xu Lu wrote:
> > Hi Cl=C3=A9ment,
> >
> > On Mon, Jun 23, 2025 at 4:05=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger=
@rivosinc.com> wrote:
> >>
> >>
> >>
> >> On 20/06/2025 14:04, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
> >>> 2025-06-20T17:17:20+08:00, Xu Lu <luxu.kernel@bytedance.com>:
> >>>> Delegate illegal instruction fault to VS mode in default to avoid su=
ch
> >>>> exceptions being trapped to HS and redirected back to VS.
> >>>>
> >>>> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> >>>> ---
> >>>> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/=
asm/kvm_host.h
> >>>> @@ -48,6 +48,7 @@
> >>>> +                                     BIT(EXC_INST_ILLEGAL)    | \
> >>>
> >>> You should also remove the dead code in kvm_riscv_vcpu_exit.
> >>>
> >>> And why not delegate the others as well?
> >>> (EXC_LOAD_MISALIGNED, EXC_STORE_MISALIGNED, EXC_LOAD_ACCESS,
> >>>  EXC_STORE_ACCESS, and EXC_INST_ACCESS.)
> >>
> >> Currently, OpenSBI does not delegate misaligned exception by default a=
nd
> >> handles misaligned access by itself, this is (partially) why we added
> >> the FWFT SBI extension to request such delegation. Since some supervis=
or
> >> software expect that default, they do not have code to handle misalign=
ed
> >> accesses emulation. So they should not be delegated by default.
> >
> > It doesn't matter whether these exceptions are delegated in medeleg.
>
> Not sure to totally understand, but if the exceptions are not delegated
> in medeleg, they won't be delegated to VS-mode even though hedeleg bit
> is set right ? The spec says:
>
> A synchronous trap that has been delegated to HS-mode (using medeleg)
> is further delegated to VS-mode if V=3D1 before the trap and the
> corresponding hedeleg bit is set.

Yes, you are right. The illegal insn exception is still trapped in M
mode if it is not delegated in medeleg. But delegating it in hedeleg
is still useful. The opensbi will check CSR_HEDELEG in the function
sbi_trap_redirect. If the exception has been delegated to VS-mode in
CSR_HEDLEG, opensbi can directly return back to VS-mode, without the
overhead of going back to HS-mode and then going back to VS-mode.

>
>
>
> > KVM in HS-mode does not handle illegal instruction or misaligned
> > access and only redirects them back to VS-mode. Delegating such
> > exceptions in hedeleg helps save CPU usage even when they are not
> > delegated in medeleg: opensbi will check whether these exceptions are
> > delegated to VS-mode and redirect them to VS-mode if possible. There
> > seems to be no conflicts with SSE implementation. Please correct me if
> > I missed anything.
>
> AFAIU, this means that since medeleg bit for misaligned accesses were
> not delegated up to the introduction of the FWFT extension, VS-mode
> generated misaligned accesses were handled by OpenSBI right ? Now that
> we are requesting openSBI to delegate misaligned accesses, HS-mode
> handles it's own misaligned accesses through the trap handler. With that
> configuration, if VS-mode generate a misaligned access, it will end up
> being redirected to VS-mode and won't be handle by HS-mode.
>
> To summarize, prior to FWFT, medeleg wasn't delegating misaligned
> accesses to S-mode:
>
> - VS-mode misaligned access -> trap to M-mode -> OpenSBI handle it ->
> Back to VS-mode, misaligned access fixed up by OpenSBI

Yes, this is what I want the procedure of handling illegal insn
exceptions to be. Actually it now behaves as:

VS-mode illegal insn exception -> trap to M-mode -> OpenSBI handles it
-> Back to HS-mode, does nothing -> Back to VS-mode.

I want to avoid going through HS-mode.

>
> Now that Linux uses SBI FWFT to delegates misaligned accesses (without
> hedeleg being set for misaligned delegation, but that doesn't really
> matter, the outcome is the same):
>
> - VS-mode misaligned access -> trap to HS-mode -> redirection to
> VS-mode, needs to handle the misaligned access by itself
>
>
> This means that previously, misaligned access were silently fixed up by
> OpenSBI for VS-mode and now that FWFT is used for delegation, this isn't
> true anymore. So, old kernel or sueprvisor software that  included code
> to handle misaligned accesses will crash. Did I missed something ?

Great! You make it very clear! Thanks for your explanation. But even
when misalign exceptions are delegated to HS-mode, KVM seems to do
nothing but redirect to VS-mode when VM get trapped due to misalign
exceptions. So maybe we can directly delegate the misaligned
exceptions in hedeleg too before running VCPU and retrieve them after
VCPU exists. And then the handling procedure will be:

VS-mode misaligned exception -> trap to VS-mode -> VS handles it ->
Back to VU-mode.

Please correct me if I missed anything.

Best Regards,

Xu Lu

>
> Note: this is not directly related to your series but my introduction of
> FWFT !
>
> Thanks,
>
> Cl=C3=A9ment
>
> >
> > Best Regards,
> > Xu Lu
> >
> >>
> >> Thanks,
> >>
> >> Cl=C3=A9ment
> >>
> >>>
> >>> Thanks.
> >>>
> >>> _______________________________________________
> >>> linux-riscv mailing list
> >>> linux-riscv@lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> >>
>
