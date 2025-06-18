Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776C12DE1FE
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246557; cv=none; b=OxIWpuLDG5viS8OICR1UQQFRgpXqRJ4Z+O0fRy/3yk6H1vqEZLuaU46EoS83MfV80LOz+SvWGIaoH3fdqF/GalyQxL8PRLe8juIg62dP91Wq1uTDb2wRe5JLR5X3MrLWviFHLfoYI/VgoHl6ZIULEYwcf8PU+hcey16dqZbdtFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246557; c=relaxed/simple;
	bh=S4GPuCe590xZl2EuRNnIMDQ2EGVo96MnzdBawsw3VME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oy2UgsxVZL3DIUADru6QuK2sV4bB+CaJrr+wys65VwLfiyfEb5XXYQW6JMKieQlftYE5GzifM2O89ahHRhUSfFvuF8TjwV4ZmngZ7zIgeaCr1lrbguVLx51xrzIMXfJ+YrxJfI0auE2xsThL6ZoR1Q5bXm62i0J4w/vST6xpqyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=bBytFe2Q; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="bBytFe2Q"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23633a6ac50so98644025ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246555; x=1750851355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKQfZHKenjLPRqEIi0Ln2Cx1EmVsnnUE8sKaMZB78eg=;
        b=bBytFe2QjfFEFI4RZpfNa1cQd2QllB2l8bXWjggpC7IFo69TPBg+RGNwzRHQ2bG8r+
         2DJPj21rpI0D74uaHqWG1oNTsg33x5XV0WutyNnLmm6Q33eiiQQohAi2iM8FlTHAoJS4
         REW3sn4Bx7jb+37sZlGZJ605wxAYzbPOvwJKrMAHkAzURlZYxsR0poB86d/wScPgBy+u
         ILqJo70Mhohjiw0wJVNcUHH84k0Rn8vRSpGRKjiC28d8Pd/3E4Jo6CGI6qTH8I6hgDc9
         gchsyh6GizHIEYuiEfUZP/tWZCE/tuR74A41aRAhiRevoVVMas5FuQtpdgFRNzb9ABPq
         nXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246555; x=1750851355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKQfZHKenjLPRqEIi0Ln2Cx1EmVsnnUE8sKaMZB78eg=;
        b=CTD6uK4UItmeiT1LV7KMg65HyQTGp7gkeOnTraNybd7eZv6Hy9+uWxOYEAiyQ5aF5P
         phitp2qvBxK1lWTJpaSd6snkRvooAea+oUOKEtmEcjtYYb1s7l/MAwwwu2afZOkLLJHd
         +7+kDPmJ83wbaehmNgOqUJsr2foFgHTx7hn0sbbnhUhIeZow+gyY4dKLMxrsl/h1fbST
         P+wMiqxca+FaWzPF6HmsrXRFAaySIdklRqUh4ZD2tAPovH9he3HdCfB1OMmXbWx/ZDd3
         3qu21cGcpbOlXqOxpg159JAmaWHG1BryBpDNJtugtH6jJkvogLtOZXtB/Gqoiak2GEJX
         3c0A==
X-Forwarded-Encrypted: i=1; AJvYcCVcJ8pQUWNF675NeeCctgLCJY9UO5s6dSS2KOWMVk67cTYjaIDamCU7PAi7iboTIFdXmvRcQmdyuRcFpvo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/4ITX5dk9/rtkc/aO0GXe6PbddK/5uZY5fhA2QUTDElqhWcGp
	RAs58FEBKL9/krIUsuia8fyqSwgHGUHojI/qiIt9q30PZEfn6iKQXOrrstmtCz1Hcq912rbRQRK
	QiIGm
X-Gm-Gg: ASbGncsIrmpGYxW5Rsoc/Mj8FNTT98jA37cLkWinjWvKsHGhwn0UQZRiSJOWrLh67sK
	z0nX51IT1lK2T2tlc+wu+Ottapdz9E7MKJaa5Bdf6V7RQv31zFH5QU2ZTeart+3F4IxlLB++cQT
	69CMYJLzeLd0JFlbHX5mZjW6whvP8Akx5oNhEa8aIv/7SqRHtI2i3udoTHnaLaS0jLa0HCyILv3
	V6mhhxzX/chMFKisdmuaRH3bSzwv+VZ4LrJ0Lu/DfB6Ez8h4r7Z3gTKOloy5NA0/1tviG0JW38y
	7NS/e9aQVptqqVBRbvlIGo3tWlkQpzaJ87CSg+ro/ahj90GgJuNIiEbkbVa5JYT8ehvycTmGYBm
	XA1P8c8exU3q3s4fHpQ==
X-Google-Smtp-Source: AGHT+IGDxSM7ATGEf8luR6FsHBoP9Rz03O76JFYYcytYYgv6CqHzBB2u3MegIdGDixYFe2vIN2X5yg==
X-Received: by 2002:a17:902:dad1:b0:235:e9fe:83c0 with SMTP id d9443c01a7336-2366b3de5damr236240735ad.27.1750246554649;
        Wed, 18 Jun 2025 04:35:54 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:35:53 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>
Subject: [PATCH v3 02/12] RISC-V: KVM: Drop the return value of kvm_riscv_vcpu_aia_init()
Date: Wed, 18 Jun 2025 17:05:22 +0530
Message-ID: <20250618113532.471448-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kvm_riscv_vcpu_aia_init() does not return any failure so drop
the return value which is always zero.

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia.h | 2 +-
 arch/riscv/kvm/aia_device.c      | 6 ++----
 arch/riscv/kvm/vcpu.c            | 4 +---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 3b643b9efc07..0a0f12496f00 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -147,7 +147,7 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 
 int kvm_riscv_vcpu_aia_update(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu);
-int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_aia_inject_msi_by_id(struct kvm *kvm, u32 hart_index,
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 806c41931cde..b195a93add1c 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -509,12 +509,12 @@ void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_aia_imsic_reset(vcpu);
 }
 
-int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
+void kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_aia *vaia = &vcpu->arch.aia_context;
 
 	if (!kvm_riscv_aia_available())
-		return 0;
+		return;
 
 	/*
 	 * We don't do any memory allocations over here because these
@@ -526,8 +526,6 @@ int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
 	/* Initialize default values in AIA vcpu context */
 	vaia->imsic_addr = KVM_RISCV_AIA_UNDEF_ADDR;
 	vaia->hart_index = vcpu->vcpu_idx;
-
-	return 0;
 }
 
 void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b467dc1f4c7f..f9fb3dbbe0c3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -159,9 +159,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_pmu_init(vcpu);
 
 	/* Setup VCPU AIA */
-	rc = kvm_riscv_vcpu_aia_init(vcpu);
-	if (rc)
-		return rc;
+	kvm_riscv_vcpu_aia_init(vcpu);
 
 	/*
 	 * Setup SBI extensions
-- 
2.43.0

