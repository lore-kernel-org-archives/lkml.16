Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C95A19F462
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 22:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743804425; cv=none; b=ROVp+BrSyWKhT9Mukz/G7sgg9D7GfCUFNsk16xdQXYLjx28Ud69Vi6WWksY60QS1630/AU87O1087UPs4yW7JJejJNb5FBACWkzBrzkR7631bTSZinqtmgdccL9qpXP7sgG+92neX1Cmri0Nsvei89spNTS/tvQrvco5JTfopCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743804425; c=relaxed/simple;
	bh=lic10qncMW0Yuj7ay3ptqbrzclOlFz0Wcn9Xa6mjD1M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=E7b84t4NZ5qeW//NL8HioSY8byiLWKTfzZ2IWLfZ7nLTHinIsvMvy6It6gU2I3aS8ve+KMBV1LubAyxpAgIjJAtAuJuh2YGjzpizq8+Mo4qWS8izaWTX5wI8U/v5hMyGgkx6JZQUMdCLzRxWUP+YJMn729tluN0q5RZd9+l5uLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rananta.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uDY4wntj; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rananta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uDY4wntj"
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-84cdae60616so306000839f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 15:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743804423; x=1744409223; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+ABQvf2myBmBVu0tO5Zf2gufLBIF2IPE6tPBCISSnfw=;
        b=uDY4wntjiC3Etm0xwfkeWyKS/0qZzSPjfQBloukXG7kN7Ut1JXzLEhrTUbKJyPZ4Pq
         fT9EpJhmnJF9fr0pCS+okHAI3GmmokWvux6V2lwFYEvT17FBEkvIwIhx8RcZS6eMFjqe
         0Sd3Yd0qR/+LejAx0qXQqED57aaz7XBLv3Ni6gE/cuGrEx9TM9flZpPVHXTGaZSg7eLf
         QdJJrv6BnidaBhQoM0d0ZU/I7SnY+tZK3bK+bh2BkgPVKGwFQkzGn0/L8BjiB6SNQCEn
         67vgP3kIe3wvpsIZlxEeCCOSX+L0GqREPenZtRbKCArdNA+fMN2pSK/rjCTylKCvypd6
         pNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743804423; x=1744409223;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ABQvf2myBmBVu0tO5Zf2gufLBIF2IPE6tPBCISSnfw=;
        b=RsbIcTMtSFO/1V73eD/LRwz23j6h/F8/4k45sv23nSsN8nnyj6i7SHuMkrD3fbBy6c
         SGJAdKpGBKRaucs9dpUyEmMXdP5+XeJW4VNQ25nn7FSJuGHrc3LG1h+XbtF8iWe8qylm
         PzXTst/JOYTgwQ2kwAjJXCEUa6dLp866r6HH+YiB89rcaA6ZkZNtDDhj0XUtb2Sc74aU
         BwwQfLgt7NX/e6AkLHhD5woIYPHEPxr2k3UqgeVA6fuevemSZYSe6XN2V/cpwrkh92d/
         sRu37Ps+8rzT7dm+DdYhvdig2TKwtPpLwJjK+FHNPDb/Q1DmMK5sG2HNou4vdVMZSyRS
         VnrA==
X-Forwarded-Encrypted: i=1; AJvYcCWmoaXSDXlU5t7x5Fen2GpvLoE9SaGk23YKD1lGilC5yMsUwxZdQSbBoEn8ocIPJCawD0zd5DwGFNR9UVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkF2MtAEV9OC0AlyounFchIxow0pJ+GdA4kvtykLUJpye2xU4S
	PuVa7RmlkSD70byVbzZMkkKzc+X05v24UL1hhJIVTVU9osTKyBQsYshl1fxy1vfpWDQM4y9lCsO
	fGHGaJg==
X-Google-Smtp-Source: AGHT+IFV9Isc4fgBFHlpxTPEvIA2IWM9thB5QLOG0FR0uQ2WcHEpEv2w8WbCsDqt+JLpu7IkXXi3TGByiQPr
X-Received: from iobjk27.prod.google.com ([2002:a05:6602:721b:b0:855:9384:bf3d])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:3a82:b0:85d:b054:6eb9
 with SMTP id ca18e2360f4ac-8612ab4b028mr139258039f.14.1743804423530; Fri, 04
 Apr 2025 15:07:03 -0700 (PDT)
Date: Fri,  4 Apr 2025 22:06:57 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404220659.1312465-1-rananta@google.com>
Subject: [PATCH 0/2] KVM : selftests: arm64: Explicitly set the page attrs to Inner-Shareable
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The series fixes a conflict in memory attributes in some implementations,
such as Neoverse-N3, that causes a data abort in guest EL1 with FSC
0x35 (IMPLEMENTATION DEFINED fault (Unsupported Exclusive or Atomic
access)).

Patch-1 is a cleanup patch that replaces numbers (and comments) to
using proper macros for hardware configuration, such as registers and
page-table entries.

Patch-2 fixes the actual bug and sets the page attrs to Inner-Shareable
by default for the VMs created in the selftests. More details are
presented in the commit text.

Raghavendra Rao Ananta (2):
  KVM: selftests: arm64: Introduce and use hardware-definition macros
  KVM: selftests: arm64: Explicitly set the page attrs to
    Inner-Shareable

 tools/arch/arm64/include/asm/sysreg.h         | 38 ++++++++++++
 .../selftests/kvm/arm64/page_fault_test.c     |  2 +-
 .../selftests/kvm/include/arm64/processor.h   | 29 +++++++--
 .../selftests/kvm/lib/arm64/processor.c       | 60 +++++++++++--------
 4 files changed, 96 insertions(+), 33 deletions(-)


base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
-- 
2.49.0.504.g3bcea36a83-goog

