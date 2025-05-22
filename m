Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478D32D29CA
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747957074; cv=none; b=p0482fKa/SV/Ggm8jNKwx6AfdliFNHapJNMuqmzSNB3lIT0AGcHzMysRM9GPL0YSYze/o0Clz7+CtgDdE9gkB6oHtfk9GOtmBnCOgg9nTWGuAayf4nE8JTNzhVWb9KLlIjMeILzfsaQIDe7YvdKsNFbSAMy6tCUg6REAK/EZiAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747957074; c=relaxed/simple;
	bh=vRgPvO16SMJb3ieXUqlhCqh8srFYVsp7VBXX2an5x6Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oKecsJpZI7kfhJgY/MbHFc6+OMlJyc89V8UucJ//EB51hpeXbwLDwR/ssv4EY1JMqysfZYHJXpzF63uibBs80q2B9GGbXcaBUq47j0sOomttAoRBl0ip9Uq57aNIKT3mw01t4dTGOVWnhiLFaLnwvDOvNnrjfs3QkOk/9uFXjEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h/xb7X3R; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h/xb7X3R"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30ebfc28a1eso8041228a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957071; x=1748561871; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=33x8wnTKFUGsCYrD9G+PbnP8XxuzA6yDnz1QlzvR1XE=;
        b=h/xb7X3RbYuTFn7O6B4aDWF/Tp5v1c9qVDWQ3pur9N1SB1pCSCzbI05MZljUhdky2C
         ffTq+eLBQiWmAnmbDjEMQV1aDjKJXq1yDOktRNVyhwB8nLebrU3AwRrNg7k3YQsZjaGo
         613miveoPTYRa60qavFZRlKK0m+v1NgRfaR0C6NuAh/LIYYB0tyfd6/wo3QfSxD/B0k9
         Filuc7VALmcXGVESORq2gTUBwMAS/iOetMr5OYHMjyGX/5NLmTY0+w1fk/JoxrIN+0TU
         PTyDY6QkuwUGAA+5gJCP9Ro0Vueh1j9W/LGGhbI9qj6m+BLgml0Fg5XMPSOx1rP/Uy+/
         Tj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957071; x=1748561871;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33x8wnTKFUGsCYrD9G+PbnP8XxuzA6yDnz1QlzvR1XE=;
        b=NS4+cKmVyxKKJPzmC8XwhDV3/kgA6QORUav/atukK/GBXffLaqfpgSaoObe3LTrE7C
         AxqT8TMldP0E+HrBUoDcI2mqB1SwCErNL7PW6naekbFP2cFTNocfnE0Q95yJeuLeQHS6
         hTRHgtCM5A5BugjbcOyLafysNaN+hNG0qhyz38i7Z6qeAxOSzEhL8D3IsDVq7qz2+npk
         4Da5eJJiTaceuSH0G2h23IjkvKJOIc4zbrLtRja8rAkrbYas87WFXTn3lmRS0WMalw5e
         GokB7/mYmAGs5eH3zk6f3b1npLpWSCMkEz/DD2Z2v99gDcBIkjQwxDnpU6M0U3skIlem
         gt8A==
X-Gm-Message-State: AOJu0Yymix+djJr4eVu57jPwdArS60gzgJvrezrLIeHMhiIMoT6RILiG
	wGnWUYMPnQfWdCxdbie4P/Y1qmKpD5/b5c5il9GuzKPfM0sqzCEiFCDFh1cH721r3I6+R+A35kr
	1HG0xNA==
X-Google-Smtp-Source: AGHT+IErYR2fX0uqEW1Jt/hDr6m5ozY/eqMBmYEYZGX5WIbNApF2YfAu30cVJqx2+qm/KLiZMSEgVzM0R+8=
X-Received: from pjp15.prod.google.com ([2002:a17:90b:55cf:b0:2ea:5084:5297])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dd1:b0:2ff:6167:e92d
 with SMTP id 98e67ed59e1d1-30e8323ee6emr34142590a91.32.1747957071505; Thu, 22
 May 2025 16:37:51 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:37:30 -0700
In-Reply-To: <20250522233733.3176144-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522233733.3176144-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522233733.3176144-7-seanjc@google.com>
Subject: [PATCH v3 6/8] KVM: SVM: Remove wbinvd in sev_vm_destroy()
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Kai Huang <kai.huang@intel.com>, 
	Ingo Molnar <mingo@kernel.org>, Zheyun Shen <szy0127@sjtu.edu.cn>, 
	Mingwei Zhang <mizhang@google.com>, Francesco Lavra <francescolavra.fl@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Zheyun Shen <szy0127@sjtu.edu.cn>

Before sev_vm_destroy() is called, kvm_arch_guest_memory_reclaimed()
has been called for SEV and SEV-ES and kvm_arch_gmem_invalidate()
has been called for SEV-SNP. These functions have already handled
flushing the memory. Therefore, this wbinvd_on_all_cpus() can
simply be dropped.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Zheyun Shen <szy0127@sjtu.edu.cn>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/sev.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index a7a7dc507336..be70c8401c9b 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2879,12 +2879,6 @@ void sev_vm_destroy(struct kvm *kvm)
 		return;
 	}
 
-	/*
-	 * Ensure that all guest tagged cache entries are flushed before
-	 * releasing the pages back to the system for use. CLFLUSH will
-	 * not do this, so issue a WBINVD.
-	 */
-	wbinvd_on_all_cpus();
 
 	/*
 	 * if userspace was terminated before unregistering the memory regions
-- 
2.49.0.1151.ga128411c76-goog

