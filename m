Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2443F24EA80
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680764; cv=none; b=exWRFZt3Gvo261RM1gYLfaQCk49nkzLLYOCJbHh2We976JDyvxDJSzF1xQjhJ16VX6nvJtHV1+4P54ELlJQvfI9jBhOjsosyYMPKaJ+odWsaG2nozkzyADIFkVtvbiKwLOKQ1CGHbppWJuORsq5WMfRoKL968s63FXslydJ3bUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680764; c=relaxed/simple;
	bh=f+PlxvlYNV73EmEGSpMuoIOzazgAgDQRPjz34OV9/Zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HzBHWbOJY+drURjED/2vmvur/oqmvUnD7F45+GCyGH121UpRhQQy3V/EUB8OwcxzC2T471qgEYsQU8Oh29Yy8ASngn6Wmsf/sb7p7pRm5w+cgAWGKZ93vsJ5xDFvBH97LlJ5tMr3+zi6xyftWVnNRHJ1I0+nbHuQgh0xj2v5pQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Cwfwesk8; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Cwfwesk8"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2360ff7ac1bso27355015ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750680762; x=1751285562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHyOQjUXQ/n7o6SDLI9e+lRQsNueNKsItK2jIA0gB9c=;
        b=Cwfwesk8mv4t1j5XCd3uAZavQoAy0tPVCrZkTk15k6GialZ3riFxEChFl15O3h+VP3
         CN7NOyWfb6h2Uf915hdu0RIkWDyHekYXargoEw3zjyMS63uriZU/SV/c5oJbSIP3i6Mt
         yPNXLmMsSj+SS1HkHIqmxZYggoLY8EMbeLlUEd/VPIih8hvbPfOiNakyG5+b0Wwe7tR8
         BgDkML5kPMns1boSTJgzocR1+38Fwu49+FAp9DRLdOMBPoxiv7IltMQth9chbBwpR/v6
         tmDAw6zSbWlnQMsffvExrnmcgsxV+ghwZScfeMmmDv3pDyAL9yGFfEC7o9gwaDxfVeC4
         Ktdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750680762; x=1751285562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHyOQjUXQ/n7o6SDLI9e+lRQsNueNKsItK2jIA0gB9c=;
        b=fF6JNurlEp/FtYAnwZhFstV1mhHTw8OKLX+NARMectWL19HCXieAEjTLYN6vfNB2Lh
         n6w2/lsLy3wsIrgx1lQKn1RSXaSh7FS0Er03xnpGigimaRoOsxCirjlCPr5eVTxj+mrA
         ooUtmfDb/9tw8ndDEX+B/KY9gKZDCo2hqad3um+/0BQpq7cONy6fxD9DBWvYNpRvrKHq
         pNJSd1mLcVvfAdwU3IbVnLnOIWCf3A/ursWDQXFHIsxev1eCFQ6qL9g6pOJe/K+f78KP
         WpdTjKvfh8aQInRTBLYjzqfL6TmIPpjNFPNWivD275CwgRgN3w+XaxmS5xf3Hrw+4uOk
         Ddcw==
X-Forwarded-Encrypted: i=1; AJvYcCVs8mViC/18DWaSDLA9i55pEcxOdSLrwGaTRmmN+ltjOCXmRZ8nW6zWB9iyfjx7fs+k5bFKCgzVvCVLQNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9S/Jn0yPi86H9E8mxS/A9XNMwRQ8aW4rcwjpvSQSPafs6StOh
	bhVh+i/ycQ2CUo4XSYnlQwmkQZTTh/awPSHw0agX0uoYfYjNhne9msSxJEck/k3s8YgBGVJoch/
	x8+P4QyW+YMt7K/lMrjhVvOXzFjOVjb1m8h3kpuMAiw==
X-Gm-Gg: ASbGnct45FkKaIPhULZMb1IJl7ToL2aVaeODdR7HTdlgCphemWO+/WB52zA+EQDjeeQ
	2t5Fp3Z0O6eWHOAeBQ7FZbUUJRsGxETdQBPwmX+YVnobKLFmFsKOgOAgYUu1gsMbxsEGk131HVG
	7hOBm30YeymRUETLgeqETHPFmBIfh1UvMSUnVbGraJuyDfEPz5MbK5gADLrtXUQsUKAGk=
X-Google-Smtp-Source: AGHT+IG6HZ/8Fi0eQ+rXE+47WUzLt+zmbjPe+C1XDxRfNdt32Ri4/qwaBYXVXZGqFfIan5V1AhcN8nK7xhtxwnbINxY=
X-Received: by 2002:a17:90b:2dd0:b0:311:9c1f:8522 with SMTP id
 98e67ed59e1d1-3159d6466bfmr19690671a91.10.1750680762455; Mon, 23 Jun 2025
 05:12:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com> <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
In-Reply-To: <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 23 Jun 2025 20:12:31 +0800
X-Gm-Features: AX0GCFtYKxGqlHuJJ47JAXMxUFhLXnT6cZnnppHiAtMF1rC-04ON37kUhYiGk7I
Message-ID: <CAPYmKFs7tmMg4VQX=5YFhSzDGxodiBxv+v1SoqwTHvE1Khsr_A@mail.gmail.com>
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

On Mon, Jun 23, 2025 at 4:05=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
>
>
> On 20/06/2025 14:04, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
> > 2025-06-20T17:17:20+08:00, Xu Lu <luxu.kernel@bytedance.com>:
> >> Delegate illegal instruction fault to VS mode in default to avoid such
> >> exceptions being trapped to HS and redirected back to VS.
> >>
> >> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> >> ---
> >> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/as=
m/kvm_host.h
> >> @@ -48,6 +48,7 @@
> >> +                                     BIT(EXC_INST_ILLEGAL)    | \
> >
> > You should also remove the dead code in kvm_riscv_vcpu_exit.
> >
> > And why not delegate the others as well?
> > (EXC_LOAD_MISALIGNED, EXC_STORE_MISALIGNED, EXC_LOAD_ACCESS,
> >  EXC_STORE_ACCESS, and EXC_INST_ACCESS.)
>
> Currently, OpenSBI does not delegate misaligned exception by default and
> handles misaligned access by itself, this is (partially) why we added
> the FWFT SBI extension to request such delegation. Since some supervisor
> software expect that default, they do not have code to handle misaligned
> accesses emulation. So they should not be delegated by default.

It doesn't matter whether these exceptions are delegated in medeleg.
KVM in HS-mode does not handle illegal instruction or misaligned
access and only redirects them back to VS-mode. Delegating such
exceptions in hedeleg helps save CPU usage even when they are not
delegated in medeleg: opensbi will check whether these exceptions are
delegated to VS-mode and redirect them to VS-mode if possible. There
seems to be no conflicts with SSE implementation. Please correct me if
I missed anything.

Best Regards,
Xu Lu

>
> Thanks,
>
> Cl=C3=A9ment
>
> >
> > Thanks.
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
