Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3043F9DA;
	Thu, 22 May 2025 16:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747932698; cv=none; b=EvWFU53UIFVcc/o9YhsYcK5xAc1alLuVC1WtLi95WPR9gNNDuaQoRiQgDfeD1UIpfouOV9ls7Bp1mmcnbbTXClHWFlGvv0F1iQ3tsY+ZNZauxomdyzTp3zGVf9hfEi1YfJRkGJxN1PGxcsjJ0IO3ttIgg5KQTEWF5k0RdNySoMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747932698; c=relaxed/simple;
	bh=NTC0IA2p9IVr/9NBNvhyqzF1HsQf3uhDF7IQNaKS+Nc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n2uzLw4gEqQWFI3VewAlaXmHq3EwLfGcza9i8eIc6cMb1jpN1bwt6aLEAXZPg8rc5VYPUHqglFXPeUxKRE8OaUnjlIciDF7uVhTYyd05w557rBhQMtUNNO9iOA5EsKTlXSRd5WGvUUko7RZIw7+nYwz8NWit39RrLgaxWDptvCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sh2bHHuF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sh2bHHuF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D4B3C4CEE4;
	Thu, 22 May 2025 16:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747932697;
	bh=NTC0IA2p9IVr/9NBNvhyqzF1HsQf3uhDF7IQNaKS+Nc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=sh2bHHuF5WUJ9sl5cZ4mS63CREnlF3nMxnXvMuuDm6YmBtI/xeg+SvpgqMQugxsZl
	 7MBES8Bo6M6xxRQiUXcY7e7DHG41mfPo6DfsemqYXZtHb94H1nEUY7LyvmwRuYGhVj
	 5WF648PrJjlRDWJdpyN6a7lZl6MS1bQuDZk7Dh8SQqIc3fqnE9aZNzNPE8zBOnxQJ3
	 kwPs4y7jDPEKOR1whhyJ+ffrPTHXFcgR28Qn9Qr/rpC8mbafewArsvTYW6p3W647Lj
	 hkSoH+jHQBIGplBzGn7tymTe7Tl2jg1KX90ZRLeo8yWUarZmsukiouLdxFNZae1Db2
	 2SUkfNfn3nM/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B43DC54E65;
	Thu, 22 May 2025 16:51:37 +0000 (UTC)
From: Alejandro Enrique via B4 Relay <devnull+alejandroe1.geotab.com@kernel.org>
Subject: [PATCH v2 0/2] Add support for safeboot pin to UBlox GNSS driver
Date: Thu, 22 May 2025 18:51:03 +0200
Message-Id: <20250522-ubx-safeboot-v2-0-08c22378b8c9@geotab.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPdVL2gC/3WMyw7CIBBFf6WZtRgeIsaV/2G6ABzaWVgMIKlp+
 Hexe+/u3OScDTImwgzXYYOElTLFpYM8DOBnu0zI6NEZJJeaa3Fib7eybAO6GAtTRl+C7NPooSu
 vhIHWPXcfO8+US0yfvV7F7/0TqoJxJiwaI5TSSp9vE8Zi3dHHJ4yttS/3WLvXqQAAAA==
X-Change-ID: 20250514-ubx-safeboot-3758f22225ec
To: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alejandro Enrique <alejandroe1@geotab.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747932696; l=1275;
 i=alejandroe1@geotab.com; s=20250514; h=from:subject:message-id;
 bh=NTC0IA2p9IVr/9NBNvhyqzF1HsQf3uhDF7IQNaKS+Nc=;
 b=/xUEI5CH82z+BjvENsXdv2Gu8D0Ag1Bwpln0iGToIIi67PC0xGOCnD9W4pOm84FPUy01A9YCh
 KADPVHqp0/nAfS+4Q2nuDqmD8qEZEUxzUL4BG2IMgYmxydhmd742xlY
X-Developer-Key: i=alejandroe1@geotab.com; a=ed25519;
 pk=xzHMPbqczL/tMsjXr26iLoHwIzLveHVnT+GIU4p1k38=
X-Endpoint-Received: by B4 Relay for alejandroe1@geotab.com/20250514 with
 auth_id=404
X-Original-From: Alejandro Enrique <alejandroe1@geotab.com>
Reply-To: alejandroe1@geotab.com

U-Blox 8/M8 and M9 chips have a pin to start it in safeboot mode, to
be used to recover from situations where the flash content has become
corrupted and needs to be restored. If this pin is asserted at power
up or reset, the receiver starts in safeboot mode and GNSS operation
is disabled.

If this pin is wired to a GPIO in the host it should be deasserted
before powering up or resetting the GNSS.

This series adds support for handling the safeboot pin when probing
the driver.

Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
---
Changes in v2:
- Add if/then to dt binding to disallow safeboot-gpios property for neo-6m
- Link to v1: https://lore.kernel.org/r/20250514-ubx-safeboot-v1-0-1ae771335356@geotab.com

---
Alejandro Enrique (2):
      dt-bindings: gnss: u-blox: add "safeboot-gpios" binding
      gnss: ubx: add support for the safeboot gpio

 Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 20 ++++++++++++++++----
 drivers/gnss/ubx.c                                        |  8 ++++++++
 2 files changed, 24 insertions(+), 4 deletions(-)
---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250514-ubx-safeboot-3758f22225ec

Best regards,
-- 
Alejandro Enrique <alejandroe1@geotab.com>


