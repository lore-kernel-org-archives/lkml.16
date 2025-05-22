Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A732D23817A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747946140; cv=none; b=aEwpb3PwmHNUJPIU3rAwA67C0IXP/gPQk35VnsLKP2KkwqpWrYwLl0B4OgCxfwUKIXeOoMEvyRz+xX4fId6T6jmg8MBLR6JTriLZlTc7t4GI1bsplpH2v7uAYvejcJep7yC/u4d3ewlBhMso9x1qMi8OIyxIpxZ0HGwZMJWz24s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747946140; c=relaxed/simple;
	bh=EFdSobWGtskk4ad2fNYUv4Ufa2xIyvSV+W2ctGlJ3Yw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VnHIDSxa9apkU0o/AI+itMU8rSlwAAMXhTulG4EcyBio9DbYHrE5WTO3aPsKVlhcLQSlvPZfV64gCg1e8UC1x9ZsYIWNLv0zBqEVrFBLL4fri0X32uK/OmsYVbb3GpdIZILUTMuVTZCQe7q7SY2/H7Yo8tVZ+iss1bpAKSs9pIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=nGbg04aF; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="nGbg04aF"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c3d06de3so6384930b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747946137; x=1748550937; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJeI3hczrGcorf0zoQdD5/qF+d8TPGNC2tDxL+T9ilg=;
        b=nGbg04aF2A0xxxPBnvwg26ERlp1dRkHJIdBAbDWErHVq3r8GL1zLpBt/huMO+S7Civ
         47yXdPUPyfKNc8l77LtBISjbgBCwgL8ZYsQoBbEhhtMpzmR/WExPZgblAxyjT8nHQ75u
         5kXN6qTeifSunRt2ZIaeshj8TEtUSHD7gDtoaQFnDuzDWHYLQwM4axNlcnWXuqMzzftM
         4w1qT1GFNNbPOsNlquPNrdSiskbOp6nYWWmra06wyJMsGFJG+vP0nRVPzFBqRwSD8VDd
         970P9q6xs5KfIx8u5fLYsNHUJaGHLSj+o++H17SAzmnYuNlRB0UqJSQH5OAng2pTv3+4
         5rkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747946137; x=1748550937;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJeI3hczrGcorf0zoQdD5/qF+d8TPGNC2tDxL+T9ilg=;
        b=n07ggAjwpr6cgUfSbblLvG/gLX7Qzby34/EkBfY+wXxQ9IEcLH+cvx7WYn4AzzSmnf
         gKaqqYh4ps0oOYNHcLOJNIsYoUVYOWv44RLbJUiUcpmZnPqI2fVE0BNLk7op8k5Mhi86
         24SrOrQFnY4SqVFaCOYsDGMUpZmPioo+5r4iAhLw7dA1m7BI7lnst/fygnyECIv5B97S
         WsAJ6P/HVI32fHocmZ/bI/kKUKJSqKNxLn/MlI5iRKDGZwCI9+uLzzocoXG5zJDqGA0t
         iOHXsrwmFyyxah/5gFchw8iAEKW33+P0KzUHMUE2ISKKIjlP3NdAYpfcpDNqqZI4qFFi
         n7pw==
X-Forwarded-Encrypted: i=1; AJvYcCUt1NHCunmuz39Ggihbz+woQFeEUYbWTikZQpCzqhILD4Hfe1gAMhLScsXU5HYPy56Shpqld+OozXOn0eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGKj2lS8E6HFITNTkmhci3fP2go50njhh5+PYjdNC5HRrm+oOF
	rnVWox5wvb0LVRC0Ic2vLOLI+HMHSJOghykm7MjWdkTnhLa/9s9mrIdptmgfD8ZWcjQ=
X-Gm-Gg: ASbGncuL6PeHz3iaZ9A9rhFpPxuaOINex8SAwI61OpmJekaRt3NhvPiD5uZa012luQS
	nxhkDqP9cQSPij5bG5GdXmgoJrtVIydBJmna2z+Ij8XArJ+mnEllbiK1SWawZHZFVGqDCh9qJ5B
	tuFrBCJuXjTd9FZiSUuPXCwQ13C+PuwhudsxJBxMNiZ5qXicfstZclMnctL4ybnec34EDEIiXuh
	+sty8pBChFbatc3HhuwQglt1HzSFwrbeaoD2ZNDTj2+dECR2jq3XUl+5zwLmYkGb4IVS76OpIVk
	7ATtIVnOC7QY0+E5+GFACRfP671Qnz0dvVOLUr6i/Eu1WTBYNJo6Zb5XzZtnrJWr3WPbEpXgJ7Y
	=
X-Google-Smtp-Source: AGHT+IFc2kSfwF3mamOSnGj80fjCx3PhuRYqTPiDeh2Maj3FvlzMuzjpvViHalbc+sE51fOiA8fqhw==
X-Received: by 2002:a17:90b:1d45:b0:2ee:df70:1ff3 with SMTP id 98e67ed59e1d1-30e82fc1905mr45589271a91.0.1747946136890;
        Thu, 22 May 2025 13:35:36 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b229csm5932754a91.10.2025.05.22.13.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:35:36 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 0/5] Enable hstateen bits lazily for the KVM RISC-V
 Guests
Date: Thu, 22 May 2025 13:35:24 -0700
Message-Id: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIyKL2gC/3WNwQ6CMBBEf4Xs2ZqFxYCe/A9DSKmLbMTWtKQRC
 f9uxbOZ05tk3iwQ2AsHOGULeI4SxNkExS4DM2h7YyXXxFBgccCSUN3jox31e27Z6m7kNkx6Yra
 KyNRaHzVhlUNaPz338trMlybxIGFyft6OYv5tf86Uv86YK1TU9aZErKkic/YSXRBr9sY9oFnX9
 QNP+zsRwQAAAA==
X-Change-ID: 20250430-kvm_lazy_enable_stateen-33c8aa9a3071
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

This series adds support for enabling hstateen bits lazily at runtime
instead of statically at bootime. The boot time enabling happens for
all the guests if the required extensions are present in the host and/or
guest. That may not be necessary if the guest never exercise that
feature. We can enable the hstateen bits that controls the access lazily
upon first access. This providers KVM more granular control of which
feature is enabled in the guest at runtime.

Currently, the following hstateen bits are supported to control the access
from VS mode.

1. BIT(58): IMSIC     : STOPEI and IMSIC guest interrupt file
2. BIT(59): AIA       : SIPH/SIEH/STOPI
3. BIT(60): AIA_ISEL  : Indirect csr access via siselect/sireg
4. BIT(62): HSENVCFG  : SENVCFG access
5. BIT(63): SSTATEEN0 : SSTATEEN0 access

KVM already support trap/enabling of BIT(58) and BIT(60) in order
to support sw version of the guest interrupt file. This series extends
those to enable to correpsonding hstateen bits in PATCH1. The remaining
patches adds lazy enabling support of the other bits.

I am working on a followup series to add indirect CSR extension and move the
siselect/sireg handlers out of AIA so that other features(e.g CTR) can leverage
it.

Note: This series just updates the hstateen bit in cfg so that any update
would reflect in the correct VM state during the next vcpu load.
Alternatively, we can save the hstateen state in vcpu_put to achieve this.
However, it will incur additional cost on every VM exit while the current
approach just updates the configuration once per VM life time upon first
access.

To: Anup Patel <anup@brainfault.org>
To: Atish Patra <atishp@atishpatra.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org
Cc: kvm-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v2:
- Added a preventive check for lower 32 bits of hstateen. 
- Link to v1: https://lore.kernel.org/r/20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com

---
Atish Patra (5):
      RISC-V: KVM: Lazy enable hstateen IMSIC & ISEL bit
      RISC-V: KVM: Add a hstateen lazy enabler helper function
      RISC-V: KVM: Support lazy enabling of siselect and aia bits
      RISC-V: KVM: Enable envcfg and sstateen bits lazily
      RISC-V: KVM: Remove the boot time enabling of hstateen bits

 arch/riscv/include/asm/kvm_aia.h       | 14 ++++++-
 arch/riscv/include/asm/kvm_vcpu_insn.h |  4 ++
 arch/riscv/kvm/aia.c                   | 77 ++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/aia_imsic.c             |  8 ++++
 arch/riscv/kvm/vcpu.c                  | 10 -----
 arch/riscv/kvm/vcpu_insn.c             | 61 +++++++++++++++++++++++++++
 6 files changed, 163 insertions(+), 11 deletions(-)
---
base-commit: fb13a11917ea679b12b0d51905dea1cec23c015f
change-id: 20250430-kvm_lazy_enable_stateen-33c8aa9a3071
--
Regards,
Atish patra

