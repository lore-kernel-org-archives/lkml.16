Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D731E2701C0;
	Wed, 23 Apr 2025 11:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745408304; cv=none; b=qyx+FJw+UNWADfiHIM0ZrO99demqSNigjmcIo3foJp2X05bMrtbRV67QQddujoUHNuShXGhzDdDN/kRJOgCoNROz82aOn1hm2hnaNtBOsGb4mMOLyuRsM4EytQsaq2vbbQXJ1oz4zjSo/s6IKOiPCsuZfGmqObQXTGWUL0obJo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745408304; c=relaxed/simple;
	bh=HPuxEiF5M5bY4EryFjaiCEM7BuwNSI/Nj8h4k9tL/rs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YZKPQjSkAe6Bw1DydpuRgPcfQGHfucGGBLKZ2X4mS1XIj6VjhoUE2LetU7VXFC7pf4cJn81F1n1A/7DlJxiOAYbHrzgAC3efJ11iUf/9u7HWQ83Ojdm/Mp7mdZDeigNFmA/4pYo8uEXFaWUTCtXMvHC7bCcIgQFrktU3HVphNwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuA/1w+C; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuA/1w+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745408303; x=1776944303;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=HPuxEiF5M5bY4EryFjaiCEM7BuwNSI/Nj8h4k9tL/rs=;
  b=PuA/1w+CuEBKG4bJ6arNtEB2V8iKPbW7CgpapFN79Q4eE0uPJWrWSRPa
   3m+RtaaTVqSZduyixEt9SmuiwjJ4sy6zZxznPgemwM9dbaSlBKZ8HeXo8
   MK9ZfMcPBd4+vnDVPoXMBLWKHhsDw7gDH44kgfSC9Mh1HvpwbP5/8288E
   DFP0win6Z4T3wuo5giMBK1vHL/QQ+btJaIGXuiCjGyt47XcHz/AVXxqFk
   cM/ty64a9ub/ahivZP8gtPuqeirPEa08MoZglVKqhE/jCLrF7J1F7fbzw
   WRSobZHHnt3237tr5hlXqpE7b1xOE10bNWtHrJPjlmO+C8KgzGRlMk8yY
   A==;
X-CSE-ConnectionGUID: azx2rx/YS3+cKdvrKt6x6Q==
X-CSE-MsgGUID: 12aFDKAbRYCRe//Yibqqww==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57652669"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="57652669"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 04:38:21 -0700
X-CSE-ConnectionGUID: tcJUEN4YSGir2J3YInvAeA==
X-CSE-MsgGUID: a/p46cv2RqmVnSziGNfdjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132212762"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 04:38:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Saranya Gopal <saranya.gopal@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250421041332.830136-1-saranya.gopal@intel.com>
References: <20250421041332.830136-1-saranya.gopal@intel.com>
Subject: Re: [PATCH] platform/x86/intel: hid: Add Pantherlake support
Message-Id: <174540829413.2601.11077448810283609556.b4-ty@linux.intel.com>
Date: Wed, 23 Apr 2025 14:38:14 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 21 Apr 2025 09:43:32 +0530, Saranya Gopal wrote:

> Add Pantherlake ACPI device ID to the Intel HID driver.
> While there, clean up the device ID table to remove the ", 0" parts.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel: hid: Add Pantherlake support
      commit: 12df9ec3e1955aed6a0c839f2375cd8e5d5150cf

--
 i.

