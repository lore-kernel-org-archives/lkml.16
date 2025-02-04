Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49AF2165F4;
	Tue,  4 Feb 2025 17:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690613; cv=none; b=R4qwmHRSlbjGDeq33JDQamYokpvycGO/irhqSoIeK3sbPt3nJDK7/Q3ehHAvjw2HnqIOxZjimQQfWGwdvhF3AlLJME4gkaWJXqSyYReHCEdHKZtvCx7ZmfUOVhCy2vKgQZ5ES/NyY16n4eplzaY1pDZ9+TU3qg6dj/CzpYOAtNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690613; c=relaxed/simple;
	bh=EUgvSoD6ZXvZMdQY8EXK092WIVXF++/3+F17U+GxOWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CMuAB3lv3r3A7etTG7NFCKeO+cQEnMC0s/qAu7RUahnANh505NaYFHGKjQ7FjWxQKsuLbsKNIr3EzzbRJLW+jonW47Ny5aXN1jb4bAZ7a71D7vpRDNGIPTmcn2V9YB/lG86DyfAzv/akBff/rp0OoSFspk+yJMNgzgvbygnX0vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jN/G8y/b; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jN/G8y/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690612; x=1770226612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EUgvSoD6ZXvZMdQY8EXK092WIVXF++/3+F17U+GxOWU=;
  b=jN/G8y/byn5XTgdkIACw6XW7C1VohBQMyPrFtalPd9T9ZlGzT/yUb7TN
   3E46uSHOlZxq0AEg8aAQjd6g4ctgIlSVqm9PmU1MAoDYUds6RlFKhgyc6
   Ow/TlbC4p61EYVro48hfLmZKMbf3yurlo/FW/zNYno/IKe1TWp2j7Yq+E
   kLXbd6jOgTOK1Y134xkVQga8EM5TnW088inVReoH9F3DehcD5yeH+XXfA
   XqAvK0ilUcadBDq/DU2AzZG0dKG15CYtsV4stA7EVpG7KNbBoHUPfFS0d
   x0AgB/Resr/q0BoQt8CYyhP4KP+AvWgeVyMbUvz1e6ZiKOC9CiulCtOo0
   g==;
X-CSE-ConnectionGUID: yQMj6mn5T9GPqqzzU9jkaQ==
X-CSE-MsgGUID: gpAF3kYNRJ2ZJgmKgl0Pbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38930994"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38930994"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:51 -0800
X-CSE-ConnectionGUID: P6du7V6VScafjuMIXvnbWA==
X-CSE-MsgGUID: W7s9nIAMS+GBPujRL+zY2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866889"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:39 -0800
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: luto@kernel.org,
	xin@zytor.com,
	kirill.shutemov@linux.intel.com,
	palmer@dabbelt.com,
	tj@kernel.org,
	andreyknvl@gmail.com,
	brgerst@gmail.com,
	ardb@kernel.org,
	dave.hansen@linux.intel.com,
	jgross@suse.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	corbet@lwn.net,
	maciej.wieczor-retman@intel.com,
	dvyukov@google.com,
	richard.weiyang@gmail.com,
	ytcoode@gmail.com,
	tglx@linutronix.de,
	hpa@zytor.com,
	seanjc@google.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	justinstitt@google.com,
	jason.andryuk@amd.com,
	glider@google.com,
	ubizjak@gmail.com,
	jannh@google.com,
	bhe@redhat.com,
	vincenzo.frascino@arm.com,
	rafael.j.wysocki@intel.com,
	ndesaulniers@google.com,
	mingo@redhat.com,
	catalin.marinas@arm.com,
	junichi.nomura@nec.com,
	nathan@kernel.org,
	ryabinin.a.a@gmail.com,
	dennis@kernel.org,
	bp@alien8.de,
	kevinloughlin@google.com,
	morbo@google.com,
	dan.j.williams@intel.com,
	julian.stecklina@cyberus-technology.de,
	peterz@infradead.org,
	cl@linux.com,
	kees@kernel.org
Cc: kasan-dev@googlegroups.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [PATCH 11/15] x86: LAM initialization
Date: Tue,  4 Feb 2025 18:33:52 +0100
Message-ID: <01104816cdd0d430ac843847a8056d07b8770be0.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To make use of KASAN's tag based mode on x86 Linear Address Masking
(LAM) needs to be enabled. To do that the 28th bit in CR4 needs to be
set.

Set the bit in early memory initialization.

When launching secondary CPUs the LAM bit gets lost. To avoid this it
needs to get added in a mask in head_64.S. The bit mask permits some
bits of CR4 to pass from the primary CPU to the secondary CPUs without
being cleared.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/kernel/head_64.S | 3 +++
 arch/x86/mm/init.c        | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 16752b8dfa89..7cdafcedbc70 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -199,6 +199,9 @@ SYM_INNER_LABEL(common_startup_64, SYM_L_LOCAL)
 	 *  there will be no global TLB entries after the execution."
 	 */
 	movl	$(X86_CR4_PAE | X86_CR4_LA57), %edx
+#ifdef CONFIG_ADDRESS_MASKING
+	orl	$X86_CR4_LAM_SUP, %edx
+#endif
 #ifdef CONFIG_X86_MCE
 	/*
 	 * Preserve CR4.MCE if the kernel will enable #MC support.
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index eb503f53c319..4dc3679fedd1 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -756,6 +756,9 @@ void __init init_mem_mapping(void)
 	probe_page_size_mask();
 	setup_pcid();
 
+	if (boot_cpu_has(X86_FEATURE_LAM) && IS_ENABLED(CONFIG_KASAN_SW_TAGS))
+		cr4_set_bits_and_update_boot(X86_CR4_LAM_SUP);
+
 #ifdef CONFIG_X86_64
 	end = max_pfn << PAGE_SHIFT;
 #else
-- 
2.47.1

