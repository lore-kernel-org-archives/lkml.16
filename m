Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E2E26B08D
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746461662; cv=none; b=t7Uhozc8OnD4m05FAXXXQwVJsstjB+4OZrBnMWAnDmpRWzdFczlbggfLeNTQphny3jILTcrJSijXuCUOIJER0yH6kYSImKkEMLtVgJq3SB5lPkK9qNTj3p7V5w3JkKUPpWAgC9OmEGbLG1/o6hM3eJG3SBwsyIyLZMMu9w+AXrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746461662; c=relaxed/simple;
	bh=tP/Dy38GceNJDf3Zr30G5oxFd5DNpiB2roiPdOIJcEM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mfWGUq5BZuQLVirjslp0Worciyg+f3ywmjIG/oKvmFc7AVP2elZJMirbxVj32LNtttCJELvt9h2gTB37HEZxUv1DiXfryrndASwnLS3VhXA0os7E92sICm1F9hiUNsH0S+2CFyhS1vt4q+kucUoPTLjFGH90f9ILr7oBJx4CUu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dq1de9w4; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dq1de9w4"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30872785c3cso6774265a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746461658; x=1747066458; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OJagTHHNdVxyDzkTZrB+wizm+z9g6erBUIGhulC+0c0=;
        b=Dq1de9w4Pg5IEbVQ7AXzJAaX/hESIaPjg90O5SF3l8pDliiJs8rWe/u6tsuAracit+
         enRAQfE9EORFZ42ebCyZa/bC3BkD3qJd1OLRJbfQsGNX1Lf2jsi37yU9tsRg0uYDDV9g
         x11w5UrCq29k3EZSL14EV5gjIXw6SNj5/ORvLunUPHvhVR/ATPCRVnKOPUJmbOioPwSi
         t594DaLU7cHR6EtgdIP8I3gfqiNQB61vXIR6jmEMrJT45xYeTEZEH+CaaQ7TPClYXqgp
         lCkuzopDk+YmuIpvS5M/GSSIGAvjIvQbOAkWflbB7G9WX7fbXnytQmFBnALrXvkj11Md
         WxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461658; x=1747066458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OJagTHHNdVxyDzkTZrB+wizm+z9g6erBUIGhulC+0c0=;
        b=Y7gO9Ga/LReFb3d3wjCf/oJINN84Y/PZJL/0LH9mmDMYSLVyoTn+bqqxJdklWTd+if
         d9jRxcJ1bHMxs72X350bGbyF3QGxUU4RfbV1aIYGCyLcDIv0lQhUzuYiYA0fFtYAaUFg
         TeTIx1aygwvHRG69WqhPlN78nzPSB1Z7DRHHOwV43f0uxKR8ecu+UxAE+I3aCviHRwSC
         aYu0FeHw3x0e+SO5ZQ8bM2xAhebVXG5pF7h8LFhsB8Wxbcw6SuWaoQF4WFIQVDcSNoYJ
         Tv6hyknp22TiqjmzH9ewHT2z+OV/KF1dndw2RACfpb8pS6iXN9Lcnn/AXsRIBxB+1sLy
         BiUg==
X-Forwarded-Encrypted: i=1; AJvYcCVFOusyZiF4UGexqKqXePF0Zzf5dtpFCX234S7scDmb8OnH+ZCyvmi7Re18/aTQEwjKHZkoPPbdubOX/GE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Gd5+bmeUnCewkRWjh2Jy6Ch6mhSymVxJV/XYWHAwLHyD41RP
	Bx3/+tj3y8YYf+GM8EahPqhOyZ0tFQnGoEQ4KNxWZ23bDohz+tSUm1MjPB4RfrE+Pnpn58iMMx3
	dEGJsQU2MzQ==
X-Google-Smtp-Source: AGHT+IHmeuVYVihs7sQ36TEo2hNXWZbWh14KISXEiA150JU3zbOiiYwpdjNYy9bWt46liO2U4UYaoHnwxcbrZQ==
X-Received: from pjbpw4.prod.google.com ([2002:a17:90b:2784:b0:2f8:49ad:406c])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d883:b0:309:eb54:9ea2 with SMTP id 98e67ed59e1d1-30a5ae3f34cmr13505195a91.20.1746461658457;
 Mon, 05 May 2025 09:14:18 -0700 (PDT)
Date: Mon,  5 May 2025 16:14:08 +0000
In-Reply-To: <20250505161412.1926643-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505161412.1926643-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505161412.1926643-3-jiaqiyan@google.com>
Subject: [PATCH v1 2/6] KVM: arm64: Set FnV for VCPU when FAR_EL2 is invalid
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	duenwen@google.com, rananta@google.com, jthoughton@google.com, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Certain microarchitectures (e.g. Neoverse V2) do not keep track of
the faulting address for a memory load that consumes poisoned data
and results in a synchronous external abort (SEA). This means the
faulting guest physical address is unavailable when KVM handles such
SEA in EL2, and FAR_EL2 just holds a garbage value.

In case VMM later asks KVM to synchronously inject a SEA into the
guest, KVM should set FnV bit
- in VCPU's ESR_EL1 to let guest kernel know that FAR_EL1 is invalid
  and holds garbage value
- in VCPU's ESR_EL2 to let nested virtualization know that FAR_EL2
  is invalid and holds garbage value

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 arch/arm64/kvm/inject_fault.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index a640e839848e6..b4f9a09952ead 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -81,6 +81,9 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
 	if (!is_iabt)
 		esr |= ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT;
 
+	if (!kvm_vcpu_sea_far_valid(vcpu))
+		esr |= ESR_ELx_FnV;
+
 	esr |= ESR_ELx_FSC_EXTABT;
 
 	if (match_target_el(vcpu, unpack_vcpu_flag(EXCEPT_AA64_EL1_SYNC))) {
-- 
2.49.0.967.g6a0df3ecc3-goog

