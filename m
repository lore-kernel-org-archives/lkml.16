Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC4322F745
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364739; cv=none; b=QiS/WB1+skIxUf0aoiJBgLlFO39JRXFYJYrfHtPIFKBVXPsxkAtUJqW1QYShkYeX/A7U+JxCUNZFLh/KokJ0/erdJHYDirNjDPgfr9+zzSEUgdjIlylniu0entFNfnpRoVmGYjy/+OQ9JivzukgyrhHBQCqgv/WdguTdM5X2SX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364739; c=relaxed/simple;
	bh=N+R7MYI7KzIypIdB3/ZwoQxKrlb5u9Y8qGMUtdhagXo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VcV5bSLr5ARNrNMfnREKUnLMFoquRZ22VsdmPR+rbfYP1x1sYCK2VnL07CzbBgitF2G95+2zZAfCuqPPTVHTl4EcWX4T2kdDYpuuutW1fD3qC5i+kGAOQ/OmfyLrIKUPNNfOo9iml8/Kg2sqN9wDq6TzOKXFmuXKGbE3Mcf0V4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=CzuL0Q9J; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CzuL0Q9J"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e4d235811so21187015ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364736; x=1747969536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fIGyh9W0JvoxjrKUR0AkLZUbqALah2Rv2i60UdP+uX4=;
        b=CzuL0Q9JkMa1eu4YDOFf7aPRU37LAwF+IHh0EOd4E32A3oRG2B9Lz+DyePGZ5sP5kY
         AgJgFAc361iHCZ1wc8wYmenPdQW3yrA7q2O3jld5Wx5M9pKcEsCf8wUIqSgFPgFv0VCO
         ZGAsJGS36tYY1UBBJ+9FLk7LDktDPc8WXfYqu/SKAc6tMzrevpDpxhSDkS0fESjqIz5c
         Vv9jBdZ6+En9ITIEGTbLFhvSvt8ER0DYvQ2Q0P+KrdDp2/18MDSxcQaLjq8dU4y6Ztwh
         b1dxVW0WLctYdgaYEEfab+/UkIarklqkXQhwXrnUXTYaDGp8QXUv4oWNuU/ZKInJGoC1
         MAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364736; x=1747969536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIGyh9W0JvoxjrKUR0AkLZUbqALah2Rv2i60UdP+uX4=;
        b=e8Xkdj4aAVWv4LqRbVz73aIDyAXeAgyGOoTh9utmbYgSV5p0/6lds8qdU6SqRahJev
         quh5nNNNw6TeKbSHYHmhua8L3R6pa7D3moaH+Wq3ZFEEK32s7kDGfGH6N5QmlEbAGekI
         ikD2p55FYnnOsH4/PghF0laBeD7Ql5YtnKrNDSbF0jo02kiJxqke0FZiTfTTrPNJVzwu
         PPD4hzFazcSSYFzqtGsuYPYtI6sdbCUZIzLNrW4gDSCzn6uT0daY1AF5CnOkDU/Qj8jb
         Y5CKfwN3qqy1vBhUE6Zd4uE4+BahVYlicachxFSPrQQWIjsys6kNsE9xqCYpgOKcBVh1
         lo1w==
X-Forwarded-Encrypted: i=1; AJvYcCUhNYhqlIBV62QgWLoDGyn2inAHubXFywQ+bqHOhIHv4rurkLX5H1CZ59540RPu6KG903HU/2vo3hN4tz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXQs7+wK79fhpiTAKlNYYhkLefkzw5wKoo4N96WHiOoLGCSu1L
	+lSqVrJ60PwLY2bwCUvYogT8p70gqD9K3pFIR76wdQFUPDhkur8qZjtfBK1LfIhrc9o=
X-Gm-Gg: ASbGncsbyMMseGnVXd6LzeWgZnZDFtlJP8vDJFxoUfIowIaTtSyRo2sRdIPGPi+2KOS
	oN7R4bLV8nW6HOYg/ldzDLhk5+k2n4BsaDIsyNDHNtZ3QEfMFBlpV9oYOwyw911XWTS2tKTy/0T
	fXl6CVKUKAQS1GeU+64WRuxK1KLH6/CJd8HblLGB9c0SAVaJrP10oH3M7Q1J0tLjkSNx2zZ6NTD
	VHnqd/AuQzXk8Vnwbg/2TIGzD5h+DDVs29joc1WA3JSJMEAh+uH5LbNuXQ2vTvwN2twf4AGJbMC
	sPj6FFbTaCTX0a7tbKTtUSSCMftFrSUN2e94PjDHgy0UhU8tMgFRi5WTZniJ3Gx+FCtW7vE2pUy
	gB9dPv5oMlH0=
X-Google-Smtp-Source: AGHT+IFV+4ue4pHbZ3acCvgAnlMAR5bRIjj1Ic0kd5kGB0kSO79yQHTYUTk7y+Xm+spnNhWWuTTQiQ==
X-Received: by 2002:a17:902:c951:b0:22e:421b:49ad with SMTP id d9443c01a7336-231d454e4bamr23708045ad.46.1747364736303;
        Thu, 15 May 2025 20:05:36 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:35 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH v2 00/12] riscv: Add vendor extensions support for SiFive
Date: Fri, 16 May 2025 11:02:58 +0800
Message-Id: <20250516030310.16950-1-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set adds four vendor-specific ISA extensions from SiFive:
"xsfvqmaccdod", "xsfvqmaccqoq", "xsfvfnrclipxfqf", and "xsfvfwmaccqqq".

Additionally, a new hwprobe key, RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0,
has been added to query which SiFive vendor extensions are supported on
the current platform.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>

---
Changes in v2:
 - Fixed a sparse warning
 - Link to v1: https://lore.kernel.org/r/20250418053239.4351-1-cyan.yang@sifive.com

---
Cyan Yang (12):
  dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension
    description
  riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
  riscv: hwprobe: Document SiFive xsfvqmaccdod and xsfvqmaccqoq vendor
    extensions
  riscv: hwprobe: Add SiFive vendor extension support and probe for
    xsfqmaccdod and xsfqmaccqoq
  dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
  riscv: Add SiFive xsfvfnrclipxfqf vendor extension
  riscv: hwprobe: Document SiFive xsfvfnrclipxfqf vendor extension
  riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension
  dt-bindings: riscv: Add xsfvfwmaccqqq ISA extension description
  riscv: Add SiFive xsfvfwmaccqqq vendor extension
  riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
  riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension

 Documentation/arch/riscv/hwprobe.rst          | 22 ++++++++++++++++
 .../devicetree/bindings/riscv/extensions.yaml | 25 +++++++++++++++++++
 arch/riscv/Kconfig.vendor                     | 13 ++++++++++
 arch/riscv/include/asm/hwprobe.h              |  3 ++-
 .../include/asm/vendor_extensions/sifive.h    | 16 ++++++++++++
 .../asm/vendor_extensions/sifive_hwprobe.h    | 19 ++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
 arch/riscv/include/uapi/asm/vendor/sifive.h   |  6 +++++
 arch/riscv/kernel/sys_hwprobe.c               |  5 ++++
 arch/riscv/kernel/vendor_extensions.c         | 10 ++++++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  2 ++
 arch/riscv/kernel/vendor_extensions/sifive.c  | 21 ++++++++++++++++
 .../kernel/vendor_extensions/sifive_hwprobe.c | 22 ++++++++++++++++
 13 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/sifive.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c

-- 
2.39.5 (Apple Git-154)

