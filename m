Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DC9191
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819746; cv=none; b=rtZG2Hu6rffG/9VTEHkADARtlziAmGn0JtaH50zzXC5Glc/cL0F3vM0Wam7MW8a8ct73gO7adfYEb4qM0RyIDXoWo5sC+AM4tuh92aNz8+ACsc08N5wMHceTZLHaQMrOAGlgXP6hNwuFRHLtznBADmyfJTQyf0ccVcZ0TqODK3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819746; c=relaxed/simple;
	bh=cEBWMBZiaKzB6xZ/YB/x5oUExde+F/u2KrlqXnVNLOE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ku4bpiptSFvUYydwBq7g6j+oOyWwhwP9/G5NDAzjeQneKJil/8HVt7cz/Wdc0D8lI0FOe2g1QT9AzJczHlzapfwiX8YZjI0/WYlem1nrmyon7n+1CaOCdFGDKYvFQp7JOtk2WYUHP9qgcmJ+bhpYYnW9+8GY68tc0LdBIkjHgqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TGz/NDuO; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TGz/NDuO"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5e5cd9f3f7aso6669812a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744819743; x=1745424543; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mfba1GeK9GMLIuK10iqBPbEuuHDYdzYb65zyVJOFXLI=;
        b=TGz/NDuONzJaPnTLC+VVWP33V0q1l3xkWl0VdEk0jJfT5OIOVh7ai3Y+upXekQONZ8
         RnmlLyShct5xsn+5q5n3LboHZMP2qFSfjGqSD10xK+ffEoSmrxlXACFRS4/Loc2WE4zY
         UpO2Fm0reVdE3tCjWz3MlLcu0+zRMH9psL+/EZvgWMjOvZQfKykCmgrVXpGWXK9Goyik
         zIyjqGf4O1LjpnNIwnh+jaNwPSBriiZTbdhVMtUkugOuYLlHJSZE8N5trPFGpif8fjzO
         gUDD7waTed93fQMbj9zlq//DrTdan+H8DY/+zYkxtkg2Jwh32HoPY5T1tAFEBiSb16cL
         f/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819743; x=1745424543;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mfba1GeK9GMLIuK10iqBPbEuuHDYdzYb65zyVJOFXLI=;
        b=nTGqjjnlUUEjZtFzvvqmYHebs8JvKdgJiN0Z5PvFEhpkyC8yoy+ElviHkEWESYbLXD
         Tb5OWoAxtQdwyU1lLz1kJYfl4v1B98w4XI4R1v+F/TcGEivLimimgJBinVZAlY4F5iUy
         wA/iLIWLDoWCspwE6OKQaEiPquV7dTW3OQHtoUIW0tH00uvjV+kaKeunfCNZsALp3ZKU
         uuywyMtIgVBatMeakIz5fV++nwvda4cLnoNd665qf3Wtj7+b5qCfOG7jsZqe/wNnkN3c
         7MSTYmBrSfYiTR9ospXkM1sfE8uJvGD3XxW427+SPAze+hCZm7zaJuE41wTu4Y336NSe
         LtiA==
X-Forwarded-Encrypted: i=1; AJvYcCUjm/hJL5eLbAMA6WBcj5YeARPPD5tqn+AiOvNUx7HZDTwAN3NcysN8+NrIRrnOmRWEVdV18f7A/xjFGy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE/EFqCFMqzKRDwIRK6qKAzw5OiyF0QxjUvUVFqxcWdlSwSsVO
	PGZB8sxUpaB6OgoYfE/hpDOoLOv9FKuAs6rwXHJBt9iUfPdLSSN2sP4CQ0M6wSH86US+d8jvx5M
	ql7STyw==
X-Google-Smtp-Source: AGHT+IFrirfEQ7dHJWyLJg2ZMILHkZARW2nYQJNuhY9BP7hpLfrguWr31PwCDRv8rbgrpnP6p/6BoAlGjXT/
X-Received: from edud12.prod.google.com ([2002:a05:6402:c:b0:5e4:d4fc:4841])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:27c9:b0:5e4:9726:7779
 with SMTP id 4fb4d7f45d1cf-5f4b71ea77emr2046677a12.2.1744819742333; Wed, 16
 Apr 2025 09:09:02 -0700 (PDT)
Date: Wed, 16 Apr 2025 16:08:56 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416160900.3078417-1-qperret@google.com>
Subject: [PATCH v3 0/4] Selftest for pKVM ownership transitions
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

This is the v3 of the pKVM selftest series, v2 was here [1]. This series
depends on [2] which moves the hyp tracking to the vmemmap. A full
stack on top of v6.15-rc2 with everything applied is available here:

    https://android-kvm.googlesource.com/linux qperret/pkvm-selftest-v3

Changes since v2:
 - rebased on top of v2 of the hyp-state-in-vmemmap series [2];
 - thanks to above rebase, dropped the PKVM_SELFTEST kconfig option and
   folded the selftest under the existing NVHE_EL2_DEBUG;
 - fixed commit message of patch 02

Changes since v1:
 - added support for testing NP guest transitions;
 - added .data section in pKVM to allow using non-zero globals (needed
   for previous point);
 - dropped superfluous WARN() from __pkvm_host_share_guest() which is a
   pain for testing;
 - updated assertions for hyp/host transitions according to the
   discussion on v1.

[1] https://lore.kernel.org/kvmarm/20250225015327.3708420-1-qperret@google.com/
[2] https://lore.kernel.org/kvmarm/20250416152648.2982950-1-qperret@google.com/

Thanks,
Quentin

David Brazdil (1):
  KVM: arm64: Add .hyp.data section

Quentin Perret (3):
  KVM: arm64: Don't WARN from __pkvm_host_share_guest()
  KVM: arm64: Selftest for pKVM transitions
  KVM: arm64: Extend pKVM selftest for np-guests

 arch/arm64/include/asm/kvm_pkvm.h             |   6 +
 arch/arm64/include/asm/sections.h             |   1 +
 arch/arm64/kernel/image-vars.h                |   2 +
 arch/arm64/kernel/vmlinux.lds.S               |  18 +-
 arch/arm64/kvm/arm.c                          |   7 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   6 +
 arch/arm64/kvm/hyp/nvhe/hyp.lds.S             |   2 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 198 +++++++++++++++++-
 arch/arm64/kvm/hyp/nvhe/setup.c               |  12 ++
 arch/arm64/kvm/pkvm.c                         |   2 +
 10 files changed, 250 insertions(+), 4 deletions(-)

-- 
2.49.0.604.gff1f9ca942-goog

