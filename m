Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A6322A7EE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769866; cv=none; b=cHod/ctHO0kQuLEmWw3oaPG5VkSaLREc6/aTBQGZLGb7jjIowGc+dti1I6AX7+Hq+U6s8keDIf3YBqb2pYAsMa0jZhy5WOvABR8QBN103UkAVcHJ+ybEUwlu/0GuqQtaNpCFHR3juhFEZdaJQ8m2DAgvTbk0DPVw7zmuaOKpd5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769866; c=relaxed/simple;
	bh=F70kJX0NTy44VydwUCIUFgm54FUl3J0CEYjaigN7TtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/EOnbkdmZCrclHVJoo1ZpdmRNLxxAZNQk4/ALKx6Mi8n8TeNnj0GVK5YL/KH0/y0AM1nkZk1T6VFl+xE/V1edx6/8gx5UCF+Fa9plTjHTw6xb1aw10QEvuOwGlmXAV/4UuAeIXW0u7SpYoquYfXCsds54R5y49Cj4gvVtWuePc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXz5+ZYd; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXz5+ZYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744769865; x=1776305865;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F70kJX0NTy44VydwUCIUFgm54FUl3J0CEYjaigN7TtA=;
  b=VXz5+ZYd3W7GFBOBbtlklUCI82czfaBII7RFs+/wz8CJtqXUSfINr227
   rIdf80ojAsuqsZo8yPOtOH+K4wr3DVmx4F0ujRh/JtLrYvgCnhbXroa/q
   D0JAc1oJapAh3eW7QqKymBA5pR/rn1XD3ix8y77G3qGNOLEYR3e+rVT+O
   VlSgEiTmHxEmHQhiKhrBDy3ZEEx7lEfx3IEZvIX1OuVsqDpOa4pPgo0dU
   NtaC///0DRkNWvwyseyEMS8MgnJSaeDgmRNB/cQ1kOXjvTJXyyQ8tHgp5
   K3zy4GCqiwL98csyTUsn3BHZrksDc6fKl+fV5yyTN2o76Cfbv21Ui0NQ0
   Q==;
X-CSE-ConnectionGUID: N96qVMmrTuGvHo1za4Xt8g==
X-CSE-MsgGUID: 2jbFBIM7SS+VYt+nia2aEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="48998198"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="48998198"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:17:45 -0700
X-CSE-ConnectionGUID: Xu53YA/8ToWJuDGzIvd3FA==
X-CSE-MsgGUID: 3QHJOctUQpax7uw4/C1o7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="130260507"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.128.227])
  by orviesa010.jf.intel.com with ESMTP; 15 Apr 2025 19:17:45 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: mingo@redhat.com
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	tglx@linutronix.de,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	chang.seok.bae@intel.com,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [PATCH 09/10] x86/fpu: Remove export of mxcsr_feature_mask
Date: Tue, 15 Apr 2025 19:16:59 -0700
Message-ID: <20250416021720.12305-10-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250416021720.12305-1-chang.seok.bae@intel.com>
References: <Z_onl1QbH9L1-8dq@gmail.com>
 <20250416021720.12305-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable was previously referenced in KVM code but the last usage was
removed by:

    ea4d6938d4c0 ("x86/fpu: Replace KVMs home brewed FPU copy from user")

Remove its export symbol.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
---
Changes from the last posting:
https://lore.kernel.org/lkml/d143cc4c-8f8e-48e5-87f1-dded3272433a@suse.com
* Note the commit that removed its usage (Nikolay)
* Include review tag

Apologies -- given the review tag, I should have followed up this
earlier.
---
 arch/x86/kernel/fpu/init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kernel/fpu/init.c b/arch/x86/kernel/fpu/init.c
index 16b6611634c3..2d9b5e677559 100644
--- a/arch/x86/kernel/fpu/init.c
+++ b/arch/x86/kernel/fpu/init.c
@@ -100,7 +100,6 @@ static void __init fpu__init_system_early_generic(void)
  * Boot time FPU feature detection code:
  */
 unsigned int mxcsr_feature_mask __ro_after_init = 0xffffffffu;
-EXPORT_SYMBOL_GPL(mxcsr_feature_mask);
 
 static void __init fpu__init_system_mxcsr(void)
 {
-- 
2.45.2

