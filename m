Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F691494DB
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404492; cv=none; b=LD/nb76sInv+HIau7OvguL2S2eY60+KKhk04SqcbAcOu2UBCRTnPgPupcRIt3EAJHhi5yFkAgHejHL/yTKUOB0Toz4rjvdebbfLB8nSwAm2LviEJptjdrOdVT/VJ2i3ZNMVKHU8EOSJOvOYha3iW1IW3b1tGLh+eh2j1pic7u34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404492; c=relaxed/simple;
	bh=DXpfUEqmMwiHoVPoyi3gyAWljWV8OEGPJZUtzaWkZv0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ciSs8XwlMF0j8UEmaTBVZp51S4dwxLSOouZsy6JbFxWjgYaYnjlcEvePnYYXdUqtPg6cwgS7hOPQtAOcuN4E/bBlZYl5uhNN8etcpAkgDHFK4OCobXUteFyccmTNVtgHht3s9q/QetMMI8lsszIMCHX51HxiH52cXQpHLvj9tFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yB0Sksp9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yB0Sksp9"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442f5b3c710so16400845e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747404488; x=1748009288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k/BNsmKtmxng+uJwxYfVRzr1UYXziJ1APu78MxCAAdI=;
        b=yB0Sksp9G24lEji1n0UPBCF92UhV3PWtmTBm7zeweG6J87Bu2sa2A3C2F8GrhCEN3q
         flHy4VSJs9hA+mu8M5Ee/rLYJz9YvHomDjXQciP/ilxtzE7eh4UOI7t4asxuxN9qgO1H
         c1WfU8s/eeRjEFOb5tlRTNyYAkIxBKj2rr/RkQ1DDqd9wvzN70RejjTDQn3xdy6evfmJ
         vbC8yjwhsW3e4nKGTQCXNOMQZ3sttZgn+7U+d6iBLhZpIq2jtWjZxEwlUWwjvWaLeyHU
         2vysnxWmwwkk0L83OfV7s9q3WeDf9b0C897LLmuL18Ghu+w2tQ/bgnbxk2RwzJCbuexE
         49IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747404488; x=1748009288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/BNsmKtmxng+uJwxYfVRzr1UYXziJ1APu78MxCAAdI=;
        b=dVJrk2w4d3Fhlco/jWDIN4JaZ7fQZBw14gO41D3Q5Qay+RnCFXwWyi2QULvp3fL2z1
         L1Oll/9rQG6JdPkcU/8vcYjpOIZbQTLLnvzwR2S1O8Fwbw5MscT5rOl4XaxE9AUn1NJR
         82z5SGxXqOBXMJHENjabkASZwjSVWYm4EkrP40QEeePtz9qFKtAQEsbkkrmuJ9r61WLp
         xigj7cbT2xUyiU4hd0zwTOpZoIg47jVu/RHGK6S78fDVuo9zfOPrOleOen8LrEvMq9IK
         Sw8rarEQAxy3YFP7VBQcoyntuglpPIvJzDePU3UkVO9WaPGVyvdwBTgABBeTxO1jUbR0
         kbKg==
X-Forwarded-Encrypted: i=1; AJvYcCWffEI48oFWQIanxmgDnNzZ1MEZEpUjJxb5lZdlCjSzvlSFW+UDL5OtCS9aLrIDAmqh/74ZqzLoECc9FLs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7K3ps+SKEBKHcwLQBH+Ff/FZD+pCaByBpP0AG0hYcn+oqqSAJ
	QSgj08t0ZntEVwtyagslBKCDlCMZoFwUtjYtEUFb9SCdJx/rYV/lM/dE4O1HaAzb/Mo=
X-Gm-Gg: ASbGnctuA0iY9/a77Z53bLGXsX1qLoLKyA0Zyp+fF0I0OEpxYZnmegfXTXsNikG/ev7
	CHbR/0GJhAZHz1ySBXmv4VjsU79a6ncyubSoDeBfgBOEl1lJH1ogCsmAXtuA+35RU5IlWgZRcQL
	1cg0xQ4JzuuUZNvQqVZxsyXhEZnpHdUFAK3qMn+ZoUQj3PPqka0X/hE41zwO8UWV9OCkzmvwqco
	IlfTpuqMC0Y1NVew3VlvJTYUnTlHJBl+J0vB1LJXsCrg5sK7nA2D+r+G4CxSFpzzhZIx6IBQMBc
	sJy6P6vW4Z+aaMZ70CyCISP8AZfi8vspjsXezJGJgxKdrzV0qJJlz9ApLjkExrgCW00Rx8HH
X-Google-Smtp-Source: AGHT+IGq36WEEdwcj2F1kc98tOimoY9E+6SHXs/IqyOGwvA6IL+/S0Nt0+GgQYvZ1hvDj9xey6cGow==
X-Received: by 2002:a05:600c:524d:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442fd6649bdmr38117515e9.24.1747404487692;
        Fri, 16 May 2025 07:08:07 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:b6d5:4f19:6a91:78f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e852fsm113910005e9.27.2025.05.16.07.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 07:08:07 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 0/3] Move duplicated instructions macros into asm/insn.h
Date: Fri, 16 May 2025 16:08:02 +0200
Message-Id: <20250516140805.282770-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The instructions parsing macros were duplicated and one of them had different
implementations, which is error prone.

So let's consolidate those macros in asm/insn.h.

v1: https://lore.kernel.org/linux-riscv/20250422082545.450453-1-alexghiti@rivosinc.com/
v2: https://lore.kernel.org/linux-riscv/20250508082215.88658-1-alexghiti@rivosinc.com/
v3: https://lore.kernel.org/linux-riscv/20250508125202.108613-1-alexghiti@rivosinc.com/

Changes in v4:
- Rebase on top of for-next (on top of 6.15-rc6)

Changes in v3:
- Fix patch 2 which caused build failures (linux riscv bot), but the
  patchset is exactly the same as v2

Changes in v2:
- Rebase on top of 6.15-rc5
- Add RB tags
- Define RV_X() using RV_X_mask() (Clément)
- Remove unused defines (Clément)
- Fix tabulations (Drew)

Alexandre Ghiti (3):
  riscv: Fix typo EXRACT -> EXTRACT
  riscv: Strengthen duplicate and inconsistent definition of RV_X()
  riscv: Move all duplicate insn parsing macros into asm/insn.h

 arch/riscv/include/asm/insn.h          | 206 ++++++++++++++++++++++---
 arch/riscv/kernel/machine_kexec_file.c |   2 +-
 arch/riscv/kernel/traps_misaligned.c   | 144 +----------------
 arch/riscv/kernel/vector.c             |   2 +-
 arch/riscv/kvm/vcpu_insn.c             | 128 +--------------
 5 files changed, 188 insertions(+), 294 deletions(-)

-- 
2.39.2

