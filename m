Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6847228AB12
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 22:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747346773; cv=none; b=ZkCEzA6eTImETNo5iF/S2cOAHCUf1sskdhwj7M0oJLKtv+shPTtSEsO/H8z6LYNVE0Szl+ROMdu0vRuUT5Nthv88ZzJ4qPIJbFeBnopoJmzck21JNW8A1uG895O93yMzJ6emiAhBJGOgCk+B9fZLVWsjtlOn76aP7zOyK5S5DC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747346773; c=relaxed/simple;
	bh=u/EaVaHKx9F1SHv14qeTnwcVtfcQnc0b+jYaydTMHlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=evQCQgwHcXXliB4C6+kj+n1z7zzVY0AMGpgBQTo1Fu+qe7J3MPIjxnBuGCPfPpX5BpI8DSYZO7lVFNRFi8BQSVDEKrAF8sX7vLWXItNDX6GSHrkJPXA5ksNTGHQuh+6acKGMxzOwyGprFW7H9DFdHcVtwKreGOsmr9GueXZFew0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=zfeFT7WZ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="zfeFT7WZ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2301ac32320so16440025ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747346769; x=1747951569; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pKEzAEjPYjOvvo8wW1NKB/AseRp560F6iFtwwKSA2eo=;
        b=zfeFT7WZ5WjSHFEw9NPu91v9Yj8cRuhhsCo5Ld1JRZnIIhJ9u1rzjwXqep7bKH2dlt
         DFGBNOZQM5PkuRyteA8fMo5zpctStytekeEV/JvPrDf78vKDIflzLUtjcqPf4/Z37wcC
         YIltQPpLPqLFBrdHbQo2QIXZF/2/sotC3CBd+MAIXux9wOqwE4GLjs+i95UDn0kH6iWj
         WP1fsR1/0nP+vLThP/fPLWMDpVwprG/KfJFeJ/5CIcGMDi/HDQHgzm5xSMP428ilODmV
         CbikMHj5R8r4DkZGXONLYTjQ4GaYlcEB0Pypf61tAsAH7GDjyhpkuTD/Og7w7DGNqLZq
         G+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747346769; x=1747951569;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKEzAEjPYjOvvo8wW1NKB/AseRp560F6iFtwwKSA2eo=;
        b=qmTuE7dR6IIgEq6YDeCdoJLpJDqhR+wjFh6X1dNf5vQ7tAc4/sqBkH6hdJf6LUDYFz
         KK+T+urNb3UnqYBuTriiNlRp8dnRBJYcA0/AkpRm2aevpi0hVV/BLi5VO9q36jfWvey+
         QSBVRp7PAP7e2lxQbIEASJxU43of/tkXYOHZ/aw1sQcee+8OOFSrtWnRK6oO4LyMaNJu
         TTzw5CgRPKUvXP/r8KDgSxjjaawpaqbt9YP81YCugPhoGPLAupfKrNqT3oaBAW+z+N5t
         5bQDDuNurIXdRFR0sMlOaLOwcfDozw1sabmoUXtQPpT8As86mVF3E27IDsEC6k5ykT+x
         u0DA==
X-Forwarded-Encrypted: i=1; AJvYcCUZrnmuyZIxkC10GfMf+GgzOLvMkXPQxne81COUPRKqUIDt4AA3PNptKQccgL3kc5yIgmmre78GljWRfxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcVK/acJ+QGAhJfEHPrZFcsDBM0m6NUTZJSEPdNM8Dcns/Vfjv
	Lf9Ctksv8yVr1OZzPzS2Ac8rYme3OSFF+Z4PnKpqtrsGjmfcCl6iMdLQKe9EqtEGu7huBRBD/94
	0mXJ6
X-Gm-Gg: ASbGncvn4gRdNRdpfiFKhvxROkiJx2rOeWDzjxxg5QLjYz+NPXLv1Qo7PlWlD+F8Q8c
	0Ub2RHoxHZxaZ0saW7GaPUeSqeTuIe6+qQROe1bxDskHj9Y9E5+q9WU5l9Q6iFZAdK7/0Her+Zy
	7I1fkHLepf3GUeLhxJ/MDqsrMyDZT0XA+wS77/DZhbHueCQ5twEwg8HKzscMOXXsIU977NkKFMZ
	THYUgvEtMPljGgCqH1bl7BUTm9U65i+hlc4iZbOYFhO3TKwASbag2UUR0in0KzqtlYfjXgyKLYs
	vFo9zaFB4hYHPxeFlll7C1sjnxd9D14ISDvJsPUOulP4RCUPVvk2eEa4BawXnTJe
X-Google-Smtp-Source: AGHT+IFiKNNYtzCEg6C6XYe7DP0nZARy3KIK4XDqNnkJzROZ4X9NmluwSJ7FFKC6yeImxQGIHZ2cIQ==
X-Received: by 2002:a17:902:e805:b0:22c:33e4:fa5a with SMTP id d9443c01a7336-231d43d9c05mr11341725ad.9.1747346769141;
        Thu, 15 May 2025 15:06:09 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed25a9sm2470515ad.223.2025.05.15.15.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 15:06:08 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 15 May 2025 15:06:05 -0700
Subject: [PATCH v2] RISC-V: KVM: Remove scounteren initialization
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-fix_scounteren_vs-v2-1-1fd8dc0693e8@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAExlJmgC/32NQQ6CMBBFr0JmbQ0tqYgr72EIwWEqs7AlHWw0p
 He3cgCX7+f/9zcQikwCl2qDSImFgy9gDhXgPPoHKZ4Kg6mNra1ulOP3IBhefqVIfkii3DSdT8Z
 abO8tlN0SqZR2560vPLOsIX72i6R/6T9b0kor1M6a0XUNtt01cgrCHo8YntDnnL+d7uw+tQAAA
 A==
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
Changes in v2:
- Remove the scounteren initialization instead of just setting the TM bit. 
- Link to v1: https://lore.kernel.org/r/20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com
---
 arch/riscv/kvm/vcpu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 60d684c76c58..fa3713b5a41b 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -146,9 +146,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
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

