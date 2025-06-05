Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0BD27877D;
	Thu,  5 Jun 2025 18:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146983; cv=none; b=K3DE3VC9t6yIajUQuOtQUaTRHRsXKhtEqg7UFfQeU8pSxuBNwcESULJ82v6fw6J+Kbbrwgjn5QeXZaraQ/MwGXMTRuc1+s0oGLzFKIHlWW25yE+B0SIJkcWuN7iNQl5/yRfrrwWzzgi1RTKXq719JvOA/fJhHldhDrBmlw77A7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146983; c=relaxed/simple;
	bh=ubqHoAU1Db00pEWl3huh6IlImU4mT5yagwpEuTLPCPw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SMnOaCKJLk9xkm0zAogZPJsExiH10rwpYCdqRGA5Iouzyl8po9DCMX0+zr9prsPSwsVqEb1+ON48mIgsN/iNd1zp8lcxs7m4B9Hfe3gKq+Hjuil3czRv/Wt0m6rv0CHeTieauvPEnlzpm/O7AhDF/HFDB0oMpLlbmCfQqTlsC+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/MTKqLO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/MTKqLO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD8E5C4CEE7;
	Thu,  5 Jun 2025 18:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749146983;
	bh=ubqHoAU1Db00pEWl3huh6IlImU4mT5yagwpEuTLPCPw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=A/MTKqLOgnr1yMKy4c5ewVNZ6epadxFwnRQildE3J+cE6vZESw04d1C0uvG+zwYao
	 lWo1gUJllYVv/TIrcW5MsMlb9DjodXq9FfXZrJ2uWu6npHqnpJCXdNUmiJ2FAy2UR1
	 HEokW0q2s2FkqBwKrshhajV5SBMPhQkN2iYDNa/sY8SIVb0GnOkUwiMkKb7b1CnftS
	 NuNOJMK8GNNRghDSnR+CB1DmFSMA1QoLXOqsy9V9I+in0TgRFeaUGMkxzsmJbfsr2/
	 OzHg7GOnDdQ4XbmDiIiZ0TFfwVYe3kAdVVIny0w26emB7He0W1xnrLr/Dk6oS2EXkz
	 9a+UQMSlxiHFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B1EC5AE59;
	Thu,  5 Jun 2025 18:09:42 +0000 (UTC)
From: Jake Hillion via B4 Relay <devnull+jake.hillion.co.uk@kernel.org>
Subject: [PATCH v2 0/2] x86/platform/amd: better handle scheduling delays
 in hsmp_send_message
Date: Thu, 05 Jun 2025 19:09:25 +0100
Message-Id: <20250605-amd-hsmp-v2-0-a811bc3dd74a@hillion.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFXdQWgC/0XOTQ7CIBCG4as0s5aGTktEV97DdAEUZGL/Ako0D
 XcXGxOX75fJk9kg2kA2wrnaINhEkZa5BB4qMF7NN8toKA3IUXCBR6amgfk4rUyaVsiTFLpzGsr
 5Gqyj105d+9Ke4mMJ711OzXf9IS3/I6lhnLWIqJ1THefy4mkcyw+1WernHfqc8weQ7zaNpAAAA
 A==
X-Change-ID: 20250527-amd-hsmp-8c358985b4fb
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Carlos Bilbao <carlos.bilbao@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sched-ext@meta.com, Jake Hillion <jake@hillion.co.uk>, 
 Blaise Sanouillet <linux@blaise.sanouillet.com>, 
 Suma Hegde <suma.hegde@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749146981; l=1329;
 i=jake@hillion.co.uk; s=20250530; h=from:subject:message-id;
 bh=ubqHoAU1Db00pEWl3huh6IlImU4mT5yagwpEuTLPCPw=;
 b=htrNljWqypmTs++CldvPDLsMDVWtvPO9SWXx1w01s5UjqaPHNkrT35Va8KX93u2Zf+FbglKmo
 meAffuLUQy1CfksR0KQMxdzNKZDCsGvna9dQ6BzUldFUzGq7b/cmrV0
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
Changes in v2:
- Corrected -ETIMEDOUT to -ETIME in patch 2 as requested by reviewers.
- Link to v1: https://lore.kernel.org/r/20250530-amd-hsmp-v1-0-3222bffa4008@hillion.co.uk

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


