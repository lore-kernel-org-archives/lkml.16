Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FB22BEC49;
	Tue, 29 Apr 2025 14:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935893; cv=none; b=eyf0k5L3pLSTg+R6b6ArTevzH7L5BMGVVG2HF+AYJ2PXdAOGtq/sYu7rmByCOLNliblynr3SZUk8Zu9DrRmFbUPf4ftmgnPhq4T0mxr27RCAksIuIjK+tBOeVmwOhKE4L7TgHrJm4AsMIZB2VmEpeTucpH/kBdtpwanHdGgyuWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935893; c=relaxed/simple;
	bh=Q4POa21urUAC0ODNxTck1W0LUGzvurDNGIl8RZ+7KN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hxcCOjVW0H8F+BnEskfG3hEiTchyyuv4gWPA6dZIbq3p2XuhBIbrzOI2FseWxUpmLYXMXix+UYM3UnnOmiAteVe7YVn0q1qSk2MG2xriM1Sl/KTl89mcy491xabGddQCTWjku2A1b7wMy+0gcVOTV7HuFyUtbGK6R8zG415X5xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C33091515;
	Tue, 29 Apr 2025 07:11:23 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 377423F66E;
	Tue, 29 Apr 2025 07:11:28 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	maz@kernel.org,
	johan@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v3 0/3] Introduce SCMI Quirks framework
Date: Tue, 29 Apr 2025 15:11:05 +0100
Message-ID: <20250429141108.406045-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

with the increasing adoption of SCMI across arm64 ecosystems, we have to
start considering how to deal and take care of out-of-spec SCMI firmware
platforms that are actively deployed in the wild, in a consistent manner.

This small series introduces a simple framework, based on static_keys,
that allows a user to:

- define a quirk and its matching conditions; quirks can match based on:

  { comp, comp2, NULL } / Vendor_ID / Sub_Vendor_ID / [Min_Vers, Max_Vers]

  from the longest matching sequence down to the shortest.

  When the SCMI core stack boots it will enable the matching quirks
  depending on the information gathered from the platform via Base
  protocol: any NULL match condition is ignored during matching and is
  interpreted as ANY, so you can decide to match on a very specific
  combination of compatibles and FW versions OR simply on a compatible.

- define a quirk code-block: simply a block of code, meant to play the
  magic quirk trick, defined in the proximity of where it will be used
  and gated by an implicit quirk static-key associated with the defined
  quirk

Patch 1/3 in the series is really unrelated to the Quirk framework
itself: it is a slight variation on a fix posted previously by Sibi around
PERF FastChannels and it is included here for simplicity, since the example
quirk provided later in this series has to be applied exactly where 1/3
applies its modifications.

Patch 2/3 introduces support for SCMI quirks: support is default-y in
Kconfig as of this series. All the quirks found defined are stored in
an hashtable at module initialization time.
Since V1 the quirks are matched on ranges of ImplementationVersion if
provided.
Since V2 the matching condition based on compatible, it is optionally
represented by a list of possible compatibles.

Later on, when the SCMI core stack probes and it has retrieved basic info
via Base protocol, all the matching quirks are enabled, which simply means
the related underlying specific quirks static-keys are enabled.

Patch 3/3 Convert a pre-existing quirk to use the Quirk framework: it is,
though, a peculiar quirk, since it was meant to match any firmware version
or from any vendor/sub_vendor.

The macro-salad still triggers a lot of checkpatch warns.

Any feedback and testing is very much welcome.

Thanks,
Cristian

---
V2 -> V3
- fixed a few typos
- rebased on v6.15-rc4
- drop machine compatible lookup for dev_dbg()
- tags colletion
- dropped patch 4 (real quirk)

V1 -> V2
- added support for matching against an optional list of compatibles
- compile the quirks even if Quirks framework is not enabled
- reduced CLOCK_DESCRIBE_RATES triplet Quirk size
- added more docs & examples

RFC -> V1
 - collected tags for patch 1/4
 - Added version ranges handling for Implementation Version
 - make Quirk frmwk default-y
 - add COMPILE_TEST depend
 - move quirk enabling logic out of Base protocol init to avoid possible
   deadlocks with cpu_lock (reported LOCKDEP splat from Johan)
 - fix Quirk matching conditions for quirk_perf_level_get_fc_force


Cristian Marussi (2):
  firmware: arm_scmi: Add Quirks framework
  firmware: arm_scmi: quirk: Fix CLOCK_DESCRIBE_RATES triplet

Sibi Sankar (1):
  firmware: arm_scmi: Ensure that the message-id supports fastchannel

 drivers/firmware/arm_scmi/Kconfig     |  13 ++
 drivers/firmware/arm_scmi/Makefile    |   1 +
 drivers/firmware/arm_scmi/clock.c     |  33 +--
 drivers/firmware/arm_scmi/driver.c    |  95 +++++---
 drivers/firmware/arm_scmi/protocols.h |   2 +
 drivers/firmware/arm_scmi/quirks.c    | 318 ++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/quirks.h    |  51 +++++
 7 files changed, 466 insertions(+), 47 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/quirks.c
 create mode 100644 drivers/firmware/arm_scmi/quirks.h

-- 
2.47.0

