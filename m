Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAED25D1F5
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455099; cv=none; b=njrFJpPoKlbH8lYHZ/0erJu9gh3WUQNkh5LOq/OSSwr0ZmBgXQPy22p6kp/72stPCSSBrN7eXGKbgDC3oQ81A5cRWoP4FDVUMD8ElH/V5hsY/3+G6eVvThDSz22CrO8exluF69wu7bwioiHWaxIaxLNxkA15dX1F20SHwgetgq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455099; c=relaxed/simple;
	bh=13t0G+6cETyYOm4qxRCTFv0cuGZG4Jm1bu/20N6Ac+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uw0K3/1825Om1OZ4Ke3YPf0NKoVzc6DQSuHO6RwXMNtcVHO2+m95/ZQEysvjxSGJ0flJD4VODTfsJdbCqCGFMm7gmpe6YjzQ2nh4zt2F9kWEzURIS98Lvuda6nuH3dTF3bj8zGN8CMUBZ8RBrZe3jscJ79S1i4zKi5rkjRxUTuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fZdBaito; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fZdBaito"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224171d6826so65636425ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 07:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746455097; x=1747059897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Hs+DElq3FESieGx8paocjJpcUpxIsb2z1UnlatNE9M=;
        b=fZdBaito5ZE0zv/8IrdLhmPZWmh4p6y6s6G5fKCMqudwzmsmHozYPX+PeIHD6tdE6t
         U+OLFX1qgUX6a6brWpnV3twt5jrGK7GkGj1ovuGzv5sOfT1Rbyk4DVyS5h6RA2ZYVzm0
         87QpMfG7tM+Foo1g+QV2NScD++GuHtaFbOj/Zs5YXJxUVzC2zvTEEtgdzVd53bwOx0Zg
         CTeoEd310lHzRX5OXgaAmNLvKCf3k7QohYoDyxLwo9Ab9ZFR2JDnaLcPvg2iMclluZGJ
         GaJVeGxWkcQs/uyd9Qx2VXZk43moQRFcue1qsZf0/en2iPXMFgvbs8ljNACWzWJWCOKO
         Lxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455097; x=1747059897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Hs+DElq3FESieGx8paocjJpcUpxIsb2z1UnlatNE9M=;
        b=HYi0yvKp6Mqkm+Q59ON2jLTmER5V7lcmrGX91ZgoTn3vvQl1l+NrV0a8sappo1KopP
         kJLhVlJnFpdtgEcm8qiVm5NPlCYEArkjiNZfN7c8VApItb05TnGEWnvD9W5c+Le1r2Jn
         UNOnnLiI4NoUSPNynCH63d3eqvB+qYc6FtcybT4l3qomVZ2wc0NmH5EHYFqsotUNH27V
         qXW71T8WqwfAYjrI0ser3bvSlWDUhoA/9Xghdac67tDjicXWkaNw9yzQHDdIYNQqhBbP
         TpgW48iKTeMox78BJoHscIVl5ccpgRLQTEJ45sj3wCUHFd1KI9yzwU+X9B/WtvX8Lxee
         3drg==
X-Forwarded-Encrypted: i=1; AJvYcCWhLjEaDF0Va9sI6JjP8ib1Z2sR84eqIuRc29G//56udlJVVJqg3dq2BE9gTB1kyaifFFioJFkYuEaaro4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywor705k/5GF6F9p9CIdhQ4Ur7FnxXRLRPXJkJX7ZayK8LpOrqN
	WTUqXWiN4b753TkaRmdBGYQGkMXYa6bjiisy2y+oDq8olmYGAof5HE3PH5MtFQ==
X-Gm-Gg: ASbGncubmGPunfC//QTKAbD64TKoRsEif7j1fQ6n2mQRviSLlhRANVNPh+Uj0mxxLDU
	XQi7fy/rAntHcRn3Uh9J2/r3vAMHUoBW8XQERdbfsDfSq8duura8Ae5k6aYG8NJycG/NlyZ3WqK
	trT6DH8FtJzkAy+4y0Acx6ckPucuoftVOVuIf6hRCFvLAaAhypW9H6Yk/OrIQA83naj0PIWFMf7
	FSiXFTRWpVYlXPJfrL3kKHKxntuntOtYfuUNgSzirHiunH3m1JkVQQq4gIAE/Bh8c8ix2WazLTV
	Er5Oomf08unTuiVMKCmLPnbWB0Ozd7/hisfcZJAqw8+l+4Xd+hwFXpY=
X-Google-Smtp-Source: AGHT+IHdWlxDvs8371dw8iIibUZwg5NFmTvGoIMCtT/qDinJycePFjkAEDaFHMsXbrbdZE+ta8ZWwg==
X-Received: by 2002:a17:903:240a:b0:227:e6fe:2908 with SMTP id d9443c01a7336-22e1eab75b9mr140043085ad.48.1746455096656;
        Mon, 05 May 2025 07:24:56 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.48.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522ef9bsm55387685ad.217.2025.05.05.07.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:24:56 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 05 May 2025 19:54:40 +0530
Subject: [PATCH v4 2/4] PCI: dwc: Pass DWC PCIe mode to
 dwc_pcie_debugfs_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-pcie-ptm-v4-2-02d26d51400b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3666;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=13t0G+6cETyYOm4qxRCTFv0cuGZG4Jm1bu/20N6Ac+E=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoGMouk6oLnFeqy0OQNd3RGK527cJPG1+NToMXz
 Nw1faIeRGGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBjKLgAKCRBVnxHm/pHO
 9TsyB/0Y0hs92h1l3TemgX/ALjp3uixaxiHo5J3xkUj9aEpT74QCx/xXHB0LxjXAQ4QHCnR2QFR
 nR04c/yfN7917XxUiIfwi7Wsxw07tpbyc/oaU8uITSeLGX1pwT/QPPqD5G0LNPvJMRN98hV5f0G
 BnpLrxV7N6nxMszSXZxYe2LNel2nzjXxrXLiXFpn94tZmlK/mjeilYsSY007nOBqwWgQch6nBrQ
 DwbjQznAqSMxuKZhFTkwjuZ4Ya+8+NtdjhRZ8OQboO5WiJBF1hNvh/nRLbAPaXWvq35YAATUpY5
 7YsCnKWwlHgy3+3xTBC0b76Tg6MiZqGrbUiuVywfQQ/D9KtV
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Upcoming PTM debugfs interface relies on the DWC PCIe mode to expose the
relevat debugfs attributes to userspace. So pass the mode to
dwc_pcie_debugfs_init() API from host and ep drivers and save it in
'struct dw_pcie::mode'.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-debugfs.c | 4 +++-
 drivers/pci/controller/dwc/pcie-designware-ep.c      | 2 +-
 drivers/pci/controller/dwc/pcie-designware-host.c    | 2 +-
 drivers/pci/controller/dwc/pcie-designware.h         | 6 ++++--
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-debugfs.c b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
index 9e6f4d00f26298077c976c9e74d8616544f20ddb..896c387450ca45d979f6baa04e6b3ae3e4be167e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-debugfs.c
+++ b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
@@ -651,7 +651,7 @@ void dwc_pcie_debugfs_deinit(struct dw_pcie *pci)
 	debugfs_remove_recursive(pci->debugfs->debug_dir);
 }
 
-void dwc_pcie_debugfs_init(struct dw_pcie *pci)
+void dwc_pcie_debugfs_init(struct dw_pcie *pci, enum dw_pcie_device_mode mode)
 {
 	char dirname[DWC_DEBUGFS_BUF_MAX];
 	struct device *dev = pci->dev;
@@ -674,4 +674,6 @@ void dwc_pcie_debugfs_init(struct dw_pcie *pci)
 			err);
 
 	dwc_pcie_ltssm_debugfs_init(pci, dir);
+
+	pci->mode = mode;
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 1a0bf9341542eabc4d28070e3a2d6a8b0b444578..6ee14694372c70783c83c2c7483310f4cbfda078 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -1013,7 +1013,7 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 
 	dw_pcie_ep_init_non_sticky_registers(pci);
 
-	dwc_pcie_debugfs_init(pci);
+	dwc_pcie_debugfs_init(pci, DW_PCIE_EP_TYPE);
 
 	return 0;
 
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ecc33f6789e32cd022a5e5fb487bdec5d7759880..17c78a3346512bef8319af2ff7b8c412d41394a5 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -567,7 +567,7 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (pp->ops->post_init)
 		pp->ops->post_init(pp);
 
-	dwc_pcie_debugfs_init(pci);
+	dwc_pcie_debugfs_init(pci, DW_PCIE_RC_TYPE);
 
 	return 0;
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 56aafdbcdacaff6b738800fb03ae60eb13c9a0f2..7f58c94b5b1e9a590692474d5efa80c5b5ed9b8d 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -503,6 +503,7 @@ struct dw_pcie {
 	struct gpio_desc		*pe_rst;
 	bool			suspended;
 	struct debugfs_info	*debugfs;
+	enum			dw_pcie_device_mode mode;
 
 	/*
 	 * If iATU input addresses are offset from CPU physical addresses,
@@ -871,10 +872,11 @@ dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
 #endif
 
 #ifdef CONFIG_PCIE_DW_DEBUGFS
-void dwc_pcie_debugfs_init(struct dw_pcie *pci);
+void dwc_pcie_debugfs_init(struct dw_pcie *pci, enum dw_pcie_device_mode mode);
 void dwc_pcie_debugfs_deinit(struct dw_pcie *pci);
 #else
-static inline void dwc_pcie_debugfs_init(struct dw_pcie *pci)
+static inline void dwc_pcie_debugfs_init(struct dw_pcie *pci,
+					 enum dw_pcie_device_mode mode)
 {
 }
 static inline void dwc_pcie_debugfs_deinit(struct dw_pcie *pci)

-- 
2.43.0

