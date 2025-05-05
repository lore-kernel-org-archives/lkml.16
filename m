Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9458025E457
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455105; cv=none; b=Hew6l+t2KpThb39gBcZMBx9qmxPve7dSI2VuJeruGld1G+Pma/PBThbbe1KiYz0kcGNHb6bHv7U4GvjmadXcs15JVOD7abu3NskOxAGTtKbxAjwQrAvCG5aoH43G2OPAmwgf5OBWXXtadTkPskD2U6u96kdce4jZpyTdzoMtjUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455105; c=relaxed/simple;
	bh=t1yw/3IQY04ascExMYNkywVMbYb9sD04RFjXDUub5p0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sB+Svqzls7MRXphHRQMU1iJMhzn9yFSnjIY9DZp8k+H9I21j2ifBhiIyP71d6u/shiyo8W8GZRbPsntyKGYs6fi7dxkKsXJNws2uLDPTaLn7TajRM0CEFszuleSPhWAghPQWWRnjZqHIq3ck5zlAZp7i9YRD4ykCE8I3NfgN1Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lqOJlwZF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lqOJlwZF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2240b4de12bso71847905ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 07:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746455103; x=1747059903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJu9k3uxYD0x67A2WlM7JrSR4XKb1B7H+/wMYgcPKG4=;
        b=lqOJlwZFB4pyJdaENDCtdFBlPFUBhccAA5O3mEykyE+6exnXMm9nsy8zGhjsZeksDX
         mYZwk2zMLwSydKEM2koeXulFFpwW7Dp88UmfB9cqU8fruhDtURG5ayLBvtWN6FK/H+s5
         mvZBuwkADtTJEtgLrsMfrDP/3dUleV6SzAQsy3br9mL8Fr++AZMqrFvVTm4Wfk4Pcd8X
         Qv2oTVsdxEjj1odzrqZ8Oqov9M4mC8VoyVjh7IdI/4g3FXo9e4MDgRrHYZjDUHPsF5FT
         YtB5KMO9WKgv0YoIWf2AA26ppXHB3qXL14/S+o/mauBPvD+g4tj5eRfJuWp6labvP0M0
         MREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455103; x=1747059903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJu9k3uxYD0x67A2WlM7JrSR4XKb1B7H+/wMYgcPKG4=;
        b=s4G72rU9FBQx2uHMnMNafPrcY52aR/KuOtgp/cqLxCgNUvQBSQLSutRn4084YYLBHB
         sxljCew9vlTVv8rR1hCktAjXGnlTe86M5FgLh3SuBca6TnGokGd4i7Q/rEdAfFxkdWPH
         5j38/42XhDSmTCC9BWGmJiGVWcNmMDWbkFjtggo9Qg7JFW8arE38dhKqV/wNQxDUJ+vk
         j2h26EySMyJwERwtjZPctpX1+rdqLyaq+4xb87/cAGyhLkK/o0Ql2g1GnquCCYlL2cm1
         pzmLBfeZEOMJMt5bduv4SoM0cU1BajLcPW+F+zWcE8e2Qy0rB2ZuI2HM/z3TN3i4uePt
         O4aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUal057c/Ie+fqYl9hhq3naz/9e3zaQQPyyyPOapU7NNBTabYxKRoSXYCUmXN9poW7GBHk/S+JbVD6rOxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgucWXtOA8YwJQWNVDGv623lKltl6cZQL9vuNcza9nk1oh7PI7
	fmOOjJTzhOk6HQJPcwPlZujMGxbVp9OCDJGw3p25vubwRDDAxObHbhKr0hjoRQ==
X-Gm-Gg: ASbGnctg2gvvT2CTxCNZdJC/6bagWIGVKOjizkj1VOGrooHBpIoG+06kOxrLlUSTdem
	twMxTnW+8zhcnCyIW/rLNb6j9feqfJVv/ewesH03e+Ea1xL9DDAAUvt9yU6szyZxyz0yr/4Kt4L
	/E2wJbiq0ZVj8l/ujUJFT1T/HDOQPtJkz/s2C5+I0BRcy6YtO+zLjs41NRchzeDqgcoavYLhGWE
	gKPLKEBp/yApvMCWOXkQgAVfDHu2733hy3dZGDQ25sE7WDHvwqcpAyVr1bi2PM+GS86f8RT2mcp
	PqWLf7+/ZPJtleruqEDGnbELE/kZHcgmOykp13iSMQYGtWPb1Fn8F63b6lcAB/qwgQ==
X-Google-Smtp-Source: AGHT+IHi6sUziup5Imivht3p4tfdKqc+3GPIBmuTJE3Jz7QA5nq01wCiYdj4NgLJULo/fXuYkwcppA==
X-Received: by 2002:a17:903:1107:b0:223:f928:4553 with SMTP id d9443c01a7336-22e1eaa6e3cmr115148915ad.44.1746455102947;
        Mon, 05 May 2025 07:25:02 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.48.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522ef9bsm55387685ad.217.2025.05.05.07.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:25:02 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 05 May 2025 19:54:42 +0530
Subject: [PATCH v4 4/4] PCI: qcom-ep: Mask PTM_UPDATING interrupt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-pcie-ptm-v4-4-02d26d51400b@linaro.org>
References: <20250505-pcie-ptm-v4-0-02d26d51400b@linaro.org>
In-Reply-To: <20250505-pcie-ptm-v4-0-02d26d51400b@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=t1yw/3IQY04ascExMYNkywVMbYb9sD04RFjXDUub5p0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoGMov0gqEE7Kdc466OsqO1FiN0DTGyfPvqdn2m
 eVdjnTOicSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBjKLwAKCRBVnxHm/pHO
 9dpkB/wKb8ndaeMSQkmTCkcOVpoz3jJsGF8LuXs4yeyrPnDlww16eE499nmvu+4SiBNyL4SHr3j
 VMfK69x/QiEpne1DT1W9KjiPfN8Deb5gYYv9LFwhvrNwjkAr1nyv8HHHfTxsjfZ/7te0ernpcJb
 EuVh+5I/BreM1zaKazDTyLOPanx6E7qmZsdPgwoPiS/QBz5MunEzHhXP/N6NWhnI6V4lf5nsXHY
 ouqr6m+5m3JG9DPu54V2T/YwA5TP2c+X+dhd3xK7JNoqACJD5fwjFsFmT2wAiPwHJQfKiun2+7K
 mgldjpP1un+ujJTjpZjs0Pcj93z/jG6UaHvsNberfdccks45
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

When PTM is enabled, PTM_UPDATING interrupt will be fired for each PTM
context update, which will be once every 10ms in the case of auto context
update. Since the interrupt is not strictly needed for making use of PTM,
mask it to avoid the overhead of processing it.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 46b1c6d19974a5161c8567ece85750c7b0a270b4..9270429501ae1fbff7ece155af7c735216b61e1d 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -60,6 +60,7 @@
 #define PARF_DEVICE_TYPE			0x1000
 #define PARF_BDF_TO_SID_CFG			0x2c00
 #define PARF_INT_ALL_5_MASK			0x2dcc
+#define PARF_INT_ALL_3_MASK			0x2e18
 
 /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
 #define PARF_INT_ALL_LINK_DOWN			BIT(1)
@@ -132,6 +133,9 @@
 /* PARF_INT_ALL_5_MASK fields */
 #define PARF_INT_ALL_5_MHI_RAM_DATA_PARITY_ERR	BIT(0)
 
+/* PARF_INT_ALL_3_MASK fields */
+#define PARF_INT_ALL_3_PTM_UPDATING		BIT(4)
+
 /* ELBI registers */
 #define ELBI_SYS_STTS				0x08
 #define ELBI_CS2_ENABLE				0xa4
@@ -497,6 +501,10 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 		writel_relaxed(val, pcie_ep->parf + PARF_INT_ALL_5_MASK);
 	}
 
+	val = readl_relaxed(pcie_ep->parf + PARF_INT_ALL_3_MASK);
+	val &= ~PARF_INT_ALL_3_PTM_UPDATING;
+	writel_relaxed(val, pcie_ep->parf + PARF_INT_ALL_3_MASK);
+
 	ret = dw_pcie_ep_init_registers(&pcie_ep->pci.ep);
 	if (ret) {
 		dev_err(dev, "Failed to complete initialization: %d\n", ret);

-- 
2.43.0

