Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABDC1D416E;
	Thu, 10 Apr 2025 08:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273527; cv=none; b=qlgwGpV3kDOPFzm5Xf18V5ARRHXHUH7HpZrfgY+tNJdJBqxCDchq4QCKHsk56EVEQ1Noh1uM29dzjo1Oxn+D9SfVGRONhXdnTruPRYO8oKpyqA7GkpF52U0v80YSZT8W3HKRLYductjlAUaDMmDK5xnM6s+PNqTi0ZXfTD7tRUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273527; c=relaxed/simple;
	bh=LTEaIOzZ9jS93F48m6McJQ0UkNGLRlHGNRZyi80ytfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCfIH6Wh2d3NqEkoVornflY925XAkWTp4yFUZxjg3JtCXYZk7JuFyXXWRoqDA4i9uk0QRKOJpFVQboOo1d+bV2JyT3GIx9x2jDrHxPya7jsgb9svWMRPhaGJfkp1o0Oy4j3IiAlH67lWAt2yGeOh9cSijzxF9VvdUeO+DUMxFYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WL/HyhLm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WL/HyhLm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744273526; x=1775809526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LTEaIOzZ9jS93F48m6McJQ0UkNGLRlHGNRZyi80ytfc=;
  b=WL/HyhLmJp0SaLrN0CzQ5SPKBQkuIlbqg/mx/auSom/vcYdxIqCoe5vi
   vA1UWIXrSZl4akydcnjCsGuC7g5W3rOEbA6we7tb8RmvPdT4sLdUnZAfz
   bgfABr3Z4ZBFGZrkeDTKjChye/V5ZPweOEEBX7PXNJ+eEDoUIp8UuGCET
   2Ar0uvK/ur4EAEn0M2QP9G/uEEskk/tDPhWaslEce9hktP1y/Eo8H9hVo
   7yxKISax1s1W9sOx2t7eJi0GRBxhRodKQ4lV4/v+8ZdgAUMbLXWTyP+HL
   MVVqSgWH4DtrwOsDT8DiJQ2YsHvbtl9TTu32QTLioxQIwwGHke5xaH80N
   w==;
X-CSE-ConnectionGUID: IUez00Y1Q2WF9W9yfXEQMQ==
X-CSE-MsgGUID: fVZ8wqA6TuyrYbbQMTVUYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45494228"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45494228"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 01:25:25 -0700
X-CSE-ConnectionGUID: 30kkst3HR/WseVd3f0Edcw==
X-CSE-MsgGUID: qGRfzcUxRdiWk73u7bqZGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="129369246"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa010.fm.intel.com with SMTP; 10 Apr 2025 01:25:22 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 10 Apr 2025 11:25:21 +0300
Date: Thu, 10 Apr 2025 11:25:21 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: joswang <joswang1221@gmail.com>, Benson Leung <bleung@chromium.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jos Wang <joswang@lenovo.com>
Subject: Re: [PATCH 1/1] usb: typec: displayport: Receive DP Status Update
 NAK request exit dp altmode
Message-ID: <Z_eAcbVOrT5dn201@kuha.fi.intel.com>
References: <20250209071926.69625-1-joswang1221@gmail.com>
 <Z635BJNnFAiIFXxM@kuha.fi.intel.com>
 <2025041054-landside-filtrate-17b0@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025041054-landside-filtrate-17b0@gregkh>

On Thu, Apr 10, 2025 at 09:10:02AM +0200, Greg KH wrote:
> On Thu, Feb 13, 2025 at 03:52:04PM +0200, Heikki Krogerus wrote:
> > On Sun, Feb 09, 2025 at 03:19:26PM +0800, joswang wrote:
> > > From: Jos Wang <joswang@lenovo.com>
> > > 
> > > Although some Type-C DRD devices that do not support the DP Sink
> > > function (such as Huawei Mate 40Pro), the Source Port initiates
> > > Enter Mode CMD, but the device responds to Enter Mode ACK, the
> > > Source port then initiates DP Status Update CMD, and the device
> > > responds to DP Status Update NAK.
> > > 
> > > As PD2.0 spec ("6.4.4.3.4 Enter Mode Command")，A DR_Swap Message
> > > Shall Not be sent during Modal Operation between the Port Partners.
> > > At this time, the source port initiates DR_Swap message through the
> > > "echo device > /sys/class/typec/port0/data_role" command to switch
> > > the data role from host to device. The device will initiate a Hard
> > > Reset for recovery, resulting in the failure of data role swap.
> > > 
> > > Therefore, when DP Status Update NAK is received, Exit Mode CMD is
> > > initiated to exit the currently entered DP altmode.
> > > 
> > > Signed-off-by: Jos Wang <joswang@lenovo.com>
> > 
> > This looks okay to me, but Benson, can you take a look at this?
> 
> What ever happened to this patch?

Sorry Greg.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

-- 
heikki
