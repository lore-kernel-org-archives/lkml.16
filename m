Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAE75475E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745973393; cv=none; b=Zhjspg/4hYnjC4PGjz5Pd1huoYeCXy/wPGwe+MBkrtbKf5wddYCj9XVsG5XmG9p2wKVArUiGYgxgHzTZwt2fT6S38zb5kf5xDD616ksV5mKzf7yJsr2bCSr+sOsBCUv1cSRDPc3lWrwyLnuqggOPDbQSzQSXh6A/VNAmQy6CkdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745973393; c=relaxed/simple;
	bh=Cvw2rk+fHlO/5Mkk/7wmXDxGp3gQ6z6Tzsx7/lIRJWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hlTld2mgZcycwM9lbRJao5/k/xXVXyNb7g5rBmR7S0ShwIsOmPB36LLhMIKSu0VWrxoH9cN8chV6FxOPn2P+AmKAOS2eGVyc44hNIWxlivqU0eNTufJE1kaIXsl7+G5JXE6z7wcYX0DWAVH/2bhwFrpQUWAHFfhwMmSZJjpbz+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=ULD/VOkk; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="ULD/VOkk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=gI4dxx5UKaefa5Ks/4aexA2fhT0VDUAd8+rkTZ7LzkI=; b=ULD/VOkkDdHUAl6U
	ATvy3UosmLZnBWjSoYjNv3UvmofqGc6sjKJX8+BBwDAes/1OHCGC98vl6VV4hJPiLzKdBp19JxvyQ
	UDRhCS4MNfpfle042ZRv+r6dkkCh2YN0w1DqWrCW0D2IbFYIy8EPfYv5CHQWmvl1YdC64mAeTNl32
	UUVaPhO4Me7NASS8M8JkYxspbh6YPJcWtED6xXQO+XxE6jFwkkfWc+qMyCejRStD1j1plo+QjB6oq
	7nG8pCkSY9Y5C4W8dI94NOvGl00wPHALd990Zmg8Cb6qkIt0gTDIrSS92ko/maLEalgMNZv/guDLd
	Led0teb4kbIRHMNGWA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u9vR1-000XjA-32;
	Wed, 30 Apr 2025 00:36:23 +0000
From: linux@treblig.org
To: gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	fei1.li@intel.com
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [REPOST PATCH] virt: acrn: Remove unused list 'acrn_irqfd_clients'
Date: Wed, 30 Apr 2025 01:36:23 +0100
Message-ID: <20250430003623.313541-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

It doesn't look like this was ever used.

Build tested only.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
Acked-by: Fei Li <fei1.li@intel.com>
---
This is a repost of the patch originally posted last in May
last year as id 20240504174725.93495-1-linux@treblig.org and
Ack'd by Fei Li on 20th May, in Zkq183IzBA6cV9FE@louislifei-OptiPlex-7090
No one picked it up.
(Fixed one typo in the subject line)

 drivers/virt/acrn/irqfd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/virt/acrn/irqfd.c b/drivers/virt/acrn/irqfd.c
index b7da24ca1475..64d32c8fbf79 100644
--- a/drivers/virt/acrn/irqfd.c
+++ b/drivers/virt/acrn/irqfd.c
@@ -16,8 +16,6 @@
 
 #include "acrn_drv.h"
 
-static LIST_HEAD(acrn_irqfd_clients);
-
 /**
  * struct hsm_irqfd - Properties of HSM irqfd
  * @vm:		Associated VM pointer
-- 
2.49.0

