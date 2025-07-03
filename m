Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44951B415F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532507; cv=none; b=mV2eSbSrAQ+P0FSrd4XLH6x07RylqDiCJkXtstbeUCwQkZ+F6HOEOhfHrxDK2m3FhY37pCRZylJOY+Mqe8K14spLj1aOnSY6WmP+SepqLify+WHprKZIG5Pl+jDDuiTfKuqXbyEqngH//ZghuhYqXBSpQg4ufsht/C0VC/2yDwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532507; c=relaxed/simple;
	bh=Z4RUc6Gbwf0nFs7S38pgF7gJ69XRpnkcl9klBzAiOQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ScUe5pGZ6Kvke19Zo7ZK1+aQe4gGk3ZU/SZn4OZkklhJqEoIIAZMmOx1RX82raKIauYrKWi/uO7oO38Fn9chKqmTpImbbTu20dt6kOMs9WFCbwTmGWUn3r2QfaKFZn3xCMbsPZqWVbRUouIdAt/0KM1TAoeYLhM3ovmDs0V0Hos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cH88g/aS; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cH88g/aS"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3122368d7c4so6375940a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751532505; x=1752137305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3Z107VnaAMLtYbjfxHTZ3Ws4rPY5VMWknkGImN8dII=;
        b=cH88g/aSjPKgsm5v1vqgHZl0SewDpPVfIQGBTI6+ZXosBjJwoRTMjFGgGlvOCMbaoK
         En+M7q1kkvsHTciFl/XZkhHFVLq6vKbSX91gjTke3p2uQIQQPMjLCf7GQBV0vjv6dr+9
         nw76AnAT+SuXD+nl/dJ9aoCOrgClcP62uAHROxNkpm0YngGqL8rW9EQdNlK1RK+RPxdG
         GlnK3IbFV/h3rKcKp2KbbS0w70Ih07S31VePEvame1rHGf3bXyMU8/MtvuhTnWpQraC4
         jYyS9ev3VZX5JycVTbIa+s9c9n/XSFzckeMKBWNGZ+jdKO9nxJ3sIW/brjS51TemWovc
         s6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532505; x=1752137305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3Z107VnaAMLtYbjfxHTZ3Ws4rPY5VMWknkGImN8dII=;
        b=uy3YPiCwX/IB6WE5kpR5wmSh5wpVsiWvNH++h3Qi1TX5aSF0MVAaUL/aq1iVFisDtV
         kvCpcNRT/yFXp71lfq9zl3EuLZN0rNXg/xGw7rFibty6XF30/VZJyN8rCL6cfRmQWhIt
         jkJoZlqXfwpwzWOkB8FPa4wbWGHQ6hl7i8hufM77xsKpGskDvgILkV6FTNlaOlaDvhG+
         63rlYnvR8oxBFIvUF3rFkyA1pMP2tDTHShwCkxZVZ5tG7OrxwgP4FqrV+eVJjmP6b1xp
         Kpg5Ro+wRPPLLARye2EWzg+aFS5YQUoXvHbMwvikgVWtcHB6PbRa8MNGkAa4thOJMVoS
         LOTw==
X-Forwarded-Encrypted: i=1; AJvYcCVtUjnUfBjR16GDBo5znw/A4hy1fk6ymumCQ01huQs7eILq3oMwaSf5uisW2kK00AOZF1quCVoKQSFdC/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YymPN3x0oNipLb8DD4CoM7P2g+6UOkCdtVf2byNqFGSHPK7C0kw
	va2Ir+ZMaf3OJP2+EdwXdhgYY8A48bjpNNdu4CzF/RpVOxX+mDsE0Myz
X-Gm-Gg: ASbGncvuTdxLWX5JgxFHUh6ll5+UocwXw5s1B9T+rOOcLVCaKgQN65M4UG797IFiqMR
	LonoDXIfqGd9cEVV0CeHMNOpN9Nhaaz+bMbCEfwuUyb6GYKLvfd0XeSkwBaqy9QdMPUTxjlf7gu
	j+chstkGwfgaxNdzAe+u1nZd0w7hSiFgrkPPeILBod069G5TTrRjSPLiZwLuzuMuUMNcSc3i2IA
	1o5PxrYUEQyeIjR0YFK3RoNn8GpFOSop/C2CgH2AuCEF7LLhyd/cCgWJZz48XVryWPlSDYVrNx7
	5nLApVbcPQAC9M1YtUYyO5h9esqEgmI3AaAG5b4N7zXN7Oj3+IvuCWTfAg==
X-Google-Smtp-Source: AGHT+IFTOtu+9aAXgOpMaoBZ0/mn07PugNdJ048Y9jIQJXy0X3cY4WnEabZiSrdDycIabLApQUg2Vw==
X-Received: by 2002:a17:90b:4d0f:b0:311:9c1f:8522 with SMTP id 98e67ed59e1d1-31a9deae29bmr2995436a91.10.1751532505321;
        Thu, 03 Jul 2025 01:48:25 -0700 (PDT)
Received: from nyaos.. ([202.212.79.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f069csm145433795ad.59.2025.07.03.01.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:48:24 -0700 (PDT)
From: ChenMiao <chenmiao.ku@gmail.com>
To: Linux RISCV <linux-riscv@lists.infradead.org>
Cc: chenmiao <chenmiao.ku@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE selection
Date: Thu,  3 Jul 2025 08:48:18 +0000
Message-ID: <20250703084818.394491-1-chenmiao.ku@gmail.com>
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

