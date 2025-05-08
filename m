Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC4122A1E4
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692543; cv=none; b=i7W6fFJywKhY94049kESQ9BSLR4tMHErhmrqvJ3YMYD4L7tFxswcSxi+0TXElVHqJQ3Ta8Z8+M92+SDCJy2dgCTPXPMoy7cX66BXX3EDSqVIbsqMPr4luDRqXIGdL35BYmQhISg4PeUvMtj1tZbZPm23TA50Rq6A08/jRH7/2qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692543; c=relaxed/simple;
	bh=32IEuUAXPJzi6W6IHpGdsA6y2xGwNiuxqo8F2Gdi/N4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=sGaSSf/7McNK9JyOCPM2WnFVE9rsf5tYJRFxv/ZPXmymo89EKMqk99NPQqy6iB4n3NEKKvkfkcMq3k9XZ2sRWT2gj2d1/b2c3TYx8cxJye8laUIGp+PYmGi3xJ9lsFZ+RF6P/SFLr/cUDoGtzZOuCSX/vu4LjSk2ic0JAtIJ2+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bzgr6yYI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bzgr6yYI"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so583632f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 01:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746692539; x=1747297339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ONdFAQ5P5cYSHok4vt/xoWp2gEIdFn3GfsMoftwXziY=;
        b=bzgr6yYIaNeAUDeD0K+lpIPqJ+Hu3BGBTbhsGcQta7P5zrsleDVU4EfTVKqqvPUDyD
         fzRSq4kMqKVWz0lH/LLpWnw1Q2CP7HVhzyrW7TQZBqh8yNhaq0rrtDFiTy+hhUpQ8kJE
         c5eCvPVkKMTHXiyyPWsr+R6jAhMQGco1BnuK3KYGuQSblFBdXs7galIcDmDYzrn/AOg1
         MdnH2CPS784m3uBBOMWa3FPQyCOAhEC2Erbu9y4jyaQkUFEjbP7HaFa2PmJ62AmgYA85
         l2rPgaKH8muqjtfcABgdGmXv+hBBUxHC0ITbrMMdDesur98ySKy8mjz9OHjw6GYkVs2K
         qQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692539; x=1747297339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONdFAQ5P5cYSHok4vt/xoWp2gEIdFn3GfsMoftwXziY=;
        b=UsEFnTu9z0ltQNw1fC4+u6T6oy4zabkc+ATUP+TzdnI1e7WoqWYlT3I3bD6rfxTFaj
         hJT1aJmSfG4cb9c7Z9SMhAZpH+7u0PmcEJEM/Wh1tlUdrNZIi+3PKdP2ph5gFOn0njXO
         dLczfMDZ3QgeBR7k1c8lbYC0/8jaZP2njLq1f6QrJO+gCFd9h0fVSYH9ngllKmadSI9s
         W07CJ05XXehvnT6izYT5WWfe9E2hwBUrlwEUemX25RxqAQkdYlA/j+0xSb7NW9KoZnbm
         TETAWm5cl6mxF93XpVMErMVIXy8lc1gtmPf5ugV7KP9r5CXhuL4SqkowBcvxYS1NJGld
         kfOw==
X-Forwarded-Encrypted: i=1; AJvYcCV2EN4sv6kSreQUcjQDhqGwb2OMgmLD8zoJo7vkqu/ssRnHgSUP1ZRFrUK4X4pKx/1gb+KgcV5bS8VqXPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAir3JubdZ+rzmmhs4nrRxIxs3v9U0km7zZLyShIKq6ZhuP9GZ
	bHwX5H/8tB0U/kjk/aBo8egkKtQsf6RgKruT6iIoNW0hPqdQvuOHEI9w4ZZ2EVU=
X-Gm-Gg: ASbGnctArXwJcSeBermGdKVkTfiuFjD54J3ohpUA3ihe5r/HS5FAX9MQRDgtZGP0B5R
	NQo33MrPWHhDatX7Y/im5Z+5JDt6stys7SehR7Gvf227Dqmx4A5othWJFrco4bytMWpPeXmehKH
	dyt2rvyXP9hWTYHR8lEoBarUnTonKjySY/tLq4dTbOjtazLsJQYqbuSaf2gNEA0PRIgrFYuvjFP
	PljHPxnMT73VLMc+ja8dMaezR2cpJBJtdVJXVHtErfTjYFXygIPyMNu3xO/WLwBtray3J7W65hp
	+zhgaXFTqWKZ58owE5QStLRl/G/xpIQjP9dKiDleX0ceJyjAUCk=
X-Google-Smtp-Source: AGHT+IG8ZUsqDihvY3hcYFCE6vFamKLpHiAoEt3SaBH65DeVtZsbz9VqIVxia3B+zR7RdSZEbZEKJA==
X-Received: by 2002:a05:6000:1acc:b0:3a0:8295:9e0f with SMTP id ffacd0b85a97d-3a0b4a186cfmr5374862f8f.54.1746692539617;
        Thu, 08 May 2025 01:22:19 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:e3eb:2939:f761:f7f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0c25sm19695125f8f.17.2025.05.08.01.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:22:19 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Move duplicated instructions macros into asm/insn.h
Date: Thu,  8 May 2025 10:22:12 +0200
Message-Id: <20250508082215.88658-1-alexghiti@rivosinc.com>
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

