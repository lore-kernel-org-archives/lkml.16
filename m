Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6800E21B9DB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751443677; cv=none; b=Pvdb0F1tGTFOu8aXBhuSraoCACariwtIhmRAqFZywk7N36RL1G12Csi0oSLn7mANB/OzcqPvNEjcbc2M4uH/zDhNXUpw84iT+WhT8yHtCW36yieimVpqX5twCTccYSRuSQQ696nZLe1CWw7O3qixruckx6P41lB9bS20l0HdxIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751443677; c=relaxed/simple;
	bh=np023mOb3DD2htXLxNIB8JLaMIwLfF2Ws8IQ32TqBhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtflRimR0/ltc6Cy+oZ46fWxVu/C/2qix/t/Fe/mwKkbDOMAdARtLVPNLCb5JvIMMTtqW04IY4UYXkqrSNM5v6DF+pHJ+dgd1n2zC0dhaT6ZFC4l9/CWB8QDkb/2k2u1plwVBkd29cYiZmyeLGdxcU3Yim4o4dYIqd/Bk7qcsFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGx9eM1X; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGx9eM1X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751443676; x=1782979676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=np023mOb3DD2htXLxNIB8JLaMIwLfF2Ws8IQ32TqBhU=;
  b=FGx9eM1XgJJDo/ps5PX5tDvu4QdkGvGeDK44dUs2fjAV3d1GrKRcgupJ
   4ic4P8V6KwvJHMjQ2dPyNzkvqcCbiMooroiHjXJkAmhjEFYtNoG05DWji
   SvFbIlvfa4Vdn4HXThic1kaa5S4s+eXsel+W9Nd6jtugn3GwHKS0smxJi
   yWAgWfdxuhORiYO4L2C+UWSYh2v5qpgE0HMOkFRJZ1jE47yPdSsC+j9yr
   QRzEhBsTmiuKh7erBiuubX+gB5lAInJPyEWD6RCeBYDbeAw5rB+3FfGJ3
   jYrFbok0XQP5c04lqeRzWNOA9FOOiWGAIHqfjxna+UJHfyx884UFAMXPN
   g==;
X-CSE-ConnectionGUID: u9uWu0ZBR7qXgOxuEzbvng==
X-CSE-MsgGUID: zgRsn+EnRsCO/BBEP3PP3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53869221"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53869221"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 01:07:48 -0700
X-CSE-ConnectionGUID: 6DkNqkOtSWWQxBNvvM/HAw==
X-CSE-MsgGUID: R79Uugj9Ro6VuEAr1ADXNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="185045306"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 01:07:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWsVM-0000000BrOx-1GQE;
	Wed, 02 Jul 2025 11:07:44 +0300
Date: Wed, 2 Jul 2025 11:07:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/vsprintf: include stdarg.h from sprintf.h to provide
 va_list
Message-ID: <aGTo0FBpm50EhCc5@smile.fi.intel.com>
References: <hm3lxgfzjhxigj5no5csubdo6kolvdjwyhpveirbzptcdbmcag@tqunw2rllae4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hm3lxgfzjhxigj5no5csubdo6kolvdjwyhpveirbzptcdbmcag@tqunw2rllae4>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 01, 2025 at 09:27:24PM -0700, Dmitry Torokhov wrote:
> Declarations in sprintf.h use va_list so it needs to include stdarg.h,
> otherwise we may be getting warnings like this:
> 
> ./include/linux/sprintf.h:11:54: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
>    11 | __printf(2, 0) int vsprintf(char *buf, const char *, va_list);
>       |                                                      ^
>       |                                                      int

Ah, thanks for a good catch!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


