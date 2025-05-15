Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35352222C3;
	Thu, 15 May 2025 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747309601; cv=none; b=F7565AhxG+9Nbypm+yJmVvV+eXsl9B5fecMEoBVyowOFbsPDtsYoiFo2fxQwd1Xih67reNKfRs3GQnHIGDO/uQUoKkl5/WpUr1pPbPArRlnHtsBvFLdz6iotdc1tj+wzTNOl/zp07d15T9iQX4wV383i5N9p2u0PzsuK6j9zLew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747309601; c=relaxed/simple;
	bh=fUtdb1ZBLSNxOPTuGClCZkpTsX8/OnyIZ17b09HUUn8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mL6p63LJKc370Di+SJeNFzlSzjauoPEcYxFduHcOqlLKZV2+w+lkh8sa4wbiHcbfLVeI6UCvtFIUXdGonR5AASnewDE9W77+61TclO52jQDS6H6V6igCTCKZc3SW1nykVD+aOjeJAEWlj3oP6SEV48MVz7BdVf9URbKeOqOe2d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ta26EHQG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ta26EHQG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747309600; x=1778845600;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=fUtdb1ZBLSNxOPTuGClCZkpTsX8/OnyIZ17b09HUUn8=;
  b=Ta26EHQGhXBYUB+C2TPgtKl6jhmNBoZjhcju53dzf5A1HYDsEh8s/rmW
   c/jPxYFfL7RS6+3DFp8a0mPfLJSxLzrF6qfVk+YFOkNIgSGxiF2zRDmky
   xIeJ+Wpu73PGg/mJnH/fBvTst4OdmQmgXFkyX/hiUNA0Z2On5X51ZFQA9
   J0SuLJWfxAEIYObokdhzKYnuMQp8lVFaWdJE3x1yVr32zVh3GPgl7PgvL
   /tYJm/MMDd71O6TgK32uSJARp8ugMoK2I70pX4AIgFR6WNq8WmV/Kr5I2
   wtufnKDMQFJnFHW92y5ikqBbVfqHCdknvy8Kab/FnhRhk62dYz/a0vNra
   g==;
X-CSE-ConnectionGUID: glBsl4/1SLGt9qu5XkavuA==
X-CSE-MsgGUID: JdfnAczuSNeOr7ZaVqoDgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48357276"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48357276"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:46:39 -0700
X-CSE-ConnectionGUID: hJHve9/NTMOjfvIgjAAtHg==
X-CSE-MsgGUID: 3RhB2/lUTwWpip8Ru2n/xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138226205"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:46:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: jwoithe@just42.net, hdegoede@redhat.com, 
 Valtteri Koskivuori <vkoskiv@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250509184251.713003-1-vkoskiv@gmail.com>
References: <20250509184251.713003-1-vkoskiv@gmail.com>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Support Lifebook S2110
 hotkeys
Message-Id: <174730959183.1777.1876414558560379948.b4-ty@linux.intel.com>
Date: Thu, 15 May 2025 14:46:31 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 09 May 2025 21:42:49 +0300, Valtteri Koskivuori wrote:

> The S2110 has an additional set of media playback control keys enabled
> by a hardware toggle button that switches the keys between "Application"
> and "Player" modes. Toggling "Player" mode just shifts the scancode of
> each hotkey up by 4.
> 
> Add defines for new scancodes, and a keymap and dmi id for the S2110.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: fujitsu-laptop: Support Lifebook S2110 hotkeys
      commit: a7e255ff9fe4d9b8b902023aaf5b7a673786bb50

--
 i.

