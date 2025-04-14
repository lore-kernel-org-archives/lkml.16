Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B122BE7DD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634157; cv=none; b=Xa6/5s/o++/t7UC187PGnfnxDbUBBcCt6lAcOoVCC51MOgeej1YL2VW9X2dFAoFewDaB+2WnhWBcOZEZAKAKQmelDnIodu2bYa/6Fc7VzOBujNut+PYX0WFpWUXxxa3YZIS3n7Q0wvVtQUl2aizoQe2veOYxr+IONnERybyqaLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634157; c=relaxed/simple;
	bh=2mocTyMZccQWl6hqt2SiR6urZCNyzBGg08Agjt8O9rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RlPoDylHHRn3b68qQN5TZSMX2w04JVgGsXPyj+o0w4g9v8Ia6RHJ3D7OFz/rln+HHQrvYLXj4lkk7IAOBBi0HtCJdLc0lsBZtkqw7K9SjepnyiUdEBI+ZvrMp6JV5sOXiHAy1nSUHxxN+rOaCHE+h2Ct872V3Thbh2FaGiWKWDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=nasWIn7E; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="nasWIn7E"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so44167535e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744634153; x=1745238953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQmio3wqLQnFz3mNwa+nQ7W5ScqINI2CxtaTzG1u6QU=;
        b=nasWIn7EGt5/MBjrKgbeLE+0Acn/uqcYzqxhewurgrw8Lor1bsor/mS9Owd7yYJOT4
         XfQd84eOjHJb/Ycvj5Dew0EZZ7SlO+sqF26ym+J45dZ2eN2jQdboOYeUIhG7hOjAUFtG
         KaQAi/gRVZAjgy5HKEWj/gA96KPuZi2xWl/JbFanbSMPZ+vyRrWthrduBybk3+ReNLQI
         HntP5zT5pHwIUZzDeI9Dmb/NPgbLWLGmmstmGp5pGxXlbgWutVqVSCpZl8YY1yAd7ox+
         zBeOaLGi+6iIEi/PT0xIp/JnmsvKFzYEYdK9WR7qqtcvTlc8iKtN+tIJga8G2b+/MonG
         zUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634153; x=1745238953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQmio3wqLQnFz3mNwa+nQ7W5ScqINI2CxtaTzG1u6QU=;
        b=kjRvVL65cmHyRsblLLYpaazUrlXzNZM5uoaWQSTNQjhC1Jz/kQRE7+opSNhqEpIspT
         Vw4OtwgJGBlnZkelOxo3J+FtYhIRFKqdkQQpPnT7o7Z6QzDdWhdNDz8rGy2+gPVAxIiZ
         CV70QH+WMVHBvaAqUP4ErHQbiMFWUsC7ijoi5jHePm3KfbvQdVdltKD6YdfIfWEwNKEg
         BN24I5bJmdK9TNe2CYM9xFpqSalDCO8K42JqpGyMpRvbUOlrLC41gaU77gMH5ZjeMvVC
         KNgf6fHkHUB6d2R+yl7SLjAtBsoiMFQCRc+DliTEI9BkpFLDfrKsNNeevrOhcfUHmf3D
         t+GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsNJmwQD8NOxX/jhBp5L4AtXb/V8469oINieE5Rq+TvqR79uqvN5/9KKH0giNnKLT0hrwUhEChz5J+8sI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5wcmxInP1lvzq6WGYATk5s8dmIcZb7YInLdmFj80vYdUsRDrh
	gI4ViK6do6xIfanUarUPOlfJ7hiyZ69DIL3vFyfxZgOJ9YnvNqeLazHxgpl80WM=
X-Gm-Gg: ASbGncvGSTT3q6sh/3QIwNj7pyVK7FMsHBjl3hp2s+zBrI6n6TcmdXtnQV2gfTPxKQy
	1DBWpxVOq1w2BC0zHCHhGZkszscAS8F+Qu7wtOOn1EQfNGgvRUUSB9kbYnuVcjm/cGKsNNW8I4k
	ow2+NOyynYvuj/ZMW/IrhLtlS33/9spWf5FJi5yzsj8Vx0n8iF9skpuKEIIn9IrlKe99TR5RndM
	ZUmP5volprVOe7ADQRB+PCVOJTcyHz3ymFBtmxRfTU5t8t3oGO2xxCHlh6+JwK+FxU0Rmq/OwIe
	6o+0u5y2BTcTgcLx1YRkLor9wQFOD+wO4KXKk9Ml3A==
X-Google-Smtp-Source: AGHT+IFJJtwFHDUCk/X/IbkfQRGm+JIG/6RFDceYpwEU9uYCKZDnLPKJFVJZ9lYtIGA9fiFwvtiSuQ==
X-Received: by 2002:a05:600c:348a:b0:43d:aed:f7d0 with SMTP id 5b1f17b1804b1-43f3a9be478mr93613435e9.28.1744634153055;
        Mon, 14 Apr 2025 05:35:53 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9780a0sm11003166f8f.50.2025.04.14.05.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:35:52 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 0/5] riscv: misaligned: fix interruptible context and add tests
Date: Mon, 14 Apr 2025 14:34:40 +0200
Message-ID: <20250414123543.1615478-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes misaligned access handling when in non interruptible
context by reenabling interrupts when possible. A previous commit
changed raw_copy_from_user() with copy_from_user() which enables page
faulting and thus can sleep. While correct, a warning is now triggered
due to being called in an invalid context (sleeping in
non-interruptible). This series fixes that problem by factorizing
misaligned load/store entry in a single function than reenables
interrupt if the interrupted context had interrupts enabled.
In order for misaligned handling problems to be caught sooner, add a
kselftest for all the currently supported instructions .

Note: these commits were actually part of another larger series for
misaligned request delegation but was split since it isn't directly
required.


Clément Léger (5):
  riscv: misaligned: factorize trap handling
  riscv: misaligned: enable IRQs while handling misaligned accesses
  riscv: misaligned: use get_user() instead of __get_user()
  Documentation/sysctl: add riscv to unaligned-trap supported archs
  selftests: riscv: add misaligned access testing

 Documentation/admin-guide/sysctl/kernel.rst   |   4 +-
 arch/riscv/kernel/traps.c                     |  57 ++--
 arch/riscv/kernel/traps_misaligned.c          |   2 +-
 .../selftests/riscv/misaligned/.gitignore     |   1 +
 .../selftests/riscv/misaligned/Makefile       |  12 +
 .../selftests/riscv/misaligned/common.S       |  33 +++
 .../testing/selftests/riscv/misaligned/fpu.S  | 180 +++++++++++++
 tools/testing/selftests/riscv/misaligned/gp.S | 103 +++++++
 .../selftests/riscv/misaligned/misaligned.c   | 254 ++++++++++++++++++
 9 files changed, 614 insertions(+), 32 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/misaligned/.gitignore
 create mode 100644 tools/testing/selftests/riscv/misaligned/Makefile
 create mode 100644 tools/testing/selftests/riscv/misaligned/common.S
 create mode 100644 tools/testing/selftests/riscv/misaligned/fpu.S
 create mode 100644 tools/testing/selftests/riscv/misaligned/gp.S
 create mode 100644 tools/testing/selftests/riscv/misaligned/misaligned.c

-- 
2.49.0

