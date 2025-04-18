Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275DA13C82E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744963396; cv=none; b=bfeh+Gxf9HRQ/biiW6X1Zk6ECs5qfQhGcboPGUHJErXnDnCyXvUnTs02lvw0p8mtxnYRlPO9ajil4ztFGKzpOEXCcp3n7loMmikaOFneXIITTY4tbg5xwUeL51yjy9KwrxY0kLqrZXhQjbY/Qxm/GSiUVJiQP/yUJSofs8g4DyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744963396; c=relaxed/simple;
	bh=5c0rl/4vzP9Bsr0XDhENeMwzUKF2QrsJhePWzr2cEHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rhl8LSKFM39hRpy0WD0bmKVHyFwpokBbGNXPtztqugTsP0lcPiP9K4AoQ/SerHg2wMp0QenkNmsB7eG9mPi7qqql8J7ZoSohVKH8mzHJUXAIzjfHQ3IcRki7nDLz7gvKWQU+GUX/PlqTpG9n2Izj9fEvvJ5VSx5pDpUuEvNsxyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C0A8A294730;
	Fri, 18 Apr 2025 10:03:05 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id iDRzz_rRKilZ; Fri, 18 Apr 2025 10:03:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 56781298566;
	Fri, 18 Apr 2025 10:03:05 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rvMd9rz47ZUS; Fri, 18 Apr 2025 10:03:05 +0200 (CEST)
Received: from anvil.corp.sigma-star.at (84-115-238-41.cable.dynamic.surfer.at [84.115.238.41])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id D388F294730;
	Fri, 18 Apr 2025 10:03:04 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-kernel@vger.kernel.org
Cc: linux-nvme@lists.infradead.org,
	dlemoal@kernel.org,
	kbusch@kernel.org,
	kch@nvidia.com,
	sagi@grimberg.me,
	hch@lst.de,
	upstream+nvme@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH] nvmet: Fix out-of-bounds access in nvmet_enable_port
Date: Fri, 18 Apr 2025 10:02:50 +0200
Message-ID: <20250418080250.2736590-1-richard@nod.at>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When trying to enable a port that has no transport configured yet,
nvmet_enable_port() uses NVMF_TRTYPE_MAX (255) to query the transports
array, causing an out-of-bounds access:

[  106.058694] BUG: KASAN: global-out-of-bounds in nvmet_enable_port+0x42=
/0x1da
[  106.058719] Read of size 8 at addr ffffffff89dafa58 by task ln/632
[...]
[  106.076026] nvmet: transport type 255 not supported

Since commit 200adac75888, NVMF_TRTYPE_MAX is the default state as config=
ured by
nvmet_ports_make().
Avoid this by checking for NVMF_TRTYPE_MAX before proceeding.

Fixes: 200adac75888 ("nvme: Add PCI transport type")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/nvme/target/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 71f8d06998d6..245475c43127 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -324,6 +324,9 @@ int nvmet_enable_port(struct nvmet_port *port)
=20
 	lockdep_assert_held(&nvmet_config_sem);
=20
+	if (port->disc_addr.trtype =3D=3D NVMF_TRTYPE_MAX)
+		return -EINVAL;
+
 	ops =3D nvmet_transports[port->disc_addr.trtype];
 	if (!ops) {
 		up_write(&nvmet_config_sem);
--=20
2.48.1

