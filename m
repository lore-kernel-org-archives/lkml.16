Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D621657C93
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 01:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738373917; cv=none; b=cd7BRxKRm9Z995ktltsv4vTO7Or3ky4gop+WjlQpVB/PeaMtPx6yxm6gSIN9lyUpPfVD39ljwFQZpZzs6+7SvZiLRIRdAY/ePVOsmNl/MM/A7AoZgZ7BVOn0pFTPwVsxU07ByXEpYMAa6plx2Y1LwpzZxSm8MNowhh7uRuLj80E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738373917; c=relaxed/simple;
	bh=EWqk4KP30hLS8qDZzToz6KVrg0V46dJzG1FJBWmksMY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iFF0ucETQFVS4T/pxHDqV3MYkgFRGcCJs0e7jK2VuPflU73I2q+bIiCGQ+zSQDGYWzLXQv4TytVB0hKuFv8gNwjJz+kWKcFU+5V3TqSGWOfYRaGIsIrQ34ldVHFOmWTywMv8IcBOIHe1CEX8px+A5EzHLgNzLQox/7V2q/vt1eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b8qLgrvb; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b8qLgrvb"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2163d9a730aso53960385ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738373914; x=1738978714; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kLtOSCafmeXa0Tlio6zr7dmpFxS5UvuVrLDBE53O/J8=;
        b=b8qLgrvbOARM4CpfDjWvb+68PayA3vOVhC5+Cmta1TX7Fi9cPCPWDkXqaSAqE2h75+
         Tu12iSy6sVENtH4zEJJigFEHAy+Zkl0orQU5jz0UQRpVo6R8FzdZNTBqLMG5HrKVZgLP
         xIqj8QYixUtWBrlMWX/X+xdGhWQFCQ9uPl4wtLX/AojRuCjMkMXavDACIu1BX0zZDj5J
         ILIY+KPfahFKsuoXzymLG6BXTNAMx8dax0n7SNMe2mih82No7SZ0cs7n+LJ4OXkd5PrS
         3iUbAD/VUQjaZBQ1zSIzBnPX4uZl5NQ4aU4s9s4srr9oCYzKhXmB29r9oKFSVGSYIEkg
         FxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738373914; x=1738978714;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLtOSCafmeXa0Tlio6zr7dmpFxS5UvuVrLDBE53O/J8=;
        b=fpcd/9E+rPfUunV6roW9tGXltfRDjHIRNOVtba7AnZqX2Xl7klhYWdTLK3mWbWI8yv
         3fv3sp4KIQRuTO39lfASLSsNgDsUi497HtU1j/9WszY7V+qL3O74idAC4y3ZKkJX9YQC
         XXqCIemY9mfYVNXRC+kpsbvx14zgaZ6cddD1SQXQ6FXB28ol9sOfDtMzJTvgWTYarTqL
         hUTFvPzs7KwQEcNvnMPljg+gEC4TU+58mSaMJCKDKFXvQWVjnOeebp9Yrz/ZMyY/P2+Y
         IyplwayEVGt5iv5MlXXaUfCZbOZu6UwJP2PNAjf7WwPaOBVg0uxzt2tSh2/8IkJDZQsh
         mqBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTCo2jEWtLhlZgCtCEtvNsfWpGhIJanz1IO32fOJlQv/2qudDrXaZKSYsJOiclQXtn6jaQ9PWKQ4WAr9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHAGMsnje5qeONIqzb8BTM1A6pF8Bm54xLt0Ya6u3QZGslbDBc
	/am2KdT8e0GkQACFd+lofg/52cG0V1TrWDaExij/E8hh1/YfPqvdgppjZDLc0q3PVmgpCR1roa1
	Spg==
X-Google-Smtp-Source: AGHT+IGpxUDOtpNaOqm4HE3ykis5lIWlKBo+60yrqrJGaRiR9GaKmISfRl/sDJx5rpvI7cqJjvLYCkOtBJI=
X-Received: from pjbsi11.prod.google.com ([2002:a17:90b:528b:b0:2ea:4139:e72d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2b06:b0:216:3440:3d21
 with SMTP id d9443c01a7336-21edd880549mr92004395ad.26.1738373914116; Fri, 31
 Jan 2025 17:38:34 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 17:38:18 -0800
In-Reply-To: <20250201013827.680235-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201013827.680235-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201013827.680235-3-seanjc@google.com>
Subject: [PATCH v2 02/11] KVM: x86: Eliminate "handling" of impossible errors
 during SUSPEND
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+352e553a86e0d75f5120@syzkaller.appspotmail.com, 
	Paul Durrant <pdurrant@amazon.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Drop KVM's handling of kvm_set_guest_paused() failure when reacting to a
SUSPEND notification, as kvm_set_guest_paused() only "fails" if the vCPU
isn't using kvmclock, and KVM's notifier callback pre-checks that kvmclock
is active.  I.e. barring some bizarre edge case that shouldn't be treated
as an error in the first place, kvm_arch_suspend_notifier() can't fail.

Reviewed-by: Paul Durrant <paul@xen.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 26e18c9b0375..ef21158ec6b2 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6905,21 +6905,15 @@ static int kvm_arch_suspend_notifier(struct kvm *kvm)
 {
 	struct kvm_vcpu *vcpu;
 	unsigned long i;
-	int ret = 0;
 
-	kvm_for_each_vcpu(i, vcpu, kvm) {
-		if (!vcpu->arch.pv_time.active)
-			continue;
+	/*
+	 * Ignore the return, marking the guest paused only "fails" if the vCPU
+	 * isn't using kvmclock; continuing on is correct and desirable.
+	 */
+	kvm_for_each_vcpu(i, vcpu, kvm)
+		(void)kvm_set_guest_paused(vcpu);
 
-		ret = kvm_set_guest_paused(vcpu);
-		if (ret) {
-			kvm_err("Failed to pause guest VCPU%d: %d\n",
-				vcpu->vcpu_id, ret);
-			break;
-		}
-	}
-
-	return ret ? NOTIFY_BAD : NOTIFY_DONE;
+	return NOTIFY_DONE;
 }
 
 int kvm_arch_pm_notifier(struct kvm *kvm, unsigned long state)
-- 
2.48.1.362.g079036d154-goog

