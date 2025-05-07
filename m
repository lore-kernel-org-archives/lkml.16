Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B3421480E;
	Wed,  7 May 2025 10:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614250; cv=none; b=Vnb5KmCcGqIuHlER9e/9IbAXCSpJ5HobCU+HcIgvsXtnrwCVXHcnB6kfeaH2GQvXCKMlf0ybj6YyuaMSQELBub7NqzBa3lxASPBlcpbL9/mOniu8Ctw5gHU/uMvd3UjHxuYqqvsGKi9qTrfbLRwEqhZHzQJRBRPJNZdVAzx+oE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614250; c=relaxed/simple;
	bh=KOxPNiWAphSmxx4fuvVj3cV4lynvxkHVXO7Dt9R7Hbg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sd//EKwUWc46DR2Bt3tDoR/eMgAVHsRJR2ca1IBa68uVVOuR3j+x6QNjCqmXxKnCig72cuGPto+q34iEkGfVdCPCSD9K2suecuTQXua1PJY9wlYZ7jz9gSy5pjpSdwr/FxgdT+V/42ze5qEnoPfHJMpFRHZ5brwRnicKPnohgQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmMc5VRl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmMc5VRl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746614249; x=1778150249;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=KOxPNiWAphSmxx4fuvVj3cV4lynvxkHVXO7Dt9R7Hbg=;
  b=ZmMc5VRlJQrpZVbY2BUyOMICkISFlK+agRC0neK2/EvoDV+H+hkIPgvc
   +XWiQE0kHysbFJBhSTdGGt+LnXgInbpCwf1XaE7fJROEfG6Yy39VOBMc5
   MXkCf20DFj+9p3I7ZEUsvwnlelWpeQgwSRWgaWhzZXISUmNlujbq8Ni/A
   4omg+mSj4m1pMecyr+fAkIh5FTphndysT94ImwniFgwdgovhljnX/9eIM
   fuWxK4uGvuD3b/l8wPqwePbZw8eZJQE9gu24Zoqf0ZqF0WT2KXMK5ZQ8x
   dRLaVeFF65ECyjHhBVGwyhTeO9L15t6nu9PBERjB2p+hsxo943kVQKr6Q
   w==;
X-CSE-ConnectionGUID: YxNgZqlKQwWACxjMiV+akg==
X-CSE-MsgGUID: T9M9liHgSyq5freJWb+SRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="73724297"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="73724297"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:37:28 -0700
X-CSE-ConnectionGUID: ppinAvuSSsOCN+MV1RBDfw==
X-CSE-MsgGUID: 7PUFFF9nSSWvhX6SurdX9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="173110904"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:37:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: malattia@linux.it, hdegoede@redhat.com, linux@treblig.org
Cc: hverkuil@xs4all.nl, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250505152558.40526-1-linux@treblig.org>
References: <20250505152558.40526-1-linux@treblig.org>
Subject: Re: [PATCH v2] platform/x86/sony-laptop: Remove unused sony laptop
 camera code
Message-Id: <174661424037.2744.14327931870878423651.b4-ty@linux.intel.com>
Date: Wed, 07 May 2025 13:37:20 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 05 May 2025 16:25:58 +0100, linux@treblig.org wrote:

> commit ba47652ba655 ("media: meye: remove this deprecated driver")
> removed the meye driver but left behind the code in sony-laptop.c
> which that driver used to call.
> 
> Remove the sony_pic_camera_command() function, and the set of
> defines (SONY_PIC_COMMAND_*) in a header used for the interface
> and the static helpers it called.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/sony-laptop: Remove unused sony laptop camera code
      commit: a7c33fd14dbcece11c053727158c72804bb65bf1

--
 i.

