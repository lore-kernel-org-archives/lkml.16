Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5C582D91
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014454; cv=none; b=VfkauMG6MBx3Xy6C9fxqvHuj8a0gv4+0VH0AQclG8WR5fsTCsrcEaxqVu8Wa6gM/LyiekkTSIUPM1iTPbfi9oohTPbCgcu3eieZdIRiIf9R9ToOvMp8NV/9kDu+ueI2wbNGbeKF1YGl/3f2CqpOXnXVFMLk75ccCBY1OOm+AXcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014454; c=relaxed/simple;
	bh=ZiNq+60xXrp7X+NoT2r6vcJeIPt+ez0IAmeaMobsOWk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=uV14iOaw+J9Mr2h7vAyYoaQhgjrj/o+M9mcWgTz3vOSQ900RJtFtFm1r5OnPCxmOIwzMEJGT3V5VOFAAJ1xTAPX1L7Jp/eC2y2FRJw/hnuJgyhxNhuUlHS+Qrp0ehYgJmyZstDUDlwfk7uCjGp+fdztRIiOrue4H+kNn2kycwMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tGW8lNGA; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tGW8lNGA"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so23120685e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744014451; x=1744619251; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fD9COX0Pw17byuPpjCb5FZ4ylgjxa+BidJzcsVb88Zc=;
        b=tGW8lNGAnXNSkG2KVQhtvibIOe1CMIRuIFxSv6JlY+LQNkBsNdVW4WjeXuw+h0btPC
         aIT5tWki68BZI4Piee+oq3kbrkHPFkGStqNuwV3BQqldq356H4KNewWmZiF0Se61H6J0
         Eblg8jBCrcwa2pEPg88der+vTa5rpu0KtR3DZXAHNfL7xUHY+TcPX7fYndO2M142LDUs
         QuksChAiKPGL+MSBfb8fSmMMYjpnKarGX8FbV125sdGtNT0r+eHKN0aFV1Ty9IoK5VPT
         JpGR85bQyEudOJRW4ZogwtmMw0HrGH5CO+EOfWgBJVCfZ6rEM6qWm7dfWUt0soOWdZ7x
         CCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744014451; x=1744619251;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fD9COX0Pw17byuPpjCb5FZ4ylgjxa+BidJzcsVb88Zc=;
        b=Wun8zgTkUm27rU74Uy4ARS65u2ncCR8sj2P+lK10oIBF1tygo9WWaGl5tlb7pdzGDl
         cpsz2IiCdvlT0I1d3qyYidj2Ca/DiaEaxh10veKxt3LAs9p9nMCYYoUd4AX5pEI4EPEl
         KJVdn+tCAZ6E8d6wwAbUYzgsBmkue6z7f62/tTi8oayjw1YHoyVSjOS/Q0EFmkQSYssS
         UTrt1d56tdi3ikTj3mu3X8pfOlliWR4LY7PPNB3Z1GAR0KZtywc+7wB6vHXhu/9HywIb
         fLcY2MP8wNXuN8Yx5YhN8NhvzH/WWMTpl4bqVqUyYZZBZ0r0KDmkkg1XdtnENfV0OXuK
         r+1w==
X-Forwarded-Encrypted: i=1; AJvYcCUKlruJ8UnuQG+SR2qxhDb4gXWH6pZd5y3Be0y2zCTD5Do+ZW36pgk70mxyXfUjJjkhHRnvGEICArppX1A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4LO8bbx9xLyYITk9QBJOUmEUCOqMJRwCW2KHckneftfQa7Mdq
	1N6bc5/iKOJtlsxM/yfcGOKHK8itZeL8FEfJowxDd7Z3CZNROCf2Mfh4sLxmPh8kfIMh+3vHmz0
	LYqVYbi/3yw+uHUpbGw==
X-Google-Smtp-Source: AGHT+IGUzsg+5YsqZ1PEyJ2fXUi6r6QPStOWt82YjAv0VQSmQXRC8ZoIubECZXRmtlKWgqNSo2X0aPxjJEzjFARt
X-Received: from wmcn5.prod.google.com ([2002:a05:600c:c0c5:b0:43c:ec4d:6037])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cb:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43ed0b5e180mr92911905e9.7.1744014451027;
 Mon, 07 Apr 2025 01:27:31 -0700 (PDT)
Date: Mon,  7 Apr 2025 09:26:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407082706.1239603-1-vdonnefort@google.com>
Subject: [PATCH v3 0/9] Stage-2 huge mappings for pKVM np-guests
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

This series adds support for stage-2 huge mappings (PMD_SIZE) to pKVM
np-guests, that is installing PMD-level mappings in the stage-2,
whenever the stage-1 is backed by either Hugetlbfs or THPs.

The last patch of that series is an optimization for CMOs using a shared
PMD_SIZE fixmap.

Changes since v2 https://lore.kernel.org/all/20250306110038.3733649-1-vdonnefort@google.com/

  - Fix PUD_SIZE -> PMD_SIZE enforcement (Quentin)
  - Rework pkvm_host_share_guest() to remove one hyp_page walk (Quentin)
  - Remove one pgtable walk into __check_host_shared_guest() (Quentin)
  - Return EBUSY on host_share_guest_count overflow

Changes since v1 https://lore.kernel.org/all/20250228102530.1229089-1-vdonnefort@google.com/

  - WARN_ON() on !PAGE_ALIGNED size for guest CMOs (Quentin)
  - check_range_allowed_memory() before accessing the Vmemmap (Quentin)

Quentin Perret (2):
  KVM: arm64: Convert pkvm_mappings to interval tree
  KVM: arm64: Add a range to pkvm_mappings

Vincent Donnefort (7):
  KVM: arm64: Handle huge mappings for np-guest CMOs
  KVM: arm64: Add a range to __pkvm_host_share_guest()
  KVM: arm64: Add a range to __pkvm_host_unshare_guest()
  KVM: arm64: Add a range to __pkvm_host_wrprotect_guest()
  KVM: arm64: Add a range to __pkvm_host_test_clear_young_guest()
  KVM: arm64: Stage-2 huge mappings for np-guests
  KVM: arm64: np-guest CMOs with PMD_SIZE fixmap

 arch/arm64/include/asm/kvm_pgtable.h          |   7 +-
 arch/arm64/include/asm/kvm_pkvm.h             |   2 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   8 +-
 arch/arm64/kvm/hyp/include/nvhe/mm.h          |   4 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  16 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 224 +++++++++++++-----
 arch/arm64/kvm/hyp/nvhe/mm.c                  |  86 ++++++-
 arch/arm64/kvm/hyp/nvhe/setup.c               |   2 +-
 arch/arm64/kvm/hyp/pgtable.c                  |   6 -
 arch/arm64/kvm/mmu.c                          |   5 +-
 arch/arm64/kvm/pkvm.c                         | 129 +++++-----
 11 files changed, 330 insertions(+), 159 deletions(-)


base-commit: e48e99b6edf41c69c5528aa7ffb2daf3c59ee105
-- 
2.49.0.504.g3bcea36a83-goog

