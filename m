Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EFA15A864
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320777; cv=none; b=Q/idNYjiLOWJSTQMGHJSF1bksLTlxq2slBVaj6Oca7CBGn5vImIldbsGfnRahyKDPXq+bOXH2G3p6HRJMAyoBIJiPlfzMf1oSSQ/u6kgaMQs+KZAEE4AfMEOxMuyLr5jd1IFF2UrwRUIcag0ypQDLr9uftLbhryRSRnRF6X85vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320777; c=relaxed/simple;
	bh=xj+JA/L1cw6HkMAFASvz+qsdhcu4e/coBRFvJAESILg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ilQ7/Qw51ZuRNNQVy8TZIngZhn+vEl0QMDLnwDBJ2XZZbuVTWpq+Fv7eWK2fOHoSf2aNLErDOjVRrrmZ9mlTbu4DvCs66uKaLnwl0NKW5SUvQdsmb6vF52AQe9r1BseH7GCRy/CdHy5goiVcyoCCZqsl5s0wIfOTWyEGbRNbFyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=nb8FvDGj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="nb8FvDGj"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442ea0b3a9fso642415e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747320774; x=1747925574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JBNMBVMfrCwOqVA/j6iAZ2xlfGUT5Oj6Dz/mC6Rjl5s=;
        b=nb8FvDGjyZ0KM9ff4KGMrpbMnydBvmWHRSQyvqMZXAQQOvlp+ZdhQB9ZW49/0fAOjK
         ApH6Lp20ZXHSXArzwRx9pOw09/WC+9dZ0tGkPYJ2ouWMFvvcMmQPHGyQW4IP1TUr4WfP
         spK8OekI1L1anmzweWVVo+DIOUGJmFWwtcVn0DjhSdwSmF3QELF6hXV8B56VQTppSS7i
         NlxESGVW60HlhGzd77rz8eFk9d825MViGpVUdyta4C+meMwJulnyvkZksSZnZ0yGx5by
         NMVcxYji4EtOj6qekPg8qUgESRvVbo3iDtz3X6P/tiYlKBSgs45W2OuflqU+KNqu5rY5
         Terg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747320774; x=1747925574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBNMBVMfrCwOqVA/j6iAZ2xlfGUT5Oj6Dz/mC6Rjl5s=;
        b=quVLIHAN264m+nB3qqNwynUUJMoiR+LJh+Dd7ejVWbsl8lWxwAUd1TUJRX59+9YImu
         6cxUM4mm20rCh7LFvlK916y9yLa20LfGi6S6mQGKGRfenUmleS3ip1t1o25m5tAalgRS
         d5Z+JdDA9gmszaFkCSuoGXHq9prOV9bGWhJVl8RvJ6MuUnev8KvL9ddNeBRb3RaDU2nA
         t9djcaPrfLgRHXIm/ImeiYr7g5KfaYEg7ot3fVdaOnR/TDDu+E6PFGHqqKNcN3YOgIl2
         z0MCqVuYxR/61d+X/PoRiOi/govw/zSv1hukE+H+VFyniSa7tCXrLLcCPW/XdW3u+5at
         +VGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpG4Jhf/db8P4W1EuWrbSmNQ694qF6baWj+Tnz431cinK3WCws1jJqZM3588Gmro39A54LBOQK9dVzAN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTyUPkUgYqCtUvnwvGf+HF3AmfIOQgUxQLtn5nTiW8JFfRgUAu
	eyehidz9VspYWipyG1yHtBoltly4/s1cmGGgwreaUWzuAENKN3lmMtdqwgPP5jo=
X-Gm-Gg: ASbGncsRKQvJz+3D2b2w50qTCO3leHYtyH9G79gixNaW5o66CC7IcZuc+gIbhSNWEv0
	a3dwVSuPjKmTRvP5qkb9oPZk8+Z/t5vJVH/XkkM9ECbcCkVjwbaKbyidzqasOuFpfiIz0F44U/V
	Z1dxNmcWEGLuvDEmJo4mG1u5ueFiODP31Qp5y2GBSby2Kb4MOe+F8siXXY8ykbbMGA9LDRF/e19
	ko1/vpwIdPcZgcBijqrPjQUXnvRyAcTTn+AUVRBBAFholnEcIafHFlEpZEQDAqunlBrZPrVhEh2
	txu7tUwIZ2B5MvTc0y42rnGhXNBuvogYrxksPvsp1L0vmNpNyd2ImpEq
X-Google-Smtp-Source: AGHT+IEjWdfaSstCa6WtRNHMXeY5NKPx+dlpO0u8cbQ+/wmwqBYSpQzl4SUc23EpyvhrjvwJhEHmXw==
X-Received: by 2002:a05:600c:1384:b0:43d:2318:ed7f with SMTP id 5b1f17b1804b1-442f1ddcf8emr28595905e9.0.1747320773678;
        Thu, 15 May 2025 07:52:53 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:59f5:9ec:79d9:ffc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951a97sm75040025e9.23.2025.05.15.07.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:52:53 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 0/2] RISC-V: KVM: VCPU reset fixes
Date: Thu, 15 May 2025 16:37:24 +0200
Message-ID: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

the design still requires a discussion.

[v3 1/2] removes most of the additional changes that the KVM capability
was doing in v2.  [v3 2/2] is new and previews a general solution to the
lack of userspace control over KVM SBI.

A possible QEMU implementation for both capabilities can be seen in
https://github.com/radimkrcmar/qemu/tree/reset_fixes_v3
The next step would be to forward the HSM ecalls to QEMU.

v2: https://lore.kernel.org/kvm-riscv/20250508142842.1496099-2-rkrcmar@ventanamicro.com/
v1: https://lore.kernel.org/kvm-riscv/20250403112522.1566629-3-rkrcmar@ventanamicro.com/

Radim Krčmář (2):
  RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET
  RISC-V: KVM: add KVM_CAP_RISCV_USERSPACE_SBI

 Documentation/virt/kvm/api.rst        | 22 ++++++++++++++++++++++
 arch/riscv/include/asm/kvm_host.h     |  6 ++++++
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
 arch/riscv/kvm/vcpu.c                 | 27 ++++++++++++++-------------
 arch/riscv/kvm/vcpu_sbi.c             | 27 +++++++++++++++++++++++++--
 arch/riscv/kvm/vm.c                   | 18 ++++++++++++++++++
 include/uapi/linux/kvm.h              |  2 ++
 7 files changed, 88 insertions(+), 15 deletions(-)

-- 
2.49.0

