Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1674128CF45
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745333678; cv=none; b=GpQhlI3gnLec8pGBzB2nJNY2zsfQvo+AqabpkRjZoN+BzVI3T9OHlmI09sK1lFRvx+yTh+NqdMmyD17XQF2Pq9OVhg1v/b9I2LZalm8Zp78xK4fSVrpFDc2/S8SG9/E8U3TzK4gmm4Xjvp1CB0t/QtwckJgIUXmQQSjLZ9aPBlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745333678; c=relaxed/simple;
	bh=5jwVtzCgD4uNjqyYTuvqwhiQR8nTsDDM1aNFemeBRzg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NiGoCB6B6lkJR+luglOup+dnzxnkBlkiqB2asU0wNm960KLei1xk5nfCdRQ4y4yo6Ox/Zmgil7943QJbjiEZxTAcX2ZXMu1hnb0ecNUauWaGpzmGtfufvdRFQkY9V8izjfEUncqkMvLmgugj29jhZIpqr8BnPHSLe5xUxIaohbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JVKCvhEZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JVKCvhEZ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso3768288f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745333674; x=1745938474; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gG9ubyGdNF+k3tFycmy59fjgpr52bVfS4Acl0aGZAog=;
        b=JVKCvhEZSiMXjdtYmsX4QZchmIVsCwQ2KKceuACtt1B/c08nGs8hiSYqf74pxAusb+
         G5E4ZX9mXS5DQgp164GFLAtLjaODOqJZ1r3lGRijuMwKHdv8wcp+SPR01uBdhfGUjrK/
         Vg/cGn9EjQIfIDCLu260IwcS131EonK2Mo/o02k9eHnOQXj+4poUiRqlU3DknE2Jwxlo
         hz4n8fqd5cnrcSbC6Nb96voo0qZrhGsjbc/HMgbcFRVwhy8DuaUhR+rOFxG02b3deo5s
         Zb++UttApGmpTPu5Qc9xAaJaQDX18p0VQjoElU2d5CcOduNbawYbxb9WwOUIzaVFldW8
         E57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745333674; x=1745938474;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gG9ubyGdNF+k3tFycmy59fjgpr52bVfS4Acl0aGZAog=;
        b=cLmkkZn/a9Bm3LYfsV9jaZsSI4YKxxEERPvS0ef5MY5My/nrd88zqwbRCArbAU7WIR
         rQDmLQji5xOr9mqFoBfOQKgKysf4tIqHaNtueMWWrJspQp7b0S7E1zUBqlmA7S7s96GG
         Sl15GGn1tRjrb4EMpisENDQzwekNpl5eb9fR9+bLsxD78PB31uVgvDkw8CJebSLwTbK/
         2YUwbBZN/QpgE/XfmWUNwlQc6aVckCTn37py6TOMqAEnF5YmspAt8/wuiXUXO3vTmj2V
         MI7ek79PMzNyWq1u6ian5t8i25FS2L+WmLBqsTPH7QrNKBefieraFCQPtgRZ4qh6iVk1
         pxJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5cv8sMVRO2acXjpyBlRQJIqHvdLBZTjlxTBTEJRQTLOEF9nq4FLrtuT7/K6ez8g5sVuAMoqYj4IV6LU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YynLE/b/IcC33Hje4vSlJm8dQd1EHUN7YMmKrrb+a6iGdYqGKZI
	5Cgp97oi+rOcmE20W6yZ6W2bOY+sFE+ft9lMDNAswzb1ikvshl6IcRo/nz0sck4=
X-Gm-Gg: ASbGncsCyQfHCbjnC9UJ3TMvl4Z1Ry5kjPtKys//I0aB4WrXMKFPbP0estMiOt+BT03
	uleACxgVo/TPZ70cUnvnn1UnAs8v9wkwtjDQRWjMhqKyfaPqs9pnV5qj8enFfieNguIRIrF2Bsa
	fbx/yzP/pdEYN6eX00aTbR0OEU9B4h6EPbErceK8vPCgUXwPZokWqrYqTJzrTeomOwYx3gWSa5i
	k1vmPfOjetOPbeL52+iFLpfdPKj5kAzgAbq3x1N2rmvYM3M2fm99ZMo7ELRBPwAL3LOjjIMhdJ9
	HnGZAjfn0jK8PzNbRgp4Nq/nRSPpGmYA7ENr5ZKXdxFu2EotrxNEk3PyfS3/269wLQ==
X-Google-Smtp-Source: AGHT+IFiry1aEcsv4RSjsJlDXhIh520EjsJLXwPy2Ze0MY+e/aA2sn5B9Azs+BhIspTbKr+bPv5+Ag==
X-Received: by 2002:a05:6000:2281:b0:390:ea34:7d83 with SMTP id ffacd0b85a97d-39efba6dcb8mr14706176f8f.31.1745333674270;
        Tue, 22 Apr 2025 07:54:34 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5f77:7d42:6228:3358])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9de9sm177304635e9.6.2025.04.22.07.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:54:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v4 0/2] PCI: endpoint: space allocation fixups
Date: Tue, 22 Apr 2025 16:54:18 +0200
Message-Id: <20250422-pci-ep-size-alignment-v4-0-6bd58443fee9@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJqtB2gC/4XNTQ6CMBCG4auYrq0phcLgynsYF20ZYRL+0pJGN
 NzdwkZjNC7fL5lnHsyjI/TsuHswh4E8DX2MbL9jttF9jZyq2EwKqUQqgY+WOI7c0x25bqnuO+w
 nXlagjAQDQgkWb0eHV7pt7vkSuyE/DW7e3oRkXf+JIeGCIypTgEmULvXJ6Lkl4/Bgh46taJAvK
 BPZL0hGyKZaVCazV6uKL1D6DhW/oDRCkCsoAHOwFj6gZVmey+3KfU8BAAA=
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
 linux-nvme@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2104; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5jwVtzCgD4uNjqyYTuvqwhiQR8nTsDDM1aNFemeBRzg=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoB62msl/2CkXYLO9zyFLv1uQ0Yj/jKbC/61ZS3
 7z19ghgj7yJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaAetpgAKCRDm/A8cN/La
 heIoEACzFnt6rpj7masrbEMu1F8A9oCj4q9PQWn5yJSbzp9ySmczV8yUCf4bW5FDI4pMN2BRRQT
 BeyfH72Up79X20K+hWqCaX4m/eE7C2F0elheS5MNiShHsS7TzDzP6sytfMyYnv308uOB03JaCh0
 6jNw0ETb3brLlGAlNwV15cGhGZLtzTEClDHPwOj3OtoVXlmEaRJR//5vMR+SeP5xwJSo57Eoiwk
 bfdIQ7QXz47zR8wFC46oc/EvnSW5YYy/LvHsfffRIuavC/e/6gJOlgV+npmzDI3xrcJ6lMx1rh1
 T+WwfNdlSBy09hhpCQLMOmUfAL20Tyes2v64SbkSc3TST3ybbhzH6tO2N/3kuOtfmuAow/GQAOJ
 28eJUpx/tt0IQ/XXfs63Qd3lJH3fqLjhENN4FHVX94LhcAlcv1vbH07SbLXAQi9NyBONqr5vXVy
 Z8ebnH5+QLPfmU57CWaYEWIXnzZue1kWCiTZuQMJZ3iwc9qo2Qfhdtt7NkEpqCWWYZT0dfbImwj
 Y3vNxPzyRXEuLNxWx2oofbHn/B8bC8pi/7voKoqR3Wm/eqNhGxIEl5+1OXiVVVeacKw2HLsxeye
 xvMZ8a/IypQ20/VrSTxJhgvxmZkAzOYU4v+MpidhrkAksGFJVLjDsCa9CsTLb/NUlM5deHvYRJm
 67VQCvd59/k2aqw==
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

