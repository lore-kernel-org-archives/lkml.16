Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF703284674
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749217685; cv=none; b=BG3Hsv9ygDpdTzkT2j/D23jyxiyAAq9VfLXdZJGv/VFjkxBJsIMSE2trVxGi31Vi+gyM0UAGoF86i95LgAk7a1gfCTr0QVaudT+JSdpyLr7vgRykqGfvYYnAEELYb/pWWgC1UsDTLLCC0mtLYbm8ihfe1Vej0ZzCwQKSG9xPqZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749217685; c=relaxed/simple;
	bh=z1CqVsJ1ckuC/WRsoWE2v886V0CEr2UctLIbqfChQGI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sBQ++lnxiHE0kjs6xuzLxVP1s+1q/rON0Vmp6rkBUXJ9PwnC9ttwFdZMgMETbuno+pbwNYT2g/HLe2iM+2Y8IrfJss6kcB5s3J3KlcZaXna1hDStck884JHHaNS+zS1e8sVuU0ol2TkIsM94d+7TDp9AEOI8yHFSD99IWtqsNg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpRwy4zS; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpRwy4zS"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-742c5eb7d1cso2569050b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 06:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749217683; x=1749822483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xg6qWBW9452a89D15vuiBGGJUNV9bhzosnI+08qf8bo=;
        b=UpRwy4zSgSPwyvxsLLN8dudHy4rGpFLKywaqVQbxh8LqF0BdpfblvB90XKJr0OH8wi
         Yq2t4HEOnL+Qlo/wJQ+pJRDegSdqhmxDm5Dj4HwudhE5CQgugpg0b2+quhBoBEvYQW3i
         pb5gptSDJ3ETIBZkW50okzFjpuykWtpEw7CqKOhNDZVWc1MBzU38rKo+WkWmylPNc23J
         15wVGBWAYJPAZGabBVribmorXTWi+HeSYDhVht4/OZfQHKBD/WJbiNkDsx0V3gIjluwk
         UO4oP5WdZ5G1mRMmcpqf33tefY+5eFs+fp5HlkewGG0xAjLqSc5LuVVPyByh21mCgUJ4
         iS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749217683; x=1749822483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xg6qWBW9452a89D15vuiBGGJUNV9bhzosnI+08qf8bo=;
        b=DDp5g9bepeTPV18W2c3OnfeRxSXln2iKBSC7l4CkXhRIuLaY3vTyEV3hF/pNqMAR6y
         7wRgJ3t6D/PMku7Gi2EcXVjjUWhnYecuNXtk62IuGz6o6Q9MLWzZMf+ntUHeZR2mXaUh
         tCFacCSnPSeEcZiGbRtAVXP0OgrH2yqri8EazLJhJuYHtWxAxwhk2DpV3guOldmaEYKZ
         imTPpadlg8wTI/0kzjEMXJlQKz0OsdATeKOB8h+oTn0BSLZhzIRhG5l8cAa+bVuYRL0t
         Hd5R3YHQrFQ83R7uYj3ZiXFv4CI9s2pCgzccTkvFfOq5ynqMWB7AedglV6rj3X7wea+5
         2t+w==
X-Forwarded-Encrypted: i=1; AJvYcCWKDiWTd/v8900RhDlPgPUw2P8pEOVJSdZPBVYks4n0om2O7rUpl3etVGnBuVEMGjLV6v7vjcwgc/UPt3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUjyhUUH6po5QWVmgHX6QYiwJ0RzROmgxkC3Q8QJgtIta/dxID
	WAubRB81EucoONgVhiaMtHqDZynm1WxUldHQ9tn7TAz8k0jT3lDqh8pT
X-Gm-Gg: ASbGncvw2V5ceqTB+D+3Z4iucnIJCDzTb+OGkMLhO8rDKr8skGvOh/LYJbaBDFvXkfV
	SHzvw0qqJCHzEMrR69bMs1BhmAGERH42T+FO6UqF8PB6H71Rrzph+Uw1yPr7JjE1Y22fnWPR/eK
	s1YFpASPPuTh1zifbRM/R4TdEv2D7hUCuHeU2yBfglp0l2HzPu8mMGqHD92gWRpNC8vEnuyw71L
	t/DbJpQ0kXs6NqG1Zr3MHBRW7YfihprURoxo6wiqT09vWgqjooRjRxhSv3KcZSRHZ8tQ2xFr8gp
	Ddkx+YxmBq688E+SmCLomj/Ky9xmHKkAA7eCm8L0HsxAo+taZV3uNAGfIE5ybiEfIilWL0+M5In
	MHTZMWw==
X-Google-Smtp-Source: AGHT+IGkvFTXTyoyFP5THpiFg7vz28z93vYZnhgXj37vty+QoUT/oX3Gk9XgnFYyH9xdaWnr72Cmkw==
X-Received: by 2002:a05:6a00:3cc8:b0:746:25d1:b711 with SMTP id d2e1a72fcca58-74827f159a3mr4536689b3a.17.1749217683105;
        Fri, 06 Jun 2025 06:48:03 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c1168sm1296798b3a.136.2025.06.06.06.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:48:02 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v3 0/3] Optimize GCD performance on RISC-V by selecting implementation at runtime
Date: Fri,  6 Jun 2025 21:47:55 +0800
Message-Id: <20250606134758.1308400-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation of gcd() selects between the binary GCD and
the odd-even GCD algorithm at compile time, depending on whether
CONFIG_CPU_NO_EFFICIENT_FFS is set. On platforms like RISC-V, however,
this compile-time decision can be misleading: even when the compiler
emits ctz instructions based on the assumption that they are efficient
(as is the case when CONFIG_RISCV_ISA_ZBB is enabled), the actual
hardware may lack support for the Zbb extension. In such cases, ffs()
falls back to a software implementation at runtime, making the binary
GCD algorithm significantly slower than the odd-even variant.

To address this, we introduce a static key to allow runtime selection
between the binary and odd-even GCD implementations. On RISC-V, the
kernel now checks for Zbb support during boot. If Zbb is unavailable,
the static key is disabled so that gcd() consistently uses the more
efficient odd-even algorithm in that scenario. Additionally, to further
reduce code size, we select CONFIG_CPU_NO_EFFICIENT_FFS automatically
when CONFIG_RISCV_ISA_ZBB is not enabled, avoiding compilation of the
unused binary GCD implementation entirely on systems where it would
never be executed.

This series ensures that the most efficient GCD algorithm is used in
practice and avoids compiling unnecessary code based on hardware
capabilities and kernel configuration.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

---
This series has been tested on QEMU to verify that the correct GCD
implementation is used both with and without Zbb support.

v2 -> v3:
- Drop if (!a || !b) check in binary_gcd()
- Move DECLARE_STATIC_KEY_TRUE(efficient_ffs_key) to gcd.h
v1 -> v2:
- Use a static key to select the GCD implementation at runtime.

v2: https://lore.kernel.org/lkml/20250524155519.1142570-1-visitorckw@gmail.com/
v1: https://lore.kernel.org/lkml/20250217013708.1932496-1-visitorckw@gmail.com/

Kuan-Wei Chiu (3):
  lib/math/gcd: Use static key to select implementation at runtime
  riscv: Optimize gcd() code size when CONFIG_RISCV_ISA_ZBB is disabled
  riscv: Optimize gcd() performance on RISC-V without Zbb extension

 arch/riscv/Kconfig        |  1 +
 arch/riscv/kernel/setup.c |  5 +++++
 include/linux/gcd.h       |  3 +++
 lib/math/gcd.c            | 27 +++++++++++++++------------
 4 files changed, 24 insertions(+), 12 deletions(-)

-- 
2.34.1

