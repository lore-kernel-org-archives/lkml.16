Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE8430E826;
	Fri, 20 Jun 2025 04:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750394771; cv=none; b=O28EyxOCzl+SvfQEyx1eOZFmTWdM88CwBMQ/wOcDGI1peDWPnpcwy8UlvnO33vpjozWYUxvOCnn99ZOJdzm6XHyxkB5VPx4ciqwhYqQJwm+i2K18P2k83FmRozxJ9vNEkaS9mh9+QK6d8ORQqtRTCvosSYdY4QG9LqrxolGg7dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750394771; c=relaxed/simple;
	bh=IA4k49fw3y4MpiKnDSCYUEtcW5IOIjO8YPvm+qzIMjE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jaDW4PvDn69JnIeVSwVXEj8qrUEGvZYPcosTAc/DF9ktSOtwwjFWnmlwh9S/an9oh6N9wE+pBLFT0rhkpjsgz/KFPq9w8n9yHSnO0DHGxJ9pI8sDvADJT4LlsQvQfFScjBiiZS1AjmkomoT+om2eLoBXeBN94P0p6EeJRlG5Ego=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSKTDocO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSKTDocO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18E2DC4CEE3;
	Fri, 20 Jun 2025 04:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750394771;
	bh=IA4k49fw3y4MpiKnDSCYUEtcW5IOIjO8YPvm+qzIMjE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZSKTDocOOID497Tw7XgvedShH0GYtbA1d6tchJOg3qHcFygjjTm7W97/v7AjYoGvV
	 VuiKHI3S8TgFbvcZWauwxakRNMD/i/pemSYscPRizB7PBKcXvNg9wOFBrB1r1EU1eP
	 +YTErLECXHYioxAHoz6zVpfO4BDjd+9gtAq05VIyUOQkhv53jxliOKpnqmC/RBGOVr
	 +TmiG818g873S0XkYtJ20NFqVtbXX6FKiWTx3wL63BggKQSfz90I4uwUsepfVHEJVb
	 DZjp5OcBC3AVeiFSUKfHESi5ob/JA5MO4JjzjB8ZaeXUw87Eabvnuw/8WssdmaCAVQ
	 2q9cKapX+zD+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C9EC7115C;
	Fri, 20 Jun 2025 04:46:11 +0000 (UTC)
From: Mahesh Rao via B4 Relay <devnull+mahesh.rao.altera.com@kernel.org>
Subject: [PATCH v5 0/5] stratix10: Add framework for asynchronous
 communication with SDM
Date: Fri, 20 Jun 2025 12:46:02 +0800
Message-Id: <20250620-sip_svc_upstream-v5-0-732d4ac08a32@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIrnVGgC/23Q22qEMBAG4FeRXDfL5KSJV32PUiTGcTdQV5u4o
 WXx3ZtVii3r5T8w3xzuJGLwGEld3EnA5KMfrzmol4K4i72ekfouZ8KBK2CC0einJibX3KY4B7Q
 DxUp32plWCqFIbpsC9v5rJd/etxzw85bleSvucF1sLBgaR9dPZ9v88oOPjrat6/q2sgBc10k89
 NZGpG4cBj/XRSpPTJHHkIuP8xi+1zMSW6estOT8eePEKFDQGpRhBnrBXu3HjMGesrtqie+CYkc
 Cz0JvUTmpXGa6J0H8EXh5IIgslBa0lQp4h+JJkLtQMjgQZBbyg0xXgjZQ/b9iWZYfW5j409wBA
 AA=
X-Change-ID: 20250131-sip_svc_upstream-e78d8c9b4335
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750394768; l=3476;
 i=mahesh.rao@altera.com; s=20250107; h=from:subject:message-id;
 bh=IA4k49fw3y4MpiKnDSCYUEtcW5IOIjO8YPvm+qzIMjE=;
 b=7kVZ6VweIaVjI+WtLERQcUw5OsONuLZwtCs4yPglEC43OMX3kEm/rT8Tr6cEXYkPNKdQlBZxX
 JuT9Jyj6/2AAZx3dBtyMHPL06zaf16i8kyTFPq2GRUbnrD7eJxWfywF
X-Developer-Key: i=mahesh.rao@altera.com; a=ed25519;
 pk=tQiFUzoKxHrQLDtWeEeaeTeJTl/UfclUHWZy1fjSiyg=
X-Endpoint-Received: by B4 Relay for mahesh.rao@altera.com/20250107 with
 auth_id=337
X-Original-From: Mahesh Rao <mahesh.rao@altera.com>
Reply-To: mahesh.rao@altera.com

The patch set includes the following changes:

- Add protection for querying memory objects in
  multi-threaded flow.
- Add support to generate and maintain message id
  and client id for asynchronous communication with SDM.
- Add framework to communicate with Secure Device
  Manager(SDM) asynchronously by sending a request
  and polling for response.
- Add commands for performing Remote System Update
  (RSU) operations asynchronously.
- Migrate RSU driver to use the asynchronous
  communication framework.

---
Changes in v5:
- Use FIELD_PREP, FIELD_GET() and GENMASK() for bit
  manipulation for ids.
- Bring down probing when stratix10_svc_async_init()
  fails.
- Other minor fixes.

- Link to v4: https://lore.kernel.org/r/20250610-sip_svc_upstream-v4-0-bcd9d6089071@altera.com

Changes in v4:
- Added description for svc_mem_lock mutex.
- Wrapped commit message and comments in source
  code to kernel coding style as per coding style.
- Added minor code fixes.
- Moved variables to the top of the function
- Removed HWMON support from in the patch-set, this
  will be sent in a separate patch-set.
- Added support for RSU commands to asynchronously
  communicate with SDM.
- Migrated RSU driver to use the supported 
  asynchronous commands.

- Link to v3: https://lore.kernel.org/r/20250526-sip_svc_upstream-v3-0-6a08a4502de3@altera.com

Changes in v3:
- Changed "Stratix 10" to "Stratix10" in the commit
  message and in source code.
- Simplified stratix10_svc_add_async_client() by removing
  redundant code for async common channel initialization.
- Fixed resource cleanup on negative path in
  stratix10_svc_remove_async_client() and stratix10_svc_async_init().
- Removed optional interrupt handler support, will send the patches
  in a separate patch-set.

- Link to v2: https://lore.kernel.org/r/20250512-sip_svc_upstream-v2-0-fae5c45c059d@altera.com

Changes in v2:
- Added Reviewed by tag from Rob Herring for dt-binding
  patch.
- Resending the patch-set as there is no response from
  the maintainers for the previous patch submission.

- Link to v1: https://lore.kernel.org/r/20250422-sip_svc_upstream-v1-0-088059190f31@altera.com

---
Mahesh Rao (5):
      firmware: stratix10-svc: Add mutex lock and unlock in stratix10 memory allocation/free
      firmware: stratix10-svc: Implement ID pool management for asynchronous operations
      firmware: stratix10-svc: Add initial support for asynchronous communication with Stratix10 service channel
      firmware: stratix10-svc: Add support for RSU commands in asynchronous framework
      firmware: stratix10-rsu: Migrate RSU driver to use stratix10 asynchronous framework.

 drivers/firmware/stratix10-rsu.c                   | 272 +++---
 drivers/firmware/stratix10-svc.c                   | 954 ++++++++++++++++++++-
 include/linux/firmware/intel/stratix10-smc.h       |  76 ++
 .../linux/firmware/intel/stratix10-svc-client.h    |  92 ++
 4 files changed, 1253 insertions(+), 141 deletions(-)
---
base-commit: 0a4b866d08c6adaea2f4592d31edac6deeb4dcbd
change-id: 20250131-sip_svc_upstream-e78d8c9b4335
prerequisite-change-id: 20250109-socfpga_sip_svc_misc-bbcdfb7a0028:v3
prerequisite-patch-id: 6a4223bd2c01a0fd20925e597c906dc64e11ec2f
prerequisite-patch-id: 33ca4dbe8b8e18d3e51145c6bcaae55170878b22
prerequisite-patch-id: a02bca91874f4405191e60704574a0c99f37d184

Best regards,
-- 
Mahesh Rao <mahesh.rao@altera.com>


