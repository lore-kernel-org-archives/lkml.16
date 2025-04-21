Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BEA19AD86
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245530; cv=none; b=Eu9FUikl7JHay4r1Y+YxHgG22OiPfdxL0voilf+qd6WYo56hZQNa1hIuoOlsT2xwg/O78CkimsHtnp5FSNIyVSUoasVe1wLTE2hK1kGUJr9cZUFKDEL2vpRNsWcOvSm1AQdjt20K8OQEtEB2cNLCXgQBnV9iCBuizNQCQSROaag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245530; c=relaxed/simple;
	bh=pZ7q1/4/EyKZkDEf0rmyBdL02cWZxmNBLgqkgwyS7Xg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X4z0CZwxCbfiOIN+2dl5A6+zVBF8MbIjiAVswUP0Ob4Iv0IOp9UkwQXC9tVBMFdzAU4ODci+3X55Pot3dtVESqQ1ib472HBeMD4s6xRdxDy+vT9NXYwpEaH5s7MhJmiEU6Yt/mzPilzC3+KtyE5wxxN8r8GyxWzOuOb//1JnB9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=k/Od/A0Z; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="k/Od/A0Z"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso48624115e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745245524; x=1745850324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=toKO1sbJD3mjCZojiPpBgF8TUiCeKbxXOR8aMRMuFBs=;
        b=k/Od/A0ZohQ35gzr3NOwQ1Dy2rT9K17IsRdd33t1d149m/RqlDY47kc9D5YSdq1Wrt
         Uirhq7KsVmfvXqWY4Jl08TReYKzgLpb2a4IyuAsCmzaTr5911bghSpnYvkxm63y6D5Qo
         bA1hW4b7nZyrsCpv3Ps6EWt5PX1ABSyKjoDTwM5VCfyC0TsXt4TrzonY3tszETVHxihA
         OnIMVhTS1DXb7yeN2lsZdpI6GE/kp8Tn1bc1o/6K3x1WxdIYWGwvYkFK3ym4U2osCJ1W
         Z5+r7vgFeq7LIHKw/z6YuXkzGkTngauMP49WzT/zL/H/Lmr0r69wqkBrnbDUaFW36IDv
         wJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745245524; x=1745850324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toKO1sbJD3mjCZojiPpBgF8TUiCeKbxXOR8aMRMuFBs=;
        b=MJm2gB8CCuedI6ucSpqwy1i63PiPZ1p2U820pBxfAQEBZcE1OOARkqFAQYMFFNFWSe
         hHa/5F9Ulx5Ma31t0zG1I4JP/Lv3GEVaqNxMUo21bWFIV6pUjvmG1n6okHCOEJ80ovI7
         M4km0Itk+M+9JZlEw6YpJByxK5l9xoD0WjD8qY40DTfA+Fdk+yxWHihZ9kAhf5l3LUGk
         aqX1OckjJQsHzCgYdNxBSueBWmKBhdhvj+xO0dBicqaTr0zae7xO24oTJelBYYSg+KZt
         YhL8dAhnKG7O88hCxx/Leeg0gKcuU6HY31tAPaxfQl6ZGgK9G6izVbxpIBRW/HZjXeZH
         le7w==
X-Forwarded-Encrypted: i=1; AJvYcCXHCxIIujf4CfqpfkuZorCZ8OF6J3gpkuw3YZdMIwuJhe4GuSFTIbio2zM/3eIl3VEBDi9Xn2iAWstAYuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXTwJ8M/TmnUR9rU9Cor5NUpguqSjuimS6Qnhy1PoPUUYbBmdW
	7yd916m+Hd7SKpSZ9L3dpMeDDaskdgCA8EgG/t8IhDCk4c8+WjL4xkqMoj9lC5Q=
X-Gm-Gg: ASbGncvkRZeN4FD53YSa9Qy1Ie6SnWgHRWJhGZ7B7mhIpK8LpxCNom7H4RyZWhWYbiB
	H/tumungLxZSh7k5lP2FTY0dCqf8W+bALL9XLrZsQrw/pVWbQR3TICkpnoiSuPIn+7pVAppbZ6n
	tHau2qWy3nPcgvwiUCMZ+MznL4nDzjBKQgny137iKm1UTK6sHKSL8Zp2VBp7Hp47cxYHUsajBJ0
	2iw+K0+7LPBunJSssDypJCQmQpKBHdh+fDt4y8YZLlWqjocUFGelPMZ6Asi6K+JBJ+c92OUoF0U
	EG5u+0z8aDg+4BOP+XrbLOWCRkuSDVuAnRq8SyV0AbCCgt6GeDpsXMwL8u0=
X-Google-Smtp-Source: AGHT+IEQLqqHojl3Rtaz5jkvsm1plxH9LhG+i0zNjFhjUyPMpSA/8M2QR3ivKWaD+zb2wwThWQLuwg==
X-Received: by 2002:a05:600c:3d86:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-4406ac176dbmr116056225e9.31.1745245524159;
        Mon, 21 Apr 2025 07:25:24 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:cd58:9e76:e88c:5cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d6dfed6sm135615795e9.35.2025.04.21.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:25:23 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 0/4] riscv: Add Zicbop & prefetchw support
Date: Mon, 21 Apr 2025 16:24:37 +0200
Message-Id: <20250421142441.395849-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I found this lost series developed by Guo so here is a respin with the
comments on v2 applied.

This patch series adds Zicbop support and then enables the Linux
prefetch features.

Changelog:
V3:
 - Fix typo (Drew)
 - Split first patch (Drew)
 - Ensure that the bits [0:4] of the prefetch insns are zeroed
 - Move PREFETCHW_ASM out of ifdef (Guo)
 - Remove CBO_ prefix for prefetching insn
 - Add prefetch (Drew)

V2: https://lore.kernel.org/linux-riscv/20231231082955.16516-1-guoren@kernel.org/
 - Separate from the qspinlock series
 - Optimize coding convention with last review advice
 - Add DEFINE_INSN_S type in insn-def.h
 - Add CBO_PREFETCH_I/R/W

V1:
https://lore.kernel.org/linux-riscv/20230910082911.3378782-4-guoren@kernel.org/

Alexandre Ghiti (2):
  riscv: Introduce Zicbop instructions
  riscv: Add support for Zicbop

Guo Ren (2):
  riscv: Add ARCH_HAS_PREFETCH[W] support with Zicbop
  riscv: xchg: Prefetch the destination word for sc.w

 arch/riscv/Kconfig                  | 15 +++++++
 arch/riscv/include/asm/barrier.h    |  5 ---
 arch/riscv/include/asm/cacheflush.h |  1 +
 arch/riscv/include/asm/cmpxchg.h    |  4 +-
 arch/riscv/include/asm/hwcap.h      |  1 +
 arch/riscv/include/asm/insn-def.h   | 66 +++++++++++++++++++++++++++++
 arch/riscv/include/asm/processor.h  | 25 ++++++++++-
 arch/riscv/kernel/cpufeature.c      | 21 +++++++++
 arch/riscv/mm/cacheflush.c          | 14 ++++--
 9 files changed, 142 insertions(+), 10 deletions(-)

-- 
2.39.2

