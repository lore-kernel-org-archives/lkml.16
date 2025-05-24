Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA521EF380
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 15:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748102149; cv=none; b=bUtTOoMHtu97Nlny0ipKPMg7JKJcTbb63bZguZXQe8NKe7H1jId4CqEREeQvDndxm+KsVAMGe9zUgkRXYoeDHJVBDJpTua1F2Lrw5MMBer4c9Q4kVk6jqplfRMteksVHa0cT8CVgM5MGs5WeiDTMgBXHSopfQhFk6aojmWt/Z5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748102149; c=relaxed/simple;
	bh=QfSnw3oP/4WKgI480zkw9SSi/asBUx+GlH7LBbjlZ/0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G9aB7favtTmsKeLhr6rN807KTXpWA2awQZe2ot9Yyc9S9bpDPJR9VxoXyviIMbDobVdI4bZocY1j9IGYdbZ2MUr+1A0cLbz9lAYAlr66Mjq+Az8F/0vtIBjs7CouqDpYoBfF/49FfmTtZlp8f3juKbW8OfGQDtydc9lZV0k+K0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5+iqf9O; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5+iqf9O"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b1ff9b276c2so409896a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 08:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748102147; x=1748706947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XEj2bDzjI5RZaf4AQVAydyOkb+dFtV7mE+ztvzkolw=;
        b=l5+iqf9Oe4Cy9Eq/MmPfTsXtqN8AIDPPJ9BDgYGc5gFeg8Gv4+30pvGVi1bSwTN72n
         yzgbj8+65nIXwI0koy8H8BhC2zhXVLXGfaoxr/y9Qkexd4FgmLb43U2F4JZ3vY56hH37
         o3L0ca+IcjknXXD4XFh3+u0mVUbUTF5nS3of3BrvsOITHS4BJUdUPibf8CyZFT65YgnF
         CMd3K90ZD1Q2SSp3aBSeHZgExPpya31FoWAgzq2X4XHpw3Fq67spnV//yx2ISx8uKoaT
         cNeCZjkVw9hUyWIQBy5hqzNMPUkqIzo+I6tOt0B9TMRODRVX+mK3QQsRmJ3RYvUTWiNi
         2syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748102147; x=1748706947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XEj2bDzjI5RZaf4AQVAydyOkb+dFtV7mE+ztvzkolw=;
        b=EOqdNllq5hASzq6S5k5PIjTr2sQxfJyxkvb1UKyOON+CFTWuPISxBj04NW5+T2EZSm
         L9bBrT/nzLfDt21kFEoSPQES4xNMURkUKwampXVafvMQo0A39v9Yncnb8/v7HQpYATJe
         r6ZTR2HBUnnORUkq3ux0u6NaO8mRwr+aH1H4D/eTXPQ8pOlcgvsj+dPLf6bC/1stLjsd
         CtVuKhLr7se+LkyV41WVX8OQY7NOZFJNYOffwe/zY6fvtrbNu2XMWcqpM6kk5d3/B4U+
         J1tEvYF6p5DtQB+mG73Pa5iWTjUNQWrtlwz4tx4OvtWnkUG7H1Rf3RYY9GrV9KlQ2Ks4
         vSFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEhLeWku7l/iXp3/NSrI/eAxSw3HEHh1Hi2OF7MZwbc7rvpyrblUbp8oQ9z3QmHudIMbgqTF82hEB8DkE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4NQQKXLNp131Tku2t3UAxfxoXrrQ5CPyztCe1bZGYbZJPQ09+
	UTzam/nn3a+Nshz9LmBIPpKMBTYd3btr0knTE1DEkIxYuddBqwY/hKZh
X-Gm-Gg: ASbGncsQdR0fmUBH3UAP6rK9wNMEhcvmUD+3EJ8cNlo3rkx5LnU69C2H8w864+T0gfT
	pjH3ZLVaQfrJcnC1WGIA/RDn7aC99TiEDyt0ziHCOv6nfx5HQOvR2c3o9mzCLHFPpgHRMccj+jU
	nBcTB80ino4kdOk9zDBXoTszUzeqAX0bTXDC3biMuIClxZndsn/SdedxOne+bYb5q6N1CAW+BGG
	9sw1j6bywUY18RZxEAoU64GTG2prJ7c98oAp/6zEC2BfNPa2U/pVwrTuCRqI8yuahvB455aMkE5
	V76LuQq9095z4l+ELTrbnsraUBjm7r4Aefn4Bya4Sei17iLCtWV6rLR4VO5Qpea+cEyfu4XST0f
	f4iVS663FWVcTvUbk
X-Google-Smtp-Source: AGHT+IFJr9YZ2XIjARlbWHrAZjs3d7ZcQweRgWi1fq4Jo17NP2mGsaaRzDetVmjg1S6Cr0UjlcknLA==
X-Received: by 2002:a17:902:e80e:b0:22e:50e1:73e with SMTP id d9443c01a7336-23414f49fc9mr43253575ad.14.1748102147183;
        Sat, 24 May 2025 08:55:47 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234396eaf62sm1200745ad.9.2025.05.24.08.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 08:55:46 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 3/3] riscv: Optimize gcd() performance on RISC-V without Zbb extension
Date: Sat, 24 May 2025 23:55:19 +0800
Message-Id: <20250524155519.1142570-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250524155519.1142570-1-visitorckw@gmail.com>
References: <20250524155519.1142570-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binary GCD implementation uses FFS (find first set), which benefits
from hardware support for the ctz instruction, provided by the Zbb
extension on RISC-V. Without Zbb, this results in slower
software-emulated behavior.

Previously, RISC-V always used the binary GCD, regardless of actual
hardware support. This patch improves runtime efficiency by disabling
the efficient_ffs_key static branch when Zbb is either not enabled in
the kernel (config) or not supported on the executing CPU. This selects
the odd-even GCD implementation, which is faster in the absence of
efficient FFS.

This change ensures the most suitable GCD algorithm is chosen
dynamically based on actual hardware capabilities.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/riscv/kernel/setup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f7c9a1caa83e..f891eedc3644 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -21,6 +21,7 @@
 #include <linux/efi.h>
 #include <linux/crash_dump.h>
 #include <linux/panic_notifier.h>
+#include <linux/jump_label.h>
 
 #include <asm/acpi.h>
 #include <asm/alternative.h>
@@ -51,6 +52,8 @@ atomic_t hart_lottery __section(".sdata")
 ;
 unsigned long boot_cpu_hartid;
 
+DECLARE_STATIC_KEY_TRUE(efficient_ffs_key);
+
 /*
  * Place kernel memory regions on the resource tree so that
  * kexec-tools can retrieve them from /proc/iomem. While there
@@ -361,6 +364,9 @@ void __init setup_arch(char **cmdline_p)
 
 	riscv_user_isa_enable();
 	riscv_spinlock_init();
+
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZBB) || !riscv_isa_extension_available(NULL, ZBB))
+		static_branch_disable(&efficient_ffs_key);
 }
 
 bool arch_cpu_is_hotpluggable(int cpu)
-- 
2.34.1

