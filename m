Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342DE25C708
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562027; cv=none; b=KfjA3fmth9NrI6ctrg50kqYgX/IgTieSHrMsyG7c5mKIyP1jUNxX4vUts6JDfmcY4Hjb1rA4YDeEOT38dpOUwMbyGTg49U54OXRDjErh1rRRA7hWuoZNVbf+eKAo5Wv2YuCRGA+UcqVUhiSxL/SEmj9OBkiqDOP9hwhl0E6xWWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562027; c=relaxed/simple;
	bh=R9kmG10AvZPVWXlViRQh79Glnff5btnA7FS3RQ7ftyM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eOwnWEZgWjVGCTN1zdhszyerrcZp1jHinlp2IzAbo55Ls3sfm9Vsi2/JvP2KDbvmfj+C8o4aAdowHts+LK3WGCSk116gzxQUeIauoFetQyUhCiRrHm+/z8iJWVuDe+LPG2PuFNF2Lw6GlVLBIxfvsX9p5w3BRU01N3zqUr05JRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qrt1n8kB; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qrt1n8kB"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-312436c2224so447805a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748562025; x=1749166825; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=k8a4gJL7fJcV15lMkFBdSF9xzzqc6lN6bgj7noYkucY=;
        b=Qrt1n8kBBl/wivaOQ4RN22O4e3AIHQOHJEHKiYbYW7gw8wUxgrqsdoCtnboaO30Fly
         Z0QD643P4YQmaRhep8Di+DbRWmeWFJIZKDaMpeRB723aXHU2B8UakVPuoGi8RL5++UjH
         Xxsvf5NJNoYwdTvDBVTj/Vt074hANl6hxKLrCZ4taUCweWs9WXNGvQ4ZEnegp0anaKpD
         lKbaaNYIGhtwJPEAlooup9r4sfFEZ0G8R6GX+u2azGS0JVGy8+D8YQYjo++AL4IECO+Z
         dnTzxdHC7OD36Nw4Xo2zuf+UioS1yses/YZG4J6Z7ZbaK2XA661xrbuLKiRL54i5b6li
         i6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562025; x=1749166825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8a4gJL7fJcV15lMkFBdSF9xzzqc6lN6bgj7noYkucY=;
        b=HRwlYHw2LV9JVQCIBTDgN1SaVocB24gmmmg7a3XLBcnkeJu1207uMBl63iwfA9m98A
         I4QW5OezDZPRLaGa2jaD6YjCrEJIgJwjkXxtqNzieXwugSnbMabp0Bz1C9l5IG2aWH5Z
         +9jaflOizLEk6F+cSJzLPkjLMynopwHhNjIawrvJhcL1a2ndZuryfErUNZqvuntJk4b3
         vrxQ8GoE7F9abW7XL9ASUrvDIl/IZE3hvlNrntUiGOAA+YFeoQji+VnULbpSvwWvKzyz
         +zohescopGMspWNKENkZTBQMsCUkSL30TZHxoxzHttyZ+94c//7lMioRgKGMTHtQgvsi
         6zlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLDBqy+cs2eltWBysn4D0P7/sEZqzdjgtsWD92JNgh7HjkxqeCAeTyzrd4VYqmAyKnsmj0bUeVTfMYETE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2VPyOWamLZGDtbByWpoMuF9jpGh6wl54qtvtVi7+GUmm5U40S
	uvHRaOi6JWXJH+3eA4dmxRBYW0bhBvBXRP6ti9Qvp7OjTUiA1H6Y4QWizF1wr0IM4LuU35s+EAK
	NU9QQAg==
X-Google-Smtp-Source: AGHT+IFj6cpdwvMfiw9kPdC2HGBBg9A8aQ6NLpVwCunBULWlARIElrxcMVdLA9b7L/QecHTLXJCqJ/sf5QA=
X-Received: from pjbsv6.prod.google.com ([2002:a17:90b:5386:b0:2fc:3022:36b8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dc4:b0:311:afaa:5e25
 with SMTP id 98e67ed59e1d1-31241865ecdmr2041979a91.24.1748562025571; Thu, 29
 May 2025 16:40:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 May 2025 16:39:50 -0700
In-Reply-To: <20250529234013.3826933-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529234013.3826933-6-seanjc@google.com>
Subject: [PATCH 05/28] KVM: x86: Use non-atomic bit ops to manipulate "shadow"
 MSR intercepts
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, Chao Gao <chao.gao@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Manipulate the MSR bitmaps using non-atomic bit ops APIs (two underscores),
as the bitmaps are per-vCPU and are only ever accessed while vcpu->mutex is
held.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 12 ++++++------
 arch/x86/kvm/vmx/vmx.c |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index d5d11cb0c987..b55a60e79a73 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -789,14 +789,14 @@ static void set_shadow_msr_intercept(struct kvm_vcpu *vcpu, u32 msr, int read,
 
 	/* Set the shadow bitmaps to the desired intercept states */
 	if (read)
-		set_bit(slot, svm->shadow_msr_intercept.read);
+		__set_bit(slot, svm->shadow_msr_intercept.read);
 	else
-		clear_bit(slot, svm->shadow_msr_intercept.read);
+		__clear_bit(slot, svm->shadow_msr_intercept.read);
 
 	if (write)
-		set_bit(slot, svm->shadow_msr_intercept.write);
+		__set_bit(slot, svm->shadow_msr_intercept.write);
 	else
-		clear_bit(slot, svm->shadow_msr_intercept.write);
+		__clear_bit(slot, svm->shadow_msr_intercept.write);
 }
 
 static bool valid_msr_intercept(u32 index)
@@ -862,8 +862,8 @@ static void set_msr_interception_bitmap(struct kvm_vcpu *vcpu, u32 *msrpm,
 	if (KVM_BUG_ON(offset == MSR_INVALID, vcpu->kvm))
 		return;
 
-	read  ? clear_bit(bit_read,  &tmp) : set_bit(bit_read,  &tmp);
-	write ? clear_bit(bit_write, &tmp) : set_bit(bit_write, &tmp);
+	read  ? __clear_bit(bit_read,  &tmp) : __set_bit(bit_read,  &tmp);
+	write ? __clear_bit(bit_write, &tmp) : __set_bit(bit_write, &tmp);
 
 	msrpm[offset] = tmp;
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 9ff00ae9f05a..8f7fe04a1998 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4029,9 +4029,9 @@ void vmx_disable_intercept_for_msr(struct kvm_vcpu *vcpu, u32 msr, int type)
 	idx = vmx_get_passthrough_msr_slot(msr);
 	if (idx >= 0) {
 		if (type & MSR_TYPE_R)
-			clear_bit(idx, vmx->shadow_msr_intercept.read);
+			__clear_bit(idx, vmx->shadow_msr_intercept.read);
 		if (type & MSR_TYPE_W)
-			clear_bit(idx, vmx->shadow_msr_intercept.write);
+			__clear_bit(idx, vmx->shadow_msr_intercept.write);
 	}
 
 	if ((type & MSR_TYPE_R) &&
@@ -4071,9 +4071,9 @@ void vmx_enable_intercept_for_msr(struct kvm_vcpu *vcpu, u32 msr, int type)
 	idx = vmx_get_passthrough_msr_slot(msr);
 	if (idx >= 0) {
 		if (type & MSR_TYPE_R)
-			set_bit(idx, vmx->shadow_msr_intercept.read);
+			__set_bit(idx, vmx->shadow_msr_intercept.read);
 		if (type & MSR_TYPE_W)
-			set_bit(idx, vmx->shadow_msr_intercept.write);
+			__set_bit(idx, vmx->shadow_msr_intercept.write);
 	}
 
 	if (type & MSR_TYPE_R)
-- 
2.49.0.1204.g71687c7c1d-goog

