Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA9D2036EC;
	Mon, 30 Jun 2025 10:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751280961; cv=none; b=HAniJ5n2dPaILItTpkJ+bkPWqKnK/KwiYp3dQjg+GYLQk3qBOaZo0tZ6JEHU+SFD/PIGFJx+PfHZymPC7vkEaX4lVGup363RC51NgQyUy0waGA2yjb994K+DWD2k+5LJIdpZikbs3AxUAabRHU9MCv7znmaNHrHnzXvkA7jpy9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751280961; c=relaxed/simple;
	bh=JXK+vXwXTESAPrHgQglgrEzVgMb+yqgRv0SEeXMuyW8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ol34osgS/7xiFDol8z8zYYd4cX4X8HCmPb/+wZrMZzaGCtD2hglnRdtpGIi061UHYokcIeKzIyw+bYq9wZ/8KpDIlSAgm9c66ZfKSjo6E0THvPty4ifeLUvNnf0BQsIpdeBVirk6FEwKzTfBlC0O5e8ZvvwegkO4Ti5XdtsW8qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC2A01D34;
	Mon, 30 Jun 2025 03:55:42 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81C593F6A8;
	Mon, 30 Jun 2025 03:55:57 -0700 (PDT)
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	luke.parkin@arm.com,
	philip.radford@arm.com
Subject: [PATCH v2 0/3] firmware: arm_scmi: Add xfer inflight debug and trace
Date: Mon, 30 Jun 2025 10:55:40 +0000
Message-Id: <20250630105544.531723-1-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series adds a new counter to the Arm SCMI firmware driver to track
the number of in-flight message transfers during debug and trace. This
will be useful for examining behaviour under a large load with regards
to concurrent messages being sent and received. As the counter only gives
a live value, printing the value in trace allows logging of the in-flight
xfers.

The series is divided into three small patches:
Patch [1/3]
        - Adds a function to decrement debug counters, similar to the
		  existing counter to increment debug counters.
Patch [2/3]
        - Adds a new xfers_inflight debug counter to track active
		  transfers.
Patch [3/3]
        - Enhances two tracepoints (scmi_xfer_begin and scmi_xfer_end) to
          include the number of in-flight transfers. Also adds a function
		  (scmi_inflight_count) that retrieves the current in-flight count
		  for use in tracing.

This series is based off the branch sudeep/for-next/scmi/updates at commit
397f802d06c4 ("firmware: arm_scmi: quirk: Force perf level get fastchannel").

Regards,
Phil
---
V1->V2
- Amendments to commit messages
- Final commit of V1 squashed into commit three
- Removal of erroneous blank space
- rebased on sudeep/for-next/scmi/updates as previously based on v6.16-rc2


Philip Radford (3):
  firmware: arm_scmi: Add debug decrement counter
  firmware: arm_scmi: Add xfer_inflight counter
  include: trace: Add inflight_xfer counter tracepoint

 drivers/firmware/arm_scmi/common.h   |  8 ++++++++
 drivers/firmware/arm_scmi/driver.c   | 28 ++++++++++++++++++++++++++--
 drivers/firmware/arm_scmi/raw_mode.c |  6 ++++--
 include/trace/events/scmi.h          | 24 ++++++++++++++----------
 4 files changed, 52 insertions(+), 14 deletions(-)

--
2.25.1

