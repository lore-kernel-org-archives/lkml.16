Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC600221F25
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747256521; cv=none; b=XjVWYjtqgO4juz5KZ3IPnwN4yyFF3rxYRc6I1COcsoCOjSBCnyLFtRG+PdEaYKca+//sls5A/JREvx14KTSio1hGiLV3p2wWdDoo2bBNj8+4dUtsIWDrn3RT/Vu4z2Tsum+Y6zQukzIFqqhb3CZNScVuy4s7b6oDSXjVWPqu440=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747256521; c=relaxed/simple;
	bh=7kRcjXDfm6wDX6rNHVswCUa2HG4onyXmUA2idPVePyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BoeyeYKpUI4ri6o+EJMC8cxy638dLnY6YJlsKd3wrCCep4HUM/oiPYGCP6/oVHLNyFO0PQthCH/inSuO8nlBdSc1jQ6cxKfqiOeakC9svuJZf/fPIIIyOGdbBkj4/FaBKKFknUko+Hm1xoonPf/4x345Cyv/jadLC00h9qfE060=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=B/v93FmO; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="B/v93FmO"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30ab344a1d8so313085a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747256518; x=1747861318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqchgTdHTyjs5ScPdT62o65cQnPzkkTwJlrZ4hmq6Bs=;
        b=B/v93FmOZ4UnaCNzaDcbFQ5RnL5kfMIR4raNCX6fpJoN1/4d/Ye7H+9rUabfVIQQVp
         7E+eCb/cLF6HoTiMHzJLoWtk219KpbBBo3LhEAVs1F4P0Ka8PmZcrDXCuVC9b73fN+BO
         9WbhgC8XyKY4ur3jPtOvmyPBf4l5vmQCGHgWqPlpznaf2VqUBp2nldLmUcsnHYrqdUv9
         66hTcV1PWD215Yulzf+UAzxRIjEfiSSBer4+fBAWPuEe0QujukgrzbSldki5FVldizpA
         D9Uc4PsTBFDK/sG0qboYO++v/OteaLJZ5xWrwno9Z8Grji1n1GmcTGkiZ2eN0/1dxzxi
         yDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747256518; x=1747861318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqchgTdHTyjs5ScPdT62o65cQnPzkkTwJlrZ4hmq6Bs=;
        b=EPKgpi5CP6cz8T485x39yrzAUqmq81KGvQyzFEJAG0WxlGlYttXb48rVrtou4qWPME
         CtLs0LhO8TVleGg9+1MWWGmyGKhdG6XEt0v3/kcbu2TMSzcYdh6KmyGFD9aTNx9axRPA
         OrVb+Dq3BJFgJXpjhnK+U49oLrQmnT5fIDtZqQo8OnYSp4MCkfySXNHEnqecSgNbQ31d
         3ehEqM7r666K7fLE9qzFdXNeBCURi1aRuPAghyyXqEySh1fMyvng0JsAW3hFifkgGqHg
         z16OEadLddncOs+qYYOFwpzsD0i++arUYFpXlhuWlcOUZqmConNVcwXDJV+SnOI04U+W
         qu+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVk5PpZmmwMScrMAlYii4ezDiO8mOE+T1Ae4SueY9/H8FNiudRnHqLpuvERMt4KgokEKIPbCfNn29yUS00=@vger.kernel.org
X-Gm-Message-State: AOJu0YzayMiERpJD4y0VzDXdObturs6Bc0fBiJ55TJ+sjQGYznlOE2wD
	a7Vi0QGbvOziqWDWBU4zRSrLuW5KcOd2mWXxGaQw2MC3NGwSapr3hsV9hr+TECtE2hdDfgJb+k0
	iLAcmMveqHmeJVAMgOkH1K9c5iwnhL3xmjMFl7w==
X-Gm-Gg: ASbGncu7XQv0/QaGM2cKfyunGMkx420rizU/39P3MudjwJ6WKgjxdoDhejbrjt21Cmn
	F03WFi96dQ2mDs6lJ7rse3cwrCRgR9rDQdOUV2BvoFTmZSYCH9xOq2aOmUSEIKQiYXl2E6bwxs5
	f2Q8dq98UQdatJHcTiCVNIx6OmbsYga5M=
X-Google-Smtp-Source: AGHT+IGYtWvln6Vge4DD/b8/a37hqJvAAC7E46KvEmNXhfMJrQcWms3WMqWIhs4CNOJ5GERxgioGT+LfF4aLuzg8mgI=
X-Received: by 2002:a17:90a:d2d0:b0:2ee:f550:3848 with SMTP id
 98e67ed59e1d1-30e2e583ee6mr7135070a91.5.1747256518169; Wed, 14 May 2025
 14:01:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com> <CAAhSdy2LbLwRxuFVtMrrcTTD5NCxVCGLy4o=ZUowxT_9DXGqBA@mail.gmail.com>
In-Reply-To: <CAAhSdy2LbLwRxuFVtMrrcTTD5NCxVCGLy4o=ZUowxT_9DXGqBA@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 14 May 2025 14:01:46 -0700
X-Gm-Features: AX0GCFuPU3_CZzMOt6Sp9bohA_uEiLWy733kJmW5xL5q5LKhEWdxzONolY_B8xQ
Message-ID: <CAHBxVyHXJYDWbfY7FAEBB0S0ZG2+ka6KpWpd7+NO9jhApxav5g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Disable instret/cycle for VU mode by default
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 3:55=E2=80=AFAM Anup Patel <anup@brainfault.org> wr=
ote:
>
> On Wed, May 14, 2025 at 12:13=E2=80=AFPM Atish Patra <atishp@rivosinc.com=
> wrote:
> >
> > The KVM virtualizes PMU in RISC-V and disables all counter access excep=
t
> > TM bit by default vi hstateen CSR. There is no benefit in enabling CY/T=
M
> > bits in scounteren for the guest user space as it can't be run without
> > hcounteren anyways.
> >
> > Allow only TM bit which matches the hcounteren default setting.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/kvm/vcpu.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index 60d684c76c58..873593bfe610 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -146,8 +146,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
> >         if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
> >                 return -ENOMEM;
> >
> > -       /* By default, make CY, TM, and IR counters accessible in VU mo=
de */
> > -       reset_csr->scounteren =3D 0x7;
> > +       /* By default, only TM should be accessible in VU mode */
> > +       reset_csr->scounteren =3D 0x2;
>
> Let's remove this as well because the Linux SBI PMU driver
> does initialize scounteren correctly.
>

But other guests may not. I thought time should be a basic one that
should be allowed by default.

>
> Regards,
> Anup
