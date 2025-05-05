Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C2825A646
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455092; cv=none; b=U5zyYadOTErfjl/89SgeZxzH3ur9/ftgW8AZjedRoiXdAkpHKHZ/ql3b2fHd2AGx2bc172Yy87F7ZKKDg4OWCgWogTAVlJIIULalIImhtHY0NVmlpUqMhMc7zdC2PZpsydlXVbhIfuGacpFdAHP/6hGVs6DB0dkIYM6gIFUWErU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455092; c=relaxed/simple;
	bh=xt8wTl7f/wywoxHl8MRfq+ZGmNxRNYEOFuCUDSuwLic=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HTwSbQyvnNJ96IqLUM99/oCw+5fBV6pkiJZM+1yt+lwrdrSgJGXX1pcB0ep479uReKzRWQjW+1zHzIL53EIt6qxJLL+h2UG04Wj/5MqHo4S4J4HTOCtjmT91ju4BBL+mRzm7p5R/y0vheuMvT9iXQhCH72VX+q5xTnbCXfnPdwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dKpu4uHv; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dKpu4uHv"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30820167b47so4159324a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 07:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746455090; x=1747059890; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ckZi0UvIHQqdmNSpnk+GIMPTtp6lAso+Q4qx4Ve2kag=;
        b=dKpu4uHvS3nVpBJV11TOQfpKDno9gVsaHVMU6E1zfYDJkypRcrPPefSTfzplA2DkTn
         SkTf56X8htxuAg/ukXOWdmw2k9vNsJ2PaHsI+zKaq3A6ZB1iVHMwfIGcbUZisa8Wufec
         X8+SSqaPlPTUv0uHTFcQlbRMNt/31K3lXaTa6FhLMUt9fOiuejD0HSj+52UfYTfn70ep
         6s/jxmVUb0HWS8yKBH4aTP9YyOZEqISFiRdMKjjJBZYriKiB0DNVjTQLp7WBdFa4TL37
         lxuu0xJajVlzgW0/kuLAmn+O/luaQX6NoHWfNiCdi+GLTLuOnMzG63O8lQadfDNB+sSZ
         us5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455090; x=1747059890;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckZi0UvIHQqdmNSpnk+GIMPTtp6lAso+Q4qx4Ve2kag=;
        b=a7Z/l5MrgKUVHZAUFj9/eaFvIoBWDAye9Ba8Urznes0UZDJHH/HihFGSyzXQyEHjlh
         NDfXPmxHyZ8LRd5xBvN8gXigCrNsS0XOqIyB2zyOGXlI4Tjw8jNpY0stJtpUltYJSVFs
         Sq7KzWTP3CS6FAo8efFNXvDpu21ShDw9dggiFE0L0Pr1G6k3jRwS46r1XG0gDra8smzk
         uPSApfXA5PJStsROhMjHH4FPcy+9yJemWfPc8vxZKkI1UxJYVsNeUi6ZCgGWmpEgU7tg
         De4k+G9fyAIoHFZwWSCYi3A/VkUK6YkhHY6bMVNi2aflWT8hPmy85znwlOfqOCF1LzS9
         w4Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXZUmviZKvN0BUU/CfnZdk6Qfy1tQFY+GVx+/2je2FWs6bCivpV8e/pu8XzT5RhT9y7MfmIhpaOJSD6axQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhqC4wX21XijFxn98i6y17Cih4n6xygbWUOGLrE+fwTrX3LjDa
	U/oS3MBgXYvuwS6BMOIljetxiXqSdq9wLcy3M0T8DFNYthJaSKWzTBmlnQsdVg==
X-Gm-Gg: ASbGnctk8DBZdqffJasaRsRQaGYMtNfqdkI3ZhvvtpE2dKiXrx77NBkr5eOhU5fJiNQ
	LVYZpRfl1w8Nf1QGjlvCXX6WK8y2qU279E+6f8p4B0qnpjyLR+HaKJnbl+VZsw09lp6UerP/IPf
	KkO9er7rEwFv0M66el0CYY2aO8RMS26xsYS9RSkXCarYEBrbmQNMa0yoRKD3UnXWh3zhni81MxL
	SGqxqrImsAAan0TOEy3K9Iy6s5FhlavVwfNhBq2QuHfOfuf4X71OSGpMdAOD1Uulo9iGNfFymf2
	ikRhWx0lfp/jT+2eLaUGaowe3Hm+IZ+E8mgd+5ycWrewvFD8AXZBbIA=
X-Google-Smtp-Source: AGHT+IHmtJOA/Mih95X48YJhJskbDqtDEyBEjblBYNNdinJLrWabyyXWhhEiuwx6ZMRQ8FBgASDl4Q==
X-Received: by 2002:a17:90b:498c:b0:309:f46e:a67c with SMTP id 98e67ed59e1d1-30a4e228371mr21130087a91.11.1746455090375;
        Mon, 05 May 2025 07:24:50 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.48.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522ef9bsm55387685ad.217.2025.05.05.07.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:24:49 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 0/4] PCI: Add PTM debugfs support
Date: Mon, 05 May 2025 19:54:38 +0530
Message-Id: <20250505-pcie-ptm-v4-0-02d26d51400b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACbKGGgC/22Myw6CMBBFf4XM2hqcFnms/A/jgpYpTKKUtKTRE
 P7dwsaQuDw395wFAnmmAE22gKfIgd2YQJ0yMEM79iS4SwyYY5FLVGIyTGKaX4LKQtcarTVWQ7p
 Pniy/99T9kXjgMDv/2csRt/VPJKLIhSm7ysirUlq1tyePrXdn53vYKlH+THUw5WbWWJPusMKLO
 Zjrun4Bq14U/9sAAAA=
X-Change-ID: 20250324-pcie-ptm-e75b9b2ffcfb
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3960;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=xt8wTl7f/wywoxHl8MRfq+ZGmNxRNYEOFuCUDSuwLic=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoGMouComxCctxITkxCPVc+0xvFvpnyyuvGa4hs
 XZffzaHlwiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBjKLgAKCRBVnxHm/pHO
 9bh4B/0XHNltihdf1htdE2fqWZY9OLFD7zMg2fWNd9QTdnwojDNoUCgHWRtNPmM4N9nhQQTdT+I
 SfTjX+BstESHj+BLe4FEy2BwtMpR6OPBTsfRRfhLg7LT2UHoYbhue1RzStZFI1fcjITx9GsBLbY
 eq1MpWs8L73cGa7SoGx4uig6gJjgh7uODMcrKSRz1K63Jg5v7DP7xDAsKEGVqb/xC0Jc2NVpNbI
 pO0FDjQmoTtkcfHEt47TzIvxCSxXTWmo9xRWIs1i7PA8F8sgKKxRvBQFLM+7zx5cx4BpYu7d9CB
 yYKbRwlMb5whIpll3Hb3lLqLFSNLxNMNltk4D/EL8nttrAEO
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Hi,

This series adds debugfs support to expose the PTM context available in the
capable PCIe controllers. Support for enabling PTM in the requester/responder is
already available in drivers/pci/pcie.c and this series expands that file to
add debugfs support for the PTM context info.

The controller drivers are expected to call pcie_ptm_create_debugfs() with
'pcie_ptm_ops' callbacks populated to create the debugfs entries and call
pcie_ptm_destroy_debugfs() to destroy them.

Patch 1 adds the necessary code in the drivers/pci/pcie.c to expose PTM
context over debugfs and patch 2 adds PTM support in the DWC drivers (host and
endpoint). Finally, patch 3 masks the PTM_UPDATING interrupt in the pcie-qcom-ep
driver to avoid processing the interrupt for each PTM context update.

Testing
=======

This series is tested on Qcom SA8775p Ride Mx platform where one SA8775p acts as
RC and another as EP with following instructions:

RC
--

$ echo 1 > /sys/kernel/debug/pcie_ptm_1c10000.pcie/context_valid

EP
--

$ echo auto > /sys/kernel/debug/pcie_ptm_1c10000.pcie-ep/context_update

$ cat /sys/kernel/debug/pcie_ptm_1c10000.pcie-ep/local_clock
159612570424

$ cat /sys/kernel/debug/pcie_ptm_1c10000.pcie-ep/master_clock
159609466232

$ cat /sys/kernel/debug/pcie_ptm_1c10000.pcie-ep/t1
159609466112

$ cat /sys/kernel/debug/pcie_ptm_1c10000.pcie-ep/t4
159609466518

NOTE: To make use of the PTM feature, the host PCIe client driver has to call
'pci_enable_ptm()' API during probe. This series was tested with enabling PTM in
the MHI host driver with a local change (which will be upstreamed later).
Technically, PTM could also be enabled in the pci_endpoint_test driver, but I
didn't add the change as I'm not sure we'd want to add random PCIe features in
the test driver without corresponding code in pci-epf-test driver.

Changes in v4:
- Fixed the build warning in patch 1/4
- Moved the dwc_pcie_ptm_vsec_ids defintion to pcie_designware.c to avoid
  -Wunused-const-variable warning. It also makes sense to keep it in the driver
  for now since there are no more users.
- Link to v3: https://lore.kernel.org/r/20250424-pcie-ptm-v3-0-c929ebd2821c@linaro.org

Changes in v3:
- Switched to debugfs interface based on comments from Bjorn
- Added locking for context read/writes
- Rebased on top of v6.15-rc1
- Link to v2: https://lore.kernel.org/r/20250324-pcie-ptm-v2-0-c7d8c3644b4a@linaro.org

Changes in v2:

* Dropped the VSEC changes that got merged
* Moved the PTM sysfs code from drivers/pci/controller/dwc to
  drivers/pci/pcie/ptm.c to make it generic so that other controller drivers could
  also benefit from it.
* Rebased on top of pci/controller/dwc

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (4):
      PCI: Add debugfs support for exposing PTM context
      PCI: dwc: Pass DWC PCIe mode to dwc_pcie_debugfs_init()
      PCI: dwc: Add debugfs support for PTM context
      PCI: qcom-ep: Mask PTM_UPDATING interrupt

 Documentation/ABI/testing/debugfs-pcie-ptm         |  70 +++++
 MAINTAINERS                                        |   1 +
 .../pci/controller/dwc/pcie-designware-debugfs.c   | 252 ++++++++++++++++-
 drivers/pci/controller/dwc/pcie-designware-ep.c    |   2 +-
 drivers/pci/controller/dwc/pcie-designware-host.c  |   2 +-
 drivers/pci/controller/dwc/pcie-designware.c       |  14 +
 drivers/pci/controller/dwc/pcie-designware.h       |  24 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c          |   8 +
 drivers/pci/pcie/ptm.c                             | 300 +++++++++++++++++++++
 include/linux/pci.h                                |  45 ++++
 10 files changed, 713 insertions(+), 5 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250324-pcie-ptm-e75b9b2ffcfb

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

