Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AC8230269;
	Thu,  3 Jul 2025 08:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530246; cv=none; b=YNd5MMS9B62qHbW7Jn2RMhJGxvghT+xvCZ4HJL4yolKyKUSSzfowscgpQhbMbNJpfkniVto2BYfhH5XjjgQ/TGL+qec12hEXjUsE63egE0/jhHvkSuatvyUImlENreW9RsuvCKHTqypITNMnvKSl7QheVxfZWZtC9M9dizIe5Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530246; c=relaxed/simple;
	bh=ES9WNXtED/M/r/PA5S0ZgBNNr5KO2tttnieFdk0L/6k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Qbsi2inFShIbfy9x9Q5+DtI3O8OiLfYC7dVNHbIXRV+P/GEFJFKVHcDb+1n72jPlo4QfVxaHNZT88hekpTq8Gq0L11xxv9jhD3tOv37Zp3VUr1ZE9IQAwoOshk84mWpSy6aYutzFuNGmzR6Hjs/8uVRqLKUTTXsAcGRSWyuRQ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OebRz7Hj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OebRz7Hj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751530244; x=1783066244;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ES9WNXtED/M/r/PA5S0ZgBNNr5KO2tttnieFdk0L/6k=;
  b=OebRz7HjOpwQydQhq2aaq/6aHnPGRGrMKy47zvOZUdWa3+XQloAmb1e5
   EEOvdEEtALRWEiH1pj2vM9HrEL5xN96y0wAJTrOz9SZOBl0SXrZ5IG9x8
   XMnWmxeX8fdgMMCcC2wCVDv9aF7BdsHNPgP2E8jv+dn1Es5y3VaqmeQH+
   K+ERNclRyZ54LltrobQoE5bbr6vV9cVR4Wqk7B5Dnl7hj5VujUS+hQMrn
   U6+/14o0UgxmWdjMQZT+yveHxWM4tmuLN3vbPdWRvaGFjD6pL9xn0ZVT+
   F3KK57k2buWT4uwiNk/M7bo/9G+vys/D5kN8boI9Lp4F4QWL36+/tIXgy
   w==;
X-CSE-ConnectionGUID: 3oN0ePt4Qr+jTeP8KRFb8g==
X-CSE-MsgGUID: fM3qdGtlTmaj2+JBUa42zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64541990"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="64541990"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 01:10:43 -0700
X-CSE-ConnectionGUID: POJ9CclPTXOmRURfL0e0Ew==
X-CSE-MsgGUID: omZXS1TKSaaFb/5EE1LdJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="153718503"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 01:10:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 srinivas.pandruvada@linux.intel.com, andriy.shevchenko@linux.intel.com, 
 tony.luck@intel.com, xi.pardee@linux.intel.com, 
 "David E. Box" <david.e.box@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250703022832.1302928-1-david.e.box@linux.intel.com>
References: <20250703022832.1302928-1-david.e.box@linux.intel.com>
Subject: Re: [PATCH V3 00/15] Intel VSEC/PMT: Introduce Discovery Driver
Message-Id: <175153023646.8357.14828595218757501837.b4-ty@linux.intel.com>
Date: Thu, 03 Jul 2025 11:10:36 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 02 Jul 2025 19:28:15 -0700, David E. Box wrote:

> This patch series introduces a new discovery driver for Intel Platform
> Monitoring Technology (PMT) and a set of supporting changes to improve
> telemetry integration across Intel VSEC features.
> 
> The primary goal of this series is to add the PMT Discovery driver, which
> enumerates and exposes telemetry attributes by parsing hardware-provided
> discovery tables from OOBMSM devices. In particular, the discovery driver
> gathers detailed capability information (such as telemetry region
> attributes) that will later enable direct access to telemetry regions via a
> new API (intel_pmt_get_regions_by_feature()). This API is crucial for
> retrieving data like per-RMID counters.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[01/15] MAINTAINERS: Add link to documentation of Intel PMT ABI
        commit: fb1311b3f171bbb3c07cc7764ec981605564c83a
[02/15] platform/x86/intel/vsec: Add private data for per-device data
        commit: dc957ab6aa05c118c3da0542428a4d6602aa2d2d
[03/15] platform/x86/intel/vsec: Create wrapper to walk PCI config space
        commit: b0631f8a5740c55b52d02174cc4c9c84cc7a16a1
[04/15] platform/x86/intel/vsec: Add device links to enforce dependencies
        commit: 8a67d4b49bbdebcd255abde9e652092c3de3b657
[05/15] platform/x86/intel/vsec: Skip absent features during initialization
        commit: 1f3855ea7d6b03f68c2eec7a0bcd537cedcc6680
[06/15] platform/x86/intel/vsec: Skip driverless features
        commit: e4436e98672c7993cdfd7743efd0fcaa8df7cc17
[07/15] platform/x86/intel/vsec: Add new Discovery feature
        commit: 10f32796e86c04f73b7f8580cc9483765ed19f49
[08/15] platform/x86/intel/pmt: Add PMT Discovery driver
        commit: d9a0788093565c300f7c8dd034dbfa6ac4da9aa6
[09/15] docs: Add ABI documentation for intel_pmt feature directories
        commit: 2e7ba52110ef15d29846b40eb28b400f1fb1834a
[10/15] platform/x86/intel/tpmi: Relocate platform info to intel_vsec.h
        commit: 934954df0f44de5e10afc1af84c06f78149f15fe
[11/15] platform/x86/intel/vsec: Set OOBMSM to CPU mapping
        commit: a885a2780937afac4f31f00d11663f50d05dfb35
[12/15] platform/x86/intel/tpmi: Get OOBMSM CPU mapping from TPMI
        commit: c9699057521834862616ce159a47bd33920f0d9f
[13/15] platform/x86/intel/pmt/discovery: Get telemetry attributes
        commit: 86fc85c75bcd9b0f28afadd60c9f890669b42ba4
[14/15] platform/x86/intel/pmt/telemetry: Add API to retrieve telemetry regions by feature
        commit: 42dabe5442887946b16e64c6ebe91d2671a96fbb
[15/15] platform/x86/intel/pmt: KUNIT test for PMT Enhanced Discovery API
        commit: b9707d46a95962bb4e28ae1929015e419ad6aff7

--
 i.

