Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52341F19A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 05:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749445314; cv=none; b=L+r/N1vk5mK4+93Ac/1JLXLkvfUB3ukPNvnp0xweWCFwdbx+2E7MAc5WszYrBW3BnRZsOgwWm5faIdLsp6bZ7buCvN9nYcLDp7koHore+YU6gzm47DBKKwgsSuNQ2EEsnmIuGJET+HYJE3VsTfa0RZJxyv1yCpqtkTG57ROiNYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749445314; c=relaxed/simple;
	bh=Zj8k3HkK/FoiffBM5h35ABkSn0Y9vTnhX20e6BB/zfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+581Z+GGBQr6ktNeMrdKu83jqibBL/S18tVhk3OoXNCQRXu6ymnqWcQ8sgHC2Imhv1z9rFbnLB4aac2dtSeT09zU38jlbLELoIbzbbSImz00auT2YgEnMp8dLrvMHJGkTfBo0Zhstj9RVSLqPZaZ7Hbq5K+sk2B0fFn+hQXw4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=KtCdTPJH; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="KtCdTPJH"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5532f9ac219so4579726e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 22:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749445311; x=1750050111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOMcjGbCg5jsFQHyOHp8QkLmffXsMI4hIXBXUWTyrTY=;
        b=KtCdTPJHw0HsawP3alP5azgcaH0f34affEbRzmVURFnlYIUWz6jOyK6Tc0RNyFMbdb
         M9vc22x/Ra/WxSpzVoE5AHuYFM7RR7/qbgbMCnQ3wpp6NjbN3VGUCif7CshCRN34159y
         fvj8qNQZCiXvk/Bibk403mLVuPoo3Hrfukvkl0zoKHtuQe2tUYJ6GWzwykK6oEicqnSb
         aFv9Eh1V3j0ckA66dsztVKX1i30fNe7P6bk485wJCLi0+3WeougZvVfMBZA8NV8RXvU2
         oXC+cb6+vM+DMi9Ksua3pSexyM7adtFeJe6YAaMU1mgXxCkUpUiYrC+C1lYyNWTa6o24
         wvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749445311; x=1750050111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOMcjGbCg5jsFQHyOHp8QkLmffXsMI4hIXBXUWTyrTY=;
        b=sbeVle+Nj95QXNaBKAIvdoDC9ETBR2aIpFfyFBULuN/VTE69wcc3OwGOhuluuzv5M9
         xT2jQv6dPFplJ5mpjZlmKEI6oejVL1UybMAhL5aXVwL8GNaQhZZkynMjTGM2eWj4ewKA
         /SQd4Wwz7h2xnem7MPH4jz8j7fZVf5abDKROqbFBGaqW3YBdFNCiKcKThyS4n6dfcxIK
         W51Abib7tE23HOxPA5I34mw/poFtpLab02qeDNJMNApGMIuDULrn1ueucmz6I2iA+6et
         vCgX0j1qaSMY4sUs6+rGhh160K4nlbsmbSA+xFa29a8vKFfk0bbmCvQOYOd+AClYcCUJ
         WRPw==
X-Forwarded-Encrypted: i=1; AJvYcCUFLDECnPz3iKspLnagAHoM0q+IYjGrPE+hZBvex7lQvxHb+EM9BGBVO2R5PVA4f4ltkFINIY19oqiEYp0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0YpGZYAtKlXjqfytmnyQD2niDl7s1t8S4m6Ea742p6HPnQysK
	xuNF2VTvaQ7p9p4dTvuQxeDmjRohQ13C+ybQBTvl0e8lfaIgIgyyMYwKv7liF1jpQwNrJr+Iiw+
	bFFhzCO23LO+6blRY3mHcDvDDNnisVKzDlp/XoiYnHg==
X-Gm-Gg: ASbGnctx1IiHSi9UZ0gqjtTzn2SwpM3XUhIQjkMsgIcaa0jSKSBVncx5fca1ZxpBfFo
	on/DGXygi82XkorF03MAiiDb2L3w2z/NiV0Z1Szw4XeZh6Z7bdZ4FCuEEyOmLxLtTDU9qeJT01S
	NTyRI4JLm/kbvzxyFeL8FSimWqipw+/wWS7g==
X-Google-Smtp-Source: AGHT+IGNoFMBVcIkhkWIxs1T6dpBKHVyU1+GA9Sn2XOqGmubTKzpGdkqTqGYa5lWFnUt1IGgZ9ywL6/bb9mRRWona4Q=
X-Received: by 2002:a05:6512:b96:b0:553:2e37:6952 with SMTP id
 2adb3069b0e04-55366c35b56mr2725861e87.55.1749445310725; Sun, 08 Jun 2025
 22:01:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605061458.196003-1-apatel@ventanamicro.com>
 <20250605061458.196003-4-apatel@ventanamicro.com> <ed5276d8-5169-47fc-bef2-bde7b8979e7e@linux.dev>
In-Reply-To: <ed5276d8-5169-47fc-bef2-bde7b8979e7e@linux.dev>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Jun 2025 10:31:38 +0530
X-Gm-Features: AX0GCFu6khb6JAs3hfg5t5-XeCYErlLBCVttXYRvddGA_uZhl6kG6tBxdop0a2o
Message-ID: <CAK9=C2WWtOdG9aYhmrTnDNoV9f0VBYUENJ8utKd=4G9-1SyzdQ@mail.gmail.com>
Subject: Re: [PATCH 03/13] RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context()
 return value
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 5:46=E2=80=AFAM Atish Patra <atish.patra@linux.dev> =
wrote:
>
>
> On 6/4/25 11:14 PM, Anup Patel wrote:
> > The kvm_riscv_vcpu_alloc_vector_context() does return an error code
> > upon failure so don't ignore this in kvm_arch_vcpu_create().
>
> currently, kvm_riscv_vcpu_alloc_vector_context returns -ENOMEM only.
>
> Do you have some plans to return different errors in the future ?

Even if kvm_riscv_vcpu_alloc_vector_context() always returns -ENOMEM,
the caller should not assume anything about the return value.

>
> Otherwise, the code remains same before and after.
>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >   arch/riscv/kvm/vcpu.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index e0a01af426ff..6a1914b21ec3 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -148,8 +148,10 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
> >
> >       spin_lock_init(&vcpu->arch.reset_state.lock);
> >
> > -     if (kvm_riscv_vcpu_alloc_vector_context(vcpu))
> > -             return -ENOMEM;
> > +     /* Setup VCPU vector context */
> The function name is pretty self explanatory. So no need of this comment =
?

Yes, no need for this comment. I will drop it in the next revision.

> > +     rc =3D kvm_riscv_vcpu_alloc_vector_context(vcpu);
> > +     if (rc)
> > +             return rc;
> >
> >       /* Setup VCPU timer */
> >       kvm_riscv_vcpu_timer_init(vcpu);
>

Regards,
Anup
