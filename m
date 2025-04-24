Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0162F20C000
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483668; cv=none; b=XzpgW1VnnAOaaC5E4xdXsjZsEj7wVJo4l60joRd4M0q6rOdLj5S4fC49EUWiQdmr0KASvrYR+/undgesA6V18NJEA5Igx3L3lP8nqDSPx/fYoBHf/a8LK7pvw4fTWICtSiyho2g+Ozte+dmx8K6q6wWfVXsIcskUHTH2ERLebNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483668; c=relaxed/simple;
	bh=fyPcyt5tsx33zLc81Kw1P3Mee50TZQ013vRkVqNuYWA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jSlVoj6M3vhPJbio5BrlTnx2pCYPpI7CYgm4Re6Oe36uUd9ME+GCQh2JYXXmbCOe/jWYC7sCmHMZKDJ6HslmDYw6HxbBjxrW6h2MVDzIuRFDYyHa9Y3Q6iV2hOV7fDLFdmxGmv9mSRmbl7DrLaSJPKODa6izICYNYZ40w8O77so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MwUz5Bct; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MwUz5Bct"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so762342f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745483663; x=1746088463; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C8tGWCdB1F+2LTmhAkX22ynJIxbqoFIVMbky72nwvho=;
        b=MwUz5Bcto61iEc5gk4my/d23vFnpF/Bhz6yCxDi6DYTcST47XqaXDI2jSKGTjWPhhp
         XlH8MZpqXI/r/58QrCVe21iF+4os5j+eWAgJXl+8yAG/VLhjFo3nCdy2TBaA+m7e8EJA
         TRQJ3A7ShbudV4FiIP854YF08OK+g0+6Ne5OI4vFeLmsFpN8P/ifAa1iuLYp7LL1iQTE
         9xXmvzmFYiwaEOY68Mw3RKgmzaDvVAik2fDG4SwRTLiB6pN/G3RDp7dRK+KKpgkPYV+g
         ytuFddGgVv8HDQSWvb/5pZ35H2vrUi9sUqdPDFxudXDMd8PDvbHM9XILJJNZGbTY9ZPG
         6b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483663; x=1746088463;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8tGWCdB1F+2LTmhAkX22ynJIxbqoFIVMbky72nwvho=;
        b=URyxOwBWn4+rypUF5bImcRukElZQt9NMGmLnVJrRRj4MvZnUEa1ZdVvaNjAXDQdaRA
         vYoMJWyAnBawrb+merIZwl5UYyMi4iB1sk/KtfWGckVojMmPE9Y9pzyPyZVar3xfaQWl
         kxre5XSGaRRohHkL84oZRrFABwR4piv+27XYu8UKBlizL1wFwQFLd0LNp0xmop78O6gS
         8bnRXrVoQh8ojJOnvBLlGDtqQ5nKE1NjuuL1Ir/KJVBz5KBfQ6xOByVRe/w9d15yKlm6
         D7rGTnzT7DvTlNTw6mK5YeBdi5RrMzb0gBH3ojEbabVgucwy/6JE7bU09utC3E8r2P19
         RZOw==
X-Forwarded-Encrypted: i=1; AJvYcCX3LOdxCD9JAW5BRXKChSSJ5TBGFwzsIKgwnCSTW40Trj4Zxpuung5zXoc6OThDHJ0/j0mfIxrF8E4t0xo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyah5gHuAigk6teXGpbBwuqOb/ULZslezuhpdw++DyLJgDPfL4D
	9chxSMZGi5fPZ327+N/veoObPnJ99LUQ2frizSx6FOCvTvfrgnK9GCTMylb0UQs=
X-Gm-Gg: ASbGncvjJRWW49vNEfrwAX+7TDF7f09r5kFVrUcLljSmHozqTZaeR/ixAI8PHAOZ4m+
	RXD/I8S9RpfSBO2+uwSuCkEKv8lYCg1r4EmFs4GsH0ZwEvnbD9LAHva+hjuHnkYxHgyqtaKQpYQ
	ayc3dsF16a1msW3/kfcQFaVc0ZhNx5IWYI91EbLZKzoKfGw1lRrK0gDmiY67F8BGqBWBPktlc/K
	NwSOda6GIdNej8ACAy44qRW+FFIm84AbLrXVWwmWGECuQRy2M/w73DW8bwVJ6/U06Tq+Nq+/3JR
	V5FAz29FjiuMgk0CHKEY3zgDhErlUwvWBqiS67c1IdNrk5ZP3o60PA==
X-Google-Smtp-Source: AGHT+IFVQQq6l1DulQrKW6deJu7Kbn7RZmVVR447idMPpE+uOzGwM7yCKCZrv8fEuvw9xqkYlMZ8QA==
X-Received: by 2002:a5d:5f87:0:b0:391:3f4f:a17f with SMTP id ffacd0b85a97d-3a06cfa3157mr1117016f8f.42.1745483663218;
        Thu, 24 Apr 2025 01:34:23 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:f74:6a9a:365b:4453])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a06d4c6c56sm1323881f8f.60.2025.04.24.01.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:34:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v5 0/2] PCI: endpoint: space allocation fixups
Date: Thu, 24 Apr 2025 10:34:03 +0200
Message-Id: <20250424-pci-ep-size-alignment-v5-0-2d4ec2af23f5@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHv3CWgC/4XNTQrCMBCG4atI1kbSJNNOXXkPcZGkUx3QtiRS/
 KF3N7pRxOLy/WCeuYtEkSmJ9eIuIo2cuO9ywHIhwsF1e5Lc5BZaaVBGoxwCSxpk4htJd+R9d6L
 uLOsGwWv0qECJfDtEavnycre73AdO5z5eX2/G4rn+E8dCKkkEvkJfgKvdxrvrkX2kVehP4omO+
 g1ZZecgnaFgnGq8DW2A6gdkPqFqDjIZwhKwQioxBPwB2Q9I6znIZqj0DaC1piWqv6Bpmh57SL2
 9mAEAAA==
X-Change-ID: 20250328-pci-ep-size-alignment-9d85b28b8050
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Jon Mason <jdmason@kudzu.us>, 
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ntb@lists.linux.dev, 
 linux-nvme@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Niklas Cassel <cassel@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2285; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=fyPcyt5tsx33zLc81Kw1P3Mee50TZQ013vRkVqNuYWA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoCfeLltdBGrihKLgdra13UYvpXsgJ+UUry4H7F
 Hc94NUoWA+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaAn3iwAKCRDm/A8cN/La
 hfXLD/91NjpsftPFNZcFoUD/luoLQAcGz3A2OFoThdNs3G2BGT3FZhX/f2aXzeLQjeaxdBngIdi
 2GmeLpbiNqTW8mQtRAIxJdIZNzDS7igdAXLbIz+bJON8TIZ4FjZmBkrzfPzWONU/MNnRy1uMgZD
 Vs0X0Q7yXaXq/u6PY3+b3Xh3JW9FyPr2SNevGbok3WHdty4dY0HAneF6qfaXp+91puUgQgwHa9Z
 f//y8K5tghzW6O4EEEecu+Baf1odyBbPBOK9YlAsshznXqRwm+I1TTGoO5Fyfg9solmmtONAItW
 1D3jiJlEQFdv06qPSWKFR23skq89u9HM6Df4oCc39QNVOA67l47Lzu7nDcaUfRjafa/VjGa4RkP
 mmm5bSFBwRgMKdRyt7FZa4PuQ0jc7EOXEJrrAXPLCbUth21t2A9QRGPkcb1uCwPeI36zikqFEMX
 zL10wNPQPlE9wxhNMzQw8QOBUVejrkSH2OkH3yVIkuB9aDtdOZ3/Vfl4c/4X8wSrE6h7MBhD9Xt
 4RMptgpbYbZJ2s1r85CBzIjDWwKJHwAtkByOEN91LJWTmom+Jy/cYrDX0R8N1H8i0P7twDDxy4S
 4gjxf2M8EvX/SDppQ8oC99pU6gv8vgzELc+rmoxja7Ht3OKxjT80Cf0eKdCP1Q6fplqbIBqgzs8
 bovfcXTnwJwwypA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patchset fixes problems while trying to allocate space for PCI
endpoint function.

The problems, and related fixups, have been found while trying to link two
renesas rcar-gen4 r8a779f0-spider devices with the vNTB endpoint
function. This platform has 2 configurable BAR0 and BAR2, with an alignment
of 1MB, and fairly small fixed BAR4 of 256B.

This was tested with
 * BAR0 (1MB):  CTRL+SPAD
 * BAR2 (1MB):  MW0
 * BAR4 (256B): Doorbell

This setup is currently not supported by the vNTB EP driver and requires a
small hack. I'm working on that too.

Changes in v5:
- Collect Reviewed-by trailer
- Fix nit full stop comment
- Link to v4: https://lore.kernel.org/r/20250422-pci-ep-size-alignment-v4-0-6bd58443fee9@baylibre.com

Changes in v4:
- Drop patch 1 of v3 and add new .aligned_size in struct pci_epf_bar
  instead re-computing the aligned size on the path freeing the memory
- Link to v3: https://lore.kernel.org/r/20250407-pci-ep-size-alignment-v3-0-865878e68cc8@baylibre.com

Changes in v3:
- Rebased on v6.15-rc1
- Fix build issue with newly introduced nvme endpoint function
- Link to v2: https://lore.kernel.org/r/20250404-pci-ep-size-alignment-v2-0-c3a0db4cfc57@baylibre.com

Changes in v2:
- Allocate space that match the iATU alignment requirement, as previously
  done.
- Chose not to add a new member in struct pci_epf_bar, as initially
  discussed. After reworking the code, that did not seem necessary.
- Make sure SPAD registers are 4 bytes aligned in the vNTB endpoint function
- Link to v1: https://lore.kernel.org/r/20250328-pci-ep-size-alignment-v1-0-ee5b78b15a9a@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      PCI: endpoint: improve fixed_size bar handling when allocating space
      PCI: endpoint: pci-epf-vntb: simplify ctrl/spad space allocation

 drivers/pci/endpoint/functions/pci-epf-vntb.c | 26 +++-----------------------
 drivers/pci/endpoint/pci-epf-core.c           | 21 ++++++++++++++-------
 include/linux/pci-epf.h                       |  3 +++
 3 files changed, 20 insertions(+), 30 deletions(-)
---
base-commit: 92713f0ea620bbe923eb4e7bda408e5c79597cd4
change-id: 20250328-pci-ep-size-alignment-9d85b28b8050

Best regards,
-- 
Jerome

