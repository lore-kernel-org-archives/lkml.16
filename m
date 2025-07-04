Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D4828A71E;
	Fri,  4 Jul 2025 09:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751622247; cv=none; b=CCwkaB0vp2KDfEhfAEV1hVW1jhReOHz4oGG/t2L3mWyV33DhQzmBPnMNZ1wqB+GFJpsG/7//Kv78yM3YKPteKaJ/INuHHHdum2CKRPj6W8ThHDIPf+y7VjvcuC2OF4eWMoTDhqz/zstp1NVjntF1yKwMScV6IgHRFqJhJ0WemrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751622247; c=relaxed/simple;
	bh=9z4E+Mk81Lu5KzlwnRVKdz0mC+JqPwzqyftbZD+ad4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuFw4tMRMyl3kIGM2RniXwdoTk79Y6VsHU2v55GXmkKMIoAu76CVBeLtQLgL3jKswqabz31XpseNZRywigXObXhY8U3EE6KHWZIkyz5AL3wrbPU1KHvY4ZA2p6oCCfamnPb5id/EA2vHzRV/RFJ/tE336TL7b/JeAKBtQGFtvVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F894152B;
	Fri,  4 Jul 2025 02:43:51 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 773913F6A8;
	Fri,  4 Jul 2025 02:44:03 -0700 (PDT)
Date: Fri, 4 Jul 2025 10:44:00 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/7] firmware: arm_scmi: imx: Support getting syslog of
 MISC protocol
Message-ID: <aGeiYKhPqrFMvf3t@bogus>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-5-2b99481fe825@nxp.com>
 <20250702-classic-sloth-of-snow-34ed1b@sudeepholla>
 <20250704102353.GE4525@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704102353.GE4525@nxa18884-linux>

On Fri, Jul 04, 2025 at 06:23:53PM +0800, Peng Fan wrote:
> On Wed, Jul 02, 2025 at 04:22:30PM +0100, Sudeep Holla wrote:
> >On Fri, Jun 27, 2025 at 02:03:48PM +0800, Peng Fan wrote:
> >> MISC protocol supports getting system log regarding system sleep latency
> >> ,wakeup interrupt and etc.
> >
> >We now have SCMI telemetry protocol to provide such information in a
> >standard protocol. You must consider using that or switching to that
> >in near future. I am OK with this but would like to warn use of custom
> >interface for things like this is not scalable for long term.
> 
> I have shared latest 4.0 alpha release information to our firmware
> owner. In future, we may use telemetry, but not up to me.
> 

Thanks for that. Much appreciated!

-- 
Regards,
Sudeep
