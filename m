Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FAF230999
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747805723; cv=none; b=oLbhf/UFXLP8cNgsFAwhNyTwuPd9i8c7c3I97GMgtOx4oNgGJU5HhmacYxloNfbzKJaHzjBcYT8Bsz9BAY/EzkCY18ICtke/pe74upgLxu9B8nKQb0fvLrRCngXSc8enrJ+++vL44e69NYavhVVSKKb/n7cbrDeHZa0ldZ6ZF+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747805723; c=relaxed/simple;
	bh=7kvh+o0MNB7yZjX/RtCettiz+uzIiUoQvfIhCX0no4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dm6q6idWOPBgNW0jAMyzrxsitJF/SZNVq3zGywx7GtHYPrkp9Yb9tAtF1kWy7t0R+fhxRuLWZZ+FrLP5OcWyNv1tuhUlZ3ym3ttul/FaOWfKgZDZHnAkZI8RxFdBX1rOkd8y9/uZnDHpQIdiatKRLGmtJ7Chejy9GZo/f/rbY7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOzE/6lK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOzE/6lK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747805722; x=1779341722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7kvh+o0MNB7yZjX/RtCettiz+uzIiUoQvfIhCX0no4I=;
  b=gOzE/6lKffalZj3pQX3LTb+8irdCZHy6BaKNEIJfdl7XkmqhRH9/z9ZN
   OHKbP4PoVGxXUPleXSlYzmLQmhPkNkvic7KPJLgHJVISmN9QdSkhgj/+M
   W21B9CXIpRspbjzQV8faJ9Iy3KCm02vOAna9n2FFPojIa5i6kQmRVgo8Q
   pBpeBG+1bq98kjmtF95CL12C9X5Xw8ihtmRTLPo2DvdAZ2ltwY5sgCWVt
   8e8LXBxVDhVWTJnnZzv9rXWBH07bl1ycDYW+nL9DUa9BNy/tg9bS2Kl6V
   O8E+JWpuA+KDkA+iZvSL0YCysvpcDvUYWMZqqyNCUWLtGjF276613zVsV
   Q==;
X-CSE-ConnectionGUID: INVRm3c/Q1+6LoasN0J4QQ==
X-CSE-MsgGUID: wZIWK9kkTiGJOCNbTqc5Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="52393094"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="52393094"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 22:35:21 -0700
X-CSE-ConnectionGUID: 6EWY6pwuTyOX7hgC7UF8Iw==
X-CSE-MsgGUID: hWHmW2RtRtW/LQ3qPql0ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144792648"
Received: from nsridha1-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.22])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 22:35:20 -0700
Date: Tue, 20 May 2025 22:35:20 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 1/2] x86/spectre_v2: Fix mitigation default on Intel
Message-ID: <20250520-eibrs-fix-v1-1-91bacd35ed09@linux.intel.com>
X-Mailer: b4 0.14.2
References: <20250520-eibrs-fix-v1-0-91bacd35ed09@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-eibrs-fix-v1-0-91bacd35ed09@linux.intel.com>

commit 480e803dacf8 ("x86/bugs: Restructure spectre_v2 mitigation")
inadvertently changed the spectre-v2 mitigation default from eIBRS to IBRS
on Intel. While splitting the spectre_v2 mitigation in select/update/apply
functions, eIBRS and IBRS selection logic was separated in select and
update.

This caused IBRS selection to not consider that eIBRS mitigation is already
selected, fix it.

Fixes: commit 480e803dacf8 ("x86/bugs: Restructure spectre_v2 mitigation")
Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 3d5796d25f786837df59f9ce6358bc875cabe731..7f94e6a5497d9a2d312a76095e48d6b364565777 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -2105,7 +2105,8 @@ static void __init spectre_v2_select_mitigation(void)
 
 static void __init spectre_v2_update_mitigation(void)
 {
-	if (spectre_v2_cmd == SPECTRE_V2_CMD_AUTO) {
+	if (spectre_v2_cmd == SPECTRE_V2_CMD_AUTO &&
+	    !spectre_v2_in_eibrs_mode(spectre_v2_enabled)) {
 		if (IS_ENABLED(CONFIG_MITIGATION_IBRS_ENTRY) &&
 		    boot_cpu_has_bug(X86_BUG_RETBLEED) &&
 		    retbleed_mitigation != RETBLEED_MITIGATION_NONE &&

-- 
2.34.1


