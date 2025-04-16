Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA8A41C63
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744817215; cv=none; b=XQr3XFsVeH8dl8XS4HjY+x00I368EE79yo/NEAtC4KIbkbn6fiwbWBQrRkFCfrMaW44Kp3ARTtuOvyuSq31iJfJ2cxw31eCw5tAi5MH/1rDMC3CKLFpVTarhECYNlDlPY7pN9BSVI89JpwtqiplT8shlMP2VdWKTldBeHDcxlvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744817215; c=relaxed/simple;
	bh=Y6taT1bvJ3WoWsDqnE+pO1kbM38sZq1Qzqeoy+M40KI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=CvnSqOVIrC54AYlEOMOOX2ci3Fd9Di6drdPB0T91c8Gq2oX9pjm7KTXx1oU5sIY5axJDvxATAnppJFJSEjvi0ErgwMxX0cny6XVxUKcPlv9WKyjiuFNdlmNu3hB5xXg4ZuAV4texT4i+k/35KaavrHZ3u8SQDndLmwIwMhxvrxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mlT0Yop+; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mlT0Yop+"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5e623fe6aa2so7279070a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744817211; x=1745422011; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4H1rdwsdSrifJxMs5eiLI+4nIAiDgFXwyzylypkYumU=;
        b=mlT0Yop+VLilUWpZN4IHfxIN2U+ForADsbmg5cDHGN2x8lMlK9MycqiYQM8h0EtpqQ
         tFRkpk9Oa8xLZKg4qb71EWLRyyw5mCKOLmCd1HrwyLjEafoFGsHlAZj9eU/2+N/yQVw0
         hwPBDcMqeV4Rvl219aXQeFATbF8nIZrnD/pV4lBWxauYIc+ON992LvANBtcgPsqxHr7L
         U9MacAnKiUd44NV0ypamZuUUB2woB58Drt4mHeH7c8u7kigihkJ1UmiLit88Xls2O2uS
         gWjg0hg5/mSSVD+NEFtgf+hEjXOw/bSPHYU4Mh7IHm7KojF7wkMuhnVP8u3iEhEYfPg2
         Pu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817211; x=1745422011;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4H1rdwsdSrifJxMs5eiLI+4nIAiDgFXwyzylypkYumU=;
        b=pG4qVepjcW5O/2XcEoF8EWCjxKo6oe50MziYjEhTXTfUtmxWBTu9tf6zhOHq2HwdF5
         MRmsFZ3M9h35KqT6x2F8uJnBQvdEdTUr9aASqvXPwEMHJzh4WVUuAV95l7Ry6ozgBn9h
         6Y6eDVW3GUAEpO8nYorEONaKFa0eismFInZGePwQhiAn6JR1CQfh/2Jd1Go9o6UCzalX
         Vasjd7pCR2kaid3/IIHukFDdQYfTlEMwprumj5dwjFaa/nS2Zm/7+zI62hqaDbSt2PYN
         8mCxBT8MJE850YRmq+Un6uBgGeRB8j3mVpJr+uj5jBFySi2q5R4OVfO8TjihlZohJrWq
         Z8fg==
X-Forwarded-Encrypted: i=1; AJvYcCWZRvXBsb050j+q++cW5bzMHAXuqv/2fbBZGGXuriqBhZ+Pla/A7S0/bO0eNi3ar2Sv2WfZgyaanqN9A8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmgCVSixIAWS84P0E/8pz6qCg7Qjx+C7jkPRNX8zJLsuCsN4Vg
	YMAojsnueodscEovrQfUKN6IgCg4+VSynsWId/BeWRjopXemgRLoREEaBLgy9wlUlTsdmsp03dP
	x/39Myw==
X-Google-Smtp-Source: AGHT+IHuqk+2+OpJM1qcSmjpRDqa8HEvy7iDhIfBrhRdZNtdJ2xDUzaYWX9wIlKoApyZVheRJqd8RH//SOf0
X-Received: from edbcf8.prod.google.com ([2002:a05:6402:b88:b0:5ec:bf29:2e78])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:849:b0:5f3:4194:187
 with SMTP id 4fb4d7f45d1cf-5f4b75a6b98mr1899450a12.18.1744817210816; Wed, 16
 Apr 2025 08:26:50 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:26:40 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416152648.2982950-1-qperret@google.com>
Subject: [PATCH v2 0/7] Move pKVM ownership state to hyp_vmemmap
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

This series moves the hypervisor's ownership state to the hyp_vmemmap,
as discussed in [1]. The two main benefits are:

 1. much cheaper hyp state lookups, since we can avoid the hyp stage-1
    page-table walk;

 2. de-correlates the hyp state from the presence of a mapping in the
    linear map range of the hypervisor; which enables a bunch of
    clean-ups in the existing code and will simplify the introduction of
    other features in the future (hyp tracing, ...)

Patch 01 is a self-sufficient cleanup that I found thanks to patch 06.
Patch 02 is another self-sufficient cleanup that came out from the
discussion with Marc at [2]. Patches 03-05 implement the aforementioned
migration of the hyp state to the vmemmap. Patches 06 and 07 are further
improvements enabled by that migration.

Changes since v1:
 - fixed page-tracking comments in nvhe/memory.h
 - rebased on 6.15-rc2
 - applied Marc's Reviewed-by

Thanks,
Quentin

[1] https://lore.kernel.org/kvmarm/Z79ZJVOHtNu6YsVt@google.com/
[2] https://lore.kernel.org/kvmarm/867c4pnspi.wl-maz@kernel.org/

Fuad Tabba (1):
  KVM: arm64: Track SVE state in the hypervisor vcpu structure

Quentin Perret (6):
  KVM: arm64: Fix pKVM page-tracking comments
  KVM: arm64: Use 0b11 for encoding PKVM_NOPAGE
  KVM: arm64: Introduce {get,set}_host_state() helpers
  KVM: arm64: Move hyp state to hyp_vmemmap
  KVM: arm64: Defer EL2 stage-1 mapping on share
  KVM: arm64: Unconditionally cross check hyp state

 arch/arm64/include/asm/kvm_host.h        |  12 +--
 arch/arm64/kvm/hyp/include/nvhe/memory.h |  58 ++++++++++---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c       |   4 -
 arch/arm64/kvm/hyp/nvhe/mem_protect.c    | 106 ++++++++++++-----------
 arch/arm64/kvm/hyp/nvhe/pkvm.c           |  47 +++++++++-
 arch/arm64/kvm/hyp/nvhe/setup.c          |  10 ++-
 6 files changed, 158 insertions(+), 79 deletions(-)

-- 
2.49.0.604.gff1f9ca942-goog

