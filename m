Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AA620328;
	Fri, 23 May 2025 11:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747999207; cv=none; b=Rx9QqoJRGIKUjYsgYFATiQb4Ktsl9x9sRZ6xKBYz/J9v2wrXRfWKDujGqSfNmG1kVaIjTptNiFod+h3Dr5F4naK+3d492iycB7YCCtr9wV+LJYmDV0ia37kqjKgnQ9KgUo36FNdQ8OB9R86V+XMFt/F2Vs7EZLMhXq+oVT3aitQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747999207; c=relaxed/simple;
	bh=Ae1R/lF3ZBEtNleSnaRJpPaMPdeNBAnIoQqQ6yxAwmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g6zU7/8iFnSAzWBiUuczUF26z/eYUJy16oGK5+Hmo6namOpG/q83+DjE/RWujFAL3GNdWuEKS8jR2u84se4NGmNaDF1z6wVkhnNI49O6hUJqkK4EsE0WIs5tw3vmRSWtCdo9yWHfVyDjvt0Td7LFqqTNXgEZMY15yZVYsjqIkHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3BPn+a5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3BPn+a5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F5A6C4CEE9;
	Fri, 23 May 2025 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747999206;
	bh=Ae1R/lF3ZBEtNleSnaRJpPaMPdeNBAnIoQqQ6yxAwmA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=I3BPn+a50DYUpyq7pgH5hJLMEMKmeLz3AJ8PH/Ogb3RObiChm0/Temirg38IJECzQ
	 oVubW4RObmCUAubgCqntrYn6YwZppjWtCHkA+JxnvG7l3nyNCvTLGKQYezK/0m03sD
	 m40341Kc6FycBJ+HD/dIRxJSaJI2oIbu0jdM9HIkHCdRHo6pSLpBVKnHmecRWszU0K
	 +woxkvcvbP/BX/ud5EnfxqtCwOhjwgiEU4KPt2wP4idE1mz9UB1ytt2PDImFB+/Rwi
	 Xr8RmDLhwF7vft8MeUN92LZf9d2PEtCGNrR9a46DPOAYQ4+4MRVnoNI2ExWEyLPHqA
	 uwF+iD0TfbVIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A18C54ED0;
	Fri, 23 May 2025 11:20:06 +0000 (UTC)
From: Alejandro Enrique via B4 Relay <devnull+alejandroe1.geotab.com@kernel.org>
Date: Fri, 23 May 2025 13:19:52 +0200
Subject: [PATCH v3] dt-bindings: gnss: add u-blox,neo-9m compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-ubx-m9-v3-1-6fa4ef5b7d4a@geotab.com>
X-B4-Tracking: v=1; b=H4sIANdZMGgC/2WMyw6CMBQFf4V07TV9YcGV/2Fc9AldQEmLDYbw7
 xYWRuNyTs7MipKN3iZ0rVYUbfbJh7EAO1VI93LsLHhTGFFMa1wTDk+1wNCCwMZhZxrNG4XKeYr
 W+eUI3R+Fe5/mEF9HN5N9/UtkAhhIy1rBJHdMy1tnwyzVWYcB7Y1MvzxKPx4FAherDRdlFkr/e
 Nu2vQHtTfcU1QAAAA==
X-Change-ID: 20250514-ubx-m9-70df0fd8c48b
To: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alejandro Enrique <alejandroe1@geotab.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747999205; l=1718;
 i=alejandroe1@geotab.com; s=20250514; h=from:subject:message-id;
 bh=doxoiCk7P2mD0vfGqzFeF8yrTBUMxR+jt9Z2K94wDD4=;
 b=/FniEjMYT4HUGKi6YLK4fVVjq4Uh7w5MrpsQeLBA00m98WF+KxQzG6w2buE8MCN8U0WUrKVIH
 dujb/Ra05yeDURpFKUF/pGOgcB2VCc1u7Dd3F8zif8Utd383x7Y67eF
X-Developer-Key: i=alejandroe1@geotab.com; a=ed25519;
 pk=xzHMPbqczL/tMsjXr26iLoHwIzLveHVnT+GIU4p1k38=
X-Endpoint-Received: by B4 Relay for alejandroe1@geotab.com/20250514 with
 auth_id=404
X-Original-From: Alejandro Enrique <alejandroe1@geotab.com>
Reply-To: alejandroe1@geotab.com

From: Alejandro Enrique <alejandroe1@geotab.com>

Add compatible for u-blox NEO-9M GPS module.

Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
---
This series just add the compatible string for u-blox NEO-9M module,
using neo-m8 as fallback. I have tested the driver with such a module
and it is working fine.
---
Changes in v3:
- Remove unnecessary example, 'items', and blank line in the devicetree binding
- Link to v2: https://lore.kernel.org/r/20250522-ubx-m9-v2-1-6ecd470527bc@geotab.com

Changes in v2:
- Modify the binding to allow falling back to neo-m8
- Remove compatible string from u-blox driver
- Link to v1: https://lore.kernel.org/r/20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com
---
 Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
index 7d4b6d49e5eea2201ac05ba6d54b1c1721172f26..c0c2bfaa606fb01f7efee1ce7e5d30b1640783f3 100644
--- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
+++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
@@ -18,10 +18,14 @@ description: >
 
 properties:
   compatible:
-    enum:
-      - u-blox,neo-6m
-      - u-blox,neo-8
-      - u-blox,neo-m8
+    oneOf:
+      - enum:
+          - u-blox,neo-6m
+          - u-blox,neo-8
+          - u-blox,neo-m8
+      - items:
+          - const: u-blox,neo-m9
+          - const: u-blox,neo-m8
 
   reg:
     description: >

---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250514-ubx-m9-70df0fd8c48b

Best regards,
-- 
Alejandro Enrique <alejandroe1@geotab.com>


