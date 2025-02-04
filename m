Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B668635E;
	Tue,  4 Feb 2025 08:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738656458; cv=none; b=uMdy7FsbdfJDlkjTCTcdZ5uWiMux3KJzI9A4sz+joMV9gGvi3NOPfa17htao1tiyAG81zQIECC3HHCYKWxbTYZMaVr0astCfkvXm/Hl6mlebogySWimyODk2EGO/FSS7IUoU2wIGTS6aPZyNFS3CJPuXez+daVeERRzFmH7Fifw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738656458; c=relaxed/simple;
	bh=r9TLmA9/WZWk+LmP47qvtpsschxzMwnvqbIcWOhTw8c=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=G0PnfKt+f9Hlvf1eeJi66HdzIM3BzF+40CQw0xW3t3AAZjGJuK2zREzqjZfEMBZMgyOpWqdM8M6WtZENX4iP39fOTzKuiStO6bYq7h88kKTWATx8bz6h3arT5zAypaYUCWffN5ZB8HeEr8ljT/DrRYqMqVQs3AQvK7+x1E5EegI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eK0C6BFX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eK0C6BFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738656457; x=1770192457;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=r9TLmA9/WZWk+LmP47qvtpsschxzMwnvqbIcWOhTw8c=;
  b=eK0C6BFXZsoKB13UCXqiPqiYuzKJYbkx1PRK6Xp4WaIazwHX4CQKVR8B
   Rg3lJ9fPryEFa1Mz66fzUUwwA5sIbShewJShalX6Wq0PIYpcSpCpm/ybx
   uwq7R5UyMZ4GNhJUZwEsFtvMmkgOZ0Cqzmc1IS+so+u4PplyjtWND1U5n
   +YJGXHHPU6xGsjI+fr9gWfIXkO/npG5W5c2+lBfTvk+V3mxUosOoqApWK
   FlzTOwWVbbbHekicjRQ8J1OtuD7taHAtCUzfBp/RmeciRcK8y6Z4hnWC7
   CTqib3F4Hb3VSHtDcMUfeMOHIYyFB2LmH7BP7OemneAZSL5X+n/g+VTL/
   Q==;
X-CSE-ConnectionGUID: bIO9y8mWSlar5kf9QNKS9A==
X-CSE-MsgGUID: 0P3F3HRnTvmPV2USwKRCGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="26772113"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="26772113"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 00:07:36 -0800
X-CSE-ConnectionGUID: Gpv2k4NMTwav5AbLDhiOKg==
X-CSE-MsgGUID: AxWs5vyBR/S2yAQqnxR43Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115141667"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.75])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 00:07:32 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 4 Feb 2025 10:07:29 +0200 (EET)
To: Jithu Joseph <jithu.joseph@intel.com>
cc: Hans de Goede <hdegoede@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, tony.luck@intel.com, 
    ashok.raj.linux@gmail.com, anisse@astier.eu
Subject: Re: [PATCH] platform/x86/intel/ifs: Update documentation with image
 download path
In-Reply-To: <20250131205315.1585663-1-jithu.joseph@intel.com>
Message-ID: <50ba78dc-f60d-63de-80fd-ef9b1fc68c72@linux.intel.com>
References: <20250131205315.1585663-1-jithu.joseph@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 31 Jan 2025, Jithu Joseph wrote:

> The documentation previously listed the path to download In Field Scan
> (IFS) test images as "TBD".
> 
> Update the documentation to include the correct image download location.
> Also move the download link to the appropriate section within the doc.
> 
> Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>

I've applied this patch into the fixes branch with Anisse added as
Reported-by.

Thanks Anisse for raising this issue and Jithu for getting the gears 
moving to provide an useful resolution.

> ---
>  drivers/platform/x86/intel/ifs/ifs.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/ifs/ifs.h b/drivers/platform/x86/intel/ifs/ifs.h
> index 5c3c0dfa1bf8..41fc21e7ef14 100644
> --- a/drivers/platform/x86/intel/ifs/ifs.h
> +++ b/drivers/platform/x86/intel/ifs/ifs.h
> @@ -23,12 +23,14 @@
>   * IFS Image
>   * ---------
>   *
> - * Intel provides a firmware file containing the scan tests via
> - * github [#f1]_.  Similar to microcode there is a separate file for each
> + * Intel provides firmware files containing the scan tests via the webpage [#f1]_.
> + * Look under "In-Field Scan Test Images Download" section towards the
> + * end of the page. Similar to microcode there are separate files for each
>   * family-model-stepping. IFS Images are not applicable for some test types.
>   * Wherever applicable the sysfs directory would provide a "current_batch" file
>   * (see below) for loading the image.
>   *
> + * .. [#f1] https://intel.com/InFieldScan
>   *
>   * IFS Image Loading
>   * -----------------
> @@ -125,9 +127,6 @@
>   * 2) Hardware allows for some number of cores to be tested in parallel.
>   * The driver does not make use of this, it only tests one core at a time.
>   *
> - * .. [#f1] https://github.com/intel/TBD
> - *
> - *
>   * Structural Based Functional Test at Field (SBAF):
>   * -------------------------------------------------
>   *
> 
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> 

-- 
 i.

