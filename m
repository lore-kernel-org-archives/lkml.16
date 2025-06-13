Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D161A3168
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 21:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749851549; cv=none; b=O75EXM1OUDJonxk7scGbDRCrD4YFJT7v/ZhMKrnFK3hXdUnYoZMnQ8t9xlMB0IyBAK4/W50vIGPYXOtDoLBQBsvh4zlw8bRZK8zXa3QM51vWxWqiDEzPE0VGiTtL6uvqWeELmmMKyhdb0BtejPt3lgHiiW6IHj5sCNUQXGLHXzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749851549; c=relaxed/simple;
	bh=pqrsu9Rk23bn+FnyFGlSR9nDXVGagaQEyjCqJLSTHGI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vtkp3uzSUpNyAnQIExmmdRVj/BKwCrJoEV+6EPRzlOTrKOlbcFA7jO319NjdygRSilPgkZ2Rv0iXW3qbwYT8+Y4qdDu2flcC54cujZoDdgypnJ3Zqu5GxhDurk+hhgkUbz7AXn+Ok2edCKUtkdH5bF72eBTuc2YDNir05TMKo6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id acff03e0-48a0-11f0-a97f-005056bdfda7;
	Sat, 14 Jun 2025 00:52:18 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 14 Jun 2025 00:52:18 +0300
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v1 1/1] MIPS: Alchemy: Remove unused forward declaration
Message-ID: <aEydkh4EkKu6w2NJ@surfacebook.localdomain>
References: <20250531194346.3630898-1-andriy.shevchenko@linux.intel.com>
 <aEv_y5Lfe3Dul48I@smile.fi.intel.com>
 <aEwMFVSPzc-mV1ve@alpha.franken.de>
 <aEweZReuPzQ_hq8L@smile.fi.intel.com>
 <aEwy2Ud08nHHAdED@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEwy2Ud08nHHAdED@alpha.franken.de>

Fri, Jun 13, 2025 at 04:16:57PM +0200, Thomas Bogendoerfer kirjoitti:
> On Fri, Jun 13, 2025 at 03:49:41PM +0300, Andy Shevchenko wrote:
> > On Fri, Jun 13, 2025 at 01:31:33PM +0200, Thomas Bogendoerfer wrote:
> > > On Fri, Jun 13, 2025 at 01:39:07PM +0300, Andy Shevchenko wrote:
> > > > On Sat, May 31, 2025 at 10:43:46PM +0300, Andy Shevchenko wrote:

...

> > > > I think we can take it via GPIO tree if there is no reply.
> > > 
> > > please do
> > 
> > Acked-by?
> 
> Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thank you! Bart, seems we are all set to route this via GPIO tree. Do you have
any objections?

-- 
With Best Regards,
Andy Shevchenko


