Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C970125A2A1
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739228239; cv=none; b=Y6TX7n+m76+70N7r0+K+Q/+HFcg42ngyHC+0EcZtMrQeIz1XplPc24qX2ILuxV6J2bsnRackgwMoizbZQzGblze4uZPRISZyY5/Mvt6KfVrQ22bb36TcTUo9cPJfgXvNkXP6dPR4+5gt2pQQ1oEpVAiXtEkicBhDLgCGWtZy9h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739228239; c=relaxed/simple;
	bh=TigOjWjByS/qOxFStuN4jxQdOoIMiI/Kd8fVikyy1TM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XbDfAVDyjLnwhKKVrDZnTo77QC7niTLun7Feezytd/2RDfNAtTIbGxI62tFI4gbiWRVNCTYUOSBBBCuch4zCsL9KGp6SQDMpD7IxRs00e1Uz6JyeHUcr87XjW58d2eJ1HbRFR5u2d6HqCp4sblxd92V+G7MPCfgjANGgAn50das=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IB0jmWQw; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IB0jmWQw"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fa44590eebso4986707a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739228237; x=1739833037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZJsAaQGNn6Yx+uv7DpUfzz85gmu7DiYTeAAhcXBbX4=;
        b=IB0jmWQwT2FxQhF10tXeQW9PjWfvwL4KYJYDG6AcTELx5gdjyaGsaNQ4ZGfinwm+vP
         J/MJBU7VybBzzn6T5h+k3G2R6DYUAE1hUYmSgxg1N8PJ73mMN1qFdTI5CzB5bWljZ/Sx
         faxvvE9KyFsjSvPK4JVK4ItwsSM+tl/+YdGHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739228237; x=1739833037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZJsAaQGNn6Yx+uv7DpUfzz85gmu7DiYTeAAhcXBbX4=;
        b=AP9QpkYON5EPgkn9Hfp/lsIuxQ4ltGotTZO9Pdv9Q20pcbn0PckWva1KXsux3wvX8r
         aaLQ0bO4RCwVh5deY2cqmdF0iWgy6qjlcGE1tEqCmoP8by9D3KBtlFsZYitbfxXMA+at
         FaiCfoYePbssa7q2DP9SUw/4nFI+nE4FAoCx0aLEATqrUgezL9PHFLWL/bKxVLxtqlt7
         7/yRc8zRSIN+lvGS8oNG7BJpCtMKWqllfgr0/q8hFNT3tPYvbIYkH8hBZj/JWWUTdwz6
         MZ+L/cIcI2emvYy+x+esE1cMKAVBfMeYSrvP0GB+VQhZ2tj1fOJNqvnAXhpVFUzMy/5Q
         PgTA==
X-Gm-Message-State: AOJu0YzjrDi0/x5bPaHkJgjbXWoJc2CXBWFvI88ZxNn7j/p2ANe3YhbV
	wM1VaV5uaaz13dXNWGGKmJw96hT6iz2hAELfLxYIk1LsOYaVD0OYQbHDPF31oA==
X-Gm-Gg: ASbGncvOB2w0HAYm3c3ekCT3mnPh7AbIvw9wPvZdjuuX1duxYQZwGN5mTUscvCdBAAJ
	sbhohHuCqCy1hb3skv14dwTilZH60F6YwhA4eDU6gt5aTny+Vfx0/A6tBq3M495DHgNvd/9qBhe
	DtlzHbzE5HEeZSM19P5iHnxV2bhcgPQRRrHwpQkfqa4+mcErGtsoPoJvnDXZF3//1lQIdpn2k91
	bUk5oTB6h+Sr5LRz6GBPbVvT/GZJLUJE12+3r/FQiKIbidVnfdUKW40G4J5/HJwiGixRjn0KIH+
	63Vyxkfi9ZqIFADzmHODkug1aADHGdKf9X8nDJYwbRQd/96n4iqyT7Q=
X-Google-Smtp-Source: AGHT+IGZ3N+kY02h1wIak+gBqbJaa+gpVr6uo4aUlKJT3x7EaQ/2I7u1jOu0/8aGMau+q+PMMuwGiA==
X-Received: by 2002:a05:6a00:1798:b0:730:8e97:bd74 with SMTP id d2e1a72fcca58-7308e97c379mr8317065b3a.2.1739228236978;
        Mon, 10 Feb 2025 14:57:16 -0800 (PST)
Received: from localhost (222.246.125.34.bc.googleusercontent.com. [34.125.246.222])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-730840e842bsm3436416b3a.88.2025.02.10.14.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 14:57:16 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v3 1/2] dt-bindings: usb: Add binding for ChromeOS Pogo pin keyboard connector
Date: Mon, 10 Feb 2025 14:57:11 -0800
Message-ID: <20250210225714.1073618-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250210225714.1073618-1-swboyd@chromium.org>
References: <20250210225714.1073618-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the set of pins used to connect the detachable keyboard on
detachable ChromeOS devices. The set of pins is called the "pogo pins".
It's basically USB 2.0 with an extra pin for base detection. We expect
to find a keyboard on the other side of this connector with a specific
vid/pid, so describe that as a child device at the port of the usb
device connected upstream.

Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../usb/google,usb-pogo-keyboard.yaml         | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml

diff --git a/Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml b/Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml
new file mode 100644
index 000000000000..e1b3b2c1711e
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/google,usb-pogo-keyboard.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google USB Pogo Pin Keyboard
+
+maintainers:
+  - Stephen Boyd <swboyd@chromium.org>
+
+description:
+  ChromeOS devices with a detachable keyboard have a set of five pogo pins that
+  are the typical four pins for USB (D+/D-, VBUS, GND) and an extra pin for
+  base detection. The detachable keyboard is a USB device that connects to the
+  four USB pogo pins.
+
+properties:
+  compatible:
+    const: google,usb-pogo-keyboard
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Connection to USB2 port providing USB HS signals
+    required:
+      - endpoint
+
+patternProperties:
+  "^keyboard@[0-9a-f]{1,2}$":
+    description: The detachable keyboard
+    type: object
+    $ref: /schemas/usb/usb-device.yaml
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    connector {
+      compatible = "google,usb-pogo-keyboard";
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      keyboard@2 {
+        compatible = "usb18d1,504c";
+        reg = <2>;
+      };
+
+      port {
+        pogo_connector_in: endpoint {
+          remote-endpoint = <&usb_hub_dsp3_hs>;
+        };
+      };
+    };
+
+...
-- 
https://chromeos.dev

