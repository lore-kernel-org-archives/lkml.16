Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13F9293756
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250532; cv=none; b=fuE2a9P5A4LR1z+RlbGpy8cFydVGjgO0SGuaTogIErcgBqJCS6TTkYaBG3be29cKLu0AflfGFK8Lv6Ybhb/PYxVruVvvycuXEnhZSMQotfSNQDHbBj6U5welHpIis4KFfjntJxw/SJUV3Hp5DvpbHtC2iso4tAR4Bzr2KbD9Leg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250532; c=relaxed/simple;
	bh=YOzE7iJKn1cKrVnHeYmsANZJwRedYEE2+tWwGO6R4Sg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u25OI+y5QmPaxQryLt8IUt/8GoVbGFhE/rOdkhM6BAwHoG01kPEWIWQWrT78qvlLOM8yNpz7C1ian10rvgTKJ0UuHFRowQyrgtg88rxjX9kC2668lNVNOGoXrNqDQtt7zkx7mooodT8U2WMIyuXft7UHVV15AvZktU+a8hDq1m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rananta.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dikJrf5+; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rananta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dikJrf5+"
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-85e4f920dacso10174539f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747250530; x=1747855330; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s3CSQ6PBMOqGVYj+xqhMBfKnGOIDEpoWfmf6grdNY9M=;
        b=dikJrf5+joAOhXTosvS3NsOY/z+tSo4by/LgKMISPQSvAo/98Nx319OVZk9YWOXqy7
         wSqYeMbL9ytLGGTmyII2Dqqkuf4UQMt81cL3JO+yVo01vKEnVends0qUNGGNGtqgIwwO
         0bFEuOrPTdful96Gu/WK2Mw+TZwUyo61WvWztJKWM1O2GkgUPtbVNUMSvW3Ki5BProV+
         XpNb3K3PEAa0HHzQAymIKnmGTuaJkfClcl+dIO7LdndigYoH4p+fAp8Tf44GLRkFNGyJ
         PK1Uq60hfI8uHPjfBZj+FP8CgbIuApC8lDNYPOA6THNw6Cb60XGqpAjeEtgBa0bgu87q
         J+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250530; x=1747855330;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s3CSQ6PBMOqGVYj+xqhMBfKnGOIDEpoWfmf6grdNY9M=;
        b=stgTfoC7zNkgn8+8wpvstsAK8Cm4nB0+L3UqdsarQKIwd8vPXulPMyzg+Yw+GZyAIu
         zFUPUliM5Mw6Tx8ylYCnD8UAaEgjz4w/YQ1T7ZwvJlStIBSVkWddDmAt8xHdwlHyOBZi
         hRxELh8SnUBeV5GrWgXfY2DFWeck8WzbaJ1yS4uD+KxFAiC5NYQZqHSG/+jnbw491AcU
         5cBx3eC1gCReuotvQ7xjw8J56U5NHBBXJceH0zVy+AaFku3fTJmEr61xAqeH4aRykjX1
         38jHc/XxtHFwksf/2J7d1FK3tml3hfMcMvk4Jy0w7mW3W8xRX4W5eKHhdy2H3robYEzI
         MVkw==
X-Forwarded-Encrypted: i=1; AJvYcCXHGy1BNmjGzSFioYjn/XcfBQRh6f2sXCmVtWAra5oUAibMmsnV52oFle9zeS5O0VDOo/++qR7nYrNBUgo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf30x/AhowGKAovpffpLdH80l6zhqDWY41o/A5k1/I7g3ZmE8R
	uwycqSDYiwrlA0XZhsiQLxDGqhq+4OVEwjNVN5iJf4/dtiulSDkylghAII5Jn+iVKNOnXvziZNZ
	HwXHzrg==
X-Google-Smtp-Source: AGHT+IGg18AnCuBF63uwtJjiLbr7/IX5pN6tnMFQzW8sojexBjp+3ynRNR8yhYl88WVyZs8zmM6M9UEXqLY6
X-Received: from ilbby14.prod.google.com ([2002:a05:6e02:260e:b0:3d8:1a1e:8c05])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:36c8:b0:85b:3791:b2ed
 with SMTP id ca18e2360f4ac-86a08ded21cmr611062639f.8.1747250528149; Wed, 14
 May 2025 12:22:08 -0700 (PDT)
Date: Wed, 14 May 2025 19:21:59 +0000
In-Reply-To: <20250514192159.1751538-1-rananta@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514192159.1751538-1-rananta@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514192159.1751538-4-rananta@google.com>
Subject: [PATCH 3/3] KVM: selftests: Extend vgic_init to test GICv4 config attr
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Extend the arm64 vgic_init test to check KVM_DEV_ARM_VGIC_CONFIG_GICV4
attribute. This includes testing the interface with various
configurations when KVM has vGICv4 enabled (kvm-arm.vgic_v4_enable=1
cmdline) and disabled.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 tools/testing/selftests/kvm/arm64/vgic_init.c | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_init.c b/tools/testing/selftests/kvm/arm64/vgic_init.c
index b3b5fb0ff0a9..adcfaf461b2b 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_init.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_init.c
@@ -675,6 +675,63 @@ static void test_v3_its_region(void)
 	vm_gic_destroy(&v);
 }
 
+static void test_v3_vgicv4_config(void)
+{
+	struct kvm_vcpu *vcpus[NR_VCPUS];
+	uint8_t gicv4_config;
+	struct vm_gic v;
+	int ret;
+
+	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS, vcpus);
+	if (__kvm_has_device_attr(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+					KVM_DEV_ARM_VGIC_CONFIG_GICV4))
+		return;
+
+	kvm_device_attr_get(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+				KVM_DEV_ARM_VGIC_CONFIG_GICV4, &gicv4_config);
+
+	if (gicv4_config == KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE) {
+		gicv4_config = KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE;
+		ret = __kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+				KVM_DEV_ARM_VGIC_CONFIG_GICV4, &gicv4_config);
+		TEST_ASSERT(ret && errno == ENXIO,
+			"vGICv4 allowed to be disabled even though it's unavailable");
+
+		gicv4_config = KVM_DEV_ARM_VGIC_CONFIG_GICV4_ENABLE;
+		ret = __kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+				KVM_DEV_ARM_VGIC_CONFIG_GICV4, &gicv4_config);
+		TEST_ASSERT(ret && errno == ENXIO,
+			"vGICv4 allowed to be enabled even though it's unavailable");
+	} else { /* kvm-arm.vgic_v4_enable=1 */
+		TEST_ASSERT(gicv4_config == KVM_DEV_ARM_VGIC_CONFIG_GICV4_ENABLE,
+				"Expected vGICv4 to be enabled by default");
+
+		gicv4_config = KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE;
+		kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+				KVM_DEV_ARM_VGIC_CONFIG_GICV4, &gicv4_config);
+
+		gicv4_config = KVM_DEV_ARM_VGIC_CONFIG_GICV4_ENABLE;
+		kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+				KVM_DEV_ARM_VGIC_CONFIG_GICV4, &gicv4_config);
+
+		gicv4_config = KVM_DEV_ARM_VGIC_CONFIG_GICV4_ENABLE + 1;
+		ret = __kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+			KVM_DEV_ARM_VGIC_CONFIG_GICV4, &gicv4_config);
+		TEST_ASSERT(ret && errno == EINVAL,
+			"vGICv4 allowed to be configured with unknown value");
+
+		kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+					KVM_DEV_ARM_VGIC_CTRL_INIT, NULL);
+		gicv4_config = KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE;
+		ret = __kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+			KVM_DEV_ARM_VGIC_CONFIG_GICV4, &gicv4_config);
+		TEST_ASSERT(ret && errno == EBUSY,
+			"Changing vGICv4 config allowed after vGIC initialization");
+	}
+
+	vm_gic_destroy(&v);
+}
+
 /*
  * Returns 0 if it's possible to create GIC device of a given type (V2 or V3).
  */
@@ -730,6 +787,7 @@ void run_tests(uint32_t gic_dev_type)
 		test_v3_last_bit_single_rdist();
 		test_v3_redist_ipa_range_check_at_vcpu_run();
 		test_v3_its_region();
+		test_v3_vgicv4_config();
 	}
 }
 
-- 
2.49.0.1101.gccaa498523-goog

