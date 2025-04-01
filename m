Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C732202C4A;
	Tue,  1 Apr 2025 12:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510375; cv=none; b=nYep+d+T1Wd/wWCmgJ8HGnCrqMDHhQBQCT0X0LVi/HBFS5O5qthQzYpAIOOa1Q7KxP1Z/3O+aIyC1aw35eT4ZmGOkcqud0SJNBbWGni5UzXQlJCwmJQNedOAHq456FxKKZWur1lJf/iXRr+mIBKanY4cYynwRbVqORy9lKheVPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510375; c=relaxed/simple;
	bh=w4dlDiu2azV8Gi2+m0awsWCg4uwZMG9qLcC95OjSxKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tZnDKPuwNqpXPu97Y7efYGi/FE/03HYNItJORMZv7tLV079WN/jTF6NoNKDdX3kAbIwuoA3LDyDrmvlJV2PoQYeJkarp2+DfuaNxssH2rXOY1X1PAFwm/f99UdsEsoYTTn6qlTSzFh5f1z9hJu37ePyXzbRWx/QDagPQtN6KmcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A83A81AC1;
	Tue,  1 Apr 2025 05:26:15 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F416A3F63F;
	Tue,  1 Apr 2025 05:26:09 -0700 (PDT)
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
Subject: [RFC PATCH 0/3] Introduce SCMI Quirks framework
Date: Tue,  1 Apr 2025 13:25:42 +0100
Message-ID: <20250401122545.1941755-1-cristian.marussi@arm.com>
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

  	compatible / Vendor_ID / Sub_Vendor_ID / ImplVersion

  from the longest matching sequence down to the shortest.

  When the SCMI core stack boots it will enable the matching quirks
  depending on the information gathered from the platform via Base
  protocol: any NULL/0 match condition is ignored during matching and is
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

Patch 2/3 introduces support for SCMI quirks: support is default-n in
Kconfig as of this series. All the quirks found defined are stored in
an hashtable at module initialization time.
Later on, when the SCMI core stack probes and it has retrieved basic info
via Base protocol, all the matching quirks are enabled, which simply means
the related underlying specific quirks static-keys are enabled.

Patch 3/3 introduces an example Quirk for a known problem on a known
platform as reported by Johan, Marc and Sibi, BUT note that the matching
condition in tha patch MUST be properly completed in the patch (I was not
sure what to use...see my comments)

All of this as an RFC since:

- the provided macro-salad to enable quirks definitions is certainly
  ugly and can be done better (and checkpatch is already complaining
  a bit...)...or maybe I should just get rid of macros

- proper Documentation is missing...I wanted to have some feedback
  before babbling out too much non-sense just in case all of this has
  to go straight to the bin...

- macthing logic can be simplfied probably

Any feedback and testing is very much welcome.

Thanks,
Cristian


Cristian Marussi (2):
  firmware: arm_scmi: Add Quirks framework
  [NOT FOR UPSTREAM] firmware: arm_scmi: quirk: Ignore FC bit in
    attributes

Sibi Sankar (1):
  firmware: arm_scmi: Ensure that the message-id supports fastchannel

 drivers/firmware/arm_scmi/Kconfig     |  12 ++
 drivers/firmware/arm_scmi/Makefile    |   1 +
 drivers/firmware/arm_scmi/base.c      |  14 ++
 drivers/firmware/arm_scmi/driver.c    |  87 +++++++-----
 drivers/firmware/arm_scmi/protocols.h |   2 +
 drivers/firmware/arm_scmi/quirks.c    | 194 ++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/quirks.h    |  43 ++++++
 7 files changed, 320 insertions(+), 33 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/quirks.c
 create mode 100644 drivers/firmware/arm_scmi/quirks.h

-- 
2.47.0

