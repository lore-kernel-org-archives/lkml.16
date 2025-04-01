Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6336A1DAC95;
	Tue,  1 Apr 2025 18:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743530841; cv=none; b=Yauis5VQ2QxsfNWrv7qmsvUDJ57ND+Sk9jqIIeAG/AqAFQrHevD8k2LUiFlsz1GtbXnRWRUq8PfoHIY3lLwpVqRCdXhNYFxUJC5JzjCSk0mDQihc0J1dcHLxqkylEX01z6wIv7PIiHA0I96Zr51ih5aBO9yaVuW4t0E0xON0Db8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743530841; c=relaxed/simple;
	bh=bYSc/XUhMhIZapsAeukPRJTKzEqlcxiv3DU6gTye0Es=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FrDhdrC0O2AJNDtRJmQqyWv65tt6TLG98IIToQli0N+sARh76kzW1JY7f9sqP6WzZVMckWCART6T/YJdcylGNO0s6xQFXfYe39bYpAw8Gyc3Ri+bLYgwo+MQJlVImpgeYfgBgB6f7MCfYqd8zqKcjQQh+Kosu7m0vNwfLL8htEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BC3312FC;
	Tue,  1 Apr 2025 11:07:20 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF6B23F59E;
	Tue,  1 Apr 2025 11:07:15 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 0/7] Arm CoreSight: Support AUX pause and resume
Date: Tue,  1 Apr 2025 19:07:01 +0100
Message-Id: <20250401180708.385396-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is to enable AUX pause and resume on Arm CoreSight.

The first patch extracts the trace unit controlling operations to two
functions.  These two functions will be used by AUX pause and resume.

Patches 02 and 03 change the ETMv4 driver to prepare callback functions
for AUX pause and resume.

Patch 04 changes the ETM perf layer to support AUX pause and resume in a
perf session.  The patch 05 re-enables sinks after buffer update, based
on it, the patch 06 updates buffer on AUX pause occasion, which can
mitigate the trace data lose issue.

Patch 07 documents the AUX pause usages with Arm CoreSight.

This patch set has been verified on the Hikey960 board.

It is suggested to disable CPUIdle (add `nohlt` option in Linux command
line) when verifying this series.  ETM and funnel drivers are found
issues during CPU suspend and resume which will be addressed separately.

Changes from v3:
- Re-enabled sink in buffer update callbacks (Suzuki).

Changes from v2:
- Rebased on CoreSight next branch.
- Dropped the uAPI 'update_buf_on_pause' and updated document
  respectively (Suzuki).
- Renamed ETM callbacks to .pause_perf() and .resume_perf() (Suzuki).
- Minor improvement for error handling in the AUX resume flow.

Changes from v1:
- Added validation function pointers in pause and resume APIs (Mike).


Leo Yan (7):
  coresight: etm4x: Extract the trace unit controlling
  coresight: Introduce pause and resume APIs for source
  coresight: etm4x: Hook pause and resume callbacks
  coresight: perf: Support AUX trace pause and resume
  coresight: tmc: Re-enable sink after buffer update
  coresight: perf: Update buffer on AUX pause
  Documentation: coresight: Document AUX pause and resume

 Documentation/trace/coresight/coresight-perf.rst   |  31 +++++++++
 drivers/hwtracing/coresight/coresight-core.c       |  22 +++++++
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  84 +++++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 143 +++++++++++++++++++++++++++++------------
 drivers/hwtracing/coresight/coresight-etm4x.h      |   2 +
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-etf.c    |   9 +++
 drivers/hwtracing/coresight/coresight-tmc-etr.c    |  10 +++
 include/linux/coresight.h                          |   4 ++
 9 files changed, 265 insertions(+), 42 deletions(-)

-- 
2.34.1

