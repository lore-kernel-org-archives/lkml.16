Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B683239E8B;
	Thu,  8 May 2025 14:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713040; cv=none; b=ORuRPJ/n2+Rn2OwkFsm4TvVzH1cxTQOfCM4KsBas0nu6qiWhiQ1CRLvmqItCGvFY1XYlvy677IhV8rXgIFiVX1agGx8En/9ogd+W02MyATs2C8BCHelm0yDJjNYhSrEhJZ2dFmjleyhOJsKhFIG1eRmWuCzBfoURvq8KF3nWDVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713040; c=relaxed/simple;
	bh=llb/LlR9mKdEHBYLwZQK4M2oVWBLY0eAXvvCzQKnzp4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MPM1Lu8LFuFAJOWMNGPimf7duj94yVMuXSnFH8rLUcqx6SEhX//Okp1r9/nHqsRR3Fwh6EOxans1tlqLI3AhuGhwz6VcNihjqHG8TF5Kavg2d23BHEff7cbnJ0VdnHNZsLZB5Szmh7xhwVevO9HkEFXOuJ0LEZ0g3ycDH2ga+uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HV2cfsmG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HV2cfsmG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746713039; x=1778249039;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=llb/LlR9mKdEHBYLwZQK4M2oVWBLY0eAXvvCzQKnzp4=;
  b=HV2cfsmGnNmx8ZCIun6f8zlMF7FN4oIOISFDbZPhROwo97hoBS7VkNqs
   /CQyIS02+CLzXrjmSqX6bNuWnZmDlo+6qjJZul8i1k5p8f8NXiypDZRVL
   PEgmvqIDHFehp8E24nJU4BgbdBG/ieZ/UpqBKwZqzpDIOqxrANYMpMqUX
   Y5VvpguzC8UvfdzMofJHalAMb9nnuba0QXiZXop1ftA4WIIK+FdSlZVIl
   LZHG0KqsAv2zLv5UuFEIZncpsSIpf7RQI1vzX/OCOQDVYS79i89wDirzv
   rm200Koi2U1E83APf2oSDJXER1VgfazYclS7jv4RuJtByg0RAn1rM6h4u
   Q==;
X-CSE-ConnectionGUID: krvGkj8vSsWus67HaxUCcQ==
X-CSE-MsgGUID: Xjt33pqFTze6tetaPNA1Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="36128345"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="36128345"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:03:58 -0700
X-CSE-ConnectionGUID: gyqhtP6eR+GLk+jl+PvgHQ==
X-CSE-MsgGUID: fk+NN7SZQ12gh/Pac3fHSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136824841"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:03:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 8 May 2025 17:03:51 +0300 (EEST)
To: Mark Pearson <mpearson-lenovo@squebb.ca>
cc: Hans de Goede <hdegoede@redhat.com>, ikepanhc@gmail.com, W_Armin@gmx.de, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    ibm-acpi-devel@lists.sourceforge.net
Subject: Re: [PATCH 2/2] platform/x86: export thinkpad_acpi handles
In-Reply-To: <20250507190456.3004367-2-mpearson-lenovo@squebb.ca>
Message-ID: <6feeae5a-3928-8198-7ed6-2080c929d7c5@linux.intel.com>
References: <mpearson-lenovo@squebb.ca> <20250507190456.3004367-1-mpearson-lenovo@squebb.ca> <20250507190456.3004367-2-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 May 2025, Mark Pearson wrote:

> Add API to be able to get the thinkpad_acpi various handles.
> 
> Will use this to start pulling some of the thinkpad_acpi functionality
> into separate modules in the future.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 18 ++++++++++++++++++
>  include/linux/thinkpad_acpi.h               | 17 +++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 include/linux/thinkpad_acpi.h
> 
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 7dd4abf47f61..0eb33b4c99cf 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -67,6 +67,7 @@
>  #include <linux/string.h>
>  #include <linux/string_helpers.h>
>  #include <linux/sysfs.h>
> +#include <linux/thinkpad_acpi.h>
>  #include <linux/types.h>
>  #include <linux/uaccess.h>
>  #include <linux/units.h>
> @@ -606,6 +607,23 @@ TPACPI_HANDLE(hkey, ec, "\\_SB.HKEY",	/* 600e/x, 770e, 770x */
>   * ACPI helpers
>   */
>  
> +int tp_acpi_get_handle(enum tp_acpi_handle_id handle_id, acpi_handle *handle)
> +{
> +	switch (handle_id) {
> +	case TP_ROOT_HANDLE:
> +		*handle = root_handle;
> +		return 0;
> +	case TP_EC_HANDLE:
> +		*handle = ec_handle;
> +		return 0;
> +	case TP_HKEY_HANDLE:
> +		*handle = hkey_handle;
> +		return 0;
> +	}
> +	return -ENODEV;
> +}
> +EXPORT_SYMBOL_GPL(tp_acpi_get_handle);

Please put these symbols into a namespace.

> +
>  static int acpi_evalf(acpi_handle handle,
>  		      int *res, char *method, char *fmt, ...)
>  {
> diff --git a/include/linux/thinkpad_acpi.h b/include/linux/thinkpad_acpi.h
> new file mode 100644
> index 000000000000..eb5273464658
> --- /dev/null
> +++ b/include/linux/thinkpad_acpi.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Thinkpad ACPI driver API
> + */
> +
> +#ifndef _TP_ACPI_H_
> +#define _TP_ACPI_H_
> +
> +enum tp_acpi_handle_id {
> +	TP_ROOT_HANDLE,
> +	TP_EC_HANDLE,
> +	TP_HKEY_HANDLE,
> +};
> +
> +int tp_acpi_get_handle(enum tp_acpi_handle_id handle_id, acpi_handle *handle);
> +
> +#endif /* _TP_ACPI_H */
> 

I suggest you send this in the series that introduces an user for this 
interface.

-- 
 i.

