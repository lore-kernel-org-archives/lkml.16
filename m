Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1C92D46C0;
	Wed,  2 Jul 2025 15:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469756; cv=none; b=Hi9HcOwLLU5AEHa2ALWcszKStLy2QUfV9ysR8RYG5DANk2tmCViZv9U8wZcqwcU2EZdmeFcIHjJZdmgvl+BdrBM2S+rWeLHcBctsavDndzymK0+TLqzLs1lWmoL941y2Y4a25jnejTiC3UrjZH0bUAcRbbNsqwaQeAqXomhhW98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469756; c=relaxed/simple;
	bh=sSrLCcP/ejuhHKPnuPLB8syGwWY1e6HZGL28oALP4r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Au5g1V7m9D131j/xnFj0XJXDXerNV+3pJNHNkYUzkdjeKlKPxKjny4Z6S2Ee/MbpcGSd2bh8PhHpNQ5VOnJd/XM2iGdWON2KQHyJ5rgBR28tJMFnvDjMP5EM4tl+xYxN5q1psahBGn2v150mwopXqJhwN1TP+673VwysMX7gofU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF58C1424;
	Wed,  2 Jul 2025 08:22:19 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5B303F6A8;
	Wed,  2 Jul 2025 08:22:32 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:22:30 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/7] firmware: arm_scmi: imx: Support getting syslog of
 MISC protocol
Message-ID: <20250702-classic-sloth-of-snow-34ed1b@sudeepholla>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-5-2b99481fe825@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-5-2b99481fe825@nxp.com>

On Fri, Jun 27, 2025 at 02:03:48PM +0800, Peng Fan wrote:
> MISC protocol supports getting system log regarding system sleep latency
> ,wakeup interrupt and etc.

We now have SCMI telemetry protocol to provide such information in a
standard protocol. You must consider using that or switching to that
in near future. I am OK with this but would like to warn use of custom
interface for things like this is not scalable for long term.

-- 
Regards,
Sudeep
