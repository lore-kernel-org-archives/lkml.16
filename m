Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C047278773;
	Thu,  5 Jun 2025 18:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146983; cv=none; b=P5+nf+Nr4qHHumYykBx3wWsX0bmOf6MuQiexazlPfpH/W+YWebfqyGYEiJWSJdQk5RNFJwDL0IJBsMYvKINQMw3T0NG6xJ9xhc5d6YJ5sWagD59LeKDT6UM58E6iilmat7cPhq4ufVOD9+AnOtir6PLxViBMdypLewY3PVchJWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146983; c=relaxed/simple;
	bh=dnpNnbKCVL2gci2y0adQ9yPu5V+GAIsm4hL4ztLtBlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mom+pWrKZEC8WSarHAprcN1pTGsGi/I0ej1ITALUw63ig5C4rTegfUL8tS+Crx+2QE6MZZWUYjkJaTCelsjoa3i4eobbexM5ipdv/qD5+fzhvVZZ7ZMl+L4WzQcGJdJhFWTmuSM8/3iCnz8UhX5CyNSDv/9In8l4jRWANdaVo1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qRc/y2Gn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qRc/y2Gn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AFB8C4CEEB;
	Thu,  5 Jun 2025 18:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749146983;
	bh=dnpNnbKCVL2gci2y0adQ9yPu5V+GAIsm4hL4ztLtBlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qRc/y2GnaBrjOGWD6VQgZkB9uaepY/WPZzJ0sOJxmrv0ybhN0ROqyTn/sj0ddfuV/
	 LycQI2O6Od0n89ZsuJWdcRXRavn4UbLc0zovSTh2QvjV5DjEBcZpiSVBOLi+WqeTc7
	 OzSWt3MqKrNP2/MxQRqpF+gR6am+9Cb8tcRoLQ4Y8EG6nBMZhcEaVTETNTguLJ2Ilf
	 ykPKeDV8Pkk6yehW6WY7zZg+q/i9thgbJrV5EFath8hCUrfAY65aEpuQISElCQ+XCP
	 LATuHSUUGy2npt3RBWOpdVrP0cdIbNsdI4rTFs4gMTZcU3oEaCAQYvlO5FZaqdgTBU
	 Jf6BsQvl9Ekng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4E1C61CE7;
	Thu,  5 Jun 2025 18:09:42 +0000 (UTC)
From: Jake Hillion via B4 Relay <devnull+jake.hillion.co.uk@kernel.org>
Date: Thu, 05 Jun 2025 19:09:27 +0100
Subject: [PATCH v2 2/2] x86/platform/amd: replace down_timeout with
 down_interruptible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-amd-hsmp-v2-2-a811bc3dd74a@hillion.co.uk>
References: <20250605-amd-hsmp-v2-0-a811bc3dd74a@hillion.co.uk>
In-Reply-To: <20250605-amd-hsmp-v2-0-a811bc3dd74a@hillion.co.uk>
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Carlos Bilbao <carlos.bilbao@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sched-ext@meta.com, Jake Hillion <jake@hillion.co.uk>, 
 Suma Hegde <suma.hegde@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749146981; l=1781;
 i=jake@hillion.co.uk; s=20250530; h=from:subject:message-id;
 bh=BYAzdfHYrA5yva9uiI+ppxClpMwD9wLzjRUsigvAH2U=;
 b=2kCxMz7JbRGpl/vAOojbeOUSTrmddSQMKB3C7jJl191JIm6tNZXphXGRbOuSo3vRYQ8ks2k2a
 /HgXDOzRthWDeVmqC9h/1xHqZ/Bd6npLihO8FO0Nh+MumO4TY9XAKpr
X-Developer-Key: i=jake@hillion.co.uk; a=ed25519;
 pk=8cznmqtMcMEcU8QH55k8DrySboD889OBB/BEUMJh3dw=
X-Endpoint-Received: by B4 Relay for jake@hillion.co.uk/20250530 with
 auth_id=419
X-Original-From: Jake Hillion <jake@hillion.co.uk>
Reply-To: jake@hillion.co.uk

From: Jake Hillion <jake@hillion.co.uk>

Currently hsmp_send_message uses down_timeout with a 100ms timeout to
take the semaphore. However __hsmp_send_message, the content of the
critical section, has a sleep in it. On systems with significantly
delayed scheduling behaviour this may take over 100ms.

Convert this method to down_interruptible. Leave the error handling the
same as the documentation currently is not specific about what error is
returned.

Previous behaviour: a caller who competes with another caller stuck in
the critical section due to scheduler delays would receive -ETIME.

New behaviour: a caller who competes with another caller stuck in the
critical section due to scheduler delays will complete successfully.

Reviewed-by: Suma Hegde <suma.hegde@amd.com>
Tested-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Jake Hillion <jake@hillion.co.uk>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index f35c639457ac425e79dead2515c0eddea0759323..6c30bb3edc1d77939b10047b771a5c574e5f2a1e 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -216,13 +216,7 @@ int hsmp_send_message(struct hsmp_message *msg)
 		return -ENODEV;
 	sock = &hsmp_pdev.sock[msg->sock_ind];
 
-	/*
-	 * The time taken by smu operation to complete is between
-	 * 10us to 1ms. Sometime it may take more time.
-	 * In SMP system timeout of 100 millisecs should
-	 * be enough for the previous thread to finish the operation
-	 */
-	ret = down_timeout(&sock->hsmp_sem, msecs_to_jiffies(HSMP_MSG_TIMEOUT));
+	ret = down_interruptible(&sock->hsmp_sem);
 	if (ret < 0)
 		return ret;
 

-- 
2.47.2


