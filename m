Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74665635
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739232767; cv=none; b=jPdDsRgKYjwklTP/8owtCYZV/1b1qLlGtoTzqggl5a6Li9g7cJlFh7KPPTghEzPOS44SAjiI5xdrQ3NhjI826WdeAP5ozMuLjg3/AyR6d1tQ3lVALnshOI3UFkxAg9WPOT9rZuV2BQIF7SIOOM4qfmFnmkwsUbvbWUgYEVDaMAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739232767; c=relaxed/simple;
	bh=kFyeARekzk0d+r5TwXdMW/SeR8wSDtOE831En4B0SS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpXEXUIQmEK+0LFBDUE4xzPKAWQI3NtC6cPXCQ23dgTO43JkuADeiiWzCHI50yVtylT5lwAh5OmclEw3CgQ6aPAUtEb2gQ0KfC0xghAbIgWeEp9q/WJcy18mW8Q+oxszaNeWxerD/7Wkxyjo0RBfq3b6yxlPgD/qlFOS/6J32nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1lqoKo2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1lqoKo2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739232765; x=1770768765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kFyeARekzk0d+r5TwXdMW/SeR8wSDtOE831En4B0SS4=;
  b=n1lqoKo2jgRHwLO9s4qP/mNyOeYVhdKD1SeC3lx8BPMBtCItoBQYvpNk
   cn8JmsVy/Xv7zJVJDR+AMLSdQsuHCRTva3otswR+KvBpYwZtF7CB4gsxl
   ZJc4VKgYW4/yWwHoFJ/Iu1zoy3VQeBsLJ5L7LDpZebDTCiXI2x1+Z++8e
   iOJa7xrWPhIXaUGOg3Qm66p3GM2dbYFV9yyfDhYB/S+4+rBJukp2cnyFT
   zpk18BBA/WRhRFxd16JqN6KrOiGbA1UdjSyG/viQwv+F75ArunW6zC3bD
   gcodndkrLup/v85ZUgH9uN3ft6OYOH4JDoZV4kReUnYHdKAE/+HJhq3C6
   Q==;
X-CSE-ConnectionGUID: FlsZK9g5QeaJnaS3VL4zMw==
X-CSE-MsgGUID: MANY3qaYTZyRRaUfM5rv5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50823398"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="50823398"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 16:12:45 -0800
X-CSE-ConnectionGUID: iBmG2yC/R0enfok+5et0HQ==
X-CSE-MsgGUID: mxxSCQF9SPiwJJnr1fv/2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135606501"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com) ([10.245.246.18])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 16:12:42 -0800
Date: Tue, 11 Feb 2025 01:12:38 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: l1138897701@163.com
Cc: jani.nikula@linux.intel.com, luoqing@kylinos.cn,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: i915: Use struct_size() helper in kmalloc()
Message-ID: <Z6qV9s-rVjcnOKnL@ashyti-mobl2.lan>
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

Hi,

On Sat, Feb 08, 2025 at 09:35:39AM +0800, l1138897701@163.com wrote:
> From: luoqing <luoqing@kylinos.cn>
> 
> Make use of the struct_size() helper instead of an open-coded version,
> in order to avoid any potential type mistakes or integer overflows that,
> in the worst scenario, could lead to heap overflows.
> 
> Signed-off-by: luoqing <luoqing@kylinos.cn>

merged to drm-intel-gt-next.

Thanks,
Andi
