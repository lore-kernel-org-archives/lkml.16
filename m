Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE310250BE5
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284761; cv=none; b=DoBnet3EzLkleM4gCYVavoXp5n8ZbxTxN+Z8OEakhETYtFojm3Bv+Azem8s22fnPkOXrziuU+0W9mNxxG205llSfXNQAvSSlVo1QAhuBxgUD/kI3ffwnCC+428GLsXNurH71CNbvOuXMuoANPcjpDxBCpsuYOYdktxiDF6kThFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284761; c=relaxed/simple;
	bh=Xh97xB0t4V0m4yRQ6og3fwpvTr3Hlw3peV8Pp9xA1Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XUEk+EBNXtF7n1csCnzlwSrHm9iYKT8KuSfEP8SXt2rmZgrVP+tAv/zdwLvTaPw1egLHx7VQAILWjGzIX5gdU5DtJZVro7d4zcEcGmRUIXNLpuR+Tk3SdxMiKFBe7t8e9b/IP/zTJXxSPSUN85pVdoKXFbzaNmP4yHcTJDKdKJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DloCq0Oy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DloCq0Oy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739284757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wSVu+15UXFfSOFL1ip9ZLwAcn38zQdv9iDAl5Qkapx0=;
	b=DloCq0OyazzmozOE+rLRG8OFu/HQ8ppOsK+QvUP5xNgT9/Zpt5pBzLt/L2LiPx220fxnJ4
	jDxAmLdIdUiGSpKAg/QzrZg9GjjcDHDqR60LtEW9PRebzRkJhzakAQ38c6BrA88EAD906u
	ezigBMBQgx1NN9Q43At6NPY80n4hByg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-cavNOnVcP_mgVrDcYUwebQ-1; Tue, 11 Feb 2025 09:39:16 -0500
X-MC-Unique: cavNOnVcP_mgVrDcYUwebQ-1
X-Mimecast-MFC-AGG-ID: cavNOnVcP_mgVrDcYUwebQ
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38dcd8ddc5eso2908671f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:39:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284755; x=1739889555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSVu+15UXFfSOFL1ip9ZLwAcn38zQdv9iDAl5Qkapx0=;
        b=rUUXxHRYwMJz0ENzBN6V0M8d825Rs0HfTNKwvEHvdWOm/qC4xZWd+aysaSyTS6i8mF
         DktCkrbJ5d6XtZrK2iuNKciAYGeTdOnYVS+fyFHuZFv45JsvzdMb3xTkWhRixULQtRa4
         5bPYsjULTPwdPrhgWtVaHn1PuA74h6ZCiBPVyu3Tt98mXAtLOXH95wdsjJ2BimFmYxnF
         nLrld7R/wr+9JcRbQY97U0U4dItXmtPU6XnT6MF7quwa30tCHczhoHWU4aSv5EGmQmMP
         HeNe5v+dwFxJ0lkJIxhcF3cli+AjUp7a1DQWPnIKLKQliWamf4Th96C52dhO5KnSB5VN
         mb2A==
X-Forwarded-Encrypted: i=1; AJvYcCXbPAzQETQcmjjzwXxx8cNMypBO65BQC5egTOfq9DWqPL2tzEWPBl5pSM39V54K7jrhpjc1qX2Aizk5M/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcBwZbVjc4htUxtivlwLe/HdGj5e4sAeFqgwv3IiYrcFrEQ0QJ
	0OXxL3/WRyU4YjqT9sEbc6CXH7g64g0qn3z56ANWhzyxpBNhbRNuSRUs2w1+7SSE7MHD4493sXV
	9is84AYEzmQi+XPnam5jWVDG1fm9tPa0lcxxgANmoKROgEFmsJ8Bq1jOjlnUz7Q==
X-Gm-Gg: ASbGncuLryATTL7aeZMuwtFcmhqqQLpqby1R0WNvoUubPj9NJX9XeBJUUDlxxW1cUMO
	+t8rsfE7AjhKNtBBblYCLzDl4EqIEu6Y7utJrviw8cZoN0WhV1PqtsgR1CPUnSnXBMMEGk0qVHH
	Ccv8QsQSNnQABH3isABnhpUo5Sg0znzZ+FBTNDcvBqxYMWcKiNsnrCXwOZZ11iDgSqbZrB75H0B
	pJD3+FX1QgM+i6miDvM7h71xd1w67xj820OGf16sA2p7VDY8/oQtD+QPp3HO+nHetjZRkqpr/xM
	U3wIz42YQgvBuHIY1fDsA00ntPI7OC+v9QZDS1SQHpRsSNhlOTV1+8ml+j8N7KQoXEM=
X-Received: by 2002:adf:ef4c:0:b0:38d:bec9:c8d with SMTP id ffacd0b85a97d-38dc936545bmr10411281f8f.53.1739284754973;
        Tue, 11 Feb 2025 06:39:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVlLeeltNgiMbHSqxLznPIfhFN4eDHUttCSHrTtTV0bsdUK3PjmcFdHZ6fTWELMuF2PXz6rg==
X-Received: by 2002:adf:ef4c:0:b0:38d:bec9:c8d with SMTP id ffacd0b85a97d-38dc936545bmr10411256f8f.53.1739284754577;
        Tue, 11 Feb 2025 06:39:14 -0800 (PST)
Received: from rh.fritz.box (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcc9bd251sm11745833f8f.9.2025.02.11.06.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:39:13 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] KVM: arm64: Allow userspace to change REVIDR_EL1
Date: Tue, 11 Feb 2025 15:39:08 +0100
Message-ID: <20250211143910.16775-3-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211143910.16775-1-sebott@redhat.com>
References: <20250211143910.16775-1-sebott@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable VMMs to write REVIDR_EL1 by treating it as a VM ID register.
Trap guest access of REVIDR_EL1 when the VMs value differs from hardware.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h |  3 +++
 arch/arm64/kvm/sys_regs.c         | 11 ++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3db8c773339e..c8fba4111b77 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -374,6 +374,7 @@ struct kvm_arch {
 	u64 id_regs[KVM_ARM_ID_REG_NUM];
 
 	u64 midr_el1;
+	u64 revidr_el1;
 	u64 ctr_el0;
 
 	/* Masks for VNCR-backed and general EL2 sysregs */
@@ -1472,6 +1473,8 @@ static inline u64 *__vm_id_reg(struct kvm_arch *ka, u32 reg)
 		return &ka->id_regs[IDREG_IDX(reg)];
 	case SYS_MIDR_EL1:
 		return &ka->midr_el1;
+	case SYS_REVIDR_EL1:
+		return &ka->revidr_el1;
 	case SYS_CTR_EL0:
 		return &ka->ctr_el0;
 	default:
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 7e1c9884f62a..646c0a04e58a 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1666,7 +1666,8 @@ static bool is_feature_id_reg(u32 encoding)
  */
 static inline bool is_vm_ftr_id_reg(u32 id)
 {
-	if (id == SYS_CTR_EL0 || id == SYS_MIDR_EL1)
+	if (id == SYS_CTR_EL0 || id == SYS_MIDR_EL1 ||
+	    id == SYS_REVIDR_EL1)
 		return true;
 
 	return (sys_reg_Op0(id) == 3 && sys_reg_Op1(id) == 0 &&
@@ -2542,6 +2543,7 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
 	}
 
 FUNCTION_RESET(midr_el1)
+FUNCTION_RESET(revidr_el1)
 
 
 /*
@@ -2595,6 +2597,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ ID_DESC(MIDR_EL1), .set_user = set_id_reg_non_ftr, .visibility = id_visibility,
 	  .reset = reset_midr_el1, .val = GENMASK_ULL(31, 0) },
 	{ SYS_DESC(SYS_MPIDR_EL1), NULL, reset_mpidr, MPIDR_EL1 },
+	{ ID_DESC(REVIDR_EL1), .set_user = set_id_reg_non_ftr, .visibility = id_visibility,
+	  .reset = reset_revidr_el1, .val = -1ULL },
 
 	/*
 	 * ID regs: all ID_SANITISED() entries here must have corresponding
@@ -4646,12 +4650,10 @@ id_to_sys_reg_desc(struct kvm_vcpu *vcpu, u64 id,
 		return ((struct sys_reg_desc *)r)->val;			\
 	}
 
-FUNCTION_INVARIANT(revidr_el1)
 FUNCTION_INVARIANT(aidr_el1)
 
 /* ->val is filled in by kvm_sys_reg_table_init() */
 static struct sys_reg_desc invariant_sys_regs[] __ro_after_init = {
-	{ SYS_DESC(SYS_REVIDR_EL1), NULL, reset_revidr_el1 },
 	{ SYS_DESC(SYS_AIDR_EL1), NULL, reset_aidr_el1 },
 };
 
@@ -4999,6 +5001,9 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
 	else
 		vcpu->arch.hcr_el2 |= HCR_TID2;
 
+	if (kvm_read_vm_id_reg(kvm, SYS_REVIDR_EL1) != read_sysreg(REVIDR_EL1))
+		vcpu->arch.hcr_el2 |= HCR_TID1;
+
 	if (vcpu_el1_is_32bit(vcpu))
 		vcpu->arch.hcr_el2 &= ~HCR_RW;
 
-- 
2.42.0

