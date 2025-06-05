Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FEF27BF99
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749153028; cv=none; b=ULdPeJtZDTesOH6KWg1nBJVpHrjZqiERCh3RGQKD1u+UVaPkLtR5v4wTkWBY4XNOEMQ5YPZ/TsLsUwhJpYc/X3YYbo/s5lECK1Rnpiey0nMepTGuAQnF3VPkXTBtpqmIwIS/7Ge4lsadIPKaaK/fq6UILv1rsawJcagCdyAFfdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749153028; c=relaxed/simple;
	bh=tl81ljfB6m8YEQiW9w1zLjezK6LB1wYGmVO0WO5cqpw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l8Tq6X9tO3SZutoEiUyulMsRcVyfnMZN75uz8YSBK5nT8hKzbzQR7Vovt1gg0P9ljyYgGBNzCxg8sV39dqmmpfNZiSvE3YYffe4IQm63uLSw8jkMDr4RobTqrkFQ+Zb4F/pbi7wKeTnMi1Qp94HZiSIGhysT/TTalIGDNOKof0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WhqAjHeJ; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WhqAjHeJ"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so1410420a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749153026; x=1749757826; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=cgrnOpyorI2GhVZsMGYu/YaMrQ323arhHY5WTGYiVCI=;
        b=WhqAjHeJZ60174zfRoBfnp6771s/VNB5m6Xx78FcSptRm4YOP2wjp0tOeC3NwkUEMN
         TCPgK1qHNX7D82uG0zo/PbGXEhhnEuiuUf9J5gDZmU4rgs81CZCLcLM+JQTWjJ52GHIs
         CZ1BNIPvvdPn4mVFjxXrLNR+CSANedzC+osCsKJaGhQfmYlTJjkksS1LDwdp1EU3RNAv
         HLsKzmR+hMnHEeBLrH6OgMpIqDNsaJl1o0maGa83ELZMCkZGSigq9y6DrTkHbzWqToJF
         mIPOnp1YIEaUrNtTOk3Ao3vey+HTNMJRS9DAUZYMngsEjCmgm8j7Fwf8aqZQsSUIU+8K
         P+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749153026; x=1749757826;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgrnOpyorI2GhVZsMGYu/YaMrQ323arhHY5WTGYiVCI=;
        b=bMJjcpINUR0VIpWbt6INqSMx6yeiLJNEVRgdVAa6SC6iKORwn2Cur1d1ibfB33pbYV
         7+S9V26pR6vsA5nJVCeokM7OTbXNhGr0P68FJxX1ZwKwh7NIaKLvH1kqx5Gg+02BDcyS
         WAarjpZYV8s9lSgmbvGTn77pcDQEc1n2c/+SvuNEmpxnsgc1py6o7PKanfjU2haBkK69
         ycPvPp1dV/k5cVEpPCdfzubs3u3bL/x7qa5DKjLIr+OuzLWz56jWmZmDZdE/RbWZj99d
         Ysw5t0q5m16189C+uQDeC6KtnBBsnx1AxHw1dUIL5cCvhVu61K70RznsMNsv1GlIkxE2
         R/iw==
X-Forwarded-Encrypted: i=1; AJvYcCW1JGuLk+kEHLtEBOrW5PoutTdYPQuO41imY1Tayx0MG07XlqHGxuVRFEahTR43wMJXBvylXSqwceCIpJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKa2kCDBW/K1P4pr+4NcLdkiQuau4Wvu/QKFN0d1uKhSofVJO8
	Wjmr7FFxa+5p6fo3w21XZAjeSSExHmIpExPoZ4JiIJMMyV4MbKujjpiPLrpsf5nxYoLwAibPUu6
	dnz+Kzg==
X-Google-Smtp-Source: AGHT+IEZob+J3u5Z2wcBpwf1N4gsPZ0uQKkkjBrhxp9Yl3Dih0oUARprTHpqEFsp7BJJHZ5reANLHpSk/Q0=
X-Received: from pjg16.prod.google.com ([2002:a17:90b:3f50:b0:30e:5bd5:880d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3fcb:b0:313:2b30:e7bb
 with SMTP id 98e67ed59e1d1-31347308dfamr1432898a91.15.1749153026536; Thu, 05
 Jun 2025 12:50:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  5 Jun 2025 12:50:16 -0700
In-Reply-To: <20250605195018.539901-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605195018.539901-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250605195018.539901-3-seanjc@google.com>
Subject: [PATCH 2/4] KVM: x86: WARN and reject KVM_RUN if vCPU's MP_STATE is SIPI_RECEIVED
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+c1cbaedc2613058d5194@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

WARN if KVM_RUN is reached with a vCPU's mp_state set to SIPI_RECEIVED, as
KVM no longer uses SIPI_RECEIVED internally, and should morph SIPI_RECEIVED
into INIT_RECEIVED with a pending SIPI if userspace forces SIPI_RECEIVED.

See commit 66450a21f996 ("KVM: x86: Rework INIT and SIPI handling") for
more history and details.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 7e3ab297a1bf..c3cbcd9e39f6 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11547,6 +11547,20 @@ static void kvm_put_guest_fpu(struct kvm_vcpu *vcpu)
 	trace_kvm_fpu(0);
 }
 
+static int kvm_x86_vcpu_pre_run(struct kvm_vcpu *vcpu)
+{
+	/*
+	 * SIPI_RECEIVED is obsolete; KVM leaves the vCPU in Wait-For-SIPI and
+	 * tracks the pending SIPI separately.  SIPI_RECEIVED is still accepted
+	 * by KVM_SET_VCPU_EVENTS for backwards compatibility, but should be
+	 * converted to INIT_RECEIVED.
+	 */
+	if (WARN_ON_ONCE(vcpu->arch.mp_state == KVM_MP_STATE_SIPI_RECEIVED))
+		return -EINVAL;
+
+	return kvm_x86_call(vcpu_pre_run)(vcpu);
+}
+
 int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 {
 	struct kvm_queued_exception *ex = &vcpu->arch.exception;
@@ -11649,7 +11663,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		goto out;
 	}
 
-	r = kvm_x86_call(vcpu_pre_run)(vcpu);
+	r = kvm_x86_vcpu_pre_run(vcpu);
 	if (r <= 0)
 		goto out;
 
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

