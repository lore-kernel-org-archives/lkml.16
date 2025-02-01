Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110BF1DA53
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 01:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738373914; cv=none; b=g+32NVl//0Xsy0iloxlxigBVTECDt31lbiquF8FDWGjNXGT4dpDLOKuGyLoZA2QOvgzN0Mr804bLJ+Pd9nOio5ONOYnlZRvHzjRdq5A9/xqUUCTpcIc71AbRQ/jeIKRgfLQE1w7JR+PFKNIIgno6Ss6zvLpsHIPiBDeJREEIPJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738373914; c=relaxed/simple;
	bh=bIer252FPj2neLt5xdi2KiMB2kp+ZCOYERhI9r0upcQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A7h/kURFsqqaJqau6ANbi63o7U3pXezlu1yON/Is6UFCRAzFbaUnBrZJxtfVn8rtUaznpGVN3RJRG3+h7IZ+8xF3c1XvtFZ2rMYPbUGM7gTzB/IO+oJXzywDzLXhKw1atT6F5qeHW1ufE8WNqak0tbqe1ZbjdzIa5a0fp+YoLz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qR49V3cl; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qR49V3cl"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef909597d9so7215180a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738373912; x=1738978712; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zp7NYWAIXF7j15e690s9k+4LsZ2x/OUxLnCwUuEMDT4=;
        b=qR49V3clEC6DCbODm1bLFr47MwfFTX8GBtSbxk7irAKu5kXnlzstI6tbs/50OhbIW0
         L3yEhZf4nsPrZ08yBb5jfNSP3pd3JePgH0zhXQqvCymRUy4jhM8J9H0wYxtY0l/WI54q
         H2IDTNrK/0MJeP6kQlBtruTUVsHALHXXd3PWE8KF6hFL5djqomD7VFjJEYa0U+p+Bb+e
         u+oMAy7tLWujSedjAd8VtREFnoGDxKRhRgTbvDDxejnTZ9lMmWNWM/PqVyRIpa7YPfDK
         gMdGkTGzOkHMN34Tp9bpnX03D5L7CvdbTz0448NX6JhZqbUmaDf1FMJXLTj8QCHwuEht
         mwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738373912; x=1738978712;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zp7NYWAIXF7j15e690s9k+4LsZ2x/OUxLnCwUuEMDT4=;
        b=IcVJXkrsvWkkaLmRSNYveOTJ5XPxOAT/gSA2Z7qqcNE+uM124I/lzwh9zhp1TkrRnx
         OAoxwfk8Sv0BHqzx1KQdzV5VifEriNDboQ3vopYNZ9Fr4ZoxuNbYvkuiqvpGClPPc3SY
         EuTOzddIr5IDL1UfrJlzwiCPApiCBlO+O/8Hbmko5F23Cop7VFqRmnRvcLNnd71x3aLX
         Bz9noW0lslO4PyI2lp5oLDxcjnVwLzDOxk/0cQtkYjQLxYSzpS+hCvuzI0o1ml61OV3C
         o3UyNuwcIZ1sO83E2kLJrr6Qr8tSWs+RzYQjj2r1NbEcL+Uby48eXjAjtqjmjdwM/hf3
         kujA==
X-Forwarded-Encrypted: i=1; AJvYcCXXwAm9WEEzPD8sp6OpPbZQmtD2+NrbEE8Eck/JiF9v7PmOGDDMpNUqyumi4TXBTkZfTGiZbR8LqbeJVDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxruN1pdR4X83yedj7n/hRK7t+Eln6x2CfOtpolh4/zuPHGMYF7
	+tRwnLpNe91q8ZY+31ki0CoMKp4bPkZ//nlVGT8AX/KCtwbQhygY+TiBgLLn49kPlZ4W1q7uBQL
	Keg==
X-Google-Smtp-Source: AGHT+IEewJwHCgkXKTVE1+h2sO808rYxQKec4ZGCZb9LwsStHhG0Pq3/2ryQ5LpVFWr3Dlpj3qpPvdy7x70=
X-Received: from pjbsw11.prod.google.com ([2002:a17:90b:2c8b:b0:2ef:a732:f48d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5245:b0:2ee:ee77:2263
 with SMTP id 98e67ed59e1d1-2f83abaf3f2mr21239555a91.7.1738373912335; Fri, 31
 Jan 2025 17:38:32 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 17:38:17 -0800
In-Reply-To: <20250201013827.680235-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201013827.680235-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201013827.680235-2-seanjc@google.com>
Subject: [PATCH v2 01/11] KVM: x86: Don't take kvm->lock when iterating over
 vCPUs in suspend notifier
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+352e553a86e0d75f5120@syzkaller.appspotmail.com, 
	Paul Durrant <pdurrant@amazon.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="UTF-8"

When queueing vCPU PVCLOCK updates in response to SUSPEND or HIBERNATE,
don't take kvm->lock as doing so can trigger a largely theoretical
deadlock, it is perfectly safe to iterate over the xarray of vCPUs without
holding kvm->lock, and kvm->lock doesn't protect kvm_set_guest_paused() in
any way (pv_time.active and pvclock_set_guest_stopped_request are
protected by vcpu->mutex, not kvm->lock).

Reported-by: syzbot+352e553a86e0d75f5120@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/677c0f36.050a0220.3b3668.0014.GAE@google.com
Fixes: 7d62874f69d7 ("kvm: x86: implement KVM PM-notifier")
Reviewed-by: Paul Durrant <paul@xen.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b2d9a16fd4d3..26e18c9b0375 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6907,7 +6907,6 @@ static int kvm_arch_suspend_notifier(struct kvm *kvm)
 	unsigned long i;
 	int ret = 0;
 
-	mutex_lock(&kvm->lock);
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		if (!vcpu->arch.pv_time.active)
 			continue;
@@ -6919,7 +6918,6 @@ static int kvm_arch_suspend_notifier(struct kvm *kvm)
 			break;
 		}
 	}
-	mutex_unlock(&kvm->lock);
 
 	return ret ? NOTIFY_BAD : NOTIFY_DONE;
 }
-- 
2.48.1.362.g079036d154-goog

