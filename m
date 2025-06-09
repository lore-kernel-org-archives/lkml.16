Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28FE281532;
	Mon,  9 Jun 2025 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749455587; cv=none; b=EhqECzZTC5RiVmcb1sR9rKXdow4EK530bsjxZ1pMSwvD9XbNFHP78OawuQZD5uniAL2LbOUvhsfm7MaTolGvAv+MQZ9fz0SVoLpcrkEr6TfscY3BssW8/7JE7ypVrNFrqvzr7JFzXr6Mv6UFMbSt1YPKgOfsZif6dYZBeoIH06w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749455587; c=relaxed/simple;
	bh=rNB9DtxfXPHC8cZAMjhkkcYqCorBkbj5Wh4AdMluDrA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bT0HKj+5DlduNQ9dhql3iddrDUmYYUYnOVE0UbA3fY0MH0LEwGatAtDBAEvAsdvao6TQ0T64JrBMFtoug4eirnwYAlWT7XyE6RSDF50AFwF8aZIrQaALtBxY2C4qI4x20m9pQH/VJ+PmuXLuUdRiA2b1XqInXyPnPmxJTYg4Bp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7Q1IoPs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7Q1IoPs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749455587; x=1780991587;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=rNB9DtxfXPHC8cZAMjhkkcYqCorBkbj5Wh4AdMluDrA=;
  b=U7Q1IoPsuLjfEzB7b5ndSwDGZXEl2rms4lFO/cV392cdffDzI+8R8C/8
   TTM9GvMn7y6tfEW8xEgZoh0c9gMHlFmhKtB1Hr3hCA73RUOww56WOTToZ
   fa7ZKHkehIPmJ1p0OUOzK5jD+n21t7BMh9jQLSDL7jEyGx0H1I1gFR8cO
   rBdmAT+F0EgB55BYLmEjtzkiTRaCkn2bR7X4mkiJJhcM4F222yoUSs1FL
   QqXBf2+D6noxHqS55B0LS01ignfcTyJv1wF+ATsBgGKqpYVtvIUB/dNIQ
   txApVNsiHEvD2K+x43N78d3gfCxuKO9R2q3OSjKI5tcBgX/qVg8HQMd3U
   g==;
X-CSE-ConnectionGUID: /zsvQe4aQcukPcRd10lt9Q==
X-CSE-MsgGUID: knua+YaYTuetY2n3EqkC4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="68973393"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="68973393"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 00:53:06 -0700
X-CSE-ConnectionGUID: UQEWEwcWSQqSidu57t+IZQ==
X-CSE-MsgGUID: YFz6vOsbSOavqrkdDJSdqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="146324906"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 00:53:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>, 
 Ingo Molnar <mingo@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aEKvIGCt6d8Gcx4S@stanley.mountain>
References: <aEKvIGCt6d8Gcx4S@stanley.mountain>
Subject: Re: [PATCH] platform/x86/intel: power-domains: Fix error code in
 tpmi_init()
Message-Id: <174945557711.2685.8614887579678599243.b4-ty@linux.intel.com>
Date: Mon, 09 Jun 2025 10:52:57 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 06 Jun 2025 12:04:32 +0300, Dan Carpenter wrote:

> Return -ENOMEM instead of success if kcalloc() fails.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel: power-domains: Fix error code in tpmi_init()
      commit: 1d0a61940e22e165e6acc4a9c6fb26edbe69112e

--
 i.

