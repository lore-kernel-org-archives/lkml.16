Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDF422A4FE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708729; cv=none; b=jAEi7WQuWDfHJsqpANo/nyimiHIaP1Y/JqpZViHTJ/j/YzEl6902ab/1szwBbaMiVYjnfpMYGMAm5/fdzRWNRljTQXKIhwebHg7J9Cq1GsFpSSsXnv1m6Arqd6+yawnrLwVxM3cPncf8Ejl2BSQJx529Tlaqm2qmaQny9rcQafI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708729; c=relaxed/simple;
	bh=NT06B1X/FUUW5+CqHRQJz4Mu4vdWZmihoXCWuyZQcj8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=cJUcc6XMdT5bxJNu7PGZ9E/oNYbtMDq0KfcAwHwas38MDEkzGGvoEUybzdG7RwuZWgm4PRO9KZ+cRX2eS+W8YIUEqYtnKF3xasNZ+cAjDRUDtCkeIVQQ5Plibq024w95P7Dke5EmjR5KncGYzb6qJzubqNWI7vJkRHrQWXVeKhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Xic5zdvG; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Xic5zdvG"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a0b9303998so451578f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746708724; x=1747313524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KdVvIx+2NUw1S7/yaZTlAzKdxyvipEaCZdSyfI4dcfc=;
        b=Xic5zdvGHQhyWLtYvEb4aR6OZyoLgtBqlhBGT0ezvFbvd9qGo/fk7NVWJmCbs28YAw
         xqvi+16JclTRNxBR6o7GEqENaOlzGZNEEIF98m/rsglLkSzyW2UvkBjos8ZFyfSWgt+F
         1/VDQV8hak+Wf/HykomHlczyLeryH8fuCbQzIS7PpKQ+VAEWK4+JLVk8SbX/8dWqxEB/
         GwfaiTaQ4hItq88kRKD8QKu+hzPzXQgRTNb4ZuyCBFvcKFyTjqbHFzqqSJDtLY5fq1gA
         9wU0I1PCBqTKEZlhnrP7OldrPvVjVIprKfnjgPmChwX8qoWHRDrMYwSjKxZ6v8ndijWm
         6+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708724; x=1747313524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdVvIx+2NUw1S7/yaZTlAzKdxyvipEaCZdSyfI4dcfc=;
        b=k9j1/TwBrTENd1QFNPMyOUdpdyBFjh7CnfpL62zqzEy8IYsI2BdQVsM6f9/POdCpRC
         mvoxNjdFl5sZF0yFSf7P+XgOFyCwMap9GONlmAmOe4bTRBdWEtlFiAmkJSLw+dF17Udg
         J8p5GtitEu4kCebg2TVI5RXvovA98QXt77Qwug20TvZwLg/8CH6KYHZl7WHqLlg7HeuP
         LAk1fqO70W2VJkNggOPdaddpBh5Ic4GSaK1rT0qG7ZE1hfKpEo7kd88RL9Mq7/rEDkIG
         35NIJWmPkclw1BuqduGFLh20LnpxT0W2C3hNdTVLwc5te6wBGmLzahJPeijD93nIZ5pf
         fCjA==
X-Forwarded-Encrypted: i=1; AJvYcCVk03Q31cHfVi0EnLtv3yIf3Lk7nrjIqkDr1tsYizAPdGXRV5pHshl3+vX37FYL6ge29k5pZXUAbE63Ay0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiX9CTdj/BAX6t2KiDUNqjwS22MIJ5WfUtawQjwavi85wMMN7K
	b0W0hSL8nk3O/oxH7z9NkKLymRxE3UxlYeMiMSDmOoWjtpKHAiAqnrtHEaffOD6qPYCz5xl3cEI
	m
X-Gm-Gg: ASbGncsapF3YZLSLrkn7rEnDvt2Ry8ikQt2ZHeHV00iaQCLR1bPoA6Q9ElWcCuWvzC2
	URwkBser8HgBzPnAbC+DFFpxUFaZv6j3yNsJNXJXi0QVnTZe6qW+46qf2tSLyiO2j/66yrD8b3a
	L/3XxtZYnCJqEuRXkFRR7f0hPSjhlcXGvQnraekKMGSJ8TEVCFFDHlr6eXnNNWrx29fHDPMIvXs
	lXpWKdTa7RH5oY4eSTGTr/qOTXDgAxRm10Yky/wUekaY9eXBv6zL15llcKb5rX4dsiGr4+Zfxql
	ODi5Gv+KyfZdySJ5i4/dFx7q3d8+KMVaTVJH1VaPp/37IqEkv3M=
X-Google-Smtp-Source: AGHT+IGVKMnGQaI/zbUmSTKxGatnQCUnEpGyEkFy3V8+2H2zyIaYBb7YrCU27l4UnVxFxrTx/IplyA==
X-Received: by 2002:adf:f18f:0:b0:3a0:aeba:47d8 with SMTP id ffacd0b85a97d-3a0b994eb78mr2407869f8f.29.1746708724035;
        Thu, 08 May 2025 05:52:04 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:e3eb:2939:f761:f7f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b6c9915csm4486425f8f.29.2025.05.08.05.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:52:03 -0700 (PDT)
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
Subject: [PATCH v3 0/3] Move duplicated instructions macros into asm/insn.h
Date: Thu,  8 May 2025 14:51:59 +0200
Message-Id: <20250508125202.108613-1-alexghiti@rivosinc.com>
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

 arch/riscv/include/asm/insn.h        | 199 ++++++++++++++++++++++++---
 arch/riscv/kernel/elf_kexec.c        |   2 +-
 arch/riscv/kernel/traps_misaligned.c | 137 +-----------------
 arch/riscv/kernel/vector.c           |   2 +-
 arch/riscv/kvm/vcpu_insn.c           | 128 +----------------
 5 files changed, 181 insertions(+), 287 deletions(-)

-- 
2.39.2

