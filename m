Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5281FC118;
	Mon,  3 Feb 2025 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589883; cv=none; b=oO7qyE7YK3C6sjF2h7UXXEI9dRDpS1D0R4wMPjRjvHHPE5B6D2UDw6rx6IOtpquY/aUnyfkcwAToA0yCYRKw4wjQfzz0uqRfn3Bngjd2qoJBLeUB4p2CCDb4B2lLtxQZJalZpxG9nGPSFcRcYNxtgLFuR3XIlpp9UXAEm487qvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589883; c=relaxed/simple;
	bh=RpQJf107msvPI8K23FYZ020hoAFNcjii+xY2AIj5tno=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JreF5Z0ziKWca4+lqka+jbIvr/XCjY8loP4u2cc1Xfk2q3/5jkSO4EWXP3l7e9aN5N347LPfAenyDbWfW5oobQLV935gXwoMHARCdw+an7McJImgEWyP8IEoCh3dXgN3WyWMuz+vpyyAimxdW9JYhNxAaIk70R7XJAr6xFlDpJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENl+XAHH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENl+XAHH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738589882; x=1770125882;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=RpQJf107msvPI8K23FYZ020hoAFNcjii+xY2AIj5tno=;
  b=ENl+XAHH1gtcT/tAQX1uGLCwmnyuZEmQXncNmNpPknaClAl1cH2A3enu
   JwRpqayLRzqp6Zm6JBlaUjbvR6wbQ1koSCAzXwC5POO/BD9xreqV0QWUK
   +/I0mRPwPTNh/FsprbmfdLlzHVORLBBUsb+2rYTjKTt4Dgys69BA5v4CJ
   NmInY4UdoPXVlFpLyWODQp98QS66MBkzOWZ8y2vMNwcSeTsYtYHYY83YQ
   7MKs8hmrKrrNiuCgeM1e2qnGbkQElVanRxdGstjObF6ad9tQDcbC3Y1Xj
   4OeUnBiXRvZrykzE32mZsr9GoyxLdGrQwTV2QJmVlkfx9ahK86rufLoYo
   Q==;
X-CSE-ConnectionGUID: Xm3L2eUETXqWix/BKSe3CQ==
X-CSE-MsgGUID: mbT0x1pdQYOiK2qjn83vRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="26682746"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="26682746"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:38:01 -0800
X-CSE-ConnectionGUID: aYa5Lzs+RqW8J99zgCJIJw==
X-CSE-MsgGUID: Mt6Dgkb9RYm7g8q3tIQGCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115325231"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:37:59 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: vadimp@nvidia.com, hdegoede@redhat.com, 
 Xiangrong Li <xiangrongl@nvidia.com>
Cc: davthompson@nvidia.com, asmaa@nvidia.com, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250124144655.48564-1-xiangrongl@nvidia.com>
References: <20250124144655.48564-1-xiangrongl@nvidia.com>
Subject: Re: [PATCH v3] mlxbf-bootctl: Support sysfs entries for RTC
 battery status
Message-Id: <173858987431.2591.10028148817647304373.b4-ty@linux.intel.com>
Date: Mon, 03 Feb 2025 15:37:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 24 Jan 2025 14:46:55 +0000, Xiangrong Li wrote:

> This patch extends the mlxbf-bootctl driver's sysfs entries
> to support read access for the board's RTC battery status.
> A successful read from this attribute returns the status of
> the board's RTC battery. The RTC battery status register is
> also cleared upon successful read operation.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] mlxbf-bootctl: Support sysfs entries for RTC battery status
      commit: 5d40a8577559250029ff571de38ffcbc226a63d7

--
 i.

