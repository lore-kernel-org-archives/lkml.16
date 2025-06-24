Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25191ADFFB;
	Tue, 24 Jun 2025 10:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760576; cv=none; b=SvaOV4AC9lkcsWnGMd357oTl4g+5xkiMa/N0DPk5dlD3lo1taMQh71fMqWQN6XfAgiV23zOdf7yWGPF52vHCxHd5ehg2ualJ/b5HenUIwE72giuGGHz85Bupe8I+YK+CJ2v0LBOkruagk99onye9QODbKAui2L15rav1nEGY5qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760576; c=relaxed/simple;
	bh=E6lEus7FgGL1dMk2UJbDMIsoQcIjSiN68DgbrVKrlw4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kz4tw9rrRLl6l5dMRAUsgSvm6g5a5At4BDlViyiDIWB45Lb5V5dpaxAnILJv5ig77+Ncgts1LX2oc/Xsn8ns6SlGLkAY3Nk8nB4PBsJ7LsWBVsUx+OTlI/kZWnP/PlWRhgaGWlWbVJTM2GU3g4Zc/2gkb2uSR6MwrovBYvz9eYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yqtuKK+4; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yqtuKK+4"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OAMZI51531018;
	Tue, 24 Jun 2025 05:22:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750760555;
	bh=424kSZd0CuB32+HNEYJgzmg4kO4MtxxAm+eLNcqzLCw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=yqtuKK+4EPAbFFrrPAQW7HpwiTzWCVZ5UdmNQcRV/fc7d66UjFwkhj8PhGBXdqJew
	 fC65yfzlovZZ2vnr943Hq/s+AwKVqwKqFOG//2vVjvRcwXjYwtINjZlg4wqMBeaC8m
	 Q99sm8+xm35luAf0RgCDMIwKIMHue+dNFyWFxQiY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OAMZnf187675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 05:22:35 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 05:22:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 05:22:35 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OAMYbl1602164;
	Tue, 24 Jun 2025 05:22:34 -0500
Date: Tue, 24 Jun 2025 15:52:33 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <arm-scmi@vger.kernel.org>, <sudeep.holla@arm.com>,
        <james.quinlan@broadcom.com>, <f.fainelli@gmail.com>,
        <vincent.guittot@linaro.org>, <etienne.carriere@st.com>,
        <peng.fan@oss.nxp.com>, <michal.simek@amd.com>,
        <quic_sibis@quicinc.com>, <dan.carpenter@linaro.org>,
        <souvik.chakravarty@arm.com>
Subject: Re: [RFC PATCH 0/7] Introduce SCMI Telemetry support
Message-ID: <20250624102233.mdvffjvilozfz25f@lcpd911>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250620192813.2463367-1-cristian.marussi@arm.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hey Cristian,

On Jun 20, 2025 at 20:28:06 +0100, Cristian Marussi wrote:
> Hi all,
> 
> the upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> dedicated to System Telemetry.
> 
> In a nutshell, the SCMI Telemetry protocol allows an agent to discover at
> runtime the set of Telemetry Data Events (DEs) available on a specific
> platform and provides the means to configure the set of DEs that a user is
> interested into, while read them back using the collection method that is
> deeemd more suitable for the usecase at hand.
> 
> Without delving into the gory details of the whole SCMI Telemetry protocol
> let's just say that the SCMI platform firmware advertises a number of
> Telemetry Data Events, each one identified by a 32bit unique ID, and a user
> can read back at will the associated data value in a number of ways.
> 
> Anyway, the set of well-known architected DE IDs defined by the spec is
> limited to a dozen IDs, which means that the vast majority of DE IDs are
> customizable per-platform: as a consequence the same ID, say '0x1234',
> could represent completely different things on different systems.
> 
> Data Event IDs definitions and their semantic are supposed to be described
> using some sort of JSON-like description file consumed by a userspace tool,
> which would be finally in charge of making sense of the exact meaning of
> the set of DEs specifically defined as available on a specific platform.
> 
> IOW, in turn, this means that even though the DEs enumerated via SCMI come
> with some sort of topological and qualitative description (like unit of
> measurements), kernel-wise we CANNOT be sure of "what is what" without
> being fed-back some sort of information about the DEs semantic by the afore
> mentioned userspace tool.
> 
> For these reasons, currently this series does NOT attempt to register
> any of the discovered DEs with any of the usual in-kernel subsystems (like
> HWMON, IIO, POWERCAP,PERF etc), simply because we cannot be sure if a DE is
> suitable or not for a given subsystem.
> This also means there are NO in-kernel user of these Telemetry data, as of
> now.
> 
> So, while we do not exclude, for the future, to feed/register some of the
> discovered DEs to some of the above mentioned Kernel subsystems, as of
> now we have ONLY modeled a custom userspace API to make SCMI Telemetry
> available to userspace users.
> 
> As of now, really, this series explores 2 main alternative
> userspace APIs:
> 
>  1. a SysFS based human-readable API tree
> 
>    This API present the discovered DEs and DEs-groups rooted under a
>    structrure like this:
> 
> 	/sys/class/scmi_telemetry/scmi_tlm_0/
> 	|-- all_des_enable
> 	|-- all_des_tstamp_enable
> 	|-- available_update_intervals_ms
> 	|-- current_update_interval_ms
> 	|-- de_implementation_version
> 	|-- des
> 	|   |-- 0x0000
> 	|   |-- 0x0016
> 	|   |-- 0x1010
> 	|   |-- 0xA000
> 	|   |-- 0xA001
> 	|   |-- 0xA002
> 	|   |-- 0xA005
> 	|   |-- 0xA007
> 	|   |-- 0xA008
> 	|   |-- 0xA00A
> 	|   |-- 0xA00B
> 	|   |-- 0xA00C
> 	|   `-- 0xA010
> 	|-- des_bulk_read
> 	|-- des_single_sample_read
> 	|-- groups
> 	|   |-- 0
> 	|   `-- 1
> 	|-- intervals_discrete
> 	|-- reset
> 	|-- tlm_enable
> 	`-- version
> 
> 	At the top level we have general configuration knobs to:
> 
> 	- enable/disable all DEs with or without tstamp
> 	- configure the update interval that the platform will use
> 	- enable Telemetry as a whole oe rest the whole stack
> 	- read all the enabled DEs in a buffer one-per-line
> 		<DE_ID> <TIMESTAMP> <DATA_VALUE>
>         
> 	with each DE in turn is represented by a subtree like:
> 
> 	scmi_tlm_0/des/0xA001/
> 	|-- compo_instance_id
> 	|-- compo_type
> 	|-- enable
> 	|-- instance_id
> 	|-- persistent
> 	|-- tstamp_enable
> 	|-- tstamp_exp
> 	|-- type
> 	|-- unit
> 	|-- unit_exp
> 	`-- value
> 
> 	where, beside a bunch of description items, you can:
> 
> 	- enable/disable a single DE
> 	- read back its tstamp/value as in:
> 		<TIMESTAMP> <DATA_VALUE>
> 
> 	then for each discovered group of DEs:
> 
> 	scmi_tlm_0/groups/0/
> 	|-- available_update_intervals_ms
> 	|-- composing_des
> 	|-- current_update_interval_ms
> 	|-- des_bulk_read
> 	|-- des_single_sample_read
> 	|-- enable
> 	|-- intervals_discrete
> 	`-- tstamp_enable
> 
> 	you can find the knobs to:
> 	
> 	- enable/disable the group as a whole
> 	- lookup group composition
> 	- set a per-group update interval (if supported)
> 	- read all the enabled DEs in a buffer one-per-line
> 		<DE_ID> <TIMESTAMP> <DATA_VALUE>
> 
>    The problem with this, beside being based on SysFS, is that while it is
>    easily accessible and human-readable/scriptable does not scale well when
>    the number of DEs ramps up...
> 
>  2. an alternative and surely more performant API based on chardev file_ops
>    and IOCTLs as described fully in:
> 
> 	include/uapi/linux/scmi.h
> 
>    This, in a nutshell, creates one char-device /dec/scmi_tlm_0 for-each
>    SCMI Telemetry instance found on the system and then:
> 
>    - uses some IOCTLs to configure a set of properties equivalent to the
>      ones above in SysFS
>    - uses some other IOCTLs for direct access to data in binary format
>    - uses a .read file_operations to read back a human readable buffer
>      containing all the enabled DEs using the same format as above
> 	<DE_ID> <TIMESTAMP> <DATA_VALUE>
>    - (TBD) uses .mmap file_operation to allow for the raw unfiltered access
>      to the SCMI Telemetry binary data as provided by the platform
> 
> This initial RFC aims at first to explore and experiment to find the best
> possible userspace API (or mix of APIs) that can provide simplicity of use
> while also ensuring high performance from the user-space point of view.

I think the IOCTL based API and then a userspace tool that can use these
sounds good for now.

> 
> IOW, nothing is set in stone as of now (clearly) some of the alternative
> options going ahead are:
> 
>  A. shrinking the gigantic SysFS above to keep only a few of those knobs
>     while keeping and extending the chardev API
> 
>  B. keeping the gigantic FS for readability, but moving to a real
>     standalone Telemetry-FS to overcome the limitations/constraints of
>     SysFS, while keeping the chardev/IOCTL API for performance
>     (not sure anyway the gigantic FS would be acceptable or makes sense
>     anyway)
> 
>  C. keeping the gigantic FS but move it to debugfs so as to provide it
>     only for test/debug/devel, while keeping only the chardev/IOCTLs as
>     the production interface


As for this series, I would support the motion to move this to debugFS.
Similar to how we have /sys/kernel/debug/scmi/0/raw ...
I think grouping telemetry too under the same debug/ interface makes more
sense to me.

> 
> ... moreover we could also additionally:
> 
>  D. generalize enough one of the above choices to make it abstract enough
>     that other non-SCMI based telemetry can plug into some sort of geenric
>     Telemetry subsystem

To my knowledge, I don't see that many users of firmware based telemetry similar to how
SCMI telemetry is being proposed. So maybe at the moment a whole new
telemetry subsystem might be an overkill.

> 
>  E. explore completely different APIs to userspace (netlink ?)
> 
>  F. additionally serve some of the DEs in some existent Kernel subsystem
>     (like HWMON/IIO/PERF...) under the constraint discussed above (i.e.
>     userspace has to tell me which DEs can fit into which subsys)

Perhaps in the future...

As a user, having used hwmon in the past, and also looking at the SCMI spec example
of capturing the output of a sensor which measures the temperature of a PE

Here's some points that support that:

* HWMON is a well-established interface for exposing sensor data (temperature,
voltage, current, power, etc.) to userspace via sysfs.

* Many userspace tools (e.g., lm-sensors, monitoring dashboards) already 
understand HWMON.

* Well-known/architected SCMI DEs (like temperature, voltage, power)
directly map to HWMON sensor types.

However I can see that we may hit a limitation with that with the amount
of flexibility in SCMI telemetry, it may not always fit well in hwmon.

But, I think we can still leverage hwmon for telemetry related to power/
sensor related info.

The question about how do we differentiate between the above subsystems
is still open. Do we expect telemetry to purely come from the firmware
once the kernel is booted up already and is limited in the scope of what
it knows about the system its running on?
Or, can we somehow use DT to specify the subsystem we are interested in
based on the telemetry "number" and some compatible?

> 
>     NOTE THAT, this latter solution CANNOT be the only solution, because
>     all of the above subsystem (beside PERF) expose a SysFS-based userspace
>     interface (AFAIK), so, using their standard well-known interfaces WON'T
>     solve the performance and scalability problem we have in our SysFS.
> 
> Beside all of the above, the specification is still in ALPHA_0 and some
> features are still NOT supported by this series...
> 
> ...and of course any form of documentation is still missing :D
> 
> Based on V6.16-rc2.
> 
> Any feedback welcome,
> 
> For whoever had the gut to read till here :P ...

Hehe.. somehow managed to read it all :P

> 
> Thanks,
> Cristian
> 
> [0]: https://developer.arm.com/documentation/den0056/f/?lang=en
> 
> 
> Cristian Marussi (7):
>   firmware: arm_scmi: Define a common SCMI_MAX_PROTOCOLS value
>   firmware: arm_scmi: Allow protocols to register for notifications
>   firmware: arm_scmi: Add Telemetry protocol support
>   firmware: arm_scmi: Add System Telemetry driver
>   firmware: arm_scmi: Add System Telemetry chardev/ioctls API
>   include: trace: Add Telemetry trace events
>   firmware: arm_scmi: Use new Telemetry traces
> 
>  drivers/firmware/arm_scmi/Kconfig             |   10 +
>  drivers/firmware/arm_scmi/Makefile            |    3 +-
>  drivers/firmware/arm_scmi/common.h            |    4 +
>  drivers/firmware/arm_scmi/driver.c            |   14 +
>  drivers/firmware/arm_scmi/notify.c            |   31 +-
>  drivers/firmware/arm_scmi/notify.h            |    8 +-
>  drivers/firmware/arm_scmi/protocols.h         |    9 +
>  .../firmware/arm_scmi/scmi_system_telemetry.c | 1459 ++++++++++++++
>  drivers/firmware/arm_scmi/telemetry.c         | 1744 +++++++++++++++++
>  include/linux/scmi_protocol.h                 |  201 +-
>  include/trace/events/scmi.h                   |   48 +-
>  include/uapi/linux/scmi.h                     |  253 +++
>  12 files changed, 3769 insertions(+), 15 deletions(-)
>  create mode 100644 drivers/firmware/arm_scmi/scmi_system_telemetry.c
>  create mode 100644 drivers/firmware/arm_scmi/telemetry.c
>  create mode 100644 include/uapi/linux/scmi.h
> 
> -- 
> 2.47.0
> 

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
