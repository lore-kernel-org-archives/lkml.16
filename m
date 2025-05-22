Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BBB28751B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940627; cv=none; b=sUKYqUFSW1H7pa9F4GE1V7KPa15oz9LucIPxpv5fSvt7rVsbGNOznWA8E+I7IgzBux1bStpm1lOFedc/Q3ZO1dklDFdDsjjpGFCXLaKkKosA67d2SoueWWJDvbqMbjFYZM1BU4B5nZ/9jidz/1xSxh3wnGTM+D9wclKiMY24lbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940627; c=relaxed/simple;
	bh=HkDSaCLOVf6Oz6e3cZMblAzfvn/giEjVwwkHGVwzvqc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VSMW9xy2A9X/x4NUH6xA9vyHAEjplzhX4114Vwlszld4/I16RegItYNJStN9heULEu05rzbmEgZSzBg+1yahu3iB1tl4OrI5GF6K10Oql/c9Z0ha4GZpAPIOLlhGHy/ymcl00/p9GOco7N248ARC46QI8GTwgBt+auav0Dh4M9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=wFStBUA8; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="wFStBUA8"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b26c5fd40a9so148701a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940624; x=1748545424; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q41hxKdl7GpCXig+z3ZJK+daPo0DZNkeUAk+O8lvGEs=;
        b=wFStBUA8Z0C0ULVjY4fMTHqVcM69eZpKP4i8OtqO0E5GlvnVrLUa1fviEF6D+gIWib
         e1OpGnYWckNLShnFwmWajgNpMoDBupKMLdmv0+/Q32qs0xiWLBevx1N7gtyUXPeT0X0I
         73YdobtXXAJYSFRkj/uobBFDPPXPZugNVNuOjMQNrA1X6QvPw+hhTVj8DV9p8xZ0Ky5E
         I+bZKVyKVL76/Ea04cB4etcwEoRw4glbLVSZncesftGPwcN8Tw3rPMkx7oL90C9sRpfG
         qBcykrYvgb1W548DvGjkKJrucTZe+WGrf99LyTxBzhIZbH18HXy+Ebm4TXheiJ7zqWLq
         woHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940624; x=1748545424;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q41hxKdl7GpCXig+z3ZJK+daPo0DZNkeUAk+O8lvGEs=;
        b=vSWpwOO6aDMIWQTRGRrVA1hS9vfrC9PugHE6tb2rEhz+OU3c9op2XWWm1brfDbD+/7
         kgSRTnPaUcr6IR03usfeNxKmJLy4vDnA3yZLk7MhwbwhvYIgaYNaYgJLTZW7RNiDPeuj
         qfNmFCFqPacjelKgEam+0nmhYrXoRnUtgE7/7sSmjDrIwAhE1iZ56dkecJoPtfJyjUyM
         QL6/3iGgbdsDoW71i5l/MXYMXrVq6l+lKEYQ+x8nfXcSiR9aaKQGxlMGLUet2LOkHOhR
         dUNF4WEjRxH1lY9VCMqi+126Ycvxb+hUjrOfPsZAGuf16txq3d3QvSLsTnYrOJUC2jan
         +l7g==
X-Forwarded-Encrypted: i=1; AJvYcCVPxUWd0nQXFX4LjKpKgf8ufonJLTsBjJogPQHhO1tSSvK78M8jzrqLgUjyCklZdTdvtToWJePFV8lpQ9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyah9wCdiYp6gxqISlbB5T7pP6hQmTUywBzR2HrNYWwVNMvzxy+
	m0nFmp0WjNITa6roEFuJ1FIsNB+YW/iBwemdSHI+K1xzRRJEU0fm6qOWBFDEkrVn1hM=
X-Gm-Gg: ASbGncuwp/A4Q4Ijg5iU7C5njzNKKnnfLP0ixtOIqwkPLRcD83OzBivvATXG+Woqqr4
	k3hx/VDv3QYeLdZ5RazOXo3nAPo25O7kOj/oeTLAsE27HLBynS77UiTdZn7XUzO3xhMwbto1VOS
	f7REIu+b42zHXw9/QFPGXHu6GdDCDIohLL8wFHVaQbzVYiArpeV5g6bywLDgv2U87rI3IYO1wUs
	dnD5Myq+M1SYXZXHIbSTDmnO0aHovBfM71228J8dv9SdhUFlnoEiu48dAHiISLIBDuGwgKbKko3
	2G9SY+NQeCrtSOQvmCKhPtq2G2yZYsoSW5NGl2kOa3w21pPawCZVpW76tosnl7ZgE9OIoDDsA4c
	=
X-Google-Smtp-Source: AGHT+IH0XTtZ6vXfmNFlJ8VYIVuVh9eBxn82FNJcr3b/rfTYclBEaVjmuMwZtiIxan0l+gDP3Oex1A==
X-Received: by 2002:a17:902:e545:b0:232:1d89:722f with SMTP id d9443c01a7336-233f067c489mr6085425ad.15.1747940624480;
        Thu, 22 May 2025 12:03:44 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:44 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 0/9] Add SBI v3.0 PMU enhancements
Date: Thu, 22 May 2025 12:03:34 -0700
Message-Id: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAd1L2gC/2XP0U7EIBAF0F9peJYNAy1CY4z/YUzTslOXh8IKX
 aLZ7L87pTHR9fGScObeK8uYPGbWN1eWsPjsY6CgHhrmTmN4R+6PlJkUsgUBhp+Xy4AFwzr4MEd
 ujUYJDvV0VIw+nRPO/rOCr2+UTz6vMX1Vv8D2ulMA9p4qwAUf29lqC62E2bwkX2L2wR1cXNimF
 fkjdAKg+ydIEkxroJsehTJquhNue8GEHxcauu4t2YI5j3Vo3zzVchLkL7ruGcjeeVBoqGVntfz
 DP2/zpzEjp7D4tW+KPoDiyUm6fPsGhkIWh2oBAAA=
X-Change-ID: 20241018-pmu_event_info-986e21ce6bd3
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

SBI v3.0 specification[1] added two new improvements to the PMU chaper.
The SBI v3.0 specification is frozen and under public review phase as
per the RISC-V International guidelines. 

1. Added an additional get_event_info function to query event availablity
in bulk instead of individual SBI calls for each event. This helps in
improving the boot time.

2. Raw event width allowed by the platform is widened to have 56 bits
with RAW event v2 as per new clarification in the priv ISA[2].

Apart from implementing these new features, this series improves the gpa
range check in KVM and updates the kvm SBI implementation to SBI v3.0.

The opensbi patches have been merged. This series can be found at [3].

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7/riscv-sbi.pdf 
[2] https://github.com/riscv/riscv-isa-manual/issues/1578
[3] https://github.com/atishp04/linux/tree/b4/pmu_event_info_v3

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v3:
- Rebased on top of v6.15-rc7 
- Link to v2: https://lore.kernel.org/r/20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com

Changes in v2:
- Dropped PATCH 2 to be taken during rcX.
- Improved gpa range check validation by introducing a helper function
  and checking the entire range.
- Link to v1: https://lore.kernel.org/r/20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com

---
Atish Patra (9):
      drivers/perf: riscv: Add SBI v3.0 flag
      drivers/perf: riscv: Add raw event v2 support
      RISC-V: KVM: Add support for Raw event v2
      drivers/perf: riscv: Implement PMU event info function
      drivers/perf: riscv: Export PMU event info function
      KVM: Add a helper function to validate vcpu gpa range
      RISC-V: KVM: Use the new gpa range validate helper function
      RISC-V: KVM: Implement get event info function
      RISC-V: KVM: Upgrade the supported SBI version to 3.0

 arch/riscv/include/asm/kvm_vcpu_pmu.h |   3 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h |   2 +-
 arch/riscv/include/asm/sbi.h          |  13 +++
 arch/riscv/kvm/vcpu_pmu.c             |  75 +++++++++++++-
 arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
 arch/riscv/kvm/vcpu_sbi_sta.c         |   6 +-
 drivers/perf/riscv_pmu_sbi.c          | 190 +++++++++++++++++++++++++---------
 include/linux/kvm_host.h              |   2 +
 include/linux/perf/riscv_pmu.h        |   2 +
 virt/kvm/kvm_main.c                   |  21 ++++
 10 files changed, 258 insertions(+), 59 deletions(-)
---
base-commit: e32a80927434907f973f38a88cd19d7e51991d24
change-id: 20241018-pmu_event_info-986e21ce6bd3
--
Regards,
Atish patra

