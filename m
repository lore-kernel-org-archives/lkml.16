Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AC0241681
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743679936; cv=none; b=dgJYXovymwkCVIJOtYrxBVOK8yNkVhZCWlBPY1kUYFLRbDRINwiI6QBqOZAlrK640FGdXg97eShKXeUy3Matzy4nJknmbnElIlQhwbdl2z3rdDzq4p62pgihZ4CP4JBzce2MZJaRHm6VALaNLLMtFfDTyZpLAGiZJkda1JubDfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743679936; c=relaxed/simple;
	bh=81CpPwNVUGBQ1IoKRd80/VDp98uX+46nUa94lnHysns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IDuc0WpdNZuGs50mswBuobB+JvtxeWumd1Kw6WKik26mbEhNnuFlcs2D9hj+8CG9ZbPUhB8beduCOqtUTkmaR+dTpMHgqw67dgcUxQDVnH7k0DxLr64HeOoUhRthgtkRou0QBRxt3Tm6n8pP+wu1FGeR1PVBsr+JBY9tQkxBVkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=oTL+AHk7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="oTL+AHk7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3996683dd7bso101710f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 04:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1743679931; x=1744284731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uzJLKlljfvfxPvPUZeysuKSPBVSnoaOxnTXwCnBbatE=;
        b=oTL+AHk7+pdvW5O7QsSLK/sZQdf3BBDK02IqEFHix6agx98uX8T80Om0DHAqkdHpI9
         nuHSyQ9vMDfGmcy5Nd1fYOqIp+28n6omrSLUQicbqSbCaEp2aA2OaO7jTg3SyulDnsDq
         6G/jncpJskUQIWpvBcP36mCX+zSKzQFMKnUg5aukK+c+qKSNIN6zVzZ6zp52pK1yOrHv
         OqAy+JUlv7XIkAfSKequUVwQwirUwY9s9XzZ5ZcxffQajs1rKaLcm9V+o+zkiwMBjaUu
         gvfyIC1uJmsQalCasQTq/7NSeX0tESCI9XFRbgk2GhJrPHN8fc+sc1kNHjEjxZg4j9gM
         J9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679931; x=1744284731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzJLKlljfvfxPvPUZeysuKSPBVSnoaOxnTXwCnBbatE=;
        b=cgqmhmLLAalsWzExjNN0sS97udevTmAGmJgJd1KXgKqa+0CvGIFtiD1KvYGZaLzkoC
         TBzbwrfWiF2nPza2gzTrA2NYkT86pzyLCqFr9pQV/cly7U3vUtMaFIwm2MApjf//4PuW
         7dJeap46yLhafwiIUewMRDK2ruNJr/J8TeDadOQAxf5h6yaHw1uFvBr4VVFqHpS/0siI
         yXEOIB95EvvPKFz+6XP+SuRxADmy9AT9J3LT6EgCBIZr7DvxUDAPyzF1l/ijQ5Yan8XR
         qfb1LS08vkYw5ONh7F7ONz2YtGW/wJ/u4gMiLx/kGAs5aLZ/QPd0IwGIwRbxqbHTDynA
         jSIg==
X-Forwarded-Encrypted: i=1; AJvYcCUkEakpdkaxQWFUSq+wm+HfDSv/Lg9Mn1A9KlKs9eFl6mRq5n4fSULe0reFOimWTkLbZAjzMoyXGKgqUTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFz4Ii9v/gnU2QRyFX3N2dzziNxo1gCz0Etb4Ma6iI4l7nGgdj
	NJWf3siYJpUK3d1K6kg/Q/1jeWzTLZlpyKHyXktyloEcegeiTNCSo6SLXcrMERk=
X-Gm-Gg: ASbGnctWGj7j6dY3031gakhho9q27i0o7USGYxstLKmIMC6JimRR+drNKGxgFfSBABS
	vU37e8CEI1zld+XEhBrNN0jdS7gzc4Ssa6YP87gHBgNdykQejnM29sohSMA3mCeM0zx0iATUwVU
	oECLWIEOP9Q/dDVSP/zXRKIEmNMrWxuvZ+qXQxd9c602M7uLY1zAGuU+rjHr5qvhEraTdg+X8a7
	YAPvzLfSweMi9vsAJc7iDCRRSbl7ccfG+ZNCmTsvUcoJecEfEdBKSwVyC9F5WW7V5ORxFbKkIT0
	477XgTqjV8odPGVkXmKCpVYIHmg9pcOow97SdpxibIsKF650887wj389qQ6bH6mo2apzwHMcJ61
	Pcw==
X-Google-Smtp-Source: AGHT+IH6xifwXMVfMLClIlm2BzAh7GveRJDcwc65VzrAXzSC6fsdF3OjurjTLfO2TtkYTUXlVLDtBQ==
X-Received: by 2002:a5d:64e9:0:b0:391:2a9a:47a6 with SMTP id ffacd0b85a97d-39c120db3demr6114098f8f.4.1743679931180;
        Thu, 03 Apr 2025 04:32:11 -0700 (PDT)
Received: from localhost (cst2-173-141.cust.vodafone.cz. [31.30.173.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3669d0fsm15884455e9.36.2025.04.03.04.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:32:10 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH 0/5] KVM: RISC-V: VCPU reset fixes
Date: Thu,  3 Apr 2025 13:25:19 +0200
Message-ID: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

this series started with a simple fix [5/5], which sadly didn't fix
enough without [4/5].  [1-3/5] are refactors to make the reset a bit
easier to follow.  ([1-3,5/5] are applicable without [4/5].)

[4/5] changes the userspace ABI and I'd like to gather your opinions on
how the ABI is supposed to work.

As another proposal, what do you think about an IOCTL that allows
userspace to invoke any KVM SBI ecall?
Userspace could call the KVM HSM implementation to reset and start a
VCPU, but I think that kvm_mp_state is an SBI HSM interface, so we have
an obscure IOCTL for it already.
I was also thinking about using KVM_MP_STATE_UNINITIALIZED to
distinguish that KVM should reset the state when becoming runnable.

I recommend to start with the following hunk in [4/5], as it's the only
significant part of this series:

  @@ -520,6 +525,10 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
   
   	switch (mp_state->mp_state) {
   	case KVM_MP_STATE_RUNNABLE:
  +		if (riscv_vcpu_supports_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_HSM) &&
  +				vcpu->arch.ran_atleast_once &&
  +				kvm_riscv_vcpu_stopped(vcpu))
  +			kvm_riscv_vcpu_sbi_request_reset_from_userspace(vcpu);

Thanks.

Radim Krčmář (5):
  KVM: RISC-V: refactor vector state reset
  KVM: RISC-V: refactor sbi reset request
  KVM: RISC-V: remove unnecessary SBI reset state
  KVM: RISC-V: reset VCPU state when becoming runnable
  KVM: RISC-V: reset smstateen CSRs

 arch/riscv/include/asm/kvm_aia.h         |  3 --
 arch/riscv/include/asm/kvm_host.h        | 13 +++--
 arch/riscv/include/asm/kvm_vcpu_sbi.h    |  5 ++
 arch/riscv/include/asm/kvm_vcpu_vector.h |  6 +--
 arch/riscv/kvm/aia_device.c              |  4 +-
 arch/riscv/kvm/vcpu.c                    | 69 +++++++++++++++---------
 arch/riscv/kvm/vcpu_sbi.c                | 28 ++++++++++
 arch/riscv/kvm/vcpu_sbi_hsm.c            | 13 +----
 arch/riscv/kvm/vcpu_sbi_system.c         | 10 +---
 arch/riscv/kvm/vcpu_vector.c             | 13 ++---
 10 files changed, 97 insertions(+), 67 deletions(-)

-- 
2.48.1

