Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C125A24418E
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562021; cv=none; b=oyzTzdtfewu2CRxhLX9us19uQsrMG5GytI6cY+jrYwmsRFPIsCVLfc8E61bDne9rJrzEPv1VbzoSbzPTOCyopN+8VLWrikYdibCiPGAc74FSzZN99VqgD1RwYwDl9/hHuNMGLI8YowcWmx3obz6gdxbY60UQp9yURLRR1Z3zFXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562021; c=relaxed/simple;
	bh=U/vnhsbhBOR3k5uzXGTAfxXyl26OU5KIOSFsBImEIys=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=scRaymTEaqS22WWKJhWDmZgJVmeT0zmUkvmM0+NRjh1yT8PUk+Ubl2U9apRV4lS4BMdDKnCRulNFg1Mu7+N4xYV/sH3x6LUn8tA66HmFh+HZyuWvIvaPDZ50/3dUEe8Y+xUEYnGaZLLPHrzPe60fK3XTlwF2igVD1S2cTviC+pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Tb6UnoM; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Tb6UnoM"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b115fb801bcso1554319a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748562019; x=1749166819; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WOXO0V2L8rQ7JjdVAp3b4RGjNKGfCgDRi8jurzt1lTM=;
        b=3Tb6UnoM3evqboBeCZPG+9MokuzgUzb7j62Ntboyo8zzAeJyLMWiVMqIQdtJzz1gJx
         Wi9s3NZLToxyCwjTw0jJD3LXLbX7BzfQ8BMZRZQoXaTmIPdMV8qvgP3AWnfMZk4U9jiZ
         J4TE8EOjTG/iWncqv0taHyVm8EHEQRet47FH3lDEhpj7jVrDffvEY21a3XkJ8CCNocG7
         RN4vmQ63mqvj1bHlLy/d1qXBzctgBz3+5pflDK0+q7gCl7rLG1VSE0u1wr0d6MdeazXr
         Lar5uyWHqHdIMeGuMEx50Lbn8RFhboSXtJDpUTpSiKhpJBg8+aqejQoEpEP5j407/80f
         dAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562019; x=1749166819;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOXO0V2L8rQ7JjdVAp3b4RGjNKGfCgDRi8jurzt1lTM=;
        b=eBI9vE39S4YvmVInrhZt5kKbNKtCeAupMYSe8CZ6S6pdlpuSR1LGcgx7MRUyoYuZAa
         c8ZpiRz7zsVxdkArdViQM6BN5r5lYPh61UDntBBkjvQjP+OGdr+t16io6S7I8U/plAwA
         IppOz0Kfkz4lYDrmAbovNOIBtgfAipAyp8plU3YPEt5U9YRdl3nMGpSgjCDOrdVXek0c
         1O+0PnMK8fMT0wN2btLF2/4qaUw4q9QT8wmXFXB9zR0lf6CH0wO+0gTgRZN16hc+sDNx
         9nBFKyXxNSaUgXK461xsROgusSTanF+QxcNv57qIMIkupD1YWynQw77pqkOf038Oi350
         oAUA==
X-Forwarded-Encrypted: i=1; AJvYcCUngQNK+LHpU78sRargWKGiU98Dlf6oS/DBfJyGbqxB4DNBdPmwFjbtWktfQuHohBpsl2XeXlXpomeutHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaF7h2xrY6E7bfioOQoP//ZSJQnwCYt3+yH3D7yw+Wad2QsV+w
	R6bu7CRInj/PfNy3Xu49nz1dJT6lKn+C5yeL3rmj1zla7zqe4uq97s+XFR9Ogg0lOqfRI2C88Js
	JO25zDg==
X-Google-Smtp-Source: AGHT+IHYgGGlZHfS9w2vU3f5cVhL5YvwatjHQcXfI3teFmKUtgx7d2TkS7E4UOVFLFDpezgccvXUQXQ3Ay0=
X-Received: from pjbse6.prod.google.com ([2002:a17:90b:5186:b0:30a:7da4:f075])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1e0f:b0:308:7270:d6ea
 with SMTP id 98e67ed59e1d1-31241a803bfmr1863216a91.30.1748562018988; Thu, 29
 May 2025 16:40:18 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 May 2025 16:39:46 -0700
In-Reply-To: <20250529234013.3826933-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529234013.3826933-2-seanjc@google.com>
Subject: [PATCH 01/28] KVM: SVM: Don't BUG if setting up the MSR intercept
 bitmaps fails
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, Chao Gao <chao.gao@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

WARN and reject module loading if there is a problem with KVM's MSR
interception bitmaps.  Panicking the host in this situation is inexcusable
since it is trivially easy to propagate the error up the stack.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 0ad1a6d4fb6d..bd75ff8e4f20 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -945,7 +945,7 @@ static void svm_msr_filter_changed(struct kvm_vcpu *vcpu)
 	}
 }
 
-static void add_msr_offset(u32 offset)
+static int add_msr_offset(u32 offset)
 {
 	int i;
 
@@ -953,7 +953,7 @@ static void add_msr_offset(u32 offset)
 
 		/* Offset already in list? */
 		if (msrpm_offsets[i] == offset)
-			return;
+			return 0;
 
 		/* Slot used by another offset? */
 		if (msrpm_offsets[i] != MSR_INVALID)
@@ -962,17 +962,13 @@ static void add_msr_offset(u32 offset)
 		/* Add offset to list */
 		msrpm_offsets[i] = offset;
 
-		return;
+		return 0;
 	}
 
-	/*
-	 * If this BUG triggers the msrpm_offsets table has an overflow. Just
-	 * increase MSRPM_OFFSETS in this case.
-	 */
-	BUG();
+	return -EIO;
 }
 
-static void init_msrpm_offsets(void)
+static int init_msrpm_offsets(void)
 {
 	int i;
 
@@ -982,10 +978,13 @@ static void init_msrpm_offsets(void)
 		u32 offset;
 
 		offset = svm_msrpm_offset(direct_access_msrs[i].index);
-		BUG_ON(offset == MSR_INVALID);
+		if (WARN_ON(offset == MSR_INVALID))
+			return -EIO;
 
-		add_msr_offset(offset);
+		if (WARN_ON_ONCE(add_msr_offset(offset)))
+			return -EIO;
 	}
+	return 0;
 }
 
 void svm_copy_lbrs(struct vmcb *to_vmcb, struct vmcb *from_vmcb)
@@ -5511,7 +5510,11 @@ static __init int svm_hardware_setup(void)
 	memset(iopm_va, 0xff, PAGE_SIZE * (1 << order));
 	iopm_base = __sme_page_pa(iopm_pages);
 
-	init_msrpm_offsets();
+	r = init_msrpm_offsets();
+	if (r) {
+		__free_pages(__sme_pa_to_page(iopm_base), get_order(IOPM_SIZE));
+		return r;
+	}
 
 	kvm_caps.supported_xcr0 &= ~(XFEATURE_MASK_BNDREGS |
 				     XFEATURE_MASK_BNDCSR);
-- 
2.49.0.1204.g71687c7c1d-goog

