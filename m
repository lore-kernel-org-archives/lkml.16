Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26A128B507
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 22:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748644847; cv=none; b=CEjttr+iHbcjhUvbJV2Emqqc08c1M1sLiGCnbhOHrMNVTSdWCuXNbfTdQzzQ/OAQzImdJr3eT5/3xSjCE6+8HyQxvhTc2qQcw4JttArVAcFCGV26xfQBtBeQmx5KkWz/O27ji0UBp3g4JulcTYEzRysiAEeJvVozQPF+5g+yKeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748644847; c=relaxed/simple;
	bh=Qf+Qmgh8tSH8l3tRCxJRHfcUpVw8PKgjOxu7KbxC3gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e9QBzCbRLLvIUURJzxtiHD8+55mo+Y4e8umiQ6RxbZLHrL0/Z3fPN27ieK0NvecIIozdA1/uDhMSXKpoUm97ZvWsDDl3nckcFQNGDzxWxs8ZvFwUyGVExW7Qv7nLrAMC61s03TGqploeR0HlcFJvIHPEf6VQTiPYVOI8A7QsLZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=G7+a6VQU; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="G7+a6VQU"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso2031103a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 15:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748644845; x=1749249645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJg1iKEfpql7pmZdjoA3uh10wUEns6L8IYOErZtWpmM=;
        b=G7+a6VQUw8Ui5tJtGA43josfZ4zltPHZ7x1d8NIO8ynruhDEIX0oQaj6YLRu2Ap8LO
         IBJr19O5UQ8MP9Fsv3qRplMnze8ozkK+QRyLO4IkmlAqdkICfR21J9dWFOdjV2EqIx6+
         7+RaC12cPKORYxTC84VUKK4yOppN7CHhQwtyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748644845; x=1749249645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJg1iKEfpql7pmZdjoA3uh10wUEns6L8IYOErZtWpmM=;
        b=hd3AGh8EHnWeFpmqzVYj3m4BdnjB+6YEQZlfiz16/IY0ZYtOeqq9D2C3x7Vxp1YU0d
         SlXiNC0v9dh4F+20BLZfi7wClq9Gw++Mnb7TfkYO10Ve8kVm71tdiT9KCQ4VqhAc7Sq5
         P+W+EboIqj3YFo0r/6NHWfcnct3Nh5jw+iPo0atZxz5jTyPqUICpz+S4alU0BPSkWlW5
         6rBDmA4/1cqGCjCTO2tff4BqISOHVGxPw5FjLuNL+gje3fQXGk/Vf1pfu7srzHBcvuoJ
         n2ChdjpEJL+u/QfqlSakSSF3BntB27aPY5d67o40AknrDFOVpo59BHpdHJPX4ud0HUpr
         n3Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUFbI5zmbAfdK0bcM5dQjYUjwf1nb+JhJPksp4Xn8c8HH185Ng1AxiuxTJ9uz78Zt+pA5wQwZpiLCiF8oI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5TG+jj3WuW3mNm6B9p61ZPZJNUZIDYc4ivdbiOzhZwabcIaVB
	R1ce/6jSdsu3KInHDoTil+h2864izNApxSA3qWlDu0raue8zFaFPwRmmlJUA4CaJ1Q==
X-Gm-Gg: ASbGnct+bBUXN06bv0KYYVq/KnAjc2nPXx78DbYKYE/Cm68faLjxqdphunrZKhj6bls
	T/CdJMJgI3wKiQfo3H0IFrLEyPrUmELJ6JdqdWN+Sj9dIKjdg3XFMF0vBD7oE2YYf1lagzTfWSj
	It6Jh9brJ0GehZHFSKBWq6Yp9oEN9eYtD9uF/Ih4iUkP6WG0Q8cyJoFawRpLDJtc9gDMqAcwFXl
	2Xn6XhUwAVEKO4xPTI2H5NlILc2ohcQ61KmJnAxoIj2sBJB3T65icnLVtNhe68CwKMIZWKGXEG0
	S0WUb0YOl6HGgDwRvZrt72ISaTTgzRrqs+k3RS63tV95U35s8yQkxzkOTb7DpjHca51A8nxCa9f
	TNtxshbgY3gh55tlcfAKJJd8TjP8lcD0=
X-Google-Smtp-Source: AGHT+IElfUcYdQ8CoYjYpd7MA+ZJeD62ouTASylM9JxPUzOpYGTly9yflZmPOUZsxhdConGhlD1Qxg==
X-Received: by 2002:a17:90b:5344:b0:301:9f62:a944 with SMTP id 98e67ed59e1d1-31241e9846dmr7600834a91.33.1748644845052;
        Fri, 30 May 2025 15:40:45 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf523esm33109385ad.170.2025.05.30.15.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:40:44 -0700 (PDT)
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
Date: Fri, 30 May 2025 18:40:32 -0400
Message-ID: <20250530224035.41886-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530224035.41886-1-james.quinlan@broadcom.com>
References: <20250530224035.41886-1-james.quinlan@broadcom.com>
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
 Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
index 29f0e1eb5096..cba227b19a5f 100644
--- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
@@ -107,6 +107,10 @@ properties:
       - const: bridge
       - const: swinit
 
+  num-lanes:
+    default: 1
+    maximum: 4
+
 required:
   - compatible
   - reg
-- 
2.43.0

