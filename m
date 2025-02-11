Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D69B2580CF;
	Tue, 11 Feb 2025 16:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739292068; cv=none; b=UU6z5mg9OAXgY+uZujHh7rQ7r7xTtxkfEeEBVgG1hbsooD242zGLOCV+RBAuexkZyym+mWDcDSQ2Xwwsf07jbWdzx1t9qZ68Hx0cb6i9Vs7ZSlYSmiB4/lzGOJ90EBy8XUh12FU6sT6RPekOI0QL+yM79oo6Ltn5ZJIXKETYBGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739292068; c=relaxed/simple;
	bh=jg/1SxG3e75614Put3SWdyy9ODCY4VwUIrLpw4dmqHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jM+L7MZR8rTLnZTWx3YVX5tb9zuyB8KaLwRoDI7Yn69fOXIDo91/olB+XrNP7OhzG0bq4VtARB5+tnsObkgMcgYHEdFtt1cryoQHb32eZDvwde038Rj1jObikqXWz36nePr3hTedEFhyrtVE6kFtlBXjkhD+8fGU//pLCS/g1hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OoE2iWSG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OoE2iWSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739292067; x=1770828067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jg/1SxG3e75614Put3SWdyy9ODCY4VwUIrLpw4dmqHQ=;
  b=OoE2iWSGEr19rkerfUpr1NzLaGSyx4qM72eMpptQWZWq7vgjDZ4acBGq
   BDhQgmnX/+0bbQQysXQmWcMRF3jnhBNS/ZPNWd6fSlpujvwvuxA/YiOha
   tSMje4XIgiIo3Bd+2ga7KcFC8S+qASMlTNabG/Os8XlNZ1qbKNuzw1Yma
   N8FJMMaex2oFEY/hDAWL/b6iyRhB+0VWhV6H+IGeI5SQC3ZfehiMxWvF9
   oXvXiPNQ18ps8a+cr19JeHaxsNFjOaYJHj/xQ4kftLXJ7kY79GJMbBAyX
   l9+lmqRLS2hMqsW52FV1/LxknwX0R3wBp+b/UHrBPI4VTfhkngdKP3ZV9
   w==;
X-CSE-ConnectionGUID: Pxsd6nKfQV21d7W59rb8Ow==
X-CSE-MsgGUID: At28CQTlR9K33X3CKbAfvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40040271"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40040271"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:41:06 -0800
X-CSE-ConnectionGUID: tGZKbNIoR6unkO/cwFk7EQ==
X-CSE-MsgGUID: b2JsFy9QSzS2fnMZ4U+h1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="117575991"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 11 Feb 2025 08:41:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 06FA78F; Tue, 11 Feb 2025 18:41:01 +0200 (EET)
Date: Tue, 11 Feb 2025 18:41:01 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 09/14] platform/x86: Rename alienware-wmi.c
Message-ID: <Z6t9naLPpVl_L9hw@black.fi.intel.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-10-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207154610.13675-10-kuurtb@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 07, 2025 at 10:46:05AM -0500, Kurt Borja wrote:
> Rename alienware-wmi to support upcoming split.

(the change that is caught by my eye and induced this review session)

...

>  obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
> +alienware-wmi-objs			:= alienware-wmi-base.o

objs is incorrect! Please use correct y instead.

>  obj-$(CONFIG_DCDBAS)			+= dcdbas.o
>  obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
>  obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o

-- 
With Best Regards,
Andy Shevchenko


