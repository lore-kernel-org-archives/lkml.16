Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AAF23A98A;
	Mon,  7 Apr 2025 11:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744026680; cv=none; b=jqbhJHGNea98kiblJYVFTh79nkki6w0KamRZfG8UbM+zvvmqlroawsM4l6a8Jisb47l3ldHWVZr73i97LXfF4xwX2HWfS5WUkR3k73wbeLiQtjZgX3ggqlGOcTmyjAm7bqoI0qGvldSgLXVXV/ywPhYyd5jhAG+5oG/ob4oTO7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744026680; c=relaxed/simple;
	bh=Ik3s3Zrm66CWBd2uHsVOVNJBfGhDtUFb3oOjqByk5iE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vrk4k1OY/J1FCjTPVmZzNhBUP60FoyUQvH0uIwVTNuKOPzWCduP6PjF4Ct2EuEZz0FUFjJlEhP7YG6hJA3UNBD9MgEXqcBWeRrlme7rYfeWgaeyRGjIV1hAiKvKOeiCMQ8WTADeDgK6038QbvCywCM49QcjB71bDNqwOWhXd3L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nm5H3CY4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nm5H3CY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744026679; x=1775562679;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Ik3s3Zrm66CWBd2uHsVOVNJBfGhDtUFb3oOjqByk5iE=;
  b=nm5H3CY4J342u68AgyUFtBy01/evPR15S9NGIqSRGWOrnWaq/Ra7BB+J
   2rAbiZCwqUjRpftQ4tJ530TfIsM0XI1q3lyijZwPRC4k68n+7pM6aElEn
   pj2+vh5H9oGni76ApAgnESyOm9qmjBd0q27f66gFTcdu9aY0iHXpDffVc
   emdK7Kk4euaTVPBnISDKS9HI4bRsaAmgCLEnBsHGBPc1dT4mOgE9czeaS
   E6Q/pTUgKgHJK3yhSxjw2gsRyErIzGqTWciqlCAIAIqDM07VTqUNGU755
   fUwZa3M59fX2GjyIZU4J506mVc4wXBaGXVoDPIH3Rp5YOl+6Oc5J2GF8g
   g==;
X-CSE-ConnectionGUID: 3nPEeTzxTE2ud3CeNYMSeQ==
X-CSE-MsgGUID: VXxQDtMuQryrou8ncbOAOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45499628"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45499628"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 04:51:19 -0700
X-CSE-ConnectionGUID: WImpXkGZRc6sKC/XWFNbfg==
X-CSE-MsgGUID: ffyjnnGDQ267Y9MuZMaxKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132071774"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 04:51:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 David E Box <david.e.box@linux.intel.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250313085526.1439092-1-yong.liang.choong@linux.intel.com>
References: <20250313085526.1439092-1-yong.liang.choong@linux.intel.com>
Subject: Re: [PATCH v2] platform/x86: intel_pmc_ipc: add option to build
 without ACPI
Message-Id: <174402667086.2623.12054422494397087928.b4-ty@linux.intel.com>
Date: Mon, 07 Apr 2025 14:51:10 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 13 Mar 2025 16:55:26 +0800, Choong Yong Liang wrote:

> Introduce a configuration option that allows users to build the
> intel_pmc_ipc driver without ACPI support. This is useful for
> systems where ACPI is not available or desired.
> 
> Based on the discussion from the patch [1], it was necessary to
> provide this option to accommodate specific use cases.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: intel_pmc_ipc: add option to build without ACPI
      commit: d8455a63f731b4f585acc4d49fd7ad78db63b3d0

--
 i.

