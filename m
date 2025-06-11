Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99352BFC7F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682097; cv=none; b=NdhYHO3OUfht4p1IOcxJWEQKiwkRXvjXPvc05dyP/E0I4AvSOfQEL7zmbKEQIG6pR+zPiwooctenAC1F9WU//Nm/x/jXfymwTuIPbU1TK4RNbZQqOh09J8JdCmi3k5zAg75jPxUrS2OMosS201/fojaNh7z5HBlkLM3p3gPJqUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682097; c=relaxed/simple;
	bh=sZKpR+29jrgmDW8zj3gsPXr7vmaepNsrgM7wJ6uDWQw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Pzo7x/lrA+zmKRVGADmDI+rSaTiqq70bh9E1s2S4zf3fTWxxjrIVo4psKugS0DR6ubt0UmYEws2p7ZTJhnpnUv5hu2wsTH9mDek+rh99hZBBbX3ffRVJjetDSJKqfNjb7qajTgo7RZ+vHQg4aMGeGaKx+VDv0qhPOhyu3WT32HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j5Yi/Ji8; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j5Yi/Ji8"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2fcbd76b61so236587a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682095; x=1750286895; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8FnMVkTP7732/rGDqsdkPg9eAdht5jy1QJRhPQZX9sI=;
        b=j5Yi/Ji8sfvr1Sbpj1maZ2HPjL0CincsbF7Q/jpP9Wj50sGDXz7L1EwpfDtiJsaF1R
         sGBtwPvCaARA8wTwtK47CRV1rQ210Pb4A3s8jyNhZOe8ErMa7zkXkpI6HEJnkbOzTk8t
         E4Tr2kydOrqdyn6OCB3p9b6iZ2fSDFrK08LRQURiPjTGQtZcvQLP8NNTjtQQB60kgShi
         qijWgTchP4dm0nTQvoh59mMH7k8I+FD9hx1mJH0LDuSOK+PGFbskIO9fsdlKO1hqt7wg
         pM+9GY2OvJR++ntKS4Ez4p53iOmdUSZmpboM3jXR7T+5Sas4/hwRdgAzy6VzkfY56ewz
         YIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682095; x=1750286895;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8FnMVkTP7732/rGDqsdkPg9eAdht5jy1QJRhPQZX9sI=;
        b=Jywgo+OMnqSubgn8w7gIqRBK9LWEA/lNpNHACw/YlL3xeRYDLZxx4dhgwpGSZ0a1XH
         oOGJZTiZmmtPvlFEvRr+iTydwHsLM0vyUCd+dYWynDMWwAaEUlh0pUn0Y4y02GROihNw
         m0GwcP2OD6jt3W/Zh5YdX/k5PaQi9a/dEprZNxUQTiKVqBUnXHrpv+g2bB1+QwiBLRIj
         poqyS6Wl0luomi7+NnroyPhHR261h01VssCR3cwKflPgO5X/bq5ke7BP+Ssa0i0I5Fh5
         ym+jXvRa4QZman6oU/kpysJaQ0P3gu2OgCS1l53O3z4TJ9IwY5HNeDxh3dN6KuoWB9R4
         ep7w==
X-Forwarded-Encrypted: i=1; AJvYcCWnt6OUugg2zhO6hXvs2dfku9CbgAfptAl3+ShkXVLdTtsjBhMIMfbzU16XJlbDbwasumBlOXzEydsN6G0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAVVMGG4xUR1zG9KRtpBp2JyRPRozM7Ipr7RhbJyJGpPDWpBSr
	XuNQKKdMwsbNB2YKdNo0Sw3aO6+Zq2fe9EuQPIE0kIgYtzt7Y96/6vgUsJkLhvKsTXedw03/yI7
	vtFp5Ig==
X-Google-Smtp-Source: AGHT+IEkxrCdp03yXvohQUC5aX3+y16xZeqjkREhnIK0pQh5uO/LXqt4ZRF8KMwqJnvnYQVw6yQOWD1N5g8=
X-Received: from pgbfp15.prod.google.com ([2002:a05:6a02:2cef:b0:b2e:c392:14f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:32a4:b0:204:4573:d854
 with SMTP id adf61e73a8af0-21f9b6b34afmr672683637.9.1749682095254; Wed, 11
 Jun 2025 15:48:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:49 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-48-seanjc@google.com>
Subject: [PATCH v3 46/62] KVM: SVM: WARN if (de)activating guest mode in IOMMU fails
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

WARN if (de)activating "guest mode" for an IRTE entry fails as modifying
an IRTE should only fail if KVM is buggy, e.g. has stale metadata.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index ab7fb8950cc0..6048cd90e731 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -724,10 +724,9 @@ void avic_apicv_post_state_restore(struct kvm_vcpu *vcpu)
 	avic_handle_ldr_update(vcpu);
 }
 
-static int avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
+static void avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
 {
 	int apic_id = kvm_cpu_get_apicid(vcpu->cpu);
-	int ret = 0;
 	unsigned long flags;
 	struct vcpu_svm *svm = to_svm(vcpu);
 	struct kvm_kernel_irqfd *irqfd;
@@ -742,16 +741,15 @@ static int avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
 		goto out;
 
 	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list) {
+		void *data = irqfd->irq_bypass_data;
+
 		if (activate)
-			ret = amd_iommu_activate_guest_mode(irqfd->irq_bypass_data, apic_id);
+			WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, apic_id));
 		else
-			ret = amd_iommu_deactivate_guest_mode(irqfd->irq_bypass_data);
-		if (ret)
-			break;
+			WARN_ON_ONCE(amd_iommu_deactivate_guest_mode(data));
 	}
 out:
 	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
-	return ret;
 }
 
 static void svm_ir_list_del(struct kvm_kernel_irqfd *irqfd)
-- 
2.50.0.rc1.591.g9c95f17f64-goog

