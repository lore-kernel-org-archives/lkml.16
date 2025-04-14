Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826D92BD5AB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634161; cv=none; b=i0Jz3/8yGvQJ17Lh7HWesVvdSgIXK8IM1vwYE8Ok+U6RQMUj2TVRrMDg8ODQ/WvTQXUG6TDcqzTcX6etbh9O2nnEsXigZUkEXL369oSEnhhQ8QfJWfIjO2GmYsy3g5T70JyBJ+tbpR4jTnfrmDOt2I2GxU2me8m30kj5HtM6qlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634161; c=relaxed/simple;
	bh=AyXNAWI0/0gE40uumDJpJdOVMNYZDU5mvwjK3PbJnn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CHAc7eSLhv4NpWucmCqQiYGlM4XFf1SNeEZTkYo7neOsvPotETm2bhoxoHehnvpNp7W2NY5U7PLOt+KsG7UFazCUjri3ISrpn7R60EsCAjmRV5SLxrhmlfKhsh+RLTbbsdnR5TKvUFBbq5ErgNs4gpAhGwcmVK+h1RXrjuSzoLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=1NE6LcXk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1NE6LcXk"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0782d787so30362185e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744634158; x=1745238958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBLPFCAF2kFHPFPqsZ7gzO7W+qircTgsDB5v3GeiCmE=;
        b=1NE6LcXkxxL3S9zlYHYBm6sE5ZWJeVpWp8+WfofbB9p758pe/xMtCdBWNKt/vL3yOK
         yMgETPtgpEHdp7oczCcBkrDtypy0wH9nEA09AC2uw2S09sEXSM7SY0VAQU//0AxtrplG
         3gZfRS6gwe8drMBzXNT1C6R9B7145R1R2IIJL+/dw7Lhfied7nS8prTNLB/yKUDSkDvs
         ZdHQEsIL9/4kARghdNYzYddQXufdwOHAsRzncWimALGUyhv9DBkiYa0v6DMtoZQsnjXM
         QXD3OIHplCfzB0nZKJuipFMAvKZFMo0XcAsIKgL2NnQEr/Y5A00kwC1bytGFgl2fBdRR
         kihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634158; x=1745238958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBLPFCAF2kFHPFPqsZ7gzO7W+qircTgsDB5v3GeiCmE=;
        b=EcUBhgyfB+H80T5qrQjnCMWv/uC5HjBwAeM779Q78OmsHYdgBjoTDjy5HvUDFTXYTK
         Iuk04CJV94p0oogpdp2znoOdHizf/VNGnd9McGlyI5VOh2c+xVjACZ665u4BAUv8/9vc
         /4hi9GAMW+Eu99vCP5m+UWT8UhaMWB56da8BScQS64CfwuUgehok1WAcRtpugcVzJY17
         L2GIefLWeed9UaqxBd+QgsX3Br0vqpJBDj2wcuF0OizL0jYygm/zB7FqxwdrufTJlnKR
         lBXbZESzb2rA1QHukELT6bw7GSNnIqKhH0x69aJKWLPnGQOX8lq+S+HJz+O4cIDu6Ycw
         fGgw==
X-Forwarded-Encrypted: i=1; AJvYcCUDzZQfp48OnPdB0oDd8jyvN0k8ojtv4Ek9W2Ki3Euwr+bD7nUlfPG+X0b2/HestavFd2MVlNYyJVfxLHY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5lYOfxldlzYKggYgw4gY8vTS4m+NXY8LDb2o37FydK/EPkfCM
	phtsAJKbCyvIa2ra1cR1EDJ2hLYwXeWvSuNEJUiG/Wt9O5V1v2yY1FSVd/15Zns=
X-Gm-Gg: ASbGncs/4Fou/40A25HUignXd3YexnvQOr+Is6RbJy5fUnptp7M5FTUQE5yqRsygCiU
	iEARrXwMSyH4pfUvHAwSbXhq3Wlmtb/sfnm7t27UUDIuePFEvrr05Cif5AOEUWa2tmK1moGpTyj
	XD2D3NWDQI9lYMz7jX7a5XF7BiknipAytb8+5t62pbB85eOB5YjxThOyEqdb9xxauSX6+DHBPru
	fNErbc2JfDursk3yXoD6cxkhT3y64h7KrmaZzDjA24iVT7t7HIymn78BDtmLaXl1Vqz/E6gNOCn
	jP2lHyr6wl+3KC51QG47KXbXR3H6Lj3RIeiAodEHdRsJ5ZxpahlR
X-Google-Smtp-Source: AGHT+IE7ESI9/ydkjbVeedcglNd5VgE6W7NzmKgufSbnzN+RWnm218oxoJgC0K2N8RXVX/uDv+F3kg==
X-Received: by 2002:a5d:5847:0:b0:391:1218:d5f7 with SMTP id ffacd0b85a97d-39eaaebebd2mr10756640f8f.40.1744634157684;
        Mon, 14 Apr 2025 05:35:57 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9780a0sm11003166f8f.50.2025.04.14.05.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:35:57 -0700 (PDT)
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
Subject: [PATCH 4/5] Documentation/sysctl: add riscv to unaligned-trap supported archs
Date: Mon, 14 Apr 2025 14:34:44 +0200
Message-ID: <20250414123543.1615478-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414123543.1615478-1-cleger@rivosinc.com>
References: <20250414123543.1615478-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

riscv supports the "unaligned-trap" sysctl variable, add it to the list
of supported architectures.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index dd49a89a62d3..a38e91c4d92c 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1595,8 +1595,8 @@ unaligned-trap
 
 On architectures where unaligned accesses cause traps, and where this
 feature is supported (``CONFIG_SYSCTL_ARCH_UNALIGN_ALLOW``; currently,
-``arc``, ``parisc`` and ``loongarch``), controls whether unaligned traps
-are caught and emulated (instead of failing).
+``arc``, ``parisc``, ``loongarch`` and ``riscv``), controls whether unaligned
+traps are caught and emulated (instead of failing).
 
 = ========================================================
 0 Do not emulate unaligned accesses.
-- 
2.49.0

