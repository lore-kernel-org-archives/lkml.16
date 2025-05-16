Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FED28002F
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747431005; cv=none; b=L3b9tMYJqE9r6Z4mFf9/RPRVVSxtzz87S6OZjsL3CHnLd827duyDlQUFoYU81k3JZJ6Ck792ElK/XaRYyJOfYZVku9bXTiM99BnRFq8uoXKx7i+yJSkZfug6728dvKRdLNdTtU8nZqEWFMFYtufgbjr8hsNSyQyL0XJbwAs35Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747431005; c=relaxed/simple;
	bh=yy9jU5bFQ6MywiVXwQiQCMbVNQv3vhTHbAibmHLnyL4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=iLGZ8/u3sjQph2+SZQt3Kw3vUhJLUhfT+uucTwn7MvrfdNhD5c75y5KcVYI8ntVWuynJ5N+42KmCfvF9kuWkvoWm4GzdYM2loqe78szV4dzH/Vpz5lMSXzfNdsUXL+XK5wE9eF++pKNgaySIEXFY8DjhwuDJ5vTyyKyXwAV4DsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i2+ELMPA; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i2+ELMPA"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7429f7f9ee3so1520466b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747431003; x=1748035803; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16vfcjowGUMTa5d9+ULCqQIsoViPLGh6MjBdiOthySQ=;
        b=i2+ELMPACbekzui9NGjQ82s6vW8mMqUTNVmVoPCzkf63yiV0cB8cPc62BsiGOLUy4H
         jmdkwrnFsQirqD0jDJ2Vf10UemenmM8EFc42GAv7qMa/I3KHTKoXOKRUyq5djU24vNnm
         VfxouAH6IU35vdgTm05bGpZ6q0bii0UVK94uTJmcuqdBR+s8O0cc7LJkWHakOzf153e/
         /NGfkL0y65xo5D+CMWuwqHOZZRk1iBbzXe2mak/UwI942PMBsLkNwrY0HXVURw5wCRyB
         tLhxXKBYXwO1dXYG/o/QK93bb67qz6k3sPJrF0AVR8VV7hIeOpD/31df2YmF13LH2O/X
         igrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747431003; x=1748035803;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=16vfcjowGUMTa5d9+ULCqQIsoViPLGh6MjBdiOthySQ=;
        b=pIenBsUMUFAoLWFtYai5CzG5om/dbnwXHIwj+IkLUxmSdp74JfWAYIbNur4nhiHWn9
         JpT4xImUpkjzj73NLKFjvxpJWbgUcbJxIeQR8ISHmf7q6X89JzgYI8qy9fc3ALsF97br
         FohM9JK8fduaJK05EwJwRdITl5jtMTJO/dWZ9MLIAPTgPQi0fNQdqe1Scju0y/OXlTUy
         qC5p9cIAKGTlXX56gk4j0EXFcyIK0rt2nOlh3Aov0C6lNf9/m68F7Yxs4ytMfZhzky+2
         Rmu5EHc0p/nb4GygCapJO1hztSAPK4YYH1QxK/xidnG92bsFoW34sUipsBHo19aZCVN2
         LVCA==
X-Gm-Message-State: AOJu0YwnSBaso4UI+O7iPspLuDFi9zYGqmlT881M+hO4lYJz3iWtpR73
	VihhJrtwz5dp7YOjEv+zqRM9eEwCtT+Ejt7vq98EvoQ8w52kEERU1qdGntmeIcm1/iKRcadklrX
	1dl34BA==
X-Google-Smtp-Source: AGHT+IHAOqNtgLvjhczBzscm3RgIFYldzuw2M2zw628mwDpHkkpQXjnCtK0C58qctj3mP1IxalTn5fBd2FM=
X-Received: from pfbjt23.prod.google.com ([2002:a05:6a00:91d7:b0:736:38af:afeb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:894:b0:736:4ebd:e5a
 with SMTP id d2e1a72fcca58-742a98b4e97mr6495370b3a.20.1747431003224; Fri, 16
 May 2025 14:30:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 16 May 2025 14:28:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516212833.2544737-1-seanjc@google.com>
Subject: [PATCH v2 0/8] x86, KVM: Optimize SEV cache flushing
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Zheyun Shen <szy0127@sjtu.edu.cn>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Kevin Loughlin <kevinloughlin@google.com>, 
	Kai Huang <kai.huang@intel.com>, Mingwei Zhang <mizhang@google.com>
Content-Type: text/plain; charset="UTF-8"

This is the combination of Kevin's WBNOINVD series[1] with Zheyun's targeted
flushing series[2].  The combined goal is to use WBNOINVD instead of WBINVD
when doing cached maintenance to prevent data corruption due to C-bit aliasing,
and to reduce the number of cache invalidations by only performing flushes on
CPUs that have entered the relevant VM since the last cache flush.

Assuming I get the appropate acks (and that I didn't manage to break anything
when rebasing), my plan is to take this through the kvm-x86 tree in the 6.17
timeframe.

v2:
 - Add a missing -ENOMEM in __sev_guest_init(). [Tom]
 - Collect reviews. [Kai, Tom]
 - Fix stub prototypes. [Zheyun]
 - Kill off dead pr_err() code on DRM's wbinvd_on_all_cpus() usage.

v1: https://lore.kernel.org/all/20250227014858.3244505-1-seanjc@google.com

[1] https://lore.kernel.org/all/20250201000259.3289143-1-kevinloughlin@google.com
[2] https://lore.kernel.org/all/20250128015345.7929-1-szy0127@sjtu.edu.cn

Kevin Loughlin (2):
  x86, lib: Add WBNOINVD helper functions
  KVM: SEV: Prefer WBNOINVD over WBINVD for cache maintenance efficiency

Sean Christopherson (3):
  drm/gpu: Remove dead checks on wbinvd_on_all_cpus()'s return value
  x86, lib: Drop the unused return value from wbinvd_on_all_cpus()
  KVM: x86: Use wbinvd_on_cpu() instead of an open-coded equivalent

Zheyun Shen (3):
  KVM: SVM: Remove wbinvd in sev_vm_destroy()
  x86, lib: Add wbinvd and wbnoinvd helpers to target multiple CPUs
  KVM: SVM: Flush cache only on CPUs running SEV guest

 arch/x86/include/asm/smp.h           | 23 ++++++--
 arch/x86/include/asm/special_insns.h | 19 ++++++-
 arch/x86/kvm/svm/sev.c               | 81 +++++++++++++++++++---------
 arch/x86/kvm/svm/svm.h               |  1 +
 arch/x86/kvm/x86.c                   | 11 +---
 arch/x86/lib/cache-smp.c             | 26 ++++++++-
 drivers/gpu/drm/drm_cache.c          |  9 ++--
 7 files changed, 125 insertions(+), 45 deletions(-)


base-commit: 7ef51a41466bc846ad794d505e2e34ff97157f7f
-- 
2.49.0.1112.g889b7c5bd8-goog

