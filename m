Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F9123D283;
	Thu, 19 Jun 2025 12:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335624; cv=none; b=RduH868EiL9swCJSLTtX9+khDbgBCA1aH3woI1vZyD1NDpAWx1J6GPrKgovTuV8hvKfMf4L3nRFxf6/zMEvOUUosorngE5TetpYgTEGqDJqD1rqX5X0gwCqkzxILfu+S6trF/dub5Ka3OmughOEF6TjriySnndyP9g42LQR3E04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335624; c=relaxed/simple;
	bh=VD0Dn1awH+GtMx/6oGqbT0FxMtW3Nonbap/wxG+X3fY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R1bLzn1G+pxh5s8IMTHoD4y/5EiWzFNCXiNncgIVzXKg3rN14BV9frG4e68Y6uUZv8tiWQE0TVH1BfUje3GRtN7nvwYoZw2f0KrV/144eiMUs7f7MXKB+T6oH08h7L4BFEeg+7/GxFMqG41YVIJOSAQPddEuaRYM/7WX6/lteSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAC9D106F;
	Thu, 19 Jun 2025 05:20:01 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73A143F66E;
	Thu, 19 Jun 2025 05:20:20 -0700 (PDT)
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	luke.parkin@arm.com,
	philip.radford@arm.com
Subject: [PATCH 0/4] firmware: arm_scmi: Add xfer inflight debug and trace
Date: Thu, 19 Jun 2025 12:20:00 +0000
Message-Id: <20250619122004.3705976-1-philip.radford@arm.com>
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

The series is divided into four small patches:
Patch [1/4]
	- Adds a fuction to decrement debug counters, similar to the existing
	  counter to increment debug counters
Patch [2/4]
	- Adds a new xfers_inflight debug counter to track active transfers
Patch [3/4]
	- Enhances two tracepoints (scmi_xfer_begin and scmi_xfer_end) to
	  include the number of in-flight transfers, setting default values
	  of 0
Patch [4/4]
	- Adds a function (scmi_inflight_count) that retrieves the current
	  in-flight count for use in tracing

Based on v6.16-rc2

Regards,
Phil

Philip Radford (4):
  firmware: arm_scmi: Add debug decrement counter
  firmware: arm_scmi: Add xfer_inflight counter
  include: trace: Add inflight_xfer counter tracepoint
  firmware: arm_scmi: Add new inflight tracing functionality

 drivers/firmware/arm_scmi/common.h   |  8 ++++++++
 drivers/firmware/arm_scmi/driver.c   | 28 ++++++++++++++++++++++++++--
 drivers/firmware/arm_scmi/raw_mode.c |  6 ++++--
 include/trace/events/scmi.h          | 24 ++++++++++++++----------
 4 files changed, 52 insertions(+), 14 deletions(-)

--
2.25.1

