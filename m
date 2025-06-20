Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FEC78F39
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750396919; cv=none; b=WdTQzu410G9mkPN7FKLgXNm/8xsEMpsXo8VadO2a/4S+cqGs7/ihwOl01tpONJs/WXuGui49p5Hli7RWkiPSjrN2pAA3B1scnlpE4s7ANGbE7iiOgcBmIP80+OasHDilnavFJQffkDhTcbNhTYrirHF0ryPAs5BpnTI98pQRTjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750396919; c=relaxed/simple;
	bh=2I6tF6igW9/UBOcjGbFr/Wl3xrGB0gSptSywpi1FEwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D0HEvVrLKNVINQHpzNQTK1itR5IBspZ+60m9WTBp1JhNWuwOEtCCqZ2zM4mo8LSbx4SLk34dwetlnNyjmFaUpjNX0EV4E/ayEx6FBUt3G6qc4nVc6Bz8aBWJseIHswl8x4vHYUXhsW6LzwYQ5wosZG8oo07DAK3VKEr6r4OZFzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HU26cyA9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HU26cyA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750396917; x=1781932917;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2I6tF6igW9/UBOcjGbFr/Wl3xrGB0gSptSywpi1FEwE=;
  b=HU26cyA96edZ6lwfYV4PO0Nc83577YfnbVkdKZTTUlUqgGSoabtv/EXl
   /eCL4dAV5OPbletVVwLXEoVRXxhoIrvNFnt+b1yAdbGoExIB85fs2KlWK
   aZsv5SK9qm2+OAgWMEdP2Kv3h1rZYjvosTsl8wBMVp0C/2Pm+2FXsGt8B
   5QwuFa3a2lgT1BBsmVvn0UiU6CfRvbh4Sp90OxgkQWQBk221F95JMkmkc
   L9i4jUGoHM3peZ1/WOqnVYD8gCvbUYGY5ed1fYAc5SU3s5ddSGW5R/FGz
   gaB/llT2DozRxpgJKaH54ZCzfP3Hcy6E9kX6DTostZVGyx/GovjNiTVX4
   Q==;
X-CSE-ConnectionGUID: nKPkk0otST6MCuFJJ8dkFA==
X-CSE-MsgGUID: 0G6jbXqEQ9SAF1z0CpeDpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64083162"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="64083162"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 22:21:55 -0700
X-CSE-ConnectionGUID: iargc+YqQ9ivXyNiHc2xpw==
X-CSE-MsgGUID: ZrMYmB0HQHaje40ELw6Fhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="156621632"
Received: from unknown (HELO 984fee019967.jf.intel.com) ([10.165.54.94])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 22:21:55 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-kernel@vger.kernel.org
Cc: Chao Gao <chao.gao@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Chang S. Bae" <chang.seok.bae@intel.com>,
	Eric Biggers <ebiggers@google.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Xin Li (Intel)" <xin@zytor.com>,
	Stanislav Spassov <stanspas@amazon.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH] x86/fpu: Fix kdoc of fpu_enable_guest_xfd_features()
Date: Thu, 19 Jun 2025 22:21:50 -0700
Message-ID: <20250620052152.490414-1-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust the indentation and use tabs between function parameters and their
descriptions to align with the convention used in FPU code.

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
 arch/x86/kernel/fpu/core.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index ea138583dd92..26ddfb5079a6 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -290,15 +290,15 @@ void fpu_free_guest_fpstate(struct fpu_guest *gfpu)
 }
 EXPORT_SYMBOL_GPL(fpu_free_guest_fpstate);
 
-/*
-  * fpu_enable_guest_xfd_features - Check xfeatures against guest perm and enable
-  * @guest_fpu:         Pointer to the guest FPU container
-  * @xfeatures:         Features requested by guest CPUID
-  *
-  * Enable all dynamic xfeatures according to guest perm and requested CPUID.
-  *
-  * Return: 0 on success, error code otherwise
-  */
+/**
+ * fpu_enable_guest_xfd_features - Check xfeatures against guest perm and enable
+ * @guest_fpu:		Pointer to the guest FPU container
+ * @xfeatures:		Features requested by guest CPUID
+ *
+ * Enable all dynamic xfeatures according to guest perm and requested CPUID.
+ *
+ * Return: 0 on success, error code otherwise
+ */
 int fpu_enable_guest_xfd_features(struct fpu_guest *guest_fpu, u64 xfeatures)
 {
 	lockdep_assert_preemption_enabled();

base-commit: 74f86163845cfeb1b4b0173eaa1ee05e2e8ca4fd
-- 
2.47.1

