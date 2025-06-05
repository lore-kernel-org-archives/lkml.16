Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B02B274FC2
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141563; cv=none; b=htZZEipGqK5NRWVOEgLHH48YGyIZ3Hthdvkg7vsmqc7MlI0usEUi3X3XbaH/nu/KOLIQWByHAjdhwZ4QJaO4rS68IeJuBwgEjpGP/RrutcQCidwD2D1N5k9i60r7722aOhWGAPrMmzYsktSvQ8DRrSj0UappP56pMrTkENQ89uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141563; c=relaxed/simple;
	bh=H1YPp6+o+p2q7dIafkj50JICd7zLoaIKYOyffRXuexQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GrcDRyy4X6tRWDf4kUoG/vgzCbMfqBeD9QDLa4k/cJYKT1pTlWlO2Btg981ELd3V8Y4zOlBeHpdIbMkb8XYQhElChqRXILJRa1RCrIDJIpYYKerZO//KevdHcAD7LuYaemdCjezI0TANC3QHyDlSFUvbOd7RhaO8NjEaGMybhK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xMaBO2hv; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xMaBO2hv"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311fa374c2fso1938741a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 09:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749141560; x=1749746360; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RLHLJ72ZskhzqHD5wQqoMHh6pl0NfS3wNoq8ri0R1wo=;
        b=xMaBO2hv+9j/r5I4E+Sgxb4MvmXBE7t0MX8IjJiuC4Hd/Bh8Qniz0nFS7u0fjlp9pY
         HoppUpb9NPJEjQH5M89QYLXHxbsrwLLQpbce0kUfiNSXLz1UEt2Kab1nlI0FyFrYODMz
         EahrxdpEUnFF/L4+6HzSoZ92NNCieakk5YC+hWkE2ehrLOvXz53cFNL3r987HKoo274b
         VF7nvmjhpognsEkDjLx7CnuYQ9QmgicHvGsetOYyJsO3SYsM2V4+69lSgF7qpfzk15K3
         4lu7ciXiidf+baqAgzynEkvOND6a0CatG4T3MfpRsQkjXieu9YpBBsAOHHVbmchNFx9j
         Up1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749141560; x=1749746360;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLHLJ72ZskhzqHD5wQqoMHh6pl0NfS3wNoq8ri0R1wo=;
        b=hVqpFvkwCmqPkuLNx+8gU5BrY2DHUr8rohk+vdp2sa1OsFFphwxj1wz7FUeGAkC32T
         SOTQMvlQfeA/sUiAZLgAI3TZP9laCGshDud9TJzlW9p4MRwp1/APOdfDeQoh/HeUH0c4
         zUoSx3rubKkrW3OZPjJmnKOVskT7t7AuPHn2MuAsdomIZAqXUMEUVnWr/ibHa9u08lyR
         Vx6+j0VhjC9ruyRyIYDDOdqphLeN4x0ACW8PnT3v9wrjivGlgXTpBdzIUBze7ieJwEiW
         Ajnt8AhO34y64pylC+31gEmFSTZj+YFhUDGI88P18MzGz7l1HGW0+wxSpt003tJHpeIb
         vUkw==
X-Forwarded-Encrypted: i=1; AJvYcCWwYAxjztwBFGS6luU8wreYpsDP1pXqRe7BnozBNwuyfixI+hmzKOtu5uF9LeHv1xRYLoToVZV1S40eJzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrcYs9vVVs6ZNLpmM91FHVzpYNtTR5M6XCrtMga5M/kzuHI0zQ
	omhOu+4vqOlW3V1Ro38j115ky8NaqOA6asNDk3GT4nrNxxiNhdVioSDBKDzOA3kev7zl3F0BCpi
	MTu2ctA==
X-Google-Smtp-Source: AGHT+IFvFrLqHR1ghrQGa/UNDi1qRfKtC9i6a3FVhMJPpt61M52gk1rUWTLvFny4IIdNm62PLyCcaiVBrlM=
X-Received: from pjbqb9.prod.google.com ([2002:a17:90b:2809:b0:2ef:d283:5089])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f8c:b0:311:df4b:4b81
 with SMTP id 98e67ed59e1d1-313470578eamr495536a91.25.1749141559893; Thu, 05
 Jun 2025 09:39:19 -0700 (PDT)
Date: Thu, 5 Jun 2025 09:39:18 -0700
In-Reply-To: <aEE4BEHAHdhNTGoG@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com> <20250529234013.3826933-18-seanjc@google.com>
 <aEE4BEHAHdhNTGoG@intel.com>
Message-ID: <aEHINux8hnYC6HC7@google.com>
Subject: Re: [PATCH 17/28] KVM: SVM: Manually recalc all MSR intercepts on
 userspace MSR filter change
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 05, 2025, Chao Gao wrote:
> >+static void svm_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
> >+{
> >+	struct vcpu_svm *svm = to_svm(vcpu);
> >+
> >+	svm_vcpu_init_msrpm(vcpu);
> >+
> >+	if (lbrv)
> >+		svm_recalc_lbr_msr_intercepts(vcpu);
> >+
> >+	if (boot_cpu_has(X86_FEATURE_IBPB))
> >+		svm_set_intercept_for_msr(vcpu, MSR_IA32_PRED_CMD, MSR_TYPE_W,
> >+					  !guest_has_pred_cmd_msr(vcpu));
> >+
> >+	if (boot_cpu_has(X86_FEATURE_FLUSH_L1D))
> >+		svm_set_intercept_for_msr(vcpu, MSR_IA32_FLUSH_CMD, MSR_TYPE_W,
> >+					  !guest_cpu_cap_has(vcpu, X86_FEATURE_FLUSH_L1D));
> >+
> >+	/*
> >+	 * Unconditionally disable interception of SPEC_CTRL if V_SPEC_CTRL is
> >+	 * supported, i.e. if VMRUN/#VMEXIT context switch MSR_IA32_SPEC_CTRL.
> >+	 */

Tangentially related, the comment above isn't quite correct.  MSR_IA32_SPEC_CTRL
isn't purely context switched, the CPU merges together host and guest values.
Same end result though: KVM doesn't need to manually context switch the MSR.

> >+	if (boot_cpu_has(X86_FEATURE_V_SPEC_CTRL))
> >+		svm_disable_intercept_for_msr(vcpu, MSR_IA32_SPEC_CTRL, MSR_TYPE_RW);
> 
> I think there is a bug in the original code. KVM should inject #GP when guests
> try to access unsupported MSRs. Specifically, a guest w/o spec_ctrl support
> should get #GP when it tries to access the MSR regardless of V_SPEC_CTRL
> support on the host.
> 
> So, here should be 
> 
> 	if (boot_cpu_has(X86_FEATURE_V_SPEC_CTRL))
> 		svm_set_intercept_for_msr(vcpu, MSR_IA32_SPEC_CTRL, MSR_TYPE_RW,
> 					  !guest_has_spec_ctrl_msr(vcpu));

Right you are!  I'll slot in a patch earlier in the series, and then it'll end up
looking like this.

I'll also post a KUT testcase.
