Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5D5288CA8
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 23:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747350687; cv=none; b=t/mmqHd35LJVh1ayX2xpJnBE/3WnFjWy2Tf5++RT/5ckHDaukHkHSw3VkGMgT8yDsHKVyCMouEHwguOJ/VWPo+IE1JE39/o1Z1m0P2ISy6+kmDU+qZ6T4nZulch0/HGXrHSwiLHwuAJEUk/723RubDoZxUZ0k5fg3J5uxsJs1DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747350687; c=relaxed/simple;
	bh=21b1u916IrRdgMckSAzBYsh9RmVZZAX9kLZjKilFMOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NLxqyJezOnujYQmYURYW5icfJL5T49d1GSky6r2H9Gf+sJ2e7NKgycSdzzPe3gvS0s13lp6PTeHM05HUxNKMgaNGToKqvKZEOxRR/08p4uYYWQOpkbEuoDvrcCLPO//k1zihMRAMZlwzlOaNgEyXxRnfTESWlymYLcG4vuzy/xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=SYwYp2hp; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="SYwYp2hp"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b1fd59851baso952065a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747350684; x=1747955484; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cWXRh7r2vJxZ/1lbG9aXXgAmYeOBerYG9mBks7QssNI=;
        b=SYwYp2hpAUJDo9/caghrPj4jjrxNQVe/et247O7c9+VFWx0PIc8UNWFjwxQGLZ39nJ
         9p0AHbgO9RgCqYUmZg1mKQWn74HW740kULhs3NoW8ZZShoCWCWQky4Q3FOF8UeXThY5Z
         vfIEJsdIZIoFfs1tc6+cjDt+YDVwPuqK/ngKHU0FCdNIlkgHjXRcOcQ8eBm4g67ao0kW
         LT5xAYZeL6tHCDPSqTRLAeMze/vEz9Vn43KEvEDKFJl2LXVgnSDz0KMneqE0gQVjj6yH
         U+ZShYBgFuQzwoJSzs4S5JcZe+vBxZ//m0ynZmcgr5p5PjP068EoFIwJZf0Vco1aLhVa
         a0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747350684; x=1747955484;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWXRh7r2vJxZ/1lbG9aXXgAmYeOBerYG9mBks7QssNI=;
        b=g00Ik/XEnc2aKim3dRQjLUThN433aRW5SGvvJiTpVZ9ckITGX1V3shmfP09z3TCxBp
         WOn6cJViDBcj51goN43lut3BAwNIOCsR9GP1wsCyqcdreB5tn+XW6AEZbb5/CJwFXYw1
         lDzX6w/20FKIpruTJOwdCwxGPRQkQfpTYo3/OeVXwQm5mKv18br0Cnpf8YbW342MvGq6
         1WxHj+adCvvSWwtYZ4LRra7Yf8Oz+HILqFmhWHfII8nbxij7SXQhFyUzdPZMBfj3e3Gm
         CyuOilLQ6qZtk+gd8Xgu6Mf4UzLfC0PwWqwT+WHzbji7upAVZJbpptKt/2jDqOO/Sqaz
         Wl1w==
X-Forwarded-Encrypted: i=1; AJvYcCVlnYpFQNNftGU4VzFlSRVoGl+/7TzpgvnpB8pq8vyGFGcTgAeJNPb8gAaLri0D1QKjljycFViiOwlidzo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Q1UAcAMmwxXVkAkBpwt4++VaGz8hXcIByHXdua3cIc5AquRV
	CEADEmn5KPyEU6Is+B9xwDMRrwgXv5j1x1bm42INAthL42wm4Wt/JHK4/nuOk8eABPw=
X-Gm-Gg: ASbGnctXreVBls83XCMT5HkgIxrmDrfWEwF1M+navmMvt4EHCssMAWcCmKc84YKyP0N
	OOv34uGN09DDqOBxUxL6q9X4q7skhGshn9IrkaC6ltYpcVf1ntx2QRaG60/gBl9DJMpwFT0PUX5
	zh0OfYgXPAaBRjaeY4koiux8gmeSiAyr6kTOSiWQXgFPhImYjNgtjRo1fiFpUOP3X7GA33rOM0l
	LipzneWXU5Wo+eUY/e0Inrp2wAoS0IXuPl1V7MtkH81/sI0LaZt2ZmWxOaLtBBYrRHwcIh5aCuf
	7uwdJ1UvpGdxBylTK+815NHIRiaaLJ37HxbhvdVCHzmU94nTOhWiPI1wOpoyD3SRoYEleNR53EU
	=
X-Google-Smtp-Source: AGHT+IGAW4cvTanI5pu+NrHheJagZj7AR+lLIMA5PpkVtQFo51HmALe79lqxHvRdT0WW08MROjTyIQ==
X-Received: by 2002:a17:90b:548f:b0:2ff:7ad4:77b1 with SMTP id 98e67ed59e1d1-30e830c50a5mr457868a91.2.1747350683748;
        Thu, 15 May 2025 16:11:23 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d46f4bfsm406016a91.5.2025.05.15.16.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 16:11:23 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 15 May 2025 16:11:18 -0700
Subject: [PATCH v3] RISC-V: KVM: Remove scounteren initialization
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-fix_scounteren_vs-v3-1-729dc088943e@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAJV0JmgC/33NzQ7CIAzA8VdZOIsZEPbhyfcwZpmluB4EA5NoF
 t5dtpMxxuO/aX9dWMRAGNmhWljARJG8K6F2FYNpdFfkZEozWUtda6G4pecQwT/cjAHdkCK3xnS
 N1BraS8vK3T1gWdrM07n0RHH24bW9SGKd/tOS4IKDsFqOtlfQ9sdAyUdysAd/YyuY5CeifyGyI
 MKazkDd9Aq7LyTn/Aa1I//2+gAAAA==
X-Change-ID: 20250513-fix_scounteren_vs-fdd86255c7b7
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

Scounteren CSR controls the direct access the hpmcounters and cycle/
instret/time from the userspace. It's the supervisor's responsibility
to set it up correctly for it's user space. They hypervisor doesn't
need to decide the policy on behalf of the supervisor.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v3:
- Removed the redundant declaration 
- Link to v2: https://lore.kernel.org/r/20250515-fix_scounteren_vs-v2-1-1fd8dc0693e8@rivosinc.com

Changes in v2:
- Remove the scounteren initialization instead of just setting the TM bit. 
- Link to v1: https://lore.kernel.org/r/20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com
---
 arch/riscv/kvm/vcpu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 60d684c76c58..9bfaae9a11ea 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -111,7 +111,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 {
 	int rc;
 	struct kvm_cpu_context *cntx;
-	struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
 
 	spin_lock_init(&vcpu->arch.mp_state_lock);
 
@@ -146,9 +145,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
 		return -ENOMEM;
 
-	/* By default, make CY, TM, and IR counters accessible in VU mode */
-	reset_csr->scounteren = 0x7;
-
 	/* Setup VCPU timer */
 	kvm_riscv_vcpu_timer_init(vcpu);
 

---
base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
change-id: 20250513-fix_scounteren_vs-fdd86255c7b7
--
Regards,
Atish patra

