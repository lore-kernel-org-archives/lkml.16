Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0560323F42D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664876; cv=none; b=EWVy2z6DMlzAzffg7x4PYnSOpnrNerAnoxZPJSs10MuLmB5N0YS0nnWWhjkP/vO1XcibngxlCjvHWspfJxlH7jD9KO8jQW1VgavpfQc7uBxlLf2x7juMbAx8HyJycuy2foA7qTu4/oaVGITa1SGz2vhbU4JPZkS8+gsN7HNXZg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664876; c=relaxed/simple;
	bh=t8LRvTdiBYb8hXqHpx+UHp8xb6coUEzGg4gDjL78BdI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=pM19rl/+Hozh1stsAlwrf2l6kEC9b5Sd50ThvhkcblsgSwXJ3Sfvro5F629q5LjWPqFeRR+P5CFV59Mk3fcOuc8/jWX40v8rlVOXZUwMVxrHxtSJQw0X0kILcI1D7uIXCxGByKThrKeI6EQzXI5cV7VInXkv5gSlrIRAidysNUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=vQ3gL+rU; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="vQ3gL+rU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743664868; bh=OpjX7re8NPi1tJd+wCQMYrDRx68gd4pxONw2WALjE4k=;
	h=From:To:Cc:Subject:Date;
	b=vQ3gL+rU1fAni7cLRr0SuWVwiv1Oy68SO2MI21iJaxp2zJtdXIrNAdC8Ce0wdyu2W
	 rNwOq/uwLD6syqjOcQfG2Jg2/vH2XhZPIto1f9alQIqimAJOUGj6S0OL45NdAZYvLS
	 I9i6nfsTvlq/1xHVzJ5IBnjsdnLld/sqxXQ/p9k0=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id 546986F6; Thu, 03 Apr 2025 15:21:06 +0800
X-QQ-mid: xmsmtpt1743664866t9jej133b
Message-ID: <tencent_A9D89C90E6484E0EBFED4F67D6EF4589F506@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85No9MP5Y6U8o890FzRKoBecWJRn708CXoeLJTvdfQvvMiZLSeSzyn
	 2V8b2qwtUPGf1t9b4s+iugup7TxVZZ0hetYQhmK9IAhrDt9R8aFfTwpRJ6No+cWEUUSV39j8Xc8C
	 08TCD3dqEDjlmfCLajaZAypaYiQCS0avAcRjqx+oiKTCWlqzYvjqkaBqYF03Xz0i8NYKDYq7IW+Q
	 JUMoD4BvwEt5WtAQsmHhvU0WKYCAoL4lOjdvUmEEQikVT7pLHClcciVRWc4aKsL7z1uKOph9Z4U8
	 5Yhkd2H+jF+K8ekUWBC0BSHZYvQRF92RQyAuIPlX1pCkZ7xIrNtr3h09B3Ou5qlBmMzJIiTEJoBR
	 Dy0H6y6wjxvzmWKnSRDnNHceOqiAxSKQyz256q5bNHOvyu8UMaR2cete9J466xIFKYKt+xNbfNPx
	 YARPEBik/vxsjqERMc9mx/iRFjAGaRjZ2bxrpsT8JVrEpizuLnKrt2oweCRxFElOBKfpoIBw0Ocf
	 GCtmUjWjSVf75JSryVjkJlD9Awn3V6gTmUgU646ZZA5t5f96Ia7k0Y9LLbMi/WeOfoCmBYC5ulMY
	 sG3j/IqMEprBhn01+NsEg7iWwmccToZ+xJkBG9kAvqHLSI1+JQ2GlwK6LCM+f/7bwgJt+YE/L7wd
	 bdjmatFTal+o7eAN91UxNGFxy4kXAuX+y1IYOWmtjWwkYm5o32COYgRi7dLNEt3uuTIR9b239D5B
	 dL3FMrTrStw6XtUCI5fO17tGdBNOfnQ9wtM7h/IApPjstEbp9h4LY668NH1PdAUzPcnhpWIED9JC
	 ZMzmnsRhCN1zm7rEEo0Tj9nzNBUbvxZ3l2UoIkZgEpoyhYtqJ/nGtYhEA2DQZZFOjEdhjTS+VLXs
	 0zk3ROCG2opeudrEUmV1092cdpEu2OqBSehKzYPDFseohTj5oN8QrtN0mnGRD0AfY4ZcjmZzQ+wM
	 YUnwm3X7wWfyw/vTaE52t3FbxSR25W
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Yaxiong Tian <iambestgod@qq.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	chaitanyak@nvidia.com
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaxiong Tian <tianyaxiong@kylinos.cn>
Subject: [PATCH v4 0/3] nvme: Add sysfs interface for APST configuration management
Date: Thu,  3 Apr 2025 15:21:02 +0800
X-OQ-MSGID: <20250403072102.1204659-1-iambestgod@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yaxiong Tian <tianyaxiong@kylinos.cn>

This series enhances NVMe APST (Autonomous Power State Transition) support by:
1. Adding warnings for PST table allocation failures
2. Exposing APST tables via sysfs for runtime inspection
3. Providing per-controller sysfs interface for APST configuration

The changes allow better visibility and control of power management settings
through userspace tools while maintaining the existing functionality.

Yaxiong Tian (3):
  nvme: Add warning for PST table memory allocation failure in
    nvme_configure_apst
  nvme: add sysfs interface for APST table updates
  nvme: add per-controller sysfs interface for APST configuration

Changes in v2

Add mutex_lock in nvme_set_latency_tolerance() for Potential competition 
between nvme_set_latency_tolerance() and apst_update_store().

Changes in v3
In  PACH nvme: add sysfs interface for APST table updates,Add why dynamic APST 
updates are needed in the commit message, fix code formatting issues. 

https://lore.kernel.org/all/tencent_4612952C8C5109058CD8E688D81276A2FD0A@qq.com/

Changes in v4
Avoid the overly long line in patch (nvme: Add warning for PST table memory allocation 
failure in nvme_configure_apst)

 drivers/nvme/host/core.c  | 24 ++++++++++------
 drivers/nvme/host/nvme.h  |  6 ++++
 drivers/nvme/host/sysfs.c | 59 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+), 8 deletions(-)

-- 
2.25.1

