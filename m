Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D25E3FB0E
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 02:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747881865; cv=none; b=swZVJfrG+RcCoCq5OrkYubUqumiFJmtgZaY6f5GInmRvnqw8r1nQ1apEq1i+MTfuQ6QTzE81gmJkBRYawN4CwCq1VWuxFjlHNsdqu+15H18zREdHBFuTqlowFnwnHjYFYS3K8b2CzIiprkASp0kjybAdxotJgvmzaTvQE0Jozyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747881865; c=relaxed/simple;
	bh=D+l3fV7MsE14lG/QYMvhUWwstdjtnwDuZHgJmmwW3xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZXvf9RBRf+4T5qV/yqT/gU3s1aOqBBrz4WYljv3EwugOpZ61PQAiSXH1NQnLl+RSzKyBmZLSmuzVTXH1Ia2Kg8Xhr+LVpjglc09Kcp1fVkaC8ZlWRLwrr33/7RQy5RvP0bq9jf2ywDGUxzKPIgJQ8BzI4aUHt8Al1dzjwkTGoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2c0Y80u; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2c0Y80u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747881863; x=1779417863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D+l3fV7MsE14lG/QYMvhUWwstdjtnwDuZHgJmmwW3xc=;
  b=m2c0Y80ukCiFw8uIhKAIl3cU9JWa2FSGJ2UnvYyDxdR1s8WsFlTD+ox3
   +J3mIL0r/xOYo8bJnxQ0bPM6dXAO/bT0jAAEcXJcsW2g90MMcYsBjtOg9
   q6sRXjXgQyKSEimPTAkNc4KhepU0QHDOBTC8ayp0daWEJUCqFAvSrsuZd
   eUpyxU3ku31ThuAiALD6HuyEXIW9mp/dUKFUpuhuzn1aAYuXKHAW2Jh1Q
   nZEP7ngtzYoUISoB5pZaKxX//L+uVBuSP5PisRsQHs4mOaOQkfLXp/xfR
   iUqI/d8G3G9MwIUPgmmv8me10AFiIfCLOgUf02w0iT35+RcOUXCzQAf+p
   w==;
X-CSE-ConnectionGUID: QNPmlhL4R3uEr249M6qWaQ==
X-CSE-MsgGUID: Rw8/yqltQIO7OW/7CNybIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="37506676"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="37506676"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:44:22 -0700
X-CSE-ConnectionGUID: jy40CuH4Qsi14iGZnXLTow==
X-CSE-MsgGUID: EQcN7vjuTQmandV3q7qvkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="140212693"
Received: from ssuvarig-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.23])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:44:23 -0700
Date: Wed, 21 May 2025 19:44:22 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 1/7] x86/retbleed: Check for AUTO in all cases
Message-ID: <20250521-eibrs-fix-v2-1-70e2598e932c@linux.intel.com>
X-Mailer: b4 0.14.2
References: <20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com>

When none of mitigation option is selected, AUTO gets converted to NONE.
This is currently only being done for Intel. The check is useful in
general, make it common.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 7f94e6a5497d9a2d312a76095e48d6b364565777..19ff705b3128eacad5659990ed345d7a19bcb0f4 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1294,15 +1294,15 @@ static void __init retbleed_update_mitigation(void)
 			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
 				pr_err(RETBLEED_INTEL_MSG);
 		}
-		/* If nothing has set the mitigation yet, default to NONE. */
-		if (retbleed_mitigation == RETBLEED_MITIGATION_AUTO)
-			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 	}
+
+	/* If nothing has set the mitigation yet, default to NONE. */
+	if (retbleed_mitigation == RETBLEED_MITIGATION_AUTO)
+		retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 out:
 	pr_info("%s\n", retbleed_strings[retbleed_mitigation]);
 }
 
-
 static void __init retbleed_apply_mitigation(void)
 {
 	bool mitigate_smt = false;

-- 
2.34.1


