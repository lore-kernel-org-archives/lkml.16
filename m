Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6167514F9E7
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 23:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738797405; cv=none; b=HcFr/Z9dWtD2ShStY/DdCjYq7QGNH+8valGkyjOuRa9cz61I77qzyXu1sKVR5wb+f+EENRszmRUEC7ZflcQM9EO+71Z5BFyAy5yScu/59+UdcB6+E7vain7zhevNX3jTBbQcG4lvhCJN+PYRrG6q7KVypVrX4YaIFLqaR9IeWGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738797405; c=relaxed/simple;
	bh=pr2rmo5su3X65MMD2mF5XWj3uUgPZwN921xr/FoCywM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WXZl25jWBA/w5XJWf9VXNfC3ftXcS5Q9WbnyxMfP0ydMvMMLw+MPrtPoLnl5umNX/8JzfzwL43C+385Sft0UckzYtOb9TQBTjHv/tGzpVzVXfoRfjTOF5Ma6BRmpFL9lokYEE3MIprdP35P7BSgGgFeUlQhfT0RXP7IC8ciGbVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QJxXR04T; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QJxXR04T"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-219f8263ae0so7391815ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 15:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738797403; x=1739402203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aE+HA9kZh2AKZEXcXSOD19hUwawybG1vuk42DzAnKiY=;
        b=QJxXR04TFJYi0GvjW8/8zwqpqT35B7LRtgWVbaA+Ru720N9WeCbtmpLi31Uboyfyj+
         atZW1HFxBxfh3u7vBi2qhmK7hNH1xmkUp8f/ex3Wz7UwVm/Jkr7fMbRzOmeRgZBuyhw2
         zZn72T0stL/ZSbElyLr2yV48U2nQBzSPOs4GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738797403; x=1739402203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aE+HA9kZh2AKZEXcXSOD19hUwawybG1vuk42DzAnKiY=;
        b=VvNQKRCE3bhRKTjuGSkYw3Bg0jP/aUS9aKzyyfMSlXuU0EhGDcOU+TPBlhfwnDR8Zm
         01K0ELwPpOcxKyhzUunhmRpFUDe8akQ4vaP8SgG0me88b9FrJ5TwBr/tYjdzPWtMeU/Y
         c6w2q+PKklvCi1ZRjViryuhSUXuwDItGT2PVzwwEMsNZvGGBQsoesA01oGC5t5Qy0uQN
         h8JQeipEPziXY1g+M8oPatPEKo+GIsVxQ8tJYETuATLiNckRo6n1QrYeLXere9KWuxno
         MBzWQ+AHiysLQb49emwlgtTgUXDDAelK2h96+RMcBwn52piJg3/RSBcGDdXbPxQl/hCk
         cHwA==
X-Forwarded-Encrypted: i=1; AJvYcCXRhlOBBc3ONuAe0B3YiP+CtIrke8ErdL0dI0AuJfXZjKLsFCuWWMvjudxnIN205FeIM9koAWT+fZJ0kV0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7eo4WgFIsyYnGRKZRttekfash/eR5pXaxS/+/bzavWlWd9yE3
	P80Hd04tdr0PW7n86ztdHPZYryAPwDOou3EdtbcFTpxGBXZw5cfx5TH6vzqPBg==
X-Gm-Gg: ASbGncvSoBdMIK51fIksGD+XjVEzVurSIY8eIJ6ObzaX069X2F8uL1icnP81wbMWw3s
	m9ZWOZmc0VmxTyoeEOjbTATyBRLoHGRfxq/rU5hnxUnRhYLQSdEQDwIGkhmHbYF7iBgtja8Ux+l
	Lu1He+gPR4rj+6G7P+3650mzylbOpjn2rrsWor37/jv56xVv+7T2rv0lgr08R/ChFCyJksOUtgh
	k1vAFtl0V27mSh4w/FswxMJxcplnQr2knQMCVWITLO3WzS5IQQr2xvtHT1gOcnmK9BYunVzfqkp
	u2wdZAgg/it3tvZ0pWwgtJAgmHs/WoiOGhpmAJP/8m7WaTwojmLV4A==
X-Google-Smtp-Source: AGHT+IEw7h8D9k0wcxPyuWNUO+tvdgxr2MN/FkdTIUl3fEX1J/ZSsGOCVHq8CAKWHRN2MfkAw7xUvA==
X-Received: by 2002:a05:6a21:9011:b0:1e1:ffec:b1bf with SMTP id adf61e73a8af0-1ede88af9d6mr7790295637.26.1738797403657;
        Wed, 05 Feb 2025 15:16:43 -0800 (PST)
Received: from localhost ([2a00:79e0:2e14:7:2382:2804:f923:2c2f])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73048ad2612sm5812b3a.44.2025.02.05.15.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 15:16:43 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-pci@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Brian Norris <briannorris@google.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2] PCI: dwc: Use level-triggered handler for MSI IRQs
Date: Wed,  5 Feb 2025 15:16:36 -0800
Message-ID: <20250205151635.v2.1.Id60295bee6aacf44aa3664e702012cb4710529c3@changeid>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Brian Norris <briannorris@google.com>

Per Synopsis's documentation [1], the msi_ctrl_int signal is
level-triggered, not edge-triggered.

The use of handle_edge_trigger() was chosen in commit 7c5925afbc58
("PCI: dwc: Move MSI IRQs allocation to IRQ domains hierarchical API"),
which actually dropped preexisting use of handle_level_trigger().
Looking at the patch history, this change was only made by request:

  Subject: Re: [PATCH v6 1/9] PCI: dwc: Add IRQ chained API support
  https://lore.kernel.org/all/04d3d5b6-9199-218d-476f-c77d04b8d2e7@arm.com/

  "Are you sure about this "handle_level_irq"? MSIs are definitely edge
   triggered, not level."

However, while the underlying MSI protocol is edge-triggered in a sense,
the DesignWare IP is actually level-triggered.

So, let's switch back to level-triggered.

In many cases, the distinction doesn't really matter here, because this
signal is hidden behind another (chained) top-level IRQ which can be
masked on its own. But it's still wise to manipulate this interrupt line
according to its actual specification -- specifically, to mask it while
we handle it.

[1] From:

  DesignWare Cores PCI Express RP Controller Reference Manual
  Version 6.00a, June 2022
  Section 2.89 MSI Interface Signals

msi_ctrl_int is described as:

  "Asserted when an MSI interrupt is pending. De-asserted when there is
  no MSI interrupt pending.
  ...
  Active State: High (level)"

It also points at the databook for more info. One relevant excerpt from
the databook:

  DesignWare Cores PCI Express Controller Databook
  Version 6.00a, June 2022
  Section 3.9.2.3 iMSI-RX: Integrated MSI Receiver [AXI Bridge]

  "When any status bit remains set, then msi_ctrl_int remains asserted.
  The interrupt status register provides a status bit for up to 32
  interrupt vectors per Endpoint. When the decoded interrupt vector is
  enabled but is masked, then the controller sets the corresponding bit
  in interrupt status register but the it [sic] does not assert the
  top-level controller output msi_ctrl_int.

Signed-off-by: Brian Norris <briannorris@google.com>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * add documentation references

 drivers/pci/controller/dwc/pcie-designware-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ffaded8f2df7..89a1207754d3 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -198,7 +198,7 @@ static int dw_pcie_irq_domain_alloc(struct irq_domain *domain,
 	for (i = 0; i < nr_irqs; i++)
 		irq_domain_set_info(domain, virq + i, bit + i,
 				    pp->msi_irq_chip,
-				    pp, handle_edge_irq,
+				    pp, handle_level_irq,
 				    NULL, NULL);
 
 	return 0;
-- 
2.48.1.362.g079036d154-goog

