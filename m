Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E561BC9E2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740413; cv=none; b=OpDSrosuNmOUpyKt1sBhTeHzSo/mbrqtX65/dwFRdt7ySCHHbgNdPYFNsT1jCUF33V+bqGFU3k63o9RtkxAR8C+fF+DxsfuRnmyvHyUWiyJU2TFSNZFRktRV9uugBqK81h6B/21Z3i5ooW+Vbhq92Vp/xzQVyFvovFcS/fNcj78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740413; c=relaxed/simple;
	bh=m63/SvGQVrF/SFgUb+zp5Sn/VTdHvOYl5uPmAMOpnyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LH7aNgl9kCXB/68ttQ+fmt869Is0dipeUN8AH4e2SBuwJ5loYWlpn8y0GP3r6qYEMZZmjRzOUmVm5Vso7/LS/JlPJ0zuVpZji+r/Mk3BkMu4SpospLVlixMkynhTrDbI//i9mfGOuVxS2qw1Qa6c8STCHsIQYgGNMqvAE92N6KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=QGC1CSDd; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="QGC1CSDd"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4ef05f631so124320f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749740410; x=1750345210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ibZsfu61G+oZ3OcZnknsMkAY7GOU8y9qTpgpoBVVb8g=;
        b=QGC1CSDdnbNC+XJ8IMeAISXw2qS1uWUaVzxGCMlK2YNoI6/DNDo28Xgk74Vh8cHk1L
         kRNioXtHyISzKoQLPcWR3VMw0hBaP3rqjCRiHBvE334YE1Yhbdy8sD5sDPxiXUVREIgn
         DM5NKS8yNeIN0WMB5IonF4/Cp6Yp8bGYuyd8enwr8mNQvhIAVMdB8QFCJwGJV36XgddK
         N6JyRn0/5bgOd1Y8MpPpYtsccMTxqrqezg3JzcWAF47MkoJ/HUjXu0q3Qp5nPKsvNuhg
         N9xZvwlsTnKWUTgHkxuflJYKrFjteWtjUvgZmxYiSFDs1z4rTQs2wxHkrNNY/WXRMESW
         5vlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740410; x=1750345210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibZsfu61G+oZ3OcZnknsMkAY7GOU8y9qTpgpoBVVb8g=;
        b=JbFgAroMidUnPA2L9fduxYfdeD+PyQQAZDuzH2bQLrwTr9E3fgBBeOGnqhG4Nd/vAC
         /opLMBCRFKTNhmF9bjr/bi5nw84KvayulA+OieapNTf2ipN+IooA/4j1fI3lLUbYgd/d
         fowHK2WIDz8Ev8C+AxgM5/XgZcnt5T9QsmFgBxxVkWQrXIJe+G4OlD5m5oDR1Wpn4ZqD
         yrdxX2XKDJ8KYJJIofMfLMYHPLRV2ymd4Urz/XeWQlj+SR1+x9QK/qS7dYZ9dhp1ccgD
         TLaRi+S20FQHHYiYqLCHO8dUEy4v4w/w6fcpVOk8B1BfYZYbfRU74c/F3nsfa9JqO9zM
         Q2dw==
X-Gm-Message-State: AOJu0Yy30AKKS0kKVKTvmqqVMH7KFh2jrbbXuiwQ0/TOqM/+ypRGCdgj
	EWnnHNxxYnY+0QFG1dqfjoydO79MuyOiYoRPqwRdyO62on8jB0AMpSpIehfQYWxocAg=
X-Gm-Gg: ASbGnctRJOsmyRa1BzyE7gBlrDyTWIUN7hT+NnyvANubWWJL5qKmdHZqMb92ujQzbL9
	FIr0RLabHIkkB/ZmnhGD1spQxAp56TW7wNlEM4jqdW11bs4yerqRMK8ptowkKJK0IRge8EkemA2
	svIfBTfTY0JZOSgdN+yHf2Nbzy7RviJGkGJLcUcf6Das7ybVbTrldH8+185SJruk2q1CNKtfwUU
	Xu8NUR1Ipcfxi444/cu4EnydNFlpBMQ0zHgludvcPjtApFutBojHrHSTi6zS7sqWb7rYMP1i/yK
	qWJRqMZgsb9SZKaMCnQ60lO1EfIw/S7mAn5MPRar9rTQrm+N2sPo1MWbjrVhf/csyR8YkuukAid
	GmrZV
X-Google-Smtp-Source: AGHT+IHYojXyzsnTuhUqtfCyOthtbjJaQgHpUcmPKRrwJXGKkrjC5qwisSFgGuYVFXTmo+5uBFTdgA==
X-Received: by 2002:a05:6000:2c10:b0:3a4:def8:1465 with SMTP id ffacd0b85a97d-3a5588078e8mr2489717f8f.9.1749740409326;
        Thu, 12 Jun 2025 08:00:09 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:e05f:7af3:1bf9:f101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a56199b337sm2228683f8f.37.2025.06.12.08.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:00:09 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/2] RISC-V: turn sbi_ecall into a variadic macro
Date: Thu, 12 Jun 2025 16:57:53 +0200
Message-ID: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Padding the ecalls with zeros is not great for reasons in [1/2].
I could also redo the code to use sbi_ecall1~sbi_ecall8, and drop
sbi_ecall if you think that variadic macros are too evil.
[2/2] puts the new macro that into use, and I hopefully haven't deleted
any intentional trailing 0.

For a related issue, I hoped that the tracepoints in __sbi_ecall would
only add a nop or two, because __sbi_ecall without tracepoints looks
like this:
   0xffffffff80023ad0 <+0>:	addi	sp,sp,-32
   0xffffffff80023ad2 <+2>:	sd	s0,16(sp)
   0xffffffff80023ad4 <+4>:	sd	ra,24(sp)
   0xffffffff80023ad6 <+6>:	addi	s0,sp,32
   0xffffffff80023ad8 <+8>:	ecall
   0xffffffff80023adc <+12>:	ld	ra,24(sp)
   0xffffffff80023ade <+14>:	ld	s0,16(sp)
   0xffffffff80023ae0 <+16>:	addi	sp,sp,32
   0xffffffff80023ae2 <+18>:	ret

Maybe I am missing some kernel config, because __sbi_ecall currently
looks like this:
   0xffffffff80023e58 <+0>:	addi	sp,sp,-112
   0xffffffff80023e5a <+2>:	sd	s0,96(sp)
   0xffffffff80023e5c <+4>:	sd	s1,88(sp)
   0xffffffff80023e5e <+6>:	sd	s3,72(sp)
   0xffffffff80023e60 <+8>:	sd	s4,64(sp)
   0xffffffff80023e62 <+10>:	sd	s5,56(sp)
   0xffffffff80023e64 <+12>:	sd	s6,48(sp)
   0xffffffff80023e66 <+14>:	sd	s7,40(sp)
   0xffffffff80023e68 <+16>:	sd	s8,32(sp)
   0xffffffff80023e6a <+18>:	sd	s9,24(sp)
   0xffffffff80023e6c <+20>:	sd	ra,104(sp)
   0xffffffff80023e6e <+22>:	sd	s2,80(sp)
   0xffffffff80023e70 <+24>:	addi	s0,sp,112
   0xffffffff80023e72 <+26>:	mv	s9,a0
   0xffffffff80023e74 <+28>:	mv	s8,a1
   0xffffffff80023e76 <+30>:	mv	s7,a2
   0xffffffff80023e78 <+32>:	mv	s6,a3
   0xffffffff80023e7a <+34>:	mv	s5,a4
   0xffffffff80023e7c <+36>:	mv	s4,a5
   0xffffffff80023e7e <+38>:	mv	s3,a6
   0xffffffff80023e80 <+40>:	mv	s1,a7
   0xffffffff80023e82 <+42>:	nop
   0xffffffff80023e84 <+44>:	nop
   0xffffffff80023e88 <+48>:	mv	a0,s9
   0xffffffff80023e8a <+50>:	mv	a1,s8
   0xffffffff80023e8c <+52>:	mv	a2,s7
   0xffffffff80023e8e <+54>:	mv	a3,s6
   0xffffffff80023e90 <+56>:	mv	a4,s5
   0xffffffff80023e92 <+58>:	mv	a5,s4
   0xffffffff80023e94 <+60>:	mv	a6,s3
   0xffffffff80023e96 <+62>:	mv	a7,s1
   0xffffffff80023e98 <+64>:	ecall
   0xffffffff80023e9c <+68>:	mv	s3,a0
   0xffffffff80023e9e <+70>:	mv	s2,a1
   0xffffffff80023ea0 <+72>:	nop
   0xffffffff80023ea4 <+76>:	ld	ra,104(sp)
   0xffffffff80023ea6 <+78>:	ld	s0,96(sp)
   0xffffffff80023ea8 <+80>:	ld	s1,88(sp)
   0xffffffff80023eaa <+82>:	ld	s4,64(sp)
   0xffffffff80023eac <+84>:	ld	s5,56(sp)
   0xffffffff80023eae <+86>:	ld	s6,48(sp)
   0xffffffff80023eb0 <+88>:	ld	s7,40(sp)
   0xffffffff80023eb2 <+90>:	ld	s8,32(sp)
   0xffffffff80023eb4 <+92>:	ld	s9,24(sp)
   0xffffffff80023eb6 <+94>:	mv	a0,s3
   0xffffffff80023eb8 <+96>:	mv	a1,s2
   0xffffffff80023eba <+98>:	ld	s3,72(sp)
   0xffffffff80023ebc <+100>:	ld	s2,80(sp)
   0xffffffff80023ebe <+102>:	addi	sp,sp,112
   0xffffffff80023ec0 <+104>:	ret
   ...
   [The actual tracepoint handling goes up to +328.]

Radim Krčmář (2):
  RISC-V: sbi: turn sbi_ecall into variadic macro
  RISC-V: make use of variadic sbi_ecall

 arch/riscv/include/asm/kvm_nacl.h |  4 +--
 arch/riscv/include/asm/sbi.h      | 34 +++++++++++++++++-
 arch/riscv/kernel/cpu_ops_sbi.c   |  6 ++--
 arch/riscv/kernel/paravirt.c      |  2 +-
 arch/riscv/kernel/sbi.c           | 57 ++++++++++++++-----------------
 arch/riscv/kernel/sbi_ecall.c     |  2 +-
 arch/riscv/kernel/suspend.c       |  4 +--
 arch/riscv/kvm/nacl.c             |  7 ++--
 drivers/acpi/riscv/cppc.c         |  4 +--
 drivers/perf/riscv_pmu_sbi.c      | 48 +++++++++++++-------------
 10 files changed, 98 insertions(+), 70 deletions(-)

-- 
2.49.0

