Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F072250BFD
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284763; cv=none; b=HWJ5b4y1wnP+NQD6d6k6s0Nm9g0WLtk26Am5HkWcGW/BPmcKxGNI6RD6TyRA1xDWbuPe+UcfR7KON2cgcGmoNom8T+AKxICbEZ929IZC/Q2NYer3iqDI58kwbNdJyb5PtgLhGY3qpmG9vGfhmZn4KJm6etQEK0P0I6CehK9Fpdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284763; c=relaxed/simple;
	bh=48SNocFIEyTD401Bn7uEPWmyPGgbFKE7acbIYbRpQLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pDygFe7ijzoji8sCM88HDl02R5KIe+8BXQD4lyu5vDcKdbE7ffmulYVfo+kSoR6GWqTBw1AFDBXnnl+/3Po3s9lh6R3ELnfTJBKpHVpe3gGHeknRXMr75zz+pj0B8DNOf1INz43noT+D7QPbmYcxJ8iBjXRxFxD83GvYS1qapTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FhvN2k3F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FhvN2k3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739284760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RdghYHu234rwHRoSlAkfrkrUKfnT4YJfki186RS5/GU=;
	b=FhvN2k3FWysvStIc1MPhRfVDOy4EFW8YAplupaesOQGmmuYN9Qtq64VAW2UMOlq4X30yY3
	AyFCHnTPobwdFGAWrEzOmJXx6WAae1fKKr+9CR6wEIedFyj78IXl5M7hBHbbFDtLKgpH1y
	ANQyHr7s7K+cEyuNAJiOKfmwgUbnmsc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-2sI33svoNdeFgZBCLNhC5w-1; Tue, 11 Feb 2025 09:39:19 -0500
X-MC-Unique: 2sI33svoNdeFgZBCLNhC5w-1
X-Mimecast-MFC-AGG-ID: 2sI33svoNdeFgZBCLNhC5w
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38dc6aad9f8so2232505f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:39:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284757; x=1739889557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdghYHu234rwHRoSlAkfrkrUKfnT4YJfki186RS5/GU=;
        b=ICpvBtPI7wjWJeInIhUFMWkubPYweN6WMSao9hdKqDDbGtEfKC1huQtIiCfI2NuaWU
         wd6adVvQPG+EAOmZCHvhBMcjFwtGf7JFcPKeLXf08g5HAKXR+fIGp1bKRyg8ROOasbQL
         b+LYSuGsJMhCXkoQyunHOzMnA4fDdbqhGaa6QpRtz1gfbLqmexxe6G0Ll921b7vdugls
         UkISCuXNkSos/n7HoOlhRpQKTZDGZYbFqcNHWfd4dwUm7LK6a0nsN6d5Yn40wfjFSF7R
         ZKpyz/Q0MQgwJIvYtRWPjNxBiOa6f2S3DgJwzkb3kSfH1NOAwscjZ37a40T49XML6wKd
         40YA==
X-Forwarded-Encrypted: i=1; AJvYcCW895tbQRtbJK5SJyXe3wnKkjb3cadtV7H/D/FZOvvHOubYWE5uUB9nrpwZdrMCa5AWw4dUHhqQf0EHdBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOIta44u6PY6KV8wos4ozdElrxy52TpSyc2XvLwJULCVllcPkB
	Gi9VcdsVfwtBZyuXVtstK6ZnoRIQeIxKepdiUvSl4cCUBHrC6dJI8z6ECNPLrjHokoAF58RrNKw
	g4LlEm/BLGncZk+TVfIPILwNuJGd9OBiuXqLovALV9DyavfJApwP9JhneA4F2jQ==
X-Gm-Gg: ASbGnctI8n7CxMznpcUmgsfqKnRyRkfEq9CaiFojUR8MrxKdAWa4FdcmyTRf2q/q25D
	reHnNgUy1q0qLw0wyTyWZq6kxjY2wnEbkIp33/IEBDqkBdZASAy7Z7//peyo9otmVyeamHLEyT+
	VcYkIZSO73InkR9S/RB2edOtgHiB3hZYIskKicoDt7CUsTe7GtpeyMoHLizEfuegEv9yZ38b0++
	7kSRbYZMQbr5XkTUpEuvUtC/D34HI3PY0v7XdVCffLo1eqZiWQ9PTk9Bz66QCStyjCTS49C3r9y
	b+IS2HQzTAK6vfhSdA25+GqlY92k9619NAIEmyorYqWPih5zjg4OEB+uQiUBYMXSY9o=
X-Received: by 2002:a5d:648b:0:b0:38d:e259:4d10 with SMTP id ffacd0b85a97d-38de43aa5cfmr3602449f8f.13.1739284757118;
        Tue, 11 Feb 2025 06:39:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRoa6TpHpYjazCGXAA0zdDPm62ZyWpFuSI/jEW82VolHbg/Poh9pR7FaZIHb0wfaUNxzC+rg==
X-Received: by 2002:a5d:648b:0:b0:38d:e259:4d10 with SMTP id ffacd0b85a97d-38de43aa5cfmr3602425f8f.13.1739284756792;
        Tue, 11 Feb 2025 06:39:16 -0800 (PST)
Received: from rh.fritz.box (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcc9bd251sm11745833f8f.9.2025.02.11.06.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:39:16 -0800 (PST)
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
Subject: [PATCH v2 4/4] KVM: selftests: arm64: Test writes to MIDR,REVIDR,AIDR
Date: Tue, 11 Feb 2025 15:39:10 +0100
Message-ID: <20250211143910.16775-5-sebott@redhat.com>
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

Assert that MIDR_EL1, REVIDR_EL1, AIDR_EL1 are writable from userspace,
that the changed values are visible to guests, and that they are
preserved across a vCPU reset.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 .../testing/selftests/kvm/arm64/set_id_regs.c | 32 +++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 217541fe6536..d719c2ab1e31 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -230,6 +230,9 @@ static void guest_code(void)
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR2_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64ZFR0_EL1);
 	GUEST_REG_SYNC(SYS_CTR_EL0);
+	GUEST_REG_SYNC(SYS_MIDR_EL1);
+	GUEST_REG_SYNC(SYS_REVIDR_EL1);
+	GUEST_REG_SYNC(SYS_AIDR_EL1);
 
 	GUEST_DONE();
 }
@@ -609,18 +612,31 @@ static void test_ctr(struct kvm_vcpu *vcpu)
 	test_reg_vals[encoding_to_range_idx(SYS_CTR_EL0)] = ctr;
 }
 
-static void test_vcpu_ftr_id_regs(struct kvm_vcpu *vcpu)
+static void test_id_reg(struct kvm_vcpu *vcpu, u32 id)
 {
 	u64 val;
 
+	val = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(id));
+	val++;
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(id), val);
+	test_reg_vals[encoding_to_range_idx(id)] = val;
+}
+
+static void test_vcpu_ftr_id_regs(struct kvm_vcpu *vcpu)
+{
 	test_clidr(vcpu);
 	test_ctr(vcpu);
 
-	val = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MPIDR_EL1));
-	val++;
-	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MPIDR_EL1), val);
+	test_id_reg(vcpu, SYS_MPIDR_EL1);
+	ksft_test_result_pass("%s\n", __func__);
+}
+
+static void test_vcpu_non_ftr_id_regs(struct kvm_vcpu *vcpu)
+{
+	test_id_reg(vcpu, SYS_MIDR_EL1);
+	test_id_reg(vcpu, SYS_REVIDR_EL1);
+	test_id_reg(vcpu, SYS_AIDR_EL1);
 
-	test_reg_vals[encoding_to_range_idx(SYS_MPIDR_EL1)] = val;
 	ksft_test_result_pass("%s\n", __func__);
 }
 
@@ -647,6 +663,9 @@ static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
 	test_assert_id_reg_unchanged(vcpu, SYS_MPIDR_EL1);
 	test_assert_id_reg_unchanged(vcpu, SYS_CLIDR_EL1);
 	test_assert_id_reg_unchanged(vcpu, SYS_CTR_EL0);
+	test_assert_id_reg_unchanged(vcpu, SYS_MIDR_EL1);
+	test_assert_id_reg_unchanged(vcpu, SYS_REVIDR_EL1);
+	test_assert_id_reg_unchanged(vcpu, SYS_AIDR_EL1);
 
 	ksft_test_result_pass("%s\n", __func__);
 }
@@ -675,13 +694,14 @@ int main(void)
 		   ARRAY_SIZE(ftr_id_aa64isar2_el1) + ARRAY_SIZE(ftr_id_aa64pfr0_el1) +
 		   ARRAY_SIZE(ftr_id_aa64pfr1_el1) + ARRAY_SIZE(ftr_id_aa64mmfr0_el1) +
 		   ARRAY_SIZE(ftr_id_aa64mmfr1_el1) + ARRAY_SIZE(ftr_id_aa64mmfr2_el1) +
-		   ARRAY_SIZE(ftr_id_aa64zfr0_el1) - ARRAY_SIZE(test_regs) + 2 +
+		   ARRAY_SIZE(ftr_id_aa64zfr0_el1) - ARRAY_SIZE(test_regs) + 3 +
 		   MPAM_IDREG_TEST;
 
 	ksft_set_plan(test_cnt);
 
 	test_vm_ftr_id_regs(vcpu, aarch64_only);
 	test_vcpu_ftr_id_regs(vcpu);
+	test_vcpu_non_ftr_id_regs(vcpu);
 	test_user_set_mpam_reg(vcpu);
 
 	test_guest_reg_read(vcpu);
-- 
2.42.0

