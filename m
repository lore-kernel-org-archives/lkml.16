Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D35127585C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832741; cv=none; b=G+lArbVI7mEvF2Zee3ZhQHPiZ9TRUQXce3R4bDxxyxprWe4qpATUCBpFGR8voA0FykVUHDyNpJ1JWIvwG6knYfkSt2sJfPILAfGKchgkziRafV945VV410+FGunI8laUt38CBcvE2rYm6iytrLFoKm8L+YCJ6I9LjmlAJSYI9Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832741; c=relaxed/simple;
	bh=9VcR/EHpoidSWxWtUafWpiRWM9KYXGtbg6zPLkMzGWQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=RVHQEmGroham+0R04pz3bWHiun71lZ/mW9Qzt+9E8tb977Jy9rfslBrir2UlO/3TNw/2XCXR4EB7Mgf7sUwfDIrv1zWlR/Z5GRkfe9L7YEPR2oHBO/9ESR8otXrcJgAl5EcAT0pqMMgCWB9CJU7DHPAMi4VDHtK1Pxl5IFMGljg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AV645y7u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AV645y7u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86CB1C4CEE4;
	Mon, 28 Apr 2025 09:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745832740;
	bh=9VcR/EHpoidSWxWtUafWpiRWM9KYXGtbg6zPLkMzGWQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AV645y7u8iO0bzDBDfqA9CHCrzKvvPUc20rqcCGkJX9T8gmb9mlO4l/npgj+qM6ai
	 /emqTmIIUotn+P0BWSRbLukykXbZLejtuV2ZDr+0xJowRIgvbr0wpB8giRbojqrY5Q
	 SHyYWBGxxzMS8rvqdwexzmHSL4BJO9qYg2riFGgo=
Date: Mon, 28 Apr 2025 02:32:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandru Ardelean <aardelean@baylibre.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] util_macros.h: Make the header more resilient
Message-Id: <20250428023220.7cfab2286bb94f25c6bf7ca9@linux-foundation.org>
In-Reply-To: <20250428072754.3265274-1-andriy.shevchenko@linux.intel.com>
References: <20250428072754.3265274-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Apr 2025 10:27:54 +0300 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Add missing header inclusions and protect against double inclusion.

The patch doesn't "protect against double inclusion"?

> --- a/include/linux/util_macros.h
> +++ b/include/linux/util_macros.h
> @@ -2,7 +2,10 @@
>  #ifndef _LINUX_HELPER_MACROS_H_
>  #define _LINUX_HELPER_MACROS_H_
>  
> +#include <linux/compiler_attributes.h>
>  #include <linux/math.h>
> +#include <linux/typecheck.h>
> +#include <linux/stddef.h>
>  
>  /**
>   * for_each_if - helper for handling conditionals in various for_each macros
> -- 
> 2.47.2
