Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAD01D54EE;
	Mon,  5 May 2025 13:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746453126; cv=none; b=kx1lmZVXuI6l2lvpASS8F5wv/m1fJlmCAL7g/4zlyjskdJbML53s9vDQhbp6WC/XvjFMBw/xr2S8NAwQzzAQWap927fd0biIseRjs1kM/YuDRpfjAeWhTTRQbZsKsOvEzfhjTCbDCCNi7U+cdDcAF2PgEINFeFRvRdr+4RDKqzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746453126; c=relaxed/simple;
	bh=mb/ZzQf87Hmkvnvv9v9dPUSGx/B52gYFvCwDkSRat3M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gPHy6SBhJCgeL6yoSOjl3itucGw4e8wqZi2Dzi7wvn628gFogTOWsGMrylSZBCOODlZeUlhsa2GBWIJRRUmI6ahHkIIhFb3+WOkUWAFtqf0agx3TRYXTmXonHboGPHlVZ/nMJb6dVBePXfHkM9/u2XG/F02sP2GPtx9tBU48in8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCEATgL/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCEATgL/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746453125; x=1777989125;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=mb/ZzQf87Hmkvnvv9v9dPUSGx/B52gYFvCwDkSRat3M=;
  b=hCEATgL/Lwvsi8v8u1JN/74KkiWu7aNulrkBUXYcAGVvADPHMfQbL1BB
   9KnNQ7Fw2blC/mI9xU4AEeA6evXJertFCbx4qWNw63ceHoN29eCGL0GXh
   GYsOUnN6BlB0pCO1cPZCwKPlyCDDevLqEdv1Ts6mknsMvNuY/o1MVsA/G
   UuEmCfyWHv2cZhH+jZHBXLHHaEEY+CC8vqYhjUk11q/DBAUZQkAZokjl5
   LU9/4bMH65zdW5LKTKDUO4awCRT9599lhwGypsLk023O/7S4QU8VggeFX
   3hf2GzZQ/gpNFZ3rSDRC9U+EoQEu4lzkCdwvt049FvMN2j3mRyWfN2FHD
   g==;
X-CSE-ConnectionGUID: /ccn6U9zTyS6XEQghK8cdg==
X-CSE-MsgGUID: IfGAggCxQs2nLah7SxxlnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="48072993"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="48072993"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:52:05 -0700
X-CSE-ConnectionGUID: vQGifHJcSoiEVbIeQ9K4tA==
X-CSE-MsgGUID: 9yjBbPIGRsGI1FEc9zDhTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="134994343"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.68])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:52:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Antheas Kapenekakis <lkml@antheas.dev>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Derek John Clark <derekjohn.clark@gmail.com>, 
 =?utf-8?q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <aBSE71VKfBlQg_fZ@stanley.mountain>
References: <aBSE71VKfBlQg_fZ@stanley.mountain>
Subject: Re: [PATCH next] platform/x86: oxpec: Add a lower bounds check in
 oxp_psy_ext_set_prop()
Message-Id: <174645311458.23202.1330515283470994332.b4-ty@linux.intel.com>
Date: Mon, 05 May 2025 16:51:54 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 02 May 2025 11:40:15 +0300, Dan Carpenter wrote:

> The "val->intval" variable is an integer which comes from the user.  This
> code has an upper bounds check but the lower bounds check was
> accidentally omitted.  The write_to_ec() take a u8 value as a parameter
> so negative values would be truncated to positive values in the 0-255
> range.
> 
> Return -EINVAL if the user passes a negative value.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: oxpec: Add a lower bounds check in oxp_psy_ext_set_prop()
      commit: 55cd5e760618b3bca5b8ab63fe65ab78a753adf8

--
 i.

