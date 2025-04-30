Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20131217659
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001000; cv=none; b=UU+sv8BHP2DdmdanEBT5jdEvhpdPO6BjHqFiXGu+RPRSKqYgMTPZyYDIQPBGoN9PgDdx/Uur+E7gkd826PylXfPFR0HrCZcKt5IiBjhTr24LYldK0n+ls1qo1SXoJuwdGkWDgGeTA7Tsgs4WWmVEwj/pOZ0jr9jJq1pluFOS4c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001000; c=relaxed/simple;
	bh=dYCiT8CTv/AzRIm66eawG5+b26B3uaqZ6Ec5RKcvcRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lb6rAANXTAksFGAq/ScCFMLe6TOgAA6SXm0dhzIbqeXDjcM9dWKFzXa5b0/uv6t1ZBgl6h55mz3n8RVcOJfa7i/qKo9xJajmDgOKtM0zCdIym5O0pTNCOy6xRilWWjJ7RppSdHxqpnW1Yv64y/tYh9W3OUqRZlc9U9ZZJeX4kX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rg/S3JUZ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rg/S3JUZ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7399838db7fso784279b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746000997; x=1746605797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lDEdTGA2Q78UeMoqaqSTZbOw+0Pt/xUh3MJ2TLU8dM=;
        b=rg/S3JUZUy5fAHM2se7OPmjK/VtJJr/QnDnNIPz6roXFuu4SnAwBSiPDstB8OHRjQp
         v8vfNqGihvv/wTno649Ovl1AKrgzy6ZV6qUqxqhi8crb9O3QNsGmqjPHrwVbOc9Krnw7
         OdzLe5fLYaK2PcmV0Po9yA3ckURWqr9PvdDeUXeNyfWqmbtxpBKlaH6SuMSpsCkNK9K4
         cMcUTAuOHXw9CBkW2zbzM3cwSC1FFD9XMYEFjDx3u6B+GURPh1lJ2MD/jWtVsXiYE7Eq
         R8TU73++V7HwpYQ7OnPovQAK50gGbbu36z2hdYu8CkqWPoqR2ZBbT99S6krUSXJLpXM3
         3xDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000997; x=1746605797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lDEdTGA2Q78UeMoqaqSTZbOw+0Pt/xUh3MJ2TLU8dM=;
        b=psEYHVaHTJbkK7Z3inZwT6hf71Bk8+ZcO2aXlexUrOrUezamXX6NV6Voo5n9g/yisg
         IkYVlSSWFFgV5LEgfdD9cwUgO9HE0bbzZDYoB1yrJ9grV6g0U2vHA5XYasjNMG7ljiCf
         Dn8Xr7qY3ZM5oM9dAePLKFpTP0KXfIjzhFGwNlru5Ti9Ir75NBG1bb0rtT408g1jGWlq
         PuWcwDXgXltH1hsCOYIPj3gvJPc75qQxUPiaOtbd0N738FEVhUvk+UOUfH3Ef/YWPe1t
         4iB5HfL/mttfoZgdtlHpro9KKox8senh8cIq6wUm7InkzkGyCrXkw4hICIAK7hXZAZTn
         51Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUkSPBv6I3or0Y3iMqqvcAM2M2Bxeiit4cTWKhd1/aQlRQ5ct1l+FG7+3pi7jI6MCGp6tRJvbKc8eoZCOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXGEaCVw37hagvj2oGLGf2Td4vepEM/ThS5CQM1Z8wQPfTpVa5
	1SGaZkKtdKSCO6juW6KewhB0tUQrxIFJ60sJzegQnH+mFYbH7j428OpPunFInkc=
X-Gm-Gg: ASbGncts3H8AMOwdepa6WyBjc2Ej+BEsQv0AKiaIWG1gjYWykzjLfMfk1SO+xZfYCRy
	uP6uhM4tDlQEnOtQt4iqbHRLam2nHCtlUm7IBerbmXdtvekW97M2cGkJdRfsnr+Q2QjkWYyT+FI
	lru9mpIzK6qmSVDEIpqaVK8RtaFPny7o5Myn1YcvTRCr1cMold7SXxeWJ8wqmYKT0SeSADcLxUR
	OyoHdwY7aCaXv7hNVwaCkB9WXW781+ygVk6hSoE61o6mGb9MJs9y03/Xr8KBR/3ciKIcL87gCY8
	EPz6UWB4tieqNCpK9L+KufA92tzOkMxeAdXeLWiXyFT7WOeof5aqfw==
X-Google-Smtp-Source: AGHT+IEkdjlV5neYVI9bDJYCdGVzb/65Kw95vZlp55rVec7TfydZ/oH6ud1+HkgcavU0L1iHFVRsZg==
X-Received: by 2002:a05:6a00:641a:b0:736:b923:5323 with SMTP id d2e1a72fcca58-74039bc39bcmr2341553b3a.10.1746000997307;
        Wed, 30 Apr 2025 01:16:37 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a309edsm1073084b3a.91.2025.04.30.01.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:16:37 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 30 Apr 2025 01:16:30 -0700
Subject: [PATCH v3 3/3] KVM: riscv: selftests: Add vector extension tests
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-kvm_selftest_improve-v3-3-eea270ff080b@rivosinc.com>
References: <20250430-kvm_selftest_improve-v3-0-eea270ff080b@rivosinc.com>
In-Reply-To: <20250430-kvm_selftest_improve-v3-0-eea270ff080b@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

Add vector related tests with the ISA extension standard template.
However, the vector registers are bit tricky as the register length is
variable based on vlenb value of the system. That's why the macros are
defined with a default and overidden with actual value at runtime.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 132 +++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 569f2d67c9b8..a0b7dabb5040 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -17,6 +17,15 @@ enum {
 	VCPU_FEATURE_SBI_EXT,
 };
 
+enum {
+	KVM_RISC_V_REG_OFFSET_VSTART = 0,
+	KVM_RISC_V_REG_OFFSET_VL,
+	KVM_RISC_V_REG_OFFSET_VTYPE,
+	KVM_RISC_V_REG_OFFSET_VCSR,
+	KVM_RISC_V_REG_OFFSET_VLENB,
+	KVM_RISC_V_REG_OFFSET_MAX,
+};
+
 static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
 
 bool filter_reg(__u64 reg)
@@ -143,6 +152,38 @@ bool check_reject_set(int err)
 	return err == EINVAL;
 }
 
+static int override_vector_reg_size(struct kvm_vcpu *vcpu, struct vcpu_reg_sublist *s,
+				    uint64_t feature)
+{
+	unsigned long vlenb_reg = 0;
+	int rc;
+	u64 reg, size;
+
+	/* Enable V extension so that we can get the vlenb register */
+	rc = __vcpu_set_reg(vcpu, feature, 1);
+	if (rc)
+		return rc;
+
+	vlenb_reg = vcpu_get_reg(vcpu, s->regs[KVM_RISC_V_REG_OFFSET_VLENB]);
+	if (!vlenb_reg) {
+		TEST_FAIL("Can't compute vector register size from zero vlenb\n");
+		return -EPERM;
+	}
+
+	size = __builtin_ctzl(vlenb_reg);
+	size <<= KVM_REG_SIZE_SHIFT;
+
+	for (int i = 0; i < 32; i++) {
+		reg = KVM_REG_RISCV | KVM_REG_RISCV_VECTOR | size | KVM_REG_RISCV_VECTOR_REG(i);
+		s->regs[KVM_RISC_V_REG_OFFSET_MAX + i] = reg;
+	}
+
+	/* We should assert if disabling failed here while enabling succeeded before */
+	vcpu_set_reg(vcpu, feature, 0);
+
+	return 0;
+}
+
 void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 {
 	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
@@ -172,6 +213,13 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 		if (!s->feature)
 			continue;
 
+		if (s->feature == KVM_RISCV_ISA_EXT_V) {
+			feature = RISCV_ISA_EXT_REG(s->feature);
+			rc = override_vector_reg_size(vcpu, s, feature);
+			if (rc)
+				goto skip;
+		}
+
 		switch (s->feature_type) {
 		case VCPU_FEATURE_ISA_EXT:
 			feature = RISCV_ISA_EXT_REG(s->feature);
@@ -186,6 +234,7 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 		/* Try to enable the desired extension */
 		__vcpu_set_reg(vcpu, feature, 1);
 
+skip:
 		/* Double check whether the desired extension was enabled */
 		__TEST_REQUIRE(__vcpu_has_ext(vcpu, feature),
 			       "%s not available, skipping tests", s->name);
@@ -410,6 +459,35 @@ static const char *fp_d_id_to_str(const char *prefix, __u64 id)
 	return strdup_printf("%lld /* UNKNOWN */", reg_off);
 }
 
+static const char *vector_id_to_str(const char *prefix, __u64 id)
+{
+	/* reg_off is the offset into struct __riscv_v_ext_state */
+	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_VECTOR);
+	int reg_index = 0;
+
+	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_VECTOR);
+
+	if (reg_off >= KVM_REG_RISCV_VECTOR_REG(0))
+		reg_index = reg_off -  KVM_REG_RISCV_VECTOR_REG(0);
+	switch (reg_off) {
+	case KVM_REG_RISCV_VECTOR_REG(0) ...
+	     KVM_REG_RISCV_VECTOR_REG(31):
+		return strdup_printf("KVM_REG_RISCV_VECTOR_REG(%d)", reg_index);
+	case KVM_REG_RISCV_VECTOR_CSR_REG(vstart):
+		return "KVM_REG_RISCV_VECTOR_CSR_REG(vstart)";
+	case KVM_REG_RISCV_VECTOR_CSR_REG(vl):
+		return "KVM_REG_RISCV_VECTOR_CSR_REG(vl)";
+	case KVM_REG_RISCV_VECTOR_CSR_REG(vtype):
+		return "KVM_REG_RISCV_VECTOR_CSR_REG(vtype)";
+	case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
+		return "KVM_REG_RISCV_VECTOR_CSR_REG(vcsr)";
+	case KVM_REG_RISCV_VECTOR_CSR_REG(vlenb):
+		return "KVM_REG_RISCV_VECTOR_CSR_REG(vlenb)";
+	}
+
+	return strdup_printf("%lld /* UNKNOWN */", reg_off);
+}
+
 #define KVM_ISA_EXT_ARR(ext)		\
 [KVM_RISCV_ISA_EXT_##ext] = "KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_" #ext
 
@@ -639,6 +717,9 @@ void print_reg(const char *prefix, __u64 id)
 	case KVM_REG_SIZE_U128:
 		reg_size = "KVM_REG_SIZE_U128";
 		break;
+	case KVM_REG_SIZE_U256:
+		reg_size = "KVM_REG_SIZE_U256";
+		break;
 	default:
 		printf("\tKVM_REG_RISCV | (%lld << KVM_REG_SIZE_SHIFT) | 0x%llx /* UNKNOWN */,\n",
 		       (id & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT, id & ~REG_MASK);
@@ -670,6 +751,10 @@ void print_reg(const char *prefix, __u64 id)
 		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_FP_D | %s,\n",
 				reg_size, fp_d_id_to_str(prefix, id));
 		break;
+	case KVM_REG_RISCV_VECTOR:
+		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_VECTOR | %s,\n",
+		       reg_size, vector_id_to_str(prefix, id));
+		break;
 	case KVM_REG_RISCV_ISA_EXT:
 		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_ISA_EXT | %s,\n",
 				reg_size, isa_ext_id_to_str(prefix, id));
@@ -874,6 +959,48 @@ static __u64 fp_d_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_D,
 };
 
+/* Define a default vector registers with length. This will be overwritten at runtime */
+static __u64 vector_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_CSR_REG(vstart),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_CSR_REG(vl),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_CSR_REG(vtype),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_CSR_REG(vcsr),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_CSR_REG(vlenb),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(0),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(1),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(2),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(3),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(4),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(5),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(6),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(7),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(8),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(9),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(10),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(11),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(12),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(13),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(14),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(15),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(16),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(17),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(18),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(19),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(20),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(21),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(22),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(23),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(24),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(25),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(26),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(27),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(28),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(29),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(30),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(31),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_V,
+};
+
 #define SUBLIST_BASE \
 	{"base", .regs = base_regs, .regs_n = ARRAY_SIZE(base_regs), \
 	 .skips_set = base_skips_set, .skips_set_n = ARRAY_SIZE(base_skips_set),}
@@ -898,6 +1025,9 @@ static __u64 fp_d_regs[] = {
 	{"fp_d", .feature = KVM_RISCV_ISA_EXT_D, .regs = fp_d_regs, \
 		.regs_n = ARRAY_SIZE(fp_d_regs),}
 
+#define SUBLIST_V \
+	{"v", .feature = KVM_RISCV_ISA_EXT_V, .regs = vector_regs, .regs_n = ARRAY_SIZE(vector_regs),}
+
 #define KVM_ISA_EXT_SIMPLE_CONFIG(ext, extu)			\
 static __u64 regs_##ext[] = {					\
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG |			\
@@ -966,6 +1096,7 @@ KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
 KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
+KVM_ISA_EXT_SUBLIST_CONFIG(v, V);
 KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
 KVM_ISA_EXT_SIMPLE_CONFIG(smnpm, SMNPM);
 KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
@@ -1040,6 +1171,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_fp_f,
 	&config_fp_d,
 	&config_h,
+	&config_v,
 	&config_smnpm,
 	&config_smstateen,
 	&config_sscofpmf,

-- 
2.43.0

