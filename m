Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEBE1EBA1C
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254699; cv=none; b=SGAervyhmeonNdbD4DaBa5RqpesrLQAsCyoXYB/rTTsPIzcaOiGXyQzaMM2pDRDuGJ76NhCdI2m1dBCdcv3Fxz7i33SZ0iUPn4wRuRp3cxstlcoJISErCcF4ny67AN2cjhCSWTiAXVF5lcSoOHsUsQ1gp/Ssduy07bmTPMz40AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254699; c=relaxed/simple;
	bh=jLO94T/rfsKNszrDBAXBuU7MElfZOIVS3fTfu8k5I70=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DTwJdm0zRORpQyD3yiklisQRx3JExCD2G2wJhRmwVlnHjzNbbdyWw1ejWGIQborO2ACmnKk1lIe6/1lnXqhuDjVzykz28oNPXVa/nDxDt7pFeZGDvAzfQ4XOgy2BonWRpIb3Sls34HwSSbFmPviZhP/WRvtxHQuHhHxXSnbbHHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Je+24Mx2; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Je+24Mx2"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-216728b170cso20510135ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738254697; x=1738859497; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgChTB+h/v0V1ILcaues3kTeRfwzF+xBPcgEstOaJbY=;
        b=Je+24Mx2NJSMtT5xVeC4/bgqefeykaH2cxZZJWq19OdqqwaZ60paymPv+ta1E52VyZ
         re1RNVWrKdohlEKbyS6H9gvFy3gm5MRncexGDQX7RJLP5vmvsmLzEwJ8r3k+TlXvmk69
         Qs4KuEQFcvXPOytGrGE5FAUL+k1IVM3Fp024fjvy8nQVHc1f1FrWh7HjC9YLu/1hjBVi
         IUgmPs9MvUh0GngJC70tDCWQXrxeQOHmDZWLFyv1uoOHkm+u6R6YVkMChajWy3tV0b16
         0bybk62L54nv00u5MRS7KDWx9ZOWAijZjsof/2oXpm9uRfbievyRLYxxyPKnzYMax6wX
         r81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738254697; x=1738859497;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HgChTB+h/v0V1ILcaues3kTeRfwzF+xBPcgEstOaJbY=;
        b=WcyhtXe0AubY2LE3EHje2rZGOhJ8UXiZKen1qjNZBYdXqYLwZJv8biGGz0XuL8/QbF
         vPts8sl9l9tCSvCwCh++DTmU/cP0ALY9ZcPpH38Lgv42bWqT/kVSZlEwAKFkAAUZgWwa
         X45pk3odu/u6vAwqpdbsJg4un2d0b6L6SczqMv4iaGw8x6TxMoR6xiP7U4x9XIDJCFwu
         ibYs/dagOJXoPyACGMAAoBX5I6w8l6vAFAnccI4fnbqJFZ8klf8ReV+FPkv1odFNIoyi
         2+Mib+BfbHD/NriFYmTh8XW1deHOE9hVV1DJo+L35UdbXa127mbdN1R8q9bWmclYEFbR
         UhXw==
X-Forwarded-Encrypted: i=1; AJvYcCWjC3w8kVSpN+SnxBVipUz/hu5LfPEujDSudd/Jk3tx24rj/2hxzfZpneuFhoACAj8EPfnKEw4d1xa7fzo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7CmG4tL7sb6UyXa5KKdZ+hWPXzKlI8/qo4ACGJ3BvZpHtJwdw
	v/68HMBgtr6h0fZSrmrF0A8onIelGwon6tJidULKSxJtyb54gzTeTmo024Z3DRZMiwtssNDn+pj
	GLQ==
X-Google-Smtp-Source: AGHT+IFdxwqEpVPHkNTx8enKIzhdfrGcuN/btBrdsQSLMQOzmDaP/yF2U8z7MObmKxVtbnzvzQFlRPqDFI8=
X-Received: from pfbbe14.prod.google.com ([2002:a05:6a00:1f0e:b0:725:c7de:e052])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2d07:b0:1e1:a07f:9679
 with SMTP id adf61e73a8af0-1ed7a5b67a5mr12830134637.4.1738254697505; Thu, 30
 Jan 2025 08:31:37 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Jan 2025 08:31:35 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250130163135.270770-1-seanjc@google.com>
Subject: [PATCH] KVM: selftests: Actually emit forced emulation prefix for kvm_asm_safe_fep()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Use KVM_ASM_SAFE_FEP, not simply KVM_ASM_SAFE, for kvm_asm_safe_fep(), as
the non-FEP version doesn't force emulation (stating the obvious).  Note,
there are currently no users of kvm_asm_safe_fep().

Fixes: ab3b6a7de8df ("KVM: selftests: Add a forced emulation variation of KVM_ASM_SAFE()")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/x86/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index e28c3e462fa7..61578f038aff 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1251,7 +1251,7 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector,
 	uint64_t ign_error_code;					\
 	uint8_t vector;							\
 									\
-	asm volatile(KVM_ASM_SAFE(insn)					\
+	asm volatile(KVM_ASM_SAFE_FEP(insn)				\
 		     : KVM_ASM_SAFE_OUTPUTS(vector, ign_error_code)	\
 		     : inputs						\
 		     : KVM_ASM_SAFE_CLOBBERS);				\

base-commit: eb723766b1030a23c38adf2348b7c3d1409d11f0
-- 
2.48.1.262.g85cc9f2d1e-goog

