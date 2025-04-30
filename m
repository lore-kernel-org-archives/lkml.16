Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27C125A2A1;
	Wed, 30 Apr 2025 15:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026785; cv=none; b=Ayc+HMfNA62bp/+00vsquuRDLI4ZSgoXfpiMcK/picaFUdMD1psstcKoCqXVvg2duOIe0l9l2S6pUuM+D7oVCUrlGCwvSYFW1IqPlDIZTC8eACEPh9VD0hcLIn/HqSqGQ6WiN2InkrDFUlBxoFz+tAPvrIF/9+iu1eJTzuRbo9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026785; c=relaxed/simple;
	bh=oaXVaoW4eCBfOW1bt+Lp+Ta3/NgC1ne5TojByxlIGWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXrqdZsEJH7opB7wPtF7E1d09G0kLONsDXEFMJ2ML20dNMe9g3WtAQeS+7ApxZLIMdTNOCkolPSLu3smg0cnGz7NfyzYcDWCF2l8awGAM/d1aFGioRyqKC9Yt2umr6Lq0df04aDe6QWHlL3sQyGGgbswBkncMy8mzmo1DqxV8vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A3E51063;
	Wed, 30 Apr 2025 08:26:15 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3A8E3F5A1;
	Wed, 30 Apr 2025 08:26:19 -0700 (PDT)
Date: Wed, 30 Apr 2025 16:26:17 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <arm-scmi@vger.kernel.org>,
	<james.quinlan@broadcom.com>, <f.fainelli@gmail.com>,
	<vincent.guittot@linaro.org>, <peng.fan@oss.nxp.com>,
	<michal.simek@amd.com>, <quic_sibis@quicinc.com>,
	<dan.carpenter@linaro.org>, <johan@kernel.org>,
	"Arnd Bergmann" <arnd@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 2/3] firmware: arm_scmi: Add Quirks framework
Message-ID: <20250430-efficient-spider-of-criticism-e857bf@sudeepholla>
References: <20250429141108.406045-1-cristian.marussi@arm.com>
 <20250429141108.406045-3-cristian.marussi@arm.com>
 <aBHXHnXA95TwJths@pluto>
 <868qnhj2yf.wl-maz@kernel.org>
 <aBIbC15NiqUseZc7@pluto>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBIbC15NiqUseZc7@pluto>

+Arnd

On Wed, Apr 30, 2025 at 01:43:55PM +0100, Cristian Marussi wrote:
> On Wed, Apr 30, 2025 at 12:36:40PM +0100, Marc Zyngier wrote:
> > On Wed, 30 Apr 2025 08:54:06 +0100,
> > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > 
> > > On Tue, Apr 29, 2025 at 03:11:07PM +0100, Cristian Marussi wrote:
> > > > Add a common framework to describe SCMI quirks and associate them with a
> > > > specific platform or a specific set of SCMI firmware versions.
> > > > 
> > > > All the matching SCMI quirks will be enabled when the SCMI core stack
> > > > probes and after all the needed SCMI firmware versioning information was
> > > > retrieved using Base protocol.
> > > > 
> > > > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > > 
> > > Hi
> > > 
> > > just a quick remarks that a bot spotted the usage of __VA_OPT__ which is
> > > only available since GCC >= 8.0 :< ... so I will probably revert to use the
> > > previous, less clean, mechanism to build the NULL terminated array in
> > > which the compats array WILL HAVE to be explicitly NULL terminated when
> > > provided (even the empty ones...)
> > 
> > See 20250407094116.1339199-1-arnd@kernel.org, which is slated for
> > 6.16. The TL;DR is that GCC 8.1 and binutils 2.30 should be the
> > minimal versions from 6.16 onwards.
> > 
> > So it's probably not worth using ugly hacks that will eventually be
> > reverted.
> 
> Great news, thanks for the heads-up !
> 

Thanks Marc!

Arnd,

I don't see much discussions on 20250407094116.1339199-1-arnd@kernel.org
to conclude if you plan to get this for v6.16

We probably can wait to push this $subject after your changes land. But
it would be good to know your opinion here especially if you are not
pushing your patches for v6.16

-- 
Regards,
Sudeep
