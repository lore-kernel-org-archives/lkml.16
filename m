Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3670127738
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 16:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750004861; cv=none; b=aPM4qmgAZd1PpdaHV+1Lqljz3tl8JHxRmj0kzTDSuMYg01yRIif+7AK44+/wF1XBn6Fn1im0vnn3F5qSBQGahgbxhNTQFqHq7GEDEmfZwGev4WhoHLtssmAvadjnKOFbILmMoZ2t+INK8BatInj9Sl9bMEf2KnNgvZ3TpfIhXuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750004861; c=relaxed/simple;
	bh=FhQ2KwCpDcyr2doHFgfXzyuHVXMICCxUjWQ+x8Rm/To=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgo5yLxR6NlAZbI9RPE9o9FHfmB7Z3FY0rQq9DoYC/QbrgW2LcUcpWb9/htfXPawuTDadUWaWyJXQ5V+UZiWna2kcaOJ/VIAqwNPx+BoSrVb6tMM6J5ELmRJ7DEI4wViUhjQh40vgbl2URR69wWmlRxKexGWAB6iQvvTwx1jsis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=GsDK4g4p; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="GsDK4g4p"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b5165cf5so1886090e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 09:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750004856; x=1750609656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1cLVyVDfZ4m9C6IXP3marLwW8jsCdan5/7A3Ogl53Q=;
        b=GsDK4g4pLpyv17z1YvCdsMEqyRQ33MRupgQ5K2BNcNYNrFnbKAvImHtWRHsNjHo1vN
         TZBUpzZYs+lkrAunLZSJKtIP9WOKVs5W6GMAnN0TwLALiTXl+rqky/ZaJWCqEn7013Ix
         HJN7B/WkjvxH7ijyZsr4XMmOuHaUqhZ3ECK6a2PJghGZUl57AkifCMLpHJq8qIc6+ote
         AXwQrTzHhCMt9BGJZpG2So7yxiKl4NuFf7mS7AE+MqVDQIFHeTLAN1n4QoUM4sqwL3tZ
         IxZ3go0cE7JJ7zL5uZ9n+TVRAwmIm3Dv088G8j3rZFFIc5ImMCR0dOsqWz27VCSYnAsH
         sD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750004856; x=1750609656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1cLVyVDfZ4m9C6IXP3marLwW8jsCdan5/7A3Ogl53Q=;
        b=SJcWOeAB+QP7E16SjdI8slGgRutXK1OMHRcYA+1XU/aFuwzF0FaajPwUduIKD3JQPe
         jA+/AC4CrllcxQnYlz1SCgnGEWKhupZTCWbjVUyd8c6H/Ykfln5XemQQKwN0Oons+Cke
         yDwHhd9Z60Lo9EQxa7Tffr47RyxaL8QT6hrNHFkgVmYI5eJLnrsKSFwCkkC1gV+bpSy/
         q/Nkwz6RA0JS/eALh9xh6PaPpy6jWqi2nXUHpMYE+UinBuYQJ1qht4Y9tA1ZXurKLfG6
         s//ZxWnfW1V0pUYs0ziMppxe8I8ulEshffItKW4kBdNdCiudaLZEbf0IU2rn3JkttDbx
         wF5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQDthZx524HS853a3aryDpIernxTAj9upKcX6DWCiIHNxDrKs51wktNjVQSBxt1e6VZ0cqDT3WJu3gD6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuqD1mdB4sJD8VcxPBkAVaGib9dL/n+0WeZ3o9QIbB4wv2jbTc
	gj62xPTjpnzcysVTv2WMyYE05bxFSVHceSI2nxG37KXnSMUODN5DvaXVWDUNvwBR1LH1Nl6M3YA
	jjX/cHPomubnZ8M2F40nq99F707VuF+YCmth3Bwpucw==
X-Gm-Gg: ASbGncuW8SvNDSHoYqusSHlou7NklNwaSZRt6HMAGDDAAHAjU3Dl0wYPbp1ogmAbL4c
	54qW+rsfLnSFhe+aODskAKTpc7q7nTHbM9UwYJpglyvAtw0F52b2kIlBT+PHgTJSrah9NFC2Rku
	2uwWd0rRgsTIgbahvMRawc8wIUMqnPIXalqxfkbfArDsmX
X-Google-Smtp-Source: AGHT+IG27iDHVZA2qB3JCv0QAqHHgOhAq2gUOxPR4OwMF9vWoPTVi19GyHNwaRYEuHx4MPN8LUP2+ujKbsMT25Bm2I4=
X-Received: by 2002:a05:6512:4016:b0:553:5d00:be8e with SMTP id
 2adb3069b0e04-553b6f25f26mr1437671e87.37.1750004856092; Sun, 15 Jun 2025
 09:27:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
 <20250611-352bef23df9a4ec55fe5cb68@orel> <aEmsIOuz3bLwjBW_@google.com>
 <20250612-70c2e573983d05c4fbc41102@orel> <aEymPwNM59fafP04@google.com>
In-Reply-To: <aEymPwNM59fafP04@google.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 15 Jun 2025 21:57:24 +0530
X-Gm-Features: AX0GCFu98EH_tsj2wvdqU1Sm1PF-PzSfiINPrNNqzKKg_NIskTS5CgcjEFz6-RY
Message-ID: <CAK9=C2WFA+SDt4MCLj0reQnkkA2kxUmfWhT8HZxjT_DdW8W_rQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Avoid re-acquiring memslot in kvm_riscv_gstage_map()
To: Sean Christopherson <seanjc@google.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, zhouquan@iscas.ac.cn, anup@brainfault.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 14, 2025 at 3:59=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, Jun 12, 2025, Andrew Jones wrote:
> > On Wed, Jun 11, 2025 at 09:17:36AM -0700, Sean Christopherson wrote:
> > > Looks like y'all also have a bug where an -EEXIST will be returned to=
 userspace,
> > > and will generate what's probably a spurious kvm_err() message.
> >
> > On 32-bit riscv, due to losing the upper bits of the physical address? =
Or
> > is there yet another thing to fix?
>
> Another bug, I think.  gstage_set_pte() returns -EEXIST if a PTE exists, =
and I
> _assume_ that's supposed to be benign?  But this code returns it blindly:

gstage_set_pte() returns -EEXIST only when it was expecting a non-leaf
PTE at a particular level but got a leaf PTE otherwise it returns 0 if leaf=
 PTE
is at expected level. This allows gstage_set_pte() to work when an existing
PTE is being modified. I think the below change is not needed unless I am
totally missing something.

>
>         if (writable) {
>                 mark_page_dirty(kvm, gfn);
>                 ret =3D gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHI=
FT,
>                                       vma_pagesize, false, true);
>         } else {
>                 ret =3D gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHI=
FT,
>                                       vma_pagesize, true, true);
>         }
>
>         if (ret)
>                 kvm_err("Failed to map in G-stage\n");
>
> out_unlock:
>         kvm_release_faultin_page(kvm, page, ret && ret !=3D -EEXIST, writ=
able);
>         spin_unlock(&kvm->mmu_lock);
>         return ret;
>
> and gstage_page_fault() forwards negative return codes:
>
>         ret =3D kvm_riscv_gstage_map(vcpu, memslot, fault_addr, hva,
>                 (trap->scause =3D=3D EXC_STORE_GUEST_PAGE_FAULT) ? true :=
 false);
>         if (ret < 0)
>                 return ret;
>
> and so eventually -EEXIST will propagate to userspace.
>
> I haven't looked too closely at the RISC-V MMU, but I would be surprised =
if
> encountering what ends up being a spurious fault is completely impossible=
.
>
> > The diff looks good to me, should I test and post it for you?
>
> If you test it, I'll happily write changelogs and post patches.
>

Regards,
Anup
