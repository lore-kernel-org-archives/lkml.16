Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A42D30E82C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 19:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750359986; cv=none; b=aAK7D1tabqjhM8LEU5LBaXQKdE1i0+KR0h1hQluA22EYh6BROLJu9Fw+8+zeNd+/Hg23xQTZCRIXS97wxqieCeVhtEr9unUmpOL3EA4j42MA7jMghe8tXpQ0C9ptfwP7s7qVr9LpCRw30s80/Q4SGz39pPPv98abnfFG07SvjG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750359986; c=relaxed/simple;
	bh=T0hNIRsCK2M2MzE/PBaE2VW5KEHYEkExpX66JwbnS7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qdz+EiQiToA5GC5+QJ+Z9MXN9WvefuGpxhIGdjQxecoXQbBjjyjW5t/arxfKe4AINebedHETYkRgM/mF/7lN2/ykBLIz7sg/1n+SCtLnP5kUmREGUoWudOS5Mf6Ecvbt5PMDjBClLofJI6e7XQwP1U52VKfGEEjXDN4FH3fQRaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=EmPSnUAc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="EmPSnUAc"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4535fc0485dso1470945e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750359982; x=1750964782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=87K2qhoakfF53JeK4rlXR6vDcY1jIkmy+PBKp/HhPUo=;
        b=EmPSnUAc9aPjL1+a9ZCazmKULfSNhbpKegkXyrHy9azR29LljDw9CafvdfdMXolZ/G
         4lew/V9zoCM9zGmLK9cey5yansKhsrRfOJsxncVE0w6sRD+sI7CrXLqhRblGM2JWznnO
         wNB0jh4o9rnSGxGkwat08MefDuuZnS6XlO+GKBxe00yLrV2OAKWIwPXKoFAwFV47+uRO
         9INzrru2PIWoUV3khunixUmhudZ0zeX5BW7/4u2lDRFczpcFLQ1FW67a5qtH4ZsBsjR8
         tqk1vmZCxJf0lvXoGtHnfuWEID27lTMMzitiUGPek/ObKMDjMyeBGmU+O9iEsqz7vKgF
         J0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750359982; x=1750964782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=87K2qhoakfF53JeK4rlXR6vDcY1jIkmy+PBKp/HhPUo=;
        b=s7m1V1lZeL7Nj14sgLcy7FO4z9Rh5YdIlzTe/vqBrJIMWP2s7xLzmTAw9dNubERb0V
         Z8JFXCBQaWUgJiRA7SMFyc10q5crAyHKO4Gn8czFcXHQlNs5/JSO+pb2Ty3ZdjgsXmb9
         HHT4iIgF0h+B64cuE+qEECeeBH7ziRrPV0qcZMtFczD4iAgrK6wnjYSoRB8VQaR0jhOt
         bCG82o7Bwl8c/ZgR2dFYouUM4nBZaajd9+cEYx2x6dtUirdflKhgJ4fjthrIJ0AU49Lp
         GgtvmQcabweBXpFrGiDaXuRWEOYGwVTdTg/AU2tsHdBleM6fozPAGvOmKaXdLCcIsCyx
         hLIA==
X-Gm-Message-State: AOJu0Yz1l8MS9x1p5HQmacVaZ3/SGD1kj+Id9K3W9qO9I+MxIEAPfRts
	GmdoU3XolTRkM50x/xsLfZ9Pj8t2ym2KsOpdsMIZr2z31/a99AOm97s6NlaT4MbmCBOIzjLqJzi
	4kNZLnrE=
X-Gm-Gg: ASbGncuIgOI1gcdOjnTmX0U9XaP5wjKp4VPWTF9r8DwvgYbJWNNxvzuMbRI/IsAFH9b
	kTHG5bysJr5RyGgMNjxrd7XzobXGOfaZPyxGBHKhsNDLUpCB75bVBTPNaBqzbYGezWWLimJ+R/+
	9/Ccj4KeLPFL8BCmSNd7q1qH4Ny/thRkljK+RN3cCvw+7bzQiShdoyiDks5P4S/faiai1/8+ATZ
	alAfbd7sZDKpHVHlJZXrrmv5FwZC6mBTwQmUi5O85SMIpq3GaSVoxA3z/ER3jH0z9FJXw/KnwUq
	xXEPlZ+hsIIk7erqkpmXE9PgQHFDdrl0ruoxTH0C3nNYb+VA6dn/M6tQ2Rx9ERogAdKpaw==
X-Google-Smtp-Source: AGHT+IGHS2FEM+/ajUBwZoc7AH6X2nroaxH8eTP36eWWpAAT8UgQk81cLIq1MDgLjM01+RNehsYM2A==
X-Received: by 2002:a05:600c:474f:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-4535efb8ddcmr17391955e9.8.1750359982305;
        Thu, 19 Jun 2025 12:06:22 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:5b14:46b0:5c7a:61f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb672sm2967765e9.6.2025.06.19.12.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 12:06:21 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v2 0/2] RISC-V: turn sbi_ecall into a variadic macro
Date: Thu, 19 Jun 2025 21:03:12 +0200
Message-ID: <20250619190315.2603194-1-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v2 has a completely rewritten [1/2], and fixes some missed trailing
zeroes in [2/2].  The fixes in [2/2] are important for v2, because
sbi_ecall doesn't fill the registers with zeroes anymore.

In the future, I think it would be nice to have a wrapper function for
each sbi_ecall, to make the code less error-prone.

GCC isn't doing a good job with sbi_ecall.  v2 is a bit better than v1,
because some ecall registers are not used in the assembly, but nowhere
near good enough...
The compiler doesn't consider static key'd tracepoint branches to be
special, and prepares for trace function calls outside of the unlikely
path.  Instead of a single "nop" for a tracepoint, the non-trace path
also does a lot of pointless register save/restore.
I'm looking for help with this issue in [3/2].

v2:
 * use linux/args.h [Thomas] [1/2]
 * completely rewrite [1/2]
 * remove __sbi_ecall [1/2]
 * add some missed trailing 0 in pmu [David] [2/2]
 * adapt to the new sbi_ecall that doesn't allow a single argument [2/2]

v1: https://lore.kernel.org/linux-riscv/20250612145754.2126147-2-rkrcmar@ventanamicro.com/T/#m1d441ab3de3e6d6b3b8d120b923f2e2081918a98

Radim Krčmář (3):
  RISC-V: sbi: turn sbi_ecall into variadic macro
  RISC-V: make use of variadic sbi_ecall
  RISC-V: sbi: remove sbi_ecall tracepoints

 arch/riscv/include/asm/kvm_nacl.h |  4 +--
 arch/riscv/include/asm/sbi.h      | 55 +++++++++++++++++++++++++----
 arch/riscv/include/asm/trace.h    | 36 -------------------
 arch/riscv/kernel/cpu_ops_sbi.c   |  6 ++--
 arch/riscv/kernel/paravirt.c      |  2 +-
 arch/riscv/kernel/sbi.c           | 57 ++++++++++++++-----------------
 arch/riscv/kernel/sbi_ecall.c     | 34 +-----------------
 arch/riscv/kernel/suspend.c       |  4 +--
 arch/riscv/kvm/nacl.c             |  7 ++--
 drivers/acpi/riscv/cppc.c         |  4 +--
 drivers/perf/riscv_pmu_sbi.c      | 49 +++++++++++++-------------
 11 files changed, 115 insertions(+), 143 deletions(-)

-- 
2.49.0

