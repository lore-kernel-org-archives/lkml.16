Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08292AD14;
	Mon,  9 Jun 2025 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749463471; cv=none; b=KSOcPvd5loJGNnM+XeU4x0tZH00OLjmZWxRqyhrq5ZuQh5ZBwXSo/UNte0IJ4E2UHrAIwqAtZK/2Wef3e1yqxP5mu2zgMU2VEfFd7bC6pC7zNbrv7G8uXhE6i+Sic/Jy0eVrB6ZkMeQ+S7xDWKLHGEO2MddPOyg+1drxdC0/U1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749463471; c=relaxed/simple;
	bh=xA/k0GHRhOpNaqNOgCivX4AoaTF5llgmSIHoIT01l+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eWTf6S+bAR5kK/rr6wyWWqljOq1joK3lcyKEI8eUjhRE2GxadyOiQibjj/lBDGmc4RlEdZhomMPWXyKxkV4UhXL9AqqD/w0HeDoaDyTmZkhbsDbLv2ivisrbWq+rGBX16t3I8yRYyw1lWGuT4eQSIpoRytQgxf/ivME6o9Z6M+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxkkWr+w; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxkkWr+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749463470; x=1780999470;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=xA/k0GHRhOpNaqNOgCivX4AoaTF5llgmSIHoIT01l+k=;
  b=TxkkWr+wMMNn3XKi2A3dKfg3SXGI+ffkNpp4ka7+UsG4MwL/rXTDtuEP
   w7ovVwmyIbkm6UZDiJBKusof89RDPDtRikm0SIgmqGoA+w9NR3fprjUhq
   lQj0VDirZu1Nyxja9XqSCj9IIofmOzKapU4gLGo3gLc9cZt4hZ6ywW6o7
   Aep6whIXXSGMHcV8v4WmBZ0y1ihN1wxb69cfC2QlnvKQ5N3H7Fl3NWt6F
   bQnPgMdII4oUfLIO86ycq2udbXSFc0slsPEkeLZBFoXoJc2DXr4SCEwFy
   ccSeoyeheQj5R/OvjJ7zgPdt8dWaevA0yKXtUU0rjtaFTaTNcGI406I+q
   A==;
X-CSE-ConnectionGUID: KB7nY+AyTzWwonHUiQ8CXg==
X-CSE-MsgGUID: 1gdD2LCwSUmz197SgvNHcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51529387"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="51529387"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 03:04:29 -0700
X-CSE-ConnectionGUID: oLSyDNZrTruMIeefQI/Jxw==
X-CSE-MsgGUID: qcpKczmYTsSk3aW3cymMzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="177406123"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 03:04:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: irenic.rajneesh@gmail.com, david.e.box@linux.intel.com, 
 hdegoede@redhat.com, linux@treblig.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
 dave.hansen@linux.intel.com, x86@kernel.org, 
 platform-driver-x86@vger.kernel.org, hpa@zytor.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250608012512.377134-1-linux@treblig.org>
References: <20250608012512.377134-1-linux@treblig.org>
Subject: Re: [PATCH 0/3] platform/x86: intel_telemetry: Remove deadcode
Message-Id: <174946345966.3675.2007813244363355783.b4-ty@linux.intel.com>
Date: Mon, 09 Jun 2025 13:04:19 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 08 Jun 2025 02:25:09 +0100, linux@treblig.org wrote:

> Many of the entries in the Telemetry core driver are not called
> anywhere, and haven't been since they were originally added in 2016.
> 
> Remove them.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86: intel_telemetry: Remove unused telemetry_*_events
      commit: 22428723a27e6ee03dffd86ba62501bffe5b4c78
[2/3] platform/x86: intel_telemetry: Remove unused [gs]et_sampling_period
      commit: 2ad029bde3d4dd7787483f646384a93a95922cf8
[3/3] platform/x86: intel_telemetry: Remove unused telemetry_raw_read_events
      commit: 458957b8e3d552701cdb55ffacc38627d2039fe8

--
 i.

