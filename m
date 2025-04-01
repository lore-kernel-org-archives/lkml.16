Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3961EB19A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523038; cv=none; b=LBcCwtd00HPgm9Y46Ebiugs9m5AuogLyRtYArAbKwmm0H9ISDmM0d8LUG9lSR8zvQT0Jz9Cam9vpLibHIRjZgSml/P0nczgBJ+p4hDP8cU0tJ79ZvIqcMSDwGDzFKIwpZ2/Brb8ciYR+OItluDcTOc1MGOcZku+uqCk3nurBiSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523038; c=relaxed/simple;
	bh=obqid5OTuUiJ6SyGoQK983caSLzqcVx2n1aei7l+4lY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BG4/rznSYHTsxpSnkw7nEf7zdGF3b+wIfi7v9rU3GQmfvCfGM+F8Ncj2cBR1BNpP1xekZejp2cjAlaTa15iozunHFF93Ov4spiH4G4TE874AKd4GMQV2HFxERKvB5EDOIwuUje2Pns0Cnk4Eevv54YYluS7PN2GvH55DDJYimO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MwRSWpfI; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MwRSWpfI"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3032f4eacd8so9451960a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743523036; x=1744127836; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwEJMH/OVdyAVJGbpVaPUjh6MC5dBrEtc6HhlWCyuNE=;
        b=MwRSWpfIeiHD4PS7/U/vfLFOEpmyWfBTkyHYJY+tPJafKsyDR3YdVgZXAHRlL/ZAZ5
         Rzih5x5hJpcLKtyvaYAbGmfgMOhc0WsSMcT1rAJizbKEQce509pwQbopilJKSpx44OpA
         E/xRk9Z48PnDvcLH1a+1pwg7yZ1gWFn43gk7TIY11ba4Uvgg1uJ/cPx5FSllyJlisgxP
         uyDsgoyYB9FYxkAPJtg6oRB2nowz1Dlf0BpVYdw5q3AsgmclZbkgXRMiDe/OrwP2To5y
         nnNkhUOPXZdJ8S9y4g39c85RKsZDYQEpDZ/Vm074KTNBTj/opPXA8ScJa9oVkx46gOY4
         VmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523036; x=1744127836;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwEJMH/OVdyAVJGbpVaPUjh6MC5dBrEtc6HhlWCyuNE=;
        b=vY+mx/uik2avnib7lm3zmAahlolbEVJPgwBHtXVUh5cpp8RVk6GuNdM4UW1h2gHJw1
         ohD6TJ3wON0y8A1oBywaRYy+acG424T4y1lOIeD2Ok08r8i3WksEndX0Nxv1kyxr4iSu
         PtehON8dsDUvnJcFPOQW99WxO3y5CWJ4lC0P9NJfDd1TD5NtYS1HgAVvxbsCL08PcH/3
         jckTjtj946glfEm87RcWfIk0WnKZbKVxKzkFKfq7so02EzG/P7F4W7I0s4cUCnW7xh2c
         THUmHH80UhkouUbzIBQrFNWHwc9PShzP6GovWLXdx0T8U2eXzXpHJl7mc249jItgB5tV
         xqvA==
X-Forwarded-Encrypted: i=1; AJvYcCWxZ7c7RpwnycO38S8LVXMy6AMPcTtanwaqrZO7NspAP4Qx+WhVrnW3TY5G7efnGpK2CN1xTc1cS8S2kzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNf2bbVBo32k+BDKjni4ledDe5eN719psgEVftzEpjAvGIw5TA
	ZPYOhhzzE9Ssi/uRjb7EZR2G5MKGtjS9jiMthxyxT1aXZb9RXdUL4Oio+u8RzYtnGeDsuEP1MWZ
	etw==
X-Google-Smtp-Source: AGHT+IEEGMrWotPWYH1yWYPkkzZT2YsxQgwxVg1VP5TFnb3c4UoTk9ovqtFpkuDW6Z1KJlTg03ngxZuBS4k=
X-Received: from pjvf3.prod.google.com ([2002:a17:90a:da83:b0:2f9:dc36:b11])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4f4b:b0:2ee:c2b5:97a0
 with SMTP id 98e67ed59e1d1-3053214596cmr17727293a91.25.1743523036681; Tue, 01
 Apr 2025 08:57:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Apr 2025 08:57:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401155714.838398-1-seanjc@google.com>
Subject: [PATCH v2 0/3] KVM: x86: Dynamically allocate hashed page list
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Allocate the hashed list of shadow pages dynamically (separate from
struct kvm), and on-demand.  The hashed list is 32KiB, i.e. absolutely
belongs in a separate allocation, and is worth skipping if KVM isn't
shadowing guest PTEs for the VM.

v2:
 - Actually defer allocation when using TDP MMU. [Vipin]
 - Free allocation on MMU teardown. [Vipin]

v1: https://lore.kernel.org/all/20250315024010.2360884-1-seanjc@google.com

Sean Christopherson (3):
  KVM: x86/mmu: Dynamically allocate shadow MMU's hashed page list
  KVM: x86: Allocate kvm_vmx/kvm_svm structures using kzalloc()
  KVM: x86/mmu: Defer allocation of shadow MMU's hashed page list

 arch/x86/include/asm/kvm_host.h |  6 ++--
 arch/x86/kvm/mmu/mmu.c          | 53 +++++++++++++++++++++++++++++----
 arch/x86/kvm/svm/svm.c          |  1 +
 arch/x86/kvm/vmx/vmx.c          |  1 +
 arch/x86/kvm/x86.c              |  5 +++-
 5 files changed, 56 insertions(+), 10 deletions(-)


base-commit: 782f9feaa9517caf33186dcdd6b50a8f770ed29b
-- 
2.49.0.472.ge94155a9ec-goog

