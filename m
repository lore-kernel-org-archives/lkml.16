Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2BD2698AF
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735796; cv=none; b=gD5RFHmUCPzOnOKd4DRe0KK0iZExDCJd4jghOu5S+U6Y7qY9ehder+YEkCue7cQrKx5yE7B+uIomOYzaBMgWLqOo3VxAdusgWjq0/KCfWKhg9t1qGRIu38O2qvRyVFmzzBRLekrFPFzdje1VWk/4TzI2IeR2LUVhhBTeiDuzSlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735796; c=relaxed/simple;
	bh=0PA8gOT5qlDi4EOK5CzsQ2tUFLu/eRBQa3JY9IJpy/A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BVIt2t04kPNXsfZv4dBVkAM4rXHQpLppc9rRLgmyGDHobje3wYKBkmUgr2In0VN2HWn5iYyLaoAhn7VRtnQul9oW3CVUH2V8XQQgdv3Mc3D3RFFJAxmsf7ZkUsLEeoCxLMz5963AFolDP+zk2qGdC/V7ong8goRHWePYPd7GFnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/dd1pkP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/dd1pkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747735795; x=1779271795;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=0PA8gOT5qlDi4EOK5CzsQ2tUFLu/eRBQa3JY9IJpy/A=;
  b=B/dd1pkPVWtH7jkPkXjV49wfrHse3a8jo/KtfEbtYukPY4WCSWIj9+fq
   Dpiwksd36eFheq/KVRjkYGgOmZamuodEmz8GxAmz1YRoM3w7cpt/UllqY
   G655Id1ugHH8z9Hs/WnaziMcG/lzJrbixQHFEeONB6g7p/XIU3MyHGLAn
   zjs8kS6TTl3EpTESGslCJ++JJ+UgieUPwv7eYnmBx11oWt8syOnKM23kL
   qtdy3WKXjlzs4wma2SWLK2hRpfp89jvEbe7BVTpubS/cYYbilAfk98Ui/
   18heoyu5NOGuChTi+6FJwBJTOTeuRUJVjj4+sbpA9FmhfJFzX3YZ/pTIp
   g==;
X-CSE-ConnectionGUID: zqyPXAqyQaqctjN8TjU5vg==
X-CSE-MsgGUID: 3dYp32zjSmmThhudIxMfIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49725664"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49725664"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:09:55 -0700
X-CSE-ConnectionGUID: ADek4IpGReaPfJVxkT8tXA==
X-CSE-MsgGUID: Ondfzp86SAuYF/zZKs7E2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="176774054"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.168])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:09:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
In-Reply-To: <20250519-singing-silent-stingray-fe5c9b@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
 <87o6wfwcef.fsf@intel.com> <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
 <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
 <875xi3im1r.fsf@intel.com> <20250519-singing-silent-stingray-fe5c9b@houat>
Date: Tue, 20 May 2025 13:09:47 +0300
Message-ID: <87sekztwyc.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Maxime -

I'm cutting a lot of context here. Not because I don't think it deserves
an answer, but because I seem to be failing at communication.

On Mon, 19 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> You still haven't explained why it would take anything more than
> registering a dumb device at probe time though.

With that, do you mean a dumb struct device, or any struct device with a
suitable lifetime, that we'd pass to devm_drm_panel_alloc()?

Is using devm_drm_panel_alloc() like that instead of our own allocation
with drm_panel_init() the main point of contention for you? If yes, we
can do that.


BR,
Jani.


-- 
Jani Nikula, Intel
