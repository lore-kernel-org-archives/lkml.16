Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5058216F8E9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643531; cv=none; b=A5FG35DG4PLmsiLJztOYc4GUMBp58XRBmwloP0oiE0WIfjHeKJ4qEutTx/OpNQe/ijqJrkG+yoHGaJ/sRDHkYxkLBtPebpjuJDSW7VHoPJTScED+0JWpM1E53kEBreN54Y0xK5zMR59Uuur0iQrxuHLq+6sBd1ZyBLbhgui0oYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643531; c=relaxed/simple;
	bh=U+nb8Prm9jbvIa4V3r3B7Mc4wIjR+TJy9ILGIET1irc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BCXn/AEKfgs7Q2WWLP4yixJpKvbQcOu1Zw696LADwPoNw7lCITHrUmX84AI+E60XCylK1wocNniPHlywEojFDWoRTfBu+ejfjFlrlhi+zoyvmEGl6dL9GlZHbCC0aoAk9isYhI7OfGJ6mIEkRQwxaUvBdyMHrVueLt5Lna/9KF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=R4y/NarH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="R4y/NarH"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23aeac7d77aso9991545ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751643529; x=1752248329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CcyVISN67taC6h/BgRmPM88r/wN68xhaL4uppVs0AxI=;
        b=R4y/NarHmfq04wjTJNIztowTtO2zOTbTbtz/xHIqvePZ3jqjgA8qTDB9wjBvFe8VVc
         mMqbCPFnDlp7hoqhZHSF1MDawJQQstiQRAqTvteNXwepvYMGO5rmS7WKP3F3Dkj7kUhm
         CKdc8chMH1GnQkDVCD+EjOtfsPbv2y4i7IkmgdFOcKm1OT9b27HcYcIt/8tzaBwbuXGw
         1Xkg7MP1mklFJmvfkZNRtouweijWwsA95Z0Lq4Tma23/zXSyRGOcLX9if3bBx5PWVe8x
         Y4Ulzz1JjBe2lfEdaGrem65Hlfk3OPWnAWIZ5IY/ouK+Dwlh7YXBzk6gnkxVA8H/aDDl
         4gBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643529; x=1752248329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcyVISN67taC6h/BgRmPM88r/wN68xhaL4uppVs0AxI=;
        b=SUu8/c5vXAryoZiQuPpb/57HpEvDQXUdP+fiew63GIFXEe/bbPepERn34DzWDe67j7
         p9nDuG9YtfjW44/Pws/0Ej6CXBxJzz6D/nUh/0Bm53Wo5v48hiG3ER5ePDOdBanCu15a
         +5F72MrZROq1E1p8EuGsMhwqV3cSAxKFXH2jb8BPKUp0p6Wv9INrO8mWIaXW2LMcIPCr
         GVkiA8pR71ZUiP8jNVA5MRijTarvgM9Whgv2c4iR0M87hQfqQr+i40LDURLs4FFncx0n
         FOVyb0RNyf82S8qX5NXXIm20PvQ/ass3uC1B1SSk7/OTWmc32CJOFUqD6o7KdufLlfVw
         ctMw==
X-Forwarded-Encrypted: i=1; AJvYcCWXI0tLhkjjZzV2Nb/M5jYFdIEPN4svHrbpJ5V4lwaBIjN+Kne1m0gdRrWDfHFdqR13/di80XyHotDNNj8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpv6Fald0ppOLq04ijiNDQwL/0Cd7YTONFMgScgwecWBw/Sz53
	F8bO5gwsB5Yonhp+klirxFgFxqlsw7zNJEt/P0WuvYXLk6JQ+TqApSPiOCE4SFD93VE=
X-Gm-Gg: ASbGncsvL15C1K7j7kABnbq0qf6AEAm8ok2Cae/CHf+f3pE5cAb8kbQUNqHKDD3ZBNG
	+4fj17kfnWV1fWVdDOFaZ6M+WyhSYOr323VtE4nu6VnNf1Cq4/uK7YDL+eiQW55GjzChfA+qXbt
	onJ70+GVolaadjR51uwndoiwS8ZqnV87p7LNg92k9Cg6fZCYOIVIY0/Ieb9IZwU1l84cfkpUbeK
	ojlxEiSxBrUhUhTJTYLX8iZkfPlz5NlempuFnvev5R/e/desi6kHCC5hj62vSfJEUQhSZX+hpYT
	OJY5Epxe7rPQuVrrvVhwwbpxBSO23zeNvunA1YbyPw5ublR6U3eO//qxqdaCGzAB+o4XFlPMl9n
	vpNkWyPepupgppmc+EQP5vU+8Uv7hVw==
X-Google-Smtp-Source: AGHT+IHCoNM/FN2r7kAw4r3sBqbkqR7ZPm3zgW5FYxH7kU0oFHIRlx/vujAnKCk/T1gpdC5+o539qA==
X-Received: by 2002:a17:902:ebc6:b0:231:e331:b7df with SMTP id d9443c01a7336-23c8624cbeemr60131625ad.29.1751643529473;
        Fri, 04 Jul 2025 08:38:49 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee63003bsm2084818a12.62.2025.07.04.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:38:49 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/2] Few timer and AIA fixes for KVM RISC-V
Date: Fri,  4 Jul 2025 21:08:36 +0530
Message-ID: <20250704153838.6575-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RISC-V Privileged specificaiton says the following: "WFI is also
required to resume execution for locally enabled interrupts pending
at any privilege level, regardless of the global interrupt enable at
each privilege level."

Based on the above, if there is pending VS-timer interrupt when the
host (aka HS-mode) executes WFI then such a WFI will simply become NOP
and not do anything. This result in QEMU RISC-V consuming a lot of CPU
time on the x86 machine where it is running. The PATCH1 solves this
issue by adding appropriate cleanup in KVM RISC-V timer virtualization.

As a result PATCH1, race conditions in updating HGEI[E|P] CSRs when a
VCPU is moved from one host CPU to another are being observed on QEMU
so the PATCH2 tries to minimize the chances of these race conditions.

Anup Patel (2):
  RISC-V: KVM: Disable vstimecmp before exiting to user-space
  RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization

 arch/riscv/include/asm/kvm_aia.h |  4 ++-
 arch/riscv/kvm/aia.c             | 51 +++++---------------------------
 arch/riscv/kvm/aia_imsic.c       | 45 ++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c            |  2 --
 arch/riscv/kvm/vcpu_timer.c      | 16 ++++++++++
 5 files changed, 71 insertions(+), 47 deletions(-)

-- 
2.43.0

