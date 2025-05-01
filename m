Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0FA18B47E;
	Thu,  1 May 2025 09:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746092715; cv=none; b=eue3Dx7WScvBP2DinSYAPWjw7LmpAaD8VUB5beD/5OJrh+WOhYg0U/veBXKZZvtU0bT/Q+HDLBJnhzo2f2ffFif7qocIosf2ehormIT0CvCP13oeHnT92oJdv/0uQefi/HrlF0QSbLp2ODunJTw/nP8VcC5Vkgfz0Uv34/vQ830=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746092715; c=relaxed/simple;
	bh=HwiSZZP3z5YW+8jqIp7u4iGROE5AIzJs4qblsKHBT4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMbfYiBkuNyPAWGOXdFnMt6wpU3ZgwUZOCvl1EknkG8OdqpP2OxH21YQRgN/mwjNQY73w4Eejt5WQeu2ctiMpxuoMaMhjTLnP0C1BlsMAEgudlgQWsYwOGfB1RBzFqTX5/auNc8bvv935UKELta+gXqY/h1/TZRegwkpofRbOLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98FA0106F;
	Thu,  1 May 2025 02:45:04 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E1BC3F5A1;
	Thu,  1 May 2025 02:45:09 -0700 (PDT)
Date: Thu, 1 May 2025 10:45:00 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, peng.fan@oss.nxp.com,
	Michal Simek <michal.simek@amd.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 2/3] firmware: arm_scmi: Add Quirks framework
Message-ID: <aBNCnO6nGjkMXFba@pluto>
References: <20250429141108.406045-1-cristian.marussi@arm.com>
 <20250429141108.406045-3-cristian.marussi@arm.com>
 <aBHXHnXA95TwJths@pluto>
 <868qnhj2yf.wl-maz@kernel.org>
 <aBIbC15NiqUseZc7@pluto>
 <20250430-efficient-spider-of-criticism-e857bf@sudeepholla>
 <94e94c5f-210b-43b8-99bc-e7ad7da2588d@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94e94c5f-210b-43b8-99bc-e7ad7da2588d@app.fastmail.com>

On Wed, Apr 30, 2025 at 10:03:42PM +0200, Arnd Bergmann wrote:
> On Wed, Apr 30, 2025, at 17:26, Sudeep Holla wrote:
> >
> > Arnd,
> >
> > I don't see much discussions on 20250407094116.1339199-1-arnd@kernel.org
> > to conclude if you plan to get this for v6.16
> >
> > We probably can wait to push this $subject after your changes land. But
> > it would be good to know your opinion here especially if you are not
> > pushing your patches for v6.16
> 
> I've pushed my branch to the asm-generic tree now, so it should 
> show up in the next linux-next.
> 
> Cristian, I think you can keep the __VA_OPT__, as the build bots
> should stop testing with older gcc versions once my series is in
> linux-next.
> 

Great, I'll keep an eye on linux-next.
Thanks for the feedback.

Thanks,
Cristian
