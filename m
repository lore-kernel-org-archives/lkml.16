Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C5C1A3148;
	Tue, 22 Apr 2025 04:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745294837; cv=none; b=NfHX0+GZRuekd+cl4qOBLVoFptrRf5xgtaRm4zgfMYSTAO25oN0xfkPKO3cbU6R8kuOoD4j9yztbgQqyj2oGxN7SFqFpmB9oOme3Lo5lBYONxWo/ZIYltm5Bm7EBXKmUqKvw7H7D0GH2x6u1ufFoBh0aRf3+bKcSe6sC9djiUrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745294837; c=relaxed/simple;
	bh=Pgy4tMCSKaFzxkix9tVlNrpCpOWuWpmWTI9nbJQ0qg8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZPkD/DnnaCfUTvC11gFedNGK7/CNCymirJYsBP2D+ejBLTndElVX/UAwLSuAzpDIJbHvAnpN+eFXeXCBDRqkq1e3NaytVv8OHvEHvBiQ5NtDecxE0xmPzL3cDDHwT1EoWxdq/T9Jhr+WkSWz+sx5VtesDmk26NrZG3VrtHJAUok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuKsYz0F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuKsYz0F"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16E2CC4CEE9;
	Tue, 22 Apr 2025 04:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745294837;
	bh=Pgy4tMCSKaFzxkix9tVlNrpCpOWuWpmWTI9nbJQ0qg8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=KuKsYz0F0gYjYoKnE82ceI3ug6ROuDdbTFsWMgO2ScmJ4ADVWuSzoWvXbk1dL2EAe
	 NUuRqZktpk8owE8ZwQJlWjO/8P1PPRl/QJp/RNNOZGsM5CKNMaCyZETME5wJgQJtPY
	 QkTZbFMJaa4uV3fpvoECRt9Q4o0M1eW1XfNrPfWMqn2tOmDy11qW4wERix6PATlX1m
	 zR3IZvEoLznjxc/gD3OesMZmmRhVQG5VLkpDWGh4vv98nKfcxTHfqLMHym2szf6DY4
	 bA2nBqHheehvQgNh4cV3bfpTetX9CnjYG6JaUQoKOKiLluzPzGJFTV0VUsi5RfZb8K
	 yIfNKS5SZvQMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BBAC369D6;
	Tue, 22 Apr 2025 04:07:17 +0000 (UTC)
From: Mahesh Rao via B4 Relay <devnull+mahesh.rao.altera.com@kernel.org>
Subject: [PATCH 0/7] stratix10: Add framework for asynchronous
 communication with SDM
Date: Tue, 22 Apr 2025 12:07:07 +0800
Message-Id: <20250422-sip_svc_upstream-v1-0-088059190f31@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOsVB2gC/zXNwQ6CMAyA4VdZdraGMSbIyfcwhMzZYRMHcwViY
 nx3J8Zb/yb9+pKMiZBlK14y4UpM05hD7YR0NzsOCHTNLcuiNIXSCphiz6vrl8hzQhsA6+bauOO
 l0trIfBYTenpu5Ln7dcLHkuX5t5QBme0mt2Jzy6ICnpyPg+3/fiB2sGoo4HCsfe2V0c7bE40z3
 vduCt9XF8sIeQ40t2I97JWB5LTs3u8Pq2i+fdgAAAA=
X-Change-ID: 20250131-sip_svc_upstream-e78d8c9b4335
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745294834; l=2204;
 i=mahesh.rao@altera.com; s=20250107; h=from:subject:message-id;
 bh=Pgy4tMCSKaFzxkix9tVlNrpCpOWuWpmWTI9nbJQ0qg8=;
 b=yOC01PESiFGCzXwwSXGAXGJGJ9f0uYkPRgxEKbCrDgMmlyqrc1bw1mkNh4rUMGWI1bN3Y2VAr
 adB+0TEbSEEAypCwtMnKhHWTL6DhyXZcjn2BJh/X2FTgfzIhhJj0RFm
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
Mahesh Rao (7):
      firmware: stratix10-svc: Add mutex lock and unlock in stratix10 memory allocation/free
      firmware: stratix10-svc: Implement ID pool management for asynchronous operations
      firmware: stratix10-svc: Add initial support for asynchronous communication with Stratix 10 service channel
      dt-bindings: firmware: Add interrupt specification for Intel Stratix 10 Service Layer.
      dts: agilex: Add support for SDM mailbox interrupt for Intel Agilex SoC FPGA.
      firmware: stratix10-svc: Add for SDM mailbox doorbell interrupt
      firmware: stratix10-svc: Add support for HWMON temperature and voltage read command.

 .../bindings/firmware/intel,stratix10-svc.yaml     |  10 +
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |   2 +
 drivers/firmware/stratix10-svc.c                   | 981 ++++++++++++++++++++-
 include/linux/firmware/intel/stratix10-smc.h       |  84 ++
 .../linux/firmware/intel/stratix10-svc-client.h    |  99 +++
 5 files changed, 1165 insertions(+), 11 deletions(-)
---
base-commit: f34da179a4517854b2ffbe4bce8c3405bd9be04e
change-id: 20250131-sip_svc_upstream-e78d8c9b4335
prerequisite-message-id: 20250204-socfpga_sip_svc_misc-v3-0-697f7f153cfa@intel.com
prerequisite-patch-id: 6a4223bd2c01a0fd20925e597c906dc64e11ec2f
prerequisite-patch-id: 33ca4dbe8b8e18d3e51145c6bcaae55170878b22
prerequisite-patch-id: a02bca91874f4405191e60704574a0c99f37d184

Best regards,
-- 
Mahesh Rao <mahesh.rao@altera.com>


