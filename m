Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A9433FD
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 07:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746688239; cv=none; b=uSMr9zUE6hs+myw9dQ3XLDF0Vj8UCff3wKq7XKWmiV3JKu6hTQSb5Pk0lgc4Zu/UadFAferh7uJ/ETW6qMciwzdiHxDzyCQiWZMky1aL24LFmYspk8rwVO6qKAw3QHjxt5BJwVCNugBh3oieUOYuSfv7dVjqDVOQChmMwJCF3Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746688239; c=relaxed/simple;
	bh=LPKZpjoorPcJ0i3sy5Fe9gxmCowL7rHoa3+8Kx1k5I8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tNHKHzA65h6D5HfEtUIxxvELFjJ1h2hkSZDghKx8dI6Fr40tUPfvTK0YhIvqJKMZ2/oDly8Kvk8C32+DfWg3OyTpqwH0KhmJk2jwRvYdL49OgKbG1lOfWbaAoNrEn1VvqjNkZcCjBlg218P5GIxdNsPGfWUmkxXRhnwvdHI6M4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kkJgEV0p; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kkJgEV0p"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf848528aso5079775e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 00:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746688235; x=1747293035; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w00OFq+nWohxSjTOLQvg8WLpoA5EQgRX6xuwn6BkYyQ=;
        b=kkJgEV0pR0ihy4xUsTYDA9ZXyy6Cp9DC0LfGODNFESVfmCcQueo37RGWYZdnk/uYuD
         zL1W/bNtw/bjFBhMl/EvUjBCd6IR7Wri4tWKAoS7ZGi2R4iuAXRTSqWEe9U99Etg2Gi3
         9T7NjO8i2TduGM/NsreOpPPzyMc5bMuV5qqO0xQpCi8+dU4qHQ5LC/CuMTFZhFx2Pj9U
         JWcuV1H/6x7XGHJgbRuEDVejPEXFh/WmKdWQX2ycNuizwol9qpA26/1Pe3Gj1gr089sX
         hY+BuvCPJ+VaHsJP5VpWVh2PZZfsi8p6SOf0E2bnq0UOE9kRRQa5NmXOPaGxvn6FD/4a
         OQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688235; x=1747293035;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w00OFq+nWohxSjTOLQvg8WLpoA5EQgRX6xuwn6BkYyQ=;
        b=jhLEiysxidTeTZ1cdLRabkoSODf26haMws4pmZmZei0Zj4EN3KoNgofuHR8g4Wnca6
         PTHKZq8o3SZM27AYbzjMAUKcacT+oscmrUghs5FCEOyKq6X2pgjb3jwK9XKegbtaEaPO
         lAO6IAUVXP78YZSCBhxDzoZ629jCgKI0WdIwZ084K+jcg2Hdw50pKm5rh1B5P9nZr4rD
         tQhM+dRpGMqjHKNNBKOqgK3m3KcjpUWzIL98qSPbbnWf2pTi6YHlOcyP+lnoMtUlcb4C
         XQidyiE6BUvtmM9inETifai96rpVp5j2qKwc+rUNa1w1OP5gd1sX5b80aAXUzZLnS8NG
         Dv3w==
X-Forwarded-Encrypted: i=1; AJvYcCUUwoa/2eexljRL1pAgISxOL2ce9uh5QnocDZAbHtmMrKnRy+s4xsp29bzYQl5xe6JaVSYcxlLOsd+noKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKRGZbkT/quh9JyZLRhtLwQiy+eoCbDyIsi0why4hXPJi5sTJ0
	kL12V6/BzduE6ESD7UwQiUN3LfxOOxsZPAsUmBvznS6J6rKMOtLgESG7XiidMQ==
X-Gm-Gg: ASbGncvejlnTXmN7r/LFqQwt5+u985UZxF9R3WCGsD71VwEwqQ8XttypvY1hEsBJL8z
	06ft9wdgb/g/jlxl+eGNb1O+FU+lhpm8EFp8CwKh4Ze783qhU908yMjyAUz9+v+qN1aR9T+f1bA
	4rqQJJBtcHWPb48FESfE6DEajMXR/yQqDkS1r7ey09TZfPlGEs9+ayYpI0ChVRlr3NrbzkggLbd
	HfO7HdMtMXPls5u8RMDz72d0eqpRQtuKG8CgMnKYbQnBEGdwlEJ3gQ8NTCqk536VLNYppGNprkF
	KI5xCV0ggfXAzyoiObbweb7Z+vWt008JCTD6wg47KMk1X9ZjMYnPsK/CxbH+SXdOBLzUD5PQUDJ
	tXxVI3DRb4ijT0hD+orQITAiZIuc=
X-Google-Smtp-Source: AGHT+IGyLqEV7FV8nWWqYY5qCj+3cSwPattjz/CT/mpsRNB9xus7yRn9kwCjspweE93CFzg64EvzTw==
X-Received: by 2002:a05:600c:8205:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-441d44c7c7bmr63780445e9.17.1746688235432;
        Thu, 08 May 2025 00:10:35 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm19500236f8f.97.2025.05.08.00.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:10:34 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 0/5] PCI: Add support for resetting the slots in a
 platform specific way
Date: Thu, 08 May 2025 12:40:29 +0530
Message-Id: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOZYHGgC/3XNSw6DIBCA4asY1qVh8AF01Xs0XSAdlMSIAUPaG
 O9edGVjuvwnM98sJGJwGMmtWEjA5KLzY47qUhDT67FD6l65CWe8ZhWr6GQc0oARZxoHP1NRstZ
 qATpvkHw1BbTuvYuPZ+7exdmHz/4gwTb9byWgjCqpaq5Atlax++BGHfzVh45sWOIHAJozwDOAF
 kXTciENnIHyCIgzUGagVhqYBDCq4T/Auq5fm/p35DEBAAA=
X-Change-ID: 20250404-pcie-reset-slot-730bfa71a202
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4736;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=LPKZpjoorPcJ0i3sy5Fe9gxmCowL7rHoa3+8Kx1k5I8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoHFjoZn2Vau5rBgSkqFonGWIjBD9vXqMQSpvxQ
 iz76V7WG0mJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBxY6AAKCRBVnxHm/pHO
 9baVCACcMZ+oGHyyvjtszQkQwoCc4LQEhNyBVCLMAukrkzlHUKuJuUgMLxOaizVKaBzVqZ+ImAm
 KFJDCmiXyQNskAOrCdFyEWeHP2rLBoNzxWKTODzgJ8uppEcksqBFWh1rEl5psqx7nS58ivJfwBF
 0IR7EBandYxRPofAprBmAyD/3pvvYcpIxlTilooBHNn2VzXduU0KYkSDDK5b4wJXryWat2+Mt8n
 BCAblJUCeBFK49eRl8FOHziOW4nIj4aSgX4clBB2igJ2YPjOa8wv2Ubvw1u6kDAMRQ1cSqP3A4B
 ktlGEOIB0nYlE+VSnH51tHJvblCq9bTJqJpTyBKZObEDWDGZ
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Hi,

Currently, in the event of AER/DPC, PCI core will try to reset the slot and its
subordinate devices by invoking bridge control reset and FLR. But in some
cases like AER Fatal error, it might be necessary to reset the slots using the
PCI host bridge drivers in a platform specific way (as indicated by the TODO in
the pcie_do_recovery() function in drivers/pci/pcie/err.c). Otherwise, the PCI
link won't be recovered successfully.

So this series adds a new callback 'pci_host_bridge::reset_slot' for the host
bridge drivers to reset the slot when a fatal error happens.

Also, this series allows the host bridge drivers to handle PCI link down event
by resetting the slots and recovering the bus. This is accomplished by the
help of a new API 'pci_host_handle_link_down()'. Host bridge drivers are
expected to call this API (preferrably from a threaded IRQ handler) when a link
down event is detected. The API will reuse the pcie_do_recovery() function to
recover the link if AER support is enabled, otherwise it will directly call the
reset_slot() callback of the host bridge driver (if exists).

For reference, I've modified the pcie-qcom driver to call
pci_host_handle_link_down() after receiving LINK_DOWN global_irq event and
populated the 'pci_host_bridge::reset_slot()' callback to reset the controller
(there by slots). Since the Qcom PCIe controllers support only a single root
port (slot) per controller instance, reset_slot() callback is going to be
invoked only once. For multi root port controllers, this callback is supposed to
identify the slots using the supplied 'pci_dev' pointer and reset them.

NOTE
====

This series is a reworked version of the earlier series [1] that I submitted for
handling PCI link down event. In this series, I've made use of the AER helpers
to recover the link as it allows notifying the device drivers and also
allows saving/restoring the config space.

Testing
=======

This series is tested on Qcom RB5 and SA8775p Ride boards by triggering the link
down event manually by writing to LTSSM register. For the error recovery to
succeed (if AER is enabled), all the drivers in the bridge hierarchy should have
the 'err_handlers' populated. Otherwise, the link recovery will fail.

[1] https://lore.kernel.org/linux-pci/20250221172309.120009-1-manivannan.sadhasivam@linaro.org

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Changes in v4:
- Handled link down first in the irq handler
- Updated ICC & OPP bandwidth after link up in reset_slot() callback
- Link to v3: https://lore.kernel.org/r/20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org

Changes in v3:
- Made the pci-host-common driver as a common library for host controller
  drivers
- Moved the reset slot code to pci-host-common library
- Link to v2: https://lore.kernel.org/r/20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org

Changes in v2:
- Moved calling reset_slot() callback from pcie_do_recovery() to pcibios_reset_secondary_bus()
- Link to v1: https://lore.kernel.org/r/20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org

---
Manivannan Sadhasivam (5):
      PCI/ERR: Remove misleading TODO regarding kernel panic
      PCI/ERR: Add support for resetting the slots in a platform specific way
      PCI: host-common: Make the driver as a common library for host controller drivers
      PCI: host-common: Add link down handling for host bridges
      PCI: qcom: Add support for resetting the slot due to link down event

 drivers/pci/controller/Kconfig                    |   8 +-
 drivers/pci/controller/dwc/Kconfig                |   1 +
 drivers/pci/controller/dwc/pcie-hisi.c            |   1 +
 drivers/pci/controller/dwc/pcie-qcom.c            | 112 ++++++++++++++++++++--
 drivers/pci/controller/pci-host-common.c          |  64 ++++++++++++-
 drivers/pci/controller/pci-host-common.h          |  17 ++++
 drivers/pci/controller/pci-host-generic.c         |   2 +
 drivers/pci/controller/pci-thunder-ecam.c         |   2 +
 drivers/pci/controller/pci-thunder-pem.c          |   1 +
 drivers/pci/controller/pcie-apple.c               |   2 +
 drivers/pci/controller/plda/pcie-microchip-host.c |   1 +
 drivers/pci/pci.c                                 |  13 +++
 drivers/pci/pcie/err.c                            |   7 +-
 include/linux/pci-ecam.h                          |   6 --
 include/linux/pci.h                               |   1 +
 15 files changed, 212 insertions(+), 26 deletions(-)
---
base-commit: 08733088b566b58283f0f12fb73f5db6a9a9de30
change-id: 20250404-pcie-reset-slot-730bfa71a202

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

