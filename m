Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8133625A340
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562026; cv=none; b=rNzPXqQ5JyK1S2N4fcW5RX4mtaPphhY70RxlUss2VsZeJaunukdaEZ2w+34SGbPYS4YmzGMM7v2D5c4kL03xpRehnd2DnqdXX7l0hV23hNSyvaRlWwFqJkuSI2sHlu2JyeotUFZM30luRWgrPUEaDkjTPLNOomfUu/zzYZMGdUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562026; c=relaxed/simple;
	bh=k7jNJZt/AtyTPL1+DIrj8UtvvKPsSZJUXY69DXeqraE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YLuGsbjqXYsWshhkEW4uZ9LGwFX+0f6PBbmbuytd01isBevaMlWBZ9ehM7fdRht6uiFUv/XJ8C+eOLSnhXFfgbPNQ7rpfQmDUt9xO5pzOZm//zBDPolfujwUr4S/T/4fXDSS2Ad3lcaMwUMWTBBqN0xgGK54d+R9c/n/cb0Kq78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fxIsd4fI; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fxIsd4fI"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-234f1acc707so12864845ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748562024; x=1749166824; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WMfP54PH+sYYNtk0zM+/ioopKS2tbW7NgfbBWvLgye4=;
        b=fxIsd4fIvFldiAFTlCWf5Qdp26aLb4hHe+lEAI4wmB5JtICn7XcavQ/UPwi4PI1CY1
         JDO0wgJO6MZzhKt/ej9MYYhshAp/x5izsjlc98aJwvxD7AdAVlbDYQTwENL37+kboFoN
         BI5HXKaaLck0bJ8dE0LFx3avywtby//kVLI8RykLrAkWmx80Ta2NQGQG3hsJfkTHsTIw
         fN6UFL7E0SKcTQYYHdixDL0nwpUBQjldPbRz4+RsPnXnnrw3hHNkea7zQQB8X2nLRODv
         TtlO+7+I+m3s+e181NniNVBRIN/LLti52DzglmJT4HAfPwGKMHwjeWnLCRPwYWxCz0tZ
         8v3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562024; x=1749166824;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMfP54PH+sYYNtk0zM+/ioopKS2tbW7NgfbBWvLgye4=;
        b=LeHLyvw++Thm82yyTJU8AyLb0UIFMPDLl4CdrCROL9/QaOIZVQMRhTjDeVp6g63Hhi
         2Hkq/0fKLb7sa1k/0WLnlp4Q3tnfK/gf5BlkExeOwYyxyUayjY3mMO72YFRgClURsNJo
         Gsm1kpeWT7LG07DSyA0MA+TOwRLyP3KDaaAZ/+3UkmNjxjG1wW6SbnGZGtRZoSVBpvkG
         QJdKi08//aR2x2AwriR5ZFHI81FtE1fa8mVqPCotxTCyhx/w3ESJq7S2fs4k1lN5NbWH
         50szvjKSfszCyCas57/tDBAW5NWNQFwpY8KLQkdF4DueIjiXl2lCS+csiBVn16TRFMal
         D/2w==
X-Forwarded-Encrypted: i=1; AJvYcCWgCd8WAUS/CHUR3EdsAKRM+ZG+NsFK7uGuExV6p+5M4bNEn5SVjsm4LTx1rfAlSpcMBUKjLaL9eeF250U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz67BdkLELkU/e53NZOOZ/p3K6mWdDIrMMMfno0D1UjJ15+/Oqr
	R1etIsJGXIJ3gnTNhmkNIIIe4CqL4vdJwSTfxkapIICqdpJd9rjnHGH8HSyBVtlY1O1IbGDhKqA
	6eZs2dw==
X-Google-Smtp-Source: AGHT+IFgYYDP/9VKzSLklTX8r9gsOueCtgPfXhvN33S9Y/cMn8S+nSOuO53xNOgK1nijujrnRdUCWQzDuDk=
X-Received: from plbla14.prod.google.com ([2002:a17:902:fa0e:b0:234:4c97:1e84])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4c1:b0:234:8eeb:d82d
 with SMTP id d9443c01a7336-23528de8f60mr21131485ad.19.1748562023766; Thu, 29
 May 2025 16:40:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 May 2025 16:39:49 -0700
In-Reply-To: <20250529234013.3826933-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529234013.3826933-5-seanjc@google.com>
Subject: [PATCH 04/28] KVM: SVM: Kill the VM instead of the host if MSR
 interception is buggy
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, Chao Gao <chao.gao@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

WARN and kill the VM instead of panicking the host if KVM attempts to set
or query MSR interception for an unsupported MSR.  Accessing the MSR
interception bitmaps only meaningfully affects post-VMRUN behavior, and
KVM_BUG_ON() is guaranteed to prevent the current vCPU from doing VMRUN,
i.e. there is no need to panic the entire host.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 36a99b87a47f..d5d11cb0c987 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -827,7 +827,8 @@ static bool msr_write_intercepted(struct kvm_vcpu *vcpu, u32 msr)
 	bit_write = 2 * (msr & 0x0f) + 1;
 	tmp       = msrpm[offset];
 
-	BUG_ON(offset == MSR_INVALID);
+	if (KVM_BUG_ON(offset == MSR_INVALID, vcpu->kvm))
+		return false;
 
 	return test_bit(bit_write, &tmp);
 }
@@ -858,7 +859,8 @@ static void set_msr_interception_bitmap(struct kvm_vcpu *vcpu, u32 *msrpm,
 	bit_write = 2 * (msr & 0x0f) + 1;
 	tmp       = msrpm[offset];
 
-	BUG_ON(offset == MSR_INVALID);
+	if (KVM_BUG_ON(offset == MSR_INVALID, vcpu->kvm))
+		return;
 
 	read  ? clear_bit(bit_read,  &tmp) : set_bit(bit_read,  &tmp);
 	write ? clear_bit(bit_write, &tmp) : set_bit(bit_write, &tmp);
-- 
2.49.0.1204.g71687c7c1d-goog

