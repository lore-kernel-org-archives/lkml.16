Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2D41F8BA4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744036771; cv=none; b=OaAkZh4dRbSSMcx+QI/70L/P8Lsw3lnZasB0zzWIsSn9eIpYS6a3O4He3nx15SKG/GGtDOc7alY3dqp37K5loPNUdM04KM7VwCRSjUyieXOJXUT31G7+/sv/6pCkwoiEoweaaFuTISUm37oKkLZj/q1uIC0TY4V3nExKNgFPIJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744036771; c=relaxed/simple;
	bh=ogQNcCu8YxT+9o47hJnNjydZZvfGLWbCXP72er2tm7Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RT6IRgbeGV2GAn9Ije2zDKBqKf3D0ai+iH0CQCt73CmBuLG0/jlUMV/dSxwxELVL6GdTemP4lcGWkmW1v+fY8Tn0hmDqyCbsUdnA7nv63+NQ2WL465xRmUOaAHo95JED1DxJ+3RIgUWlztyTBljDi3bUq+5bsgIggh6LBmLla+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OaFlMYk8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OaFlMYk8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so26080975e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744036766; x=1744641566; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zDhUBb7n4i/zjscinLcxbX9vyxcNyXV4VmsLqe1lsoo=;
        b=OaFlMYk8KPe5yYZE5Vei3knDGnnOzp2hkNh7UtVLOAocqMnBL9/N9A1evwioaGQmwC
         vR6SWyIfxvD1WhevXJbZpqSRVBI7RkTpahy58NaxN5YUNmMdhmV76W0sLz2wr+76cQLs
         L8E/O8UZrqTBHKyQwSPpQUQEa79be02WprnMMxMdhWazpLQqPFzZPCJohq+5DhQKvrcg
         F8Bqwv0S6/OEjiGQnzvGqgtNtwlWbvurGBtXBzscummvEJWPD7CJGfleEg2mzpXlYlEn
         wGuhYFz+0xHoL887mQVvWBNuPzBa+S2HfoIKnKzTvb49pjoN2ak9powakhjlstZDLb6y
         dAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744036766; x=1744641566;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDhUBb7n4i/zjscinLcxbX9vyxcNyXV4VmsLqe1lsoo=;
        b=VMmcJ9aeG4gp7SrlmsIZ16FXd6M/FYCOlqszCHyzLguub0+Ls/OVBhHdTsAJuMvt4N
         6V4voPQLydGPg4NEqnGyz8cUBwfCATrcEgHq6YfaDd8myy8HPv1R4RaLysSEI6aB1G1U
         bMgJGbS94I/75bRQlWMKzR1y0fYKZnSriAjAI4Vk7LSXaBZSYCwoY7+O0CJNOWebZlnb
         KXZhzvPwycAUVQuvDZktuUiiSQ27Yt+/vbNsC/JxTSnyy9Mw/k9H5XNBjmmyBPfQVoJb
         fjT0imsAxuWulFtT7KtyFFGV5H5yds69ApRl/FTephs9Tiy0F6WQ5/ZieQjsoW7ZffjZ
         1PyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEJmA9c1IvUQvCuE2pkybU6l8/K9O2cWYbWJZOwseyA3xnWLEoL+ksWk2A9XkEiCdvgm2L98pmRburi/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgVv7s92OqDmpXt9yEMHRp6nnGWgcMmnqpnoaFJmltItUDLj72
	poxZrxMZc40v+fESvwqo+pjZgOfuC3cPxGGPUZIPWGMGgDEMTztyVA2r12ZwCLU=
X-Gm-Gg: ASbGncsNW0ba6ltZ7Q86pWmvlg5OHkqYbwM+V7eLl9GRGhVYEBrYY8H/XEu/1M3Y5ds
	rYHsfWSlye5qXppdCCBS26PGuky+SSq2LtUhBdMjoVr/PGLoNavtLabuP7rwxJEpMGzc6Jq6SPa
	89WxTKSww4UBJWrT+shPEl/ucmDcJVPSqOGN3JPUMY+7KICO9iA9cM2HfDIZo6DblqYi3RDU6Ae
	qHPwUhrNcYrbaDWAZh5Ctb6sKIGWs72h6KNtkBooHIXPeQ5+TXKXTL6VlKQzSzk/tm3x1ZEoxBM
	9AzEdMxeEubwScbDjUqFQwNx/w3Hn+SDVtCsjPLw7ZEXWDk6AGkGuBHJS/E=
X-Google-Smtp-Source: AGHT+IGo0Uhr29cvTsRS3LxyOzKKN2ODb8nALSSx+D+EwmUMgG7tIeki4Sbg0p2SXiRhZCiImjf7MA==
X-Received: by 2002:a05:600c:524f:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-43ee06ab14amr77347205e9.19.1744036766119;
        Mon, 07 Apr 2025 07:39:26 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:1122:cb29:d776:d906])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec16602bbsm135003705e9.9.2025.04.07.07.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:39:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 0/3] PCI: endpoint: space allocation fixups
Date: Mon, 07 Apr 2025 16:39:06 +0200
Message-Id: <20250407-pci-ep-size-alignment-v3-0-865878e68cc8@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIrj82cC/4XNQQqDMBCF4atI1p0So6Gxq96jdJHEUQc0SiKhV
 rx7o5tCoXT5P5hvVhbQEwZ2zVbmMVKg0aUoThmznXYtAtWpmeBC8kIomCwBThDohaB7at2Aboa
 qVtIIZRSXnKXbyWNDz8O9P1J3FObRL8ebmO/rPzHmwAFRmosyudSVvhm99GQ8nu04sB2N4gOVv
 PwFiQTZQvPalLax8vIFbdv2BrNE4pkGAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ogQNcCu8YxT+9o47hJnNjydZZvfGLWbCXP72er2tm7Y=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBn8+OZHbkA5zUijOC1Lyem6hVLcbAobdwSqz5Ry
 4vtiY/xbzCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ/PjmQAKCRDm/A8cN/La
 hYLrD/90dg5PKRwz8YLHDCaM7Vq3WVq4SIxJCfhO1ZtER7+uHYYRkbooqqZ+UrW017Or3od1xQa
 yCkeURyi1REiYqr6TxlMlG1lfST2grvdD3Xvy25bCN7ooV7ljuZTb9PpWlFDdSh/zTcapGA3HyH
 nrhBlsnoRlTzVbgsaUXnOCPJkBma1OXjxPKPvccqxKcUYUPrQEExKlTlG6RU4otW3/xiS+kwXyI
 EpsA2FckSNHcLvDREnS3NayTyn5lGsbC4KyCRnekHn1HK30MZnarf7+sQX1foxD7K0LqA1ASRhs
 xy2vzOae7BRGOvnFScpZtpDiYEcCVcSQBuhDIXimPFLxvN18UBq1w7tfw4WNd3lzkrcsukUta42
 fHma6it0bX1PnIX32+TcPMZIK8WuHATrIjqFBfsQJxSTZBxxWTEIQROzgMhbJCe0PYfaBzWSpCJ
 DxsWvvx97spixLpnSFgbO24aFXZKcd0AzQ8ZpYPLK2kicpC/8sDO6MzwAmSu9TLENZI50DQROtH
 IA4ZS94r/7tr6hOoikclE+ISSP2JK5029ZltBiMh9FdJlcGtEobu/7VZG4wYaKTASXFSXKE8qj6
 T/Z7baToAeb5lWbVXYyyjf2tCLLabejWhGSGmsIh8jtWmG6wt7QkR2H/4F79ewvO122I/MbBuBx
 /pBoV7hfw/sCr3Q==
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
Jerome Brunet (3):
      PCI: endpoint: add epc_feature argument for pci_epf_free_space()
      PCI: endpoint: improve fixed_size bar handling when allocating space
      PCI: endpoint: pci-epf-vntb: simplify ctrl/spad space allocation

 drivers/nvme/target/pci-epf.c                 |  3 +-
 drivers/pci/endpoint/functions/pci-epf-ntb.c  |  3 +-
 drivers/pci/endpoint/functions/pci-epf-test.c |  2 ++
 drivers/pci/endpoint/functions/pci-epf-vntb.c | 42 ++++++++++-----------------
 drivers/pci/endpoint/pci-epf-core.c           | 27 ++++++++++++-----
 include/linux/pci-epf.h                       |  1 +
 6 files changed, 42 insertions(+), 36 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250328-pci-ep-size-alignment-9d85b28b8050

Best regards,
-- 
Jerome

