Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E232828F4
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714712; cv=none; b=F8/PMmVgp4pIUXgXauQ+CRB5vCTWz6zKROpROxO1ESuAPdQbnS6DN0MfxfueS0ipT/acEcEG1ScPFskNq+TlbML/ZO1a4cHow5Kuw93uCk2VSfWu6vY0k90Jw0+LRXzAEw2ZNKe9MzmBfdIbrWFAb9I0F3HOjCH8kKYuTpwr1hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714712; c=relaxed/simple;
	bh=iUSd5zriQovA+xk3dbyKc3xJaU2/s9aca/08pvkCKbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o0+yyjRUixPlbS1ATAPBNRIgedFRwRbXpMTHcX2oJk5iOaFLEK6JmIswL1VFfD2CTiu2x+qkBtVDBA8qe8+4pTHH2cXinDZR5ZKqQAnr+q674K2HJzy94Aqb1LLfvbs71pjR0YdaMs7VBt0SsvOmef9cByv9af9Dw58z3i3lLzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=buzb7CJi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="buzb7CJi"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-441c0d42233so509055e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746714708; x=1747319508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J289PIBzAx7Tr0WnqlsEi/cyRMc03tLDH2ivRhYAjbA=;
        b=buzb7CJiqalCXS9DacOLDFhL5OKqhBpJFVYSOJKOA499sPmrREixwnweMoDIYZQv+l
         UY1McDE1bSbl8iPEqTJR2kh7plG7naOCvBarLB5GYFsxQd/EM2O/6ZHmhgETjFHvAnJI
         OmY49BHTHvoz8dY+yJ9h5z0axC0wFbvDugCiIWncQIwHp2pbM9eB8+kNyeVavFGdpAqd
         mvhI/11ktcPJ4s/uuH8wELbHX4GiaKa62YRjkzxfICzXackcEo33us4MyPA3w3hkE2iX
         I/p7pJPe7Yjjvy0JXQxE/sTh3HwmJHeE6l/ODiLqdnsqXsp+EoVreY56j86n2m6Q+pk4
         DqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714708; x=1747319508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J289PIBzAx7Tr0WnqlsEi/cyRMc03tLDH2ivRhYAjbA=;
        b=nyieSfgHqPfI2NRiuRNTvOyhCkIrR3Zi1wZsVuuYlxpJdO0Yne9mBFXuS2KLWbDyUb
         WXHZsFnpcBic9phVGKzsSoBRpAP5pRoO/g9boNnPGiqTxe3BwlxWTAPKJ4AhBLEYJi95
         fcCsu0+7DoHyO6sWa67qP5AZm+dcy1VwbG14HcnAI5lMWX5++2DtXQArcVSmgaawwsl2
         faTlnvFswJjVeeoDT/j1Juqo85ZUwaCkxTJVSTVGthM8uFfyjUigvqIPLGLyMu79Kmnm
         1ndvhdkiNEHY7d0HtcW68yCM4dxU+5oYa8SRmsTvpesYmkH0f/eomLKr7DXri1jgBXk6
         KCLw==
X-Forwarded-Encrypted: i=1; AJvYcCWEs/voKjTfgDffw18Iml9NfC0XArCexc4ex/dp4XMpjJ25PTzew2ulBQgWSqwN3tzntp3CwuBzDEUZyTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHMc5ZmWk/FVTM2S5dWJ3UCVhWTZO6U36Wxc/Eb4L5mtigYhP0
	KEzp74FOAwasRIV5JaDnM2+Jwad72JYSCxKWeYygy2m8kYxxSHNFZcpKnB2H2Us=
X-Gm-Gg: ASbGnctw95KIxKcyqS1WPrvXIW+9Hj4+dKQgnlva5fNdz/BnW+v30u2Uzbpa59xKwXX
	uSH/xZSNOdJ2giKLc69/eYYMDP7f8Ls06+D3XaxXNpykYyJvuPlfAgTawKvupec6aVaCI53vxk5
	QPi1ob/EuM1wKuQx8QGqZJzk6xjSxxXBL6cbR9q/d6AfAFrJPe4BpkF1YOWkszV7OAZ52PsBpTI
	lkbHZVWK0k4NCySTayrlvGJ7v6wNKbUulzifu7XGxirdOx3Gf4L68e0HN4U8Vo3UKiHTBD/FYJ8
	HjtGYW174JwnZG9CwW5cSAQ/TI5gScyaYyOUAXbqrolarmIX
X-Google-Smtp-Source: AGHT+IERiYDpBDm+YzS6PrcsAiPhkSZhHoyL95j9WWRBe54YT3aYnzBdh6Eog8U2+DIPfLiIAXgnoQ==
X-Received: by 2002:a05:600c:83ca:b0:441:c1ae:3340 with SMTP id 5b1f17b1804b1-441d44bcaabmr24998165e9.1.1746714708028;
        Thu, 08 May 2025 07:31:48 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:a451:a252:64ea:9a0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f331sm39844285e9.13.2025.05.08.07.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:31:47 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 0/2] VCPU reset fixes
Date: Thu,  8 May 2025 16:28:41 +0200
Message-ID: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

v2 abandons the idea of fixing current userspaces and adds a new
capability that uses MP_STATE to immediately trigger a KVM VCPU reset --
a single-purpose interface free of any unintended side effects is
desirable and MP_STATE is somewhat bendable, which avoids the need for a
new IOCTL.  It's very dirty, though, so I'm not happy with it.

I have prepared a preview QEMU implementation [1] and only did light
testing with kvm-unit-tests as I still expect a high-level discussion.

Because it didn't take much effort on top, v2 expands the goals --
userspace can now choose the same post-reset state for all VCPUs.
(This is achieved by returning from userspace on sbi_hart_stop; let me
 know if I should rather do that with another KVM capability.)

This series does not fully address the VCPU hot-unplug.
We still need a better KVM interface there, because the VCPU stopped by
sbi_hart_stop is still assumed to be present by sbi_hart_start.

I see roughly two options, with different drawbacks:
* add a new MP_STATE for the SBI HSM acceleration in KVM
* return to userspace even on sbi_hart_start and sbi_hart_get_status

(We might want to have a better interface for handing SBI in userspace
 anyway, so that could be handled later.)

v2 is based on kvm-riscv/riscv_kvm_queue, 376e3c0f8aa5 ("KVM: RISC-V:
remove unnecessary SBI reset state").

Most of the patches from v1 got merged, thanks Anup, so v2 only contains
the completely redesigned approach [2/2] and a minor code style
improvement that fell through the cracks when the patches got merged out
of order [1/2].

---
1: https://github.com/qemu/qemu/commit/dec042841f383c6a825b1642b86d9f585778a2e7

Radim Krčmář (2):
  KVM: RISC-V: reset smstateen in a better place
  RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET

 Documentation/virt/kvm/api.rst        | 15 +++++++++++
 arch/riscv/include/asm/kvm_host.h     |  3 +++
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
 arch/riscv/kvm/vcpu.c                 | 39 ++++++++++++++++-----------
 arch/riscv/kvm/vcpu_sbi.c             | 17 ++++++++++++
 arch/riscv/kvm/vcpu_sbi_hsm.c         |  7 ++++-
 arch/riscv/kvm/vcpu_sbi_system.c      |  3 ++-
 arch/riscv/kvm/vm.c                   | 13 +++++++++
 include/uapi/linux/kvm.h              |  1 +
 9 files changed, 82 insertions(+), 17 deletions(-)

-- 
2.49.0

