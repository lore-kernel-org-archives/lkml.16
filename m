Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE40228CBC;
	Fri, 30 May 2025 16:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621743; cv=none; b=R+cmZamq0BFSvctYVk5EtA+yGuZm6ZgW7VbnqiftuqSYZnJx2ym8238K9FfkT5Rqj+Pm9WtK7fojmeGwoayyaZN1F84+uU1J79Q7YPEI7TXMzqLGVULvxMoU0hRM6QORvmFLtoWZgUYdXNbMTPQUhEqiBSEZDv+OLPg1fVY4mwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621743; c=relaxed/simple;
	bh=+zx2LErMA1VlXm7obx1Hcr0zfFCVBJMB+ReXoiYm/Nc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tAdVsylbFEbnX4us7p7Dk3d2zDbsLtdK51DdoczrT8CYyIqs+3CJYZ5aedpTEV6wjlEPrEpFvcIB/8pdVLIcTP/+zIumloJyyZJqgmI7wkFU4K4uvaWp27pFL9uS3iTs+VrYSwhA8Ye3D+HcFWD2GwnfT9AzYH821tcRGH0MOZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4RqHOi3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4RqHOi3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A437C4CEED;
	Fri, 30 May 2025 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748621743;
	bh=+zx2LErMA1VlXm7obx1Hcr0zfFCVBJMB+ReXoiYm/Nc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=e4RqHOi39wSA9Juj0hW2X2E4JrnIlh7LkhGsKmoms/tMG6tu7YcQTs1Xgd4PENj/C
	 O9d7a/vLjo8gF+NGZphdaUI9nTXN4RCwVrdMC97/DuZ3YiLVf3Fq0pOwAcktQeLmXQ
	 4Xw0xYoLtVoNXB9gC/DyBAIiD9Rchsrbk33nThByawxR3j4lRo9WGvsHmLmKx+Rl9p
	 YYPMtjssZsZDpU/84zbhT5udDq2C1jd/BKSpjZFDl3YECe/vdaNzZ+1lSDZ0JZ2NjJ
	 IHNNpWpTlA2nzgNQRZBa45czih9lROleaVJUzprTDS1sSZbLSa7bSkl61m1Iehf4c/
	 UVtrZiMrbFf2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3A4C5AD49;
	Fri, 30 May 2025 16:15:42 +0000 (UTC)
From: Jake Hillion via B4 Relay <devnull+jake.hillion.co.uk@kernel.org>
Subject: [PATCH 0/2] x86/platform/amd: better handle scheduling delays in
 hsmp_send_message
Date: Fri, 30 May 2025 17:15:20 +0100
Message-Id: <20250530-amd-hsmp-v1-0-3222bffa4008@hillion.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJjZOWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNz3cTcFN2M4twCXYtkY1MLSwvTJJO0JCWg8oKi1LTMCrBR0bG1tQA
 AK3k/WgAAAA==
X-Change-ID: 20250527-amd-hsmp-8c358985b4fb
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Carlos Bilbao <carlos.bilbao@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sched-ext@meta.com, Jake Hillion <jake@hillion.co.uk>, 
 Blaise Sanouillet <linux@blaise.sanouillet.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748621741; l=1143;
 i=jake@hillion.co.uk; s=20250530; h=from:subject:message-id;
 bh=+zx2LErMA1VlXm7obx1Hcr0zfFCVBJMB+ReXoiYm/Nc=;
 b=CljWxK0kvVRuBtznVHySbDbiCBsgKlsGtlMlwrejhBwiYLDVv+EbEzJpL4ei7Nncq2ycXYeyf
 ysOP2OWzUlRDPHwNUYJ32UXdS65QeX8FFcZllYmEUVXZwxzSVxP/l6V
X-Developer-Key: i=jake@hillion.co.uk; a=ed25519;
 pk=8cznmqtMcMEcU8QH55k8DrySboD889OBB/BEUMJh3dw=
X-Endpoint-Received: by B4 Relay for jake@hillion.co.uk/20250530 with
 auth_id=419
X-Original-From: Jake Hillion <jake@hillion.co.uk>
Reply-To: jake@hillion.co.uk

hsmp_send_message currently relies in 2 places on the assumption that
usleep_range will complete in well under 100ms. This is not guaranteed,
and is prevalent when running sched_ext schedulers or possible under
other high load conditions.

These patches alter the behaviour in two ways:
1. Checks the result of `mbox_status` a final time if the sleep took us
   past the timeout. This gives a useful result under test when there
   are significant scheduling delays, rather than -ETIMEDOUT.
2. Removes the 100ms limit on awaiting the semaphore. This allows a
   second thread to compete even when the other suffers large scheduling
   delays.

Signed-off-by: Jake Hillion <jake@hillion.co.uk>
---
Jake Hillion (2):
      x86/platform/amd: move final timeout check to after final sleep
      x86/platform/amd: replace down_timeout with down_interruptible

 drivers/platform/x86/amd/hsmp/hsmp.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)
---
base-commit: 44ed0f35df343d00b8d38006854f96e333104a66
change-id: 20250527-amd-hsmp-8c358985b4fb

Best regards,
-- 
Jake Hillion <jake@hillion.co.uk>


