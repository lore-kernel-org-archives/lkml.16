Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043E613AA53
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748102346; cv=none; b=NtMxq2FZAoWAkfWWPmE7iCT7ia8tNXblnVI44+tc9Pdd+eN1biaotQ8Gl8D844JtJwfOO0z3XJJEk3Bo0xiZp93WFRnhMgC2EslIA1LANlU4fdf3LdP+F9wqFE774xuYfhvMeFsyYW9OD6IJW+rcenVsOrZpIUOU6PXEFPDAW0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748102346; c=relaxed/simple;
	bh=h1Or4FuMdPhjJt5IdwmBVjxYZwDeDm1BFV7SyAA9a3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKJJPBHEhJ3VIBGGJgCI6Dsrpi6qJWolFr686WeX4XLoaG3SzdEbCVZMjUEokSGOhBrZnIbCDsj6/gqt5tzNU6AmSWM8PYQ+TVwNvmydX+rvSv37Ckt1al2eq/hWVVnmidfvtcdoULpe20x8da9s7uwGKVJQCEtVNxr/1kJHATo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=nZNQhSnD; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="nZNQhSnD"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3dc83a8a4afso5988925ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 08:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1748102344; x=1748707144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2yr9tnKn9TqlbBE9wxEbTUU2i1OSmwquvIPpcnGXAE=;
        b=nZNQhSnDUzArTqABSSNsXcqCSLaDIohrac9y3ZYLz7lnzul7ksSh0z8xUs2aaFQLF7
         D+FL/EdeFNd3Md1qEyoT5rq+ZqNCIkYtn14olPQ3M1OZTxtLpg5K+poiVJBdn9+FydCv
         +I3HqxdkpVmWwrCDnbpa/RB+oAjoKM4lD0nKEjI+i0uY0LptKhsdGop3FBgp7JvdAZ+i
         DthHyKbwPpt8dKxGph4HVHy+9QxRlDP8nHr6PGSSDkF4iMtjblBIWIp+7EV2okR4H8kN
         sllepQQjoWt9cAuVy9GfCkHPZZyJbAnXp0+hiqw36WV0sYOqau3eKGHu7R2Z2Wx9NC2n
         sfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748102344; x=1748707144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2yr9tnKn9TqlbBE9wxEbTUU2i1OSmwquvIPpcnGXAE=;
        b=YykxpueXcZThv2l1RQxG9S5ljrC/MPMWcdq1/2XMSYjId22EILBkNgeBMa56Hwthvp
         AKpVelVWwO6jxWF6F3imWS6VmCuScad2pvy2K3i0YBvEUdjjJ/pZjTjxnrOeNhyHB7Mc
         g1ajcKBqJU0kfgdY1XjQktPYBN954WKdHkx4QTuV5Xx3zunIwS3jL4ARnuDt0S/FPWxL
         /w/XzNvt/oLhTrQZS5UILWGNPvcLSHym0ts8RP5E7YNd2mgG8t3uLpJmfzltuvgEtsuk
         aeiDfmpQYOTUL+meOEh96gzX6OEu1BC9AHD30/Txr67aBILTm/l0dPaJvANc6uMyYXM2
         m/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHYc0zpR/bT2NuRdcUvy3XLcsCiiy4wWJfrH6bFWFzz4fxPSDnVhhovAVKq3x0g12vdvKrm3FV7YllUSY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5XYI/hTF5gWiNXEjmO3AU6wTtAQN9ZHY5FrjFzb3ERRB8r/9g
	K2/Wdgm8tZ5qCsI7ltm9DzATZlo9JM2e0AJ0hGZeamCyq9zA3jjC1N77oPvWFPychS2JUkUdAzu
	sFhBX8xoq0xZ1Ga/aLDFRSSwx5TOMd8rtc+OVpzNu7g==
X-Gm-Gg: ASbGncuhvArFQYWe/DmNmEBA50XXelzLr1Uk/9u9aL8wG4saqnE3b/6HS8XqJdq3bOv
	fz4cD7CoTcL7V3BZ5pg3rV5j1H8Zd1I0sGAU906dy3QP6weB5+Mhf7fCpIGlxgKhy9QSdgeun7V
	o/iDJHuLBn/fVgkzJnvMv+Vnf0DJPEEHnK
X-Google-Smtp-Source: AGHT+IEV4eb+rq7jqSPU1O3ArOm2/AotMQitLIc1b82BqLuQmpgD0sL2W5ul1eYPBn+JqoU3IEelxgq8AvLf22NB40g=
X-Received: by 2002:a05:6e02:3993:b0:3dc:8e8b:42af with SMTP id
 e9e14a558f8ab-3dc9ae6add9mr28247415ab.7.1748102343954; Sat, 24 May 2025
 08:59:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523104725.2894546-4-rkrcmar@ventanamicro.com>
In-Reply-To: <20250523104725.2894546-4-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 May 2025 21:28:51 +0530
X-Gm-Features: AX0GCFtOMEl61Vu092B4vlrmT3A99i4MJFIakv747HMx06wfCiv1EtyVxeD1GV0
Message-ID: <CAAhSdy0M8ozHyR1mfW1u4-w=4xZm404jR4iqLRL0FtDh7RRvAg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: lock the correct mp_state during reset
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yong-Xuan Wang <yongxuan.wang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 4:22=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcma=
r@ventanamicro.com> wrote:
>
> We're writing to *tmp, but locking *vcpu.
>
> Fixes: 2121cadec45a ("RISCV: KVM: Introduce mp_state_lock to avoid lock i=
nversion")
> Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Improved commit description at the time of queuing.

Queued this patch for Linux-6.16

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 31fd3cc98d66..6e09b518a5d1 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -143,9 +143,9 @@ void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu =
*vcpu,
>         struct kvm_vcpu *tmp;
>
>         kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
> -               spin_lock(&vcpu->arch.mp_state_lock);
> +               spin_lock(&tmp->arch.mp_state_lock);
>                 WRITE_ONCE(tmp->arch.mp_state.mp_state, KVM_MP_STATE_STOP=
PED);
> -               spin_unlock(&vcpu->arch.mp_state_lock);
> +               spin_unlock(&tmp->arch.mp_state_lock);
>         }
>         kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
>
> --
> 2.49.0
>
