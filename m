Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E415263C8A
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562043; cv=none; b=lzJoO5gqSmJo2AmPbnp1WlBa8JoJC3TRGUCLXe81D0noaBMp3hDNmKoevK5E74+IC7a9WuoYB3Xlm14HOY9RRiJU2M8pSLdegn7W5C8JrjZeqw9ZnHkxHX4HYwgqQnM58JclzSUiyFEolZs6T2XbOxVIyP3T61qJPU1HuExl/mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562043; c=relaxed/simple;
	bh=XxjnhMgnSS8MQbWGc8B+Q7XSqvDBAbS+uigF7Petd18=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eovDdPP4e6OWNXtI650tVI2I6AAJStfEuVDQrfES2ShjHhujQvi5/7s05R8CxR6YGXBi1Yvk6dR9GYorKAczJJTfZ3GgBots5Rbg7ejZy6XD7h0UhEftSrrbfQ3kGqfvWG+j3FtUl2MQaCH/I8L+xIQo1kPIcwF0qtUd70hzdvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mByjQctO; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mByjQctO"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7370e73f690so1540868b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748562041; x=1749166841; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WHl6TJ6f1E56pNqwyH1ONtdj4EIup5/gmNdjp5O50Ac=;
        b=mByjQctOC/t8TEcit3+J4CBkmd6ZLro4MidFVp6aN1fzxFqnP/19qm+vQBajUa/RGy
         ic/2dgtk30akbZswOHzS7skvTIQmh3VaQL/OH7bGER5iNWzMVsn7QsEyAntu4lL4ZJBf
         N7M6XXga5bllXdY65CrXll7k1549kbMIIbiWM97WNpBzVW9vnjuzLCI8g/XQfgvOQWFn
         HkP8rUSpDfwXZ5qKFmwOGwZaKAmvvtvj7CVubVlfaO+q1i9xdk6NjO7OORE8boobWD2U
         atB0/I6dUTIkHMByygD15DYmDwUGOCq4t3KO4j5EoCadFL2K7RgweqLjw1MMNzk/kf1H
         uJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562041; x=1749166841;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHl6TJ6f1E56pNqwyH1ONtdj4EIup5/gmNdjp5O50Ac=;
        b=fOwBOrJuvvBsWJaW6ry+M4PX1xUsIMOKlod0CdDLX5hAxDxa8bQmRt71qv4+N4jjwB
         xIW5e6kDHrPg5iy/yua70n4rDtthZice/LkPWL05ecMerD3cumrRrXSXZA/SDqunTkrC
         LrM6+6rIaVb5KDhij+Lt+tCCmuobZFlrBFkJs3Dn76+O6yKFyTxSvDr0YCtt7b1lzlRU
         xhs04ZWU+Tbd40oD5CgoPXwAYOioXRSP/Um5g+xWdNszR9L6ZMauYIYxc4AM5/wNBHer
         CCPUHhoBwsbPr7AhSOur0PYdB3EfFjBiqildtuVngBCpvBouyNWrHUrbaXdauBNef9+s
         4gGA==
X-Forwarded-Encrypted: i=1; AJvYcCUnChBIPqt13u9K+aCVCmkxoLPyUrLFr06PT/vUJggQPsX6HSRx9A4sKe4o5500hqmXcoeM5JuQEshhMEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaCJBkUY5sGP741oa+pqs8EVhZRHhhZZiV9QSHbXp6NBeCEu2k
	E5NKM7aKldewMpjCIOfZSX2ZQSm36YCNVZDYQIAovKZucF56GEvcDiGMCjGrq4zCxM/JV3jyDDT
	+5oTp0Q==
X-Google-Smtp-Source: AGHT+IHRWO6MapXktW8B7uJsbKRj0LjR8P1yoOH3s/GZFnhMx1juW493WtoXgMf6rX7uXjXLX55mcJfIKjI=
X-Received: from pfbha17.prod.google.com ([2002:a05:6a00:8511:b0:747:bd1e:eebe])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b49:b0:736:6043:69f9
 with SMTP id d2e1a72fcca58-747bd9e6d31mr1808508b3a.19.1748562041461; Thu, 29
 May 2025 16:40:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 May 2025 16:40:00 -0700
In-Reply-To: <20250529234013.3826933-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529234013.3826933-16-seanjc@google.com>
Subject: [PATCH 15/28] KVM: x86: Move definition of X2APIC_MSR() to lapic.h
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, Chao Gao <chao.gao@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Dedup the definition of X2APIC_MSR and put it in the local APIC code
where it belongs.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.h   | 2 ++
 arch/x86/kvm/svm/svm.c | 2 --
 arch/x86/kvm/vmx/vmx.h | 2 --
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
index 4ce30db65828..4518b4e0552f 100644
--- a/arch/x86/kvm/lapic.h
+++ b/arch/x86/kvm/lapic.h
@@ -21,6 +21,8 @@
 #define APIC_BROADCAST			0xFF
 #define X2APIC_BROADCAST		0xFFFFFFFFul
 
+#define X2APIC_MSR(r) (APIC_BASE_MSR + ((r) >> 4))
+
 enum lapic_mode {
 	LAPIC_MODE_DISABLED = 0,
 	LAPIC_MODE_INVALID = X2APIC_ENABLE,
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index e0fedd23e150..c01eda772997 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -81,8 +81,6 @@ static uint64_t osvw_len = 4, osvw_status;
 
 static DEFINE_PER_CPU(u64, current_tsc_ratio);
 
-#define X2APIC_MSR(x)	(APIC_BASE_MSR + (x >> 4))
-
 static const u32 direct_access_msrs[] = {
 	MSR_STAR,
 	MSR_IA32_SYSENTER_CS,
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index b5758c33c60f..0afe97e3478f 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -19,8 +19,6 @@
 #include "../mmu.h"
 #include "common.h"
 
-#define X2APIC_MSR(r) (APIC_BASE_MSR + ((r) >> 4))
-
 #ifdef CONFIG_X86_64
 #define MAX_NR_USER_RETURN_MSRS	7
 #else
-- 
2.49.0.1204.g71687c7c1d-goog

