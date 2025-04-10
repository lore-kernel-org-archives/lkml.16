Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA8E202C2A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744286219; cv=none; b=hD3uNUFOD+pfaQ/lR804vWt06+NMcTsy7tDQV+tIZK0j5OCTIpWJ/oMyDN2v3RH2RL/wgeXgTdyXyUXr3CM1lNeCS5MfpX2VGFTP+8Jed9JXt31EJ43w2opTGqZGqy4hD9U0sK1ngjEwjFGLV4jdGeLfNibaVymhOBxV5y4JZ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744286219; c=relaxed/simple;
	bh=CKmXBG/PEPzPtlg0BOUFBWyPS0pYatTRE4/PLiHDvaY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nlGgleOpyc4vJi5GASRIbtOXC7fXoMfEUozTxlMVGDKTSFo7kmKkfHmWlYVCR0NLoIukLl3DASmXAsYChoi6LKozY63xkU5G8abHAFw1EYklifRWSfKshsWFwA3sb1bo57Ia8ZI0XxVLz5nPpXxUouneoBWH4YJecth/MPZFm20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=duSWxbak; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="duSWxbak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744286218; x=1775822218;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=CKmXBG/PEPzPtlg0BOUFBWyPS0pYatTRE4/PLiHDvaY=;
  b=duSWxbakaDCPhy7Euesu6Bp9N1WQCxmyNT75fRfsBiW31dRXU6RypSFY
   P+XJtGmdNLfWm9lPNdpjt8G+Zp99LhMcBp4yf4qkLNIR0Dt/uFB6zV/Zm
   eYJfEm+rGHOdEYvM7JAFb3WT6p7ncFLyzlPAZzoyK1/fkv5YY6ucCMff4
   PF2Lmv/TkvB9CltZIeEqv7queBYU/9xbHOD8C0h8hOzxbpUXMpQK+58oq
   tmGUanZqHl3AZdUMoVEw46Gg87b+Llk+PGOxqSQdQ5Au75ndM+GQR/3MT
   4LykKXO8q8XwUm2rGQl+5k0fAYDS0zJZe4f+LFhr/eVxySLkDnr3P2K1R
   w==;
X-CSE-ConnectionGUID: DE2JAZtlRzSRFYjuqOiDeg==
X-CSE-MsgGUID: JHvLhODyRPmIuMeCdvR9Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56779812"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="56779812"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 04:56:57 -0700
X-CSE-ConnectionGUID: sVWlgKpJSbOVORIwhWAQ8g==
X-CSE-MsgGUID: QxMeLRLzQAK46/UYuAbt1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="129427726"
Received: from unknown (HELO localhost) ([10.237.66.160])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 04:56:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Matt Coster <Matt.Coster@imgtec.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Frank Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, Alessio Belle <Alessio.Belle@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/10] drm/imagination: avoid unused-const-variable warning
In-Reply-To: <7ae4be5c-b115-405e-aa57-caeaa206775b@imgtec.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <7ae4be5c-b115-405e-aa57-caeaa206775b@imgtec.com>
Date: Thu, 10 Apr 2025 14:56:48 +0300
Message-ID: <87mscout4v.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 10 Apr 2025, Matt Coster <Matt.Coster@imgtec.com> wrote:
> Having said that, surely it makes sense to keep at least
> *_debugfs_init() gated behind CONFIG_DEBUG_FS?

If they're basically just calls to debugfs_create_{dir,file}, the
compiler pretty much turns them into nops, and you'll get better build
coverage.

BR,
Jani.


-- 
Jani Nikula, Intel
