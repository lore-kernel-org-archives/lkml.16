Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD901A08AF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745584728; cv=none; b=r2tcEOZ6ob43Nxso8uPijM2Qer+wsyWTfhBws950auULVki/E+KxvzWo75gdCd+g+GL00KaWS4o2iD5p1vAUkSSIDyr8Seff2JD1qbFmmSRF5bvJuv5rgKNrNp1RySf4UPqH9kyr+JbbpIaihtdgA0tu/K6W42MJyNCpegpOr/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745584728; c=relaxed/simple;
	bh=jG0Woov0KZX/71eFaFKuHJOjEOdv2sAsWPlyXv4qKmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anRSINy2eG0ScB+pwluAbdIpDKEKLCQauCZbaUbRX2+4ZyO3FIt7P9pMvBg70TkxmGSOIVERVnKDRemqSQaXSVKEIdvDHRd//j8VlrRJ9Ps+o0h5QG1t7BuAAbivFRnemrKfS0IMFb20QUAAHVN34uQRlZK/plMuK4vLJJxzVyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=V2z2jc7o; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="V2z2jc7o"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85b5e49615aso221076239f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 05:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745584726; x=1746189526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y49ecCcPZ27vKY56UjG6VNDfh5EOeWUeZzzvy6PanTw=;
        b=V2z2jc7o7Fig3LRgt42oIGvxeQ1Zja4vsoXpFl5OgLS/iyIqu9ZMMp2hFrZvdeq/Eu
         MNZmzEwLnPt1inkFQJDrbGYa/N2zXWBNCSCBGpoCCy8m0DMg3CdViUKwOnAILvtEMKc4
         3hZlJmoG7pY6pdbfy0ipkOdwymegrPQIKEL38+Tbg9m0CsOGqnrSUZHbIi82DJx8AuQc
         l45MJPWwG645SsOTDNlRX/rUeLLNaIa5VWAOGqq0lnP8pUF7pEwkKoUbb51TRbFc1DTV
         4lnhwMsuj8GKQCP2H0pJZpWTG+HROo5CxkTUD1LvHk9K/Xc09Tshb1mIUtDXDIflyqAj
         BXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745584726; x=1746189526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y49ecCcPZ27vKY56UjG6VNDfh5EOeWUeZzzvy6PanTw=;
        b=fx4oXTYYWvtKx+JJiMVCIq8PjfX0nI4UKerWY39WcpZBMbPpSoCzYgCeSsZTPRQkd/
         vqGlRN5Tb4M1lTJFqmvml5AT4C4mh+yGc2PI0f3teKKqShPnrVq7Faa+jqbRb7cb6DQF
         JmnYlGX6o8T6zOHPQuVm8pZDpZw/28ygDavZpZxTyXQweab0waKALJ+kVbSpSMuJNopW
         dA/Vzrlavoa3SUs3EgNYRdsTgjYE8l+qqDbEPPt8737Hj/YtKLw9XQz5IB5bNk8k/K96
         S7vHshmYVqVx8h36Fr+zSfdgLA1OfeFMAwuhmQMFvNEPfdfEHCeO3yM2lkN52pxw2im+
         cjKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu/qzhBjiL4lTo0IHQy/hYEBNSDU8IU0uMIPNnSDt478zhsGNn4vI9+8STc8eg3NiWowOQmrOs3o2qv4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz9N15DrYVltSYDbBJd3THQdbNnJ9ZjlBVBWOrwIa7bX0qpAyu
	Q4aly3ZL9dyM/o+rwLEIQE6EL0lmiyEVc1susznGdi3DCCbtUhqDfoNDKeF6tkXY0De493hu9y6
	6Vghgq9UmE0L1zuDk5UXZ0McvBdFV6u8Op8LYtw==
X-Gm-Gg: ASbGncsYmSKWtnRPtEkWfxzvCJF+NrCNh1qUxRE04Dg98UcXFgEQfHlRovDOz2g3wqK
	HB87xH1wufK4F6D2iw0T773VrMqKtlyWDKJS/x+7jVol1CBqhx+mBF2gecGJdEoNiXPkZZIgAgV
	MJ1hNzm/pHNjEpmV8rC3V2cbx4QwO8Nw6SHg==
X-Google-Smtp-Source: AGHT+IHCBpc2B5Wy9lcw08NfHNFF6DJA1zf4wJ9kwK39XfuRau2F7l0ThkxP7bLnPHEwO5HGzNURDb7ye8N+KXdSdhA=
X-Received: by 2002:a05:6e02:160c:b0:3a7:88f2:cfa9 with SMTP id
 e9e14a558f8ab-3d93b46c840mr18166585ab.11.1745584725718; Fri, 25 Apr 2025
 05:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com> <20250403112522.1566629-8-rkrcmar@ventanamicro.com>
In-Reply-To: <20250403112522.1566629-8-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 25 Apr 2025 18:08:32 +0530
X-Gm-Features: ATxdqUGBDZlnKKA6uFKMGKbX7_uvZC9RQt2w-oNtOWxKHL92YM2ym7Hd58gV9nQ
Message-ID: <CAAhSdy0+C34zZbYR3_B9x6xHihwfLxeTBOfrdRfLRjFUN=78gA@mail.gmail.com>
Subject: Re: [PATCH 5/5] KVM: RISC-V: reset smstateen CSRs
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 5:02=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar=
@ventanamicro.com> wrote:
>
> Not resetting smstateen is a potential security hole, because VU might
> be able to access state that VS does not properly context-switch.
>
> Fixes: 81f0f314fec9 ("RISCV: KVM: Add sstateen0 context save/restore")
> Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com>

This should be the first patch of the series which can
be applied independently.

I have rebased and queued it as a fix for Linux-6.15.

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 4578863a39e3..ac0fa50bc489 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -65,6 +65,7 @@ static void kvm_riscv_vcpu_context_reset(struct kvm_vcp=
u *vcpu)
>
>         memset(cntx, 0, sizeof(*cntx));
>         memset(csr, 0, sizeof(*csr));
> +       memset(&vcpu->arch.smstateen_csr, 0, sizeof(vcpu->arch.smstateen_=
csr));
>
>         /* Restore datap as it's not a part of the guest context. */
>         cntx->vector.datap =3D vector_datap;
> --
> 2.48.1
>
