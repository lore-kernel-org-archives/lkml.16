Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA382116E9;
	Mon,  3 Feb 2025 19:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610132; cv=none; b=o7rKLQCnRucCXucQ5xzR2W8I7bgYYSTZW+D35Qg0QGXdUZCueHssFfVHPD4Ss5HnBodC9RZmh4ysH0D2b6hAosqaeSBkm+Mq4jdHfOONuo3cWTSJB7+3tBOAHlsWTBN2naKsZMSDv8E3IUX3j+xyDZ0HrLEKLekqvn4LG9X+X5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610132; c=relaxed/simple;
	bh=Bb2O5IEUWqL+nrQg8/ZHef0++5aE2GmOfzA4KTiFtw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Cyw58IO93SpNcVG+/ZKlRkyJQe+Hday2Ujyvx8XZ8asMXOnINg6zxJU1r8b8JJ+94RJG8fkeskVwa9PX8H6wAomNmrB+b9152hhfm0dK8ejoEZD1CCXsOuFbWbc3j65Px2EqXi7cIm4dB4NNdDpFtdglItQY3/q3y81h5LcaWV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OC6NkSa3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OC6NkSa3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738610131; x=1770146131;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Bb2O5IEUWqL+nrQg8/ZHef0++5aE2GmOfzA4KTiFtw4=;
  b=OC6NkSa3p/uWfwtxnw/rLhUgjTSCSjrjdDcL/886b8FDkV/zpjEEez/E
   2GH8xxVJbv3oQ5e2FCvHzOK7GbbKvfGCrCh3vsqe8KmllWs/GAieHrAPi
   4DYl3ofnprSZqtyT6dpmBbsZfzXrGI7ZhDkqREmlzLX8PM98A9efrOlV6
   9/FyLCD2T3wdPPX4G0q0IEI3SnQsqxHJ3AcPJmVQXh/yj21GAcMCHlFq4
   rL9aiCXgLGj61Fr+nvCgDpS1YfjYlgQJFgGdxfL0NSwdJxOrq4ec3HPgc
   JAHDn+ycMc2DTlmnInNcmzuVw0qVre3MiOACftPHVh2KXj154GRRShRWS
   Q==;
X-CSE-ConnectionGUID: YRswE7PlR92/KPM0Vi0unw==
X-CSE-MsgGUID: DR6MRFAGTweVIs5Cz3MByg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="43043114"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="43043114"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 11:15:30 -0800
X-CSE-ConnectionGUID: 8hw76QXeRwSsXhwdmC8xQQ==
X-CSE-MsgGUID: AjTjn5zCRMizURVqhFUcCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="110266550"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2025 11:15:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B7BCC23F; Mon, 03 Feb 2025 21:15:25 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ferry Toth <fntoth@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/3] usb: dwc3: Avoid using reserved EPs
Date: Mon,  3 Feb 2025 21:10:52 +0200
Message-ID: <20250203191524.3730346-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On some platforms (Intel-based and AFAIK ARM-based) the EPs in the gadget
(USB Device Controller mode) may be reserved for some special means, such as
tracing. This series extends DT schema and driver to avoid using those.
Without this the USB gadget mode won't work properly (those devices that
"luckily" allocated the reserved EPs).

Ferry already tested the previous versions, but I ask him again to
re-test this version which is significantly rewritten. I have not
applied given tag just to be sure we got it carefully tested again.

Changelog v2:
- added minItems to the schema (Rob)
- revisited code and add NULL check to avoid crashes (Thinh)
- rewrote helper function to return error to the user if parsing fails
- elaborated in the commit message why we need this quirk (Thinh)
- addressed miscellaneous style issues (Thinh)

Andy Shevchenko (3):
  dt-bindings: usb: dwc3: Add a property to reserve endpoints
  usb: dwc3: gadget: Add support for snps,reserved-endpoints property
  usb: dwc3: gadget: Avoid using reserved endpoints on Intel Merrifield

 .../bindings/usb/snps,dwc3-common.yaml        | 11 ++++
 drivers/usb/dwc3/dwc3-pci.c                   | 10 ++++
 drivers/usb/dwc3/gadget.c                     | 60 +++++++++++++++++--
 3 files changed, 76 insertions(+), 5 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac

