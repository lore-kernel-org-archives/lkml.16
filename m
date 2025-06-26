Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE44238141
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750975029; cv=none; b=W4L+xeixd7VCV+fN7fzTlEqHQONsxcQS98Ktlwffg/r67IaXs/r7iQe1lDk3pBgN3BX0zriskhaStLsKGlYq1Ka2yCm7M4wjfFKVIxy9gCUWOj7BinpkrZc4YzLN+q4RJmc06peVs2ePqaxGIyt24sEE20DqnCOY7qmly/y+r6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750975029; c=relaxed/simple;
	bh=Js1/egzHau8cSrZDfwFjSH4T2I0dLiLhlUWEZZFXbB8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyFmCpMzHg+V1Iaj+wumUEOQGG5R92UaXZM5xvNtWdvrQJzRAvS56Gr0Tyj6jDgcOV0v+PVe774wfC5korWmzgVGyYhV3lMPwxlGhXPYxL5AVqPxUkWEoRD8Y4VhGGiefWLmRi6C6PonndamWZEL+avPEXdsxRsFp8pHUU+hMhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 7adf1deb-52d8-11f0-a5c4-005056bdf889;
	Fri, 27 Jun 2025 00:56:58 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 27 Jun 2025 00:56:57 +0300
To: Ira Weiny <ira.weiny@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v1 1/1] libnvdimm: Don't use "proxy" headers
Message-ID: <aF3CKcVoO4aebaaG@surfacebook.localdomain>
References: <20250626153523.323447-1-andriy.shevchenko@linux.intel.com>
 <685dbdfb80651_2ce8302947e@iweiny-mobl.notmuch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <685dbdfb80651_2ce8302947e@iweiny-mobl.notmuch>

Thu, Jun 26, 2025 at 04:39:07PM -0500, Ira Weiny kirjoitti:
> Andy Shevchenko wrote:

...


> > +#include <linux/ioport.h>
> 
> If we are going in this direction why include ioport vs forward declaring
> struct resource?


I don't know where I looked when added this. This should be io.h.
And yes, we need forward declarations for struct resource and struct kobject.

...


> > -#include <linux/spinlock.h>
> > -#include <linux/bio.h>
> 
> I'm leaning toward including bio, module, and sysfs rather than do the
> forward declarations.

Header already uses forward declarations.

> Are forward declarations preferred these days?

Always with the dependency hell we have. For example, if we go your way we
would need to include of.h which is yet another monsteur. I prefer to use
this patch as provided.


-- 
With Best Regards,
Andy Shevchenko


