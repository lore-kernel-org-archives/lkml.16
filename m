Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59098FC08;
	Tue,  1 Apr 2025 14:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516956; cv=none; b=DIwRsApfbqWPpJb0MMT75SXd89mj6koXiV0DvsPDwsRa5aUnBNVExhwrsdCtq/lBAg91XqaswqWQldN2hbfc2bb5hJmD4/fNPr/gEpNG4cPHRfZdFm74/A3v/D2CKkC4uXB9bB5/nX7IxCpZ5vZZnNZMmXoZCgeT/UH+Cn3+dU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516956; c=relaxed/simple;
	bh=MWKREi2zq8szVgRJTD5uAPi1qM9TxusFwlPwGzBBrBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/QWZ2UhNgS2WWWrG769ZqSN00dxoorkbBbhpI0rwMWnxrGQfMgdpty1QR4DQK/0ZnSv4X0e1+VfD+yOzVuPhHEKZ5hPTFwrSdZ1KNg64Ygl42KdjFiNxa5X6iz4OYcVYCfjRx5nFlh/Mm0qao7y5PrmSYJozMEN4U/5ZBGsAiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F05B414BF;
	Tue,  1 Apr 2025 07:15:55 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 527BA3F63F;
	Tue,  1 Apr 2025 07:15:49 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:15:46 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	<linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
	<devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/7] firmware: arm_scmi: imx: Add LMM and CPU
 documentation
Message-ID: <20250401-quantum-coyote-of-admiration-bf1b68@sudeepholla>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-1-7695f6f61cfc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

s/for/to support/ ?

> +machines (LM). It is usually used to allow one LM(e.g. OSPM) to manage

Does it make sense to describe what is LM first before the first statement
here ?

> +another LM which is usually an offload or accelerator engine.. Notifications

Spirious "." above ?

> +from this protocol can also be used to manage a communication link to another
> +LM. The LMM protocol provides functions to:

Either redefine LMM here or add acronym LMM in the title above and drop SCMI_LMM

"System Control and Management Logical Machine Management(LMM) Vendor Protocol"

> +
> +- Describe the protocol version.
> +- Discover implementation attributes.
> +- Discover the LMs defined in the system.

all the LMs

> +- Boot an LM.

s/an LM/ a target LM/

Applies for the list below.

> +- Shutdown an LM (gracefully or forcibly).
> +- Reset an LM (gracefully or forcibly).
> +- Wake an LM from suspend.
> +- Suspend an LM (gracefully).
> +- Read boot/shutdown/reset information for an LM.


> +- Get notifications when an LM boots or shuts down (e.g. LM[X] requested
> +  notification of LM[Y] boots or shuts down, when LM[Y] boots or shuts down,
> +  SCMI firmware will send notification to LM[X]).
> +

s/[X]/ 'X' / and similarly s/[Y]/ 'Y'/

> +'Graceful' means asking LM itself to shutdown/reset/etc (e.g. sending
> +notification to Linux, Then Linux reboots or powers down itself). It is async
> +command that the SUCCESS of the command just means the command successfully
> +return, not means reboot/reset successfully finished.

Extra blank line here would be good.

> +'Forceful' means the SM will force shutdown/reset/etc the LM. It is sync
> +command that the SUCCESS of the command means the LM has been successfully
> +shutdown/reset/etc.

> +If the commands not have Graceful/Forceful flag settings, such as WAKE, SUSEND,
> +it is async command.

I would rather put it as Graceful above instead of async as the relation
is established above. I assume you are referring to the interface that doesn't
have this flag and not flag being 0.

> +
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

For completeness add parameters here for message_id as in the spec as it is
referred in the returned value and seems incomplete without it.

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

s/functions/commands/ just to be in sync with the spec.

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

s/lmId/lmid/ (everywhere applicable for consistency, the parameter name is
lmid while the description refers lmId)

> +|                  |DENIED: if the agent does not have permission to get info  |
> +|                  |for the LM specified by lmid.                              |
> ++------------------+-----------------------------------------------------------+
> +|uint32 lmid       |Identifier of the LM whose identification is requested.    |
> +|                  |This field is: Populated with the lmId of the calling      |
> +|                  |agent, when the lmId parameter passed via the function is  |
> +|                  |0xFFFFFFFF. Identical to the lmId field passed via the     |
> +|                  |calling parameters, in all other cases                     |

Is this to avoid another interface to get the LM ID of the caller ?

> ++------------------+-----------------------------------------------------------+
> +|uint32 attributes | Bits[31:0] reserved. must be zero                         |
> ++------------------+-----------------------------------------------------------+
> +|uint32 state      | Current state of the LM                                   |
> ++------------------+-----------------------------------------------------------+
> +|uint32 errStatus  | Last error status recorded                                |
> ++------------------+-----------------------------------------------------------+
> +|char name[16]     | A NULL terminated ASCII string with the LM name, of up    |
> +|                  | to 16 bytes                                               |
> ++------------------+-----------------------------------------------------------+
> +
> +LMM_BOOT
> +~~~~~~~~
> +
> +message_id: 0x4
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
> +|int32 status      |SUCCESS: if LM boots successfully started.                 |
> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
> +|                  |DENIED: if the agent does not have permission to manage the|
> +|                  |the LM specified by lmid.                                  |
> ++------------------+-----------------------------------------------------------+
> +
> +LMM_RESET
> +~~~~~~~~~
> +
> +message_id: 0x5
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
> +|uint32 flags      |Reset flags:                                               |
> +|                  |Bits[31:1] Reserved, must be zero.                         |
> +|                  |Bit[0] Graceful request:                                   |
> +|                  |Set to 1 if the request is a graceful request.             |
> +|                  |Set to 0 if the request is a forceful request.             |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: The LMM RESET command finished successfully in    |
> +|                  |graceful reset or LM successfully resets in forceful reset.|

If graceful reset is async, will the return value indicate success ?

> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
> +|                  |DENIED: if the agent does not have permission to manage the|
> +|                  |the LM specified by lmid.                                  |
> ++------------------+-----------------------------------------------------------+
> +
> +LMM_SHUTDOWN
> +~~~~~~~~~~~~
> +
> +message_id: 0x6
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
> +|uint32 flags      |Reset flags:                                               |
> +|                  |Bits[31:1] Reserved, must be zero.                         |
> +|                  |Bit[0] Graceful request:                                   |
> +|                  |Set to 1 if the request is a graceful request.             |
> +|                  |Set to 0 if the request is a forceful request.             |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: The LMM shutdown command finished successfully in |
> +|                  |graceful request or LM successfully shutdown in forceful   |
> +|                  |request.                                                   |


Ditto as above ?

> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
> +|                  |DENIED: if the agent does not have permission to manage the|
> +|                  |the LM specified by lmid.                                  |
> ++------------------+-----------------------------------------------------------+
> +
> +LMM_WAKE
> +~~~~~~~~
> +
> +message_id: 0x7
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
> +|int32 status      |SUCCESS: if LM wake command successfully returns.          |
> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
> +|                  |DENIED: if the agent does not have permission to manage the|
> +|                  |the LM specified by lmid.                                  |
> ++------------------+-----------------------------------------------------------+
> +
> +LMM_SUSPEND
> +~~~~~~~~~~~
> +
> +message_id: 0x8
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
> +|int32 status      |SUCCESS: if LM suspend command successfully returns.       |
> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
> +|                  |DENIED: if the agent does not have permission to manage the|
> +|                  |the LM specified by lmid.                                  |
> ++------------------+-----------------------------------------------------------+
> +
> +LMM_NOTIFY
> +~~~~~~~~~~
> +
> +message_id: 0x9
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
> +|uint32 flags      |Notification flags:                                        |
> +|                  |Bits[31:3] Reserved, must be zero.                         |
> +|                  |Bit[3] Wake (resume) notification:                         |
> +|                  |Set to 1 to send notification.                             |
> +|                  |Set to 0 if no notification.                               |
> +|                  |Bit[2] Suspend (sleep) notification:                       |
> +|                  |Set to 1 to send notification.                             |
> +|                  |Set to 0 if no notification.                               |
> +|                  |Bit[1] Shutdown (off) notification:                        |
> +|                  |Set to 1 to send notification.                             |
> +|                  |Set to 0 if no notification.                               |
> +|                  |Bit[0] Boot (on) notification:                             |
> +|                  |Set to 1 to send notification.                             |
> +|                  |Set to 0 if no notification                                |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the notification state successfully updated.   |
> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> +|                  |INVALID_PARAMETERS: if input attributes flag specifies     |
> +|                  |unsupported or invalid configurations.                     |
> +|                  |DENIED: if the agent does not have permission to request   |
> +|                  |the notification.                                          |
> ++------------------+-----------------------------------------------------------+
> +
> +LMM_RESET_REASON
> +~~~~~~~~~~~~~~~~
> +
> +message_id: 0xA
> +protocol_id: 0x80
> +This command is mandatory.
> +
> +This command is to return the reset reason that caused the last reset, such as
> +POR, WDOG, JTAG and etc.
> +
> ++---------------------+--------------------------------------------------------+
> +|Parameters                                                                    |
> ++---------------------+--------------------------------------------------------+
> +|Name                 |Description                                             |
> ++---------------------+--------------------------------------------------------+
> +|uint32 lmid          |ID of the Logical Machine                               |
> ++---------------------+--------------------------------------------------------+
> +|Return values                                                                 |
> ++---------------------+--------------------------------------------------------+
> +|Name                 |Description                                             |
> ++---------------------+--------------------------------------------------------+
> +|int32 status         |SUCCESS: if the reset reason of the LM successfully     |
> +|                     |updated.                                                |
> +|                     |NOT_FOUND: if lmId not points to a valid logical machine|
> +|                     |DENIED: if the agent does not have permission to request|
> +|                     |the reset reason.                                       |
> ++---------------------+--------------------------------------------------------+
> +|uint32 bootflags     |Boot reason flags. This parameter has the format:       |
> +|                     |Bits[31] Valid.                                         |
> +|                     |Set to 1 if the entire reason is valid.                 |
> +|                     |Set to 0 if the entire reason is not valid.             |
> +|                     |Bits[30:29] Reserved, must be zero.                     |
> +|                     |Bit[28] Valid origin:                                   |
> +|                     |Set to 1 if the origin field is valid.                  |
> +|                     |Set to 0 if the origin field is not valid.              |
> +|                     |Bits[27:24] Origin.                                     |
> +|                     |Logical Machine(LM) ID that causes the BOOT of this LM  |

So you support only 16 LMs on the system ? From the initial command it seemed
256. So what exactly is it ? Please document the same clearly.

> +|                     |Bit[23] Valid err ID:                                   |
> +|                     |Set to 1 if the error ID field is valid.                |
> +|                     |Set to 0 if the error ID field is not valid.            |
> +|                     |Bits[22:8] Error ID(Agent ID of the system).            |
> +|                     |Bit[7:0] Reason(WDOG, POR, FCCU and etc)                |

Is there a mapping for this ?

> ++---------------------+--------------------------------------------------------+
> +|uint32 shutdownflags |Shutdown reason flags. This parameter has the format:   |
> +|                     |Bits[31] Valid.                                         |
> +|                     |Set to 1 if the entire reason is valid.                 |
> +|                     |Set to 0 if the entire reason is not valid.             |
> +|                     |Bits[30:29] Number of valid extended info words.        |
> +|                     |Bit[28] Valid origin:                                   |
> +|                     |Set to 1 if the origin field is valid.                  |
> +|                     |Set to 0 if the origin field is not valid.              |
> +|                     |Bits[27:24] Origin.                                     |
> +|                     |Logical Machine(LM) ID that causes the BOOT of this LM  |


Ditto as above.

> +|                     |Bit[23] Valid err ID:                                   |
> +|                     |Set to 1 if the error ID field is valid.                |
> +|                     |Set to 0 if the error ID field is not valid.            |
> +|                     |Bits[22:8] Error ID(Agent ID of the System).            |
> +|                     |Bit[7:0] Reason                                         |


Mapping again ?

> ++---------------------+--------------------------------------------------------+
> +|uint32 extinfo[3]    |Array of extended info words(e.g. fault pc)             |
> ++---------------------+--------------------------------------------------------+
> +
> +LMM_POWER_ON
> +~~~~~~~~~~~~
> +
> +message_id: 0xB
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
> +|int32 status      |SUCCESS: if LM successfully powers on.                     |
> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
> +|                  |DENIED: if the agent does not have permission to manage the|
> +|                  |the LM specified by lmid.                                  |
> ++------------------+-----------------------------------------------------------+
> +
> +LMM_RESET_VECTOR_SET
> +~~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0xC
> +protocol_id: 0x80
> +This command is mandatory.
> +

I can't recall if I had asked this before. How is this different from
CPU_RESET_VECTOR_SET ? Why do you need this ? Why can't you use
CPU_RESET_VECTOR_SET with an additional LMM_* command.

I am sure there is a valid reason. If so please document the same.

> ++-----------------------+------------------------------------------------------+
> +|Parameters                                                                    |
> ++-----------------------+------------------------------------------------------+
> +|Name                   |Description                                           |
> ++-----------------------+------------------------------------------------------+
> +|uint32 lmid            |ID of the Logical Machine                             |
> ++-----------------------+------------------------------------------------------+
> +|uint32 cpuid           |ID of the CPU inside the LM                           |
> ++-----------------------+------------------------------------------------------+
> +|uint32 flags           |Reset vector flags                                    |
> +|                       |Bits[31:0] Reserved, must be zero.                    |
> ++-----------------------+------------------------------------------------------+
> +|uint32 resetVectorLow  |Lower vector                                          |
> ++-----------------------+------------------------------------------------------+
> +|uint32 resetVectorHigh |Higher vector                                         |
> ++-----------------------+------------------------------------------------------+
> +|Return values                                                                 |
> ++-----------------------+------------------------------------------------------+
> +|Name                   |Description                                           |
> ++-----------------------+------------------------------------------------------+
> +|int32 status           |SUCCESS: If reset vector is set successfully.         |
> +|                       |NOT_FOUND: if lmId not points to a valid logical      |
> +|                       |machine, or cpuId is not valid.                       |
> +|                       |INVALID_PARAMETERS: if reset vector is invalid.       |
> +|                       |DENIED: if the agent does not have permission to set  |
> +|                       |the reset vector for the CPU in the LM.               |
> ++-----------------------+------------------------------------------------------+
> +
> +NEGOTIATE_PROTOCOL_VERSION
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x10
> +protocol_id: 0x80
> +This command is mandatory.
> +
> ++--------------------+---------------------------------------------------------+
> +|Parameters                                                                    |
> ++--------------------+---------------------------------------------------------+
> +|Name                |Description                                              |
> ++--------------------+---------------------------------------------------------+
> +|uint32 version      |The negotiated protocol version the agent intends to use |
> ++--------------------+---------------------------------------------------------+
> +|Return values                                                                 |
> ++--------------------+---------------------------------------------------------+
> +|Name                |Description                                              |
> ++--------------------+---------------------------------------------------------+
> +|int32 status        |SUCCESS: if the negotiated protocol version is supported |
> +|                    |by the platform. All commands, responses, and            |
> +|                    |notifications post successful return of this command must|
> +|                    |comply with the negotiated version.                      |
> +|                    |NOT_SUPPORTED: if the protocol version is not supported. |
> ++--------------------+---------------------------------------------------------+
> +
> +Notifications
> +_____________
> +
> +LMM_EVENT
> +~~~~~~~~~
> +
> +message_id: 0x0
> +protocol_id: 0x80
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 lmid       |Identifier for the LM that caused the transition.          |
> ++------------------+-----------------------------------------------------------+
> +|uint32 eventlm    |Identifier of the LM this event refers to.                 |
> ++------------------+-----------------------------------------------------------+
> +|uint32 flags      |LM events:                                                 |
> +|                  |Bits[31:3] Reserved, must be zero.                         |
> +|                  |Bit[3] Wake (resume) event:                                |
> +|                  |1 LM has awakened.                                         |
> +|                  |0 not a wake event.                                        |
> +|                  |Bit[2] Suspend (sleep) event:                              |
> +|                  |1 LM has suspended.                                        |
> +|                  |0 not a suspend event.                                     |
> +|                  |Bit[1] Shutdown (off) event:                               |
> +|                  |1 LM has shutdown.                                         |
> +|                  |0 not a shutdown event.                                    |
> +|                  |Bit[0] Boot (on) event:                                    |
> +|                  |1 LM has booted.                                           |
> +|                  |0 not a boot event.                                        |
> ++------------------+-----------------------------------------------------------+
> +
>  SCMI_BBM: System Control and Management BBM Vendor Protocol
>  ==============================================================
>  
> @@ -436,6 +931,312 @@ protocol_id: 0x81
>  |                  |0 no button change detected.                               |
>  +------------------+-----------------------------------------------------------+
>  
> +SCMI_CPU: System Control and Management CPU Vendor Protocol
> +==============================================================
> +
> +This protocol allows an agent to start or stop a CPU. It is used to manage
> +auxiliary CPUs in an LM (e.g. additional cores in an AP cluster or
> +Cortex-M cores).
> +Note:
> + - For cores in AP cluster, PSCI should be used and ATF will use CPU

s/ATF/PSCI firmware/

> +   protocol to handle them. For cores in non-AP cluster, Operating System(e.g.
> +   Linux OS) could use CPU protocols to control Cortex-M7 cores.
> + - CPU indicates the core and its auxiliary peripherals(e.g. TCM) inside
> +   i.MX SoC
> +
> +The CPU protocol provides functions to:
> +
> +- Describe the protocol version.
> +- Discover implementation attributes.
> +- Discover the CPUs defined in the system.
> +- Start a CPU.
> +- Stop a CPU.
> +- Set the boot and resume addresses for a CPU.
> +- Set the sleep mode of a CPU.
> +- Configure wake-up sources for a CPU.
> +- Configure power domain reactions (LPM mode and retention mask) for a CPU.
> +- The CPU IDs can be found in the CPU section of the SoC DEVICE: SM Device
> +  Interface. They can also be found in the SoC RM. See the CPU Mode Control
> +  (CMC) list in General Power Controller (GPC) section.
> +
> +CPU settings are not aggregated and setting their state is normally exclusive
> +to one client.
> +
> +Commands:
> +_________
> +
> +PROTOCOL_VERSION
> +~~~~~~~~~~~~~~~~
> +
> +message_id: 0x0
> +protocol_id: 0x82
> +This command is mandatory.
> +
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
> +protocol_id: 0x82
> +This command is mandatory.
> +
> ++---------------+--------------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      | See ARM SCMI Specification for status code definitions.   |
> ++------------------+-----------------------------------------------------------+
> +|uint32 attributes |Protocol attributes:                                       |
> +|                  |Bits[31:16] Reserved, must be zero.                        |
> +|                  |Bits[15:0] Number of CPUs                                  |
> ++------------------+-----------------------------------------------------------+
> +
> +PROTOCOL_MESSAGE_ATTRIBUTES
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x2
> +protocol_id: 0x82
> +This command is mandatory.
> +
> ++---------------+--------------------------------------------------------------+
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
> +CPU_ATTRIBUTES
> +~~~~~~~~~~~~~~
> +
> +message_id: 0x4
> +protocol_id: 0x82
> +This command is mandatory.
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 cpuid      |Identifier for the CPU                                     |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if valid attributes are returned successfully.    |
> +|                  |NOT_FOUND: if the cpuid is not valid.                      |
> ++------------------+-----------------------------------------------------------+
> +|uint32 attributes |Bits[31:0] Reserved, must be zero                          |
> ++------------------+-----------------------------------------------------------+
> +|char name[16]     |NULL terminated ASCII string with CPU name up to 16 bytes  |
> ++------------------+-----------------------------------------------------------+
> +
> +CPU_START
> +~~~~~~~~~
> +
> +message_id: 0x4
> +protocol_id: 0x82
> +This command is mandatory.
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 cpuid      |Identifier for the CPU                                     |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the cpu is started successfully.               |
> +|                  |NOT_FOUND: if cpuid is not valid.                          |
> +|                  |DENIED: the calling agent is not allowed to start this CPU.|
> ++------------------+-----------------------------------------------------------+
> +
> +CPU_STOP
> +~~~~~~~~
> +
> +message_id: 0x5
> +protocol_id: 0x82
> +This command is mandatory.
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 cpuid      |Identifier for the CPU                                     |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the cpu is started successfully.               |
> +|                  |NOT_FOUND: if cpuid is not valid.                          |
> +|                  |DENIED: the calling agent is not allowed to stop this CPU. |
> ++------------------+-----------------------------------------------------------+
> +
> +CPU_RESET_VECTOR_SET
> +~~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x6
> +protocol_id: 0x82
> +This command is mandatory.
> +
> ++----------------------+-------------------------------------------------------+
> +|Parameters                                                                    |
> ++----------------------+-------------------------------------------------------+
> +|Name                  |Description                                            |
> ++----------------------+-------------------------------------------------------+
> +|uint32 cpuid          |Identifier for the CPU                                 |
> ++----------------------+-------------------------------------------------------+
> +|uint32 flags          |Reset vector flags:                                    |
> +|                      |Bit[31] Resume flag.                                   |
> +|                      |Set to 1 to update the reset vector used on resume.    |
> +|                      |Bit[30] Boot flag.                                     |
> +|                      |Set to 1 to update the reset vector used for boot.     |
> +|                      |Bits[29:1] Reserved, must be zero.                     |
> +|                      |Bit[0] Table flag.                                     |
> +|                      |Set to 1 if vector is the vector table base address.   |
> ++----------------------+-------------------------------------------------------+
> +|uint32 resetVectorLow |Lower vector:                                          |
> +|                      |If bit[0] of flags is 0, the lower 32 bits of the      |
> +|                      |physical address where the CPU should execute from on  |
> +|                      |reset. If bit[0] of flags is 1, the lower 32 bits of   |
> +|                      |the vector table base address                          |
> ++----------------------+-------------------------------------------------------+
> +|uint32 resetVectorhigh|Upper vector:                                          |
> +|                      |If bit[0] of flags is 0, the upper 32 bits of the      |
> +|                      |physical address where the CPU should execute from on  |
> +|                      |reset. If bit[0] of flags is 1, the upper 32 bits of   |
> +|                      |the vector table base address                          |
> ++----------------------+-------------------------------------------------------+
> +|Return values                                                                 |
> ++----------------------+-------------------------------------------------------+
> +|Name                  |Description                                            |
> ++----------------------+-------------------------------------------------------+
> +|int32 status          |SUCCESS: if the CPU reset vector is set successfully.  |
> +|                      |NOT_FOUND: if cpuId does not point to a valid CPU.     |
> +|                      |INVALID_PARAMETERS: the requested vector type is not   |
> +|                      |supported by this CPU.                                 |
> +|                      |DENIED: the calling agent is not allowed to set the    |
> +|                      |reset vector of this CPU                               |
> ++----------------------+-------------------------------------------------------+
> +
> +CPU_SLEEP_MODE_SET
> +~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x7
> +protocol_id: 0x82
> +This command is mandatory.
> +
> ++----------------------+-------------------------------------------------------+
> +|Parameters                                                                    |
> ++----------------------+-------------------------------------------------------+
> +|Name                  |Description                                            |
> ++----------------------+-------------------------------------------------------+
> +|uint32 cpuid          |Identifier for the CPU                                 |
> ++----------------------+-------------------------------------------------------+
> +|uint32 flags          |Sleep mode flags:                                      |
> +|                      |Bits[31:1] Reserved, must be zero.                     |
> +|                      |Bit[0] IRQ mux:                                        |
> +|                      |If set to 1 the wakeup mux source is the GIC, else if 0|
> +|                      |then the GPC                                           |
> ++----------------------+-------------------------------------------------------+
> +|uint32 sleepmode      |target sleep mode. When CPU runs into WFI, the GPC mode|
> +|                      |will be triggered to be in below modes:                |
> +|                      |RUN(0), WAIT(1), STOP(2), SUSPEND(3)                   |

Split above values into multiple line and mark rest of them as reserved. This
applies to any similar parameter. Easy to miss when reading 800 lines of text 😄

-- 
Regards,
Sudeep
