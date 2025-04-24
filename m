Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542C3280A4C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745510866; cv=none; b=BbUd+PEwTQisiuS+84EK/26OGfGMVvy/pQEuJW/MW4H6p508+APyXICQujG+Pz13wp0jbc2HjhKoLvti3oAvdqkRbsgHUhZnwWiDwZ3CtGymKayd4nOosuhvw+Rif9XOFf4yLo/9Mjmlc7lFqhuPah/gUpEzumAIzLYkKU5y7Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745510866; c=relaxed/simple;
	bh=t1yw/3IQY04ascExMYNkywVMbYb9sD04RFjXDUub5p0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJrfQfZnpEsCOVmzdeTMu3THxTU/Rn2arawoSnvct/o7lw8z6GTugME97O9HCX8h+G4n8QaKTHKQXFKg7CSZBizsU3kpafwa0F4p073YAetigndNlp83FsCwqcZr1N/SnxPPxsfH67g4o1WVLf0iQrRhyVSZ6EyBEGPeW1N5ov4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kgFmSeCm; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kgFmSeCm"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224171d6826so19208595ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745510865; x=1746115665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJu9k3uxYD0x67A2WlM7JrSR4XKb1B7H+/wMYgcPKG4=;
        b=kgFmSeCmj77PlfxuwEKWnaZNRxDUzuYEKsgYjGDDrQwBd0YKLADe6Riu+wepmYmQzl
         jw9TQwyZ4PywvFyQU7ARZ5iM0rYd6EXU3ANiRveTK1FEg9XmxmzcAS4DW/P6G/9bPifK
         qTsi7hZByrO+hzQbQLbETQnBuHu/3t2fBP8RX3puXro7H4mWFxqPidyAEKVknnaHfdsW
         y2gNhVuUgKXqFwWLkoNdT+qFy8ftD9kWoAUc9D2TJhYBomVaeBvkwk6Wd746HZ8KIU3p
         k7HawLY8fl274y1c+IWLGWSXh56/+jcVZDfsUkPlKyZFjFKDVhE4RLwdD7+9DjanfFkK
         POxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745510865; x=1746115665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJu9k3uxYD0x67A2WlM7JrSR4XKb1B7H+/wMYgcPKG4=;
        b=iJ2sAOWz66nMvkuBvsFmCW7r9e5saxbjalODMdCn3j6yGt52QhwwoadxpxO8baDH+0
         hk0xjVuy9iZ5NKOa/b44WwdGBGV4PMt8fdLjk1gCZmJy/vgDXAHURXoYRUcE2+3GWm5z
         KSuyfb9+qEfJpJZtmOG4PLSgwWlYiSrziQzoY2qM7zUJOTra4uXaLuwrpD4hwgMuOR8c
         JBiJckChyO23FrkLKbFpglXcuxTamrU5LwgfCH0BwZW/jQi6cZaLj1TjJPDRZgYB8mF+
         CeufYRs8aoRrX5cCdI/kk05Svdm/Am3T6BzUHb9uv0Ue0x9pFxGvXKHaVYS7zWEFsLDB
         fbGw==
X-Forwarded-Encrypted: i=1; AJvYcCWbZJ7DN/0VBqzg4kWHOYS3y3xOHvn7wTzixtbfQX5HlRzdkf3YQMiYlY39PUPTv1C7lqhBtvSU4EuqbX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrqUXg04m76iwqoWYmCSdS0MtkPHGCdzFi6Y6k2RiYRw2++wiq
	2KOiMOznrfswlgXpQB+iqRMkgBKvHDWGXm9w64MJYz/fb96r0rCJCRh1+wPz7w==
X-Gm-Gg: ASbGncvYtMBSJu8Ueu8pv7sevqNfa8d/+c9ylXy1/A8/aiSoz8UrYFUcggdB3VeP/6Z
	ptiTwlUQjrODY233FN7WMZu71A2szMtSBdN58jTFVrgxviruRu+Nn1m3qKZRJmOdCBcaD5Xex45
	A/WsCuqLV34bv7I8AeqdYd0WdHtCkPgOjgsQ8YoXRL7+Fj0quBTviwLN17R7XBKwAYIepb9wtLg
	/ft1XKMsisgTadIymfGps2B5ZL/XQgAlGEAhtMUN7jlRB4ves1Nt6VMWolWhtr0BgN/B958jfdz
	VL8IutT0KCRRqPlQ+Mu1mebavU+P/qwHXRCE1nN1IaeYeY7YuM7mREU=
X-Google-Smtp-Source: AGHT+IF+cEnqtVqlvNmtgTBPOgGaQFGH2iL8KVeET2542DBGluS4OFgyWPgBX3nQcjgRsk8niFLIJA==
X-Received: by 2002:a17:902:e742:b0:223:f928:4553 with SMTP id d9443c01a7336-22dbd478a8dmr446915ad.44.1745510864595;
        Thu, 24 Apr 2025 09:07:44 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221656sm15262275ad.252.2025.04.24.09.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:07:44 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 24 Apr 2025 21:37:19 +0530
Subject: [PATCH v3 4/4] PCI: qcom-ep: Mask PTM_UPDATING interrupt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-pcie-ptm-v3-4-c929ebd2821c@linaro.org>
References: <20250424-pcie-ptm-v3-0-c929ebd2821c@linaro.org>
In-Reply-To: <20250424-pcie-ptm-v3-0-c929ebd2821c@linaro.org>
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
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoCmG/edV1s5zz7dUXotOLnVSoJ9f/l51DOl3bM
 CHdo33fe6eJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaAphvwAKCRBVnxHm/pHO
 9QhXB/9KUDzr7Mex0zOAHucAJbxPOHMb886ePHgYIhd/So41Wf78Zzi0EOcvoPVe3FHikLzMWZG
 b8G76iKhkbFK0LHcOQFVWtQE/3blacVpV7/mNNoOwwVm+MaFxqE5S3dy3pHENBL4Kpvs2Rj8Z85
 rz3zTQX88e89h1dQGLXnp0C42qOVC3aHeC0YwZFJ0ktiFF0kfzoSar2gm9ShTdj0SohZWQxkrjC
 Y9Yw+VKhtSJRvtsMQTt0ph4pdeExmYq8ThjLYx6r9SeuuZMideNEup+clZ53bWBpbinqZv0HvDu
 pP3226Y5UReU1SB6zqCv42FKelMwz34UaMmmmjY8NZ3x4Wxo
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

