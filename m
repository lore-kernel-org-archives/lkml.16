Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A232523A9BA;
	Thu, 17 Apr 2025 11:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888733; cv=none; b=Uby1x190nExoDXJ0mwUHQDqUlOP3z6y3XMH4Ps8wKWyspdj2DGwLYSdOs6qgFgMij5GjZlIFs9lNwvhrvk5jUiw/MueVprsGWooD8kBC1dLc7epfJME99JdZjGNcBphQnh2b26O5RBT87tWRKBsDOb1tn6qEtjUwpiXd/yoAtQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888733; c=relaxed/simple;
	bh=mvB6x9wIPolsw2zOITAPaEluFX4UmrrGsdAtWCEjtHw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GBK2W8f1+6260IrY7zRBdG73vKfZSQsgsF0uVWZTbMwpU6gwfTXVM7xp9EhDOYawmPS1U/+R2jvFWadUF+0rvN7VEZXWEgVx82+mXTFxJYk/fNkfIEjDwXkuUmmJslwHBfqaFcawnM0K6BBnayNRKO7KLMcCMxdR6AuX20pTT9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mfWUPNYN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mfWUPNYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744888732; x=1776424732;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=mvB6x9wIPolsw2zOITAPaEluFX4UmrrGsdAtWCEjtHw=;
  b=mfWUPNYNW+UeMI1ldQKjuiBBJvME/6SPit0GVjRmwkvv10uBjhD6UzEV
   XY2F9BNvS3gaz2Bz5sPfkQaMgKQcXf5lP302HRqa7xIFzDj5odk8j8aMA
   pQLcq/4CUlO2B3k9jO5rveSJsPs41o7pMlhCx7UeUBwm17Ky+ES+MnjrK
   4fIBO99TMeQ6CclVlHzB8+KsNrFXVD8GOqnAnp1Z6a5h2XHU69n89CFTd
   l0Xd72EAnacYLradHXESP7GDO6yMiPib4aCINsNurxB6hduvrqe1Dzug5
   T2xRh6I2Jbh9VIE0vFj1ePKnBlisfKyMmvIKMrYZvTU96OTaCHCc/m9BI
   Q==;
X-CSE-ConnectionGUID: ZM7fb5kmSxeyiQiR4PEaIQ==
X-CSE-MsgGUID: hLiTptbaSIOw+trMAs99ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57854815"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="57854815"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 04:18:51 -0700
X-CSE-ConnectionGUID: 1fmr+4s3R9u6Ah72dMw60w==
X-CSE-MsgGUID: 7fFuykSfQY+a1NtysNFs8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="135629867"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 04:18:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <20250416-smatch-fix-v1-1-35491b462d8f@gmail.com>
References: <20250416-smatch-fix-v1-1-35491b462d8f@gmail.com>
Subject: Re: [PATCH] platform/x86: alienware-wmi-wmax: Fix uninitialized
 variable due to bad error handling
Message-Id: <174488872280.2548.13017755321682660550.b4-ty@linux.intel.com>
Date: Thu, 17 Apr 2025 14:18:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 16 Apr 2025 13:50:23 -0300, Kurt Borja wrote:

> wmax_thermal_information() may also return -ENOMSG, which would leave
> `id` uninitialized in thermal_profile_probe.
> 
> Reorder and modify logic to catch all errors.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: alienware-wmi-wmax: Fix uninitialized variable due to bad error handling
      commit: 4a8e04e2bdcb98d513e97b039899bda03b07bcf2

--
 i.

