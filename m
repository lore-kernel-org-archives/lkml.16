Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558E52980A3
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017513; cv=none; b=c9i68/sx86LaMfWPxp2EiMQ82TJoyZFvMntEy/TQIYgsFd68EZtNsbIAOEPOMIewHfDGY/DaG1CQBlCqGAXItON3UpIsunj6/ChdFU8LtdBjTMDB8CJvBEouFIHeOTDYVV1pP+eAEIm/f54fOgYXniB7VQ1oOdcorJYoDnuL5n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017513; c=relaxed/simple;
	bh=1s09C3587I966ryCkLEkcRgAkOUPm8xSk88s/uziFFQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FNcA7KKRcf34LmXLRgzQvamlfLra3qPBwnZ43RQWLZb0S81ieEmKT0LKVmkmYfNyu0aQA/WN4R4tCotoxVg3VEAEzUPq4IPTseFpAb+qgltiILOKhT8cET2KE71UqImryEL+3ZusQMRPXj/hGpITYZQwB8g0i9vfaxMZ4aCiLxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yLkqPi5/; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yLkqPi5/"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-231dfb7315eso337455ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748017511; x=1748622311; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nKO/n7MCg1Zefl3piBKKEOFdcEpmLpkaUUv87HbWvrM=;
        b=yLkqPi5/zQF/EJFXfLRgkU4+8VftfhjzIrXcrJHsgtx1+0pg8uBQeX8dqRZo1E0r6q
         yPl1L6YMh7nlqw6p3W6GbZ+Q/w3y5y9jTzJKch4RORN3Pyu05yCm1ir5gPZqoOknusvU
         5ZbKetQBOKRt8vygvXSLsI8xHHSE9OSySzQVGPgDw0yIeCrJw56R9SR9QDvnKSlX44iC
         nhyiWSTV82Tj+GZRQhVdKyoY0j37oBWEBq0aLpcFzpFddUF4BI504ae2rcp0espOj51I
         zeQJ2aR91PNi9xKSMKUsRPYcU3ycYxMgXwNS01wFEwPlaLHNic5d7JnCwY8rAqqNotGn
         /SWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748017511; x=1748622311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKO/n7MCg1Zefl3piBKKEOFdcEpmLpkaUUv87HbWvrM=;
        b=A/gmrb8UV8e4zHuzfTa1wSSiVm9mPojdxPPwOGM9GdWJcTOlahNx8Y60+RXaX+Awr8
         mhFZMx9Ln+zVcvWqz6rQ3rFxDWk4U8sCPbUNdCcXx+pqLUBGADMl6B6y3RM4/ikp9PO0
         PAIAXwRkVy8ka3SvoM7/TuEpelr7F5CWF2SNt6DIxGir+flveGOMu9qwvrEaUeXgTLq0
         b6JDt3bBTQhuNGQ+n0mbyizwchsGeDxE5Ojl6Z4WYBh+AK7/UBP02/5P6pMwlVMABdNk
         J34G+Q4FpbhzBptL+zXoJnP+oDgNegWv/x02OXdrSsa7NNcolYmnxlm1JfzzhM3re6j/
         36Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVUtclGvwWOE2WWgis0ioTjecFBN9RhzPO6xHM1Yzc8uZhRLoTy41rUTSW5S6+CTEDlDDl4LLaYFFT5C3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKrsR1eEPFrC+gnWrUPXDi+clo19N5kW/fVECD5Shg4yRuoVq9
	I0AQHzJGx2l0ea/y3NWLU7VNflPxhk7MmbhTQdb7mLzTOMp9/jAGisgEThwR5FEKAavuj2gAL7M
	sX+OFkQ==
X-Google-Smtp-Source: AGHT+IH8TUiCIUmGct1M9zy+GdpApTV9fmzLMykQj2DnCZErPsRffEGEaC3DdH3pdqy+xR/WNJTUpLLJX54=
X-Received: from pjj13.prod.google.com ([2002:a17:90b:554d:b0:2fc:11a0:c549])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e804:b0:231:8030:74a5
 with SMTP id d9443c01a7336-233f25f3ddcmr57732765ad.32.1748017511542; Fri, 23
 May 2025 09:25:11 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 23 May 2025 09:25:00 -0700
In-Reply-To: <20250523162504.3281680-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523162504.3281680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523162504.3281680-4-seanjc@google.com>
Subject: [GIT PULL] KVM: x86: Posted Interrupt PIR changes for 6.16
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

Clean up and optimize KVM's processing of the PIR based on the approach taken
by the kernel for posted MSIs, and then dedup the two users so that any future
optimizations/fixes benefit both parties.

The following changes since commit 45eb29140e68ffe8e93a5471006858a018480a45:

  Merge branch 'kvm-fixes-6.15-rc4' into HEAD (2025-04-24 13:39:34 -0400)

are available in the Git repository at:

  https://github.com/kvm-x86/linux.git tags/kvm-x86-pir-6.16

for you to fetch changes up to edaf3eded386257b0e6504f6b2c29fd8d84c8d29:

  x86/irq: KVM: Add helper for harvesting PIR to deduplicate KVM and posted MSIs (2025-04-24 11:19:41 -0700)

----------------------------------------------------------------
KVM x86 posted interrupt changes for 6.16:

Refine and optimize KVM's software processing of the PIR, and ultimately share
PIR harvesting code between KVM and the kernel's Posted MSI handler

----------------------------------------------------------------
Sean Christopherson (8):
      x86/irq: Ensure initial PIR loads are performed exactly once
      x86/irq: Track if IRQ was found in PIR during initial loop (to load PIR vals)
      KVM: VMX: Ensure vIRR isn't reloaded at odd times when sync'ing PIR
      x86/irq: KVM: Track PIR bitmap as an "unsigned long" array
      KVM: VMX: Process PIR using 64-bit accesses on 64-bit kernels
      KVM: VMX: Isolate pure loads from atomic XCHG when processing PIR
      KVM: VMX: Use arch_xchg() when processing PIR to avoid instrumentation
      x86/irq: KVM: Add helper for harvesting PIR to deduplicate KVM and posted MSIs

 arch/x86/include/asm/posted_intr.h | 78 ++++++++++++++++++++++++++++++++++----
 arch/x86/kernel/irq.c              | 63 +++++-------------------------
 arch/x86/kvm/lapic.c               | 20 +++++-----
 arch/x86/kvm/lapic.h               |  4 +-
 arch/x86/kvm/vmx/posted_intr.h     |  2 +-
 5 files changed, 95 insertions(+), 72 deletions(-)
