Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B884020F063
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829967; cv=none; b=nnj7/nACpnPRVN6Lto+uDAo2umEQTS/iFLaojx/WoRvVNpqjBnRkDo9B0jjPV15fhYL7dbA6CqqpmP+IUg0raFMUE43RzMclUCsAUsD1MQ533PuVYLHNROqwi74BZ1WOR6gG+44dq2YPdwPL3AS8QoojT0NVGUcfBPz1dCMUOT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829967; c=relaxed/simple;
	bh=Ci1/ilbhd8VIC+oxHWhP8i2cQbOsisZvulH3qn/eMlw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=le4WFoDOr9p7opDlk4Ribq9o+WXjiAvEEYL02pogQWW7WlCfkjaHgr9y/Dm76pHoIW5928XPSBd/SojGn5eMRj1rApVXjk9+Gfu4+Xh9z1vqyqj9AGLZLpuAz14olrbAX64eGYTx9shdoS1+2AdfHQjnvZp8vx8VotEIzdibLvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rananta.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YQZ6wGNI; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rananta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YQZ6wGNI"
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-875bd5522e9so234036439f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749829964; x=1750434764; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oeEVYUZ5YyS7Po4kQ9W2WYTxXWOxgfNLZlSZcUsGw0o=;
        b=YQZ6wGNIXeW2/Nlanw70aG8mRTW090hfY1ouit3nTVAJfMt3n3N3bySphy1+uE2Qfw
         86hnPRpSjvrrHUk/sLdFPipYminFedCVqDS/7rhcFIGJKvng1NFK+b8AO4smE7N08Qje
         I2VL0hiwYTYYkxnyZT8h+fF7jcbOyk46XWyXH6CcVsPsOlOkVmSZz0nlHvczuokZ9L1s
         1baCS4tTqWteNwzKYQHfYyDiy9aqNFv3MegoeuWuKoopLgLzq8NNSKM+C7ez+5SUVvtG
         zYA0RgBFxSdB/C7kJ1mt2s3rms1CAlZVxbGCt493FKmpvH+ffmhFFokZmiLpMYFDFQUq
         Sw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829964; x=1750434764;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeEVYUZ5YyS7Po4kQ9W2WYTxXWOxgfNLZlSZcUsGw0o=;
        b=Iuf7ILA0n5+dOBGfzPVnu3EaIkI6s8igJagLOew3W8nFiN8XFN9Nyl/rwgL/ULLxGT
         WREn0KdoNwcp8G7XQ/zZ6WWwE3D1AgyD0da7GChTnRcFtyIP6wUpO2l4xADbVZtQBxQQ
         SM0fRRm7Z6kloBns3u3lwWUhBqI0AlRe32EVnmYMUQV8OU2O10T3aLJOujIIdsMvpx3A
         akVHNH15WYjp+IH/g8p+YlUh6+z4OiiN3ZFwt7nQIAcRcd/EKEYcS7oofY64Uqeo0NzF
         4WW72o7o33uKXRl4Q0K4svs8eb8VeXDp/skRTFT8qXpMNtRDn5/vtqe1zdN+QWPiL71K
         HEwA==
X-Forwarded-Encrypted: i=1; AJvYcCWX28ymNrQedpvh43ojR0dJ2UoO1GMgOu4EuI3+A3WCrGS6PZO5zc4X/KmSkBCnXb2kkgP707dv3/7otQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT7ncM/Rg2g65zm8+3AAwA2Qdayg0FZQe2ggogFu+MQp8QyKXr
	aTKHxy2zARz4TPZrkTcGguhsScwDgHh5QnuD3aNgf4M3/bGOuqUbHpKNkCviCkMaU18qwDytSBz
	te8GV4dmq7g==
X-Google-Smtp-Source: AGHT+IFunbFJhKmi5ZFShXe5exfB3EJuEIksn0wi7XdmxJ1Imwtlw1UTfq/1Z4OxBS2uV1KpJFLBY6hAS3Gk
X-Received: from iobel14.prod.google.com ([2002:a05:6602:3e8e:b0:86c:fede:130b])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:7504:b0:873:f22:92fb
 with SMTP id ca18e2360f4ac-875d3bf0780mr439553039f.1.1749829963955; Fri, 13
 Jun 2025 08:52:43 -0700 (PDT)
Date: Fri, 13 Jun 2025 15:52:35 +0000
In-Reply-To: <20250613155239.2029059-1-rananta@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250613155239.2029059-1-rananta@google.com>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250613155239.2029059-2-rananta@google.com>
Subject: [PATCH v3 1/4] KVM: arm64: Disambiguate support for vSGIs v. vLPIs
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Oliver Upton <oliver.upton@linux.dev>

vgic_supports_direct_msis() is a bit of a misnomer, as it returns true
if either vSGIs or vLPIs are supported. Pick it apart into a few
predicates and replace some open-coded checks for vSGIs.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-init.c    |  4 ++--
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 16 ++++++++++------
 arch/arm64/kvm/vgic/vgic-v4.c      |  4 ++--
 arch/arm64/kvm/vgic/vgic.c         |  4 ++--
 arch/arm64/kvm/vgic/vgic.h         |  7 +++++++
 5 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index eb1205654ac8..5e0e4559004b 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -395,7 +395,7 @@ int vgic_init(struct kvm *kvm)
 	 * v4 support so that we get HW-accelerated vSGIs. Otherwise, only
 	 * enable it if we present a virtual ITS to the guest.
 	 */
-	if (vgic_supports_direct_msis(kvm)) {
+	if (vgic_supports_direct_irqs(kvm)) {
 		ret = vgic_v4_init(kvm);
 		if (ret)
 			goto out;
@@ -443,7 +443,7 @@ static void kvm_vgic_dist_destroy(struct kvm *kvm)
 		dist->vgic_cpu_base = VGIC_ADDR_UNDEF;
 	}
 
-	if (vgic_supports_direct_msis(kvm))
+	if (vgic_supports_direct_irqs(kvm))
 		vgic_v4_teardown(kvm);
 
 	xa_destroy(&dist->lpi_xa);
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index ae4c0593d114..1a9c5b4418b2 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -50,8 +50,12 @@ bool vgic_has_its(struct kvm *kvm)
 
 bool vgic_supports_direct_msis(struct kvm *kvm)
 {
-	return (kvm_vgic_global_state.has_gicv4_1 ||
-		(kvm_vgic_global_state.has_gicv4 && vgic_has_its(kvm)));
+	return kvm_vgic_global_state.has_gicv4 && vgic_has_its(kvm);
+}
+
+bool vgic_supports_direct_sgis(struct kvm *kvm)
+{
+	return kvm_vgic_global_state.has_gicv4_1 && gic_cpuif_has_vsgi();
 }
 
 /*
@@ -86,7 +90,7 @@ static unsigned long vgic_mmio_read_v3_misc(struct kvm_vcpu *vcpu,
 		}
 		break;
 	case GICD_TYPER2:
-		if (kvm_vgic_global_state.has_gicv4_1 && gic_cpuif_has_vsgi())
+		if (vgic_supports_direct_sgis(vcpu->kvm))
 			value = GICD_TYPER2_nASSGIcap;
 		break;
 	case GICD_IIDR:
@@ -119,7 +123,7 @@ static void vgic_mmio_write_v3_misc(struct kvm_vcpu *vcpu,
 		dist->enabled = val & GICD_CTLR_ENABLE_SS_G1;
 
 		/* Not a GICv4.1? No HW SGIs */
-		if (!kvm_vgic_global_state.has_gicv4_1 || !gic_cpuif_has_vsgi())
+		if (!vgic_supports_direct_sgis(vcpu->kvm))
 			val &= ~GICD_CTLR_nASSGIreq;
 
 		/* Dist stays enabled? nASSGIreq is RO */
@@ -133,7 +137,7 @@ static void vgic_mmio_write_v3_misc(struct kvm_vcpu *vcpu,
 		if (is_hwsgi != dist->nassgireq)
 			vgic_v4_configure_vsgis(vcpu->kvm);
 
-		if (kvm_vgic_global_state.has_gicv4_1 &&
+		if (vgic_supports_direct_sgis(vcpu->kvm) &&
 		    was_enabled != dist->enabled)
 			kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_RELOAD_GICv4);
 		else if (!was_enabled && dist->enabled)
@@ -178,7 +182,7 @@ static int vgic_mmio_uaccess_write_v3_misc(struct kvm_vcpu *vcpu,
 		}
 	case GICD_CTLR:
 		/* Not a GICv4.1? No HW SGIs */
-		if (!kvm_vgic_global_state.has_gicv4_1)
+		if (vgic_supports_direct_sgis(vcpu->kvm))
 			val &= ~GICD_CTLR_nASSGIreq;
 
 		dist->enabled = val & GICD_CTLR_ENABLE_SS_G1;
diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index 193946108192..e7e284d47a77 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -356,7 +356,7 @@ int vgic_v4_put(struct kvm_vcpu *vcpu)
 {
 	struct its_vpe *vpe = &vcpu->arch.vgic_cpu.vgic_v3.its_vpe;
 
-	if (!vgic_supports_direct_msis(vcpu->kvm) || !vpe->resident)
+	if (!vgic_supports_direct_irqs(vcpu->kvm) || !vpe->resident)
 		return 0;
 
 	return its_make_vpe_non_resident(vpe, vgic_v4_want_doorbell(vcpu));
@@ -367,7 +367,7 @@ int vgic_v4_load(struct kvm_vcpu *vcpu)
 	struct its_vpe *vpe = &vcpu->arch.vgic_cpu.vgic_v3.its_vpe;
 	int err;
 
-	if (!vgic_supports_direct_msis(vcpu->kvm) || vpe->resident)
+	if (!vgic_supports_direct_irqs(vcpu->kvm) || vpe->resident)
 		return 0;
 
 	if (vcpu_get_flag(vcpu, IN_WFI))
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 8f8096d48925..f5148b38120a 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -951,7 +951,7 @@ void kvm_vgic_flush_hwstate(struct kvm_vcpu *vcpu)
 	 * can be directly injected (GICv4).
 	 */
 	if (list_empty(&vcpu->arch.vgic_cpu.ap_list_head) &&
-	    !vgic_supports_direct_msis(vcpu->kvm))
+	    !vgic_supports_direct_irqs(vcpu->kvm))
 		return;
 
 	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
@@ -965,7 +965,7 @@ void kvm_vgic_flush_hwstate(struct kvm_vcpu *vcpu)
 	if (can_access_vgic_from_kernel())
 		vgic_restore_state(vcpu);
 
-	if (vgic_supports_direct_msis(vcpu->kvm))
+	if (vgic_supports_direct_irqs(vcpu->kvm))
 		vgic_v4_commit(vcpu);
 }
 
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 4349084cb9a6..ebf9ed6adeac 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -370,6 +370,13 @@ int vgic_its_inv_lpi(struct kvm *kvm, struct vgic_irq *irq);
 int vgic_its_invall(struct kvm_vcpu *vcpu);
 
 bool vgic_supports_direct_msis(struct kvm *kvm);
+bool vgic_supports_direct_sgis(struct kvm *kvm);
+
+static inline bool vgic_supports_direct_irqs(struct kvm *kvm)
+{
+	return vgic_supports_direct_msis(kvm) || vgic_supports_direct_sgis(kvm);
+}
+
 int vgic_v4_init(struct kvm *kvm);
 void vgic_v4_teardown(struct kvm *kvm);
 void vgic_v4_configure_vsgis(struct kvm *kvm);
-- 
2.50.0.rc2.692.g299adb8693-goog

