Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFA43272AD
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 22:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484484; cv=none; b=gWbdgYmGbUGlGkJD79tB17UPcpd3f7SrwHaAy7H6QsKJ90qXHQNbBh4CJZIakmo//mZBJQL5m4FoHK6hy5co4iU70R78BN8MSH3eieGufMo9ooT0h0zuVce3V9HsZzGEpbmW0DmmDrzPwaMldRp/vRjeIEksvfRomBoIQxtCQuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484484; c=relaxed/simple;
	bh=SH63EAa398WjH+FSvuZB2bNoYzHYsiDI+PFpR/dXC1c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NXv/giOdgeP8AOyF1IIpG7dj0DOf2O1A3F2WGEZJjfkpJ8Xdd3BdxduaiPKAAiMmHLcZ9R0TzwQa3NA5z+GWZ6jHScGHd5CAg3J8zSEOM+lSSm/nyTrwAyVWrqcSYxI22NtmFE+xHnCc4+RuBrOX14EVKF7h5tSHlr/1xUtRsXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yLSHZBcy; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yLSHZBcy"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736b5f9279cso4096605b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 15:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746484482; x=1747089282; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TWzvhiiRA4L8aIs/fr3zNj0LxktuObjcNO5N+h/kMdw=;
        b=yLSHZBcy35mLUiSTJn5Eg8JzFyAtYwoOtRHWb+LopRyYAJIVc77WJor/t++tW8jzqW
         bMGV8rZB6pk2kDXtdrUiTC/UrooYnKkybJ6pgUiL865iWpM6EYAVpTRmcUIXIufzq4+u
         2Gpe56pIXGGU/F+S9bsEcRmXIQAmXCZybyGQ1wD3LWYT2uGXILUpdAdQcOFVDu3CT7Dd
         VUb4sdKx7lgIi7HjVV/nm/kUKwF335FvjeohrKfUCCfucb0Mlwiazv/OBEk/O3K+mgPY
         HzUMJxLKNzU3XafZjWmL3xh+2qSET0Ry35oLUofY4X057vMXt6+mDDhAM1ZRaLRynRJz
         RVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746484482; x=1747089282;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TWzvhiiRA4L8aIs/fr3zNj0LxktuObjcNO5N+h/kMdw=;
        b=oLqc/U1PJ3mz8ZwHYhlprhiiP4r68A1gaJlVTZ3V89NJT8Odb+0sBJVA+4eAe196Fh
         mPSjFPUWj0XjgO9tbV7fmlcsmUXadB7yXJJS00bxMdlX6j7UWYgJLoq2/LAO2yYDeDu9
         0v0BriM/5tsX2X2JCfbJy6wiGc4qQc0htqAcD/8KsimWhZ8vtFLr4hfvUpphKpFTSsAt
         wjPbJUK3f4Xr3CL+pG6n2YFM9hRzjTZk1RMAG6KTEF0/9zD9qi9mH29qBAHT/yXVAM69
         oqrE+NDDENHLpGDCr0MNQKdRncWGcxX8sBLPZqlf8VLeCoh8GzjSzO4jGNpxBcCL1a0D
         YTkA==
X-Forwarded-Encrypted: i=1; AJvYcCWlv482VvVWx96K8k1JrvRJnrQn2BOZ/Pim6d881rqxrwtbCoXebQ3lke0pwIMjcUMeD4GlljYfQUwFIGw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqv9Ta1Vj4kg/raNVxYv4+oTcHmpPoLYHZaSxE1593XPz1ZD68
	4a7AkOdgr0yTs/TIqEmZyPU7ndz3jhLy70lehd55jmERpGeOU2EuzA4PhCSVteXv6gG/dicoIyt
	wk1vWM78X1BMLQMoV9cZG+8bu0A==
X-Google-Smtp-Source: AGHT+IF642o9ekk45BRGQU/RuojIgo/uuLEnnJ/ZVuZMKZbhEi9jlrvemL1lZnmFTIKLhzOuR4KmlcPhROtNl3ltMho=
X-Received: from pfmu20.prod.google.com ([2002:aa7:8394:0:b0:739:4820:6f18])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2906:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-74091a47893mr1047655b3a.15.1746484482097;
 Mon, 05 May 2025 15:34:42 -0700 (PDT)
Date: Mon,  5 May 2025 22:34:38 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751; i=samitolvanen@google.com;
 h=from:subject; bh=SH63EAa398WjH+FSvuZB2bNoYzHYsiDI+PFpR/dXC1c=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDBmSNv8OMix4ciD98wGLeXOKxGQ35ixR7L/OY6TF5Hxxz
 /71mT4WHaUsDGIcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAivY8ZGVZ5T0zpspOTr7DY
 PNdEoPa4zO1/oods3sisD7jfw9ZmuZvhn9mJ5Yd9L5w+eazwzY6GvyYyJfMPflvoFFxRv+z3vif STPwA
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505223437.3722164-4-samitolvanen@google.com>
Subject: [PATCH bpf-next v9 0/2] Support kCFI + BPF on arm64
From: Sami Tolvanen <samitolvanen@google.com>
To: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Maxwell Bland <mbland@motorola.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi folks,

These patches add KCFI types to arm64 BPF JIT output. Puranjay and
Maxwell have been working on this for some time now, but I haven't
seen any progress since June 2024, so I decided to pick up the latest
version[1] posted by Maxwell and fix the few remaining issues I
noticed. I confirmed that with these patches applied, I no longer see
CFI failures when running BPF self-tests on arm64.

[1] https://lore.kernel.org/linux-arm-kernel/ptrugmna4xb5o5lo4xislf4rlz7avdmd4pfho5fjwtjj7v422u@iqrwfrbwuxrq/

Sami

---

v9:
- Rebased to bpf-next/master to fix x86 merge conflicts.
- Fixed checkpatch warnings about Co-developed-by tags and including
  <asm/cfi.h>.
- Picked up Tested-by tags.

v8: https://lore.kernel.org/bpf/20250310222942.1988975-4-samitolvanen@google.com/
- Changed DEFINE_CFI_TYPE to use .4byte to match __CFI_TYPE.
- Changed cfi_get_func_hash() to again use get_kernel_nofault().
- Fixed a panic in bpf_jit_free() by resetting prog->bpf_func before
  calling bpf_jit_binary_pack_hdr().

---

Mark Rutland (1):
  cfi: add C CFI type macro

Puranjay Mohan (1):
  arm64/cfi,bpf: Support kCFI + BPF on arm64

 arch/arm64/include/asm/cfi.h    | 23 ++++++++++++++++++++++
 arch/arm64/kernel/alternative.c | 25 +++++++++++++++++++++++
 arch/arm64/net/bpf_jit_comp.c   | 22 ++++++++++++++++++---
 arch/riscv/kernel/cfi.c         | 35 +++------------------------------
 arch/x86/kernel/alternative.c   | 31 +++--------------------------
 include/linux/cfi_types.h       | 23 ++++++++++++++++++++++
 6 files changed, 96 insertions(+), 63 deletions(-)
 create mode 100644 arch/arm64/include/asm/cfi.h


base-commit: f263336a41da287c5aebd35be8f1e0422e49bc5c
-- 
2.49.0.967.g6a0df3ecc3-goog

