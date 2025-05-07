Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E6B287508
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623425; cv=none; b=sEf50aCzHqtIQXBQVz6n0Jo8AmTyVoPy5t53bcZHpWwOWwHK7TTysrkM4nWpsB629WKhU37lcbd5qC/y7sw5exN3IOXLQvZjUJ6AWG3+1TC8lguAdImSqqIuOwi3tIWoFAh0wntb0ve5zUsSQDdEL6uRLsnjYxJDiNthxSIg/uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623425; c=relaxed/simple;
	bh=fFvW8OUpmVvS/Sgd9w4lN7rpirD/yc4s6OBsUs6Wo78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cC9Tj991d9xJZEUfwlO5UjOfNVdfcVDFB5IdOdzVtpmaWupYy/F9qSBRUVSsFLoYViUh5hS1XQC9R93UdTHOhwS2To6a+ZA3Y/SqEsC6g7EG76wFdhMAsNHv6TPgLKClLAjuV3fUIJdmIyVGFZVWxtcO5AETUIYDJwG2krxb49Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T/T2Fmpu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T/T2Fmpu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso8202845e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746623422; x=1747228222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuljOjVKEheANDj4X5NFu7CpRnHqZIPs2oP4fw0GcM8=;
        b=T/T2Fmpu5WtS1zkIwkQDNrGGjY5lBovIHjYHvYuyP05TpTghD3tu27SPdxUADiited
         Ts6CpCSU4RX7i+mo6+E1BweUS/A8zsZEy4l1uKqWKzFFUjoOEKAhZYSzS9c5VApE/YLM
         mCfYARYgnpuYdN5db3wKPR6CGE+ngTHcSepoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623422; x=1747228222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuljOjVKEheANDj4X5NFu7CpRnHqZIPs2oP4fw0GcM8=;
        b=ONlbdlrhSyhtdw41tDYVcgHVBpGqq1yku67d67llT2Vvzk1h5eq55QA8HFaKVQ2zLI
         p86c0ptP03JxlVsDNXxaE41jErxtnV6YNpn7CWgXHkaM77VyZoe40bDXmORFGz2leGDt
         nDaB6RwVdLEqAetcqLHCVCG4iXsvqhhsIRj9UWcWUjjzFCg1MgZV8EYWRBXPcZtUKr1h
         5HC0C0+XdnMOuld/ra1qF7eyXwDnEM694MGyk8G6zIQXfoY5LAZXJBX2sVgLcRuJ/K2K
         ceb/+DlCJfeGZ1FUsBNk5ViFizRsOjFDeWTRRjt7pXg42DbEdmVcEKadqFojKZ0R0Nf4
         ddTg==
X-Forwarded-Encrypted: i=1; AJvYcCVS0wvg8i6NMa6wcesGU4Cm4i1t7BkHk+xb2nMWCNhukCTLWZcSlmJhbazLdknrYq0v1GpPfFcWpUAXNsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXy6cfhdwh3kfeyFXpYJi0tok3u9XS1nJnQQQfSAmvX5IbAxZt
	zoiO+dfAH8LworO4WZaQBcFd8kKG6deV8FQjpzHChECdCZL8undCjWCqCJSMsQ==
X-Gm-Gg: ASbGnctRf7ig7H5tp34otWMviajhAErhdkyrRVtl8rnKNXnXpDEVYRM3krqMaJPNYLy
	2jSUpXJeU8BVpfnXiwLQsJALHZGMWHLXrG8YEUcgXrRjapU25XVmoIvsg9GdUKaLeV8amZ+b6fN
	uVqQtr1nHPnEnsFrMUnWYyBelJbCAQDGjUknvLLa8nxcOr94jecIaKhBTDPN9F8eLh9Hi2nEJ/V
	8gFxJV4QHHk+ajqr0b7/xP2PliPjgnFayZPUocADCGPFEhYtRpDp30Cq0p5gxkWXHw9T0b6BkoB
	X6ahsO6n09kcg5Vie6hxyp/MIKn2m/iIxa9ONFa2G9VMKH8KPxyUjLru
X-Google-Smtp-Source: AGHT+IGQdVONhAnziM5XOmvjkygUSVMeNIhGXDruc+oA+VZgUio51qlq4lW6/p72ELieysS4m556ZQ==
X-Received: by 2002:a05:600c:3d9b:b0:43d:fa5d:2675 with SMTP id 5b1f17b1804b1-441d44ebb3dmr9248255e9.9.1746623422143;
        Wed, 07 May 2025 06:10:22 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:558d:e1fb:c2ec:7513])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32adcasm647435e9.6.2025.05.07.06.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:10:21 -0700 (PDT)
From: Florent Revest <revest@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	thiago.bauermann@linaro.org,
	jackmanb@google.com,
	Florent Revest <revest@chromium.org>
Subject: [PATCH v2 0/4] mm: Avoid sharing high VMA flag bits
Date: Wed,  7 May 2025 15:09:56 +0200
Message-ID: <20250507131000.1204175-1-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While staring at include/linux/mm.h, I was wondering why VM_UFFD_MINOR and
VM_SHADOW_STACK share the same bit on arm64. I think I gained enough confidence
now to call it a bug.

The first patch of this series is a straightforward attempt at fixing this
specific bug by changing the bit used by VM_UFFD_MINOR. I cc-ed stable on that
one and I expect it to not be all too controversial.

The rest of the series however is a more zealous refactoring and likely to be
more contentious... :) Since this bug looks like a near miss which could have
been quite severe in terms of security, I think it's worth trying to simplify
the high VMA flag bits code. I tried to consolidate around the current usage of
VM_HIGH_ARCH_* macros but I'm not sure if this is the preferred approach here. I
really don't feel strongly about those refactorings so this is more of a
platform for discussion for people with more mm background, I'll be more than
happy to respin a v2!

This series applies on v6.15-rc5.

v1 -> v2:
- Fixed a couple of typos in patch 4
- Added Mark Brown's Reviewed-by tag

Florent Revest (4):
  mm: fix VM_UFFD_MINOR == VM_SHADOW_STACK on USERFAULTFD=y &&
    ARM64_GCS=y
  mm: remove CONFIG_ARCH_USES_HIGH_VMA_FLAGS
  mm: use VM_HIGH_ARCH_* macros consistently
  mm: consolidate VM_HIGH_ARCH_* macros into parametric macros

 arch/arm64/Kconfig   |  3 ---
 arch/powerpc/Kconfig |  1 -
 arch/x86/Kconfig     |  2 --
 include/linux/mm.h   | 51 ++++++++++++++++----------------------------
 mm/Kconfig           |  2 --
 5 files changed, 18 insertions(+), 41 deletions(-)

-- 
2.49.0.987.g0cc8ee98dc-goog

