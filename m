Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C152505D3
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284759; cv=none; b=kOEH6lwercyIM4EdD9n7hj9c2KqMnxixz3Mg7b43f22arHr3WhDOWoZaNf101/gZmzkgg7otshgQ+Hvl6X2dGvdt5MYcIN77B/9Im2S4vbvlL9keUmfd/e5U3ieAXw02o+oDLlU86c7aFw1ofwbPOVHQop5+Yot8DeUTGS6FKCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284759; c=relaxed/simple;
	bh=7JHbJ2DuZCv74J5NSz9ZAXfYRHZMl6ToNndRqFA4VjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWhuT6Piiq0tAaDJy+Mm3YvGPm6TIHjW9+/I8fRJKBhKY7z2htkWujBkh/EuIfXoRsWeXIdtRfyYJeyyhdA9IPivN0tP3678R0W7MzpDFHom5eG9O1B99qBF5kLUMLIMv0IMZtFsVhsF8ve8Pet6o8jeU7/hEbj7Q4Pr/mJPdQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M6I8q3Tu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M6I8q3Tu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739284756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dxQC5OSA8UNrYi2FsJ8qImpmh+po7bw6P6uEsaW3lFQ=;
	b=M6I8q3TubzWgikhKXjYI15HBLMefCkIPqJVCHCyFIPhvHqXp2bcgL4QGaH90czG678UQZe
	JWxerxweN04ydmq94iYFbSEarolGc3eUrhcU4n5vcxvWSRMlx+HdSkbl01zK7mmoGDt44F
	A67K3zCibIuGF9b++UO9a/t8V8k+cbg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-vngaNjaWOcaPKO6AnuREIQ-1; Tue, 11 Feb 2025 09:39:15 -0500
X-MC-Unique: vngaNjaWOcaPKO6AnuREIQ-1
X-Mimecast-MFC-AGG-ID: vngaNjaWOcaPKO6AnuREIQ
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4393e89e910so14427195e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284754; x=1739889554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxQC5OSA8UNrYi2FsJ8qImpmh+po7bw6P6uEsaW3lFQ=;
        b=gUNaJnPci7vJ4Rr3O+gdc0hPbXuURjFjeb3TztxPAqo6PH9My9OZxAa9XBAkrCp8Zb
         0FCuvfGzMK9lxbifkvpAfw6Itt0uOxcSHDStL0Sajl17jYLtAnB8UGtr7F4WuZrmMg2c
         1T1nHPtkIjEQf6nFlN4VggYBvDHkEUB9Mjo/bG7GPEfslwDmdcpGWvheXMSZ+/R+iovG
         mXZeWozE41YRGbPRO8mQSI36JY+0lUe7UKtQQ3q9K3AfZyKIxl3odIYP+OpieFp2MaSH
         t5KuOS81ZrfF8FLEhaLuOuxiBz5+PaKJhGtGZGZdUhVGuHSWVy4xcVs/ZdCCpXjVn6fE
         xTYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX3deQDE5efkxaELCm8y0ShDo1GueZJcI+jnVegwN3TogbKmoi3HXa/q3br5GjADqdJ8ElIKTAehAds2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcTw90839cGNku+1frzIz60iqJphLPNh9SCKF+5/SFEhhjHelt
	5qPz2cCxmk6ikQHfzOGKPqkA7/mERkOPb8S9+5aZhOXDDf+t8ja9C9hv5k5CcUgRd52Mf2AMCyx
	MIORYHejnoePtKiA2TsqaiEnyVi8OF8B8FOhHRCrfvrDik9IxB6NjkqCj5bKFhg==
X-Gm-Gg: ASbGncufTKtdIRnOhJB7Y1QSN+zpywq+H/5qEDkk0iSg5rmU/ql1QY2zqf6qM7abe/L
	ImOSRgWwlo8uDSBWvT/CRTxnx/zjMOj3d+vuVE/CEO2pwkVp06e6kjVBUqXBCPTyFpj68WprP0+
	JTNenzIW49AmAoSyK3dhm1ZYzjd3OFMjtGuFdv3deK7nzDBROYYFQjx7on4jeFSq7ygMbpAF3El
	4OUUWsXp5mxLN3o5f96F2TFZu43enrKvtT4ZoF3oWcJAmvakmqjRhnZ2hWZnQSjWtvI/1dCAkyL
	zKFNtCzmy4G+9Au2MgXVobi9WAYtKC62Odsu6pz8ZQy9MgND4uchXeSWIMsTdtmmh/Y=
X-Received: by 2002:a05:600c:190c:b0:439:42c6:f11f with SMTP id 5b1f17b1804b1-43942c6f5eemr83107085e9.4.1739284753682;
        Tue, 11 Feb 2025 06:39:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDvsaYgzTa5RWn9BkqT6d0zbIYe+dTe5ziVPY8IeCNWz/AYeRHaPoW5P6jv6YFeryIf9I1Lg==
X-Received: by 2002:a05:600c:190c:b0:439:42c6:f11f with SMTP id 5b1f17b1804b1-43942c6f5eemr83106725e9.4.1739284753304;
        Tue, 11 Feb 2025 06:39:13 -0800 (PST)
Received: from rh.fritz.box (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcc9bd251sm11745833f8f.9.2025.02.11.06.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:39:12 -0800 (PST)
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
Subject: [PATCH v2 1/4] KVM: arm64: Allow userspace to change MIDR_EL1
Date: Tue, 11 Feb 2025 15:39:07 +0100
Message-ID: <20250211143910.16775-2-sebott@redhat.com>
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

Enable VMMs to write MIDR_EL1 by treating it as a VM ID register.
Since MIDR_EL1 is not handled as a proper arm64_ftr_reg apply only
a sanity check against the writable mask to ensure the reserved
bits are 0.

Set up VPIDR_EL2 to hold the MIDR_EL1 value for the guest.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h |  3 ++
 arch/arm64/kvm/sys_regs.c         | 56 +++++++++++++++++++++++++++++--
 2 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7cfa024de4e3..3db8c773339e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -373,6 +373,7 @@ struct kvm_arch {
 #define KVM_ARM_ID_REG_NUM	(IDREG_IDX(sys_reg(3, 0, 0, 7, 7)) + 1)
 	u64 id_regs[KVM_ARM_ID_REG_NUM];
 
+	u64 midr_el1;
 	u64 ctr_el0;
 
 	/* Masks for VNCR-backed and general EL2 sysregs */
@@ -1469,6 +1470,8 @@ static inline u64 *__vm_id_reg(struct kvm_arch *ka, u32 reg)
 	switch (reg) {
 	case sys_reg(3, 0, 0, 1, 0) ... sys_reg(3, 0, 0, 7, 7):
 		return &ka->id_regs[IDREG_IDX(reg)];
+	case SYS_MIDR_EL1:
+		return &ka->midr_el1;
 	case SYS_CTR_EL0:
 		return &ka->ctr_el0;
 	default:
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82430c1e1dd0..7e1c9884f62a 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1666,7 +1666,7 @@ static bool is_feature_id_reg(u32 encoding)
  */
 static inline bool is_vm_ftr_id_reg(u32 id)
 {
-	if (id == SYS_CTR_EL0)
+	if (id == SYS_CTR_EL0 || id == SYS_MIDR_EL1)
 		return true;
 
 	return (sys_reg_Op0(id) == 3 && sys_reg_Op1(id) == 0 &&
@@ -1999,6 +1999,47 @@ static int get_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
 	return 0;
 }
 
+static int set_id_reg_non_ftr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
+			      u64 val)
+{
+	u32 id = reg_to_encoding(rd);
+	int ret;
+
+	mutex_lock(&vcpu->kvm->arch.config_lock);
+	/*
+	 * Once the VM has started the ID registers are immutable. Reject any
+	 * write that does not match the final register value.
+	 */
+	if (kvm_vm_has_ran_once(vcpu->kvm)) {
+		if (val != read_id_reg(vcpu, rd))
+			ret = -EBUSY;
+		else
+			ret = 0;
+
+		mutex_unlock(&vcpu->kvm->arch.config_lock);
+		return ret;
+	}
+
+	/*
+	 * For non ftr regs do a limited test against the writable mask only.
+	 */
+	if ((rd->val & val) != val) {
+		mutex_unlock(&vcpu->kvm->arch.config_lock);
+		return -EINVAL;
+	}
+
+	kvm_set_vm_id_reg(vcpu->kvm, id, val);
+	/*
+	 * Since guest access to MIDR_EL1 is not trapped
+	 * set up VPIDR_EL2 to hold the MIDR_EL1 value.
+	 */
+	if (id == SYS_MIDR_EL1)
+		write_sysreg(val, vpidr_el2);
+
+	mutex_unlock(&vcpu->kvm->arch.config_lock);
+	return 0;
+}
+
 static int set_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
 		      u64 val)
 {
@@ -2493,6 +2534,15 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+#define FUNCTION_RESET(reg)						\
+	static u64 reset_##reg(struct kvm_vcpu *v,			\
+			       const struct sys_reg_desc *r)		\
+	{								\
+		return read_sysreg(reg);				\
+	}
+
+FUNCTION_RESET(midr_el1)
+
 
 /*
  * Architected system registers.
@@ -2542,6 +2592,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 
 	{ SYS_DESC(SYS_DBGVCR32_EL2), undef_access, reset_val, DBGVCR32_EL2, 0 },
 
+	{ ID_DESC(MIDR_EL1), .set_user = set_id_reg_non_ftr, .visibility = id_visibility,
+	  .reset = reset_midr_el1, .val = GENMASK_ULL(31, 0) },
 	{ SYS_DESC(SYS_MPIDR_EL1), NULL, reset_mpidr, MPIDR_EL1 },
 
 	/*
@@ -4594,13 +4646,11 @@ id_to_sys_reg_desc(struct kvm_vcpu *vcpu, u64 id,
 		return ((struct sys_reg_desc *)r)->val;			\
 	}
 
-FUNCTION_INVARIANT(midr_el1)
 FUNCTION_INVARIANT(revidr_el1)
 FUNCTION_INVARIANT(aidr_el1)
 
 /* ->val is filled in by kvm_sys_reg_table_init() */
 static struct sys_reg_desc invariant_sys_regs[] __ro_after_init = {
-	{ SYS_DESC(SYS_MIDR_EL1), NULL, reset_midr_el1 },
 	{ SYS_DESC(SYS_REVIDR_EL1), NULL, reset_revidr_el1 },
 	{ SYS_DESC(SYS_AIDR_EL1), NULL, reset_aidr_el1 },
 };
-- 
2.42.0

