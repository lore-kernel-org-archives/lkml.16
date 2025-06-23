Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52BD23315E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674613; cv=none; b=ZwZW42vONiDJRM21vttzYwp7Aknr7q3H/J4YftP3FOnqO+4uaQOOX9p4IrhPD63vNMuC3KLW0BZ6uyUnxKUz+YDALSSnGitTXtJ2VhsMwZFEB2W911sFi0DzsMToQLbouPVpZzN3SvW3LHpCaoXTrHBfhvOWAGaEsF38HxOebuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674613; c=relaxed/simple;
	bh=15q1L8C4ZgBW7rR9Tk0j0vLXF86Ag6TO7eVagqgQQ0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMGj+q3XoUWeAIKEFOxrZUwzuV3IZ8TmhjWQuGyV/Nqeu5zPMYEvm7G0RQ3J0RDlAzos56+MEiBTHD87GoQ8fdtNulsEnGFffAUbWgK8s4PITK+nsPQLawhpPy7hY23Q7FiywqIZ7kXFxFaHERBJQ0Hb2bWOoY773SMW39vXInQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RUMaKSb4; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RUMaKSb4"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b31d489a76dso3338275a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750674611; x=1751279411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2Xh6Dpoc9NJla9DLdZ/WLUd9H1GHAIOhYhI+2Em4eg=;
        b=RUMaKSb4NPfcCoqRmbjrw7DoNO7P3hcwf/eU+8PiSTHvM2yRCo450Af5dQe8qVtbu1
         unpqKnRykrdoQL3p8X7j1iTGmzD8q/LF6zmAwE7ftuCe5mBXmaHEdVtYoeSg78V40QEm
         16CrARRWNZE0CaRbtlwKrMXaQRmM1tq7S0ad1rvPOTA/k1JkbK04y406/NFcj0fY6Bqd
         h78dJhTthOpk522xDMoEpfAfA3Th7k7F50hqpqM1PxNbxZDlOHx2KlT/EEFLTDlyP0sO
         SvA5vYzLrfIgi1TN9PD3b2ILlHyeh9oElYhcq1O/ES3Yi+y7JBd4w1THVTIc39xXfNrK
         uhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750674611; x=1751279411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2Xh6Dpoc9NJla9DLdZ/WLUd9H1GHAIOhYhI+2Em4eg=;
        b=koZM6hJSvmsxIUwUR7UKrBeU2RneapBFh82cY/yrSek/4uSklaaebXZl1vbOSeme/L
         hPMS8aPI/9XH7+dhyu7G1szcBRY/kLEf8Ou66iVpcB+qs0X2WE6Nbhpru9HxAnCQsT/o
         qeJcFeocXEBVv9Ninz6UMqHCKrwb2duSrKe2Sl54WtsMByeZSN9cBBGQo40cKkXiiTfC
         w7rA+l0hZWE7MG7cOxZ0I7afEsnVTDnt7DVe5lVqgb2E92XzcjWhn5yQZqRE7BhH4L8l
         YEPA/69iKU8VKmAEXyMj3CV2NA75ehKtrfVdv9AsAvfU7PNaswfJmhpTbHiNn/wVt96d
         gG/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaMpsegEQ6ymaiI3HXSnO0I97JZVVEq7Snti3brCU9DghiBitJIetxZlLZDdaf9Vp05emGxzOGEOGhXvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTVX+p61snyY2EQ7dJtUbO17y7lsk/g3GSuDcfLDSt1inuHoOk
	pmP4GxmMXIRQUN9KB1fTtyUy85ONmOC3guFEkR/6cnHBZYwqEmYYd2EEfCwAV5p+8RAl9gya5ZY
	7BqEvK7utDU9V8u5G/P4BPQaHu6sudEH3CI0pAVEEplXoFkmQ4xPVLhWcHtVw
X-Gm-Gg: ASbGncvtSvhTftqkqIQtEFjHLR/E+phC9m8DriPabf7R6O7NEbV7FLvkxEyRGVFEDeG
	qC2NdMpjyjcdOiu8pEJkMODtFhWnqcKOIN469vKSc0tCpzQl9BOHhVM4U7w9ZogF/vRC82jM17C
	BNk/LrnJ3IsEm99vZBiPSH2Mbi0xkLkPubVM6dbnx6FhKYW8uGVduN61aV
X-Google-Smtp-Source: AGHT+IHUUgFd5CAVoui8WeB8d4VDjaMayhZu3ZI45zZpLWDJx7B3fRr4MhP36Fw+gyvFSnnTysBzyBVcg3Vlfp8B2jA=
X-Received: by 2002:a17:90b:5690:b0:312:f0d0:bc4 with SMTP id
 98e67ed59e1d1-3159d626112mr16340875a91.5.1750674610724; Mon, 23 Jun 2025
 03:30:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com> <CAPYmKFvcnDJWXAUEX8oY6seQrgwKiZjDqrJ_R2rJ4kWq7RQUSg@mail.gmail.com>
 <DATTT5U64J4L.3UTDRVT2YP7GT@ventanamicro.com>
In-Reply-To: <DATTT5U64J4L.3UTDRVT2YP7GT@ventanamicro.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 23 Jun 2025 18:29:59 +0800
X-Gm-Features: AX0GCFtfoIOnfs7J2STs_OR-jY-38t6kH55fmz7DcsUlJBJ7-TA3sUK7F3GCaB8
Message-ID: <CAPYmKFtyJ-6N8ArP04QJNMFC3ScRnvp_9rijufQEnJRz4UrBQQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: anup@brainfault.org, atish.patra@linux.dev, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Radim,

On Mon, Jun 23, 2025 at 6:04=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcma=
r@ventanamicro.com> wrote:
>
> 2025-06-22T18:11:49+08:00, Xu Lu <luxu.kernel@bytedance.com>:
> > Hi Radim,
> >
> > On Fri, Jun 20, 2025 at 8:04=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rk=
rcmar@ventanamicro.com> wrote:
> >>
> >> 2025-06-20T17:17:20+08:00, Xu Lu <luxu.kernel@bytedance.com>:
> >> > Delegate illegal instruction fault to VS mode in default to avoid su=
ch
> >> > exceptions being trapped to HS and redirected back to VS.
> >> >
> >> > Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> >> > ---
> >> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/=
asm/kvm_host.h
> >> > @@ -48,6 +48,7 @@
> >> > +                                      BIT(EXC_INST_ILLEGAL)    | \
> >>
> >> You should also remove the dead code in kvm_riscv_vcpu_exit.
> >
> > I only want to delegate it by default. And KVM may still want to
> > delegate different exceptions for different VMs like what it does for
> > EXC_BREAKPOINT.
>
> (I think we could easily reintroduce the code if KVM wants to do that in
>  the future.  I also think that it's bad that this patch is doing an
>  observable change without userspace involvement -- the counting of KVM
>  SBI PMU events, but others will probably disagree with me on this.)
>
> >                 So maybe it is better to reserve these codes?
>
> Possibly, the current is acceptable if you have considered the
> implications on PMU events.

So maybe it comes back to our discussion on the difference between vs
insn fault and illegal insn fault again~ In my personal opinion, it
seems to be a waste of CPU resources to trap illegal instruction to
HS-mode hypervisor, which does nothing but redirect it back to VS-mode
guest kernel. I think it is OK (and maybe it should) to record 0
illegal instruction exits in KVM PMU. If someone wants illegal insn to
trigger an vcpu exit, then an ioctl can be provided to remove the
delegation like what KVM_SET_GUEST_DEBUG does.

>
> >> And why not delegate the others as well?
> >> (EXC_LOAD_MISALIGNED, EXC_STORE_MISALIGNED, EXC_LOAD_ACCESS,
> >>  EXC_STORE_ACCESS, and EXC_INST_ACCESS.)
> >
> > Thanks for the reminder. I will have a test and resend the patch if it =
works.
>
> The misaligned exceptions are already being worked on, so don't waste
> your time on them, sorry.

Thanks for the reminder too. I did not consider this before. I will
leave the MISALIGNED faults alone.

Best Regards,

Xu Lu
