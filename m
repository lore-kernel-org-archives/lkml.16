Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369DC149C51
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 01:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738373924; cv=none; b=kjSpbj5OjQ4pLzJm3xZ9b9AU1TlppK6Qc1dFcH/GHqomjqjpQmDO/UJW+CEjtvxMQBO/LrGwoTC0EqjkHE7kJuQSUHVqk0DfZzAduymWAKXtxiviAUjRZ7DKbZQ34bo+aPfIWm2ggLEFvt+04BR1J6EMqxzwudXdyagLka8HFsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738373924; c=relaxed/simple;
	bh=v2nNVv+EFRYPunzdZ+ILeHXzhZpVDwHyHKp7YCyi+L0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AComUkgTx7gEWtg8fDh1ccA4Nzd5X9iVTZ6sL7vjbq5QByHlmlNNUkRfTjxWW6hfbpMDi30gYm1KrQ1yDlbApOqE4PX5T9chj9Xvt/RAcwX+BwUSHwJQqgGJnumFRkHzc2PsPdw6Zo13SZRXD0obMMaI6F7ztlxMMfDjBByAvrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WHEFgqp8; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WHEFgqp8"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f129f7717fso5051869a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738373922; x=1738978722; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=x+/SOKG3JumebYmqFYS/sEsTOSGuKOAOS5dLwsiexZc=;
        b=WHEFgqp895UzMDGIh2d5UQgogiFOQmYO768vxdUzRLGi/bZTxQ+ArYzy/8aGLyPoHG
         ZMeu+vO0fOrjhXiLVfreTZBmPb2pG28t+YpRIl6YfDT4RJK3fnDoEuIiHziC/BnN0p9D
         FJIfCR0EDy3pQTnEMP3AxDAN9OgoPPNLZmyG0fYwq1k9nHDyK2EE3zhazd5aKfrQt2K3
         /w5v3mNNb4wwRtqfAlXnCw5dj1/loL210ZFsDQz3orPV2Dn2GZ5duSN8IKU2UT87IfNZ
         cXHfAKgdKBHGT31E3A9W36ar0FwDEl5bSJ+aQRXlgQ8++FnyNINL3hf7jmtUJ29kIw/w
         FAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738373922; x=1738978722;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+/SOKG3JumebYmqFYS/sEsTOSGuKOAOS5dLwsiexZc=;
        b=kY6A/JB3JnFEx06C67w6uPE7AH2hUQulKrBVVn9OTXr+CwRWN9jlqSnOr3ORI4Vqfz
         FBF846F2LZuoq5uJuKw+PT3bQpWEVu0pQS0+mKswg8CvppyyS/8rz25X0b3/EcstdmG7
         waY7UENF6izBcJWMdj2kLQaYhothXeS9aWGBMjRSJIb3z/oveFcG8pWpkqwJ91NSnTw8
         XOHt0W2B8A1VpJS4AX9pptdnZqmMsZ7j44LjCzDEk+Ys0FAY0bUlixMOcSiCN2+N18LV
         vC+jMH2nY8sK93JxmHgrGPsHGmoyomkh5rk+efXpUFpbwX3bnqVZ4thrqF+faQ/wp2XV
         2EfA==
X-Forwarded-Encrypted: i=1; AJvYcCUrFcCGCXCac4oY/DnyW09c2uHGcPVfGLm+DoXo10aGN8YcnI61Eowy/AvT3ikZlDRT2FDcLxMf07BwMbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFL54lAzcZmdvMk4nj9WPmGmqaItYQWw74Q4r+iHixagciSQdX
	2eiAgjmU7aEovXNgGE40b2dHNy7wfQtqfgQhe2o3dqY3wiaW+i+z5nFieZiStYo7eEsHmQD4j5x
	VuA==
X-Google-Smtp-Source: AGHT+IHYnLS7BAwUoGkHQKlNghqdBiP1OFbs9Cwx1+plht9fOXLw3Xd5M6E/dTSO5tlBS9xowyMjOG8b70s=
X-Received: from pjbeu6.prod.google.com ([2002:a17:90a:f946:b0:2f4:47fc:7f17])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f81:b0:2ee:bc1d:f98b
 with SMTP id 98e67ed59e1d1-2f83ac8ac3amr17463933a91.31.1738373922389; Fri, 31
 Jan 2025 17:38:42 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 17:38:23 -0800
In-Reply-To: <20250201013827.680235-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201013827.680235-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201013827.680235-8-seanjc@google.com>
Subject: [PATCH v2 07/11] KVM: x86: Set PVCLOCK_GUEST_STOPPED only for
 kvmclock, not for Xen PV clock
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+352e553a86e0d75f5120@syzkaller.appspotmail.com, 
	Paul Durrant <pdurrant@amazon.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Handle "guest stopped" propagation only for kvmclock, as the flag is set
if and only if kvmclock is "active", i.e. can only be set for Xen PV clock
if kvmclock *and* Xen PV clock are in-use by the guest, which creates very
bizarre behavior for the guest.

Simply restrict the flag to kvmclock, e.g. instead of trying to handle
Xen PV clock, as propagation of PVCLOCK_GUEST_STOPPED was unintentionally
added during a refactoring, and while Xen proper defines
XEN_PVCLOCK_GUEST_STOPPED, there's no evidence that Xen guests actually
support the flag.

Check and clear pvclock_set_guest_stopped_request if and only if kvmclock
is active to preserve the original behavior, i.e. keep the flag pending
if kvmclock happens to be disabled when KVM processes the initial request.

Fixes: aa096aa0a05f ("KVM: x86/xen: setup pvclock updates")
Cc: Paul Durrant <pdurrant@amazon.com>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 3971a13bddbe..5f3ad13a8ac7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3262,20 +3262,21 @@ static int kvm_guest_time_update(struct kvm_vcpu *v)
 	if (use_master_clock)
 		vcpu->hv_clock.flags |= PVCLOCK_TSC_STABLE_BIT;
 
-	if (vcpu->pv_time.active
-#ifdef CONFIG_KVM_XEN
-	 || vcpu->xen.vcpu_info_cache.active
-	 || vcpu->xen.vcpu_time_info_cache.active
-#endif
-	    ) {
+	if (vcpu->pv_time.active) {
+		/*
+		 * GUEST_STOPPED is only supported by kvmclock, and KVM's
+		 * historic behavior is to only process the request if kvmclock
+		 * is active/enabled.
+		 */
 		if (vcpu->pvclock_set_guest_stopped_request) {
 			vcpu->hv_clock.flags |= PVCLOCK_GUEST_STOPPED;
 			vcpu->pvclock_set_guest_stopped_request = false;
 		}
-	}
-
-	if (vcpu->pv_time.active)
 		kvm_setup_guest_pvclock(v, &vcpu->pv_time, 0, false);
+
+		vcpu->hv_clock.flags &= ~PVCLOCK_GUEST_STOPPED;
+	}
+
 #ifdef CONFIG_KVM_XEN
 	if (vcpu->xen.vcpu_info_cache.active)
 		kvm_setup_guest_pvclock(v, &vcpu->xen.vcpu_info_cache,
-- 
2.48.1.362.g079036d154-goog

