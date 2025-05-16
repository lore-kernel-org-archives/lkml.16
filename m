Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FD01B87C0
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747409063; cv=none; b=ChYGB8CJvNuGEqxnGFf21zVwo9QsxK+xdmwkF0ojm3ac+VspJJbT5LB9XWsJWGaUrrYZjdSOz8PgnYnmRq3om10oDJs4RzaMxb8IA9HrG/bw3VW1LZG+OP8Tnils4768gNi+iAvybbD5LO5u9Ra2ToMkfraIn1QIvot32wER/54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747409063; c=relaxed/simple;
	bh=Elub+jSm2f43piQoAytk5CUvY6shh9w8uPbtbfPM6PU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SwqFd1HvuVD4+3nbO/dgbeoxztTUN+VBjxqXG0C2Z0jD+T3vpxSQF2av/0tDgKefeN79s/kpgspsnsHPraXVmR5yQtJ5Ckcwy7ODZj5PRfrG3vhtkF3W3YcQ5ohXuWFkciGFuOJP/IMRhmLFyv9natL9+WxmbfoRX7WgoFR7Zqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=YEfnRaL2; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YEfnRaL2"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2d54b936ad9so173784fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747409060; x=1748013860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DtOqMVpDb5beeKTmS57Q+DqCN66UUqR4O4lRAPl/Pjc=;
        b=YEfnRaL2XjnohuXiysZNm+uSQ2LfI93qXSZO+++23Ld46eyC+G5BxfsAUS6wyj8Cgq
         g8fJAThpwbvzJiUZq6xvNUWER7M7Oo9SYGiOAzUPMLzIyuREP8D1XYV/ikrXmEdNLYlQ
         RU7F1hlyA0FfE65ycuAO6yLdPsolUswpPl8DwcLV0gIwQOHbu1Y55Y41Nb9YDIqkUWPK
         LM0sbSiG7RYXEi3YgsEapGK8VwKjnkejzXUC+lK9+FZqN+ZBvsHyU+7N1NvXY3S4cFh/
         Vud4YcblGutdXZGQDE2JtJ+Y+/pOaI4cK/VONUfnRMl9OqkjUunwJdP3/42YBwRHfRcz
         6faQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747409060; x=1748013860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtOqMVpDb5beeKTmS57Q+DqCN66UUqR4O4lRAPl/Pjc=;
        b=fHfDXEqGjsFstk8wD7nUpf3uhYMZeViKRIkrKm4GJ+LZxhqf3oA/yZ4pw5ujcELqbl
         TL5xwjbIdK+o2bsCC6WtYlOM9wpVNnqce3kzUVnYWouLLqjuMUnAjMd3RHKfO3E2RlHZ
         5RkTKSypt2uq1tGhucIXV4Vm8U0L3GZVdfCze+zovKog1GNfpi+I7cKhV92kM1PXjJsB
         pzdXI8853Oa06gEEzQ2N8yPwI35eE3w5g71baHtbwW/pXN4L2rJaGmHZHiJv8o88/2Lf
         ZBlwWNnlCUngPSmjLiU9ACGU1spMBZxxOB3xh2fbQO/ZKITp751W6fhBXW4j/vY/8XAc
         KXRg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ8a/3caR1ed9Ox+scqkGtngV+6S3R/UjqMCj0qZkYTrjW1xnrmjtXqs3wwe/56kEjxfY6Z0AvbqgBOYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjZ2LhQmDQsRGiVPSXeM3hP+IlE5SizXfxvHYpQvwk1aIkkddS
	B3XyF2JWitsS2R8kr0AgsabfL39vGp3kbGgPC1wBlGjNEmVJL+shSiQwDm7drSDRJkrXINCd9+R
	nm7nZ7oY=
X-Gm-Gg: ASbGncuVdwARWC19Pn9AOl8X8Q16ZNvou0pSyo+SwsBy3PISGAPEYKqci1qA4nZVWue
	xKGr8HVfXeYCxGegNamA8JKyC5ch0WDPOaiNX0G9JSykFIMIYXKaAmQndkYAkmn12aowsMB+yxY
	nxH/72IvnPZAFiLOsSQopwCJbn0bFjtWhIgRH5FoE0STXrddn+3Z998cTiMbWLJdQVUrkbLhgMA
	hY369Xi9XUZoWYDfPl2DppBDE71DS0e6ktMTAmxoRbQcMhgO8klY6mQVFbP/oBayZWqUBMzFNL0
	PFl/EKh0jX8xwnhlZaLkP0KqKIfveGk/rgsBeXIk6N9KH/zFteqe
X-Google-Smtp-Source: AGHT+IExb77aBo1LIezbIdH98oPYn1SbELTTVMkD5q9whj7vlwOG/qOpu/YD++YYt08LeDhnPFn1Zw==
X-Received: by 2002:a05:6a00:894:b0:740:a921:f6de with SMTP id d2e1a72fcca58-742a98e9c0cmr4813351b3a.23.1747409050021;
        Fri, 16 May 2025 08:24:10 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96def68sm1666997b3a.30.2025.05.16.08.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:24:09 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH v4 0/4] riscv: add support for SBI Supervisor Software Events
Date: Fri, 16 May 2025 17:23:38 +0200
Message-ID: <20250516152355.560448-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The SBI Supervisor Software Events (SSE) extensions provides a mechanism
to inject software events from an SBI implementation to supervisor
software such that it preempts all other supervisor level traps and
interrupts. This extension is introduced by the SBI v3.0 specification[1].

Various events are defined and can be send asynchronously to supervisor
software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
as platform specific events. Events can be either local (per-hart) or
global. Events can be nested on top of each other based on priority and
can interrupt the kernel at any time.

First patch adds the SSE definitions. Second one adds support for SSE
at arch level (entry code and stack allocations) and third one at driver
level. Finally, the last patch add support for SSE events in the SBI PMU
driver. Additional testing for that part is highly welcomed since there
are a lot of possible path that needs to be exercised.

Amongst the specific points that needs to be handle is the interruption
at any point of the kernel execution and more specifically at the
beginning of exception handling. Due to the fact that the exception entry
implementation uses the SCRATCH CSR as both the current task struct and
as the temporary register to switch the stack and save register, it is
difficult to reliably get the current task struct if we get interrupted
at this specific moment (ie, it might contain 0, the task pointer or tp).
A fixup-like mechanism is not possible due to the nested nature of SSE
which makes it really hard to obtain the original interruption site. In
order to retrieve the task in a reliable manner, add an additional
__sse_entry_task per_cpu array which stores the current task. Ideally,
we would need to modify the way we retrieve/store the current task in
exception handling so that it does not depend on the place where it's
interrupted.

Contrary to pseudo NMI [2], SSE does not modifies the way interrupts are
handled and does not adds any overhead to existing code. Moreover, it
provides "true" NMI-like interrupts which can interrupt the kernel at
any time (even in exception handling). This is particularly crucial for
RAS errors which needs to be handled as fast as possible to avoid any
fault propagation.

While OpenSBI SSE support is already upstream, an additional patch is
needed for the PMU perf driver to work as expected [2].

Link: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7/riscv-sbi.pdf [1]
Link: https://github.com/rivosinc/opensbi/tree/dev/cleger/sse_pmu_irq [2]

---

Changes in v4:
 - Fix a bug when using per_cpu ptr for local event (Andrew)
 - Add sse_event_disable/enable_local()
 - Add pmu_disable/pmu_enable() to disable/enable SSE event
 - Update event ID description according to the latest spec
 - Fix comment about arguments in handle_sse()
 - Added Himanchu as a SSE reviewer
 - Used SYM_DATA_*() macros instead of hardcoded labels
 - Invoke softirqs only if not returning to kernel with irqs disabled
 - Remove invalid state check for write attribute function.
 - Remove useless bneq statement in sse_entry.S

Changes in v3:
 - Split arch/driver support
 - Fix potential register failure reporting
 - Set a few pr_err as pr_debug
 - Allow CONFIG_RISCV_SSE to be disabled
 - Fix build without CONFIG_RISCV_SSE
 - Remove fixup-like mechanism and use a per-cpu array
 - Fixed SSCRATCH being corrupted when interrupting the kernel in early
   exception path.
 - Split SSE assembly from entry.S
 - Add Himanchu SSE mask/unmask and runtime PM support.
 - Disable user memory access/floating point/vector in SSE handler
 - Rebased on master

v2: https://lore.kernel.org/linux-riscv/20240112111720.2975069-1-cleger@rivosinc.com/

Changes in v2:
 - Implemented specification v2
 - Fix various error handling cases
 - Added shadow stack support

v1: https://lore.kernel.org/linux-riscv/20231026143122.279437-1-cleger@rivosinc.com/

Clément Léger (4):
  riscv: add SBI SSE extension definitions
  riscv: add support for SBI Supervisor Software Events extension
  drivers: firmware: add riscv SSE support
  perf: RISC-V: add support for SSE event

 MAINTAINERS                          |  15 +
 arch/riscv/include/asm/asm.h         |  14 +-
 arch/riscv/include/asm/sbi.h         |  65 +++
 arch/riscv/include/asm/scs.h         |   7 +
 arch/riscv/include/asm/sse.h         |  45 ++
 arch/riscv/include/asm/switch_to.h   |  14 +
 arch/riscv/include/asm/thread_info.h |   1 +
 arch/riscv/kernel/Makefile           |   1 +
 arch/riscv/kernel/asm-offsets.c      |  12 +
 arch/riscv/kernel/sse.c              | 132 +++++
 arch/riscv/kernel/sse_entry.S        | 169 +++++++
 drivers/firmware/Kconfig             |   1 +
 drivers/firmware/Makefile            |   1 +
 drivers/firmware/riscv/Kconfig       |  15 +
 drivers/firmware/riscv/Makefile      |   3 +
 drivers/firmware/riscv/riscv_sse.c   | 696 +++++++++++++++++++++++++++
 drivers/perf/Kconfig                 |   9 +
 drivers/perf/riscv_pmu.c             |  19 +
 drivers/perf/riscv_pmu_sbi.c         |  72 ++-
 include/linux/perf/riscv_pmu.h       |   3 +
 include/linux/riscv_sse.h            |  59 +++
 21 files changed, 1340 insertions(+), 13 deletions(-)
 create mode 100644 arch/riscv/include/asm/sse.h
 create mode 100644 arch/riscv/kernel/sse.c
 create mode 100644 arch/riscv/kernel/sse_entry.S
 create mode 100644 drivers/firmware/riscv/Kconfig
 create mode 100644 drivers/firmware/riscv/Makefile
 create mode 100644 drivers/firmware/riscv/riscv_sse.c
 create mode 100644 include/linux/riscv_sse.h

-- 
2.49.0

