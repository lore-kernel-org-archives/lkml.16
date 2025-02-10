Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9724824FBE9
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207359; cv=none; b=cs2SSJi/FtCfhPuIAfzr4L2TawPni1CfsdjBHSz6qdxyWeBaefqltcri7zwaJx5DSsJpKy4tMV7ZXmpXWGmWIl+fj4XCy2GNOfzQpkfZvbyeUJsvVOXD3DV+l8cWaQsprBXtQPtL+HsFQZnYliy+B6ThHI9wx/s2ezvf/tu7VEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207359; c=relaxed/simple;
	bh=WCIhmVbkS/WqIDLA7gxS6UmXEsiFjvtmzN5rqRoO8W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKP2rtz5T5Jd2L3f0NXDbYbD4sR8axLEFy8fmTiw9Z6e+d2Ux+2pziKLurNg/Rsh7VBDUtEFzCA4SqlV4CUq3fA1BvBS5/amVkEUI8Noo+xeFgws47TMhRNXhu/8FtlIAYD1DFhtR4KTMSSnSbJPVWD+Mst4rbS9nJfAjxsi6Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZx8WfJb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZx8WfJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739207358; x=1770743358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WCIhmVbkS/WqIDLA7gxS6UmXEsiFjvtmzN5rqRoO8W8=;
  b=NZx8WfJbsIdijsPBc/GVL5HJmjSiRaZlWoY9Li4VqzmHh/6Ryz3Cq6ag
   v2Xwrr7Cbz0eCZ/Ce+JVJA3jGC09oToCysNx7LMe71j9jND3wLO/JFZxo
   RRpi4izw4FlMlK5xqdhHVQ91HyhNwV2YPSFrqtFRmfauI5fnm9J5V6S0d
   P7qnW+JB8DQbMDeALWcp4ZQI547/HMv+AF23lIAJ69tnxt9EOP/UVmvjZ
   BdNVm8H+6fzUiVfJvN4ukYpZxlM7dNStFhqMkjRJD3dcz8oxTlTCLx7iK
   0DUnt2GbHoRP4k5mJzd2Yjb6tJW8OyGN3uzw9NlQF41UfeJCjf+Y79cy8
   w==;
X-CSE-ConnectionGUID: Zutm/fJoQWuagDVegMiyvA==
X-CSE-MsgGUID: Ncb25TzQRLy0PV93Mg0qYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39714384"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39714384"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 09:09:03 -0800
X-CSE-ConnectionGUID: ZAanvtOQTv6hZBKSgZKOzw==
X-CSE-MsgGUID: 8bG7DA87RjS0dqhf5MZFfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113121595"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com) ([10.245.246.18])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 09:09:01 -0800
Date: Mon, 10 Feb 2025 18:08:56 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: l1138897701@163.com
Cc: jani.nikula@linux.intel.com, luoqing@kylinos.cn,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: i915: Use struct_size() helper in kmalloc()
Message-ID: <Z6oyqL8aDCOmoCbd@ashyti-mobl2.lan>
References: <20250208013539.3586855-1-l1138897701@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208013539.3586855-1-l1138897701@163.com>

Hi luoqing,

On Sat, Feb 08, 2025 at 09:35:39AM +0800, l1138897701@163.com wrote:
> From: luoqing <luoqing@kylinos.cn>
> 
> Make use of the struct_size() helper instead of an open-coded version,
> in order to avoid any potential type mistakes or integer overflows that,
> in the worst scenario, could lead to heap overflows.
> 
> Signed-off-by: luoqing <luoqing@kylinos.cn>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
