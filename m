Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9890A1758B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 02:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747881895; cv=none; b=TpYbYdo3EoIY5+qiDnHQjXsCbqJS2zG+Bs18pX/4YWNrh1bSRXMthzNmDp+YYJMImnpxsUfLszyWwOheB+8taDR5++edl3evEIGTMZDf7pEeGontZ0ffY1pte/3B4cukecK94+XTGETZo+PW8TW6Dhb5a8QnDwfJilZ6dhQL3GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747881895; c=relaxed/simple;
	bh=Vw7Tw9k4ajtM6S68S20eyuIgMXcXJcfzU1gpOPZG52Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6uMbwQDHuQ3WROFnfJB3psQ1fZsKr4uiD55y/tBOzjUHbqlIfO/SmNa5L/G88guHcFXW0y+4l/rEgpSPrOCOFHaFpx48D3Jbycw7Sg6MA/tqiBI75wtGad0S1Cm7LzAsx2YMQB30yLW2n7SrMEgME+Mxwkh0xM0QJV5dhIog5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhulYQBo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhulYQBo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747881895; x=1779417895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vw7Tw9k4ajtM6S68S20eyuIgMXcXJcfzU1gpOPZG52Q=;
  b=IhulYQBopCqrWtGkPRaZSBK+mPJ3Zsa1SnDpmoaxP8OwigAr9M2CDbUB
   glA2meOesJl1iE+s9Tk70Ufzd2toKuyKHAZPnghN3JNHHBkVzrzYUR1NJ
   BlKCsj3EqEflYinXsSWxQFQ+oqoT8ZV5jaFQeg4mlDQiE72wu+AiNvupG
   l0qSf8OKJA8uJy/YVYtuLjQcvX4i9qNEnPlfO4b7HZzxC5eIA0KO9Xru4
   XdErOlWr4eVwz8G7a1HdtKUxHLMgSm6iXSLEGlJldrhDjoIq6Y4DXQrRw
   TDygselXhZF3LaPanXZVglP0VD8x4HRFlL8m73WMOeextcKXGjZJW/JP/
   w==;
X-CSE-ConnectionGUID: bUKIMcEQR6K6Ho6UI6hA1g==
X-CSE-MsgGUID: ECfSMgjsR6S9GesVgz04eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49592929"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="49592929"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:44:55 -0700
X-CSE-ConnectionGUID: AJc6cBIyRyeoUosASMyRMA==
X-CSE-MsgGUID: u4mhKX5cQ2mfgUW0ncJ9qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="141431776"
Received: from ssuvarig-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.23])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:44:53 -0700
Date: Wed, 21 May 2025 19:44:53 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 3/7] x86/bugs: Exit early if return thunk is already set
Message-ID: <20250521-eibrs-fix-v2-3-70e2598e932c@linux.intel.com>
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

ITS and retbleed can both set CDT return thunk. If the exact same return
thunk is already set, avoid the warning and exit early.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 20d7d14b08298d4f610f2ebc7f13a490ee3d957a..a088302b320cf68344e28be7710b5a3582bba9ea 100644
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


