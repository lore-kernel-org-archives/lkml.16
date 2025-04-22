Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D454290BDA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339033; cv=none; b=LtzZcFXv30EQBrzuvJX6lrcTdiwcJf1HVQhZcR0zsi2QjwqCrwqirXxSxPzLu4H2TsuKR2GD3/HrT/92TIfGQS404HXclObVJU4umWYfWAhZSDsYLcCdjfeVZfQ7mN9WOhlugfAHKig6iHi7DBYmqFnlp4hQagzRwa/e9f6fc/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339033; c=relaxed/simple;
	bh=V1few9iADl3Jql37d2sSjWVyST8COex3O6hgsGvnL9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WSzov7rDT1Mx65RqrQ797AnQAarC8vvTmWYn27JuGNJytoArlHQrqMIQ368pnujxo5xTJ/mnIme6ZvtCCefIOJF6G5jjVO/jhzWmOGiVrm6Q7FeXILhtSKbxSU6RjhcvVPOIZQdVSPMBt+1/4K/FSgbOHom2g3Qb6RbpWK4THtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=MX8rfLpZ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="MX8rfLpZ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736b0c68092so4576406b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745339030; x=1745943830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k21lSdGFw1ABvj7WqNf9xvlJy5uS9lN5lvHH4c8/sSI=;
        b=MX8rfLpZHlPbpZJhzgmC0WuqaXi5gxGij7pWSEGOirRq98iMFMu2Hv+p4PAiluJiFi
         /HcLY6neH9zdv2SLPPxxVwaONKT+i7rGXlyYE9PTb2CmODuKukgmQPz9mGpJYS0QgJGl
         btDD2N8z6z05fNwJ++UYUr5RjcvFVMYs5OMBnjShQ2kHoznC5xLTdDfb+Dh4JUZxrVG+
         v1mheup4GYh1v0IdcyeUH6ERa8ng8Bj9v6gLdDnm81UOw1rC985JT8bYBYKOC25YTNeI
         VWI0ZUKj+APOg66+a8+R3aAoA94MwiEyoBEuW3RVayt9QIBkxOZmSXejSsjxt69qiXyM
         UrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745339030; x=1745943830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k21lSdGFw1ABvj7WqNf9xvlJy5uS9lN5lvHH4c8/sSI=;
        b=isGOBQj6/4Z3B1itM1HZBkat8XBAKgIyEktKrXyNyX/d2dwaTnaSx1UjwVgniMhYKU
         Q0l9ZbKIQvV1jmlfF6QdDum2fbRHanobZI7sZeka7bZUWfuUego3ZaVo0hokwp8l4bil
         dfO9ESrOGbxdzyalsjhOPjFQfAxEfRI+AkOy5jhoI7vGM4WXFX9bwCHqguezN6CwW69J
         gF7K1SOgkcK0QY5MhjK5kqgaGxORvxg03FGREk6plWEP1fpT/ePrlws0lJRdTeqfcpG+
         JHoD13LrEeHdTvTF4K6H9dS9z58rovRM99/sklyE/5YcpgkLbEhFUIdi2r7Hzc4wDwnv
         vZSA==
X-Forwarded-Encrypted: i=1; AJvYcCX+FnPIKPInnOL63fVjKht9GVQ8Vo5PRvkctncBJwfRUMrqn8sb7ufM/7e27XIBT89stbQ8PnB34O81a1M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1N+YsaTulQv9pPeIDUvi32gNxefRprRCJgTlRUGzbPsS9j//O
	fYz+EtSLHD/4xNJnrGr43T4BI3yCnvbawPttizPEjBkVEkQ0QXZyHrU0LqlRFBVpZ4fv2VHujsj
	A1tw=
X-Gm-Gg: ASbGncs8mo2HEONPOrqLI6YTc7M1uQuj4cF2sj6O/aDEF+3IrCXMHcKAfRSBJqxOUHf
	LTFOQsqwvAi3k84PrFP1rTplNFXDT+pdU6XPTsl5d3y72oBj29nHOj4rmmywvSWQAU9S9Qtw4X7
	ntBR9ipjxnjGVVnZOaEFI7DUcOTbyp4KJ10Nyq3zrG6A89mwIJdvnGH/jtjb1w5bLiN6o9z1B1L
	hHRDybXlhGC8pRLkwYqhIJSdOeXPz7zdZ5iXuEMC5hyZc39bFjXnhd6D+62s1UKqu04v39bftGi
	rJHTC7BdZk85SaFLs3rO5Q/dkWswJqao/l7nI631vjoeO87WKS6c
X-Google-Smtp-Source: AGHT+IGBaYB+zcFYNZod6Dyq/XeUaZqkUk/RN2FexFvjQuv/xDbjUf/BD8XILM+dfMbhssRMX5dz+g==
X-Received: by 2002:a05:6a00:b4e:b0:736:5504:e8b4 with SMTP id d2e1a72fcca58-73dc156b0c4mr22113079b3a.19.1745339030561;
        Tue, 22 Apr 2025 09:23:50 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e13e1sm8850825b3a.46.2025.04.22.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:23:49 -0700 (PDT)
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
Subject: [PATCH v2 0/5] riscv: misaligned: fix interruptible context and add tests
Date: Tue, 22 Apr 2025 18:23:07 +0200
Message-ID: <20250422162324.956065-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes misaligned access handling when in non interruptible
context by reenabling interrupts when possible. A previous commit
changed raw_copy_from_user() with copy_from_user() which enables page
faulting and thus can sleep. While correct, a warning is now triggered
due to being called in an invalid context (sleeping in
non-interruptible). This series fixes that problem by factorizing
misaligned load/store entry in a single function than reenables
interrupt if the interrupted context had interrupts enabled.
In order for misaligned handling problems to be caught sooner, add a
kselftest for all the currently supported instructions .

Note: these commits were actually part of another larger series for
misaligned request delegation but was split since it isn't directly
required.

V2:
 - Use an array of struct to simplify misaligned load/store selection
 - Revert use of irqentry_enter()/exit() to irqentry_nmi_enter() for
   kernel space.

Clément Léger (5):
  riscv: misaligned: factorize trap handling
  riscv: misaligned: enable IRQs while handling misaligned accesses
  riscv: misaligned: use get_user() instead of __get_user()
  Documentation/sysctl: add riscv to unaligned-trap supported archs
  selftests: riscv: add misaligned access testing

 Documentation/admin-guide/sysctl/kernel.rst   |   4 +-
 arch/riscv/kernel/traps.c                     |  64 +++--
 arch/riscv/kernel/traps_misaligned.c          |   2 +-
 .../selftests/riscv/misaligned/.gitignore     |   1 +
 .../selftests/riscv/misaligned/Makefile       |  12 +
 .../selftests/riscv/misaligned/common.S       |  33 +++
 .../testing/selftests/riscv/misaligned/fpu.S  | 180 +++++++++++++
 tools/testing/selftests/riscv/misaligned/gp.S | 103 +++++++
 .../selftests/riscv/misaligned/misaligned.c   | 254 ++++++++++++++++++
 9 files changed, 623 insertions(+), 30 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/misaligned/.gitignore
 create mode 100644 tools/testing/selftests/riscv/misaligned/Makefile
 create mode 100644 tools/testing/selftests/riscv/misaligned/common.S
 create mode 100644 tools/testing/selftests/riscv/misaligned/fpu.S
 create mode 100644 tools/testing/selftests/riscv/misaligned/gp.S
 create mode 100644 tools/testing/selftests/riscv/misaligned/misaligned.c

-- 
2.49.0

