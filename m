Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD56E2135A4
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746680546; cv=none; b=NOVmirLq+uJ35Ku1HIilrrJZJEWuXpergLi2fR5RZdqKELcm1AQUZMQQ6LE1RhQnehrKmIKtukB68Uvc/T2aGx1x1MNO7ibg52LLXTmbOI1WlbrxG41AHtv1GeoMDKcmu/kYBp6YvVIpmTeO+lqFl1Tt2kEUGx4rdlU8/hHwRnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746680546; c=relaxed/simple;
	bh=PBaYHCI3R5a14dKpofwQ0+w1aMgMX35JFi2xWoglqTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YrKXNjdxFOrb6C8vktvfhYOpbsMBThzbJfuUxkZ4VegiPebYpdaSs3yotolRrwwavvew+lZx1d25J9NiKZG/m5ewkLuT+twPkwBWO2Z+LfpGQgHPGmAoVO91aylFA4L+ESmTmyn2aatbmr3nrU/ROvafZhEud2fCrmti+LaEizw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=pHtgHv+w; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="pHtgHv+w"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d8fc9dbce4so6571165ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 22:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746680544; x=1747285344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4O7+nQ6u5XMVEZ9olWj3Ht9QPAgJnl5lq5fX/yAqRY=;
        b=pHtgHv+wd9g1qYZKWnLIu7gkjzwY8BrrEU/Su6AYG9MwLpFhkYPnICAYp0T/Yho4F2
         Lqa5ySPKFP/ezcGBayW5sWxic/4D3Bu4PTs6kv0wLz+zo5yRWdQoWBCYMIoztQFkWCFK
         G+ZwHkJUmJ2JcJF7QqrjNwBLeQwMHYc16fNq2ncqwyesUc2F9awjpcfxsp8nsDK12kzm
         YgSwB02N7/OS1nkpJjqgW8AdyDQyVOgAUKvM1eJ4xBsbPKqhQduexXyQqrktMM5Yz0C/
         3OKfH1IORKGdlHpJOROM8i6MxRDX6Vd9gmKh9HAmM+R/NGqYWtOAvyVJdDJ+m50ZmVLd
         61fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746680544; x=1747285344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4O7+nQ6u5XMVEZ9olWj3Ht9QPAgJnl5lq5fX/yAqRY=;
        b=r3Hax+U9k7Y4JlBD9l2uK6isiqcM3DrF5ZhzyBhKKLLF3oTnN/+Ocy3p+tjj2QOWnO
         C8q3h/YNFcjmgbLFKzpMi8BrMFjzrwbhXzEoAlbFncOCsgP9xl/2/1Yx7Is45BCGL0z0
         JM5/MinOKbn396Hmua3Qkt8VGSgO3AaYaHT95grmZs4rvpbFkF+wrmAp5BiJnpQ0gARw
         yxX7ppD5D9DFP1/iMyhatDuv30MbE9CNU1WMyV/W6eGePLV57rWDXRXLbm14pk6PAnmH
         Qgc1tnKjH6vHtF3tcntLKMKVVuFaBF2IfMbpqdndc86LyhWeWhtGtAyBtx8S1d3BC9ZS
         HXbA==
X-Forwarded-Encrypted: i=1; AJvYcCWGndN3bz6z6U2KuiTOBddR7Gzn+e5OQ7ywG2jyVJfVc6Q83DZXiaAv7jAp8MsqbwHEduC9QPXLnYhg4z4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgRKe4h7742vN0ihwgvRCIdewve1UtKqYeIymMkJEC4IYAIAfs
	ejhBY7GGF3CgGLwNsA3kCURdn+2zpcnhglIia81ylA26mUjYtgI1eCsaNQ3EvqaXhnhX5/H7w0W
	mFT+Nxi2N4Ya3i5dmkEXIzkuDYRhc1b1HqkNlLQ==
X-Gm-Gg: ASbGncvnK57YktN/TK1ca/l7zjiWPKQ+v55fjm1a+c7jr4h59+8VRhYciXFjem+273y
	SALCarKviUb6qhg1O98ZsSNqLhCxxhYPDR3yuUqtw0Bd1ji25+a0BUF0WXWHKrh9JYvDSJm1Jgo
	0fd8XB2s2P4XQea7R2pUMW
X-Google-Smtp-Source: AGHT+IECR9VWWp5sM9ekT0izdpJvnXGhLFrUYyeXvUgiyjcyi/z8ERS2MGNabEsCST5MXjtN+VKccxirLbFB93wPSAg=
X-Received: by 2002:a05:6e02:33a1:b0:3d2:af0b:6e2a with SMTP id
 e9e14a558f8ab-3da7854d904mr27339085ab.5.1746680543894; Wed, 07 May 2025
 22:02:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-5-rkrcmar@ventanamicro.com> <CAAhSdy0v7Cw+aGF8DDWh1gjTBXA23=H01KRK8R2LTQHLRHo5Kw@mail.gmail.com>
 <D9Q3TKPXTPMO.39LSPFEO587XO@ventanamicro.com>
In-Reply-To: <D9Q3TKPXTPMO.39LSPFEO587XO@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 8 May 2025 10:32:13 +0530
X-Gm-Features: ATxdqUHAtn3fdoGp6jzvIyBGtoq6BWz_b3EO39aBJbq4imtAWzXWd7ChbJprOwA
Message-ID: <CAAhSdy0tb5Su_4ydBx1eSt6_1PPpgt1gE=nx53mwum=5DPzMRw@mail.gmail.com>
Subject: Re: [PATCH 2/5] KVM: RISC-V: refactor sbi reset request
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 10:58=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcma=
r@ventanamicro.com> wrote:
>
> 2025-05-07T17:31:33+05:30, Anup Patel <anup@brainfault.org>:
> > On Thu, Apr 3, 2025 at 5:02=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkr=
cmar@ventanamicro.com> wrote:
> >> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/includ=
e/asm/kvm_vcpu_sbi.h
> >> @@ -55,6 +55,8 @@ void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcp=
u, struct kvm_run *run);
> >>  void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
> >>                                      struct kvm_run *run,
> >>                                      u32 type, u64 flags);
> >> +void kvm_riscv_vcpu_sbi_request_reset(struct kvm_vcpu *vcpu,
> >> +                                      unsigned long pc, unsigned long=
 a1);
> >
> > Use tabs for alignment instead of spaces.
>
> Oops, I totally forgot that linux uses tabs even for alignment.
>
> > Otherwise, it looks good to me.
> > I have taken care of the above comment at the time
> > of merging this patch.
>
> Thanks, I'll post v2 without the three patches.

Base your v2 upon riscv_kvm_queue branch at
https://github.com/kvm-riscv/linux.git

Regards,
Anup
