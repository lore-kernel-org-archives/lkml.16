Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92561A5BB7
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748102139; cv=none; b=WLAt7FoMQ8FeZH1xJq1yY7H/SNp2Xm4+X/1Go9Hf27hd9Vn2tO2UqqU45F26DOGxTr9rjhDc1nzbhqfc0QRxg7YVOkc4kwOh3SmLtvi4IluusIZyFUyMS7VUcTAXfNwgxUI/Z0tm9tl37cVT5gvFpJnmmQ3er0OasN0xsVC4zn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748102139; c=relaxed/simple;
	bh=mw163myt7I5W/xZanH/RGCekGwcrGEHcSJq505eIhyI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jmzhC8Db1ZsFCw7hK5/LjH23aK3eI+AMO/sBkb8ML5cytaa8Mz4LuDY5CyEOlq6s4goG469Q3Pntl8PPx+M4bwubbDm/DeGuQjPeiTwBlNcPtgJKRG/wvfH7wy1RGPWzIgfiTa3Qo6X/h7AWDcNOP3jmfiVCWbxFHTAmYep5uZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtWsWBrR; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtWsWBrR"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742af848148so571332b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 08:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748102137; x=1748706937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f5NzQXNu49XBtQeENiXLHMtGN2kWzF78ktALbXii2Y0=;
        b=QtWsWBrRdQvDNR/6ZRaltr/NpR/Oa4XTBIPbft/hC+j9YyIIjMbI+x5XYvoajchpZB
         26+x/5nTMVyzXP5uFrW/wkFTB8/8jtCY/TGocQo9ic+ylb29cHegErW26XS8qFJC1aN1
         u7FxG48dc+3Mj8/zDMGDo6kyaLTwvNLuWIAO0JjdpNY57iW/UjqaLG3ndAZfUksG7Ebd
         oSl0XNGRhWHY7sjtRwxG2LjFehIT0vnh4+Wj6QZuHSfrKQj15/o7R4xwvWnkobJWvbRr
         I4KN1JR9i8syCiQZg5t0b5hJ6cG6w8jVT67mvuU6WI8i9TlPYoUcB0BoEzsSpWYT1TdO
         D02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748102137; x=1748706937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5NzQXNu49XBtQeENiXLHMtGN2kWzF78ktALbXii2Y0=;
        b=Sf4ZjbYil6/M+dqOldDrcTk9IDEWcR6sm5dsc8yqKtS/PC89mXDpyS0EZB9bvUVIcr
         M6PrimVo6VmoYcfmXleCl9i/ziBQSu3pmuncghndQQ6v7PLzDx9gSzArihDv9OVHky9U
         YWYU7eu4easq1mY3kQunzs0729DnZVIrE62xhy4fyjaY0RpGBy/lxZP6ras//WZ6GI6/
         g6v7/T3776nm8lDZzkYfm5r/mRGMXVqbdvmu6J9lTP+WnDo3ryKVvkqGfzZLyN7Vom2n
         bOlVSjZgTOJqhbr5PyCfq0arbK0YhhSUXIgir+cFGCakv2iXZ+dcL9YdvI5li9rOO3FO
         F31g==
X-Forwarded-Encrypted: i=1; AJvYcCU+1nK2HE/Vy9P/r1OtC/OlRNzdj/YTKE4+ZRjrXimx4qk4lx7TQJmaoUTF3jI8PfSc+sa67bwBiZ15XXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzkrgVQDFYHV9N4kts22EkTTOsY9Cg8h2x54rmn+zf5DLJfHEs
	bl8kiG4Fhhxztwn1VgO4jVBdVV7T8fi/+Mu6/hNDSgFftU2CsGbb8cX7
X-Gm-Gg: ASbGnctmeCwMUOX16So8O6agNc5AfWXCmvqDO2ZWHpvlf3EdKu07B2a5sRiTG1RW4mQ
	wfiimYIEANk+Y/rwiTpS/hk1PRR0GAEO/0Z73O1iKXfd9n12SzKzT4UuY9iz1IICOtIyA//aXdj
	v5FmP77q8Pk2VmVcBUM8PdRNSpxyvrQHqeA1aVmk7rK4BvdgSpZVpLbVipziYraTJWZfpi6r/rc
	Vn8JnS0b/kLNvLnKyRSt+JviZRgLXod3mAw/doYzA8aFlYmPbun7sIUzyXqWeoonAWzbz3kUGhW
	KhQNKBqGfy4+M4wOPNneI1qxcVU/3VwElODCt1Kz1kluqPfH0EgDLGf672upEI4CH7d5yUDS3ua
	uDsYgVA==
X-Google-Smtp-Source: AGHT+IHb1auLczNBxaTokKxKT8OTNVUuMgd7gpT41ZORQNU8eQ5rzK5+ef4IEIxT0hdT8elE8OmEcQ==
X-Received: by 2002:a17:903:22c6:b0:234:1df:4409 with SMTP id d9443c01a7336-23414f61b86mr49644245ad.16.1748102137007;
        Sat, 24 May 2025 08:55:37 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234396eaf62sm1200745ad.9.2025.05.24.08.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 08:55:36 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 0/3] Optimize GCD performance on RISC-V by selecting implementation at runtime
Date: Sat, 24 May 2025 23:55:16 +0800
Message-Id: <20250524155519.1142570-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation of gcd() selects between the binary GCD and
the odd-even GCD algorithm at compile time, depending on whether
CONFIG_CPU_NO_EFFICIENT_FFS is set. On platforms like RISC-V, however,
this compile-time decision can be misleading: even when the compiler
emits ctz instructions based on the assumption that they are efficient
(as is the case when CONFIG_RISCV_ISA_ZBB is enabled), the actual
hardware may lack support for the Zbb extension. In such cases, ffs()
falls back to a software implementation at runtime, making the binary
GCD algorithm significantly slower than the odd-even variant.

To address this, we introduce a static key to allow runtime selection
between the binary and odd-even GCD implementations. On RISC-V, the
kernel now checks for Zbb support during boot. If Zbb is unavailable,
the static key is disabled so that gcd() consistently uses the more
efficient odd-even algorithm in that scenario. Additionally, to further
reduce code size, we select CONFIG_CPU_NO_EFFICIENT_FFS automatically
when CONFIG_RISCV_ISA_ZBB is not enabled, avoiding compilation of the
unused binary GCD implementation entirely on systems where it would
never be executed.

This series ensures that the most efficient GCD algorithm is used in
practice and avoids compiling unnecessary code based on hardware
capabilities and kernel configuration.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

---
This series has been tested on QEMU to verify that the correct GCD
implementation is used both with and without Zbb support.

v1 -> v2:
- Use a static key to select the GCD implementation at runtime.

v1: https://lore.kernel.org/lkml/20250217013708.1932496-1-visitorckw@gmail.com/
---

Kuan-Wei Chiu (3):
  lib/math/gcd: Use static key to select implementation at runtime
  riscv: Optimize gcd() code size when CONFIG_RISCV_ISA_ZBB is disabled
  riscv: Optimize gcd() performance on RISC-V without Zbb extension

 arch/riscv/Kconfig        |  1 +
 arch/riscv/kernel/setup.c |  6 ++++++
 lib/math/gcd.c            | 25 ++++++++++++++++---------
 3 files changed, 23 insertions(+), 9 deletions(-)

-- 
2.34.1

