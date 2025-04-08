Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BB41CF7AF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126152; cv=none; b=FZRkLYqc9q+rxKqljCVa+Fx+Fa9nyqa3NQnWqVOf2GQ6S7QrFA+pc61EP0D0I0tD+6zb2xbGg41e75/7RXBiFUp2huA2Jw0QCUoYFIF5TnurwS6B/7FiorJebzKGFxyC5l3Qot9xC4pFr/Ly2oZY+FWbSuuloiZ6cHMeO2m14sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126152; c=relaxed/simple;
	bh=aIoMkgJTvkjTjvFmIUdpv6qDltcnB/ZgVTiXC4CU8BE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YcqnINZmWE5p8NBesMQZfR4V24M2szQ6aWKvxXEcXyLrqAWoZ/6uDLrbroF8iltd2aDf6My85n1c+g17Vk3jr4yU6a83PMlmHDSPdO2hmeObVllKEdFuqWZcfI98MJxIzcpJoBLtD9l7IBt5rFCNhA+pKbrmsLkokCDqRF4+nmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7cHhRXf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7cHhRXf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAB0C4CEEA;
	Tue,  8 Apr 2025 15:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744126152;
	bh=aIoMkgJTvkjTjvFmIUdpv6qDltcnB/ZgVTiXC4CU8BE=;
	h=From:Subject:Date:To:Cc:From;
	b=k7cHhRXfqXqM+rOB73brR5i91oVIRlWW/ZrrFuRVZHwqCgHlLyUR+Lg2y7Sel8Boh
	 8ExGdPehfrc4vrVc8uOuZ1+rtjGBUtUu/lgI3nAdONahJHYPYBWnFHDFrVxMQpkNvA
	 L3b4GfBAw+bx9nzmI/LxvQvjUUVTfqtB1aQsr9bVw6GMA9b6w4iQ6nbq8rdjM2hTpY
	 5zQqy+IcFWgXL907IT6r0d1QK+NR3fdSVRUlI8TTi09WaB9DpZEINSntO95ldgVnXp
	 uh4smA/aKy3ARVwOJQKFo/2DNhbNXhdDtye1yvMCM4fg0hwNiu2odxmMMmAKrh6eY3
	 QYK7rNhextjsA==
From: Daniel Wagner <wagi@kernel.org>
Subject: [PATCH 0/8] nvmet-fcloop: bunch of fixes and cleanups
Date: Tue, 08 Apr 2025 17:29:02 +0200
Message-Id: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL5A9WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwML3byy3NQS3bTknPz8At2CxKIS3fy8VF3jJDOjVBOL5NREQ2MloN6
 CotS0zAqwudGxtbUAyyitCmcAAAA=
X-Change-ID: 20250408-nvmet-fcloop-part-one-3b62e48cea13
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, 
 Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>
Cc: James Smart <jsmart2021@gmail.com>, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

The refcount nvmet-fcloop series is getting a bit long [1]. Here are the
various fixes and small cleanups which are independent of the refcount
changes.

Only the first patch is new, the rest has already been revied by
Christoph and Hannes. I've gave this series a good test run and there
shouldn't be any regressions.

I've got a some more simple patches (with reviews) but they will
introduce regressions, because they depend on the refcount feature.

[1] https://lore.kernel.org/all/20250318-nvmet-fcloop-v3-0-05fec0fc02f6@kernel.org/

Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
Daniel Wagner (8):
      nvmet-fcloop: swap list_add_tail arguments
      nvmet-fcloop: replace kref with refcount
      nvmet-fcloop: add ref counting to lport
      nvmet-fc: inline nvmet_fc_delete_assoc
      nvmet-fc: inline nvmet_fc_free_hostport
      nvmet-fc: update tgtport ref per assoc
      nvmet-fc: take tgtport reference only once
      nvmet-fc: put ref when assoc->del_work is already scheduled

 drivers/nvme/target/fc.c     | 60 ++++++++++++-----------------------
 drivers/nvme/target/fcloop.c | 74 ++++++++++++++++++++++++--------------------
 2 files changed, 60 insertions(+), 74 deletions(-)
---
base-commit: 0514a1379e11c6b8038674f43a478b0857d47a5e
change-id: 20250408-nvmet-fcloop-part-one-3b62e48cea13

Best regards,
-- 
Daniel Wagner <wagi@kernel.org>

