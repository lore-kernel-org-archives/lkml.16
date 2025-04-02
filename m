Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4955020E01D;
	Wed,  2 Apr 2025 11:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594382; cv=none; b=uy7075j0zXOY9pD9KBA9LaWl8bFcZND9z2mlnMJbc7RxI2+SG7EqXqyeGJHDxY50iCGT3k7+uAhi5a3eBMCDhOeoYHxPkHu71V25gnK8BRHMyZKwA3WNMbnjyWmCkiTQtg9foivTeTRqU7nGuFXReNvmUlld0BVLOGyJhPKm69M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594382; c=relaxed/simple;
	bh=13/ZTgkQNn8YLYBwvB18oJqhNzSjCyZ6MMrKnzIuUK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqw3EZuWbk+5wEAK3PuoyvITLZ1HfK1iIMTyeGOg6XCNL21/VA/WPlwiwiEmsHV+bJ514Kow6+ZDMeD+G/ZJ/nQrb+FHiJu2qeEbYRqh9eEV59/1Y20+H5J4fNRcyrTR0r+bd8KmphDKRke+lCasn95F22RlZP0o7eQMo+qi6xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6526106F;
	Wed,  2 Apr 2025 04:46:23 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CBB53F694;
	Wed,  2 Apr 2025 04:46:17 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:46:14 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/7] firmware: arm_scmi: imx: Add LMM and CPU
 documentation
Message-ID: <20250402-acoustic-analytic-guan-d3cda5@sudeepholla>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-1-7695f6f61cfc@nxp.com>
 <20250401-quantum-coyote-of-admiration-bf1b68@sudeepholla>
 <20250402123503.GA23033@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402123503.GA23033@nxa18884-linux>

On Wed, Apr 02, 2025 at 08:35:03PM +0800, Peng Fan wrote:
> Hi Sudeep,
> 
> Thanks for reviewing the patch.
> 
> For comments that I am not very clear, I marked with [TODO] for easily
> jump to.
> 
> On Tue, Apr 01, 2025 at 03:15:46PM +0100, Sudeep Holla wrote:
> >On Mon, Mar 03, 2025 at 10:53:22AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> Add i.MX95 Logical Machine Management and CPU Protocol documentation.
> >> 
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 801 ++++++++++++++++++++++++
> >>  1 file changed, 801 insertions(+)
> >> 
> >> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> >> index b2dfd6c46ca2f5f12f0475c24cb54c060e9fa421..74326bf2ea8586282a735713e0ab7eb90ccce8ff 100644
> >> --- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> >> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst

> >> +
> >> +PROTOCOL_MESSAGE_ATTRIBUTES
> >> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> +
> >> +message_id: 0x2
> >> +protocol_id: 0x80
> >> +This command is mandatory.
> >> +
> >
> >For completeness add parameters here for message_id as in the spec as it is
> >referred in the returned value and seems incomplete without it.
> 
> [TODO]
> Sorry, I may not get your point here. You mean below format?
> 
> +------------------+-----------------------------------------------------------+
> |message_id: 0x2
> |protocol_id: 0x80
> |This command is mandatory.
> +------------------+-----------------------------------------------------------+
> |Return values                                                                 |
> +------------------+-----------------------------------------------------------+
> |Name              |Description                                                |
> +------------------+-----------------------------------------------------------+
> |int32 status      |SUCCESS: in case the message is implemented and available  |
> |                  |to use.                                                    |
> |                  |NOT_FOUND: if the message identified by message_id is      |
> |                  |invalid or not implemented                                 |
> +------------------+-----------------------------------------------------------+
> |uint32 attributes |Flags that are associated with a specific function in the  |
> |                  |protocol. For all functions in this protocol, this         |
> 
> message_id is not put in the table, but it is list above just below
> the protocol name. I would prefer to keep current layout and align with
> the MISC and BBM protocol.
>

I meant why is the input parameter message_id not described in the table,
but is referred in the return values. For completeness, just add it even
though it may match the SCMI spec in terms of input parameter.


[...]

> >> +|                     |Bit[23] Valid err ID:                                   |
> >> +|                     |Set to 1 if the error ID field is valid.                |
> >> +|                     |Set to 0 if the error ID field is not valid.            |
> >> +|                     |Bits[22:8] Error ID(Agent ID of the system).            |
> >> +|                     |Bit[7:0] Reason(WDOG, POR, FCCU and etc)                |
> >
> >Is there a mapping for this ?
> 
> I will add a note in V4:
> See the SRESR register description in the System Reset Controller (SRC) section
> in SoC reference mannual.
>

A reference would be good here then. I would be hard to imagine what it means
otherwise.

> >> +
> >> +LMM_RESET_VECTOR_SET
> >> +~~~~~~~~~~~~~~~~~~~~
> >> +
> >> +message_id: 0xC
> >> +protocol_id: 0x80
> >> +This command is mandatory.
> >> +
> >
> >I can't recall if I had asked this before. How is this different from
> >CPU_RESET_VECTOR_SET ? Why do you need this ? Why can't you use
> >CPU_RESET_VECTOR_SET with an additional LMM_* command.
> >
> >I am sure there is a valid reason. If so please document the same.
> 
> CPU_RESET_VECTOR_SET is for cases that M7 and A55 in the same LM.
> LMM_RESET_VECTOR_SET is for cases that M7 and A55 in different LM.
> M7 LM is under control of A55 LM
>

That still doesn't answer my question. I was asking why do you need this
extra interface ? If LMM_RESET_VECTOR_SET can take both cpu id and LM id,
it can be used even for cpus within same LM with current LM ID. Why the
need for separate interface ?

Other than these 2, I am fine with your response on all other comments.

-- 
Regards,
Sudeep
