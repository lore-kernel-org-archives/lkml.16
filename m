Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A305126D4CE;
	Wed, 23 Apr 2025 11:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745408324; cv=none; b=K/iePHjLuYCphI7PB5AmqsbUbT13QY/tzpL/sgT2ootC3SQGwwVb5Ws757f5Ot4il81gsut0aVWM15NUVQFik0ajE68aRPpJcoGlfC05n309FZhnhfAzn7ATXCzyBFzqUagVm/UhXXYweFLjBRgLxRUH7ZcFKmq1767JopxjaxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745408324; c=relaxed/simple;
	bh=69s5a/TQgTmedngw98hbqBW36fV6lcnE3/pViTvpT2Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l74lcsWwlXyq+aKzE2Faa5mhrOfPn4R5yDptqjPnK3N5Trwbs/W/7k+mCEzzkl4c2dV4+czh5FjMXtz3dcFLmfSoEi/JpLBXC2igygS3lv0Npfpf58juH7dsU10xm8OJVqzS/P2OB6AD+N2elhIA82pGWayHp9FH7FIGk+DM0H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSOSvVh7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSOSvVh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745408323; x=1776944323;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=69s5a/TQgTmedngw98hbqBW36fV6lcnE3/pViTvpT2Q=;
  b=QSOSvVh7RdZaa0qGNvbI9sD6Kp9W+pI500mPwIpkAL8UHi1Mi9aBrtYT
   7z2I9d5q2GN48GzUGdRmMcfLRpK3s8iu/7KImGmrmdnJ05KBeY8Zpk3/I
   HO6J1PK2Ir3W4MEszE2qOp3Sb7J3JZw0XDBf69fBZ2uik93FEgFV/nlO7
   ZUftl1n+iixYlcxaJT6bS30GdJxKmLpE+fVZXF+/Liv4oa1KvC1Ih8AvX
   Hrn9TGOamRmMDzaGNGFq3alA7SCtk/2qR9z2gWsm4v1tcqrRCDEg5hcJ3
   nVF5+22Fb3eq1o0LLQrz4u5fUflfNFNSTn3bAeWItCtGXC++kUWzgxn6x
   A==;
X-CSE-ConnectionGUID: ADcI1V5ZSRK2LFd2sM2r/g==
X-CSE-MsgGUID: 4vq31GjERAeC68GNqgC4lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="64406481"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="64406481"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 04:38:41 -0700
X-CSE-ConnectionGUID: 82EMb4xBTAqoOeUQ11vvuA==
X-CSE-MsgGUID: X69BX3W/RumxaCZQgap+Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="133244142"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 04:38:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: ikepanhc@gmail.com, 
 =?utf-8?q?Ga=C5=A1per_Nemgar?= <gasper.nemgar@gmail.com>
Cc: hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20250418070738.7171-1-gasper.nemgar@gmail.com>
References: <20250418070738.7171-1-gasper.nemgar@gmail.com>
Subject: Re: [PATCHv6] platform/x86: ideapad-laptop: added support for some
 new buttons
Message-Id: <174540831481.2601.14342834406592961532.b4-ty@linux.intel.com>
Date: Wed, 23 Apr 2025 14:38:34 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 18 Apr 2025 09:07:38 +0200, Gašper Nemgar wrote:

> Added entries to unsupported wmi codes in ideapad_keymap[]
> and one check in wmi_nofify in order to get wmi code 0x13d to trigger platform_profile_cycle
> 
> Signed-off-by:
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: ideapad-laptop: added support for some new buttons
      commit: 02c6e43397c39edd0c172859bf8c851b46be09a8

--
 i.

