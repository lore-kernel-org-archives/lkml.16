Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3131F542E;
	Tue, 15 Apr 2025 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726379; cv=none; b=DtnKusp0N4dJpLwf3A/q6Ow5sFTGiSRdOpL9CVlf29wx66Wub2M6kNfLMwCTax0kuJBnFBRAPuiRxp/awS3E2QvquzlcciAI9PL3kWxGU0DZp1FqVUO3nzL98xOKRMT+LF618N6CWqPVbg92lCNcrsK6XAAHGCpDNPYfGtt8jxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726379; c=relaxed/simple;
	bh=aUP/kUMi8Z082dyPZvYBDWB9EHREgEJNVFx4GecoqiE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h0qAvljZ5+YXlsddrDuB6kbMiOmiBel2P9i1wFxfLJq2P2XgwyBCbGHRtQK+Hz8YGKXsz1uA3JaEk2nUCbjX5WM3XX9BhJ523WgD6V0hAKRBfOCv26p6XWVOXeiklQwEDsPWekLfoY6j+LhRlFnfpfkqDa5pmkpT2kC4W+1TzwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gn7zCr5z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gn7zCr5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744726378; x=1776262378;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=aUP/kUMi8Z082dyPZvYBDWB9EHREgEJNVFx4GecoqiE=;
  b=Gn7zCr5z4D9mbLdfmP97OFWgO7TasTI/ZP7ex6RnxE+WE0KiDKe5dUS6
   mJ3ihbyHTSuwWpr4CW5jxZD35CKIKJtVxvqgT+7cpidDuEOeyGV3Ll9iA
   EqjAr7Y52L5N5X5hAbrqmcABhZkEwW0r2IsqfRLFF+NXC/wXHL1Cpjbcb
   4Z/0WpJRObII+Leh2cezkvE75BLMGT8E295WvZ2M7OCGLRrFeJ4lQd5eo
   fFpojI7hvRylnMoYPHa7ZSV5+bFBePiu89XWSY34whY3PxhRkL62S0fgf
   jKxkKCvd+jRqVn1whWiXEZ8jpK5KnLWy2fD7NofZ0VJyJyElGjnxEvhGz
   g==;
X-CSE-ConnectionGUID: LwPeejYDS1OUIaKg4u+q5g==
X-CSE-MsgGUID: +1rKGa22RxaMby0u8rzJlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="45950374"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="45950374"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 07:09:01 -0700
X-CSE-ConnectionGUID: BHMaXnAlTFCz0j3YDCZyQg==
X-CSE-MsgGUID: 7va1/wEcQiughMQvSbBveg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130156450"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 07:08:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, lkml@antheas.dev, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250414140453.7691-1-W_Armin@gmx.de>
References: <20250414140453.7691-1-W_Armin@gmx.de>
Subject: Re: [PATCH v3 1/2] platform/x86: msi-wmi-platform: Rename "data"
 variable
Message-Id: <174472612899.1885.2285882661965787851.b4-ty@linux.intel.com>
Date: Tue, 15 Apr 2025 17:08:48 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 14 Apr 2025 16:04:52 +0200, Armin Wolf wrote:

> Rename the "data" variable inside msi_wmi_platform_read() to avoid
> a name collision when the driver adds support for a state container
> struct (that is to be called "data" too) in the future.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: msi-wmi-platform: Rename "data" variable
      commit: 912d614ac99e137fd2016777e4b090c46ce84898
[2/2] platform/x86: msi-wmi-platform: Workaround a ACPI firmware bug
      commit: 70f96b2762d8199102f881bab45f5f8f2ae9296a

--
 i.

