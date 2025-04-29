Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D48E26F460
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906149; cv=none; b=fmanz3lrR4B83Zxw2RX9O2GrO5+PGWxTN0KB8gFBMvSWm3AJp30SEQ4btAX89303oVwJCnBjgLeV42pIszKhvjnsKTR8u4N5P+83VjIhEY6HzsURC/xC7DLRQebDyaciwaHIBM00WEK7BMmWP6/d1he0On+N+JH6W4kPH+Ym82I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906149; c=relaxed/simple;
	bh=1kDrlm/fhAKr9mj0zuBg0xIvCaUDFqvgW/xklUwgSOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gcJWsk/V9yAP0xFLwtADb45RhSEB/4fn8HPC3K4tzUv1Z/3Bpp0S7bGyQN7PdlCWhXqMCgaH4GgFxISOMqjdNimvrQqVOCTzgRi+qBWzr46pnM3vOKsuJ6mYSvNCTSHmFfnCqEy3UxBOLG2+T40NPrCwF28PMlBH/mjOZz77jYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=O6C4ba0w; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="O6C4ba0w"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-549963b5551so5726553e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 22:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745906146; x=1746510946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8eFfmotZuLjE/iIngsJ3KVYn6Hy+g0+LpOOBN4vUMQ=;
        b=O6C4ba0wjnoZwXtiuE7xcR4ETzqGDW+kywyqywRKpHJqqRzJXl1xBnjpTASwj/DkEy
         Ash4Z7qH+3dn7cGXHdRoLYNLDR3d58uloQ/BjyIifWCTJ+JUrOnDlvP5OcMJTHbEKXsb
         WaZzzHvnOmy7h4/G8XuoIX+I43pqADRvrB9b33bEnnWLmn545EkLeU2t9Hqh+ww2CAhW
         d6KRwHM/RLM4ROQ+iEVU89QIjw1xJbi/on+snY1cS/wpqpmlGI205jGvv8F4SumOt3pr
         RoEHQczBBOzYdtXQJjxjOZTSCA0wYp2TE/0fO9C5KhkshDBECP0tN1GQWHRZEdvhOWIr
         pM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906146; x=1746510946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8eFfmotZuLjE/iIngsJ3KVYn6Hy+g0+LpOOBN4vUMQ=;
        b=KSZ70OBNx3o/yGuRdEWUAFMK5nzmY1gZYx4cWZBAsZdz7z8zFqqaGJ1vfEbHa0XcwY
         pxMqpBz14UfBoCKZA2VQqdJvXiDMbbpbBFhvWqMmSF/WXrl4135iRCpHoNQigz1KmS5c
         nlJ/sszfwh8UkSl4oFIXs6p4vZec6MmYVexmHGtu56crJwFB9JJ7VsVfKT3yTP62hdLz
         Bl4yo4aoyn5BpzGtygynYD2KarLfTKRcaBsVz6q1rKMqd6vlGnHfJKi/JgxoiwPNONPe
         43gXbA5J5sNGoZx7YSq7mzWaxvfscjdgUXNFvsKyq0RZcjLUdsF4Z/GzrileF0S3k57N
         pM2A==
X-Forwarded-Encrypted: i=1; AJvYcCWAMNs+h6WOgf4E/O0BJcLaW8YBe1bVjmnK/jjZvxMzidUr1HidRA/eQgg03GL5py3wadSxFE0GIrjlmfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR0I2ysJPQPrQtYKKOBnI36v0Q+HeuElHdCQEHig7P/EAxbLK0
	RvdOtDtVq/Hq2LfLkVHuUt8JUfNkeL2dG1VPt65Qo4NC4qcJrwU1jq/Mirt0dqDd34QyKSRx8ZF
	VDMjFiAT6/AWAbScNQxCnsoMCg9rt1+6GbDa0HQ==
X-Gm-Gg: ASbGncvXAlPivsEOJ1jhvV7aw+obIY3iRGRU7BM5NFtjWTRbLCdMLn4OLsF0AYK5m9M
	2kcs20FuPxhDQJZKCHPcSdwJKuOCmZ3MMPVzMvWKhqhjOIfekzYsze3u3Gke5wn6wYsp7++pCGG
	QZgG0SI+nIFDtLr7sRCJjURKM=
X-Google-Smtp-Source: AGHT+IFYS//nAhdr5sQ4EKB26kjYn20qv5wR0iA6FrAr+cMy0GIfWIfPM3YUDHi8RlYpm+FL+B8w4CHY3E8C/pwtOoc=
X-Received: by 2002:a05:6512:6d1:b0:549:9044:94ac with SMTP id
 2adb3069b0e04-54e9e53e33cmr325134e87.23.1745906146173; Mon, 28 Apr 2025
 22:55:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com> <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
 <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com>
In-Reply-To: <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 29 Apr 2025 11:25:35 +0530
X-Gm-Features: ATxdqUEiQjMeNUujcFSuwa_LrU9ri9FCJKZ6XmhF2QYcnvi_LFsWj1huKA1q38o
Message-ID: <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming runnable
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 11:15=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcm=
ar@ventanamicro.com> wrote:
>
> 2025-04-28T17:52:25+05:30, Anup Patel <anup@brainfault.org>:
> > On Thu, Apr 3, 2025 at 5:02=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkr=
cmar@ventanamicro.com> wrote:
> >> For a cleaner solution, we should add interfaces to perform the KVM-SB=
I
> >> reset request on userspace demand.  I think it would also be much bett=
er
> >> if userspace was in control of the post-reset state.
> >
> > Apart from breaking KVM user-space, this patch is incorrect and
> > does not align with the:
> > 1) SBI spec
> > 2) OS boot protocol.
> >
> > The SBI spec only defines the entry state of certain CPU registers
> > (namely, PC, A0, and A1) when CPU enters S-mode:
> > 1) Upon SBI HSM start call from some other CPU
> > 2) Upon resuming from non-retentive SBI HSM suspend or
> >     SBI system suspend
> >
> > The S-mode entry state of the boot CPU is defined by the
> > OS boot protocol and not by the SBI spec. Due to this, reason
> > KVM RISC-V expects user-space to set up the S-mode entry
> > state of the boot CPU upon system reset.
>
> We can handle the initial state consistency in other patches.
> What needs addressing is a way to trigger the KVM reset from userspace,
> even if only to clear the internal KVM state.
>
> I think mp_state is currently the best signalization that KVM should
> reset, so I added it there.
>
> What would be your preferred interface for that?
>

Instead of creating a new interface, I would prefer that VCPU
which initiates SBI System Reset should be resetted immediately
in-kernel space before forwarding the system reset request to
user space. This way we also force KVM user-space to explicitly
set the PC, A0, and A1 before running the VCPU again after
system reset.

Regards,
Anup
