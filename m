Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4213A2DFA57
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433002; cv=none; b=M9RLBgLT4hfDwLPss6anSCGvNPvO9nfZdzabz8XF3M7iYAgIMZpxYlwsxwyOPEfpsOZ+1jYdEC875kbbCN5utpQciZOZE7+XZV/QCR2Fs+keUyTIph2A/XRAf64yOX77C7yKywGrvFRn7Vai6CI+ka4Wx68sv6hnOAKGmGtZ1No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433002; c=relaxed/simple;
	bh=KdLS87L4/EPxci93NBE5ls3FMF8T1pxkiTjYbgnzRJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NbkT6DJGWmmVOH/wiPMpbVljtf6fIldmW/EvVh7wYlLmB35szVrRVCLktLUeEtVNNizCYa+uRaISxmo3+BlVsgfsxAIh0w+AgPBz0ceMXo5nrKSrM25K+YdsKjnA2Qouqxnx1Tn11xCgrtMapIZLT20wc7TS/p5lrV0vmZI1fmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJGOFqK/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJGOFqK/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA58C4CEF0;
	Fri, 20 Jun 2025 15:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433001;
	bh=KdLS87L4/EPxci93NBE5ls3FMF8T1pxkiTjYbgnzRJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WJGOFqK/Va0Yez8G3wtW/iRHHxRIHI4Ri2Egy889qsdXGNqSSVYKJyLWC6vFzgKfd
	 XkPiuhqB4Cx6dN+g2rNXOwlEMycdZjxBXnTUr7YEkW4aopebuEcHYLNKhlIBvTCmGb
	 SoKvRtrPgIuRkWBEdPWYkp7hgwa5OKgdNQyhP4HkcLHTYxmFAHjroJaJk3u61LRAcT
	 902kQ5NKvokygVj6wJiloNfSml97fVXrsCLJAV2zkgpEsw7sOB5g8ojtBxgstpgMVB
	 QXBZ3+k9NFOEC6eR9TvGFtOHakwFFefbyPqTmFGFnHwlA1ulXKMjH3gKInOrUPFuEE
	 B+yOgE0u6ZwOA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 03/27] PCI: Protect against concurrent change of housekeeping cpumask
Date: Fri, 20 Jun 2025 17:22:44 +0200
Message-ID: <20250620152308.27492-4-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250620152308.27492-1-frederic@kernel.org>
References: <20250620152308.27492-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HK_TYPE_DOMAIN will soon integrate cpuset isolated partitions and
therefore be made modifyable at runtime. Synchronize against the cpumask
update using appropriate locking.

Queue and wait for the PCI call to complete while holding the
housekeeping rwsem. This way the housekeeping update side doesn't need
to propagate its changes to PCI.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/pci/pci-driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 67db34fd10ee..459d211a408b 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -362,7 +362,7 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
 	dev->is_probed = 1;
 
 	cpu_hotplug_disable();
-
+	housekeeping_lock();
 	/*
 	 * Prevent nesting work_on_cpu() for the case where a Virtual Function
 	 * device is probed from work_on_cpu() of the Physical device.
@@ -392,6 +392,7 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
 		error = local_pci_probe(&ddi);
 out:
 	dev->is_probed = 0;
+	housekeeping_unlock();
 	cpu_hotplug_enable();
 	return error;
 }
-- 
2.48.1

