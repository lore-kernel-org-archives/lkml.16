Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F2C2BDC35
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579605; cv=none; b=A2uiFGRKv2KFhDjSMogw00GdKFzpFbq+rcGrpKF8qtgYfYOL2b+Mx9CUb87cXa1kMmbKjVe9ELIYcIGrcJwQIhQ/YAXHX7WaUdk89yb3y/kwDGFSLZuPW1U+9Is8qOfeqsztvT89ws60ZK4hLn2CZgdpkaB0gYmZxHRrrB03fps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579605; c=relaxed/simple;
	bh=7vPWxC3i0T1lMmsOVAXtGjJ/XmqPhC1ujaQsBuT5zmA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZDTshA7XuWu60W/7sATaM707jiG0Qe1I8phP+NxGGd+PduldrLP1bJgQ62v1N1vbVo00IcAjqz3bHphRscX1ACBTiEWCsO0UeZG/WmVU5a3bfbQeqtp71KtRcyx8mjXU7vM4mETN7nbqGJBdO7lEeBxj3NTnxj7G4mzkxtWf1CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=iO6YMO/V; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="iO6YMO/V"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235f9ea8d08so4235765ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 14:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751579603; x=1752184403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wgwhd4uxfgsiFGznM9R+p5/1NcCXs+lUXw56p7CBPbs=;
        b=iO6YMO/VpXHtTIJQJKElUl5DZtymEdqWQADOU+DKNNaY22/RAe65NP4yVzvfKjtMPL
         3N7Y8dBMKTh+hOWn30hNWyclmtGnfbrPptDWzPAPTqao90BA6f6hqMT1SHvvWdmDGJQs
         iaMNEqYtPp6QkiG115T4GZ/qQDXwbNkqh4M58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579603; x=1752184403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wgwhd4uxfgsiFGznM9R+p5/1NcCXs+lUXw56p7CBPbs=;
        b=YDOoEhwZQYlkEqJDHRAYTqI9IxuK1RBdL2gyM7F+OpKSoKtvrX4s7uwksb2Qtq1dHw
         QPfvZlHG5hBUQiirPfr5dEya7vHTeIqFKiRLwJ3q5VY0cC25ZpjmTDVcHIUmBNIQeNQx
         KCDE6p+etFaFL5ZB1EW0aFAyYMbD0HN7G7PvhnhW71unQOLsXGevtB47LbdLxMhfunYO
         9pV+0I8j0JLWe4oB7qHMmMVKUERelQrWfrlEN8Q7xUL7WAMMNfNnN0BtUL5sV32o3uv2
         NQbXFKBaGpqSs/XL5+hCvbA4WBfMbk3syWNi5OV1yFs2UYrtpz669ov24HBJNqrQ+j8U
         qtzg==
X-Forwarded-Encrypted: i=1; AJvYcCXXBJ08J9wfkoWvOOl9ZALcxI86vAzhCGOW07S6MojRZLoABw6joF5NsGzh9UZZCe36usUpDMAKx5W6Byg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf+JGR8vqbYWNhdm0JpXhlS/kXdZyDCzDqAXNs2XJp8z6Em6UJ
	qMmyfumAg9H+JgkfHZwiYgpFLgqLLHvnyuEo3o4GqdDT9JdyrPk6nKgLntwNdyXyxA==
X-Gm-Gg: ASbGncvLnq5mZ/V4peJpgzopCuJQQhf2KIbVXJGAzQwG5b3LWRt8ZXOztODQ+5jB01k
	BXCCxtfz2zfuA6XP51Jjkf3Plv7wdBN7xvlUtXVub/2jok5BYdFxos4Aol+lTsCr4hVD0RJmBA2
	uw7DfHZ0iDIhBIddS2gtXpaYUNfjz7zGp0uljvqJzl947uR56oQi025stz3IW1smFJ+iDYDXirQ
	s3ptitmXQQ8iUXaj2jctCNhMEbzhEMRQBm6ZNDJIIGUi7uY8ZOtkxbx84MQ/jzsv0lQdl0F8LY9
	HYMmJFhFV5woqvzp8MowEFXXuKE0Drn4Cd5Pd1sP50cSJsEdpa13LzXbGVxrSUZhnC9Ne/IW1+6
	eVFE5uiUXabosNv8cklI3d4c5a+0jXbNvbIaLeQCtfg==
X-Google-Smtp-Source: AGHT+IHxUkT3T1XrdvXj6lsZasXIIR1QuejltuaVBvB0AUtVnJ6flgqLggHU2VFll3S8pZy4clu9dA==
X-Received: by 2002:a17:903:2d2:b0:235:2e0:ab8 with SMTP id d9443c01a7336-23c8606721cmr3661665ad.6.1751579603171;
        Thu, 03 Jul 2025 14:53:23 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8459b3a0sm4249645ad.219.2025.07.03.14.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:53:22 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] dt-bindings: PCI: brcm,stb-pcie: Add 74110 SoC
Date: Thu,  3 Jul 2025 17:53:11 -0400
Message-Id: <20250703215314.3971473-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703215314.3971473-1-james.quinlan@broadcom.com>
References: <20250703215314.3971473-1-james.quinlan@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds BCM74110, a Broadcom SetTop box ARM64 based SoC.  Its
inbound window may be set to any size, unlike previous STB
SoCs whose inbound window size must be a power of two.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
index 5a7b0ed9464d..36bebc290b42 100644
--- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
@@ -27,6 +27,7 @@ properties:
           - brcm,bcm7445-pcie # Broadcom 7445 Arm
           - brcm,bcm7712-pcie # Broadcom STB sibling of Rpi 5
           - brcm,bcm33940-pcie # Broadcom DOCSIS 4.0 CM w/ 64b ARM
+          - brcm,bcm74110-pcie # Broadcom STB, Arm64
 
   reg:
     maxItems: 1
-- 
2.34.1

