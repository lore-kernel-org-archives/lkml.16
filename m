Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96822292080;
	Mon, 12 May 2025 11:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050019; cv=none; b=tWRfplfiN21/sBY1AbVVSI3XNfmisPzM/z1SzfDTavUIbDrBeQHI1fpHCutUKVQPWCJRQ6gDEzRLt1CR5dHgsuA+SryZalpvtSHh2ps96b1Cf2iuMmjV/aNYTj7Nk4jjZvVRQ4D+laZBEuZ1aD9EAm7KyaGiFR1zaOGSox/OUE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050019; c=relaxed/simple;
	bh=CLMpKrTrD+1F6YeWwuDcqlirxHopHnUHK3PKeL3Qewc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iv8bk4JrUEzBrM61tJQ8f7QCmugf417f6tQWssksfiwzP7XUCmCA/8WdPFh3ocz7NktX31g6CaQIaug9BJQ7Ko5O+X/tT+BcMhg9IxcpSzjIEXLiGbJLKY56aqhSzXaZEFgNgnxVv6AmwNdACcj9msMSIEWtlVokjBZv6y8mlyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUYrYvoM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUYrYvoM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29A51C4CEF7;
	Mon, 12 May 2025 11:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747050019;
	bh=CLMpKrTrD+1F6YeWwuDcqlirxHopHnUHK3PKeL3Qewc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jUYrYvoMl5raBTYUl5TA+QGdRDcbX5/lrjmTMSOMcJTvxOs3Wnl3fwQZia5teMhu2
	 0byE8YfwMaam2kYcB4BS/QkF2fXIXX0GZEHWgdEv/Sv/Q0zOOrBEWiO1Up7PIEp2Ek
	 B4oD70ibqHgBpEBqt+5g1SYNHNaDMLddS1ervcKOHeX4VfvWqOEVLYdTOVHW7g7z3J
	 2zhM8UWbaF+vKnHiYLAS6uwzeGZ+z7Hhkki0nQA6EzSBjs1Y1gFUoaJKl5Ntwje1zU
	 mDJ+zNKY1pJRooT1UNYDofP1uH8UMB8uq01DLo7sIGc0FYv3voW6GTAx727w2tK9+A
	 ifCMgnK81vxiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D54EC3ABD4;
	Mon, 12 May 2025 11:40:19 +0000 (UTC)
From: Mahesh Rao via B4 Relay <devnull+mahesh.rao.altera.com@kernel.org>
Date: Mon, 12 May 2025 19:39:54 +0800
Subject: [PATCH v2 4/7] dt-bindings: firmware: Add interrupt specification
 for Intel Stratix 10 Service Layer.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-sip_svc_upstream-v2-4-fae5c45c059d@altera.com>
References: <20250512-sip_svc_upstream-v2-0-fae5c45c059d@altera.com>
In-Reply-To: <20250512-sip_svc_upstream-v2-0-fae5c45c059d@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747050016; l=1851;
 i=mahesh.rao@altera.com; s=20250107; h=from:subject:message-id;
 bh=AOemBCgdL+N65O4/Not6GZwfFLWHmbGOTOms8z2w2Jo=;
 b=BV5ewUJ5op6igt7FS8Q7vHHWVKc+xb+Cc0CLiZvtsc4/zyaXufjOyi4UfKNyh0yyXsZplvwKF
 Wr0tKCNSc8XBl3I/dk99nteZ2+xM0mJwYhjorSbIrINFuhcYZD8HSNx
X-Developer-Key: i=mahesh.rao@altera.com; a=ed25519;
 pk=tQiFUzoKxHrQLDtWeEeaeTeJTl/UfclUHWZy1fjSiyg=
X-Endpoint-Received: by B4 Relay for mahesh.rao@altera.com/20250107 with
 auth_id=337
X-Original-From: Mahesh Rao <mahesh.rao@altera.com>
Reply-To: mahesh.rao@altera.com

From: Mahesh Rao <mahesh.rao@altera.com>

Add interrupt specification for Intel Stratix10 Service
layer for asynchronous communication.

Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
---
 .../devicetree/bindings/firmware/intel,stratix10-svc.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
index fac1e955852e4f9b966c991dcfac56222c5f7315..656cc50fd08217f270f95ae39010152423315ed1 100644
--- a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
+++ b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
@@ -54,6 +54,12 @@ properties:
       reserved memory region for the service layer driver to
       communicate with the secure device manager.
 
+  interrupts:
+    maxItems: 1
+    description:
+      This interrupt is used by the Secure Device Manager (SDM) to signal
+      completion of an asynchronous operation to service layer driver.
+
   fpga-mgr:
     $ref: /schemas/fpga/intel,stratix10-soc-fpga-mgr.yaml
     description: Optional child node for fpga manager to perform fabric configuration.
@@ -67,6 +73,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     reserved-memory {
       #address-cells = <2>;
       #size-cells = <2>;
@@ -84,6 +92,8 @@ examples:
         compatible = "intel,stratix10-svc";
         method = "smc";
         memory-region = <&service_reserved>;
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-parent = <&intc0>;
 
         fpga-mgr {
           compatible = "intel,stratix10-soc-fpga-mgr";

-- 
2.35.3


