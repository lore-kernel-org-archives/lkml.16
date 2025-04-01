Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F3820E6ED
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522558; cv=none; b=d5sneqFIxUcW49TaTIN0s1XN/XuluRIkErB57FsHPfb+8abfzHBJpkIv7PtyJhqdvqamVPBa32StYJ+RMJAQOAA5Ib6LWpD3hxbQ9stoLITkuw6A/20cQmghX9ot/XTYhl7N3Zt/6xjaMG9QMerwLbgS77QQxef7S4HfWVgH/Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522558; c=relaxed/simple;
	bh=vhm5JRAE6njpdjScz5UK8LdwniERJDF2bJGfN6xBYh4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kDI9fLEaC0oMVvxQXakINSZkoU0EDWSCulCGcszHaKdL1kbV4y2faH4mpwMtepEz8/PECwUeGg9BRkoIkEFJitYUU6/pQlbE8NtrlWEUV/+lnLzJQi12hPjCwrHOX/V6iVBCdrq0w+nHhc9PrVZwCU2JBHFA1pLvmgsU35u9iKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VztYwNuw; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VztYwNuw"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2241e7e3addso91385055ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743522555; x=1744127355; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8wH3EOfhowl2ah+tdgIUAwIwU2yTiFV9tKRtcsqEfls=;
        b=VztYwNuw5CBmlg1pU1133QTiIJZWe/w5dJA5xCrGtbVVr1N/XvO3tqGbQPZjJHAEGe
         KMZMoiqY35jND/HUxDESZLQs87IvgTZzyT+QSGuFU5wz3+lgYkzZ8iL2EPmQL7WXsW5O
         DX4n3njQwEJGbw0V18WXrVY5fHFzfL5YryG67WFhiZeI+8iwU0ldaIbh7C69K5DSsCZJ
         qUwbavOIyVJ9x4ZyaY6xvxPdjb6pGhXUlSTJM0woBPRKvuh9cb8+XMrj5EU6Vl3Neqh1
         kUHfQk6PShDZxnkT9PTicnSxfJHj9DWZzYsrq3CQBcPR/ComwQIfrB7g8Q2O+V/83i+f
         tu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522555; x=1744127355;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wH3EOfhowl2ah+tdgIUAwIwU2yTiFV9tKRtcsqEfls=;
        b=LgCbytwfN524h47v3Gp3AvSVWa87Bk7TQiB/kcccT0EOSdODnOKzYaddhC9e3xIUzV
         DuTfOlD4AJGDRWcdLzSPlx5NBgd6yicdFdQVzqv3Ad93yhl9kIbHvozeTwm7t/jKx0N9
         n+cKCKIVuV0dOj9y+jpMHwS7t9/fOwXMtzWkaCP2jz2KiwT6ZctHPOdAQ3KyYPPm/omT
         Vtt/15nR+yOBZX6KOm26RTwTv74qY0WCxuLxvDZ9htubCC6T+1SB8Kgeqm080j/8N4D+
         B0awNoNU3jjY7/PUirnW7zy43mtxm8Z92/a+2LBbjbRdXuaO9vQF6cAAc71z0D957979
         RnSA==
X-Forwarded-Encrypted: i=1; AJvYcCWAnQc6gusJGjM2lEDTw7j3R1DAxrN/9XNLe9wciq2kHDfzslu0AWu0P+hRyZdLAX8ac0Q8zoCHOcdtXOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZybdrSjKRg4G8DPTIkyQd9Vh1jhLq4rUEs9ExXRNo41rz3Xce
	sapqUIirpf9bsStrdUm9MJV3670zpkKwfoxjBjV6IoEV8Km42WjrxrBfhrT4DJ5mqW50Mf4ll1a
	57g==
X-Google-Smtp-Source: AGHT+IH86RKe+94T4SRRkFodCtx5qKlady13L3+LhOcM6mMcYsZC46a6axWch98wxyXO/mby85l8LBVLSYY=
X-Received: from pltl12.prod.google.com ([2002:a17:902:70cc:b0:226:342c:5750])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f693:b0:220:ca39:d453
 with SMTP id d9443c01a7336-2295be7969fmr50326595ad.17.1743522555079; Tue, 01
 Apr 2025 08:49:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Apr 2025 08:47:26 -0700
In-Reply-To: <20250401154727.835231-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401154727.835231-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401154727.835231-2-seanjc@google.com>
Subject: [PATCH 1/2] KVM: VMX: Assert that IRQs are disabled when putting vCPU
 on PI wakeup list
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Assert that IRQs are already disabled when putting a vCPU on a CPU's PI
wakeup list, as opposed to saving/disabling+restoring IRQs.  KVM relies on
IRQs being disabled until the vCPU task is fully scheduled out, i.e. until
the scheduler has dropped all of its per-CPU locks (e.g. for the runqueue),
as attempting to wake the task while it's being scheduled out could lead
to deadlock.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index ec08fa3caf43..840d435229a8 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -148,9 +148,8 @@ static void pi_enable_wakeup_handler(struct kvm_vcpu *vcpu)
 	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 	struct pi_desc old, new;
-	unsigned long flags;
 
-	local_irq_save(flags);
+	lockdep_assert_irqs_disabled();
 
 	raw_spin_lock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
 	list_add_tail(&vmx->pi_wakeup_list,
@@ -176,8 +175,6 @@ static void pi_enable_wakeup_handler(struct kvm_vcpu *vcpu)
 	 */
 	if (pi_test_on(&new))
 		__apic_send_IPI_self(POSTED_INTR_WAKEUP_VECTOR);
-
-	local_irq_restore(flags);
 }
 
 static bool vmx_needs_pi_wakeup(struct kvm_vcpu *vcpu)
-- 
2.49.0.472.ge94155a9ec-goog

