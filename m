Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D1E2D94A0;
	Wed,  2 Jul 2025 15:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469707; cv=none; b=YTDjrzS+lSQ2fLfFKyrlxS+y2xbj1j/MCUDRa6HnTIpS3oNS95Lv1ua/IjWCNCkUB48i5v9Oejfu0EgTJmk90IEes5d/EO7fJV57rmtGY8LyyW/sNpbtThXXzlkN/3nA44JVwwY8AIGOO2oQg6xOu1aXhUPO3/OVeesc/Fv7pus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469707; c=relaxed/simple;
	bh=9dYJ5w9EY1UD9bai69P2crTLkcsflpCD+tv7TlPo/Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KebWy3k0HRUqnd0ibZAN1iM4MgrYA/boeICuXO1ZUiR0Ovq/g/I1rfsf0lqjYxFjeLLzZXTlQSy3UA9mKEuGC48xmVq1yhT4Gb4htAJpGG3WqVD3tXTK1Q8aZJiDUV6FMBsU3anZluAxcwskl3CWYdsHzF6jgpSQaaal+itowk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7C081424;
	Wed,  2 Jul 2025 08:21:30 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB59E3F6A8;
	Wed,  2 Jul 2025 08:21:43 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:21:40 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/7] firmware: arm_scmi: imx: Support discovering
 buildinfo of MISC protocol
Message-ID: <aGVOhMr7vg9Sl7Z2@bogus>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-2-2b99481fe825@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-2-2b99481fe825@nxp.com>

On Fri, Jun 27, 2025 at 02:03:45PM +0800, Peng Fan wrote:
> MISC protocol supports discovering the System Manager(SM) build
> information including build commit, build time and etc. Add the API
> for user to retrieve the information from SM.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 35 ++++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  | 12 ++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index a8915d3b4df518719d56bfff38922625ad9b70f6..1b24d070c6f4856b92f515fcdba5836fd6498ce6 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -25,6 +25,7 @@
>  enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
> +	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,

I clearly missed to raise this point when the documentation for this command
was added. Anyways I assume, you had explored all the options before adding
this as generic tools may not be able to pick this up. Instead, I would have
just stuck with vendor version in the standard protocol with build number
embedded into it. The date and other info must be implicit from the build.

I try to be more cautious and ask questions in the future as I don't want
vendor extensions to be dumping ground for really random things like this.

-- 
Regards,
Sudeep
