Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF652DCBE2
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747963265; cv=none; b=jb0QkEjJ/oUGNiSXx8X6UxkmyZRoD2bKr1xh4eyEgk/EiJTWxb1gW2+tsESoFISRD45Ck9AATuseWg9oYkYjdjpEL0mZ5o3Himgyj0APNpUE8Drl/0+38mZylfIOaWDCRZ0+ekvoF34EG+PTf0i7o94XNPnE1TfZQnfHbDdRM6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747963265; c=relaxed/simple;
	bh=/yHFI/+O3XKAIOaAmu2yff73xOQf/jodOB52m4se3Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deouPdZRJqJ2U04L/3CHnhUz0JLL0Wn4kYC0fW3iROYNCjXM0TnozmRSVouN0L8V8ULIaGwbpbrE1gjHxcKrYDjSFBnog9KzYYPk/GnKiprmBhQcUP2pjcNjoqE6LKRmJegwKWGX9sDd1XDBzYUxZfrGWsqBFWkh4DtENnIGeAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUCTstHr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUCTstHr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747963264; x=1779499264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/yHFI/+O3XKAIOaAmu2yff73xOQf/jodOB52m4se3Kc=;
  b=RUCTstHrgDOwyVOUwOgf7DtS2i39oLGTfbnwguA/9Gdbj9enX6LNJpcO
   DgA3OJgBNslEPZIwB/9LjLIqPnn1F0UCSuvfLwRlAe2mAt3f3KLDUWuRa
   jfIOfoZZF3yU6ohck5ChR/A69mcoxrkssh7wvIdbvObFdzNjBYNKH6J5M
   sgYAcsy/sGH2EJuShRa5DJW3SN6Jn0rXrZ4axF5fEVKyj6r5Ed71t82Ia
   UoQ7GnY8Xo1ih2sILa5nABeVz/Bvf9psunmaQwlrCFPW/hjUQBJ04xJ7r
   KVzLoSsc+8EbVWeV3Wd699Vg1uTPvZeFHixmz7iH3mczZzayVcqiYsTX6
   w==;
X-CSE-ConnectionGUID: rkdhAyjrTUihbxNlZWzG7Q==
X-CSE-MsgGUID: N9rhMYrvRc6hLsu/upIYdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49128376"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="49128376"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:21:03 -0700
X-CSE-ConnectionGUID: jijugcAcRo6Jg2EbKvG9ZQ==
X-CSE-MsgGUID: 0L1M5TgbTLWOT6TTG/t6zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="140685437"
Received: from lindenmc-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.24])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:21:03 -0700
Date: Thu, 22 May 2025 18:21:02 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v3 3/7] x86/bugs: Exit early if return thunk is already set
Message-ID: <20250522-eibrs-fix-v3-3-12704e291e1e@linux.intel.com>
X-Mailer: b4 0.14.2
References: <20250522-eibrs-fix-v3-0-12704e291e1e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-eibrs-fix-v3-0-12704e291e1e@linux.intel.com>

When the exact same return thunk is already set, avoid the warning and exit
early. This is to prepare for ITS to also set CDT return thunk independent
of retbleed.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 94d0de3e61aec32b3b67c8d21f89a8c67b93dff3..354593065025fd7c5727e955d76523777b3da9ee 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -113,6 +113,9 @@ void (*x86_return_thunk)(void) __ro_after_init = __x86_return_thunk;
 
 static void __init set_return_thunk(void *thunk)
 {
+	if (thunk == x86_return_thunk)
+		return;
+
 	if (x86_return_thunk != __x86_return_thunk)
 		pr_warn("x86/bugs: return thunk changed\n");
 

-- 
2.34.1


