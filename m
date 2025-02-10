Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAB71E32A2
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202602; cv=none; b=OWNrVUJUi0nA0Hk0vjwvkp139zfMGdJDtJ7JOvnKCBevn7RIcaEg8EwD+E4NRXz4oUditqtjX1Bu5kKu8dnFge/u81EoQxL293p0nrNfZm3JhlOniJP5PxNHgUbktTTrHaBWOFpZIhSkZ3udj3aSp9d+rhpO8Yj1UTV849/NWTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202602; c=relaxed/simple;
	bh=bZRkKNBufB7CB97QTFz3czCZY0uD4SYI+5r+AYUMhTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRXpJkjfLJng9yqzzKpgsWeiTgnlN6cDydWwrSXFvWQFh9QHrgtONMIw9cw4NdW8xF7lnygNkkNT6NmIjDHkApKd9LFk7sdqmMh4K3Bh7YGtMrwsC7QWifW/5HAnYVodzmuskFM3ffxVexDQe4KGnSDT8L8VlGXmWM0W7CK15cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gx3npQis; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gx3npQis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739202599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWBLvh1vOG9Vtk8E5TaMoqin30xQfKHJVa4bPl7KdC4=;
	b=gx3npQisZFd1cmF/2WT0d87iUr0wBzjIDQQoFAEpz032342EqStZRrm7ohdxCFbhlJpOBz
	Jy387tsLWP9PK5PaYv5HqEtvqwaPoHYMemZX7PWJymh4eI2reUypGt3Z5w1ZgTz8lFWKTe
	Owr03vi9UK62i0Z1NsB5DtQEmQUSI6c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-IcQVCcbZPiCMYsGiAQ3-bg-1; Mon, 10 Feb 2025 10:49:57 -0500
X-MC-Unique: IcQVCcbZPiCMYsGiAQ3-bg-1
X-Mimecast-MFC-AGG-ID: IcQVCcbZPiCMYsGiAQ3-bg
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38dd533dad0so1262637f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:49:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202597; x=1739807397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWBLvh1vOG9Vtk8E5TaMoqin30xQfKHJVa4bPl7KdC4=;
        b=W2+f/PT6VRdwWDdK/MxwbFe1vlqW2Z5wlQ+BLNmh/cOl7OwRBiZ4ZYJesOTfQ63Kge
         PidkuHdLL6fJ/0+MTuaApeAIaljLpTeUH3/Y7XhPTVCZgy1wJwt5qCzvboKMN3dWOKVE
         NX1iJ/WlIc/IxuysdVKsINzVzwjs8lbH/BfDHw2AA/6FPXAK344quyqfwwDJmU7KBVha
         2K6Iuc4V6eSrQa8AJW4LUm6pGmRDrgBRR+vMXp7xuOpMbPPIIi8LzDYyw0o6KrP8WlfV
         S7sNWm1JOjMQYxN7oNZMiqp1CP1QpScVImfrFmYvv82x3vCJfksgUyim/w675b9DId/n
         geTg==
X-Forwarded-Encrypted: i=1; AJvYcCWUf7mR5Sit00eSCziqPYELT75QwJ4j0VI+tYHUl62WZFIcFUrxSGFsJzI1g2mpVME7LUMl0gtZWTk3X+A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6n3BZAs3mGATb7j94QzbXYxLVHox9l1YgdloHPe1ZuXNivDmB
	zdIkcnl3TBLI5v54S30500V9DrRIR39+NYYtsMQ9a1Z3mk94p0xuLdTtS53LDybJA6beHxegwND
	aIgLEvAvXNKz4hHuKiE8dm10IOpF8U6DxgWBQRkW+0TgyHhOKGfSglBOsSXlA1A==
X-Gm-Gg: ASbGncsyEg+3ua4lDsFzrSypJyqIAFAi96imGVP0kIxjfed+hdNQj75T6CKGs2yryAJ
	u4hTBraPzNo8QdR/Uj0x5XSczVEkEFRkBNDqDjwsYkpmmwn9LBdleV5L/pKjjuMCmp6W4vfHOAe
	2YsVjzMbS84rWrEv3bdgjGe2cDA2iQ0S7F9Nr0LfU6jXd7I1MQH2QVRB6/UQp8J0gfDoDP+7wdU
	9nXruL80MxYI5KYaMITvvcEKI9zOWV/tXRDxdVYrey2Dzt0Pe0usSq8lw7CQjSMUsQGXVgko7o5
	CluLGQQ3rMLZu6pJkx0CGFDiLjgDXms/D4vipzt6wmcjNm1TQMOet0CQ5yeXq2yb+a0=
X-Received: by 2002:a05:6000:85:b0:38a:2b34:e13e with SMTP id ffacd0b85a97d-38dc8ddefdbmr7961779f8f.18.1739202596609;
        Mon, 10 Feb 2025 07:49:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErZeSIDhxVmXxw+MQqPx65Y2wGmkBfy9SY3c8qH880FDgrCYi3TbT7Nr9ofzZrqiORl2xfyQ==
X-Received: by 2002:a05:6000:85:b0:38a:2b34:e13e with SMTP id ffacd0b85a97d-38dc8ddefdbmr7961764f8f.18.1739202596251;
        Mon, 10 Feb 2025 07:49:56 -0800 (PST)
Received: from rh.fritz.box (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da96502sm153559395e9.1.2025.02.10.07.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:49:55 -0800 (PST)
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
Subject: [PATCH 1/4] KVM: arm64: Allow userspace to change MIDR_EL1
Date: Mon, 10 Feb 2025 16:49:50 +0100
Message-ID: <20250210154953.27002-2-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210154953.27002-1-sebott@redhat.com>
References: <20250210154953.27002-1-sebott@redhat.com>
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

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h |  3 +++
 arch/arm64/kvm/sys_regs.c         | 37 +++++++++++++++++++++++++++----
 2 files changed, 36 insertions(+), 4 deletions(-)

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
index 82430c1e1dd0..cc94bed7299d 100644
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
@@ -1999,6 +1999,22 @@ static int get_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
 	return 0;
 }
 
+static bool skip_feature_check(u32 reg)
+{
+	return (reg == SYS_MIDR_EL1);
+}
+
+/*
+ * For non ftr regs do a limited test against the writable mask only.
+ */
+static int arm64_check_mask(const struct sys_reg_desc *rd, u64 val)
+{
+	if ((rd->val & val) != val)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int set_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
 		      u64 val)
 {
@@ -2021,7 +2037,11 @@ static int set_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
 		return ret;
 	}
 
-	ret = arm64_check_features(vcpu, rd, val);
+	if (skip_feature_check(id))
+		ret = arm64_check_mask(rd, val);
+	else
+		ret = arm64_check_features(vcpu, rd, val);
+
 	if (!ret)
 		kvm_set_vm_id_reg(vcpu->kvm, id, val);
 
@@ -2493,6 +2513,15 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
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
@@ -2542,6 +2571,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 
 	{ SYS_DESC(SYS_DBGVCR32_EL2), undef_access, reset_val, DBGVCR32_EL2, 0 },
 
+	{ ID_DESC(MIDR_EL1), .set_user = set_id_reg, .visibility = id_visibility,
+	  .reset = reset_midr_el1, .val = (u32)-1 },
 	{ SYS_DESC(SYS_MPIDR_EL1), NULL, reset_mpidr, MPIDR_EL1 },
 
 	/*
@@ -4594,13 +4625,11 @@ id_to_sys_reg_desc(struct kvm_vcpu *vcpu, u64 id,
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

