Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CD9218AAF
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424934; cv=none; b=pa1Q4V1gHj2snj3MF+PlE/raAUEHEMIGe3IBTnRtLclDkhGttyWuKZnIamAso65bunIN2Z+PjpN4eMYiRVy3icdBEhvX8wzAhyWHUOFo1WjncFowzyFcDvypl2iZbyrJ/8CcK3TxqpyqL9F2dxkerfenvZqm1qDOXlHj58ywKEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424934; c=relaxed/simple;
	bh=Tc3OsSurpH1z0gI4HzRiSDSFs/zdI+P7OXdjEkrhJJA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dMYqNedUQALgdBUGd/6c2dD9UriU9FEf+eb1tIpcM3lnbfkLo76pOT/H2YFwW3O0CYiNJeYH2miwldPEIUrvl0xXFkbULi5LtPiVHCT68Ht0uSmcmfVVifTOLpt60DYP+hPRx7hC8bbf3wnhLfbZpAxsVxYuBsr9XkON592l2cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gu3XtXWI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gu3XtXWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748424933; x=1779960933;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Tc3OsSurpH1z0gI4HzRiSDSFs/zdI+P7OXdjEkrhJJA=;
  b=Gu3XtXWIpAFG3hExvEFL/0gRBXZmaTVKjGLiYQ0n4NF1Q32i69sp7kOd
   lGo4YihAxeRqV6jq1Apet3EhYqJQwbZwXR16g+w8U0fiB+GSEP08nCcN4
   JC+XcmY+RpIJqZdIbZLzCgQKNXuC/85wgx9tSG4eYxw07fzPiqEAEa0pI
   Cm00P4xwsN+7JpWyWIfLv+JohBHn38tfxF3d5GOMMAQXiwGB0wNf19NBy
   CWXfgaCc/P+iNEDi6GC4FYw3eDNgIzPcxEdPaGBpDmQoQen7ZJD649jH0
   TiWHxg4eJMxpDlHRa+ZKKSQmTlVK7qzrk3zqlupS7LzY0vZCFuOCD03fR
   g==;
X-CSE-ConnectionGUID: bU+MPCFeQDmcSxS5STOCqA==
X-CSE-MsgGUID: lPSWGLfGQ2OlqVggzk4IhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="72976082"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="72976082"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 02:35:32 -0700
X-CSE-ConnectionGUID: XS4TX1aOSFq76kElmSZ4pg==
X-CSE-MsgGUID: WiBiIuMNRiyKaiuvGN+x1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="180423109"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.23])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 02:35:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.16-rc1
In-Reply-To: <CAPM=9tyv4CODKMbTW0Xwx4xYWgKPA0rMgThLgCy8OkF-DvVTNg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9tyv4CODKMbTW0Xwx4xYWgKPA0rMgThLgCy8OkF-DvVTNg@mail.gmail.com>
Date: Wed, 28 May 2025 12:35:27 +0300
Message-ID: <7aff9a7076ada15146d4fe60d2c6cd9d99370385@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 28 May 2025, Dave Airlie <airlied@gmail.com> wrote:
> The disgusting turds removal patchset is also in here.

I don't think it is. At least I didn't merge it. The existing thing just
still depends on BROKEN.

I had a few attempts at fixing it, Linus was okay with the patches,
Masahiro was not, and that was that. I don't think it's possible to meet
Linus' requirements of genericity without touching kbuild makefiles, and
Masahiro apparently doesn't want it in kbuild.

I still think what we want to do is reasonable. I'm not looking to
impose any header checks on anyone outside of drm, and not even on all
of drm. But I can't hide it inside drm makefiles. I don't know where to
go from here.


BR,
Jani.

-- 
Jani Nikula, Intel
