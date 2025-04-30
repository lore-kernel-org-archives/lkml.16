Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F0F2B9A9;
	Wed, 30 Apr 2025 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017047; cv=none; b=oKsm76DRhczxlZWtv/ZxwrkkmWPSAQkAnLro5cuI7ES7P4BfmEF26/KZSyoWbQ1YTcTuRpgygVHRkyDNAjLSDRfq5IOuvxHyqa2/o7+B72Lw9/yyET+DxHZJEJ9KwRcVCEIW84/ashrJ3eGa30FtR8kli859S8BW9bt5vd8/zyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017047; c=relaxed/simple;
	bh=VXBIybFK7Mvvp8Ays0VhLXWZXFABYCWxcD6KJFE4vr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nz4S63AzBQMSqrKxQEcFynnt9igC1tLfR+/iu8ly+md0GJssWn3UahatZWqgFckSzH3s5Uhac2SjtLgtxfd6FiMt3vK1XJkGUxF+EyKCWldb+CbT61M2O3Ba9tNj5dMmFtKQrb0gQPSgRStrJG6WVVc/Hp3L04QmDBGpH42MTNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D113106F;
	Wed, 30 Apr 2025 05:43:57 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 935FC3F673;
	Wed, 30 Apr 2025 05:44:02 -0700 (PDT)
Date: Wed, 30 Apr 2025 13:43:55 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, johan@kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 2/3] firmware: arm_scmi: Add Quirks framework
Message-ID: <aBIbC15NiqUseZc7@pluto>
References: <20250429141108.406045-1-cristian.marussi@arm.com>
 <20250429141108.406045-3-cristian.marussi@arm.com>
 <aBHXHnXA95TwJths@pluto>
 <868qnhj2yf.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868qnhj2yf.wl-maz@kernel.org>

On Wed, Apr 30, 2025 at 12:36:40PM +0100, Marc Zyngier wrote:
> On Wed, 30 Apr 2025 08:54:06 +0100,
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> > 
> > On Tue, Apr 29, 2025 at 03:11:07PM +0100, Cristian Marussi wrote:
> > > Add a common framework to describe SCMI quirks and associate them with a
> > > specific platform or a specific set of SCMI firmware versions.
> > > 
> > > All the matching SCMI quirks will be enabled when the SCMI core stack
> > > probes and after all the needed SCMI firmware versioning information was
> > > retrieved using Base protocol.
> > > 
> > > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > 
> > Hi
> > 
> > just a quick remarks that a bot spotted the usage of __VA_OPT__ which is
> > only available since GCC >= 8.0 :< ... so I will probably revert to use the
> > previous, less clean, mechanism to build the NULL terminated array in
> > which the compats array WILL HAVE to be explicitly NULL terminated when
> > provided (even the empty ones...)
> 
> See 20250407094116.1339199-1-arnd@kernel.org, which is slated for
> 6.16. The TL;DR is that GCC 8.1 and binutils 2.30 should be the
> minimal versions from 6.16 onwards.
> 
> So it's probably not worth using ugly hacks that will eventually be
> reverted.

Great news, thanks for the heads-up !

Thanks,
Cristian
