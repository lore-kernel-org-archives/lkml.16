Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C932079CF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743162874; cv=none; b=p/4gBE5JulHLD9lGrv0SGsRDPnp2LdIyOes41ZXTSbOumgFlSTXcJoSTdnbwSWZDWgYFKnloBEe8bghfNOnLMyLuimHgw7362mfd5dlp3nNH29DLq3P3RlgrkIurVXo1ial5Rye3w20l+nNQFgaU3Zj208Y7ErT0yi1hlNnRcqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743162874; c=relaxed/simple;
	bh=gxjHzVo5dRsB/WMLIpxTY4qKVh4UR6lwzePWRbpIHAg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IYt0TMD+xGiPJjt/1/0hQ19Pgg4B715sOg4iy86ELI6vMAtaXdNJoXkWiNmCbIm7og63bTqYiFTw/E0BnGrH4HMINkJMNC3bgYwcfhBL0VpmIjpu9hv92ckBYm8BLWWBGxRtKm9y9638wtTRr71JEn3buqzPEr3IciIGtduFxgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=YXti83dn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YXti83dn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43948021a45so20432215e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 04:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743162870; x=1743767670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nq8SiNiOdFdszcNU99jrT9rjXqla8Cq35fKjERj5P+Q=;
        b=YXti83dnxeeZrEWOeYrCrEaqvcEG0DH5BJr2422T9YpVeEO6EtEJG418k444b3dqHX
         N44q6c+uLQulLeSPWkBT8MJcXueMrRtujkjkn63PAw/I/6/9RpsAta2+eqqGu8m18FcW
         Q9kGTM48It151F4xK4YBOU2uLgXEw6kxQj3wH3pQyuZdowA6FuPyJpuIzPsgkLEZZafd
         fnl/twj1bLHXEoLdd5BQO5x4476EqmUCgp8wXDsXscDIHFskzhR/qkvYo103m63bnr5Z
         g/EFpeVYRZTv8se1Zh1+IDAAoaghpWCAvao5nZ6/kpVs69rdamjtz+oYx3BegspWM0j0
         7LJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743162870; x=1743767670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nq8SiNiOdFdszcNU99jrT9rjXqla8Cq35fKjERj5P+Q=;
        b=P33Ux98GLpWiE9DZJqE7or/BjbMDtU0fmWJUp1xsh6f3i8qflIUuPg+6WrLN/MKXGk
         NBN/SEpMIydN0pV8fPRYa3jF+3ZBE8QzVqUm+AM0bEsqeACRr1cNjxVarPKx5ZQ4Hle3
         QFcZHjt/zVHsSM5cdbAHiLf7YhySPmnMyEhbiGqdmkclo4skF0/nY+rgQhn85hoyw/ZG
         +WzsOgTa7262hSMTTFVl+GxN0rW+lDJJpsATcHfO6nKSGu1IxMrjdZWqlo7E+MDyUu2Y
         01Yh5Zq6lzijoPxQPERqFf0/RjWSik9ig6KsZnTXpqZ3rwKz2bMeOp9qGtEQMYBt4Hjx
         ewrw==
X-Forwarded-Encrypted: i=1; AJvYcCXQeFBwsapcApP619m4YeTj4gBL6WNk/CAbKYjev4JeKG3lUc5k2rq2Gl6VKKJ6dvjmqeRtB8xL5HqS03Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVZWPQhR7HKgtb21ODVEasgoPz5n3Rk2At5DFa+IWzqdiRDWsQ
	zRMC8Vg/tmpeOw91WHzvslpHpD7Sal0MvVUKeyYfY8h0Y2w94VvTXedJpcS/Of4=
X-Gm-Gg: ASbGncu3h6dtQHWtTpK1nVZxxf7aXSVBoE9sxkxxqrMY+9cuWiStDNtqbKmbNRCgcfV
	sjLvnm9hU3pNB97tavZYbRhGmWCRk/JnGuEMdV4b3gClgdabpQklZQzGbJus91guMNechx1OLqg
	dK4vCAg4lSIZM7OEvgGLgsolJBG7/RIkc1Y9/Qj+KZPMTTWY/YCqqd43mgZIMXuQ7mSQIgy/UhR
	x81H1QIyuatVx4vfuypOUwoXb0ucMZzleZT2TiJ5ZOoVyrUYpbyuU9Dg2rrDDUoOcOB+PdQYzto
	74AeGBvVQE4IIpqkeZ40Z2j1x7Ssqkxba/uZXufHUWp4KId3xoKQlhAgLy/Ids9Axa/zMF+LLrC
	dKQ==
X-Google-Smtp-Source: AGHT+IEkWECdQf8/xfXN75gZF2L+P0bhLua+nXVm6jXHa+PKu51SnPE9OqMC2xatRrQHN0rM92gjzg==
X-Received: by 2002:a05:600c:45c8:b0:43c:fcb1:528a with SMTP id 5b1f17b1804b1-43d84f5bc0amr67401155e9.6.1743162869930;
        Fri, 28 Mar 2025 04:54:29 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([193.33.57.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d900013afsm25163605e9.36.2025.03.28.04.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 04:54:29 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: Make sure toolchain supports zba before using zba instructions
Date: Fri, 28 Mar 2025 12:54:22 +0100
Message-Id: <20250328115422.253670-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Old toolchain like gcc 8.5.0 does not support zba, so we must check that
the toolchain supports this extension before using it in the kernel.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503281836.8pntHm6I-lkp@intel.com/
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig                     | 8 ++++++++
 arch/riscv/include/asm/runtime-const.h | 5 +++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0d8def968a7e..ae6303f15b28 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -735,6 +735,14 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
 	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
 	depends on AS_HAS_OPTION_ARCH
 
+config TOOLCHAIN_HAS_ZBA
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on AS_HAS_OPTION_ARCH
+
 config RISCV_ISA_ZBA
 	bool "Zba extension support for bit manipulation instructions"
 	default y
diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index ea2e49c7149c..c07d049fdd5d 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -77,7 +77,8 @@
 	".long 1b - .\n\t"					\
 	".popsection"						\
 
-#if defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_RISCV_ISA_ZBKB)
+#if defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_TOOLCHAIN_HAS_ZBA)	\
+	&& defined(CONFIG_RISCV_ISA_ZBKB)
 #define runtime_const_ptr(sym)						\
 ({									\
 	typeof(sym) __ret, __tmp;					\
@@ -93,7 +94,7 @@
 		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
 	__ret;								\
 })
-#elif defined(CONFIG_RISCV_ISA_ZBA)
+#elif defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_TOOLCHAIN_HAS_ZBA)
 #define runtime_const_ptr(sym)						\
 ({									\
 	typeof(sym) __ret, __tmp;					\
-- 
2.39.2

