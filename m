Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AF2262FFC
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 22:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746829711; cv=none; b=jwyQ+wHjn4FlmqNFiAP7JTd/Op+zo3mGbCzLk1C0mIWGi1M+gqw7eVOkDhVUL9+VpS37ekNvGKDpYdvvtIC0dbZ0IHfy3IEV3Fy7SP/GLrgwJprNUl8bmU36cP/raFQK4QK9ZSK7nqiEI4whEXLuZVmNHCOuI74aor5uns8Pl6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746829711; c=relaxed/simple;
	bh=IspuMfhbuI0NskZWSzhFkzpIeIBkgsFFHVt3aA4o/AE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3vKUUvjP7dTt8jYtWs66pRG9gmsx78+noBkV1m++LzCRGxuOD/E4Rx1f2TzSJL+G68SEupq7BQuUbhPvQKdZmx7yTQgegLV2ZnohamagYJDq6Tj40FnNzjZGN9v/V8AyoADbs/tGBObVkxCxjch9z4MgQZuXtJNBbk9Vf7ouKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Bgib0VxV; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Bgib0VxV"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22fb6eda241so23437245ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 15:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1746829709; x=1747434509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6p7ER/Q3/oiPZqhTroZ/8PyX/B+RWKmVdqYgvMtMSKg=;
        b=Bgib0VxV3AXetknfdkpckzMA4S5mMP7k1r/7Cdz8V1/pRaO9rTtj6jpY4LFkpjEqgp
         /jPByBoc0nWmBrOzclixKTfqiUBS+KIKgwFh7tr38kE4OIX1jVhv7IdVpkcJF9OvUuaX
         ByL6o7Uifmiy/A9SgJ3hivaUAvNe7HVeoJY7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746829709; x=1747434509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6p7ER/Q3/oiPZqhTroZ/8PyX/B+RWKmVdqYgvMtMSKg=;
        b=g/YSqpDqrbrn6ege9yyFqVXy2R2u6Dw3phW7lMd/+4+oBsrv/p3SvmmiCaFIFSgKQj
         iP025jh+r1y1P4XfWAhbV9wf27AkaaehLCdh9M0PtsbLTPr/7Rk0L75AsqtSI4kJWau6
         NXQvaan9VqVG38vPaaRT6MD3kRG/xCjgmhSAMs5Hy/0n2hL2OBcz9z6E6J9g10VbXH4K
         QD9lhczPSzWXUxi9QIzyK51iP995oIKp1qyqti3qGPF4BzR4wyLCHRi1wCk6bne5QMjh
         Bk2XTFyPijFDymV+BLTLQoGB/ZnwB5QAhDSMQQ9iwQF0z/OJ/wnd6ISfcpXUpkcb2VKD
         0F4g==
X-Forwarded-Encrypted: i=1; AJvYcCXlRBuchql9gZM32nDKFbrPxjArIVXRVpKcWkmtuh8ob6J167wLTi8TawTyGyQ//GjlAc8DpAK5GEblP8w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4j8JRKf8GM/nbdtf1wkmfrTpa7au1MoyaLUTwedVqliKPwsuL
	Q6WlP1TJhDpHqiuA+Lw39Rp5i5bBYu+CM5DD3nCsZxvZQm8xlWKnE5GuPqvuDw==
X-Gm-Gg: ASbGnctiU42ZJijVBEn7Ja12U7Utn4axIBGy7q0GQQVYz4bdUP7oEoRlHtxwSg2fT1V
	HLatbF5m5q0r1HopRkBVMRs7g1d5u2VMNz9AnCt40SlfAU4SbEJfWdJjSf5Gp2l0WvpN8SBhE8E
	THnjPSpg+OtbTb5IbyW7C3W50Ctlnfp7gID+ucYpV4jeo4hPsrWA2bbxG4r/Wzh10RyPhex808I
	S94elcWQ0yr66693ESIm2HinpJYj5YPOG4UNduD7KaSMIU/lup+QPVC0LytZeMfcy+MbQEj/w9+
	cqlDVNF2+JIY4xtIZKWFOAWX1PfUR/xzsMYVleWfDET2Oqqn9Ig04COPc2BJyLic6iAaLQWp664
	FMToit789tDyEl0fyBkXnk883lgw5zfo=
X-Google-Smtp-Source: AGHT+IGfUwOQRvWOeCWpbpI7bjN2yUkoA+0vs2CH6hB56pZLb+zEdsUnC3KckTOyfdQuyia/7g01Hw==
X-Received: by 2002:a17:902:e747:b0:224:a96:e39 with SMTP id d9443c01a7336-22fc8b3e2efmr67480325ad.9.1746829708752;
        Fri, 09 May 2025 15:28:28 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544fadsm22584465ad.24.2025.05.09.15.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:28:28 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] dt-bindings: PCI: brcm,stb-pcie: Add num-lanes property
Date: Fri,  9 May 2025 18:28:12 -0400
Message-ID: <20250509222815.7082-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509222815.7082-1-james.quinlan@broadcom.com>
References: <20250509222815.7082-1-james.quinlan@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add optional num-lanes property Broadcom STB PCIe host controllers.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
index 29f0e1eb5096..f31d654ac3a0 100644
--- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
@@ -107,6 +107,8 @@ properties:
       - const: bridge
       - const: swinit
 
+  num-lanes: true
+
 required:
   - compatible
   - reg
-- 
2.43.0

