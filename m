Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991D824167E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750316710; cv=none; b=aAQ946MmH7AhET89Mp/cxcFwhwYAagVh4gAyQIA1SnGGBeLm2l/YGFP+hu1jvi2tCRLMncg/lVAPIwhLP5tfTq8ZaBslrY8p80jf9Fq9KBVidfmZgvuxVKTPVgH9Bry98/TzO/DVGltLX/MM5agkHCgm+9+vfkA1zwPp6LUNSDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750316710; c=relaxed/simple;
	bh=fME0ge1Rwj/DFc67JhLE4Xn0HVSWzZ2jccbWy/WLkv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/+4qNimpfE86pIq5HFiPnodRFdRA7VLpq6taW4Xr5qTRST6/jXhHKq/oWjUUyN7wCN0+RcMHoUVFGgp8GAQ9NioSwRfxxI4u71M7drZsewZ4UmJdff5BfsU4uBdD2hcg/uHu9VkM1iy2/16oWQstFPt0bj3YimVh8P1B8yWwYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=IZYk0F8B; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="IZYk0F8B"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3de00ea2a57so4474385ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750316708; x=1750921508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GslG2eeDA0pr4FM9S7GNW7fv8EFyfyljbaLO6KBfzyY=;
        b=IZYk0F8BODfjPSpJNjyXhlhiIh3rjT859AtMmLRTTFpPWOqqBiItKcp/XHReqDtaBH
         PUGFAApqneMsD1mGaezg6ZonU+L4Zoa9fPhGv9TrIXf7ZoVyceD0vFsAIquz+KUDvLZa
         CSqbxOnuV+LOg2iBM2gWP0/ErL91AkTMXy76K4Wn+hi+S10Uw3qqsqy+tuZ5r12gyMtJ
         AB3FnwBxvTishzBuuFLRBBW5qaswKwR7DBV4wa5W2De9w8rwZQ9ixMp6+saXzW/By7Hf
         nvrfDW24zEr1X5rUo18X+x57PljMYNoayrujfS/n0TX6Y5PMjpJZVAb+PE0KEi8PMMxK
         m8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750316708; x=1750921508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GslG2eeDA0pr4FM9S7GNW7fv8EFyfyljbaLO6KBfzyY=;
        b=gOEr0Ktbayv032bP/ib9mKerpnWW0Gc+oaPWg9fnhaRbT0tgy/ZQ+FaK8HcfH0ibIP
         JMvqz2VirGLjc6V2/sjRK8w5dLJP8/jrSBBOiAVbVkfgnCwxnXmDkuQJcEIeQFmA04Xu
         xmGjFSjler3wpenoMv475uahxitoVuiO/z8t57QWRuvBUfWiYkaZo8iX9lhWpMeIv7rV
         BbeAuRmKH4EHJkDMEYTKL759dkVLFKjhorlkFT0Hm4L1mgewd4Ir0yEeAaY5YSBrH0CA
         vQJlYFiXQeOghEemygf4PmPeGLm0MTwr7BjDOcLybrchp+Un1Kw0CjXqlyglD1aRasoY
         Uepg==
X-Forwarded-Encrypted: i=1; AJvYcCW1e/h1QeyroGZoYvnnAqnOGrGD5ZO1qw3ywVnbocFKIKaPWg2hKmsJXD8or9zCYNVyJYKStoZ+05CzSxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3hVBREC3hWKI+fbYHjQzzLIFMDjbDK/64xF+74Vn5MMFZS/pL
	+DntrgZa6SYq4ImW8eiRT/RmSdhv+A9x7iXN2ljDy8Dm9qryQ5BDGfPPgDz8JR/ppl6JmRJZ14P
	1zeJRTxKlIJBI4TrrWG7vfTh12we3pFo04i5mdvJf5A==
X-Gm-Gg: ASbGncvdIn96dJeM8mvYd2TjyWKR44IqQrCf+R87gIq8+JRZ0+2ZRdaTAMYnibYSv0K
	kdWGAGYb82a8Mh3s1KGA0Aqi4EL/lViouhMxmWZnWTKJTeG92FgHQxdNqkGOoOQq7nk9NC3IsTV
	qx7gQYIJdBRE9LbM7Z0OgQR82WIexpGMz7AQP8AiWMrQ==
X-Google-Smtp-Source: AGHT+IFesrnCeqwqKIL68SxUVLD3mgj0qtgD/fpzVKFlJEEMOp1WCDEd2Y5QAaT59CMI7JPaPJsZyFfBy+1dxA4BYlo=
X-Received: by 2002:a05:6e02:1486:b0:3d9:668c:a702 with SMTP id
 e9e14a558f8ab-3de07c55d0amr214853945ab.9.1750316707660; Thu, 19 Jun 2025
 00:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
 <20250611-352bef23df9a4ec55fe5cb68@orel> <aEmsIOuz3bLwjBW_@google.com>
 <20250612-70c2e573983d05c4fbc41102@orel> <aEymPwNM59fafP04@google.com>
 <CAK9=C2WFA+SDt4MCLj0reQnkkA2kxUmfWhT8HZxjT_DdW8W_rQ@mail.gmail.com> <aFF9ZqbvZZtbUnGt@google.com>
In-Reply-To: <aFF9ZqbvZZtbUnGt@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Jun 2025 12:34:54 +0530
X-Gm-Features: AX0GCFswxnEUivmEVLx0LQAT3Sm2nYe0XKx0hCNHOivGswdHqLkLlXYjQJo09L4
Message-ID: <CAAhSdy26LC0xWisbxx+10mTe=D6cXcePtH8t6=TkzMYso7+jUQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Avoid re-acquiring memslot in kvm_riscv_gstage_map()
To: Sean Christopherson <seanjc@google.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	zhouquan@iscas.ac.cn, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 8:06=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Sun, Jun 15, 2025, Anup Patel wrote:
> > On Sat, Jun 14, 2025 at 3:59=E2=80=AFAM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > On Thu, Jun 12, 2025, Andrew Jones wrote:
> > > > On Wed, Jun 11, 2025 at 09:17:36AM -0700, Sean Christopherson wrote=
:
> > > > > Looks like y'all also have a bug where an -EEXIST will be returne=
d to userspace,
> > > > > and will generate what's probably a spurious kvm_err() message.
> > > >
> > > > On 32-bit riscv, due to losing the upper bits of the physical addre=
ss? Or
> > > > is there yet another thing to fix?
> > >
> > > Another bug, I think.  gstage_set_pte() returns -EEXIST if a PTE exis=
ts, and I
> > > _assume_ that's supposed to be benign?  But this code returns it blin=
dly:
> >
> > gstage_set_pte() returns -EEXIST only when it was expecting a non-leaf
> > PTE at a particular level but got a leaf PTE
>
> Right, but isn't returning -EEXIST all the way to userspace undesirable b=
ehavior?
>
> E.g. in this sequence, KVM will return -EEXIST and incorrectly terminate =
the VM
> (assuming the VMM doesn't miraculously recover somehow):
>
>  1. Back the VM with HugeTLBFS
>  2. Fault-in memory, i.e. create hugepage mappings
>  3. Enable KVM_MEM_LOG_DIRTY_PAGES
>  4. Write-protection fault, kvm_riscv_gstage_map() tries to create a writ=
able
>     non-huge mapping.
>  5. gstage_set_pte() encounters the huge leaf PTE before reaching the tar=
get
>     level, and returns -EEXIST.

The gstage_set_pte() does not fail in any of the above cases because the
desired page table "level" of the PTE is passed to gstage_set_pte() as
parameter. The -EEXIST failure is only when gstage_set_pte() sees an
existing leaf PTE at a level above the desired page table level which can
only occur if there is some BUG in KVM g-stage programming.

>
> AFAICT, gstage_wp_memory_region() doesn't split/shatter/demote hugepages,=
 it
> simply clears _PAGE_WRITE.
>
> It's entirely possible I'm missing something that makes the above scenari=
o
> impossible in practice, but at this point I'm genuinely curious :-)

The -EEXIST failure in gstage_set_pte() is very unlikely to happen but I se=
e
your point about unnecessarily exiting to user space since user space has
nothing to do with this failure.

I think it's better to WARN() and return 0 instead of returning -EEXIST.

Regards,
Anup
