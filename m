Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE9E1D63EF;
	Mon, 26 May 2025 06:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748240735; cv=none; b=PqYz6t3QkksYAjP/hdUvWcrmjW0USK5p+WijHI0u4luWnSxe+ldD3aRE71odoZw1IHYn04f5aHvWNf7uRWQRDoMLS+N8p7XyCJQAvjQAdiArsAh2Bx75O3wlD1s52yQn3bKE/4DVOO48POOyV+OkOI5KXLr3fIsN0UwWM8FCZ4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748240735; c=relaxed/simple;
	bh=BJeTERc5V0vrdbYgydnzT6w4VAFQlNqaTMpH8PV2Sr4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J9ZpvGRG3fv3G2epETe8a6O0gF+RIJ5uIU2rxo+mVWFMRBD5SlLGkMyROf6WLJc2xqj4XI5J52mcylX1vXxelErzJxij3JA3Jdf97ha0mxZarZamEzefOHRcIkHxYSh28gtVFQEJja5XaEAgTujX0yRk5EJaOnr6H9+CCyS/dbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jW7D+V/C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jW7D+V/C"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DD7DC4CEE7;
	Mon, 26 May 2025 06:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748240735;
	bh=BJeTERc5V0vrdbYgydnzT6w4VAFQlNqaTMpH8PV2Sr4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jW7D+V/CCihEwWkT6Va0aSKGt6l5JJltxCWyGiNeFd4hjtkRDEbh+1QhtAon596eG
	 5J2BYM4Zae2Odc1KP6BLWiYMQsoF48eqtbsWG3ZPzJHEkapJB+lMh6xLWx360tUN54
	 xT1qdl1FuVxMqA88PhfCq3H3OCxvIMvUW5Fdz7Ci9HxHvKAFm9NtOKNKCO++t8lAmW
	 RsHZTQsmi6OCafsXwGbFln8d45VBziZ7XWRNvqTzwc7XqyHM0qDbiGCaN9T9YZl/VN
	 ngwlljdF3HTHZWG+s1p2fjnkXRTidUQi53O1lRUTvrNlfzHHO65XxsraJVbCCP4C6f
	 3/+wegQw0NG4A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7F3C54FB3;
	Mon, 26 May 2025 06:25:35 +0000 (UTC)
From: Mahesh Rao via B4 Relay <devnull+mahesh.rao.altera.com@kernel.org>
Subject: [PATCH v3 0/4] stratix10: Add framework for asynchronous
 communication with SDM
Date: Mon, 26 May 2025 14:25:03 +0800
Message-Id: <20250526-sip_svc_upstream-v3-0-6a08a4502de3@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEAJNGgC/23PTWrDMBAF4KsYraugH6uRveo9SjGSPEoEdexqF
 NESfPcoMiGUZPkG5nszF4IQAyDpmwuJkAOG+VSCfGuIO5rTAWgYSyaCCcW45BTDMmB2w3nBFMF
 MFPZ61K6zrZSKlLUlgg+/lfz82nKEn3OR0zZ8wH2zsayjODu/HMxw56eAjlrrRm/3hjGh+yxvu
 jUI1M3TFFLf5PcdV+RWcgyY5vhX38i8tlS6FeL54swpo0xrpjreMS/5h/lOEM2uuFXL4iEo/ko
 QRfAGlGuVK8z4T1jX9Qocq23ZWAEAAA==
X-Change-ID: 20250131-sip_svc_upstream-e78d8c9b4335
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748240732; l=2648;
 i=mahesh.rao@altera.com; s=20250107; h=from:subject:message-id;
 bh=BJeTERc5V0vrdbYgydnzT6w4VAFQlNqaTMpH8PV2Sr4=;
 b=AuY2GU47tnF1D7mAgvBZpACk55FmX1gmZr0GuOH1hXxSax/wFO6j+ZI2ianLuUINBnHQp3sMX
 Ul19RhFy1iWAD+IjoFAudJRuTra3YHhTPla4aaDOFLbxHGdUB3zTggC
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
- Add interrupt definition in Agilex devicetree
  for asynchronous communication.
- Add SDM interrupt support for Agilex platform
  supporting asynchronous communication.
- Add support to optionally notify the clients if
  response is available using interrupts from SDM.
- Add commands for querying temperature and voltage
  from SDM.

---
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
Mahesh Rao (4):
      firmware: stratix10-svc: Add mutex lock and unlock in stratix10 memory allocation/free
      firmware: stratix10-svc: Implement ID pool management for asynchronous operations
      firmware: stratix10-svc: Add initial support for asynchronous communication with Stratix10 service channel
      firmware: stratix10-svc: Add support for HWMON temperature and voltage read command.

 drivers/firmware/stratix10-svc.c                   | 871 ++++++++++++++++++++-
 include/linux/firmware/intel/stratix10-smc.h       |  62 ++
 .../linux/firmware/intel/stratix10-svc-client.h    |  99 +++
 3 files changed, 1021 insertions(+), 11 deletions(-)
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


