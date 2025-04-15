Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E117291170
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710165; cv=none; b=cHNTPb6Ja1zVJxfMqqrQ42Op8IzKx+H/X/4DDHVcEWBILL+sMcQKYvfuammmqriIaD1VpQVTPHH1cezriEH6kobF//KM8nBoGwNUVcasA5MAY/oe80f0P0Qmh5JWkst8P4+3mSSpgCYPJKnHErViwOg0Zsg/iVRknWvNSg5PCoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710165; c=relaxed/simple;
	bh=ONXSgzh9c6IpKB4NMWKJprMd6baGNhHuNXrdpm2GO2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5kjg/TUXOpjwOs/iAYxRgoW8EvQOXpYGIZEtMjPkusQlf02RjcPjMxEU2X5bZJQR5Ixajn8LPvsp71XKV+0yPILazlkyEvlOOEBUeLul0sJiEk20mpEFNHWnKRqPpGvErGjegEO2Nk5c8L5oGBMVZxKrdTSYhXbguG8fWXRhtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lt5Y2zKE; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lt5Y2zKE"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224191d92e4so50984815ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744710163; x=1745314963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnnKr2l4LbB38k4Mhz6nIOWpASIGRG3czOC4OX6mJP0=;
        b=lt5Y2zKE50YZBW4KMaeax2b7+VUtHIcyx8zTp4QsHIVNt9oJL0vKXREra0OD9rn3JR
         1HDu4gqmzbj0OqPJBLo3aEN48GMxQLKMJCnkbd39Uwtvjlsa3g4+QA6BLDKxivGCTCqc
         CKAwp5p0sDS3Krj2dLp9gVF46+OH6gZ9k91Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710163; x=1745314963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnnKr2l4LbB38k4Mhz6nIOWpASIGRG3czOC4OX6mJP0=;
        b=kmPU/1SrvaDzg4FIM4E3dWikzdnDiAY6ins520e4sy0L1/nutvWCGXXbmYzVFvR071
         Q1+MUqArbjHBhkvNT1/3fFNBvywyI4KibdujfTJS8UaRo+lAsVjqPTYnykV6TIFnMnei
         UiN1SB0zWZV5SOxOIacL/TzwmnMQ6ndCW7U3ch4GSR+zZ42y2ElUl1ys3pBaOv8h9ol8
         cb/dVxG8PVTV+3M1kGZQxh9yka0JGEJALneY5OwuYuEG7OQTt7efJRemNicW+JSw2/qp
         SDuQH11z1TjUT4o5R5Hqbb2RRsQjGvloEyiTvs/PWxFmZ3kQckEZXGzMgd946Pyr1zil
         lEIA==
X-Forwarded-Encrypted: i=1; AJvYcCVbmgBZQm0cJ3AqgLBPqOqIFTgH9+hGLxuMM+Ddvycsfc6GyYzesXMbvtTsfL8otpZAa/EiGTavcCu8mIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXlUe+qc/s2JpGGu2MuHvC8ZrcylAk7ZSaqLFFLLERoTKQQd5m
	YkxTtlT1PzjOzlDGuoro8J7ls4nErGoxYTa/CkTAaOqzrvP6E1G7YrhkrUlILw==
X-Gm-Gg: ASbGncu0ail/CQXMKwV83+zZ1BhQmCHmR3BzUIbqSQyMI2RU/yGTPvwBcLdcGH9IG7D
	bQWaopCD0rdKxY0yU469Tlmrkd3scFWCUqBfK2rOFNoLQALsPrrS7T0d/VDxfXDhrQxlhgFkv7k
	shgylGW2ukO3NHjFpKFtkY5JV1XgrYAG3hAv/Dw/lR5DpycJaBiWynJKtKCQpuCcLdGOcpNKd+n
	3bF+h5kfy/cl8TiyaFYRcMKn6ZDyIp9w3fXD2EIYqCaogev1MEM+OGJjnvbsJe+3lKsJnFKpQW8
	efSUGXkRv7+8OQAdaQ3HMjTGLzyQKor4KauwqvFvs5pF4oa01ghgBfcTV2t0JI7u
X-Google-Smtp-Source: AGHT+IE9w43CJv/UOue4t3Qpb3ePg00zQx/RfidlriRmSUsZqjwz6p1TKUXguwdh81XU2yIGyaoZRw==
X-Received: by 2002:a17:902:ef0a:b0:21f:2a2:3c8b with SMTP id d9443c01a7336-22bea49d314mr228210365ad.11.1744710163568;
        Tue, 15 Apr 2025 02:42:43 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:7d0d:86ea:ee84:cd08])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca5asm113135215ad.254.2025.04.15.02.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:42:43 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: usb: realtek,rts5411: Adapt usb-hub.yaml
Date: Tue, 15 Apr 2025 17:42:00 +0800
Message-ID: <20250415094227.3629916-4-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
In-Reply-To: <20250415094227.3629916-1-treapking@chromium.org>
References: <20250415094227.3629916-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inherit usb-hub.yaml and remove duplicated schemas.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v2:
- New in v2

 .../bindings/usb/realtek,rts5411.yaml         | 47 +++++--------------
 1 file changed, 13 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
index 6577a61cc07531..52fad201a56c82 100644
--- a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
+++ b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Matthias Kaehlcke <mka@chromium.org>
 
 allOf:
-  - $ref: usb-device.yaml#
+  - $ref: usb-hub.yaml#
 
 properties:
   compatible:
@@ -21,51 +21,30 @@ properties:
 
   reg: true
 
-  '#address-cells':
-    const: 1
+  '#address-cells': true
 
-  '#size-cells':
-    const: 0
+  '#size-cells': true
 
   vdd-supply:
     description:
       phandle to the regulator that provides power to the hub.
 
-  peer-hub:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      phandle to the peer hub on the controller.
+  peer-hub: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-
     properties:
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          1st downstream facing USB port
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          2nd downstream facing USB port
-
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          3rd downstream facing USB port
-
-      port@4:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          4th downstream facing USB port
+      '#address-cells': true
+
+      '#size-cells': true
+
+    patternProperties:
+      '^port@[1-4]$': true
+
+    additionalProperties: false
 
 patternProperties:
-  '^.*@[1-4]$':
-    description: The hard wired USB devices
-    type: object
-    $ref: /schemas/usb/usb-device.yaml
-    additionalProperties: true
+  '^.*@[1-4]$': true
 
 required:
   - peer-hub
-- 
2.49.0.777.g153de2bbd5-goog

