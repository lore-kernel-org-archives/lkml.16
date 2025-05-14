Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D82221541;
	Wed, 14 May 2025 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212743; cv=none; b=qK9JRVpX2kAUGOUMTf8fynuhRyk/YbEvBu/XWwR2NTqABPEMR6hIJvsutjTw8/x/LtDNwlTiDCcKwkUyiAzlty+sLZRQp78HoDLHn/4oCdIWdt9mBJVg0siwAbrKzVoNLxPT443kEl194oEMN5sAcsMbC6ZSZeUkhS6skyTXmfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212743; c=relaxed/simple;
	bh=pn79s5/J/P9TNe+3hLy3s/qDtoOXGxNKcDbvTKLxHq0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GYYSSuDZBVfLhc+dFoNo9wdfMbuBioIC+oFf5PIVuFSupYgVEcEHEA4OicSj+OOjLDMDUMJm5ABfoi7m0Zl/wuR0qEF/i1QotnvslQrVaBxF7bUlEaiqCK1aIckRsYUCT9UlKi35guI2ijXkaYt2CJ53NVx5ptW4ZXH/1ApcHOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uijrsK5M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uijrsK5M"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E000C4CEE9;
	Wed, 14 May 2025 08:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747212743;
	bh=pn79s5/J/P9TNe+3hLy3s/qDtoOXGxNKcDbvTKLxHq0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uijrsK5MXZDqv5WghHiK0XdMjDfGlSwTTmKDKeXTdeHHnZLCQdV7oV7tpcI+wcP6h
	 gxvNrKPAPRQE0N6JQ93jMB7xwIN2N8kCA1UIdllwoq3Px4d38feOv7lAdI+pqe43Yg
	 cMk6xiP2RcnfrXNeLyBB7cjcG8eO49STacoteMoAnCpsHcydpCDal5zkTOUaeY1Ptt
	 2/pnj170IpHuiUlRO50cj31kV+ajfGHZvvjZWgJFsNYN5I97LnpQmfRYWsnQ9Ug2zq
	 njXIPoARiY1yiPMIRUWCUi3LtPq+g6rOnYslOC7lk1sTFGsDVUGRoO0cSLEiYFYN2B
	 tDVOdwsvNFafg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D326C3ABD9;
	Wed, 14 May 2025 08:52:23 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Subject: [PATCH v4 0/2] Use GCR.U timer device as clocksource
Date: Wed, 14 May 2025 10:51:49 +0200
Message-Id: <20250514-riscv-time-mmio-v4-0-cb0cf2922d66@htecgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKVZJGgC/x3MQQqAIBBA0avIrBsQ0ZCuEi3ExpqFGhoShHdPW
 r7F/y9UKkwVFvFCocaVcxrQkwB/unQQ8j4MSiojtdJYuPqGN0fCGDmjmZUlGbyzLsCorkKBn/+
 4br1/N1+qi2EAAAA=
X-Change-ID: 20250424-riscv-time-mmio-5628e0fca8af
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747212741; l=1393;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=pn79s5/J/P9TNe+3hLy3s/qDtoOXGxNKcDbvTKLxHq0=;
 b=rlPq6swwSQfvouul8tW+SJQHbhgJ9bLJXKSNximZEzgFJegjutl9e61P7ng8+xa0j9c7BERNl
 peYI8pd6S8tAMlHpGC/INhUOvEzV/JOrTCoHCBvvxYC+8x1rhWP5QuQ
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

This series adds bindings for the GCR.U timer device and corresponding
driver support. Accessing the memory mapped mtime register in the GCR.U
region should be faster than trapping to M mode each time the timer
needs to be read.

Changes in v4:
- Remove "select" from mti,gcru.yaml.
- Refactor the driver to use function pointers instead of static keys.

Previous versions:
v1: https://lore.kernel.org/lkml/20241227150056.191794-1-arikalo@gmail.com/#t
v2: https://lore.kernel.org/linux-riscv/20250409143816.15802-1-aleksa.paunovic@htecgroup.com/
v3: https://lore.kernel.org/linux-riscv/DU0PR09MB61968695A2A3146EE83B7708F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com/

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
Aleksa Paunovic (2):
      dt-bindings: timer: mti,gcru
      Allow for riscv-clock to pick up mmio address.

 .../devicetree/bindings/timer/mti,gcru.yaml        | 38 ++++++++++++++
 arch/riscv/include/asm/timex.h                     | 48 ++++++-----------
 drivers/clocksource/Kconfig                        | 12 +++++
 drivers/clocksource/timer-riscv.c                  | 61 ++++++++++++++++++++++
 4 files changed, 126 insertions(+), 33 deletions(-)
---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250424-riscv-time-mmio-5628e0fca8af

Best regards,
-- 
Aleksa Paunovic <aleksa.paunovic@htecgroup.com>


