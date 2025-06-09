Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D599280331;
	Mon,  9 Jun 2025 07:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749455578; cv=none; b=m3W8d/ACt9NX2zeEbcIYVhOCKDKQWfuzT2Pz1P+9fLKGQ3PLhtlZzZ16VgxkysARm4h1VMLpHywEw5oP97vXWu9GEe9yVRsO0ESIpp/9v0HtPY5axGlfCdeOWIAOita+h7RkARAvwoBWRwit5Desx6TITuN8LW0nnrW5e+Ye+kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749455578; c=relaxed/simple;
	bh=Lp0HvGmYpm0xH4GbVNG5U4dN5d65IfF/kdbCQcXM/bA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NkJBGAmsvz9Lb2A8nzNUrsOtPUVoREaJdSg+fSHX1hC+DzbxCXoCKRAwXP9gMRh0W/6u+gvVrJbqO1tA36YnP11w8Jed6EOdbWtpFo2c5bXODHltNvcHKlkDF2UmwVI01qFsqFUdTuV7gKdmaemi6nxk8fTQ0xuxJ9TPtVq3fF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxG+fiKT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxG+fiKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749455578; x=1780991578;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=Lp0HvGmYpm0xH4GbVNG5U4dN5d65IfF/kdbCQcXM/bA=;
  b=hxG+fiKTQIYbebr32nrb1t8cSTEni9F+FiQg5Hk4ZbWPks6WsDdU10Gm
   DeOYwJ1x4JKqqm0KFqzIX688Z9qLvrnxwf8cPin8nd+64nJnGMo0ikhTX
   gIkWIZ6KplQ9XXLUhoQgG5y4H2CcI2fFhoYYRIX8MYaVo6Vx5sNjENb/9
   8gdH/NCTOeomKHmEYvWkE+0GORF2RuCWQrLEFBL1E1RNKxin7Gfos/bX5
   wPW0d2d0/gGtvcrVCesCTmH1ZmQkfUr1skhvoPeGbMmCKB/rkBYwAmTHH
   CCxSW7xQSbbKhtRykbUf5N7TfHj4Hbe/xHlfbzhFkf3iGWJcc55lPTNc2
   Q==;
X-CSE-ConnectionGUID: L+iVZEn/SNSNBsWdBb9arw==
X-CSE-MsgGUID: Qemdrg9gRIurE2odzSK8uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="68973382"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="68973382"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 00:52:57 -0700
X-CSE-ConnectionGUID: kPMt/gRtSomsEqNeD6nHsQ==
X-CSE-MsgGUID: Bj+D2jznTRiy/+fFiP6DaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="146324865"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 00:52:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, 
 W_Armin@gmx.de, thomas@t-8ch.de, kuurtb@gmail.com, 
 linux-kernel@vger.kernel.org, Joshua Grisham <josh@joshuagrisham.com>
In-Reply-To: <20250606130909.207047-1-josh@joshuagrisham.com>
References: <20250606130909.207047-1-josh@joshuagrisham.com>
Subject: Re: [PATCH] platform/x86: samsung-galaxybook: Add SAM0426
Message-Id: <174945556861.2685.14410539360612940851.b4-ty@linux.intel.com>
Date: Mon, 09 Jun 2025 10:52:48 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 06 Jun 2025 15:09:08 +0200, Joshua Grisham wrote:

> Add device ID SAM0426 (Notebook 9 Pro and similar devices) as reported
> and tested by GitHub user "diego-karsa" [1].
> 
> [1]: https://github.com/joshuagrisham/samsung-galaxybook-extras/issues/69
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: samsung-galaxybook: Add SAM0426
      commit: afbdc4bbb3a6418778cf969b0795bbaa8237cdd3

--
 i.

