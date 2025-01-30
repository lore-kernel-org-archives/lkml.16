Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E58C1E376C
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 19:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738266317; cv=none; b=nW1gdkRDyN6/IBBHIyFhpRKO6Qm3tWVNlO57NDg80zKh/Boh60SGo6zEmu+aId20h327VzeJLS+x2N7mQi77UNwWit7x2apzHGV9Z/HVeNMNrlzfgzTaB+2Z5zZtT7++/irkCSPol+dNwsLqeeuFTVWLsWvhCaW6nZoTk1ZSD/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738266317; c=relaxed/simple;
	bh=9fbyLsH88G6tyoNdu7/EPSxn8u+wW28k1RNwWOmH2mQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n82MfO1SBtFKqxSpdzNDeG8sldP0dvIYHNcNRo1+r+3MV5e88QswRPVmMwnbU/VAUpwXrbym8XdMpnD52xfLXAodOuMRcFtLG+5SrNgJZQV7wpBHEY3vh9kZeZh7+x2cKmawMbGCZN69B/PCENbarvngV8vxBzeXu3RxT06kwRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eNseV6t1; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eNseV6t1"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e44a42512so1012e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738266313; x=1738871113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPqRKKVz/y2KC5CJ8jv2zxFft8RZ+YOxuhSdEo17vUE=;
        b=eNseV6t1d7W4rXL22Rh5mzaI651WV7rprPcZhpDFjMt82V89FJKynBhH6rvhUruWaY
         DVWulus1vlg7n9O2NMBxLQglZGPo97ebqr9j6pTNJ0Os45TF2xhVSUnwyWRTOSQw/SVE
         KIBNPbY0/1AzMT8zv/26z89U0x4TbugqT7eqZ9XpvHaYfTveL1H1OL3EpmuUz2nQZoAp
         XXugd+ZpYkNcDWq6E6mz9HyUUepahdSedckpmF1K+PaVFG/1bqGJ1YVDuVGE+kTjTJ88
         967sDiuN6OuoJCNy19WLghl/FVF/YmFUXJFUId28hOZwDXoUM+3NMOmg5QVUVNFxvxK0
         CBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738266313; x=1738871113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPqRKKVz/y2KC5CJ8jv2zxFft8RZ+YOxuhSdEo17vUE=;
        b=Q8rDnMOCi/U2fTmyJ91Oljmvft+EKDJLEVt9OIk9Kj1gFQmYCocwqsx8umwkZaO/vu
         1xRZuLioITu7CrnVJntjKqcdiGjzwIGvfmM+57mvM4c13TP+1LcvHr7HC4jHXRr3/b3B
         xp8v2hGUp82HqAndrnx7nwWZu2WkOmHRHoON9Rl92L1x0VvMCE1g6UyNK1RwvT/WOyjq
         +c0H94diutaOaQJtlV9yahNuRlmWS67XkjxaEq2IXFqmBEgjdURKG8A8TOpe2kSbwOAH
         h2Cmg0RXOvL4DrpSXKo77Li62iW1X/gNsy58h0RVgAoz0wasijRWIuRiS4qwqdlImq0I
         u8AA==
X-Forwarded-Encrypted: i=1; AJvYcCWvgwI1sX6ick7RzZQSypARb367aRrBP82f5DdnUseVd0aKwDHKHKltdqwtGZpPZn7lRFxwtyrklBN3QuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxItXgkpIZapRe7Bn8e4FXjMLuzM614672XyRHWg4kJfLTZKlXg
	Yf28f95bCkKIWlBSRGhfg0DhZIibEe15jpvoRW1vgyMEk+rZoRi/6lQBog+WIo1KxIj1ioUrRXA
	6cQbTIz3ggsGJh5i5KnaOW3yeOoh8zjpztBLa
X-Gm-Gg: ASbGncthDdCgB4/2fLu4ua1vae0GjKfS5295UVZlPLaT9sYVmtZJIhyZ+W/snOEVGUT
	CwVUF4D7cjQ05uly3j5Y1Kika6KozYlySgjbV17NlLO4D+XMPxbYSYL2l768sKeVOEdaVaafRQJ
	Ga5Pw8sZoM32TMojp2qsZFsVc=
X-Google-Smtp-Source: AGHT+IGBvwWSv1IiLAFKoJbSGBLJk+W5yCPPaqTr3SntN2b5XHQRP2haPQPs+ZrJJmWM2zhJ+gtyW2WGNQ4WHrBS1Pg=
X-Received: by 2002:a05:6512:33d6:b0:543:e496:81d2 with SMTP id
 2adb3069b0e04-543f1c0ce53mr24953e87.4.1738266312941; Thu, 30 Jan 2025
 11:45:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129232525.3519586-1-vannapurve@google.com>
 <p6sbwtdmvwcbr55a4fmiirabkvp3f542nawdgxoyq22cdhnu33@ffbmyh2zuj2z>
 <CAGtprH8pJ3Zj_umygzxp8=4sJTdwY5v2bFDhoBdX=-3KQaDnCw@mail.gmail.com> <wmdg54v56uizuifhaufllnjtecmvhllv35jyrvdilf4ty4pfs5@y4zppjm2sthr>
In-Reply-To: <wmdg54v56uizuifhaufllnjtecmvhllv35jyrvdilf4ty4pfs5@y4zppjm2sthr>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 30 Jan 2025 11:45:01 -0800
X-Gm-Features: AWEUYZmdkF4eXD8cW9j3g94r1RQgW0GcoVRfXjOD-b2Tcyejz6I5I8r9tUSmJdw
Message-ID: <CAGtprH82OjizyORJ91d6f6VAn_E9LY7WptN-DsoxwLT4VwOccg@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt()
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, erdemaktas@google.com, ackerleytng@google.com, 
	jxgao@google.com, sagis@google.com, oupton@google.com, pgonda@google.com, 
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 10:48=E2=80=AFAM Kirill A. Shutemov
<kirill@shutemov.name> wrote:
> ...
> > >
> > > I think it is worth to putting this into a separate patch and not
> > > backport. The rest of the patch is bugfix and this doesn't belong.
> > >
> > > Otherwise, looks good to me:
> > >
> > > Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>@lin=
ux.intel.com>
> > >
> > > --
> > >   Kiryl Shutsemau / Kirill A. Shutemov
> >
> > Thanks Kirill for the review.
> >
> > Thinking more about this fix, now I am wondering why the efforts [1]
> > to move halt/safe_halt under CONFIG_PARAVIRT were abandoned. Currently
> > proposed fix is incomplete as it would not handle scenarios where
> > CONFIG_PARAVIRT_XXL is disabled. I am tilting towards reviving [1] and
> > requiring CONFIG_PARAVIRT for TDX VMs. WDYT?
> >
> > [1] https://lore.kernel.org/lkml/20210517235008.257241-1-sathyanarayana=
n.kuppuswamy@linux.intel.com/
>
> Many people dislike paravirt callbacks. We tried to avoid relying on them
> for core TDX enabling.
>
> Can you explain the issue you see with CONFIG_PARAVIRT_XXL being disabled=
?
> I don't think I follow.

Relevant callers of *_safe_halt() are:
1) kvm_wait() -> safe_halt() -> raw_safe_halt() -> arch_safe_halt()
2) acpi_safe_halt() -> safe_halt() -> raw_safe_halt() -> arch_safe_halt()

arch_safe_halt() can get routed to native_safe_halt if
CONFIG_PARAVIRT_XXL is disabled and will use "sti; hlt" combination
which is unsafe for TDX VMs as of now.

Either patch suggested by Sean [1] earlier or the implementation [2]
to implement safe_halt always for TDX VMs seem functionally more
correct to me. [2] being better where it avoids #VEs altogether. I
haven't come across configurations where CONFIG_PARAVIRT_XXL is
disabled but I don't see any guarantees around keeping it enabled for
TDX VMs.

[1] https://lore.kernel.org/lkml/Z5l6L3Hen9_Y3SGC@google.com/
[2] https://lore.kernel.org/lkml/20210517235008.257241-1-sathyanarayanan.ku=
ppuswamy@linux.intel.com/

>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov
