Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D72417D2;
	Sat,  3 May 2025 11:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746273168; cv=none; b=k9ZZ/FO5KxOdl/G23PEl1I2DjEstG953vq4NBTHPkw9c72RGWmDERtP9/VS1FJvlX+f1gtmuOuTx6kCpfi2mM8lBsQ0ky2xOOvEp2jkB2XcXPDmrj9KLcK4B6OAZFfY3h3F/+G0h7m4Mt/dQ78KerhDGFuS10PE0pEH1yk0v6bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746273168; c=relaxed/simple;
	bh=tyWqtL/rut5YPhdVN3q+GvWjCSJidX/06j4iYfBzgBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XbVEuoNvwC1dD9emW+AcmN0XW5+g5MYZD946oRNDMLF+v84FwlrNrq4e4g/jSIl4jlAinyn/fwGW6JNmD6XmdQDeeyw8eKQ5uDurF9ULuzC5jUk62WRWpneBXqbSwKhatgRq9CmpU3uN+JctTUoij+nk+ci/FtDUQZCPoQgDZi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhKNDZW4; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhKNDZW4"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b170c99aa49so1956211a12.1;
        Sat, 03 May 2025 04:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746273166; x=1746877966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYFsZT9R2VetUjXXmQTVLyqYCEKJfHUeK1FBA0cF88Y=;
        b=XhKNDZW4nzuqMbIRKVlHvla6E/g3R6LdFtD/u7aexs6YXcKw9o+QJP5hmF1jgHv0+i
         49EZl199eOA2BjseDv3hyKK3GNtU01LSldQ6ehRa8vkkZ/fLkAg5C5XlZR9lVOPO/FFZ
         mJgl71JlWljkVUHg4aWSE4balt5nWIxem937la0RR5OXdXL+xISTf/FLFzREG2yvCpTR
         COX8Dq4/Ko2o1Gh2eZvOSpAfRUZpDUEprB6sR+9qhbiVQBeQjR84CrWIxtAqSvaKvDpb
         j9F8qFi0Oq3f+Enh1Ng27pHtYLMN/YTIBze1QqvdNHuRYewt6ipJZ+sAhzJcb+WFU7o9
         Ewtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746273166; x=1746877966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYFsZT9R2VetUjXXmQTVLyqYCEKJfHUeK1FBA0cF88Y=;
        b=hAp6H6HQv7SfocT5+6PbpfRnG72DY5g2bw7QGOs9+4uxw5wAS592YjfvWnuiwMVA5l
         81/nDF9O+5onjHbNT1BZe0Ebd1DQklJPDZvD3cz7DOh55Axk8XWZX6S+hQHjjLE7YhE+
         4uTeV/AbpHa6G9iK/gxfy/1gMHR+SkHl5l1UNBGtrvg4b827GZyP6UhZ1oZyFDT9BTw9
         efNwE5uqA/zr9Oo5XbxeqBA0kYyj8LTyxKP+DZOW9QjnkkPkBBq7WQyeJTBSc4ebNfz5
         LlEJEiBfp4iFKmFhmhDGWp48uCTbj6Z0rSXAaDRF2dLlE4L6CdmERKUIOskjikSBunc/
         jG/A==
X-Forwarded-Encrypted: i=1; AJvYcCXaAW+cpvEiSv90yO4l8uqG+AtYelTxi7f4WvY2USYoSm24vk6B9v+yskgvZIXOm+u1xfnr7GsifYJG3+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKfPBIp1kTyl3WMyr/7OLuEpUNn4FdXLwJ6bsiWIHtIW3JwtnQ
	+ChWLbFxZ1QhYrNWMzw/Nt5rM/z5s7WMhwjpuM21+uVkYfDrLQTf
X-Gm-Gg: ASbGnctKAXWbhDfVBdMqcgTjjnDshrJJJdnLg1jssn9AyLo/kWx/NojUQuMMcQ5txpn
	zKjePPedwj37K6I7Hwx865orS3zfs0N8f26JFzZjQYMZ/4br3TnF0JT7Kkk/VwlKWCtSSlNDVMP
	6RaWrKOe7OAXuc1TO5Bh/lCfY2AJ8s+3zWEQB7FlbWxADB3a8fytXSQ1I+jCsZ3bJeX243gTjSE
	KddS/fHltkRgG2qZZlQ0QnmrB46n/E8w53TP2zkIpC1ijaII1cI81QfPbksVevbWrucCwQQeo53
	NmrzhQ0/yi0KYHJD4xGyS2zuc5PpbDO5NgPBdhyR0rtPJUYJpOES
X-Google-Smtp-Source: AGHT+IHzLqx/Mq4tjxRSZGRUqqxUAcZk4Rr55wtw7HQwhDfPrVgPnRa9BXlPqHPX1lZMyz81Ef7Dqg==
X-Received: by 2002:a17:90b:51c2:b0:2fe:994d:613b with SMTP id 98e67ed59e1d1-30a5aedd058mr4089145a91.35.1746273166217;
        Sat, 03 May 2025 04:52:46 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f9a0sm4879878a91.5.2025.05.03.04.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 04:52:45 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 03 May 2025 15:52:31 +0400
Subject: [PATCH v3 1/3] dt-bindings: hwinfo: Add VIA/WonderMedia SoC
 identification
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-wmt-soc-driver-v3-1-2daa9056fa10@gmail.com>
References: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
In-Reply-To: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746273161; l=1709;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=tyWqtL/rut5YPhdVN3q+GvWjCSJidX/06j4iYfBzgBw=;
 b=aBVAj3FRh3C/HeLG1KrEZgKHxNVznXy3dLXZzSekK/QXHKCFcyGSzx6Vc+6KcMmBIQVus65V8
 ASkpJiy/j07AVcBP9xhmuag+j68tcuVX/SD+BkOLAtnHPf0kKNjFANI
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VIA/WonderMedia SoC's have a chip ID register inside their system
configuration controller space, which can be used to identify
appropriate hardware quirks at runtime. Add binding for it.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../bindings/hwinfo/via,vt8500-scc-id.yaml         | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml b/Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b0f425a4a882be8537f9873fdaa4ddf49d3c825c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwinfo/via,vt8500-scc-id.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/WonderMedia SoC system configuration information
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+description:
+  The system configuration controller on VIA/WonderMedia SoC's contains a chip
+  identifier and revision used to differentiate between different hardware
+  versions of on-chip IP blocks having their own peculiarities which may or
+  may not be captured by their respective DT compatible strings
+
+properties:
+  compatible:
+    items:
+      - const: via,vt8500-scc-id
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    chipid@d8120000 {
+        compatible = "via,vt8500-scc-id";
+        reg = <0xd8120000 0x4>;
+    };

-- 
2.49.0

