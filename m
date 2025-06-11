Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518FB2EACE4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682100; cv=none; b=Oy7Lp9CGc6vY76qRFXg4o9Ezs5Wo714Dt4tFhGq/IHNrWXabYwkN2czv5l827PN09ICxhHbG96gIh2gV8vNZ0LadBnon0NxbnIH23x6DS/mNxVSSigJmKA46/xnTW+ciYZ/TcNk5s6xiaKSfaeluK8xKtO/pAib5FuU/qf2bgHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682100; c=relaxed/simple;
	bh=CDdmw6dFL6wn+8FcljdzaGx8a8PnN2FcUrIylCf+kXA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dygU6hzNXcJsD7C8DdwhCnYimKGhvWudFPZt8dQZswgoixKeAQc+mJDseaFCzZbMdiqob7BD+ODie5K1Igjj6fHsQfN8MPDH5r/rYBSW2/fkC5LqX/iaNhcynRs1ZxIYD27OR/B7l/OFgANauP5UtocqVcmVFkDKTNxbC4fGE3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pJLghggt; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pJLghggt"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7398d70abbfso375788b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682099; x=1750286899; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=PBmMQxjdJ9cFQvfjWX4n11ei39HpxV6UN/bk9QZ1bLc=;
        b=pJLghggt9N6V2LnQJ1MLoVk9NZYRkigNTw6mej7Jqzm5EKpuqbo2EN6ZiaD/EAsXRV
         2JuEIg7Rbt6sQmm6NdLJLOY4b83owwASyM1Jc822cdyA0TBvxiyWJuV1rTRsZ5zClubg
         hsKOFchLgjDqoGWdHhVpOdvb7cQezdC60hkNUfSwRLA7nKVhev3mf4XaypVue0fzr27V
         Rw8DRezJyGJ8m9x33ZKYXytUpK+3G+5BMi6m4pd6KP0wW2s7ypl7OaTpoFHsT7VBq7qX
         8Znl228I6CqnqKVipa7hYqHJy5g/Lzgc+Atq7907DvXrvVHT+QYuuZq/sL51xVHzxzYG
         3vXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682099; x=1750286899;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBmMQxjdJ9cFQvfjWX4n11ei39HpxV6UN/bk9QZ1bLc=;
        b=KIZauYQMLrGmWGCImkwHhBM5S5U8RZLSRGjQ/gAjzOLgdhJeAzrwKpDuCnS9kA4YO4
         xZjlRqWuA7GZ8C9fOY+9GsJjw8XI1s3+OaariSDzE38J893HJjAuwLWjVIkuBLoJIhFx
         jFseMUmjQVodOnhGC3PvxaHmx+YbV4hcRBhSO8eqO8pYEeb8XmmkYDJ+fF6yVnmPBbCt
         DlJQl7TwVa0Sg5xkRf22KH+IP+AqGhbuPguM/jwZMqOuzYbvly7vqcfYd1WRD4zLliIl
         DnhS48h3WZYSkVcHt30F/Wjm/AcmQh0Viiery8OBUmWSonMb6xJHXzSDjCbUyBCVapQk
         OafA==
X-Forwarded-Encrypted: i=1; AJvYcCUrmV3jGVmUSzQKkyPaV5v9sd03r/8pzLWPaf8NBM9iT/Wy1Ika/kwLmnE2V86rtlWoXND1r9+R2G6yX/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc/lA1FqEpRQVezfHSWaym3UsxNqAgLzqv2hhOUF8TyEdR9epq
	kEsbbStV4WDzzoZkql0ZapW1xwT3cDQgtY1Pppq/Abzw7ehIaTzYqt7nfE6EXqdZI/MkUifMDpm
	9xLXsNQ==
X-Google-Smtp-Source: AGHT+IEBM47Uz2X6xS0CCAIos8ahR8hfvX5maaZpinfB8zlXBAyKSgRG4LiJD4Zyz26rgc00CLciKxSYoFk=
X-Received: from pfbk13.prod.google.com ([2002:a05:6a00:b00d:b0:746:21fd:3f7a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1387:b0:73e:30dc:bb9b
 with SMTP id d2e1a72fcca58-7486cb721aemr6046845b3a.2.1749682098847; Wed, 11
 Jun 2025 15:48:18 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:51 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-50-seanjc@google.com>
Subject: [PATCH v3 48/62] KVM: SVM: WARN if updating IRTE GA fields in IOMMU fails
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

WARN if updating GA information for an IRTE entry fails as modifying an
IRTE should only fail if KVM is buggy, e.g. has stale metadata, and
because returning an error that is always ignored is pointless.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 24e07f075646..d1f7b35c1b02 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -834,9 +834,8 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 	return irq_set_vcpu_affinity(host_irq, NULL);
 }
 
-static inline int avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu)
+static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu)
 {
-	int ret = 0;
 	struct vcpu_svm *svm = to_svm(vcpu);
 	struct kvm_kernel_irqfd *irqfd;
 
@@ -847,12 +846,10 @@ static inline int avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu
 	 * interrupt remapping table entry targeting this vcpu.
 	 */
 	if (list_empty(&svm->ir_list))
-		return 0;
+		return;
 
 	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list)
-		ret = amd_iommu_update_ga(cpu, irqfd->irq_bypass_data);
-
-	return ret;
+		WARN_ON_ONCE(amd_iommu_update_ga(cpu, irqfd->irq_bypass_data));
 }
 
 void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
-- 
2.50.0.rc1.591.g9c95f17f64-goog

