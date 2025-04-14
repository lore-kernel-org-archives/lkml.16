Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3202DA91F;
	Mon, 14 Apr 2025 13:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637497; cv=none; b=hH8VBGki1fwxCDnq2Vr+7UYAcatvyLS1Wsp8qwX31HCp3fK/6yC406a2ERamkHSmEXmVA6vrrBjFNjamE9yRsWPYJfPTvEsZVJKay1fDjaZQQLHHR2PFnfr6yPzPWI/gAuih5PBMQNjvywIJtemxxBwQYc4AZGr+uTKrADMhpyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637497; c=relaxed/simple;
	bh=7gCAC9EMWruDkCcRIMujAGo1+Bb7GwAj1G4HbW1H0uc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cuRlkkCx4hYpeXzrQL25kMkl7ZbLNMx02b83ajv4jZ5oXN7aPcW6aH3ROaSZAKMhMnzDkP89uKZlGpIcqKNoq4IucO8l5f9ocWDVNKY4MizY++LaMGb2FZ/tFUG5ouJDk7VIOl3FTdjWCUGZLFmLEfkMTOSNXyQMZPbESieshyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uj1cIdUN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uj1cIdUN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB9BC4CEE9;
	Mon, 14 Apr 2025 13:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637497;
	bh=7gCAC9EMWruDkCcRIMujAGo1+Bb7GwAj1G4HbW1H0uc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uj1cIdUNpHl8TffQlRRq6A+NXz1M3+OPb+G6wpIpnEwhof0nFDwquYdmkWienbwDU
	 ClKqQwP/EL6fi7IGZkyxMO9sKl7kofeJnxHNoLYBpD+/4KK0CPBq1gvXzfbaG2cQzL
	 t6PptYic1mLfoxZf3ClaoZf1pCdCiSVtWKm5nM87lsGiGz25c69aJLfGFI9eNV0HmD
	 +EEg9cKP1RwQPWy0EtMYxx9/sjqAFvvIASXIcozkt6/ys+7bfU3QKMhOsynK+rvIa1
	 ctHQUwn0uw+wsp/IlaboxiPkhqgK0pcm+eD0LQ1+NX/JPHwMs9hUSN3wcmZOLhCY7L
	 uQZntmtJgioIg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hannes Reinecke <hare@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sasha Levin <sashal@kernel.org>,
	sagi@grimberg.me,
	linux-nvme@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 05/15] nvme: requeue namespace scan on missed AENs
Date: Mon, 14 Apr 2025 09:31:15 -0400
Message-Id: <20250414133126.680846-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414133126.680846-1-sashal@kernel.org>
References: <20250414133126.680846-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.180
Content-Transfer-Encoding: 8bit

From: Hannes Reinecke <hare@kernel.org>

[ Upstream commit 9546ad1a9bda7362492114f5866b95b0ac4a100e ]

Scanning for namespaces can take some time, so if the target is
reconfigured while the scan is running we may miss a Attached Namespace
Attribute Changed AEN.

Check if the NVME_AER_NOTICE_NS_CHANGED bit is set once the scan has
finished, and requeue scanning to pick up any missed change.

Signed-off-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/nvme/host/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 6748532c776b8..85d965fe8838c 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -4221,6 +4221,10 @@ static void nvme_scan_work(struct work_struct *work)
 	if (nvme_scan_ns_list(ctrl) != 0)
 		nvme_scan_ns_sequential(ctrl);
 	mutex_unlock(&ctrl->scan_lock);
+
+	/* Requeue if we have missed AENs */
+	if (test_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events))
+		nvme_queue_scan(ctrl);
 }
 
 /*
-- 
2.39.5

