Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C126F4B1E54
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 05:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747287650; cv=none; b=nvyAogavybXRKXXVX2hyr0zU63y43oR5uzzvLlbrdIOq3u0TqyM/c3ZXlC2NcRUCx+GdC1wE4rwHSh0bSxzZespBpmNq2E05zgi+4hnok0HjVGMS7f3FHWZ36/fY7uK6p/6AoRBh64G9pSWwjdLBu270lkwd+/x+1uRqg4YVSzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747287650; c=relaxed/simple;
	bh=uZ03ovrsaV/oectkcsY8eo0Gp96WfQfn2ObNxL8evqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PQSbCnFs4tm5PEKtnrZjI9PD2OOKe/8aeom9FP8JlnreGaSRDlkTj6zH5XmVVYFOY5fmv8iSjy+bGJb2YctFD1HUh3yzlgR6PHdGRpYpjE5jNL9w0ioT2I1owdnltxA/4vIOuPohKzs5jdtwL4WV4yLfsIVXntYEc24IhmG2Okg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=V2oFhZXf; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="V2oFhZXf"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3da73e9cf17so4857085ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747287647; x=1747892447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uz1T20yidSVCKk3JyCiwZoMyHHxlzlfZ7sxgHG4h3Ms=;
        b=V2oFhZXfWpFBkA7BrH7qJJ1SdCimKZDQD/cyVfxbtjihKadt+JuwXDgYcBfyeOjo5t
         NAq1s4cVu/s/WGIs3pz1qQhGAgyyESlu/SBE/GHy8BdCV3uYNXhdkyDViZyC0RqrjQSO
         YlvuRxBM6OU7JFyNjSyoHqX7ZhHZHMhfTp+RxtOq92PZUAjakSG6hPFSGKn+kwDyBv8K
         6rPweHBukcdMhWzm1tlyuENXEFoL6dX1KQlY6xD3iG7vFPewTl4qJ8hXMN60FdQtkb4r
         7L8VVzDk7/27WxuhzoiSmyHONHyTUq8P//Xo8uefdbe/x6mM5bhOZeMbeTahMaZ9PFnT
         1uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747287647; x=1747892447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uz1T20yidSVCKk3JyCiwZoMyHHxlzlfZ7sxgHG4h3Ms=;
        b=uvY0ElF+AebZrPShfhA+jfjUvIJDGBEWniucbKd9eAaa9dCACaR+kMmUe5jLcWLgb3
         ufjCqd7uAC5UoglTGSlmvxWCJAw4vVJi1NM+EVArtBYdCEDTcuLqTjeJrDSUXJE/3WD3
         IttUUwm2s7R/Hz1UufNxtH7o7Oz85tSygHH8p5qmOCEb8SpPUMsYmhVDtxp7vVRrsB4S
         u6r4J5eADtJdrF9gBzE16fWJwIa0IALlqTAeUSYpQVF18S9VBI5oK/Ml9d8cIiR9NvwI
         6vQlr3Ioi6WJgcusM0y0Ujq5kpTlIe2FURpE0pWCy3en2/6jHF9njxFIcqBsp8cS/U6L
         qQKw==
X-Forwarded-Encrypted: i=1; AJvYcCUSy+LtilacvUo37GzEGD2zTYbKAyg63N9VYFaa+n5vB1e18uSjpvsBWI0ZCnM1N+VxviaxUbfmsIQ4uWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOtpEid2MUr4I0mcdnpkuey2jGZdwndVxLPB0usNNCraIRKpET
	e52oUNiEpTi4OXHewR9mCioIoxm7KjeJg6wrG6NxOhmLPKHJeMFuOevuE/D+/RsERILhYue6br/
	uHxC3hXIMpv84Q/gruBPbSVgsL1kau6SOBZocdw==
X-Gm-Gg: ASbGncvPmU4X/tOfqFn9KLndIsdGCxbeEt4ZOsOgRSLmUc9RBOR4EQ7hUB8A1QGNrYq
	2xenED4pta0Ztc5QhCIA4bXniyojz4hwJJmfSJFdb3on+/jTrWCXV9RYYzls3NygrJ0cy4BQUcT
	fPbzKxtmjeMAkXbSR2QJARsmqCzrBlHpU=
X-Google-Smtp-Source: AGHT+IFTDygqebxFrfLhPNX+H4Kgt8uWXhKH50xWzqmnoJDcPg0UVlggjxomSWbuTCti64Fu8NXM5RNuQ470N3l+oyw=
X-Received: by 2002:a05:6e02:1fc6:b0:3d9:39f3:f250 with SMTP id
 e9e14a558f8ab-3db6f794c00mr72097505ab.3.1747287646677; Wed, 14 May 2025
 22:40:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com>
 <CAAhSdy2LbLwRxuFVtMrrcTTD5NCxVCGLy4o=ZUowxT_9DXGqBA@mail.gmail.com> <CAHBxVyHXJYDWbfY7FAEBB0S0ZG2+ka6KpWpd7+NO9jhApxav5g@mail.gmail.com>
In-Reply-To: <CAHBxVyHXJYDWbfY7FAEBB0S0ZG2+ka6KpWpd7+NO9jhApxav5g@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 15 May 2025 11:10:34 +0530
X-Gm-Features: AX0GCFvhFxNwn3sOoUM6uFOgfx0BZ3COs0Idy6xZaupJBYExW9VxrohdUkojQQE
Message-ID: <CAAhSdy2DG0y3r8T=AqJ-T7+VaVcVpY0pSRZDptfYwwknshB+zg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Disable instret/cycle for VU mode by default
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 2:31=E2=80=AFAM Atish Kumar Patra <atishp@rivosinc.=
com> wrote:
>
> On Wed, May 14, 2025 at 3:55=E2=80=AFAM Anup Patel <anup@brainfault.org> =
wrote:
> >
> > On Wed, May 14, 2025 at 12:13=E2=80=AFPM Atish Patra <atishp@rivosinc.c=
om> wrote:
> > >
> > > The KVM virtualizes PMU in RISC-V and disables all counter access exc=
ept
> > > TM bit by default vi hstateen CSR. There is no benefit in enabling CY=
/TM
> > > bits in scounteren for the guest user space as it can't be run withou=
t
> > > hcounteren anyways.
> > >
> > > Allow only TM bit which matches the hcounteren default setting.
> > >
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > ---
> > >  arch/riscv/kvm/vcpu.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > > index 60d684c76c58..873593bfe610 100644
> > > --- a/arch/riscv/kvm/vcpu.c
> > > +++ b/arch/riscv/kvm/vcpu.c
> > > @@ -146,8 +146,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
> > >         if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
> > >                 return -ENOMEM;
> > >
> > > -       /* By default, make CY, TM, and IR counters accessible in VU =
mode */
> > > -       reset_csr->scounteren =3D 0x7;
> > > +       /* By default, only TM should be accessible in VU mode */
> > > +       reset_csr->scounteren =3D 0x2;
> >
> > Let's remove this as well because the Linux SBI PMU driver
> > does initialize scounteren correctly.
> >
>
> But other guests may not. I thought time should be a basic one that
> should be allowed by default.
>

There is no specification (SBI or Priv spec) which mandates M-mode
or HS-mode to setup S-mode CSRs. Setting scounteren bits (including
TM bit) has always been a HACK or work-around.

It is better to remove scounteren initialization HACK from KVM RISC-V
before more supervisor software starts depending on it.

Regards,
Anup
