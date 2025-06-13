Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955E0279DB0;
	Fri, 13 Jun 2025 08:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804511; cv=none; b=tNtYuvLj1GrBJjLavyHfbBtwOkaZc9vYNa6IDiT4MZlPXpV5rNksE+EbOITU74yMrE+erTqyO38dko7Gw96dPbaByrcPLlVxlf5D+bViVRMpZDdiMZektNsQr15bTuGM3cAJhoX/xX3dyMHlETTLMBXMN23Y0GhFpffrgRJza/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804511; c=relaxed/simple;
	bh=ii9mJGPrdiEf6M11++Ri3L388P4ein6nqY804ksJ9ww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fsOEYRThHimZXHMIKY3Iz8jFDTvOXnWfv6uwFRb7PuWfKwZiZr4do8S7ri3dDSJ/A+n8bbHiEKhXuqAfd4NG/bKHljGrN3BXketB4TEJRdNgwBjCMCGBrupd/vZ9L+Kzy9QaQugeGzNTplCFts2V3En7+WToYXMtKebPVar4okA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWAy60Fb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWAy60Fb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749804509; x=1781340509;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ii9mJGPrdiEf6M11++Ri3L388P4ein6nqY804ksJ9ww=;
  b=nWAy60FbnsECxj0UVHpXaH5Sdg+sw5jCgXyqv7DklX8tVYzSHUgeMKoV
   h86tdeJEQx3S99T9uRoX+EK7h6s1QEC1pkPo+Rj/vogse33cNnXaEzZ4V
   3AC9hFAWFaoPysGvgm69tsrudxQs/73xYiP2wCYqw/qNtqrIUQV990Q7w
   TwHNsQerdee6iWKWm6Tk81q5Xpp6viK6XbQUJp65IjqlTeBJU6jO0RKEn
   eXmhegf1EygjFHzTQdyYUAcHRnnS0AXA9okxDRFy7xNuN6okr8KTsucid
   P71xQOToRVCrEqbpLuSyHhQuH0lFfKUSal05nUxb6kh4oSPnd1B2iF3s6
   Q==;
X-CSE-ConnectionGUID: nf7VjoewRiq5ysWGAY7T7w==
X-CSE-MsgGUID: kcXTYfkCQd+L6gmdUv6Ljg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51993215"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="51993215"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 01:48:29 -0700
X-CSE-ConnectionGUID: 3yksSGsWSD6Yf/MyVUAN4Q==
X-CSE-MsgGUID: Y6e25UhET/upSLsiqEP5jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="148659601"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 01:48:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Tero Kristo <tero.kristo@linux.intel.com>, 
 Peter Zijlstra <peterz@infradead.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250610093459.2646337-1-arnd@kernel.org>
References: <20250610093459.2646337-1-arnd@kernel.org>
Subject: Re: [PATCH] platform/x86/intel-uncore-freq: avoid non-literal
 format string
Message-Id: <174980450175.1640.12062242383746628445.b4-ty@linux.intel.com>
Date: Fri, 13 Jun 2025 11:48:21 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 10 Jun 2025 11:34:55 +0200, Arnd Bergmann wrote:

> Using a string variable in place of a format string causes a W=1 build warning:
> 
> drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c:61:40: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
>    61 |                 length += sysfs_emit_at(buf, length, agent_name[agent]);
>       |                                                      ^~~~~~~~~~~~~~~~~
> 
> Use the safer "%s" format string to print it instead.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel-uncore-freq: avoid non-literal format string
      commit: 0c44b46f51a17baa7ab67de1464427116e9c4eaa

--
 i.

