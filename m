Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFE01514F6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 03:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751860437; cv=none; b=oUN1C5PkDkeE9cWc/4LaukDx9IJCdInj4xb6EZ5VBjHLBu+QMYU3ajcqNWK7VvrpoBwRn5YrsCkiJvpqFBcKrNC9NHMt4LLV3K7O+EjQKTs4fUSgYBMGnDQC9vNPUzs9EHl8XtBJv1wviCSpQAgMDrcqfhW3+NL/qWGRaPsG7Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751860437; c=relaxed/simple;
	bh=L3zNIEBUJGar6s3zpXt8LnbzVSyh0BYXS9gj5vPYO3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=II0PZDTRnN32iIm4r7k8kgvvE44IAJOJw8WIRj0GMeyMPTAyvxwiB3FKMExix3BS3CtWdTO58R3EU6PaKhCpUxJCuGsYDWMEVg/bvpoyctWVi3JN7Hi9NDXqd7s8Xkh1jxg+a4LWtzO6+i5ZZqIVkrwLn8vz7O2Af4lAbrzhapc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=o1vQ2ZeV; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="o1vQ2ZeV"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so2619276a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 20:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751860435; x=1752465235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i5wHfXXQ4zEBMf9atQWdwXzfnG4mDo9qjXuqOPXqkyY=;
        b=o1vQ2ZeVy8XivPaXub0K2AIcLoF9Y2V/1dXeWO9Gs6JUQLrPrwSIU1tiAiSqcX3ByL
         GRW/J/UhJpU/y055HZcJB++dZiIfgO9c1wX/Wsxle5NPnY9fEhZz8jMYjvMx0hwW1APs
         uga8dCf1QIaMgmut3K+RqBLeNBSbaBM7lsf6ufRc3nD6HLYMnKbk3MpDSTetC+kZ49qm
         jSiKNeF8mLH1pHiUxSmzb2PlsIiQrhoulnjY58E2mKsmXcSMxztnMx1g5eRTx8X9k7m1
         HRoHR/XY4dYKgCGWpScDvUw9+JU62VH7OpmArwclySotixprTecxoJT3dvCIw+oF/tG5
         /g4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751860435; x=1752465235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5wHfXXQ4zEBMf9atQWdwXzfnG4mDo9qjXuqOPXqkyY=;
        b=N3lb3tR8finBiPKOLbuFm15UTk3451y6K/RxGLRWms8Nq/QLC32/0d90fXMC+PTtlU
         D2zkfEd4zF4HTT/r1DpDxis+Bsq4eQzJ4GKp70vfzMmJMqGNZvS6q3YtbcFbPlTxQ5Gz
         zfwXvDvLodXqdSL9rIYXDfdyJuIqhm62V26gyWtldN7TZy8/TeLyIauW3vnVhV/cy2sj
         AozETpwHLiRIX2zb9xiovKGDEDRAWDqrKtH491JdgHCnqUNg/kkCnJe7Q7QqgeOhB2Zt
         3LQ1/8szxAiYN8csuJxMgG/+gLqdqAkX+GzcSQcKZLw/iaaoQnQCUf4YE+yWy1dNz2EX
         LVGA==
X-Forwarded-Encrypted: i=1; AJvYcCXL7RTwUaL3u3OFL8dR7sMmTxBH/hemIZJKxnCXNBZg2rtXIk7Ie0VMrqng4YdvM8qJez7Ok4XVRN4jNtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN7dsFL0MZb5r4Tk2XCFdS/70PL8McBxaonXDdoz9csag3hpsb
	wa3mqFHdpaIqovzpj4mWsQTgxy4Va2fd+5ixy1og/82LTRQSac/ejoKuqvA3n4lyQqg=
X-Gm-Gg: ASbGnctrtO8MWHcD0uloTam3V2P5Xhr1Wz0eE6jSpDn0jHlogQfcAUiyUOf/c9Um4E5
	yLvY+XqJ1c7DZee7fwF5edr3e8Jo/SYI15EvYLKt3as5OLr8IIljFumaL+DV2AYvbsNtzmSmZPX
	fWzXDprtZ+dw92wNPtYAdW69xHFx3XhClNTwML6XPwCcztuqQ4ahOlOUni9E5Kq3FmXk1eOyEty
	XuYH+kk/YDkpPc6eGpu4W9WeWniQ+XzXsbIbJGW1318fGjJ85XknLwxSjfun9T1sTECPU+PHlT8
	7rPrlS3Fgqshlt2mhJwXzMW5VlmOhf27M38GtZyQDeI0uKkc9qlUZJlDnvzVjKt1gVFymzc9cy4
	OL8yzKy2mfH1YVTUSos0=
X-Google-Smtp-Source: AGHT+IH3PnAiGTyAZ+6qYrNH6yhveNJVZ6r8Z9td+wti94tqoIsXso9lzCWFTyC7yioqYXSlTSnKJw==
X-Received: by 2002:a17:90b:3c50:b0:311:d28a:73ef with SMTP id 98e67ed59e1d1-31aac447bc9mr17532339a91.10.1751860435085;
        Sun, 06 Jul 2025 20:53:55 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae80ae0sm8159137a91.21.2025.07.06.20.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 20:53:54 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Few timer and AIA fixes for KVM RISC-V
Date: Mon,  7 Jul 2025 09:23:42 +0530
Message-ID: <20250707035345.17494-1-apatel@ventanamicro.com>
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

Changes since v1:
 - Added more details about race condition in PATCH2 commit description.

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

