Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650A41D63DD;
	Mon,  3 Feb 2025 16:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599032; cv=none; b=Hb0jyyyTZltzbQVA8KzAyZeKiHPtNIIqhDMryiDgF/CGZCINo7AHIBMDCoM9WiqvOZAoeOpptgjM0MMaNMDyAlVJ+1Uyc8Crujh+/bG2MGgcnj/+GXO/W+A9yhWTC7btZfk+vdFXVtqWmXkUcwdswyo+B5TdoDjKBaXE1u+lXnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599032; c=relaxed/simple;
	bh=Bid4NUaBJgfgo4EhjzGjk+EEkbOGLFRWm5bchihD9dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D511jFm0xgmURqpbrmNCzQqDeF+eDylH+zxfhwECs3ggCsr0apokdSVGEa5K7fEaB7McyNYLBKRaJtd546RhkO2n5KcOct8qyauv/sEa4HcNxhWdWA7xGyFDApN1bQJIUrAj1U90SHcPGngAp5R2AoenK3E2Ovw+o0Kd6w8tI/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGcv78zl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGcv78zl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738599031; x=1770135031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bid4NUaBJgfgo4EhjzGjk+EEkbOGLFRWm5bchihD9dM=;
  b=MGcv78zlYri6FA7MCPVtZYCgTJ47wvYorYx4LrHAlS3PoZRX+15J70CP
   UUuI/yv71SU+DN+r2mK8foR1BXsnM2W6R5SJAevEf6lljp/37DhhNMm9a
   wsfhjdz+QLC7VA8np7e6kx6841vJXU1VnN14Y+wDCw5ZAWlCUXghgrzvQ
   McJvkQKmoIATNfE0WhDunlprV+aeyw/yPfvf9p0H/vvT6eP9dl5sZJJyF
   5m3UiOLdNbn8gljDXqkzXWah+7EIjqNeolJ+YHRR71mQkOP5Cv0HRXXE7
   LVZbJ7PvyTXuBJipy/x0BfNSqYWOYgNpHOQnbCkYpiH1aicB6Y0+SpFpd
   g==;
X-CSE-ConnectionGUID: cSXTRyUZQOKeyugphsyWfA==
X-CSE-MsgGUID: JjlkN6WlSWe4F9txHzmV+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39128938"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="39128938"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 08:10:30 -0800
X-CSE-ConnectionGUID: yZ0vJj1kR9SpP01Dt4UKiA==
X-CSE-MsgGUID: 46b+I4nDSt+1QBgWNAICzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110781937"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 08:10:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tez1i-00000007sms-0SG0;
	Mon, 03 Feb 2025 18:10:22 +0200
Date: Mon, 3 Feb 2025 18:10:21 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/3] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <Z6DqbURqt0EDg5mV@smile.fi.intel.com>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020326-backer-vendetta-7094@gregkh>
 <Z6DchyPieQKBJ0SN@smile.fi.intel.com>
 <2025020300-gown-outmatch-1343@gregkh>
 <Z6DpP3qMNYZoKEP2@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6DpP3qMNYZoKEP2@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 06:05:20PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 03, 2025 at 04:35:45PM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Feb 03, 2025 at 05:11:03PM +0200, Andy Shevchenko wrote:
> > > On Mon, Feb 03, 2025 at 03:25:17PM +0100, Greg Kroah-Hartman wrote:

...

> > > > +	faux_obj = kzalloc(sizeof(*faux_obj) + strlen(name) + 1, GFP_KERNEL);
> > > 
> > > Potential overflow. To avoid one may use struct_size() from overflow.h.
> > 
> > Users should not be providing the string here.  Again, this comes from
> > platform.c.
> 
> I'm not sure I follow. The name parameter is not limited anyhow, so one may
> provide non-terminated string and strlen() will return an arbitrary number.
> Potentially this can lead to big numbers and become an overflow when gets
> to a parameter for kmalloc(). This most likely never happen in real life,
> but still the overflow is possible.

After reading your other messages I got what you are talking about here.
Now it's all clear.

-- 
With Best Regards,
Andy Shevchenko


