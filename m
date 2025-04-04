Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942E718FC92
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743788798; cv=none; b=CEiM7K/uqwDuEMY/C8dr7wr5jIToiXgf9641WxmYhiRt2hdQ7TYFHXAeHmyipbfuof8k9fkKvPZbRDJalwHWkrmMidUMyLJcvyhRNaihndv9MLraXDXU+H/mllqRmRIp7s0SEhWK3WeIPPrRnF44KfodofZCDyiz8VY5/wlZkTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743788798; c=relaxed/simple;
	bh=HnIKeuPS9ScxVqrmLvwEy/zskUnDiOArxioE4fgpNKo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RoLKiUFP7Tf1dIMX5GoHkn6FVqUPYyRHTxDSSVG/tFPe1nnvp/6LJYZ9Vh71Znzj0Os20f/zG0YhsytP2YJ47kDuWhf+1SUanA85AIAbh0TxTxDpbW/1Vz1HCI8dJfVcJPH0imX5zr9gSeI9MpXy8+bEQOR6PyFwtSkOj5RB9dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gedPMeAg; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gedPMeAg"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f2f391864so1302365f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 10:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743788793; x=1744393593; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X9P/EfEIlZAESjSXhp9OseFFolhRdBBkLN0jHHdJSb0=;
        b=gedPMeAgzPCWkbh4Jdtfzo6StXD3PwDypEuMjE22jHifxtoSWJbDAQvNFAziZG15kp
         LJziDhJoG520ChaWY9+8YTHSx9CgupivOEordaXH+CvZc1e4li5nKL/wWLMDTPh9YUm8
         Orley/VH/pp599KHv7WNt4qLJYoGy9ZOwNcQtypzKrBHl1enxPJazJCmzmNRK9uCspG8
         Eb7SIpQQ9qugIBqoz24SRqLjxUn2JeJufUtEuhrroHlRz7cgirutrddRslYotb2TWoli
         8M3aXf9ERSHCEHF6sMGUTqS889Prab4dxEIjG/wgZ7CAMFA5wAULOcCPIbZHV342RQbP
         3BMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743788793; x=1744393593;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9P/EfEIlZAESjSXhp9OseFFolhRdBBkLN0jHHdJSb0=;
        b=AI3X2cV8f4xNiSRAuqJQVnmRBlnhBGgWVSNWMTwEdSaH6e8vKljqQ/JQTc9STx/xTm
         D2/6HkwYutRSFxGDD6V8lMzInXQbyMMPxX71scRO+qD9qe4EUQgHmFbH+7cqJ1lXs8IP
         Hyo2mkM6+RA+SvSTWi9Z4hupXMZx5ZYnvWl+EOXMHq3VW+dyJqSba7JxAyK6FnmnXn7s
         J4PxvcLVpkfO+WGzf/+kCqw3x7vOb74GPiEvxqFNdvb00dTledTmhHry6MlRzHcEKBNd
         yTY3AJj6epofJNUiYReE5Kd3RwJ7SPz4PewSVtiKNgva8i40W/WRvCY93sBmqCaPpzvv
         dH4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuNVok8T9NCU7YTqA2Mnbj9MxoZYteJO5z9YWfShc8VKrXyeQuT6ssphJ1MyLh/GgkNWNXLd0T4M/MKJA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc9HzKvH3n6tpKA8b08cwbCdaDZhVScukv0lOMmDwMDfjAD10l
	fE0o9+6L2PTihEqCTaFsqOz2tPxEAUnTKXv02cwQQWUOAELXTGkJ9YidNM85oxg=
X-Gm-Gg: ASbGncuNt87/0wPiUmE8egBhH/Mvt4lapGoRWzQZ64fOn1HxyU5PF98FvUc/Z+bX49s
	ffVof4zaY9HS7Z0hfuc97DgxjHEorHWEja2d6SQDD5vEyU3dsBC1yGxA5PEf9MGEyn3lxeynciG
	v3HTkmhiKqJ8dFG0bIXXPS3z8C+bFLWyGgP2GoWLs7nARuwkieFr0PuuO57QcH7AW5muXr9tV/f
	6ZtyY/1ge/UFuwE+lXyl84vBWu7N8YiQqy0cnAcSrwROTUFtluDk1qF3dRVIY8qALe/9L0r6Utc
	KWuyhUQFVgzWjV4lJj3nDLycr7XFNC/JVPgcOH0eai/MCnzk9+HQ/1TIVQ==
X-Google-Smtp-Source: AGHT+IGswdimuWy71mElHnsix4QxjHQgPPPL6pnV5SEEI7VP4vSW+eIfVbl+qVp3zMV1Qro4ys96Qg==
X-Received: by 2002:a05:6000:4304:b0:39c:12ce:1052 with SMTP id ffacd0b85a97d-39d07bcd00dmr3359518f8f.7.1743788792654;
        Fri, 04 Apr 2025 10:46:32 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:331:144d:74c3:a7a4])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c30226dfesm4939535f8f.97.2025.04.04.10.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 10:46:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/3] PCI: endpoint: space allocation fixups
Date: Fri, 04 Apr 2025 19:46:19 +0200
Message-Id: <20250404-pci-ep-size-alignment-v2-0-c3a0db4cfc57@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOsa8GcC/4WNQQqDMBBFryKz7pSYEhq76j3ERaJTHdAkJBJqx
 bs39QJdvgf//R0SRaYEj2qHSJkTe1dAXiroJ+NGQh4KgxRSiZvUGHpGCpj4Q2hmHt1CbsVm0Mp
 KbbVQAso2RHrx++y2XeGJ0+rjdt7k+mf/FXONAomUvWtbK9OYpzXbzDbStfcLdMdxfAEsqBEIv
 QAAAA==
X-Change-ID: 20250328-pci-ep-size-alignment-9d85b28b8050
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Jon Mason <jdmason@kudzu.us>, 
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ntb@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=HnIKeuPS9ScxVqrmLvwEy/zskUnDiOArxioE4fgpNKo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBn8Br0GcS36RFMmRwE/Qtn26ZHmwW0s83GBeg7y
 773n9yVaTGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ/Aa9AAKCRDm/A8cN/La
 hfvAEACA0VtF3NMnYIFrqEUkjvSb46Wkq2f7q2zeUzwCnDEAkjmm5h6qGhYVIehmnD1/clPJrU3
 5ijoeFmk2YGiozkRlrVfP9CIHbnbt2J0XDnpImDVPRsXmM0+lE8BLGYx4F/zR3ClRfMykKjThy5
 MpwKJP1Pql+X4z1okaSp5kxHPiWz0EYdSEwaG7hXvlY1fUeUD2H0WmR7E8q/zHygnBVBAV2VnUs
 c/NL+8wGvxfMmYI9CbK+Y8sTBvoZP73yt7ZyygSAS+Xef6pm4kEXCd5rh36aZKcKauJoK9uRNe/
 blZiSOqCYREwN9a8w4lImfVuvMwZWeW3bYeABAjrLHjgJPRykGlEAoh3MxNW33SrITwPbjd5BiY
 6r8ieK3B5GnXTCWljHKymVLFYis89YjSOYf7HIvLO3L0HQIiXbMgh8tpHh7EIDavIvuCb/lQ4nf
 AmGKNIeNmvkk67kIXxodz5CVYBoMIi+SXuZfHbnHvltLoxFVybDM6y940lUzp/tegXVQpm21uBn
 +T4Nl1XsOW8+84QljYj6HUatBhxoZ11FX9pninfWRWDKmDU3XMr1OxWUH3d85boNMcipoKtb8fA
 qMe+9GF5j5FLgjbr0jwZleVpuQkpNRoQs46Bdu4MloDosRGiWIFfXe82VzfcgvGkInT88Zsbb3X
 crvrJtyRCZ0TwyA==
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

Changes in v2:
- Allocate space that match the iATU alignment requirement, as previously
  done.
- Chose not to add a new member in struct pci_epf_bar, as initially
  discussed. After reworking the code, that did not seem necessary.
- Make sure SPAD registers are 4 bytes aligned in the vNTB endpoint function
- Link to v1: https://lore.kernel.org/r/20250328-pci-ep-size-alignment-v1-0-ee5b78b15a9a@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (3):
      PCI: endpoint: add epc_feature argument for pci_epf_free_space()
      PCI: endpoint: improve fixed_size bar handling when allocating space
      PCI: endpoint: pci-epf-vntb: simplify ctrl/spad space allocation

 drivers/pci/endpoint/functions/pci-epf-ntb.c  |  3 +-
 drivers/pci/endpoint/functions/pci-epf-test.c |  2 ++
 drivers/pci/endpoint/functions/pci-epf-vntb.c | 42 ++++++++++-----------------
 drivers/pci/endpoint/pci-epf-core.c           | 27 ++++++++++++-----
 include/linux/pci-epf.h                       |  1 +
 5 files changed, 40 insertions(+), 35 deletions(-)
---
base-commit: dea140198b846f7432d78566b7b0b83979c72c2b
change-id: 20250328-pci-ep-size-alignment-9d85b28b8050

Best regards,
-- 
Jerome

