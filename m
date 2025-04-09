Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1992063FA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744228432; cv=none; b=kpwT57WRGTeNFK/z+jppULfDgEnGBDgXVwZcMg3saCYshzx2RXYU7+wWNpg63GQDpiP4/XdGJrEdZZCc+LqlUg8PBi6Q3IrhdvtyNwEcNLLT9bEHOxKs8OTpA05pESFkSWHYs7AuPAq5oby4876bDgJS0DP0l9CE6LzVibrUlC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744228432; c=relaxed/simple;
	bh=rv4mMwuG4jkn773xC8sA0ToKXoLaQgRn7SHaoclVUrY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WXA7QcFwjfCtKy2gaTy+oBglVGOHlFYCPe656Jgp1Lxa8dIWkr0mGSsWRRu//2phH0+UrXKsSMVLfxEfUAzCU1WvPJV40vN0EhajfmarAqjlyevbe89Mc5hCLgHtZL8tBv2gCiFvauYDYpmZhY8ZaeAbNU3Mq9nm1lLFPom8Jvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aI9teiPp; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aI9teiPp"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736c7d0d35aso7918b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 12:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744228429; x=1744833229; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B/LBm3aV4zfAmxi92/BK6RmsqnpaBnCdXpzKq52/Foc=;
        b=aI9teiPp4IOAdU9GBsw2c5UUNtJjfzYDo5oOlVpoK02KZbfJDi4/BUpMOgjUTDDP77
         Zo1cFX/mi1CVaa7zifjJZefTiSM4bKVOBRbxcHWDsR4ra5zIy6Q8gxph2QBBXdTfWPR0
         5OQe5GpPbqiVQys+My9WQ6FIq3wGpo5XZ/aX/6wj+SeZn0pkfDwDGx1345vl3dMMVxH9
         XNN9BcliriZjlo6Nu9bsZMO7F7TC8FUiDzYlGA2mNiW7XM6g2jB0KjlK3q1zQA8WX7QA
         IvmRm67Z5XfxmOWM6F9ibvqDxN6Uam9M7Va/UcIZ8+KdMP9uVdgncS5xeXVLnTkaWbTL
         dP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744228429; x=1744833229;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/LBm3aV4zfAmxi92/BK6RmsqnpaBnCdXpzKq52/Foc=;
        b=ILCrx65vzAyoB6eCURM6btiwGVUpSDWVsHURy7YuKt/zk5WklY/Xh9Q7XgfrCGEFMu
         a2ld7vm3Y1IrI6t8EOBTpUr3SkQJcQQpvSQdD59bBJ4L3XZzcyABd6Gb0n6rF8YkOvCr
         iKHRB8aSyVgLZJMCQtZ2b+oFBXvLuS779HAt4kukipjVxdlojmOyZbTwm0HZn04IPZLf
         qaLYxwMSI3RS1HerjsEjYkra8RjL3lyJuGCjWEM6duSHahMJR1Ueq6WHyruPGb+95TsI
         PAomoZOqh1BKXaNT/hux/pceVAcMvFzZLElAcyHNkpSIShoEpEKtDDyEqZDgRGVqpmmx
         tL/A==
X-Forwarded-Encrypted: i=1; AJvYcCWI9TnAv+NWxi6UbzpAjDan5kqUBz9E6b2lF2CUPMhLqzgdEhNW6eYjhQbM7D7puYsblOhvq6zwJjpFTRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCoI2ZwdxBXEX1jVMQcC6u7LMBV5FS3GOfX5yJmg06YjzWLvzu
	Ji3MozYKNx8wUlJbWItddTi6ZRDUw0SJBhnlki8mBUNcdlcQ/zRxWPNH6AvpxTjDjqpXcSL6PKK
	QQA==
X-Google-Smtp-Source: AGHT+IEeESm/upruWypiAiAFjj3gqiD2FWPZpn5Oi58JT7YjI+D2LtDvdvxhwdzcKYcXLoDvWUFBt/R8XtU=
X-Received: from pfkq6.prod.google.com ([2002:a05:6a00:846:b0:737:6e43:8e34])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:130c:b0:736:bfc4:ef2c
 with SMTP id d2e1a72fcca58-73bbec49ac8mr221785b3a.0.1744228428902; Wed, 09
 Apr 2025 12:53:48 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:53:47 -0700
In-Reply-To: <20250409014136.2816971-1-mlevitsk@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250409014136.2816971-1-mlevitsk@redhat.com>
Message-ID: <Z_bQS63A2bd-LzgQ@google.com>
Subject: Re: [PATCH v2 0/4] KVM: extract lock_all_vcpus/unlock_all_vcpus
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: kvm@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm-riscv@lists.infradead.org, 
	Oliver Upton <oliver.upton@linux.dev>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jing Zhang <jingzhangos@google.com>, Waiman Long <longman@redhat.com>, x86@kernel.org, 
	Kunkun Jiang <jiangkunkun@huawei.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Zenghui Yu <yuzenghui@huawei.com>, 
	Borislav Petkov <bp@alien8.de>, Alexandre Ghiti <alex@ghiti.fr>, 
	Keisuke Nishimura <keisuke.nishimura@inria.fr>, Sebastian Ott <sebott@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Andre Przywara <andre.przywara@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="us-ascii"

+Adrian

On Tue, Apr 08, 2025, Maxim Levitsky wrote:
> Implement Paolo's suggestion of reusing

Ha!  I *knew* this felt familiar when I suggested extracting (un)lock_all_vcpus()
to common code in the context of the TDX series.

https://lore.kernel.org/all/Z-V0qyTn2bXdrPF7@google.com

> sev_lock/unlock_vcpus_for_migration in arm and riscv code
> for the purpose of taking vcpu->mutex of all vcpus of a VM.
> 
> Because sev_lock/unlock_vcpus_for_migration already have a workaround
> for lockdep max lock depth, this fixes the lockdep warnings on arm
> which were the inspiration for this refactoring.
> 
> This patch series was only compile tested on all 3 architectures.
> 
> V2: added trylock option to kvm_lock_all_vcpus to be better compatible
> with the orginal code.
> 
> Best regards,
> 	Maxim Levitsky
> 
> Maxim Levitsky (4):
>   locking/mutex: implement mutex_trylock_nested
>   KVM: x86: move sev_lock/unlock_vcpus_for_migration to kvm_main.c
>   KVM: arm64: switch to using kvm_lock/unlock_all_vcpus
>   RISC-V: KVM: switch to kvm_lock/unlock_all_vcpus
> 
>  arch/arm64/include/asm/kvm_host.h     |  3 --
>  arch/arm64/kvm/arch_timer.c           |  4 +-
>  arch/arm64/kvm/arm.c                  | 43 ----------------
>  arch/arm64/kvm/vgic/vgic-init.c       |  4 +-
>  arch/arm64/kvm/vgic/vgic-its.c        |  8 +--
>  arch/arm64/kvm/vgic/vgic-kvm-device.c | 12 ++---
>  arch/riscv/kvm/aia_device.c           | 34 +------------
>  arch/x86/kvm/svm/sev.c                | 65 ++----------------------
>  include/linux/kvm_host.h              |  6 +++
>  include/linux/mutex.h                 |  8 +++
>  kernel/locking/mutex.c                | 14 ++++--
>  virt/kvm/kvm_main.c                   | 71 +++++++++++++++++++++++++++
>  12 files changed, 116 insertions(+), 156 deletions(-)
> 
> -- 
> 2.26.3
> 
> 
