Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4012163AC;
	Tue,  4 Feb 2025 17:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690588; cv=none; b=qqKocCJK/JXf+JKlUBp2YH+x+lh0ETXONXBLaYaXqO4PAiOvOlRv9xcbcW6j+0LxkFjjjcC2a9ofrwv9O/OZrf8vXanVPlkAhEBKqxf3yP+5W3mdmDHG1kc03JXb7oEoMGLZuqD0fdQHO8le0mMLeN8eiUevF8bOA/1iczJ0dMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690588; c=relaxed/simple;
	bh=ZPDKrg9roFM67mEQ2fI48/uwWPYPBpbE1ZWp7rfkzQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZnQTX6D8NBkbY9xxR375WWtT7GCyGoGzRspDCDMKmzmuA42BRW7ZpCVl4Kh1l4nGCoBhM+hAmpExdKb6hCYi+20aW+zfGkilde06aHwZUM/XEkmUjGpotpXTEnM9qZWDH2frS5aZZtU0JU8OWnXcMoXBVw/KINsuz1r/55NqNfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OzKLEZRc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OzKLEZRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690587; x=1770226587;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZPDKrg9roFM67mEQ2fI48/uwWPYPBpbE1ZWp7rfkzQw=;
  b=OzKLEZRcGnEafPuWzqcBa2H/6WpLfuxAPAQKLEg+q0BEnRqRSm549NYD
   CJd00DexTfsg5MFYeUUdGd7nX9aNaXTU57Gwcx1LKymI7cM7Sib/0jzbe
   Y9ZbE3nOGscJs7gB7xwfuBBre2j8iA9T2jBSfUGfhd1tvFEeSV1VqdOMM
   TIO8+ZF3S1VXNPkSX0eEpdl9ZQD2MckykDnD2uY2ZdZW8cra2Eh5PM1pF
   MGwFiR+HFhadiAKiNJL4kgU9Y2rEDnxOdKHQ06PnpATfH1MKE5WVQO55x
   DBY+/6GIcbm3lrik/UrpKk9ylLYZ+EsDRzDcdfhO4hR7bkYQZkXS5/ROQ
   Q==;
X-CSE-ConnectionGUID: 6PEHu10CSJqCmwuWjtPhNA==
X-CSE-MsgGUID: 5hN2IxyfSsKcu0JwTBADuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38930840"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38930840"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:26 -0800
X-CSE-ConnectionGUID: jXIRAGRVSi6AV3rBRiAebw==
X-CSE-MsgGUID: yAFfDOxmTeCrIA01iFfVXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866806"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:14 -0800
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
Subject: [PATCH 09/15] x86: Physical address comparison in current_mm pgd check
Date: Tue,  4 Feb 2025 18:33:50 +0100
Message-ID: <fde443d0e67f76a51e7ab4e96647705840f53ddb.1738686764.git.maciej.wieczor-retman@intel.com>
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

With KASAN software tag-based mode enabled PGD pointer stored in
current_mm structure is tagged while the same pointer computed through
__va(read_cr3_pa()) ends up with the tag space filled with ones.

Use current_mm->pgd' physical address and drop the __va() so the
VM_WARN_ON_ONCE can work properly and not report false positives while
KASAN is enabled.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/mm/tlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 86593d1b787d..95e3dc1fb766 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1295,7 +1295,7 @@ bool nmi_uaccess_okay(void)
 	if (loaded_mm != current_mm)
 		return false;
 
-	VM_WARN_ON_ONCE(current_mm->pgd != __va(read_cr3_pa()));
+	VM_WARN_ON_ONCE(__pa(current_mm->pgd) != read_cr3_pa());
 
 	return true;
 }
-- 
2.47.1

