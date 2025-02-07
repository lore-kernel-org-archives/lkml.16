Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D15B1DED48;
	Fri,  7 Feb 2025 12:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738929627; cv=none; b=tyKEgMEYZ4qzmVGb+r+ZdmTBJxYygrmNXwAcvk8AjnLF0dmMd2eabky3RskBUNiZ8Ph+t9xChmtrR/QAVXDirV/IGSxi1Qy69j6BzABrtDFgZk/Gct0HgbkL3/J0lLQpfZw6/uPHhx2h2+7W6CGxu2pBA9kJHNRRPqTj2VRHWT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738929627; c=relaxed/simple;
	bh=9DOQkMl0/esVKMop1h6H/JDDIemeS24TPNpLd8BOQWo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NuE1sHb7fEOz9GUKpUJuw/p7wtfxMogp+W1nku5c5OG8kwzijXmrC22nTicW5otLqgvzCicUVDI/82xVjZ2yatePWBI5dcikG++vHmJYNv5bPKcFKTI5Dn6zhxkPq82tFWs1X9TvtrOoXtN0lw6MASb1v/xd3RGxPjUD+k/z8yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BeSlt9qq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BeSlt9qq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738929626; x=1770465626;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9DOQkMl0/esVKMop1h6H/JDDIemeS24TPNpLd8BOQWo=;
  b=BeSlt9qqFQST2A0fV5yspf4W2PsooT+psylE73amY8UB9ypTYyUeZ8Dj
   ytKgW6s5UeLjfZ1lsn0rUu4XDOEFgYV6yTSU3RRUChPsQF1/LAuzxPXJL
   po7JvO7LxgqVRDilnomptwfVHcEzMvjmCipT5Ub1y3lxWrNAr1v1DWuvs
   YAXir389JGwXMx6tRUPmJ4pz4jYimZCjdFXU/RG0KQIcfX7IDDFOLeYEC
   5FAI2AS7MaXunZdx5OjuqZZ+HoWvYXa2G7koUWs4YAkY1LnBFZlcMdrmU
   k0walDmctctAJhyA4PqxRcEGnE4qiY95i2qXmj1TLKEiNtulf5ScRl8BN
   w==;
X-CSE-ConnectionGUID: jvvVFW8lTguaaUGtDkMJbg==
X-CSE-MsgGUID: oegaJOarQlioeh1T7oyFFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43328131"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="43328131"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 04:00:25 -0800
X-CSE-ConnectionGUID: aCm93eehR625ClZSMy3FNA==
X-CSE-MsgGUID: jMb7RbwfT8GEu6h3rODHpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="112021095"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 04:00:21 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 7 Feb 2025 14:00:17 +0200 (EET)
To: Joshua Grisham <josh@joshuagrisham.com>
cc: markgross@kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    W_Armin@gmx.de, thomas@t-8ch.de, kuurtb@gmail.com
Subject: Re: [PATCH] platform/x86: samsung-galaxybook: Fix sysfs_attr_init
 of fw attrs
In-Reply-To: <20250206225707.12962-1-josh@joshuagrisham.com>
Message-ID: <7a9b72a9-cb08-3ef4-8472-a38bb2a88608@linux.intel.com>
References: <20250206225707.12962-1-josh@joshuagrisham.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Feb 2025, Joshua Grisham wrote:

> Fixes sysfs_attr_init bug in samsung-galaxybook as reported in [1].
> 
> Should be applied after
>   commit f97634611408 ("platform/x86: samsung-galaxybook: Add samsung-galaxybook driver")
> 
> Tested with CONFIG_DEBUG_LOCK_ALLOC=y on a Samsung Galaxy Book2 Pro.
> 
> [1]: https://lore.kernel.org/linux-next/20250206133652.71bbf1d3@canb.auug.org.au/
> 
> Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>
> ---
>  drivers/platform/x86/samsung-galaxybook.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
> index 9c658a45d..de1ed2dc6 100644
> --- a/drivers/platform/x86/samsung-galaxybook.c
> +++ b/drivers/platform/x86/samsung-galaxybook.c
> @@ -1011,13 +1011,13 @@ static int galaxybook_fw_attr_init(struct samsung_galaxybook *galaxybook,
>  	attrs[2] = &fw_attr_possible_values.attr;
>  	attrs[3] = &fw_attr_display_name_language_code.attr;
>  
> -	sysfs_attr_init(&fw_attr.display_name);
> +	sysfs_attr_init(&fw_attr->display_name.attr);
>  	fw_attr->display_name.attr.name = "display_name";
>  	fw_attr->display_name.attr.mode = 0444;
>  	fw_attr->display_name.show = display_name_show;
>  	attrs[4] = &fw_attr->display_name.attr;
>  
> -	sysfs_attr_init(&fw_attr.current_value);
> +	sysfs_attr_init(&fw_attr->current_value.attr);
>  	fw_attr->current_value.attr.name = "current_value";
>  	fw_attr->current_value.attr.mode = 0644;
>  	fw_attr->current_value.show = current_value_show;
> 

Thanks, I've folded this into the commit that already was in the
review-ilpo-next branch.

-- 
 i.

