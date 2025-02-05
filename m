Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C4422FDE1
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 01:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738718560; cv=none; b=dSJj8fRL1DkehbVz4LRTMNIqMS3PYLIEZ9m43qrUS0lFoX40JAmK1Aa+hgVkENnqejBG/QCjplT04gNTBbTHvVNBDuVT4WwnyPEnkFRCqjR2UYt2wY0BBpSDnAx/OnWlrzqyaQrTsOcAJcgkWUyBH3RPGq72KxMB7M4NfaCcQLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738718560; c=relaxed/simple;
	bh=Eua84f2QnuJ0+u1eEfH6+3KRo1p7kHINzNbKNk8bPkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FGXr0jXd+XbVVmVoH19ka+1fbDu5dqiYgSZdEwTNpvy+ehJYFs24YTreJeE4EwVznLPD9D5X9WAb+QOjX7jiTPojQje6VsqccGKsYI9A3O1xttIyi4iF0aPzy5KpjT54Xxpg2LY0KUc4qfbK/PTkDuLEjGNFPAT5E4en/TnLdwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yh9HGE2P; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yh9HGE2P"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21634338cfdso54759245ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 17:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718558; x=1739323358; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LN1OOVFFK55bIQe9Bj7KSCICvDpdODqLxcVYOIQy28=;
        b=yh9HGE2PmGhs3vPFLuK0ah3bVl3T0btdW7r6q6h6uZGjsfPB+9lNxREJD16fn/C4ti
         /lfSsDK/C6BXRmjQbXhUH/HEFEs3zqm0Q8eH2Du+sptKO8K7I5t/aD+LCEOW2ak8KNkf
         kce/6VmvX7J7xml0QySq8yqEJUcwUUkKTR1mnyfpuwiT6Hm3sJ/rx7WHjIEIVO0dksNQ
         DytfPyFsljpIcc4KGM2jJlFazeYrFM7/e+N4/CcceSM7YyfkwDGr+P1C7AWRHVX8Ro/O
         wOJeUe/QJSe5oYGjcvC8O+WV6qCcc6p8HcqaYVUWppRArAuDb2LHXeULtExCRRsMJr9Z
         r1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718558; x=1739323358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LN1OOVFFK55bIQe9Bj7KSCICvDpdODqLxcVYOIQy28=;
        b=SMVpLBbFGTlCC43SXAp7CYOXLeB9ID8cwi1qySnHdrsGZ6R8ELtnA3TWowYbX8as+j
         BxEicFMaT+5TKt0JmQqSdPlghtb3AC3JaJ0lQtRvZNpiFPMXg1HVKWULBUOBkg/MNrpD
         lfi2Go5PmCHA1uM53qXzyb7mOQrI2I/W/dMQUwvBeIoiuepcwI+HXjSE5q8a97Ac3pyp
         G8iTvyeq58g5/QC2nlC8DzoexBGrglltOrCp1wZoCkduHfhyb0vU7Wir64CvLaZH9xV/
         uBFuFnU6OmIn5LHuvEuE3DytjICCl/i3r0sDaz6pg4WHPebLCT+sX9xGeiR6oqfGMTwX
         GZVg==
X-Gm-Message-State: AOJu0YxyQgoGkHmTWrbb1W5g2M7F2cmPEKbjsgjChcV4bVYpuemLGN/+
	KG2Qj0XSyI7ABsae/n7BG4IBadThPWoA6VzpVZu+U/+T3VDc1ksGkTdf06OLueU=
X-Gm-Gg: ASbGncveLaQIy5uG04ZU4k9CrzdeoIY4UWg6jF+2yX6RaLk2FK/YhhAcrKauCd0wEaX
	V5k980j+UYK+x+ytiSJCRMMHgnjh28aOcwiZAwwUS2mkQp/RJ0aq15fRCah0DzVQoxrBC+og2f1
	wuTNxN5r1x0qcn/HHoYlu/C16Fa7mbTd5Rwz2PdVE0w17i5PTVdwrkZGvNUcJM/f3I92EdSYFSL
	t9TPi1ej3H8XF9OK9wOAak1c11dRvimlYYzqejstafHwRuOFvP0vHxyMNsgvjY5zDCLM74tvXar
	5XrMZPayeHfNQbBoNlZk7+J8bw==
X-Google-Smtp-Source: AGHT+IEz0qHgqun1HMRAWwYPxj4lEXbUX4lq/KHX/YPS8k5v/b/oBuAj+3XdSaG2F4SQ1olAiHNptg==
X-Received: by 2002:a05:6a20:6f09:b0:1e1:ca25:8da3 with SMTP id adf61e73a8af0-1ede8845f6amr1551216637.20.1738718557822;
        Tue, 04 Feb 2025 17:22:37 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:37 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:22:10 -0800
Subject: [PATCH v9 23/26] riscv: create a config for shadow stack and
 landing pad instr support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-v5_user_cfi_series-v9-23-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

This patch creates a config for shadow stack support and landing pad instr
support. Shadow stack support and landing instr support can be enabled by
selecting `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires
up path to enumerate CPU support and if cpu support exists, kernel will
support cpu assisted user mode cfi.

If CONFIG_RISCV_USER_CFI is selected, select `ARCH_USES_HIGH_VMA_FLAGS`,
`ARCH_HAS_USER_SHADOW_STACK` and DYNAMIC_SIGFRAME for riscv.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..0a2e50f056e8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -250,6 +250,26 @@ config ARCH_HAS_BROKEN_DWARF5
 	# https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77
 	depends on LD_IS_LLD && LLD_VERSION < 180000
 
+config RISCV_USER_CFI
+	def_bool y
+	bool "riscv userspace control flow integrity"
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
+	depends on RISCV_ALTERNATIVE
+	select ARCH_HAS_USER_SHADOW_STACK
+	select ARCH_USES_HIGH_VMA_FLAGS
+	select DYNAMIC_SIGFRAME
+	help
+	  Provides CPU assisted control flow integrity to userspace tasks.
+	  Control flow integrity is provided by implementing shadow stack for
+	  backward edge and indirect branch tracking for forward edge in program.
+	  Shadow stack protection is a hardware feature that detects function
+	  return address corruption. This helps mitigate ROP attacks.
+	  Indirect branch tracking enforces that all indirect branches must land
+	  on a landing pad instruction else CPU will fault. This mitigates against
+	  JOP / COP attacks. Applications must be enabled to use it, and old user-
+	  space does not get protection "for free".
+	  default y
+
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8

-- 
2.34.1

