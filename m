Received: from mail-m15572.qiye.163.com (mail-m15572.qiye.163.com [101.71.155.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF6C1EB9F7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744287483; cv=none; b=Lr/meO9rIGO53RgIP54zz6n1ZsdxqLYqlkVB2QYL0v0WXZww7us1qKrHLswMaljS4vYlxNpp0bSysuhvOpaZEfJ/rIe2aw+Bfk3Mq2Z6KYXMRRD2aa66YBoY4nk3dbtC0OJFo5+QLgl3GE0AGAtbyvvp8hoXndomFo5nmBl4ta0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744287483; c=relaxed/simple;
	bh=kuXOKQ/VWplne7B8veOBQLZHjnvpU6HfINURBHyWPfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZ8CcQMEjN3nsqDpoOjBTQJa/ekeOtdf34eHlooWjDBRGD7Eos8HZZciegsldA5+8iqAMfF9xc6aovTivIRN0yY9ApMM/4WaRB47GzkKKlwHMIecvMo6I2b4lN/Hd8xLEur8a1MNklVjIyHuF6e6t3mEhA9EJFCZTym3h5lncaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com; spf=pass smtp.mailfrom=hj-micro.com; arc=none smtp.client-ip=101.71.155.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hj-micro.com
Received: from localhost.localdomain (unknown [122.224.147.158])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11665dc50;
	Thu, 10 Apr 2025 19:42:24 +0800 (GMT+08:00)
From: Shouping Wang <allen.wang@hj-micro.com>
To: will@kernel.org
Cc: robin.murphy@arm.com,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com,
	andy.xu@hj-micro.com
Subject: [PATCH 0/2] perf:arm-ni: support PMUs to share IRQs
Date: Thu, 10 Apr 2025 19:42:12 +0800
Message-ID: <20250410114214.1599777-1-allen.wang@hj-micro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUxJVhlMGE1MTR5MT0IYSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUpPTFVKTkNZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a961f82225009d9kunm11665dc50
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PU06Ajo4PTJNMDceEEgMTD4U
	OhVPCy9VSlVKTE9PSUNOSE9OSkNOVTMWGhIXVRoXFx4VVQwaFRw7ExFWFhIYCRRVGBQWRVlXWRIL
	WUFZSklJVUlJT1VKT0xVSk5DWVdZCAFZQUpLTEw3Bg++

This patch mainly supports to share the interrupt on PMUS for different
clock domains.

Dependency: The second patch depends on first one. It was already
reviewed by robin.

thanks,
Shouping

Hongbo Yao (1):
  perf: arm-ni: Unregister PMUs on probe failure

Shouping Wang (1):
  perf:arm-ni: support PMUs to share IRQs for different clock domains

 drivers/perf/arm-ni.c | 116 +++++++++++++++++++++++++++---------------
 1 file changed, 74 insertions(+), 42 deletions(-)

-- 
2.43.0

