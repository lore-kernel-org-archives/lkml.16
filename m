Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFBB1E25F2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749663036; cv=none; b=oNbkPjSy1Dr9zA2LuV0dSdqkMfvDYNX3P6cxJwZ5jyxWOwsQuMwI3wnCt4K9PPzJlvqA0fVFEHPnPqZgDNwGjvJgt0ogTDb7o+yFK9NSFBdB1G+QVNV0MbM5De15aKIPMnlBs3461ZDhQy154z9Q1cpcRDYYBPoYpb1eSNv7U98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749663036; c=relaxed/simple;
	bh=vNRGRinhyFToBiOjC7wbVvh1/gHG9xRZS8Ltocc5jv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=so3XylmUPosZutboHq/CvWx4BSTHwup+cDB2vpyXgAHclvSleh6EzVyWYG85YVOh4nAWn1xImzmIWZB+cEOjioenRIoiYE2F5s0klcDabK4vIn/df08j9rwwRXLz+o4q+cUJNUF3Z8SbJElbEwkC3230gExWRJyylOac93IkQ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnvC3JY6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnvC3JY6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749663035; x=1781199035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vNRGRinhyFToBiOjC7wbVvh1/gHG9xRZS8Ltocc5jv4=;
  b=cnvC3JY68259g/1uaKwF3jjVikr9CBy4YrUZxBTeyI5DsOCUW/qpz5tv
   dWXBvUbzREj2RUCC2+mUPG6yIUZoQSKOxIiVH2HKr0/dwWyEH2ut6dyRc
   tzNJ6m50PcQ83/TL977XPM81svYsuof2jXT4dM24FGOj3nEKQSPEOdmS8
   Xh9OJt2O4ELKXG5dwsb2PtDEOV47DjGj+EOONpTZtBmshefjWK2uinD9x
   dLbe/xEqwZtLUl/VzN/3tRUdeq6nmrppMdxJ0I0T8Ny4ZZv2ixQfveYG0
   3GUxmaiPVyXrRltbgZK/ipsJfgynDD783Sq8eIHBgQ/cGduD1loBxpe/L
   g==;
X-CSE-ConnectionGUID: YpJHk1oWSZiA/H6eUXa5bQ==
X-CSE-MsgGUID: MSa8634XRVit8s660y43sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51961822"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="51961822"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:30:35 -0700
X-CSE-ConnectionGUID: 9AjrZvgJR6aSO7MjIj5UPQ==
X-CSE-MsgGUID: sTQr29vbRCS2PatI7x5bIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147140881"
Received: from chhatrar-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.46])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:30:34 -0700
Date: Wed, 11 Jun 2025 10:30:33 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v4 7/7] x86/its: Allow stuffing in eIBRS+retpoline mode also
Message-ID: <20250611-eibrs-fix-v4-7-5ff86cac6c61@linux.intel.com>
X-Mailer: b4 0.14.2
References: <20250611-eibrs-fix-v4-0-5ff86cac6c61@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-eibrs-fix-v4-0-5ff86cac6c61@linux.intel.com>

After a recent restructuring of ITS mitigation, RSB stuffing can no
longer be enabled in eIBRS+Retpoline mode. Before ITS, retbleed
mitigation only allowed stuffing when eIBRS was not enabled. This was
perfectly fine since eIBRS mitigates retbleed.

However, RSB stuffing mitigation for ITS is still needed with eIBRS. The
restructuring solely relies on retbleed to deploy stuffing, and does not
allow it when eIBRS is enabled. This behavior is different from what was
before the restructuring. Fix it by allowing stuffing in eIBRS+retpoline
mode also.

Fixes: 8c57ca583ebf ("x86/bugs: Restructure ITS mitigation")
Closes: https://lore.kernel.org/lkml/20250519235101.2vm6sc5txyoykb2r@desk/
Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 31f3db0a514ea3d6e2513c0f6e072b84e0117f08..bdef2c9aa1b8b85a8e0ee7c959ea7afde81d443e 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1126,7 +1126,8 @@ static inline bool cdt_possible(enum spectre_v2_mitigation mode)
 	    !IS_ENABLED(CONFIG_MITIGATION_RETPOLINE))
 		return false;
 
-	if (mode == SPECTRE_V2_RETPOLINE)
+	if (mode == SPECTRE_V2_RETPOLINE ||
+	    mode == SPECTRE_V2_EIBRS_RETPOLINE)
 		return true;
 
 	return false;
@@ -1281,7 +1282,7 @@ static void __init retbleed_update_mitigation(void)
 
 	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF &&
 	    !cdt_possible(spectre_v2_enabled)) {
-		pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
+		pr_err("WARNING: retbleed=stuff depends on retpoline\n");
 		retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 	}
 
@@ -1454,6 +1455,7 @@ static void __init its_update_mitigation(void)
 		its_mitigation = ITS_MITIGATION_OFF;
 		break;
 	case SPECTRE_V2_RETPOLINE:
+	case SPECTRE_V2_EIBRS_RETPOLINE:
 		/* Retpoline+CDT mitigates ITS */
 		if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF)
 			its_mitigation = ITS_MITIGATION_RETPOLINE_STUFF;

-- 
2.34.1


