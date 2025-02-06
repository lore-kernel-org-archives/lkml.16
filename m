Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8959A1CEAC2
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 20:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738872679; cv=none; b=dJlNLguOeYUpa/Gp28Qk2lsmnKdvj/1vL1i+z9jTu9Ot7sU9PP47DlgKBdOSytsc8rF++8clzPfUwxJ6I1wevTN5gw5YD9vBGvptRWi+OHHZJ4Cr+CAc+KzL2nyhNdiGt4RbWcPi3UVrSD1h5flbHpmANj04BOvaIB65f2zOvdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738872679; c=relaxed/simple;
	bh=zF2GTUIPiwpZtRyuD3tZkYBVIWDqJkM6QymEf7sCttQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M7z3jFsLetvcjgq5SX8eC+PFxKZTIfkze2XOldD95o8PRVwStXu6aV2eqB06Yu0FrvwOHOABn6iBnj95Jte1lKrhOxRux6lpUWB2Wpw+qNWaRVcj0+Dkkndvl8TZg+eovTqKpSsiy6v3BXGvFy+lpO9LjK/AsYJSC3hzWuAnxPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jrRNgvh7; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jrRNgvh7"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738872660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hm2Uf5YJ2hWHInLH/3b42BvW9aIBajkPQfH1q2tc038=;
	b=jrRNgvh7CVWlIakVHpsaXBRJNwY4y8pn1URL7cPbXu7sGoxEa1Appvxdk8/3FPLbWkh4/h
	k2ZAUyTZXCa5/OEJ/vfDagwprvZaVtpzQhjurGYSlrLRpeSnzRvN7tOD4nudjGvnXmtHe1
	41FqIzo9FRjy1XZ6uVgKuyT5NLF63y8=
From: Sean Anderson <sean.anderson@linux.dev>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org
Cc: Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shannon Nelson <shannon.nelson@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Heng Qi <hengqi@linux.alibaba.com>
Subject: [PATCH net-next v5 0/4] net: xilinx: axienet: Enable adaptive IRQ coalescing with DIM
Date: Thu,  6 Feb 2025 15:10:32 -0500
Message-Id: <20250206201036.1516800-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

To improve performance without sacrificing latency under low load,
enable DIM. While I appreciate not having to write the library myself, I
do think there are many unusual aspects to DIM, as detailed in the last
patch.

Changes in v5:
- Move axienet_coalesce_params doc fix to correct patch
- Rebase onto net-next/master

Changes in v4:
- Rebase onto net-next/master
- Fix incorrect function name in doc comment for axienet_coalesce_params

Changes in v3:
- Fix mismatched parameter name documentation for axienet_calc_cr
- Integrate some cleanups originally included in
  https://lore.kernel.org/netdev/20240909230908.1319982-1-sean.anderson@linux.dev/
- Move spin (un)locking in IRQs inside the if condition of
  napi_schedule_prep. This lets us hold the lock just for the rmw.
- Fix function name in doc comments for axienet_update_coalesce_rx/tx
- Adjust axienet_local doc comment order to match the members
- Rebase onto net-next/master

Changes in v2:
- Don't use spin_lock_irqsave when we know the context
- Split the CR calculation refactor from runtime coalesce settings
  adjustment support for easier review.
- Have axienet_update_coalesce_rx/tx take the cr value/mask instead of
  calculating it with axienet_calc_cr. This will make it easier to add
  partial updates in the next few commits.
- Get coalesce parameters from driver state
- Don't take the RTNL in axienet_rx_dim_work to avoid deadlock. Instead,
  calculate a partial cr update that axienet_update_coalesce_rx can
  perform under a spin lock.
- Use READ/WRITE_ONCE when accessing/modifying rx_irqs

Sean Anderson (4):
  net: xilinx: axienet: Combine CR calculation
  net: xilinx: axienet: Support adjusting coalesce settings while
    running
  net: xilinx: axienet: Get coalesce parameters from driver state
  net: xilinx: axienet: Enable adaptive IRQ coalescing with DIM

 drivers/net/ethernet/xilinx/Kconfig           |   1 +
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |  29 +-
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 312 ++++++++++++++----
 3 files changed, 264 insertions(+), 78 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty

