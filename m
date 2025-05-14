Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5DB275108
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226210; cv=none; b=fmHEBMpfE79obJENW9IFCg0GMLtD8G3e5rXys0BQ/NI6FKyPeloNZyk1MpsYmo0TUZjjz6VVmkb0tlEHXsNiuCH5sBX/LVttuhkUQ31PgS5LpMMEmnCqrXu7teeNGSJEfX52WhWrx0/sdcWZ3xODd2oVHUgvftrK3V5JYSwPDrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226210; c=relaxed/simple;
	bh=0kks8lGClkfaxGAlgXf8hVUn/Nwh5f+6k11L7vteyiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jrt3/OnZ2B8q5gDi8MTbFY8Q0wfAfZpf1zApvkkDvTYGBmmy16plBxUaTBGZc2DqUNmSEhmAMS74JYRkTqI6gZ02sSXD0SoHN36elvopkOBjcPL6oziQGu9LKpwivOGP1m8lF3+FCLjGBebO0BEww3smpAHn+t61HsuaShFPgh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZTRyECGH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZTRyECGH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3F2C4CEE9;
	Wed, 14 May 2025 12:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747226209;
	bh=0kks8lGClkfaxGAlgXf8hVUn/Nwh5f+6k11L7vteyiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZTRyECGHDMj8spWXl55a7VJksRb+AVc2hjBNIvZb4f76/jylzq/ofcgQJW3/cYpxL
	 gDsNKbw0skQy9asnZBsg9w61U6XjZKrLDmrebFQIIh18EjTSCG6SZ0m6B17aFxWUnG
	 46Wj+OcJpwBo2E8lwPLvDzix6bpDy5FpITRT3xJI=
Date: Wed, 14 May 2025 14:35:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: david.m.ertman@intel.com, ira.weiny@intel.com, lee@kernel.org,
	andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
	heikki.krogerus@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] driver core: auxiliary bus: Introduce auxiliary
 device resource management
Message-ID: <2025051433-fade-flirt-d3e0@gregkh>
References: <20250514122432.4019606-1-raag.jadav@intel.com>
 <20250514122432.4019606-2-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514122432.4019606-2-raag.jadav@intel.com>

On Wed, May 14, 2025 at 05:54:31PM +0530, Raag Jadav wrote:
> With more and more drivers adopting to auxiliary bus infrastructure comes
> the need for managing resources at auxiliary device level. This is useful
> for cases where parent device shares variable number and type of resources
> with auxiliary child device but doesn't require any active involvement in
> managing them.
> 
> This reduces potential duplication of resource APIs that may be required by
> parent device driver. With this in place parent driver will be responsible
> for filling up respective resources and its count in auxiliary device
> structure before registering it, so that the leaf drivers can utilize in
> their probe function. Lifecycle of these resources will be as long as the
> auxiliary device exists.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/base/auxiliary.c      | 145 ++++++++++++++++++++++++++++++++++
>  include/linux/auxiliary_bus.h |  18 +++++
>  2 files changed, 163 insertions(+)

Sorry, but again, you are not following the required rules for Intel
kernel submissions for this subsystem.  Please work with the Intel
kernel team to fix this up before you resend.

greg k-h
