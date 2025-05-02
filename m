Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139C422616C
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176284; cv=none; b=dQJ/QEnqlPbxeMzNBlbAGzCJjEWf4W1Il+04Au7rjGTQawjKmZKJHppM+YCJ1eZs6E51id+NzBe/ggkx1V/Wsch0WdwdxXUlBOQvxpa6fs7A9/PIdE4R5BEUJa2qWBPMDZIkTMSk3WguVB/hGD7N3N0q2XLqIZZW/kx0lsZDRIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176284; c=relaxed/simple;
	bh=ZuiskJpGWxLu4eAPDCVIKrsFcyDHCI0/cLWzm/xfpgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uAztmcdiepuu10LrDJW4BXigB8hbHtBN15AelL3ezTsW8cs301xkM8HPyzdjZCq2N+QDRQJ4w1GuislofkHQT0lxa10CFzNHH7P6ZCqkYftv9LCJs9D/Aq30beSVyQbXofSkS0mgScRdTu2AVAmTEFty6TPc4gt2uQa49MMOdVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAaE7RbM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAaE7RbM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC55C4CEE4;
	Fri,  2 May 2025 08:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746176283;
	bh=ZuiskJpGWxLu4eAPDCVIKrsFcyDHCI0/cLWzm/xfpgU=;
	h=From:Date:Subject:To:Cc:From;
	b=ZAaE7RbMned7hCMAWLGak6h15MF1eIy0ByRjIOVxbiI7o4WF7/Xh2BVjNdw4/uAVl
	 7KeN/fKxNky3V92sbLtvWMO6a/G7owtAJIEn5agB/iv0BGjLxas6W8K9rLCD/b49ZF
	 4ZuuGhvAtvrhvlPk/42PlT2wfU82ptJhIL8oJqSrI88jpVLhDsj6nyrZeOeenTmsbB
	 B/H92L8clzSteNApaASEUYxC+zTfin61AkB1EvmcT7Pz1utPmqNxacVua2QC46Ni5g
	 BlX7tFtJpX6VuVSEuQbljGkbaxf7Vzy6FLJnKCDDTv5qTtqX2Kt96FbhJizuEXUZLP
	 JraEh4uDUEvpw==
From: Daniel Wagner <wagi@kernel.org>
Date: Fri, 02 May 2025 10:58:00 +0200
Subject: [PATCH] nvme: unblock ctrl state transition for firmware update
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-nvme-fix-fw-update-v1-1-cd7a9f3031f7@kernel.org>
X-B4-Tracking: v=1; b=H4sIABeJFGgC/x2MuwqAMAwAf0UyG2gDdfBXxEFN1AxWaX1B6b9bH
 A/uLkGUoBKhrRIEuTXq7gvYuoJpHfwiqFwYyJAzzhD6exOc9cX5wevg4RS0rhmZDQnTCCU8ghT
 hn3Z9zh+ziGFrZAAAAA==
X-Change-ID: 20250502-nvme-fix-fw-update-156bdd02ed2b
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

The original nvme subsystem design didn't have a CONNECTING state; the
state machine allowed transitions from RESETTING to LIVE directly.

With the introduction of nvme fabrics the CONNECTING state was
introduce. Over time the nvme-pci started to use the CONNECTING state as
well.

Eventually, a bug fix for the nvme-fc started to depend that the only
valid transition to LIVE was from CONNECTING. Though this change didn't
update the firmware update handler which was still depending on
RESETTING to LIVE transition.

The simplest way to address it for the time being is to switch into
CONNECTING state before going to LIVE state.

Fixes: d2fe192348f9 ("nvme: only allow entering LIVE from CONNECTING state")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/all/0134ea15-8d5f-41f7-9e9a-d7e6d82accaa@roeck-us.net
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/host/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index eb6ea8acb3cca7421d7fb218e51d855f2c056825..ac53629fce68d4c8c12cddc112986289eae79b43 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -4493,7 +4493,8 @@ static void nvme_fw_act_work(struct work_struct *work)
 		msleep(100);
 	}
 
-	if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
+	if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_CONNECTING) ||
+	    !nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
 		return;
 
 	nvme_unquiesce_io_queues(ctrl);

---
base-commit: ebd297a2affadb6f6f4d2e5d975c1eda18ac762d
change-id: 20250502-nvme-fix-fw-update-156bdd02ed2b

Best regards,
-- 
Daniel Wagner <wagi@kernel.org>

