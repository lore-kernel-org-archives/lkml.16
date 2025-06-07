Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5D6215798;
	Sat,  7 Jun 2025 21:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331622; cv=none; b=tMwwLf8XjJwbumNBvMjxb9Wkin4SQ4x5Ko9HwftX+sHOFUYY1jqCvCafrPlruCWDnxhR9uizes7c8Kw21/ol1aLgWyCPoztV/NQxJQHhKpx788xDGsosxyeo5rMXZfc/FNcus/42GAMOaIQCCE11XUGlUpRtpTLsuWfKiHZ9JW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331622; c=relaxed/simple;
	bh=b9NTx/ATj7AXsPDJCiQzFwh0z4NM2fAsL/XCglLIoXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uUPLEeTHDjxFQdMGKxiJdWc11VQEukgG7T+OJkMq9Gv6mBAFwxb+gG/+sgvmocDPxqaN/FnmgoQThoWtfBZHsuth7XzFBt83gRFyMTjoWCLFusO33Wezw+CHIFd+o/otS9Oa3vOgBfbjXhT1LEo0REWRs/gU83i9MHuWOuZyW1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuzVaGVI; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuzVaGVI"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so2690551f8f.1;
        Sat, 07 Jun 2025 14:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749331618; x=1749936418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uo+GHVNUMjHl5xOP3DmRfwDetTLjdpZTJHLuvm2IZ/8=;
        b=GuzVaGVI5h011cy7pFRlwNhoSlp2kKXCTPh++xdD69MDrcUbjJ2FtVtRjXBnCLiPQ1
         Ntt7f1HhBtXA2+FBzBo+dN2VC4lvTD1F0dk9vCfw499v8RpcJvXRi95HF/Q2q7HmUqS5
         w4I+QdSmuaGQYMC6Fz66HLMBDjDes6rcEb8ewQkowAWIknyEDO8d9w0Y3D0PAFPLlkjl
         2EMLzvtINmQH8n86Plf4qETdasmFJS362HvJlEhlfPVraS3sc7ddFAOsqm0nG2WrLgcN
         y0ssVx8eqgJLX1YaUXGgPhABWkC9D1atwRf+H4w2MMhM6KrMzzXo0sfkfNtDzwPEbfTJ
         07Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749331618; x=1749936418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uo+GHVNUMjHl5xOP3DmRfwDetTLjdpZTJHLuvm2IZ/8=;
        b=frAK9avK/6uCJ/SgQQ04HyNyWhuxvQAJoX8wrRtyHde44g2k3Tb9pEsCLtsljF9d4O
         OtkxzltuXxns15RXKmTlrDKTnZeiCxd+t+sc4ZmiC+u71ntCZZMXEi5v7PEgwG2pa1oT
         mD6llPvot+ndf5WGXhB9SuQzbXBvPYUHeVdjvR9OBUOmCLs8hxMLTJYMBkxa2jFt+seX
         OO1APekXrCvFo6JCwRefbZJ5DcDqILrKNoaChgJCtK0U4kVlhJfNln/E7Mr4sDNcSUMr
         5Axx92NyH+I6U56glxoETSjd3cpJ5oeNep30MLz+h6PK+NOP1frEEakwGDtjIxenxNrk
         aAmw==
X-Forwarded-Encrypted: i=1; AJvYcCVNM7SI1La5P1FEymBgo86p9yPsu8hgODik4nd94/P4V0zIShJYIFdqnCXFJwLVvtd86jXQ8xOnw3yv7sah@vger.kernel.org, AJvYcCXbbX+QWWuh3qUulbinn+hZGpr9SnVFWREdHSSv3dreTooLwrUi2PooBfQ+yx0eVmDPaNxtf+Mh9VCc@vger.kernel.org
X-Gm-Message-State: AOJu0YwyWPzb/8YvP5SdCVK16q4esGIz/QupnJTB4qhI70Pz8PrJxqEh
	s6zt/AKa75WwLVjSw2QO1JQgNOgmatTLAoJ5F6f0WqN1HwtTGcXibdw=
X-Gm-Gg: ASbGnctsP8UMoNgKZgPvekbjvGmYDT2nS8uS1JqtS6cGoz9PVlmeL4W+oV7a9SV+UiI
	LCMB7IyoOU1sgWfJXxSGb6oU90rTZyeBODR/YvSIxZUjNWyZevjWPZ4rjZrNkHdizYqLP7KbYEF
	CFVel2xDZlf9FsS9cljLqQVsiDjg6Sbi323/UOEyvIrLiNCQOMeE8Q+b7CRgfQOlzDG1lETwZCl
	yFbIlrMb9V/ljATjpt3o/W092UCHoue8VfHb/iTQtU2Mk9rAqB9u2C4LktD83loCj6P4JPK0sDA
	Lk7am4QmsxjjtLSdtaYPAORQ1lgm7pwOFSygifkT0Bj2BCGeO3kdiGRdFRzCZ61I9wBM
X-Google-Smtp-Source: AGHT+IHdswCCo+KNyzZ2CYfgRR38iEgyauXa3Hr6i/ShbuQZGLUphuMfY19wibMEZubNofZ+FlxT/Q==
X-Received: by 2002:a05:6000:2512:b0:3a5:2ef8:3505 with SMTP id ffacd0b85a97d-3a531caf96emr6395082f8f.37.1749331618349;
        Sat, 07 Jun 2025 14:26:58 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244fd02sm5449632f8f.75.2025.06.07.14.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 14:26:58 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jens.glathe@oldschoolsolutions.biz,
	konrad.dybcio@oss.qualcomm.com
Subject: [RFC PATCH v1 1/2] regulator: Add dummy regulator consumer binding
Date: Sat,  7 Jun 2025 23:25:38 +0200
Message-ID: <20250607212654.126412-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250607212654.126412-1-alex.vinarskis@gmail.com>
References: <20250607212654.126412-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the devicetree binding for the upcoming driver.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 .../bindings/regulator/dummy-consumer.yaml    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/dummy-consumer.yaml

diff --git a/Documentation/devicetree/bindings/regulator/dummy-consumer.yaml b/Documentation/devicetree/bindings/regulator/dummy-consumer.yaml
new file mode 100644
index 000000000000..efe8cccab080
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/dummy-consumer.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/dummy-consumer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dummy regulator consumer
+
+maintainers:
+  - Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
+
+description: |
+  Simple dummy regulator consumer node for devices which are not/cannot be
+  described in the devicetree, and do not need to be powered on during
+  suspend. A power-friendly alternative to leaving regulator without
+  consumer with 'regulator-always-on' property.
+
+properties:
+  compatible:
+    enum:
+      - regulator-dummy-consumer
+
+  vdd-supply:
+    description: Regulator to control
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    integrated-usb-camera {
+      compatible = "regulator-dummy-consumer";
+
+      vdd-supply = <&vdd>;
+    };
-- 
2.45.2

