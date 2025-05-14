Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECCA277031;
	Wed, 14 May 2025 13:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230901; cv=none; b=R21ysCyYui4SiBmcyb2j9e4f0KoKX593cENfXlaTgbFHtJ2DWj+6NKv8tFNzZG3DuU19RO2AaR7hqy1lvoEOb9IZKKzVPVz5HAfTA5f6NaP2yFFk8E5H8VDvuVCl7jIAWHDRE7OE2tUmf2nauy8Ccaf428ey4ZC6HMCpyJvezy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230901; c=relaxed/simple;
	bh=7aCrCUIB5QkPQuKnh9Zm6hpLX8iQL7aaLQ2UpbL1ncg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pCLBmrM2RoDJDZtzjXZGoL4udncDTCJZ6qoaaX2M4aY1iI7ZNkX0CewTjdlTTEvKaQKvGci7mKRyBvkHfQyCbofi+NZyDuS+wn+uSyAqmnOOiRzpWYQ72/+ufWsmF1+gLyLPtOMRQlnzU/VLHRieo+l1eZvv3vXg4fHrmjyJlzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+8alx+J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+8alx+J"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1311DC4CEE3;
	Wed, 14 May 2025 13:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747230901;
	bh=7aCrCUIB5QkPQuKnh9Zm6hpLX8iQL7aaLQ2UpbL1ncg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g+8alx+JkHxcx2bZ3JufuuFQCoVnbqzytPADNZQrDg7e8A/9diBinudrnf8Fjd3Sc
	 WSGy0Gcf9aP3k38TtHyIlqSU5Rg/hhWTWBjTQ/5Z8Y3NY0YmPlVgjGuAh/PHVKH6ts
	 AgrOawTA2BHRLxgnRXb/rXre3lb1JVIe1oT4w5Ai5rgGUGnAg5nVzAEMPFju3NymR6
	 nWYmqhrPhqODGPO0KAJpaoeGY2Jl2VzcPVfmTa6Z15nLFhZN87trJ78Dn7WfWYJ6E8
	 1I89J5/6/JswSplQzcawiYr8XBid5px+kCYX4hjU1TSE0vkmv/IXneVyh8A6MFMCtT
	 HEPq2QqeNrV/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033A4C3ABD8;
	Wed, 14 May 2025 13:55:01 +0000 (UTC)
From: Alejandro Enrique via B4 Relay <devnull+alejandroe1.geotab.com@kernel.org>
Date: Wed, 14 May 2025 15:54:41 +0200
Subject: [PATCH 1/2] dt-bindings: gnss: u-blox: add "safeboot-gpios"
 binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-ubx-safeboot-v1-1-1ae771335356@geotab.com>
References: <20250514-ubx-safeboot-v1-0-1ae771335356@geotab.com>
In-Reply-To: <20250514-ubx-safeboot-v1-0-1ae771335356@geotab.com>
To: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alejandro Enrique <alejandroe1@geotab.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747230900; l=1203;
 i=alejandroe1@geotab.com; s=20250514; h=from:subject:message-id;
 bh=BxkYd/2jGt2UwnlIuZQlH4ljP/UW6C5OfMYMSn4bkPk=;
 b=wzJsfMUDFEUX3vvMjMqmR/SPpPnEQ67e+HbfeA0b/2D6NioGz9QHUtye9B5Ppld6BWafjefvl
 rfSa8Q3RBJ/AxNlRJIwpBHiNM51jwtmz9JMynDcssJC0y/A/MsbfDbF
X-Developer-Key: i=alejandroe1@geotab.com; a=ed25519;
 pk=xzHMPbqczL/tMsjXr26iLoHwIzLveHVnT+GIU4p1k38=
X-Endpoint-Received: by B4 Relay for alejandroe1@geotab.com/20250514 with
 auth_id=404
X-Original-From: Alejandro Enrique <alejandroe1@geotab.com>
Reply-To: alejandroe1@geotab.com

From: Alejandro Enrique <alejandroe1@geotab.com>

U-Blox M8/M9 chip have a pin to start it in safeboot mode, to be used
to recover from situations where the flash content has become
corrupted and needs to be restored. Introduce a binding to support
this safeboot pin.

Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
---
 Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
index 7d4b6d49e5eea2201ac05ba6d54b1c1721172f26..16d922279def99257c194520a7ac820f2a26e9c7 100644
--- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
+++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
@@ -32,6 +32,9 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  safeboot-gpios:
+    maxItems: 1
+
   vcc-supply:
     description: >
       Main voltage regulator
@@ -61,5 +64,6 @@ examples:
             v-bckp-supply = <&gnss_v_bckp_reg>;
             vcc-supply = <&gnss_vcc_reg>;
             reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
+            safeboot-gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
         };
     };

-- 
2.34.1


