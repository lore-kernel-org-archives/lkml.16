Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3013A221299;
	Fri, 11 Apr 2025 12:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744374244; cv=none; b=bRTaBYOW9sSiFZEBuUYWy61mIRmjjZEPD0xTrWP/dqF2ZWGlwtP8zDvVSQAwuKXOkO2zfy5kDlgQyHSj4OPLqJW850lExBtw1HwVSYhk+jIQbZ9Jmi45srU3ejUQyfeQr0RRDcb1GlEuduAdHj1Bk3sfpoOly0B59qzdxf1CNF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744374244; c=relaxed/simple;
	bh=IdaYWxAcBmp0GWp0ombnuMCothE6G1nJdec0JBFVcqk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NiW9YFvRgohrb+SkNcg1p5AO6JCvM1FhBI9VzegWKRAhHkt87+eiZjJQfmpIJUSJ4cXZos+X1ccGHyXrC/AcIsbALxFiGwGmc8upllJJJuP/zYfg1oZGhNfsMzzq5umU9YcnqSvn6XfXjQlE39eDvAC9GT/zkqRgzd6aJ5qHtHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXIV2Gdh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXIV2Gdh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744374243; x=1775910243;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=IdaYWxAcBmp0GWp0ombnuMCothE6G1nJdec0JBFVcqk=;
  b=VXIV2GdhhxCYvfKxXkWYdt5Tk9wSBkrDTI9IocF23VKK5VENGe+zmiYE
   qQ7kF9gNHfBksVOBAVFLGjGJwQ9oAmA1L2R1wQqsldq9bBf4ia1F8M7q8
   ExzGzoQsFo8rcksYcpKjac8PRvO3qVhr1QdnaoIwyFW71UIMbIth+G080
   iSjC8G1i9nZus3ASCTLfwMWSONaXTrg5lF5EPWis67Cwi2uU8PRuzDWub
   wxUTtNpa61Uq1VAddpWNhOgFypEhnoHCb2sAOns+NR40CsCiscSGE1P75
   7oAEAyxc04HHP+dm5Qty54gVouOFpgPr5dxHqO4d67PF/msrrNcVnKkXx
   Q==;
X-CSE-ConnectionGUID: PKxcYeW6TI22znb0a6jSLQ==
X-CSE-MsgGUID: NuxUaMCBSJOsKEJNFbhxEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45937021"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="45937021"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 05:24:02 -0700
X-CSE-ConnectionGUID: 6AmRGqbBSFqTfthRqTsH0A==
X-CSE-MsgGUID: G0HKKgtvRX2zYLdoJJ8T7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="133942396"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.51])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 05:23:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>, Kurt Borja <kuurtb@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
 Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
References: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
Subject: Re: [PATCH v7 00/12] platform/x86: alienware-wmi-wmax: HWMON
 support + DebugFS + Improvements
Message-Id: <174437423366.3859.4617952203843157795.b4-ty@linux.intel.com>
Date: Fri, 11 Apr 2025 15:23:53 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 29 Mar 2025 04:32:17 -0300, Kurt Borja wrote:

> This set mainly adds hwmon and manual fan control support (patches 7-8)
> to the alienware-wmi driver, after some improvements.
> 
> Thank you for your feedback :)
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[01/12] platform/x86: alienware-wmi-wmax: Rename thermal related symbols
        commit: 8a1a0fb55f8a8e482314d2769a9cac0703016fd4
[02/12] platform/x86: alienware-wmi-wmax: Improve ID processing
        commit: a000da9dbc249642233587a80df03130e8983d10
[03/12] platform/x86: alienware-wmi-wmax: Improve internal AWCC API
        commit: 45983d19f305a562386f4d13accd11056b99f48a
[04/12] platform/x86: alienware-wmi-wmax: Modify supported_thermal_profiles[]
        commit: 77bb2ec55700ee3af0cd902398fa903363826679
[05/12] platform/x86: alienware-wmi-wmax: Improve platform profile probe
        commit: 32b6372ddd4385a47a6a4b6ccff0c22b7be8765a
[06/12] platform/x86: alienware-wmi-wmax: Add support for the "custom" thermal profile
        commit: 3dde0ae1eb5f00c1d61959d1fcce2b1b46ccc199
[07/12] platform/x86: alienware-wmi-wmax: Add HWMON support
        commit: d699907834959c87a6b6c5214d5e9a3e8ba6b5a1
[08/12] platform/x86: alienware-wmi-wmax: Add support for manual fan control
        commit: 07ac275981b1f11a58dd7bb7790eed66252b072c
[09/12] platform/x86: alienware-wmi-wmax: Add a DebugFS interface
        commit: b028fb497c152febbdc48b544aaaadbe06406dbf
[10/12] Documentation: wmi: Improve and update alienware-wmi documentation
        commit: a56d188a0a8f3df4860acf66a6af89318ce611be
[11/12] Documentation: admin-guide: laptops: Add documentation for alienware-wmi
        commit: 3e48767ab53b56d31c77a063d022ca9aca43bf22
[12/12] Documentation: ABI: Add sysfs platform and debugfs ABI documentation for alienware-wmi
        commit: 361813db5d9ba33434754c0de1207a2b91264ab1

--
 i.

