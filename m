Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DEB136988;
	Fri, 20 Jun 2025 19:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750447736; cv=none; b=SLsBiVvblKrCZEyUX6BotMR1Hd83Kct9z97SfYDwNohmFDBTD/8rCD0JcKgap4ohad0JtnYV+W0OmqupQMHphdZM4LK5w1Szlj86wDwIpZQAoisvJgX7fXQyX43lhz1VX2hmNIzxxLQ5BrzwldV929yCL7Vc5uRXIS5uJnC0nXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750447736; c=relaxed/simple;
	bh=8ilTjjucUSC2oohukKhYMUotza+GtGQsH9Lfx6rO4e4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SL/PVdyFM9I7f/Q3w1FU9Q7mTPSSBaf5vuzJ7dztN3UTiseysqmQ5bEOPI+doK1tbUljhiqpsxVqZSe+LniWrRysNjHvthzJjf2QYgcF4C3ve1MrZO0ihGRmhJMp9d98es3JFxgxGW6j3uW6Dpxhl+kf0NmcWX5J5N6TYBBKgjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6431016A3;
	Fri, 20 Jun 2025 12:28:33 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DC343F673;
	Fri, 20 Jun 2025 12:28:50 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [RFC PATCH 0/7] Introduce SCMI Telemetry support
Date: Fri, 20 Jun 2025 20:28:06 +0100
Message-ID: <20250620192813.2463367-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

the upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
dedicated to System Telemetry.

In a nutshell, the SCMI Telemetry protocol allows an agent to discover at
runtime the set of Telemetry Data Events (DEs) available on a specific
platform and provides the means to configure the set of DEs that a user is
interested into, while read them back using the collection method that is
deeemd more suitable for the usecase at hand.

Without delving into the gory details of the whole SCMI Telemetry protocol
let's just say that the SCMI platform firmware advertises a number of
Telemetry Data Events, each one identified by a 32bit unique ID, and a user
can read back at will the associated data value in a number of ways.

Anyway, the set of well-known architected DE IDs defined by the spec is
limited to a dozen IDs, which means that the vast majority of DE IDs are
customizable per-platform: as a consequence the same ID, say '0x1234',
could represent completely different things on different systems.

Data Event IDs definitions and their semantic are supposed to be described
using some sort of JSON-like description file consumed by a userspace tool,
which would be finally in charge of making sense of the exact meaning of
the set of DEs specifically defined as available on a specific platform.

IOW, in turn, this means that even though the DEs enumerated via SCMI come
with some sort of topological and qualitative description (like unit of
measurements), kernel-wise we CANNOT be sure of "what is what" without
being fed-back some sort of information about the DEs semantic by the afore
mentioned userspace tool.

For these reasons, currently this series does NOT attempt to register
any of the discovered DEs with any of the usual in-kernel subsystems (like
HWMON, IIO, POWERCAP,PERF etc), simply because we cannot be sure if a DE is
suitable or not for a given subsystem.
This also means there are NO in-kernel user of these Telemetry data, as of
now.

So, while we do not exclude, for the future, to feed/register some of the
discovered DEs to some of the above mentioned Kernel subsystems, as of
now we have ONLY modeled a custom userspace API to make SCMI Telemetry
available to userspace users.

As of now, really, this series explores 2 main alternative
userspace APIs:

 1. a SysFS based human-readable API tree

   This API present the discovered DEs and DEs-groups rooted under a
   structrure like this:

	/sys/class/scmi_telemetry/scmi_tlm_0/
	|-- all_des_enable
	|-- all_des_tstamp_enable
	|-- available_update_intervals_ms
	|-- current_update_interval_ms
	|-- de_implementation_version
	|-- des
	|   |-- 0x0000
	|   |-- 0x0016
	|   |-- 0x1010
	|   |-- 0xA000
	|   |-- 0xA001
	|   |-- 0xA002
	|   |-- 0xA005
	|   |-- 0xA007
	|   |-- 0xA008
	|   |-- 0xA00A
	|   |-- 0xA00B
	|   |-- 0xA00C
	|   `-- 0xA010
	|-- des_bulk_read
	|-- des_single_sample_read
	|-- groups
	|   |-- 0
	|   `-- 1
	|-- intervals_discrete
	|-- reset
	|-- tlm_enable
	`-- version

	At the top level we have general configuration knobs to:

	- enable/disable all DEs with or without tstamp
	- configure the update interval that the platform will use
	- enable Telemetry as a whole oe rest the whole stack
	- read all the enabled DEs in a buffer one-per-line
		<DE_ID> <TIMESTAMP> <DATA_VALUE>
        
	with each DE in turn is represented by a subtree like:

	scmi_tlm_0/des/0xA001/
	|-- compo_instance_id
	|-- compo_type
	|-- enable
	|-- instance_id
	|-- persistent
	|-- tstamp_enable
	|-- tstamp_exp
	|-- type
	|-- unit
	|-- unit_exp
	`-- value

	where, beside a bunch of description items, you can:

	- enable/disable a single DE
	- read back its tstamp/value as in:
		<TIMESTAMP> <DATA_VALUE>

	then for each discovered group of DEs:

	scmi_tlm_0/groups/0/
	|-- available_update_intervals_ms
	|-- composing_des
	|-- current_update_interval_ms
	|-- des_bulk_read
	|-- des_single_sample_read
	|-- enable
	|-- intervals_discrete
	`-- tstamp_enable

	you can find the knobs to:
	
	- enable/disable the group as a whole
	- lookup group composition
	- set a per-group update interval (if supported)
	- read all the enabled DEs in a buffer one-per-line
		<DE_ID> <TIMESTAMP> <DATA_VALUE>

   The problem with this, beside being based on SysFS, is that while it is
   easily accessible and human-readable/scriptable does not scale well when
   the number of DEs ramps up...

 2. an alternative and surely more performant API based on chardev file_ops
   and IOCTLs as described fully in:

	include/uapi/linux/scmi.h

   This, in a nutshell, creates one char-device /dec/scmi_tlm_0 for-each
   SCMI Telemetry instance found on the system and then:

   - uses some IOCTLs to configure a set of properties equivalent to the
     ones above in SysFS
   - uses some other IOCTLs for direct access to data in binary format
   - uses a .read file_operations to read back a human readable buffer
     containing all the enabled DEs using the same format as above
	<DE_ID> <TIMESTAMP> <DATA_VALUE>
   - (TBD) uses .mmap file_operation to allow for the raw unfiltered access
     to the SCMI Telemetry binary data as provided by the platform

This initial RFC aims at first to explore and experiment to find the best
possible userspace API (or mix of APIs) that can provide simplicity of use
while also ensuring high performance from the user-space point of view.

IOW, nothing is set in stone as of now (clearly) some of the alternative
options going ahead are:

 A. shrinking the gigantic SysFS above to keep only a few of those knobs
    while keeping and extending the chardev API

 B. keeping the gigantic FS for readability, but moving to a real
    standalone Telemetry-FS to overcome the limitations/constraints of
    SysFS, while keeping the chardev/IOCTL API for performance
    (not sure anyway the gigantic FS would be acceptable or makes sense
    anyway)

 C. keeping the gigantic FS but move it to debugfs so as to provide it
    only for test/debug/devel, while keeping only the chardev/IOCTLs as
    the production interface

... moreover we could also additionally:

 D. generalize enough one of the above choices to make it abstract enough
    that other non-SCMI based telemetry can plug into some sort of geenric
    Telemetry subsystem

 E. explore completely different APIs to userspace (netlink ?)

 F. additionally serve some of the DEs in some existent Kernel subsystem
    (like HWMON/IIO/PERF...) under the constraint discussed above (i.e.
    userspace has to tell me which DEs can fit into which subsys)

    NOTE THAT, this latter solution CANNOT be the only solution, because
    all of the above subsystem (beside PERF) expose a SysFS-based userspace
    interface (AFAIK), so, using their standard well-known interfaces WON'T
    solve the performance and scalability problem we have in our SysFS.

Beside all of the above, the specification is still in ALPHA_0 and some
features are still NOT supported by this series...

...and of course any form of documentation is still missing :D

Based on V6.16-rc2.

Any feedback welcome,

For whoever had the gut to read till here :P ...

Thanks,
Cristian

[0]: https://developer.arm.com/documentation/den0056/f/?lang=en


Cristian Marussi (7):
  firmware: arm_scmi: Define a common SCMI_MAX_PROTOCOLS value
  firmware: arm_scmi: Allow protocols to register for notifications
  firmware: arm_scmi: Add Telemetry protocol support
  firmware: arm_scmi: Add System Telemetry driver
  firmware: arm_scmi: Add System Telemetry chardev/ioctls API
  include: trace: Add Telemetry trace events
  firmware: arm_scmi: Use new Telemetry traces

 drivers/firmware/arm_scmi/Kconfig             |   10 +
 drivers/firmware/arm_scmi/Makefile            |    3 +-
 drivers/firmware/arm_scmi/common.h            |    4 +
 drivers/firmware/arm_scmi/driver.c            |   14 +
 drivers/firmware/arm_scmi/notify.c            |   31 +-
 drivers/firmware/arm_scmi/notify.h            |    8 +-
 drivers/firmware/arm_scmi/protocols.h         |    9 +
 .../firmware/arm_scmi/scmi_system_telemetry.c | 1459 ++++++++++++++
 drivers/firmware/arm_scmi/telemetry.c         | 1744 +++++++++++++++++
 include/linux/scmi_protocol.h                 |  201 +-
 include/trace/events/scmi.h                   |   48 +-
 include/uapi/linux/scmi.h                     |  253 +++
 12 files changed, 3769 insertions(+), 15 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/scmi_system_telemetry.c
 create mode 100644 drivers/firmware/arm_scmi/telemetry.c
 create mode 100644 include/uapi/linux/scmi.h

-- 
2.47.0

