Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E63230269;
	Thu,  3 Jul 2025 08:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530240; cv=none; b=YPGANZt2yyLTh7hHqG41H1jW+D/ouDLT5VdUM0KfC+8+cR1cqNlYZLYzFMJyYcLunNJ8BwBbuwmSCxqRDU/hTG6j/6fpkVGt2aiYHsaSogtUz71RRc1sCaiaUggDPKBclIaUI42QMF5eNkHJYK1xRUFYN9rB1q7ATzXhgqvR9to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530240; c=relaxed/simple;
	bh=pw6RKoQ6wLaaKGrfjo7TnySQYSLUldMCB4baWpsy66A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TtGZentz00AHG/xJbiN5ULSG5iLs0c+37u14YSwjvf32gbbeYXqqfT5R6hy1QTbuM7K06Dd2pzCTMdsWsJWsqUH6C3JhswjYYcIOvixaCAn1ZpmJlGkfE2lq2oJJty6OLXo6HSBJMNY0zgHeuy40+swnE4LsO3ZhYkwg4km1dzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJ185Dw9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJ185Dw9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751530239; x=1783066239;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=pw6RKoQ6wLaaKGrfjo7TnySQYSLUldMCB4baWpsy66A=;
  b=AJ185Dw9P0/fjWPGUlaUHIuHxpVC2RMDP5yUeeFpf+Gu5G/a2i0tSqZq
   0xlosTxcGb3Gx5RxcTbqqRmmbQwQHTpNfu74rE3LIMaK8tlsUGXJvJY3T
   AzPpjRWYYp/uBkvXFDBldghZyw1FwEbFrLSFtLjDGAQ8ithY+dQSHI4Lq
   aXkZacIa1tDrv9ujWhKV1x70Edl08wDjnrfJHAE/FRXcGje8KbJaPh55X
   9skeUZpPu73IOmm6jTlfzn6dwGBNqEU2fd0TSTRsSMZrzR0IbRmjdkG2i
   S+YP/3lhUFnu7HFJGEYPWRYCd2wp7CYGBo/bu6/E9P9pm8o+ASM2CzT6q
   Q==;
X-CSE-ConnectionGUID: kJUPSLlMT5qLSs8IlTh4TA==
X-CSE-MsgGUID: a3Zh63QUToChRtrP0OeYWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="76392878"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="76392878"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 01:10:36 -0700
X-CSE-ConnectionGUID: E73VJ+WMTQqBWtHRJpiWfQ==
X-CSE-MsgGUID: IM9ib9iNRgaVr7w0KUbpXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="158665135"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 01:10:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
 Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>, 
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>, 
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
 "Cody T . H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>, 
 Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250702033826.1057762-1-derekjohn.clark@gmail.com>
References: <20250702033826.1057762-1-derekjohn.clark@gmail.com>
Subject: Re: [PATCH v13 0/6] platform/x86: Add Lenovo WMI Gaming Series
 Drivers
Message-Id: <175153022627.8357.4931657451998058100.b4-ty@linux.intel.com>
Date: Thu, 03 Jul 2025 11:10:26 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 01 Jul 2025 20:38:20 -0700, Derek J. Clark wrote:

> Adds support for the Lenovo "Gaming Series" of laptop hardware that use
> WMI interfaces that control various power settings. There are multiple WMI
> interfaces that work in concert to provide getting and setting values as
> well as validation of input. Currently only the "Gamezone", "Other
> Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, but
> I attempted to structure the driver so that adding the "Custom Mode",
> "Lighting", and other data block interfaces would be trivial in later
> patches.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/6] platform/x86: Add lenovo-wmi-* driver Documentation
      commit: 57139e126a30ce64f111c78b1b9e37b39a2b7424
[2/6] platform/x86: Add lenovo-wmi-helpers
      commit: e521d16e76cd9ea99c585e064f4e7daf657b1451
[3/6] platform/x86: Add Lenovo WMI Events Driver
      commit: 949bf144bdc72e87018197ae71aa4959f17885d5
[4/6] platform/x86: Add Lenovo Capability Data 01 WMI Driver
      commit: e1a5fe662b593108d14cd0481019601698f9fbe8
[5/6] platform/x86: Add Lenovo Gamezone WMI Driver
      commit: 22024ac5366f065a7b931bee5b62e2588521c4f0
[6/6] platform/x86: Add Lenovo Other Mode WMI Driver
      commit: edc4b183b794baefb54aa0baeb810fe3ac65d826

--
 i.

