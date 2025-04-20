Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640911B87F3
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 06:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745132139; cv=none; b=uwbahwGiIaLEf68TDcLEEknYiq8U601c1GK/YWIuEA/PfuaDjLAJ1RgK6lZzs7x3kq2X8dyzh8Qv/ZxCfgV+ujmy8oCXBBUUfGTAtiU8MLoLuy/jiI0mRJZxz+6+M4bsbkntWK71SDeo/N8XGkh3Dlc2ApkDbjDI3R4dyp8ArI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745132139; c=relaxed/simple;
	bh=EssljxfrU/0ZQyr0hXBVw1dIjTN8kZeOHqbnHqZRwY0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2xirLcipYIRuONvijhPw9Kt4lDSbS58ctH3TEZ7fCEltFfx+8jrjMyDeN+IKypYt5x3CKD5NGJ+Vwmur4BoacmgaK4M+Qstcz+oX814m14sdgKyeUTEWHpg+Y//QKSwtjaOUEFfsOnijkhG23c5Un3xSv65hEbmDb/1k81aJRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 4c3cf7e2-1db4-11f0-8eea-005056bdfda7;
	Sun, 20 Apr 2025 09:54:26 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 20 Apr 2025 09:54:25 +0300
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] usb: Add checks for snprintf() calls in
 usb_alloc_dev()
Message-ID: <aASaIR3e3cDxU4NP@surfacebook.localdomain>
References: <20250321164949.423957-1-andriy.shevchenko@linux.intel.com>
 <aAPO3P1_-C7Nhil4@smile.fi.intel.com>
 <2025042041-uninstall-expansive-04c3@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025042041-uninstall-expansive-04c3@gregkh>

Sun, Apr 20, 2025 at 08:27:59AM +0200, Greg Kroah-Hartman kirjoitti:
> On Sat, Apr 19, 2025 at 07:27:08PM +0300, Andy Shevchenko wrote:
> > On Fri, Mar 21, 2025 at 06:49:49PM +0200, Andy Shevchenko wrote:
> > > When creating a device path in the driver the snprintf() takes
> > > up to 16 characters long argument along with the additional up to
> > > 12 characters for the signed integer (as it can't see the actual limits)
> > > and tries to pack this into 16 bytes array. GCC complains about that
> > > when build with `make W=1`:
> > > 
> > >   drivers/usb/core/usb.c:705:25: note: ‘snprintf’ output between 3 and 28 bytes into a destination of size 16
> > > 
> > > Since everything works until now, let's just check for the potential
> > > buffer overflow and bail out. It is most likely a never happen situation,
> > > but at least it makes GCC happy.
> > 
> > Any comments anybody?
> 
> It's been added to my tree last week, 

Thank you!

> why comment again?

Ah, I missed that, too many emails lately. :-(

> confused,

-- 
With Best Regards,
Andy Shevchenko


