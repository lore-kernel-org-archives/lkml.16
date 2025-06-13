Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC302D239C;
	Fri, 13 Jun 2025 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809703; cv=none; b=slmkhR3rVcWragRsmmk2ummkknfXbKwCDtezdopeuMgX2CSCr10Zqz3vhe1zIt3sMVy/x/N1Blm3NmnHihhBvVGhPDMjRnkN9S0R4tNXMM50aJGpSKgpo4R211vn3IYtkGFKCdJzgG6x3Ym9bVmvmHv3k0vwdAbrA1QQ7dhnkY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809703; c=relaxed/simple;
	bh=YlLsluq3mXcNSZNlcrQ//1Xj7C/wlH96chhBrJyLBgk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UmI3nHoIV81tZ0l1q5YZE6971LrsSmnjyy5Oxu2Nd6hKn0SrA7WLO3N7A5fsP/GM72K9g95JL+jjTwQoQ+4BXLTS8eWrh1clZThkzG0h8LakpsAWkvJT/qfPB8TUtQEMlo4p1EqqoCuo2gTF5HYeCKEyq2PY1A7gR0H6ndP9Rcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDNtv0/Z; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDNtv0/Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749809702; x=1781345702;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=YlLsluq3mXcNSZNlcrQ//1Xj7C/wlH96chhBrJyLBgk=;
  b=TDNtv0/Z/k7+HQRgRG/NquTZmgyVo6YqsAFow7DL646hlkRLI0rJ64Bx
   XpYPgUi2HRpID+/YK9HATPnlXVeuNwe8PqoWQyyCNiOG97O4Kn3cdqBsR
   dBd60EGxHdDdcslh+Y0AjEsEEAyexbIZpHL8kUJAeqR8bdZa7DPXv5ZC+
   7ok7NKqqar1vtOLVwsg0twx9b3QozC5qfR+Vn1C6Ke1bOnKZ45JBwY9I8
   qtODmEbafrfutAfzYY62NNW2r8NeCB0xtiog2cZEul96k7gIXoJhHX/Hh
   tBaBmqAtoc3aYtEzQJGJ9wwgWKCM/dimLR55kWBozLLxn9LcQpzCA3eiK
   w==;
X-CSE-ConnectionGUID: o7nhCueGR82+GlCTFjchsw==
X-CSE-MsgGUID: 2brbrA3WQWOSSI3fQouB3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69595203"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="69595203"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 03:15:02 -0700
X-CSE-ConnectionGUID: e2W88mERT2SEtyL77VNuuA==
X-CSE-MsgGUID: a3ScIIzWQ06pz+McM3+tgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="178690147"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 03:14:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250610-yoga-aux-v1-1-d6115aa1683c@baylibre.com>
References: <20250610-yoga-aux-v1-1-d6115aa1683c@baylibre.com>
Subject: Re: [PATCH] platform: arm64: lenovo-yoga-c630: use the auxiliary
 device creation helper
Message-Id: <174980969410.26331.7330681024042786417.b4-ty@linux.intel.com>
Date: Fri, 13 Jun 2025 13:14:54 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 10 Jun 2025 10:41:07 +0200, Jerome Brunet wrote:

> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
> 
> Use it and remove some boilerplate code.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform: arm64: lenovo-yoga-c630: use the auxiliary device creation helper
      commit: d2b16853ad704ac7e1550d6faacdc53925494ebf

--
 i.

