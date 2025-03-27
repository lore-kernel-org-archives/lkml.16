Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41CB1DE2AA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743119347; cv=none; b=mm1cRTS6fpoA4OqIEUexdlfARiyK090m8tPs0nhtYfnw1TUH0yeG8xC9XyeUP38oMWZMNlvH6VgqCJHQrer1Pe15y9tzC43NyWcVonCsBQXkAjoixOE50BHXz1dnIJ0ierQWskAuXjycoe6h6z7OmVQ/RqlXejn25JhxIQlnXuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743119347; c=relaxed/simple;
	bh=K0PUC8y3AWFT3Wsxw+URBsGPPKBxMUuTV9nQ9RtYid4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5Xf8scrElM+gvW5zXiiA9k2vVz4DiO6i8Gk+jMaNgQBu/uIUa3RYzz6BHJq+5CGxLCbM3SkB2w8rr/wYrPjtvXgj2BiqDCWhcbcqDZa941FLel2cvwqBqRNoZ+R0ZR7NYL4hxps8Izc+0ZqsqfD8OFCK6Tm2SUuhPj2UyhmMXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=US8M1FF/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="US8M1FF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743119346; x=1774655346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K0PUC8y3AWFT3Wsxw+URBsGPPKBxMUuTV9nQ9RtYid4=;
  b=US8M1FF/bRXAGm6YDkqucgzySU/KqM+hsmT6sj3Y0g54OfuEd2lpsiLy
   i/eMyHXqTkqcqI5LwEbNYytewUYRNG4zz9JBbbdxu4fJCtXn4dNx2ylp2
   7aPW8v8R5CcwiHRN4BhrnZwYpLFXD388vl5iYxWDoxV/srOfiqVlyOkFj
   Dsww4QBIqWS8uCKbbGxDFP3ns/4anlIjWOKrgOU67TG7igaaRzqYjuOW1
   RDUpoRCTOUABaDCExs6igO/huLhuwp1h2jfJANawdwA62jHW0tpTej/6R
   LDgpi1r1rlfooyJWYZXBn6K+Aa6L+lXM+t/YprEtBO3qWJk0es6NkCOYM
   Q==;
X-CSE-ConnectionGUID: 0nz6xZAKRWCTAiTE5F3ViA==
X-CSE-MsgGUID: zzjef1VQTRC23JxzViNjTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43627960"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="43627960"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 16:49:05 -0700
X-CSE-ConnectionGUID: R+aUmq0URmarRD2JGQXGgA==
X-CSE-MsgGUID: 5wOeVWHmQIyrX2iVczI81g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="130150505"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa003.jf.intel.com with ESMTP; 27 Mar 2025 16:49:04 -0700
From: Sohil Mehta <sohil.mehta@intel.com>
To: x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Kai Huang <kai.huang@intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mike Rapoport <rppt@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Xin Li <xin@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] x86/nmi: Remove export of local_touch_nmi()
Date: Thu, 27 Mar 2025 23:46:24 +0000
Message-ID: <20250327234629.3953536-5-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327234629.3953536-1-sohil.mehta@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit feb6cd6a0f9f ("thermal/intel_powerclamp: stop sched tick in
forced idle")

got rid of the last exported user of local_touch_nmi() a while back.

Remove the unnecessary export.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
---
 arch/x86/kernel/nmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 6a5dc35522c8..cdfb3864d59a 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -745,4 +745,3 @@ void local_touch_nmi(void)
 {
 	__this_cpu_write(last_nmi_rip, 0);
 }
-EXPORT_SYMBOL_GPL(local_touch_nmi);
-- 
2.43.0

