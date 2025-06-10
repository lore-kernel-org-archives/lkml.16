Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C40A28BAA1
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749597621; cv=none; b=bLOmyWPXsiaYHqjq9CBCX9LdscCGY/zjM7W/9s6xDgVNSphavLcUvNruLpQZT0rAk/1hYFIhOhVcI88JgzfimGsaMMgD6uoF9qJ6nG4CwdXsZvb4aTFr9i0NWJBPtBZYrPibaVjScN1aJrp49jDV/FsCVejRvh4NLBy1EdKpcUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749597621; c=relaxed/simple;
	bh=lXPkeIDdbhFAfpOJJ2C/Lh95pW+2tzzpPk+8BOhZXcs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IkMpPsw/S6MII6nJ+u1A8oUWlUWsOn9lri0VL0sz3QiljQT+uiZQvvYsoWSn9zll3QwOZYXfY+zjokEWEBpWDAgVxqKtp6XPeF4hh2l1QpOW62NWkeCiHFfbHt+kI3PzSbCregEekX0VCu8i+MX8NELg6acLQQxLVOc0BnLwskI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hen0PwyX; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hen0PwyX"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-31215090074so8278378a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749597620; x=1750202420; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/+XzMzGMwW1mTSC7isLrm0UkjItZs/9XrzbKK280m3s=;
        b=Hen0PwyXf8bK84Em2C0TUTEpevtA44Byd/WHtHXgRzDfXcYqOMVto35W7Peeko5rd5
         IO0In1fzwBC/aQDBZBz9HKeGI7UnHBNJdNm7Lq0ImvpLgL8AJLMBJ7fLES4oWhFz9oRM
         yR9ToBy+FIiR4UdjkWUjhB7Lch56BPvPWgGIHBnAuZmwgjY6svQPRndKsisfN1nE1vMI
         irrv+jfKxeyJWC4oDgIZ2cYPiK45ZtsONLZuvs7jk8TZGkDNbRI118Fpsu27Euey5C/e
         iAiGlvLwJlZ4e0PYleeJQiWUO4lPK0+2zpieB5DF+27funxNydN0vk3O8mHQ/1/TSYHd
         DTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749597620; x=1750202420;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+XzMzGMwW1mTSC7isLrm0UkjItZs/9XrzbKK280m3s=;
        b=clmNzhPCRqgsQ4SgordPVTI+817ZXmeHI2cvJ4wM8aFanSuTX5MUvv5VaMJU9GF75N
         9SpF7sTF8MGo/RZgmtd3cUvVlR3Hte0E52httFrPvP7dihCA6nfY53S8Ju5MJ6BoYkKV
         vJT0E20EM5B7hg95T0OO9mZx/+hvlncraLeXRSoul5vbKfcSriM1zyYiB50BVcYXeCuP
         Bl6mYtbw9zOxSVAr2kIC8h2tMVmu6VwE0zIq8jFrlUGAGN8TGFxfDBap1CHYcaj59wvF
         CZB2xXuNFuK44UxpyAeuQkLXTmNQhWmus52FQAyfgF6v6esa2e0h2eLKk2Eo9Yr8vkFK
         i/oA==
X-Forwarded-Encrypted: i=1; AJvYcCWVieZ5Ny1ifhIodvCTztkfxjBqLKgiz3sytOFveLHwHdBG+BkN2DTCQ2H0EQAFK319PkpzBEJP7zCkQzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfkjQQ/aRYG7dYUzkVATPY+ScNI7HTHB3jgLblKn9b4f+Xg4Ja
	78lJEzHHeNyiFNk5BUcNdlcwyj3OkPxTgEzz+3vxJbNxuWYKVniGybIN7J5eatIF7BseBPCc5qn
	euxp+xA==
X-Google-Smtp-Source: AGHT+IGjBSpF+t9nRnBE2yjDswB3i2/tgdFb8nESgCpkvF6L+lDEma6Rbjm27J6NcdvQSxbgv2QO3ChvtY4=
X-Received: from pjk13.prod.google.com ([2002:a17:90b:558d:b0:311:b3fb:9f74])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:53cf:b0:311:df4b:4b91
 with SMTP id 98e67ed59e1d1-313af14a46emr1906302a91.7.1749597619931; Tue, 10
 Jun 2025 16:20:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 16:20:06 -0700
In-Reply-To: <20250610232010.162191-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250610232010.162191-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250610232010.162191-5-seanjc@google.com>
Subject: [PATCH v6 4/8] KVM: VMX: Allow guest to set DEBUGCTL.RTM_DEBUG if RTM
 is supported
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Adrian Hunter <adrian.hunter@intel.com>, Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Let the guest set DEBUGCTL.RTM_DEBUG if RTM is supported according to the
guest CPUID model, as debug support is supposed to be available if RTM is
supported, and there are no known downsides to letting the guest debug RTM
aborts.

Note, there are no known bug reports related to RTM_DEBUG, the primary
motivation is to reduce the probability of breaking existing guests when a
future change adds a missing consistency check on vmcs12.GUEST_DEBUGCTL
(KVM currently lets L2 run with whatever hardware supports; whoops).

Note #2, KVM already emulates DR6.RTM, and doesn't restrict access to
DR7.RTM.

Fixes: 83c529151ab0 ("KVM: x86: expose Intel cpu new features (HLE, RTM) to guest")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/msr-index.h | 1 +
 arch/x86/kvm/vmx/vmx.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index e7d2f460fcc6..1229396a059f 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -419,6 +419,7 @@
 #define DEBUGCTLMSR_FREEZE_PERFMON_ON_PMI	(1UL << 12)
 #define DEBUGCTLMSR_FREEZE_IN_SMM_BIT	14
 #define DEBUGCTLMSR_FREEZE_IN_SMM	(1UL << DEBUGCTLMSR_FREEZE_IN_SMM_BIT)
+#define DEBUGCTLMSR_RTM_DEBUG		BIT(15)
 
 #define MSR_PEBS_FRONTEND		0x000003f7
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 49bf58ca9ffd..ab5c742db140 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2184,6 +2184,10 @@ static u64 vmx_get_supported_debugctl(struct kvm_vcpu *vcpu, bool host_initiated
 	    (host_initiated || intel_pmu_lbr_is_enabled(vcpu)))
 		debugctl |= DEBUGCTLMSR_LBR | DEBUGCTLMSR_FREEZE_LBRS_ON_PMI;
 
+	if (boot_cpu_has(X86_FEATURE_RTM) &&
+	    (host_initiated || guest_cpu_cap_has(vcpu, X86_FEATURE_RTM)))
+		debugctl |= DEBUGCTLMSR_RTM_DEBUG;
+
 	return debugctl;
 }
 
-- 
2.50.0.rc0.642.g800a2b2222-goog

