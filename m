Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1012421CC64
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 07:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746688240; cv=none; b=RIZC484mHk4n7lGwyZFKN4E3Y8c08b9H870bGU5hm/ysUc7N7XcJuTb0Nd1aglCwsMki4VhqxsQRlIx21BfNyAOgnjT56vFOfqX4Etu+nNvOWPPUrcvYCO7iKSJjac5pOqxnuF6/Jw9iAnGL4CMoUtjlLoKxzX6EWIjqF9h75X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746688240; c=relaxed/simple;
	bh=Aq+BoDTRwjfmiHKRLtODTEbwNFS8yDdFMEIJ4A/Pkz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wim33uNkgxEnXOQmhIN86xLbPhh9QRNnT9h/+G2LQJe5tjJciST+6LwPoKAe/7bk0MZYxRCywvbkJnFYXLzkOmXkvoAqS3bHxTcJKOWuSbPgxdtIDI1Q7MPcm+2HWRUG7k3UUhGU7plFVF2OVTFWUCrESSRI5hVrixspU/darJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PqyVD8QR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PqyVD8QR"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so5734465e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 00:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746688236; x=1747293036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNdUV80pt9dTQBN0xsYhQhCQV2pGwrGMIFKsn4D5UWo=;
        b=PqyVD8QREBiMqctqAfCiJh+9kTLyraCDuRzdJpTikutPhuoITo221B0JbN1KjRTyft
         VMUgg8MsyXFxONe9uQKfx34qpJ+kNAXgupnUE25QhsXZoZQM0PRA2/CuTRhqdgBD6REM
         t32cRbPy3BAHI2fx2p6THm2NM7xx7wmN8vOjua2MpvvnfzbxAGttdlsIgKltIw7XCY9Q
         p/qMWVCYfES+S2IHsSiWt3gSU+PijHviU2dc3oZHgV6GrRZKG/WCuRyU12X9K/wmMKRc
         Ls9wfWITKwX61EZB10khBzcQJ3lU52QO5E9YzkxI4twe+6U3aTOSRGrKHAiLX3e6RKgz
         V+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688236; x=1747293036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNdUV80pt9dTQBN0xsYhQhCQV2pGwrGMIFKsn4D5UWo=;
        b=bV+IAlHte/WO2Kyzvg1t1lLIF++xDgimAl7+U0A9Pi91uIGL6V8sUgzu+iXgoraumW
         EaGnYysa01F9FSOcsAYrN2xPnbnKy78d9Cnnk24lOP8YdA+Cse3QE+Taga1Vre/Qc/1a
         C4VOsuBcqNc6KjPmM+RzuyNGPDAdA1eEV5lk2W8cRr3STbPC+koglu8eQFNAgNKvoSUm
         07zxdZU3n2GbbsThtL29H1y/gKOKKnpn+ViewIWtghqj83hfGjW06Yxu6O0infsAAbKh
         yM7jF+NzOLl0Vy4zFPO7PFBNgkM/HJzUxj+hhVULglcuJthg7N2+xfKr4NSVEm34SBK+
         0eCA==
X-Forwarded-Encrypted: i=1; AJvYcCVZHF7NDUcCHfuxrhQqvJ0TbBg2gmwaMeWwLFNzZ/ZegMM+0IZJfV1yOatI8RRd4sv6kbJBkc/8TgSu76Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm1Vr49tPuKoy6EHWtCtfEP6jXboWT99McROZk2lOYduaU3kGV
	v6dthYjZud3LfPjyOYjW8yKARrOTip3PddzbBY2aR0Xz46MFu3+jq+1zWag7fg==
X-Gm-Gg: ASbGncsoJXIjFceoMvk9wgpn1xrCex/PxFLuKTlNNuRFktplBgu3YtklG9lYayLOZlF
	QT5d+BxEC6WfyonRb9rSb7qjP6UUUaw2kCXaHfqbiCltZLxYogDcLfovWp8GKHVsGpbavA5kqGf
	H4b1YyEVoVvbTQQHqWfL4hDNsrMMe/UnChZwaPUyyV/zsXTBYmrRLdwsHhR5pc2UtBIDGNhA1NV
	2KY5OHvjlDctZ7C+r1T5Ho12O4EqM9nq8OuYfiKxepq/x/dinnM9RVSEfptUytC/bwnIkx/eHEY
	w0Be3gWOv6cgZ0RNrxTpEcMzjX7vTeyAIDIXnBpJElTC7SQ8cH7Sff6s4r/BoQ/Pn0aIfCGbuss
	LdHbCU6REif8hxJZ1L18ktic1FVY=
X-Google-Smtp-Source: AGHT+IGM/ocJYvn2QOjf3fD6bkcOlBGcdKqEyGGwPgr1OkqArjdUzcdfSklA7LLxbWYmBJNriXe76Q==
X-Received: by 2002:a05:600c:37cd:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-442d034bcbamr21959325e9.31.1746688236376;
        Thu, 08 May 2025 00:10:36 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm19500236f8f.97.2025.05.08.00.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:10:35 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 08 May 2025 12:40:30 +0530
Subject: [PATCH v4 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
In-Reply-To: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
 Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=789;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Aq+BoDTRwjfmiHKRLtODTEbwNFS8yDdFMEIJ4A/Pkz4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoHFjp3+Y0C7nYToqJfWiLXSkKAM5YKgVxrQcgv
 dew07ahS2+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBxY6QAKCRBVnxHm/pHO
 9bheB/9ACtGdPZ3LmfihI48+MK1ALP0+Bx6+UetxxXKaahBYzIQ5gDCkxVfgOgnxWWQewlNuhzp
 LkZw3nCIYvdYAZ7/RT6FkDdBk4lRXh8t4QhrVlil8KmoN8umYdxyDDZutpu8RDRf9b5H84xabGV
 tt9QfWQz9sKtIRWtac2DBCJCM4vwuvtSDxEUlUvJkdec5PwCN8ffMmJBN3NQ+vSvJtmkY8CKX8o
 ZT1VVrEU3tuPcd3IaetbkOs7WBG2+W8B9TJkzU8p+4MnsQUmp41iy5Y6yO6mf3fDQ643DyRvmm+
 9X9+lTcKXgUsmH6hLBn6yhdJdN2ABj8XC+7vLejHvCUqYl4/
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

A PCI device is just another peripheral in a system. So failure to
recover it, must not result in a kernel panic. So remove the TODO which
is quite misleading.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/pcie/err.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 31090770fffcc94e15ba6e89f649c6f84bfdf0d5..de6381c690f5c21f00021cdc7bde8d93a5c7db52 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -271,7 +271,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 
 	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);
 
-	/* TODO: Should kernel panic here? */
 	pci_info(bridge, "device recovery failed\n");
 
 	return status;

-- 
2.43.0

