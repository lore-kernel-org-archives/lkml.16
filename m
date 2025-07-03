Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EEB2D3A71
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532313; cv=none; b=CHXYvAsBOWsMw//OmZYlEttSGkBSdXCVQDmF6xMl0YOgso5QouHdx+KBJ1n29LsmzcBxv/b03hNE9+oOjAehzMpcXq+bFdZZjxI0zL8IBmTxzMgnuka9T21D3NGZutFlxy4ps7s5flUDrQ81lzz1M5Ktr3aYrnd5D0cA9xdCRl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532313; c=relaxed/simple;
	bh=Z4RUc6Gbwf0nFs7S38pgF7gJ69XRpnkcl9klBzAiOQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K7bswzQqkxk5T+4C0kY/9dKQ5XScNR5cHADArMA4BoNh8RDNgkYqB1VcaiaCBDm1W6upJXzTYuBpLcKiIZAr1CeaB4neMG3QGZ7bGjPN/VlsMnqr/Sv3vTMJm13Fu1eVGrU02e1XUaGwQL1dsH4RiLj81/ZX+jm+G3eIucEC+XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lb0pWSSX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lb0pWSSX"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so8287463b3a.0;
        Thu, 03 Jul 2025 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751532311; x=1752137111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3Z107VnaAMLtYbjfxHTZ3Ws4rPY5VMWknkGImN8dII=;
        b=lb0pWSSX0T6p+GE6061wGOuB5yct9Doc11N79oT4GhJw8xAhqpvVuJRbe1hjs3JKM4
         M33z/e7LbK8SUtl6FOs5PwrKVKTCfcsfSlXzcZAJ6GA4Mib7X2YFhT3lOykYD9IrDHOB
         kzzkNyKxoJHUG+bH5cDcigMBwnnZT6aRl0L70fgPhgNjGdYkIhLprltnoYd+cdlzVcAs
         3AB5IoJcnVBHYuTlDfLWYXgUC8i1LyAIdzrSCIk/8iPFWtNWMJS6jNCFJOWhitKtkl7J
         iJs8TX2CYS8Pjht5WV03gckmSHIjgeu3TT+ZOYLkWKgCE0gNGxGsb2+MDHFUOSykNEFk
         IIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532311; x=1752137111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3Z107VnaAMLtYbjfxHTZ3Ws4rPY5VMWknkGImN8dII=;
        b=oprCFLaelvE2xJlWhyyyMfqF3dw8vrSmS572wNt27aPaI/UzRQIIZD/8J2n33l9bJ5
         4dVFQuianyDqnhJT6lRvdsDc+LJKeuOCAovWqsvB0o64xllrGQONF131CKOoBM/3LUcp
         Vb1X804HiAY8LbuTN3VTmbKnJwozdkjW4x6JI6gnn90d/otDwCMd4a/eggd6UJUrESTs
         22VwTJjestfy1S/x76deVY1y0JyBk1HXo3upUNLqnBw1mBLIdXUJ+iePuigweOgVi1Y2
         ZX8N3MsU6blxY7j6VvdoEGpdA3bDkUGIFHD80dJtMbIYK25eGOYOAyGwTqU1hGeYRx06
         S4mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZo5ezZ7Zvu8Mt4UNDiW2SCFtWf1srU4k8Pg9GEAMzIz9rZ0rObX9J1dnjtI0WJMO3CK3UiJ7UR8g4r54=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywej+OXQ8n8DI0iiLbpF8t4CrCdYv6kK1aG0NVE6kRbwmW9E3wS
	JmvLdPEJX/SXc7H4nvc2AlnYRPKUmd50lbQF2ypdqMMiUsxFDSJ0W0we1jmnkQmQlv1CtFpf
X-Gm-Gg: ASbGncuE/BBksXSblLMNcJNP80HdrYHVaEVHioo9bRVJRhkkBHg1PS5j89w/p4fd5fX
	W3ryuJsJosCLRDx1e5jmuzKrPT9gyI49j0/gSHR+6Jh8c790KZBiyDaje/jH14quKemX1QUMWbv
	SJlZQuq5tjdsqn/f5fjJeDB9LGGOfviDc3Z9hTyY09b5IDLrfOVls8EdnrUkqUEe/619llMxrlL
	FJS2v24k3oNSt4syufRM9aAREpY6gdHMXcuGNqfJNUFAPC4U0fIXuy02jKrXYEtc8mGrQOUxWcP
	R00M7s/k4t8ouqxcPg/j3RGMn+bciWVcvJv9cm2Np+Oj05EziTWLFBt31g==
X-Google-Smtp-Source: AGHT+IEnjPIE4RkD8yeyExMffXHw1vkN2HUWnhx/66EOeXkQyVnH+BLsxBWYvtQaheJO0JIaL9o5zA==
X-Received: by 2002:a05:6a21:498:b0:21a:e751:e048 with SMTP id adf61e73a8af0-222d7f086f0mr11000209637.35.1751532311182;
        Thu, 03 Jul 2025 01:45:11 -0700 (PDT)
Received: from nyaos.. ([202.212.79.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3023a11sm12982398a12.25.2025.07.03.01.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:45:10 -0700 (PDT)
From: ChenMiao <chenmiao.ku@gmail.com>
To: Linux RISCV <linux-riscv@vger.kernel.org>
Cc: chenmiao <chenmiao.ku@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE selection
Date: Thu,  3 Jul 2025 08:45:02 +0000
Message-ID: <20250703084502.394406-1-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: chenmiao <chenmiao.ku@gmail.com>

When I was reading the source code of ftrace, I learned that
ftrace has two types: static and dynamic. Initially, I planned
to prioritize reading the static source code, so I disabled
the enable dynamic option in RISCV.

[*]   Kernel Function Tracer
[ ]   Kernel Function Graph Tracer
[ ]   enable/disable function tracing dynamically (NEW)

However, when I tried to compile it, the build failed.

./include/linux/ftrace.h:190:16: error: implicit declaration of
function ‘arch_ftrace_get_regs’; did you mean ‘arch_ftrace_regs’?
[-Wimplicit-function-declaration]
  190 |         return arch_ftrace_get_regs(fregs);
      |                ^~~~~~~~~~~~~~~~~~~~
      |                arch_ftrace_regs

After comparing it with the ARM64 architecture, I found that
ARM64 automatically enables DYNAMIC_FTRACE by default once
FUNCTION_TRACER is turned on, and this cannot be set to "no".
Therefore, I believe the optional DYNAMIC_FTRACE setting in
RISC-V has a logic flaw—if FUNCTION_TRACER is enabled,
DYNAMIC_FTRACE should also be enabled, and vice versa. Moreover,
it's clear that RISC-V lacks the necessary support to successfully
compile the kernel when DYNAMIC_FTRACE is disabled.

[*]   Kernel Function Tracer
[ ]   Kernel Function Graph Tracer
-*-   enable/disable function tracing dynamically

Signed-off-by: chenmiao <chenmiao.ku@gmail.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 36061f473..f7fc8b460 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -97,6 +97,7 @@ config RISCV
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
+	select DYNAMIC_FTRACE if FUNCTION_TRACER
 	select EDAC_SUPPORT
 	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
 	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if DYNAMIC_FTRACE
-- 
2.45.2

