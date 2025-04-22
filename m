Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23141A314F;
	Tue, 22 Apr 2025 04:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745294837; cv=none; b=hvilL6oFyciBzMImMhL5t3aClRmmWd6vwnFhE19pZmEHRFyWc46Q1mRgnTz7bliETVHjTiDfIcJsYBsp63+R2+77SyB4mwBD6y7wKu1ilNCLyw0kpqH/TFAb1vvjfbPrtN1aig0wZe66+1ECVqHSuty/w4dD045ixkdweBBeniw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745294837; c=relaxed/simple;
	bh=MWK0k2Zg2Vcjqhjy3hNtPacDZk6r8uGm9GehPLJAyYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ga+3q0LWJqZmclPKaYFL5/0ZyM0q82f7fwfPJP85xPJs9suYsG4EA7XiNz9sLiCY6w8w17DpGd0txG6aer+kZDi2uEvc5WjkPQv5La2vA4g/b9WRwzljW1hysybq1sPaTFrL4sgWi/aE1jTwsvXAVJxLe+oohnB1Z6B5QgTW44A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhWQEV1n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhWQEV1n"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6634FC4CEF3;
	Tue, 22 Apr 2025 04:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745294837;
	bh=MWK0k2Zg2Vcjqhjy3hNtPacDZk6r8uGm9GehPLJAyYM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IhWQEV1nj0I4tgM6gexd8HiU1jG741UAVADfzNcSVVKBua8fnpWTG/Fyo86S2JqiF
	 ZDGcXDga9MOrBQVN2G4VQODUEAmvwONOqULNWDzyhM8gGk0rfnHVZLUhfaAF5nlg3M
	 qN5ecW0qII+Jo6qWl5ndtlE+lypZnUopAoPgn1wMPHaj8wUBVpz1NFAD+96XTNFSRv
	 S+BTJsqdjpFWlXRuWSwn27M6TgZT9Kq2JCxItE9cFfvRtgGdmZSfUIgG6zdCCcgx1T
	 ZhoUd5S4fKAWeSslqn/Ia4JI1O8VsEeag4WNIKrw0f1v1ajldM8gTvkqoT8R/MQeft
	 aNkA5bsTDRVgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C329C369D7;
	Tue, 22 Apr 2025 04:07:17 +0000 (UTC)
From: Mahesh Rao via B4 Relay <devnull+mahesh.rao.altera.com@kernel.org>
Date: Tue, 22 Apr 2025 12:07:11 +0800
Subject: [PATCH 4/7] dt-bindings: firmware: Add interrupt specification for
 Intel Stratix 10 Service Layer.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-sip_svc_upstream-v1-4-088059190f31@altera.com>
References: <20250422-sip_svc_upstream-v1-0-088059190f31@altera.com>
In-Reply-To: <20250422-sip_svc_upstream-v1-0-088059190f31@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745294834; l=1801;
 i=mahesh.rao@altera.com; s=20250107; h=from:subject:message-id;
 bh=SNGxaxaQ7O8Am109rLMAgnrv4HKXic5pX5a15IoblFE=;
 b=AEZm/9bzNBzTC4xWUbctZ/8jIPwHlWZ1T3vBKor/RQDuT0sRxBLQeLLDFh643g9l2gfD5KaaJ
 vOgCQ/4m/QIDnqMv8JxPG4QVNQByd6+OC+bxgash1bBAQ0XAcGYOgw9
X-Developer-Key: i=mahesh.rao@altera.com; a=ed25519;
 pk=tQiFUzoKxHrQLDtWeEeaeTeJTl/UfclUHWZy1fjSiyg=
X-Endpoint-Received: by B4 Relay for mahesh.rao@altera.com/20250107 with
 auth_id=337
X-Original-From: Mahesh Rao <mahesh.rao@altera.com>
Reply-To: mahesh.rao@altera.com

From: Mahesh Rao <mahesh.rao@altera.com>

Add interrupt specification for Intel Stratix10 Service
layer for asynchronous communication.

Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
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


