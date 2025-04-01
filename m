Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F77620E70F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525800; cv=none; b=coe4p1Wnq1+2j8EWrNi8780MkMDZFs25eFDEGeqNqBvPnxM4TQWcKod3uaTj/cMQP47RiWjxun+wSePu1DVL1ZvZNQNaM16SrdU01C0dfRJES5yj3UUjactQABZsc/3jzRiTpMizXV1t6GXIW2wwmF7qJyySXC7C/WJnw4ca5sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525800; c=relaxed/simple;
	bh=68XUd7R1fyxPr0p6LhY6RzrECfMFspwxL2oY+XxMEXg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ir48YSfUqEgprWTwVpvy7/lcktLIi476a3lRad8evuvoq9auiHg2Bw2XnOmzMT/Cx5mfhK7TB+oEHhKerQRmSTAVHuQ2bIW+gw6f0CKxgYnhH2vg/UFd1yRzjW2iYxKLbveYf5TWojNro29HtBbu22m1smkXuswd1udKyiZbdb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZH2UDmrz; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZH2UDmrz"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-224192ff68bso102886535ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743525798; x=1744130598; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ENuRHHo4buatmc9xHBzqgn6lL1J28WBga1j/Fc+SdOU=;
        b=ZH2UDmrzbMQf54X1EPb1PIhVhq7QjX9j30cxbbKKBoYgjT3m9bpKdxgW8a3AvgscWh
         4Y1kU9srYsDeG9r6liy5vdg/d77sqtIEp5B7YYp+/Qy14Uf3BltnAeWLff4Nm7UNONTc
         waTVJbAAOYDoas/+1gq3bG9vbqTA0ssszB5cquZ3DiMqYL+2KhowO0+3mquGJ4qIJwSR
         fErMn8oN5+HqOaelo59cGP3RmVEGiqkCgJ9/e1wvEX9S8OwoHncU4kp5Dr/x2sv+97PS
         9XelIYgW8+PK3+qN6snYIhh7Re3IeAbMVoahGfxn7ID9yO8AOFGxTY0A05Ddi9BUAqyg
         q5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525798; x=1744130598;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENuRHHo4buatmc9xHBzqgn6lL1J28WBga1j/Fc+SdOU=;
        b=fZD8OFLkD+0O77/WlEWHiMvPEtnw02SCYiCgoHBsw5UWSO3TspRtvkPFoYIfgnadcP
         8YkvOITXl2r6JOfFmOVFg35kmfgDROY/XPOrhHIbyQjpsq6NqpPDmYzG+E7pGmdz0L03
         o70S8oimnHiSu8rBJIqdSGQeJHBncFUimB9mvidDt9CKbGFNoDBhhr2ZIP3l2N5tsfiV
         QBZZulUbKakPbXpeXPzFx+fVzK5hriwB+yHXMFsgmazM55mDhV+pNA1kqHOj09L0m+Pe
         t9cjlwj4S7OfWF29S7yKp1DkzFTbPb1IsnBoFLUDHbO9eozwlzezvbx76hl7VUMdbO3M
         SU3w==
X-Gm-Message-State: AOJu0YwWi9WXlZwzu2CHZEAsomAHmF3tlsDeR8CfFpHcNOVn0P2Aax+1
	HfRS3wMEGITKKOH+umuOjeLdU14DWGikt4LqigYfaFQxttwufEsb0ff9jCjvyo7/5cFGqFGNeVu
	uxQ==
X-Google-Smtp-Source: AGHT+IG7uPldPi4KrDzTQHRm25erUUAd10L5t443gFis5z6W+qmvlaB54rM8wSKwHj0ezPMBh17NInSp4ik=
X-Received: from plbm1.prod.google.com ([2002:a17:902:d181:b0:223:2747:3d22])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1c7:b0:224:78e:4ebe
 with SMTP id d9443c01a7336-2292f9e62cbmr194250575ad.33.1743525798682; Tue, 01
 Apr 2025 09:43:18 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Apr 2025 09:34:42 -0700
In-Reply-To: <20250401163447.846608-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401163447.846608-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401163447.846608-4-seanjc@google.com>
Subject: [PATCH v2 3/8] KVM: VMX: Ensure vIRR isn't reloaded at odd times when
 sync'ing PIR
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Read each vIRR exactly once when shuffling IRQs from the PIR to the vAPIC
to ensure getting the highest priority IRQ from the chunk doesn't reload
from the vIRR.  In practice, a reload is functionally benign as vcpu->mutex
is held and so IRQs can be consumed, i.e. new IRQs can appear, but existing
IRQs can't disappear.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 9dbc0f5d9865..cb4aeab914eb 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -667,7 +667,7 @@ bool __kvm_apic_update_irr(u32 *pir, void *regs, int *max_irr)
 	for (i = vec = 0; i <= 7; i++, vec += 32) {
 		u32 *p_irr = (u32 *)(regs + APIC_IRR + i * 0x10);
 
-		irr_val = *p_irr;
+		irr_val = READ_ONCE(*p_irr);
 		pir_val = READ_ONCE(pir[i]);
 
 		if (pir_val) {
-- 
2.49.0.472.ge94155a9ec-goog

