Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6056F2D94B4;
	Wed,  2 Jul 2025 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469692; cv=none; b=Gb0LKo4iihLZIoFDb2U2rfcoU54ZtSom+JHRJ7X6bPjqdKMVD8cjh6QC+BFE5ypN/b+MuubUFLAuUrFMZN8nBt4qfvkXenJ0p+lJ2e+f4cpLo6g5PO7tVy5mWq9OGu66U9tM7vFnofDBzSE8jdBJ8Zjzs04t4xE0xYznF/deAqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469692; c=relaxed/simple;
	bh=nrR7iojgGr6cEIuiffeK84D662INby4UO6Ly29mizfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OD5/sMQkdHjTuTiB35XLbuoguUCeUobX6U2O+EcJE350WPW4+JBC5WszUWZPUBlMbBcdj8eRRwwP9v5u8PqSFuXmRG5jCX2t5E6QqpF0+FU1ZKrs5fZCcx+xKvZV/hhXPrVozDxKqOKqoBwiGPNYfFG05QfEH4LNkBP2By0C4sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C79B91424;
	Wed,  2 Jul 2025 08:21:14 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBA783F6A8;
	Wed,  2 Jul 2025 08:21:27 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:21:24 +0100
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
Subject: Re: [PATCH 1/7] firmware: arm_scmi: imx: Add documentation for
 MISC_BOARD_INFO
Message-ID: <aGVOdN6v9x7Pt-5n@bogus>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-1-2b99481fe825@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-1-2b99481fe825@nxp.com>

On Fri, Jun 27, 2025 at 02:03:44PM +0800, Peng Fan wrote:
> System Manager Firmware supports getting board information, add
> documentation for this API
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> index 4e246a78a042a79eb81be35632079c7626bbbe57..ac82da0d1e5ce5fa65a5771286aaebb748c8a4e6 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> @@ -1670,6 +1670,26 @@ protocol_id: 0x84
>  |uint32 syslog[N]    |Log data array, N is defined in bits[11:0] of numLogflags|
>  +--------------------+---------------------------------------------------------+
>  
> +MISC_BOARD_INFO
> +~~~~~~~~~~~~~~~
> +
> +message_id: 0xE
> +protocol_id: 0x84
> +
> ++--------------------+---------------------------------------------------------+
> +|Return values                                                                 |
> ++--------------------+---------------------------------------------------------+
> +|Name                |Description                                              |
> ++--------------------+---------------------------------------------------------+
> +|int32 status        |SUCCESS: config name return                              |
> +|                    |NOT_SUPPORTED: name not available                        |
> ++--------------------+---------------------------------------------------------+
> +|uint32 attributes   |Board specific attributes                                |

As suggested, please add current definition of the values.

> ++--------------------+---------------------------------------------------------+
> +|uint8 boardname[16] |Board name. Null terminated ASCII string of up           |
> +|                    |to 16 bytes in length                                    |

How does this match with the information from the DT ? Will they be in sync ?
I understand NXP being silicon vendor, wants to have vendor extensions. But
any board information comes from the OEMs/ODMs. Do you expect them to change
their SCMI firmware. That's not the general expectation, so I am bit puzzled
on this whole BOARD_INFO interface. Please help me understand the motivation
for this new interface.

-- 
Regards,
Sudeep
