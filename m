Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C9E204F6B;
	Tue,  1 Apr 2025 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743519139; cv=none; b=r/DDw1ukh6TRlF1gCY9MUgJ4WA0vPwaR2S0IWrjkgTni78ib3CY64eR/Gr0QwDrbMnkYVZbH3LpM8U2IrOYyHXYiqAeefGKa4pmOh1EWzQxq6kqRyh2yJZXPbCak2KZl2Y/Bcihab1+0hDrp9IOdwAMhb2Zh1+2LePG4e3hobqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743519139; c=relaxed/simple;
	bh=zlxiKIbgT56W1MwpH8zInRd4PhuPoxfv+AWFPdKNoy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnNSr3xXCVC8tN1uUGi2Q+de55mBc3BIWeLVDpI8TbgWVHdy2ENoeAcHGlQBhGfghuj27ASZHAOK9TIQEeBGDNDlXgo0OW3P+aMBihS/PBHPTHy9tVzRfBNarA3fhVkzKnVUdr2mE1IEw2UKBXP1UEHUYchF7HNpQzlyUFn88RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B211C14BF;
	Tue,  1 Apr 2025 07:52:20 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF6BA3F694;
	Tue,  1 Apr 2025 07:52:14 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:51:40 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
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
Message-ID: <Z-v9fLBztfeerCqw@pluto>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-1-7695f6f61cfc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-imx-lmm-cpu-v3-1-7695f6f61cfc@nxp.com>

On Mon, Mar 03, 2025 at 10:53:22AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX95 Logical Machine Management and CPU Protocol documentation.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 801 ++++++++++++++++++++++++
>  1 file changed, 801 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> index b2dfd6c46ca2f5f12f0475c24cb54c060e9fa421..74326bf2ea8586282a735713e0ab7eb90ccce8ff 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> @@ -32,6 +32,501 @@ port, and deploy the SM on supported processors.
>  The SM implements an interface compliant with the Arm SCMI Specification
>  with additional vendor specific extensions.
>  
> +SCMI_LMM: System Control and Management Logical Machine Management Vendor Protocol
> +==================================================================================
> +
> +This protocol is intended for boot, shutdown, and reset of other logical
> +machines (LM). It is usually used to allow one LM(e.g. OSPM) to manage
> +another LM which is usually an offload or accelerator engine.. Notifications
> +from this protocol can also be used to manage a communication link to another
> +LM. The LMM protocol provides functions to:
> +
> +- Describe the protocol version.
> +- Discover implementation attributes.
> +- Discover the LMs defined in the system.
> +- Boot an LM.
> +- Shutdown an LM (gracefully or forcibly).
> +- Reset an LM (gracefully or forcibly).
> +- Wake an LM from suspend.
> +- Suspend an LM (gracefully).
> +- Read boot/shutdown/reset information for an LM.
> +- Get notifications when an LM boots or shuts down (e.g. LM[X] requested
> +  notification of LM[Y] boots or shuts down, when LM[Y] boots or shuts down,
> +  SCMI firmware will send notification to LM[X]).
> +
> +'Graceful' means asking LM itself to shutdown/reset/etc (e.g. sending
> +notification to Linux, Then Linux reboots or powers down itself). It is async
> +command that the SUCCESS of the command just means the command successfully
> +return, not means reboot/reset successfully finished.
> +'Forceful' means the SM will force shutdown/reset/etc the LM. It is sync
> +command that the SUCCESS of the command means the LM has been successfully
> +shutdown/reset/etc.
> +If the commands not have Graceful/Forceful flag settings, such as WAKE, SUSEND,
> +it is async command.
> +

Hi,

> +Commands:
> +_________
> +
> +PROTOCOL_VERSION
> +~~~~~~~~~~~~~~~~
> +
> +message_id: 0x0
> +protocol_id: 0x80
> +This command is mandatory.
> +

Good that you added the mandatory/optional description..

> ++---------------+--------------------------------------------------------------+
> +|Return values                                                                 |
> ++---------------+--------------------------------------------------------------+
> +|Name           |Description                                                   |
> ++---------------+--------------------------------------------------------------+
> +|int32 status   | See ARM SCMI Specification for status code definitions.      |
> ++---------------+--------------------------------------------------------------+
> +|uint32 version | For this revision of the specification, this value must be   |
> +|               | 0x10000.                                                     |
> ++---------------+--------------------------------------------------------------+
> +
> +PROTOCOL_ATTRIBUTES
> +~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x1
> +protocol_id: 0x80
> +This command is mandatory.
> +
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      | See ARM SCMI Specification for status code definitions.   |
> ++------------------+-----------------------------------------------------------+
> +|uint32 attributes |Protocol attributes:                                       |
> +|                  |Bits[31:8] Reserved, must be zero.                         |
> +|                  |Bits[7:0] Number of Logical Machines                       |
> ++------------------+-----------------------------------------------------------+
> +
> +PROTOCOL_MESSAGE_ATTRIBUTES
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x2
> +protocol_id: 0x80
> +This command is mandatory.
> +
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: in case the message is implemented and available  |
> +|                  |to use.                                                    |
> +|                  |NOT_FOUND: if the message identified by message_id is      |
> +|                  |invalid or not implemented                                 |
> ++------------------+-----------------------------------------------------------+
> +|uint32 attributes |Flags that are associated with a specific function in the  |
> +|                  |protocol. For all functions in this protocol, this         |
> +|                  |parameter has a value of 0                                 |
> ++------------------+-----------------------------------------------------------+
> +
> +LMM_ATTRIBUTES
> +~~~~~~~~~~~~~~
> +
> +message_id: 0x3
> +protocol_id: 0x80
> +This command is mandatory.
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 lmid       |ID of the Logical Machine                                  |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if valid attributes are returned.                 |
> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> +|                  |DENIED: if the agent does not have permission to get info  |
> +|                  |for the LM specified by lmid.                              |

..mmmmm... regardig this next field...

> ++------------------+-----------------------------------------------------------+
> +|uint32 lmid       |Identifier of the LM whose identification is requested.    |
> +|                  |This field is: Populated with the lmId of the calling      |
> +|                  |agent, when the lmId parameter passed via the function is  |
> +|                  |0xFFFFFFFF. Identical to the lmId field passed via the     |
> +|                  |calling parameters, in all other cases                     |

In V2 there was an issue with the description and you told me

 >> ++------------------+-----------------------------------------------------------+
 > >> +|Parameters                                                                    |
 > >> ++------------------+-----------------------------------------------------------+
 > >> +|Name              |Description                                                |
 > >> ++------------------+-----------------------------------------------------------+
 > >> +|uint32 lmid       |ID of the Logical Machine                                  |
 > >> ++------------------+-----------------------------------------------------------+
 > >> +|Return values                                                                 |
 > >> ++------------------+-----------------------------------------------------------+
 > >> +|Name              |Description                                                |
 > >> ++------------------+-----------------------------------------------------------+
 > >> +|int32 status      |SUCCESS: if valid attributes are returned.                 |
 > >> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
 > >> +|                  |DENIED: if the agent does not have permission to get info  |
 > >> +|                  |for the LM specified by lmid.                              |
 > >> ++------------------+-----------------------------------------------------------+
 > >> +|uint32 attributes | Bits[31:8] reserved.                                      |
 > >> +|                  | Bits[7:0] Number of Logical Machines.                     |
 > >
 > >...BUT this returns again the number of LMs while asking the attributes
 > >of a specific LM ? .... is it a typo or what ? ...if it is just as a
 > >sort of placeholder for when you'll have really LM's attributes to show,
 > >consider that once this is documented and supported in this version of
 > >your vendor protocol it will be needed to be kept and maintained...maybe
 > >better just to declare this as zero in this version of the protocol if
 > >you dont really have anything for this command in this version...(like
 > >many times are defined the attributes fields in PROTOCOL_MESSAGE_ATTRIBUTES
 > >above, if you really know you could want/need this command in the
 > >future...is it used now ?
 > 
 > My bad. This should be updated with below
 > +------------------+-----------------------------------------------------------+
 > |uint32 attributes | Bits[31:0] reserved. must be zero                         |
 > +------------------+-----------------------------------------------------------+
 > |uint32 state      | Current state of the LM                                   |
 > +------------------+-----------------------------------------------------------+
 > |uint32 errStatus  | Last error status recorded                                |
 > +------------------+-----------------------------------------------------------+
 > |char name[16]     | A NULL terminated ASCII string with the LM name, of up    |
 > |                  | to 16 bytes                                               |
 > +------------------+-----------------------------------------------------------+

...so it seems to me that the above lmid is a new addition that was not
mentioned ... bad cut&paste ? it does NOT seem to make so much
sense...or I am missing something

Other than this, LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

