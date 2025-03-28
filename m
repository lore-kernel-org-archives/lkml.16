Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B021A0BF1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 21:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.143.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743197804; cv=none; b=Q+v2K255RY0r5kRQCcI+UJKrXsSaPCcxy7hbmhzEDTq4epOx8tlzI9fRo8GD2SJYLeT/NPWuwOldRBPBRjk45cnH0KUfnJo9BOqn3Vk6xpYYyMCdEAZX0rd+bvCVxsssprEnLK5TAmcD5dFhUKWTIchUVJBGhpNg2RT5oV9BA6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743197804; c=relaxed/simple;
	bh=Q+GbWtdwEqzg39Cv1cNvcP+cTr2XNrpFOrJ4DNQnH1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rXFqBDmfJ7SKYoed7giym2ZO+sMKjaKzd0NsmgfBjsHknVV2y3RpOo46pbwsdzKVtlf1USblZqwAxDAj2r2V35M369A9p7oLdLdJg8NqXhsA+wA+PtTdtKJloDMrJ1bgM1dOgvxIgt+2GIrn33pjM5ZHg0eIGcQZykhsznvU5hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=PxFKGxxD; arc=none smtp.client-ip=68.232.143.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="PxFKGxxD"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1743197802; x=1774733802;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Q+GbWtdwEqzg39Cv1cNvcP+cTr2XNrpFOrJ4DNQnH1A=;
  b=PxFKGxxDJ/E5ssCSh/5c28rlER1JZJM6paF+VqbYVLeb3SFZsRE42JYg
   FWLJQFb9gbd5iK7oFjvNu1R5mwXp3SDyMu1MAAh/Ce8nIBUjR6/kUsNCG
   oZlVUosH+STcYuE5QzdMtQsHzmPL2IHMJaNVXKNRDC6zs+phW8O4uKXHH
   yLqZ39eJE7ZMR1kKZ/sQyT2KRIJ8/1dPr05ZhTJLKANxY4YtsAbapib7D
   XZqPiGGUuUMMDxpOjA2xhoUwbhaIzaOqe8Ie5zPwvtYURSCBh1oAsVoSo
   kAqvY2E31o96jmux9P9oHWiQNfh+2K9CzjvJBmMkm8tDQd6OnZpWLgEd7
   Q==;
X-CSE-ConnectionGUID: SX70uG0hRxKu7OAtHPZVxA==
X-CSE-MsgGUID: TczLLl65Q/2x7mXrTL6ngQ==
X-IronPort-AV: E=Sophos;i="6.14,284,1736784000"; 
   d="scan'208";a="67350425"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 29 Mar 2025 05:36:41 +0800
IronPort-SDR: 67e70879_0tGG+uTCi/Nicle5lfJoZ6J7KzjDCFwczK9xyjco84yZtV5
 kgWJdVFujKY3o09ZAnatoHZ9rGlYU3p5urNWK+w==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Mar 2025 13:37:13 -0700
WDCIronportException: Internal
Received: from ros-3.wdc.com ([10.23.145.79])
  by uls-op-cesaip01.wdc.com with ESMTP; 28 Mar 2025 14:36:41 -0700
From: Kamaljit Singh <kamaljit.singh1@wdc.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: niklas.cassel@wdc.com,
	damien.lemoal@wdc.com,
	kamaljit.singh1@wdc.com
Subject: [PATCH v1 0/1] nvme: add admin controller support. prohibit ioq creation for admin & disco ctrlrs
Date: Fri, 28 Mar 2025 14:36:39 -0700
Message-ID: <20250328213640.798910-1-kamaljit.singh1@wdc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added capability to connect to an Administrative Controller by 
preventing ioq creation for admin-controllers. Also prevent ioq 
creation for discovery-controllers as the spec prohibits them. 


Kamaljit Singh (1):
  nvme: add admin controller support. prohibit ioq creation for admin &
    disco ctrlrs

 drivers/nvme/host/core.c    | 25 +++++++++++++------------
 drivers/nvme/host/fabrics.h |  5 +++++
 drivers/nvme/host/nvme.h    |  5 +++++
 drivers/nvme/host/rdma.c    | 11 +++++++++++
 drivers/nvme/host/tcp.c     | 11 +++++++++++
 5 files changed, 45 insertions(+), 12 deletions(-)

-- 
2.43.0

