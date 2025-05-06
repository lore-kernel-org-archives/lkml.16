Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D34226771B
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525181; cv=none; b=ixZ59YfOWXr+XHs0ngyWAapuqBVpGPqxJWI7gVW8J7Vrax3hEMhv+n2mXf/Uf1wWvlBsvI/saULequE1sG2JquGbxvir+/XuBuQYtlQA+zuzhd5sjlLrRtwM9oTqQctPwtYCI6Yau6Ch1dH6ZpknYdXmQcaEm/l7h2pfEXkMDEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525181; c=relaxed/simple;
	bh=Mx3WioDKOqhoylgYVeKSxirpr55XKTvnVeV8E3UOgM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AIDMTL6yHvvQGoOn2YQ1lCVxxTL3Aa2/q62iYpJwG4wuvnCF9dk7EHzBogG7pJXrU6dFHoaprbHTH0CnqUlQZJJZV60ws/733l5XZ7RFftEs7ssDe+VH6mTbOek5S5iREvyAnvKljrQ2lTRoM+jpyj3YgTY3HOa0uES0UIH2gfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l5EZfOKt; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l5EZfOKt"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a0b28d9251so17808f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746525178; x=1747129978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tZnTKNq8EyXu3RPx00ra9THtbxrVu93k8UBSMKqYZT8=;
        b=l5EZfOKtuOnmdQc3EB1tbiSYIfMNeJ4gQAj6Ap4DKAR3YaUCG8Bp0znCX9L4KCk5P6
         v+i4eg+/1oRo4QqqsVFVOt5pmlsK8wDHyEbGxcqzuPmp6UTCyykDrLUGfpcnxuYVQTuY
         vFw4e4Q5/nc9dDZYtZsbCAy3pitON0ryvJS+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525178; x=1747129978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZnTKNq8EyXu3RPx00ra9THtbxrVu93k8UBSMKqYZT8=;
        b=iihkY2cr7gmWDz/wwzfNg+z2z0GFYecTpqIW2/yh1F3m1gv8Q5zKcR8zxEXIoKn4E2
         jAC/AVndRmwJ1mLTbM4upXk382yf7Now7mZByDBE425UuVAMA84ov1q6ZlPLtF+rVSkB
         dG2m404yz14MEp5A3S21ywbLshlCUW6unea5hw3mEsiPWwOrMNnz1GK5Y7EERw5BR3S0
         +gBtJLaVgtZpx2tqnTTELRLUqtcG07UA3L14x1X4TwGa/aOs8kN+3WimPjeMI9BUe+w2
         EigZlRtI2wxR2NeI14urHHenfbN3gv8rCDtGGcSpcrwOylYSzEd08+CW7Lg2TaVRiPvt
         5FxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTdg3cF43v/eF0QpdCSYYmuIRd9jA3xNPOryruilhhQS9B1E6a6HdjRP3bPsUtFf03esgnKPc50XNK8DU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLaXfd9EjEm5BprfObi3MsDdSqxaKsP65VmRoI94balTSgfgXo
	Uvjar+cMNAKYJSB3aKclaZZlnqBNBZ42t6Ux+Luh8dYzoqGEeo5kNc3/E9nNDA==
X-Gm-Gg: ASbGnctS0Eejswng8CIdFs9ZeH2jwBb3gd2hAC+LfFdfG5HD+krJrYl3y0iYhJ4n39t
	g4QdDEDxJcHBC0WrwgsilgRpVW3GT0Kiq1Cx2TB7woZuB51KXoTZ+HyC9L4t51UghG2UeyR72rW
	Z27p4CgrGxPcbzxjYHVMiMSrgHuxnwAh2zTzeQAWXFIA9vUAq4fKu02WfPc1P0en6kFuJmVG0fO
	baSPUMx2EybOK0TfoIqM00TY48ZNNDQ+PswB7oL3g4SEvgGACTeeoVrHBWf3MVYb/M/gS8M9xCx
	jDB6U9PyG07Q4uhQm42IFXi48OP2+FvljufTXF4wYZ5aNuuFfyK1tFqV
X-Google-Smtp-Source: AGHT+IGAeOYlQsHeYetefU7QLQr05zvGoAryBVbR5H/R7ZH9OmOhzOm9zAiwuZL9RcZI1H/m5f/Vyg==
X-Received: by 2002:a05:6000:188d:b0:39c:1ef4:b0d1 with SMTP id ffacd0b85a97d-3a099aefc65mr4520575f8f.10.1746525178108;
        Tue, 06 May 2025 02:52:58 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:7196:3093:b0e3:1016])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7a46sm12879860f8f.44.2025.05.06.02.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:52:57 -0700 (PDT)
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
Subject: [PATCH 0/4] mm: Avoid sharing high VMA flag bits
Date: Tue,  6 May 2025 11:52:20 +0200
Message-ID: <20250506095224.176085-1-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
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

Florent Revest (4):
  mm: fix VM_UFFD_MINOR == VM_SHADOW_STACK on USERFAULTFD=y &&
    ARM64_GCS=y
  mm: remove CONFIG_ARCH_USES_HIGH_VMA_FLAGS
  mm: use VM_HIGH_ARCH_* macros consistently
  mm: consolidate VM_HIGH_ARCH_* macros into parametric macros

 arch/arm64/Kconfig   |  3 ---
 arch/powerpc/Kconfig |  1 -
 arch/x86/Kconfig     |  2 --
 include/linux/mm.h   | 49 +++++++++++++++-----------------------------
 mm/Kconfig           |  2 --
 5 files changed, 17 insertions(+), 40 deletions(-)

-- 
2.49.0.967.g6a0df3ecc3-goog

