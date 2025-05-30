Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AE221CFF6;
	Fri, 30 May 2025 16:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621743; cv=none; b=Bbl7yfw4h2+FUMlEzAxDTtQelkUmYKvQ77M+mBtx71uvH0jM3QX4mN2FsTbpT2ZyqTU6I3ZNQlATqqlXbbodZYkNHxS7vBZZHs7qpQEjJxKNiPX7N/LeyU3VYJyB6nbHZUn6wBPiM2srCrrYd9qQ7Ak0v7xSolfpN97Vzt0ylGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621743; c=relaxed/simple;
	bh=J2tLUrNZJeP0b5EenQFGoAgg3wG4OtOoEYwTiiW8gcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZNf/szBzNCBmOEOpXc4yIsdpoDESjFIHQDW36UnR0H/WbE6FALxgcZci0A6OQQ3c42fKI3J7VCVMVorPy8W9r9qX4gvHFA81+id64alEgB6ly1VbcrccB3cc021+VPisq+VZUACmmBBg20A+ibXmVYkW3MKscjLrWav8kQmFbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHzSCSsr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHzSCSsr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 220C1C4CEEE;
	Fri, 30 May 2025 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748621743;
	bh=J2tLUrNZJeP0b5EenQFGoAgg3wG4OtOoEYwTiiW8gcU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GHzSCSsrVX5d/+mwa2WFH6Ya5D+zt0CCMbcaohPkqfoCopBbJitO9BKdVDRR1Zrej
	 zuRcgfSKsRLackm/ljGKT3yy/5V9LRM+w4fpcJGoMTevKW18p8O1E5mJ9O5ndFs0Ld
	 p8MYmZ2Ir2w8qvKaCWo75/joSmznZHNpJXrYGxU4fZJudjXfbzuVrRpndSrRrtIeYw
	 xBrmsekl226FtRgkJ5hu+dYEwFeIfab9TyBSzL61HhC9CFVWs+Rru0vTy4GygBSPIK
	 RPNLmHN8crKXKAJ2gTv4grd+IGB4k6Lte7NlkyTxpv+C98HHVhSHjHtqeKDVWVwAJB
	 7AIIbXvQOcIoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDE9C5B549;
	Fri, 30 May 2025 16:15:43 +0000 (UTC)
From: Jake Hillion via B4 Relay <devnull+jake.hillion.co.uk@kernel.org>
Date: Fri, 30 May 2025 17:15:21 +0100
Subject: [PATCH 1/2] x86/platform/amd: move final timeout check to after
 final sleep
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-amd-hsmp-v1-1-3222bffa4008@hillion.co.uk>
References: <20250530-amd-hsmp-v1-0-3222bffa4008@hillion.co.uk>
In-Reply-To: <20250530-amd-hsmp-v1-0-3222bffa4008@hillion.co.uk>
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Carlos Bilbao <carlos.bilbao@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sched-ext@meta.com, Jake Hillion <jake@hillion.co.uk>, 
 Blaise Sanouillet <linux@blaise.sanouillet.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748621741; l=1760;
 i=jake@hillion.co.uk; s=20250530; h=from:subject:message-id;
 bh=4EV5qkO85AXhQhZuF40dcwxkZ1W5E4mea6iYRbqFyME=;
 b=xjApLCcXbb/4z3p6GORkeT1jDsc2Rt6qJRaECX1Dq6LZy1MStYB8zbFBtnV17nUNRboTmtBI9
 yTFLmXUaVYsBoJ3UfAwjyHXOISz0UR3AuuPcqMFITVl9jHJbppFd7r6
X-Developer-Key: i=jake@hillion.co.uk; a=ed25519;
 pk=8cznmqtMcMEcU8QH55k8DrySboD889OBB/BEUMJh3dw=
X-Endpoint-Received: by B4 Relay for jake@hillion.co.uk/20250530 with
 auth_id=419
X-Original-From: Jake Hillion <jake@hillion.co.uk>
Reply-To: jake@hillion.co.uk

From: Jake Hillion <jake@hillion.co.uk>

__hsmp_send_message sleeps between result read attempts and has a
timeout of 100ms. Under extreme load it's possible for these sleeps to
take a long time, exceeding the 100ms. In this case the current code
does not check the register and fails with ETIMEDOUT.

Refactor the loop to ensure there is at least one read of the register
after a sleep of any duration. This removes instances of ETIMEDOUT with
a single caller, even with a misbehaving scheduler. Tested on AMD
Bergamo machines.

Suggested-by: Blaise Sanouillet <linux@blaise.sanouillet.com>
Signed-off-by: Jake Hillion <jake@hillion.co.uk>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index e262e8a97b4542a389e09a82dad71f7d2e8b2449..f35c639457ac425e79dead2515c0eddea0759323 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -99,7 +99,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	short_sleep = jiffies + msecs_to_jiffies(HSMP_SHORT_SLEEP);
 	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
 
-	while (time_before(jiffies, timeout)) {
+	while (true) {
 		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
 		if (ret) {
 			dev_err(sock->dev, "Error %d reading mailbox status\n", ret);
@@ -108,6 +108,10 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 
 		if (mbox_status != HSMP_STATUS_NOT_READY)
 			break;
+
+		if (!time_before(jiffies, timeout))
+			break;
+
 		if (time_before(jiffies, short_sleep))
 			usleep_range(50, 100);
 		else

-- 
2.47.2


