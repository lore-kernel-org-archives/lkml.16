Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EE9215F56
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525808; cv=none; b=exkU7oQwmM0486+3BxuI5YpV68w/fd9p4QZablGxUmArh/bGIlJevVchqo7Nv2rlqQbEL9MrzM5XRe0OQVDR5+DR4QsYX1R9YRNJeyAsbHtKvtQN6ZFvyEJfBhnnQnqV79XoiSkf/yw7+GQ2JEt4BR3N80fk1f4UNaK1k0OJsAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525808; c=relaxed/simple;
	bh=+39fVy6ji7kbX1Wk79JiqH4KHEpEfCwzFOyM5dkWHVQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g46m/4mgtghqxWsUHSSXF5comIuy12Q9Gj9fwAyT1DwhJZG0iAPRm2lSKeDmvIvFsmjJAuTEQIfghEAc9krU6s4IFG+CJtJ/KONkKG/FcT+tn9gy7EY++Z1ZQjtcrjRJAZFaxHmQPmCaD7AMnlXotP9hqq8+ZeT3peU4i9Ho8k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M/3oiPhQ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M/3oiPhQ"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff7f9a0b9bso9141048a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743525807; x=1744130607; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7VeOo+YDl1ZaLAjoRUcMX3QDQbr2P1YpT08wmcSjNJ0=;
        b=M/3oiPhQKMvRclF7Tg7m0qq5LBKoMhM5lQXQYVVYetodLxjm7HFHekmU6KfYUOM36f
         6QA++ysoaTl/vfPcusN4EB1P8auXIoelQoGQl6r8C7fIpw3tgsLHLp9JrcmyocaIjdVo
         r355KQ3l7fzZQXZuMSS3o3WP+VDZfvblbqyAypDSnWnhqnwM3bk5upeTqKy+eiU/ODa3
         hinQXevTgYEO+nwmGwM4pX49ZVeKfz7ZLutwdQIUf0XP/3i3MXatUXCTbYCWcyp3A8QO
         QHyKWvC9NIMg80R0yWffLxwzO1ujR3JOus2PHw09k+tZACEh2T52rMkVdpZppejy0yqO
         ZRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525807; x=1744130607;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VeOo+YDl1ZaLAjoRUcMX3QDQbr2P1YpT08wmcSjNJ0=;
        b=nW1YhuD+PL8z24fZpcahoF4rxh4WsiBI5mA5foFju8Nwx8Upnrrv7SFaZLAbeuHT1P
         GyI3yRhD+yxGWWAaBWPREnODpSSqw1geyTj14Xr9pJHN+9cgu3PJTISR1Zwchd7FPArZ
         Z+xzcBm744rSVRahgDzRCp5eO1MTpKyFuFonl8ghv4f0GDGFfRr/KfB1DFF1igyf3pZK
         XFptuc15zoxpSm2ZfEZ/pGUda99N5vZB0956TzKS1RZhYbYKCmpMkz0ZqyHJnK5r+TlR
         PyOIxHQQQQ8oTEHPecro4eI581dXDHCUxDPzjuAV1pFUIJKliX/dgNPn2oxWnsDyqh6J
         yrwg==
X-Gm-Message-State: AOJu0YzrH5XVvQE5RPBjS9cZUY//1uZzTPurbW4zoYam980Xjp1T7cuZ
	bvbglxRkG2JE3LGuWHFHuUD9uF43mfsv6DGS0XgH6RIq98HS5I64SRyMYrf1z+tY+cFVe8l9rfL
	MDQ==
X-Google-Smtp-Source: AGHT+IEFM34tlug3Ergg9oOZ5ia6DKaSJuVy+JKjeggDch7iurgtwMeC43/CRt3s5ueDrR+9rtMhvbS0aMM=
X-Received: from pjvf6.prod.google.com ([2002:a17:90a:da86:b0:2fc:2ee0:d38a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d45:b0:2fe:e9c6:689e
 with SMTP id 98e67ed59e1d1-305608771admr5940492a91.8.1743525806882; Tue, 01
 Apr 2025 09:43:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Apr 2025 09:34:46 -0700
In-Reply-To: <20250401163447.846608-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401163447.846608-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401163447.846608-8-seanjc@google.com>
Subject: [PATCH v2 7/8] KVM: VMX: Use arch_xchg() when processing PIR to avoid instrumentation
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Use arch_xchg() when moving IRQs from the PIR to the vIRR, purely to avoid
instrumentation so that KVM is compatible with the needs of posted MSI.
This will allow extracting the core PIR logic to common code and sharing
it between KVM and posted MSI handling.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 0463e89376fb..13363327ad87 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -678,7 +678,7 @@ bool __kvm_apic_update_irr(unsigned long *pir, void *regs, int *max_irr)
 		if (!pir_vals[i])
 			continue;
 
-		pir_vals[i] = xchg(&pir[i], 0);
+		pir_vals[i] = arch_xchg(&pir[i], 0);
 	}
 
 	for (i = vec = 0; i <= 7; i++, vec += 32) {
-- 
2.49.0.472.ge94155a9ec-goog

